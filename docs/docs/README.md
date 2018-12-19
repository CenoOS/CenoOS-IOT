# Introduction
![CenoOS](https://raw.githubusercontent.com/CenoOS/Ceno-RTOS/master/docs/assets/twitter_header_photo_1.png)
CenoOS is a real time operating system for IOT devices from cenocloud.

# Docuemnt

## Architecture Overview
![Architecture](https://raw.githubusercontent.com/CenoOS/Ceno-RTOS/master/docs/assets/arch2.png)
 
## Prepare

### 开发版
在根目录/conf/makefile.conf中修改如下配置:
```makefile
# 开发板支持
ARCH=arm32
BOARD=ek-TM4C123gxl
MCU=TM4C123GH6PM
LINK_FILE=link.ld
OCD_CFG_FILE=ek-tm4c123gxl.cfg
```
!> 其中选项对应board下支持的开发版

### 配置OPENOCD

```makefile
OPENOCD_SCRIPT_DIR=/usr/local/share/openocd/scripts/board
```

### 配置项目

```makefile
BASE_DIR=/Users/neroyang/project/Ceno-RTOS

```

### 构建

#### OPENOCD启动

```bash
cd user
make openOCD_connect
```

#### 构建

```bash
make clean
make build
```

#### 烧写

```bash
make flash
```

### 写在最后
!> 多喝热水,早睡早起.

## Drivers+BSP

## HAL

## Kernel
### Common
#### 基础定义
```c
typedef	unsigned int os_task_id_t;
typedef	unsigned int os_time_t;

typedef	enum os_err{
	OS_ERR 		=1,
	OS_ERR_NONE =0
}os_err_t;

typedef void* cpu_stk_t;
typedef unsigned int cpu_stk_size_t;
typedef char cpu_char_t;

typedef unsigned int priority_t;


typedef unsigned int queue_size_t;


typedef unsigned int sem_count_t;

typedef unsigned int tick_t;
```
#### 对象
对象类型
```c
typedef enum obj_type{
	OS_OBJ_TYPE_NONE = 0,
	OS_OBJ_SEM_TYPE,
	OS_OBJ_MUTEX_TYPE,
	OS_OBJ_QUEUE_TYPE,
	OS_OBJ_BUFFER_TYPE,
}obj_type_t;
```

对象定义
```c
typedef struct os_obj{
	const cpu_char_t* name;
	obj_type_t objType;
}os_obj_t;
```
对象容器
```c
typedef struct os_obj_list{
	os_list_t tashHead;
	os_list_t mutexHead;
	
	#ifdef __CENO_RTOS_CONFIG_SEM_ON__
		os_list_t semHead;
	#endif

	#ifdef __CENO_RTOS_CONFIG_QUEUE_ON__
		os_list_t queueHead;
	#endif

	#ifdef __CENO_RTOS_CONFIG_RING_BUFFER_ON__
		os_list_t bufferHead;
	#endif
}os_obj_list_t;
```

#### 链表
链表
```c
typedef struct os_list{
	struct os_list* next;
	struct os_list* prev;
}os_list_t;
```

#### 队列
队列定义
```c
typedef struct os_queue{
	os_obj_t obj,

	uint32_t size;
	uint32_t start;
	uint32_t end;

	uint32_t front;
	uint32_t rear;

	void* elems;
	void* ext; // you can write a message queue based on it
}os_queue_t;
```
##### 环形缓冲区
```c
os_err_t os_queue_create(os_queue_t* me,const cpu_char_t* name, uint32_t size);

os_err_t os_queue_add_item(os_queue_t* queue, void* itemPtr);

os_err_t os_queue_remove();

os_err_t os_queue_clear();
```

### 线程
![Task](/img/execution_graph.png)
#### TCB

task函数
```c
typedef void (*os_task_handler_t)();
```
task 状态
```c
typedef	enum task_state{
 	OS_STATE_DORMANT 		= 1,
	OS_STATE_READY 			= 2,
	OS_STATE_RUNNING 		= 1,
	OS_STATE_PENDING 		= 4,
	OS_STATE_INTERRUPTED 	= 4
}task_state_t;
```

task定义
```c
typedef struct os_task{
	os_task_id_t 	id;
	cpu_char_t*   	name;

	cpu_stk_t 		stkPtr;
	cpu_stk_size_t 		stackSize;
	os_task_handler_t taskHandler;

	task_state_t 		state;		// 32 bit maybe more, but can be faster.
	os_time_t 		timeout;
	priority_t 		priority;

	os_task_t* 		nextTask;
	os_task_t* 		prevTask;

}os_task_t;
```

创建task
```c
os_err_t os_task_create(os_task_t *me,
					cpu_char_t *name, 
					priority_t priority, 
					cpu_stk_t stkPtr, 
					cpu_stk_size_t stackSize,
					os_task_handler_t taskHandler){
	
	/* round down the stack top to the 8-byte boundary
    * NOTE: ARM Cortex-M stack grows down from hi -> low memory
    */
    uint32_t *sp = (uint32_t *)((((uint32_t)stkPtr + stackSize) / 8) * 8);
    uint32_t *stk_limit;

 	*(--sp) = (1U << 24);  /* xPSR */
    *(--sp) = (uint32_t)taskHandler; /* PC */
    *(--sp) = 0x0000000EU; /* LR  */
    *(--sp) = 0x0000000CU; /* R12 */
    *(--sp) = 0x00000003U; /* R3  */
    *(--sp) = 0x00000002U; /* R2  */
    *(--sp) = 0x00000001U; /* R1  */
    *(--sp) = 0x00000000U; /* R0  */
    /* additionally, fake registers R4-R11 */
    *(--sp) = 0x0000000BU; /* R11 */
    *(--sp) = 0x0000000AU; /* R10 */
    *(--sp) = 0x00000009U; /* R9 */
    *(--sp) = 0x00000008U; /* R8 */
    *(--sp) = 0x00000007U; /* R7 */
    *(--sp) = 0x00000006U; /* R6 */
    *(--sp) = 0x00000005U; /* R5 */
    *(--sp) = 0x00000004U; /* R4 */

    /* save the top of the stack in the thread's attibute */
    me->stkPtr = sp;
    
    /* round up the bottom of the stack to the 8-byte boundary */
    stk_limit = (uint32_t *)(((((uint32_t)stackSize - 1U) / 8) + 1U) * 8);

    /* pre-fill the unused part of the stack with 0xDEADBEEF */
    for (sp = sp - 1U; sp >= stk_limit; --sp) {
        *sp = 0xDEADBEEFU;
    }

	/* 将线程放到线程数组里*/
	me->id = 1;
	me->name = name;
	me->priority = priority;
	if(priority > 0U ){
		me->state=OS_STATE_READY;
	}

	taskQueue->add_task(me)
}
```

### 信号量
### 互斥
### 消息


## Network

### IP/TCP


### MQTT
#### packet
MQTT报文定义
```c
/**
 * MQTT 报文定义
 * https://mcxiaoke.gitbooks.io/mqtt-cn/content/mqtt/02-ControlPacketFormat.html
 */




#define MQTT_PACKET_LEN_BIT_NUM (7)
#define MQTT_PACKET_LEN_MASK    (1 << MQTT_PACKET_LEN_BIT_NUM)

#define MQTT_PACKET_MAX_LEN     (4)


enum errors
{
	MQTTPACKET_BUFFER_TOO_SHORT = -2,
	MQTTPACKET_READ_ERROR = -1,
	MQTTPACKET_READ_COMPLETE
};

/**
 * 控制报文类型
 */
typedef enum mqtt_packet_type
{
    MQTT_PACKET_TYPE_RESERVED    = 0,	//Reserved		0	禁止		  保留
    MQTT_PACKET_TYPE_CONNECT     = 1,	//CONNECT		1	客户端到服务端	客户端请求连接服务端
    MQTT_PACKET_TYPE_CONNACK     = 2,	//CONNACK		2	服务端到客户端	连接报文确认
    MQTT_PACKET_TYPE_PUBLISH     = 3,	//PUBLISH		3	两个方向都允许	发布消息
    MQTT_PACKET_TYPE_PUBACK      = 4,	//PUBACK		4	两个方向都允许	QoS 1消息发布收到确认
    MQTT_PACKET_TYPE_PUBREC      = 5,	//PUBREC		5	两个方向都允许	发布收到（保证交付第一步）
    MQTT_PACKET_TYPE_PUBREL      = 6,	//PUBREL		6	两个方向都允许	发布释放（保证交付第二步）
    MQTT_PACKET_TYPE_PUBCOMP     = 7,	//PUBCOMP		7	两个方向都允许	QoS 2消息发布完成（保证交互第三步）
    MQTT_PACKET_TYPE_SUBSCRIBE   = 8,	//SUBSCRIBE		8	客户端到服务端	客户端订阅请求
    MQTT_PACKET_TYPE_SUBACK      = 9,	//SUBACK		9	服务端到客户端	订阅请求报文确认
    MQTT_PACKET_TYPE_UNSUBSCRIBE = 10,	//UNSUBSCRIBE	10	客户端到服务端	客户端取消订阅请求
    MQTT_PACKET_TYPE_UNSUBACK    = 11,	//UNSUBACK		11	服务端到客户端	取消订阅报文确认
    MQTT_PACKET_TYPE_PINGREQ     = 12,	//PINGREQ		12	客户端到服务端	心跳请求
    MQTT_PACKET_TYPE_PINGRESP    = 13,	//PINGRESP		13	服务端到客户端	心跳响应
    MQTT_PACKET_TYPE_DISCONNECT  = 14,	//DISCONNECT	14	客户端到服务端	客户端断开连接
    MQTT_PACKET_TYPE_MAX         = 15,	//Reserved		15	禁止	      保留 
} mqtt_packet_type_e; 


#define MQTT_PROTO_NAME_LEN      (2)
#define MQTT_PROTO_NAME_SIZE     (4)
#define MQTT_PROTO_LEVEL         (4)

#define MQTT_STRING_LEN          (2)
#define MQTT_DATA_LEN            (2)
#define MQTT_QOS_LEN             (1)

#define MQTT_CONNECT_HEAD_INIT {{0, MQTT_PROTO_NAME_SIZE}, {'M', 'Q', 'T', 'T'}, MQTT_PROTO_LEVEL, {0}, 0}
#define MQTT_CONNECT_OPT_INIT {{{0, MQTT_PROTO_NAME_SIZE}, {'M', 'Q', 'T', 'T'}, MQTT_PROTO_LEVEL, {0}, 0}, {NULL, NULL, NULL, NULL, NULL}}


/**
 * 固定报头
 */
typedef struct mqtt_fix_head
{
    union
    {
        unsigned char byte;
        struct
        {
            unsigned char retain : 1;	//PUBLISH报文的保留标志
            unsigned char qos : 2;		//PUBLISH报文的服务质量等级
            unsigned char dup : 1;		//控制报文的重复分发标志
            unsigned char type : 4;
        } bits;
    } mqtt_first_byte_u;
	/**
	 * 剩余长度（Remaining Length）表示当前报文剩余部分的字节数，包括可变报头和负载的数据。
	 * 剩余长度不包括用于编码剩余长度字段本身的字节数。
	 * 
	 * 1个字节时，从0(0x00)到127(0x7f)
	 * 2个字节时，从128(0x80,0x01)到16383(0Xff,0x7f)
	 * 3个字节时，从16384(0x80,0x80,0x01)到2097151(0xFF,0xFF,0x7F)
	 * 4个字节时，从2097152(0x80,0x80,0x80,0x01)到268435455(0xFF,0xFF,0xFF,0x7F)
	 * */
    unsigned char remaining_len[MQTT_PACKET_MAX_LEN]; 
} mqtt_fix_head_t;


typedef struct mqtt_connect_head
{
    unsigned char proto_len[MQTT_PROTO_NAME_LEN];
    unsigned char proto_name[MQTT_PROTO_NAME_SIZE];
    unsigned char proto_level; // 协议级别
    union
    {
        unsigned char connect_flag;
        struct
        {
            unsigned char reserved : 1;
            unsigned char clean_session : 1;	// 清理会话
            unsigned char will_flag : 1;		// 遗嘱标志
            unsigned char will_qos : 2;			// 遗嘱QOS
            unsigned char will_retain : 1;		// 遗嘱保留
            unsigned char psd_flag : 1;			// 密码标志符
            unsigned char user_name_flag : 1;	// 用户名标志符
        } bits; // 连接标志位
    } mqtt_connect_flag_u;
    unsigned short keep_alive;					// 保持连接
} mqtt_connect_head_t;


/**
 * 有效载荷
 */
typedef struct mqtt_connect_payload
{
    char *client_id;		// 客户端标志符号
    char *will_topic;		// 遗嘱主题
    char *will_msg;			// 遗嘱消息
    char *user_name;		// 用户名
    char *password;			// 密码
} mqtt_connect_payload_t;


typedef struct mqtt_connect_opt
{
    mqtt_connect_head_t connect_head;
    mqtt_connect_payload_t connect_payload;
} mqtt_connect_opt_t;


typedef struct mqtt_publish_head
{
    char *topic;
    unsigned short topic_len;
    unsigned short packet_id;
} mqtt_publish_head_t;


typedef struct mqtt_publish_payload
{
    char *msg;
    size_t msg_len;
} mqtt_publish_payload_t;


typedef struct mqtt_publish_opt
{
    mqtt_publish_head_t publish_head;
    mqtt_publish_payload_t publish_payload;
    unsigned char dup;
    unsigned char qos;
    unsigned char retain;
} mqtt_publish_opt_t;


typedef struct mqtt_subscribe_head
{
    unsigned short packet_id;
} mqtt_subscribe_head_t;


typedef struct mqtt_subscribe_payload
{
    unsigned char count;
    char **topic;
    unsigned char qoss[0];
} mqtt_subscribe_payload_t;


typedef struct mqtt_subscribe_opt
{
    mqtt_subscribe_head_t subscribe_head;
    mqtt_subscribe_payload_t subscribe_payload;
} mqtt_subscribe_opt_t;


typedef struct mqtt_unsubscribe_head
{
    unsigned short packet_id;
} mqtt_unsubscribe_head_t;


typedef struct mqtt_unsubscribe_payload
{
    unsigned char count;
    char **topic;
} mqtt_unsubscribe_payload_t;


typedef struct mqtt_unsubscribe_opt
{
    mqtt_unsubscribe_head_t unsubscribe_head;
    mqtt_unsubscribe_payload_t unsubscribe_payload;
} mqtt_unsubscribe_opt_t;


typedef struct mqtt_suback_head
{
    unsigned short packet_id;
} mqtt_suback_head_t;


typedef struct mqtt_suback_payload
{
    unsigned char ret_code[0];
} mqtt_suback_payload_t;


typedef struct mqtt_suback_opt
{
    unsigned char count;
    mqtt_suback_head_t suback_head;
    mqtt_suback_payload_t suback_payload;
} mqtt_suback_opt_t;


typedef struct mqtt_puback_head
{
    unsigned short packet_id;
} mqtt_puback_head_t;


typedef struct mqtt_puback_payload
{
    unsigned char null[0];
} mqtt_puback_payload_t;


typedef struct mqtt_puback_opt
{
    unsigned char type;
    mqtt_puback_head_t puback_head;
    mqtt_puback_payload_t puback_payload;
} mqtt_puback_opt_t;
```
#### mqtt

# Community

# License
CenoOS is released under the Apache 2.0 license