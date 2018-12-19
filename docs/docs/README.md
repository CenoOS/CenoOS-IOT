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
!> 多喝热水,早睡早起.记得吃饭.

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
![KernelObjectContainer](/img/kernel_obj_manager.png)
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
信号量是一个可以通过一个或多个任务获取或释放，以实现同步或互斥的内核对象。简单来说，信号量只不过是一个值或变量或数据，在并行编程环境中可以控制不同任务之间的资源分配。
内核具有不同类型的信号量，包括二进制，计数和互斥（互斥）信号量。
#### 二值信号量
二进制信号量可以具有0或1的值。当二进制信号量的值为0时，信号量被视为不可用（或空）。 当值为1时，二进制信号量被认为可用。
#### 计数信号量
计数信号量使用计数允许多次获取或释放。 在创建计数信号量时，为信号量分配一个数值，该数值表示它最初具有的信号量标记的数量。
### 互斥
互斥（互斥）信号量是一种特殊的二进制信号量，它支持所有权，递归访问，任务删除安全以及一个或多个协议，以避免互斥所固有的问题。 这意味着互斥锁是一个只能有两个状态的同步对象。 他们不归并拥有。
### 消息队列
消息队列是一个类似缓冲区的对象，用于向任务发送一个或多个消息，即消息队列用于建立内部任务通信。
基本上队列是一个邮箱数组.Tash和ISR可以通过内核提供的服务向队列发送和接收消息。 从队列中提取消息遵循FIFO或LIFO结构。
### 邮箱
长度为1的消息队列称为邮箱。
### 管道
管道是内核对象，提供非结构化数据交换并促进任务之间的同步。 在传统实现中，管道是单向数据交换设施。

在创建管道时，将返回两个描述符，一个用于管道的每一端（一端用于读取，另一端用于写入）。 数据通过一个描述符写入并通过另一个描述符读取。 数据作为非结构化字节流保留在管道中。 以FIFO顺序从管道读取数据。


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
```c
static int mqtt_encode_len(unsigned char *buf, int len)
{
    int rc = 0;

    do
    {
        unsigned char d = len & (MQTT_PACKET_LEN_MASK - 1);
        len >>= MQTT_PACKET_LEN_BIT_NUM;
        // if there are more data to encode, set the top bit of this byte
        if (len > 0)
            d |= MQTT_PACKET_LEN_MASK;
        buf[rc++] = d;
    } while (len > 0);

    return rc;
}

static int mqtt_decode_len(unsigned char *buf, int *len)
{
    int rc = 0;
    int mul = 1;
    unsigned char byte;

    *len = 0;
    do
    {
        byte = *(buf++);
        *len += (byte & ~MQTT_PACKET_LEN_MASK) * mul;
        if (mul > (MQTT_PACKET_LEN_MASK * MQTT_PACKET_LEN_MASK * MQTT_PACKET_LEN_MASK))
        {
            return -1;
        }
        mul *= MQTT_PACKET_LEN_MASK;
        rc++;
    } while ((byte & MQTT_PACKET_LEN_MASK) != 0);

    return rc;
}

static int mqtt_encode_num(unsigned char *buf, unsigned short num)
{
    if(buf)
    {
        buf[0] = num >> 8;
        buf[1] = num & 0xFF;
    }
    
    return MQTT_DATA_LEN;
}

static int mqtt_decode_num(unsigned char *buf, unsigned short *num)
{
    if(buf)
    {
        *num = (buf[0] << 8) + buf[1];
    }

    return MQTT_DATA_LEN;
}

static int mqtt_encode_string(unsigned char *buf, const char *str)
{
    size_t str_len = 0;
    int len = 0;

    str_len = strlen(str);
    len = mqtt_encode_num(buf, str_len);
    memcpy(buf + len, str, str_len);

    return  (len + str_len);
}

static int mqtt_decode_string(unsigned char *buf, char **str, unsigned short *num)
{
    int len = 0;

    len = mqtt_decode_num(buf, num);
    *str = (char *)buf + len;

    return (len + *num);
}


int mqtt_encode_fixhead(unsigned char *buf, unsigned char type, unsigned char dup,
                                unsigned char qos, unsigned char retain, int remaining_len)
{
    int len = 1;

    mqtt_fix_head_t *head = (mqtt_fix_head_t *)buf;

    head->mqtt_first_byte_u.bits.type = type;
    head->mqtt_first_byte_u.bits.dup = dup;
    head->mqtt_first_byte_u.bits.qos = qos;
    head->mqtt_first_byte_u.bits.retain = retain;
    len += mqtt_encode_len( head->remaining_len, remaining_len);

    return len;
}

int mqtt_decode_fixhead(unsigned char *buf, unsigned char *type, unsigned char *dup,
                        unsigned char *qos, unsigned char *retain, int *remaining_len)
{
    int len = 1;

    mqtt_fix_head_t *head = (mqtt_fix_head_t *)buf;

    *type = head->mqtt_first_byte_u.bits.type;
    *dup = head->mqtt_first_byte_u.bits.dup;
    *qos = head->mqtt_first_byte_u.bits.qos;
    *retain = head->mqtt_first_byte_u.bits.retain;
    len += mqtt_decode_len(head->remaining_len, remaining_len);

    return len;
}

int mqtt_encode_connect(unsigned char *buf, int buf_len, mqtt_connect_opt_t *options)
{
    int len = 0;
    int remaining_len = 0;
    unsigned char *vhead_buf;
    unsigned char *payload_buf;

    //IEC_ASSERT(options->connect_payload.client_id, "client id is null");
    // add connect variable header size
    remaining_len += sizeof(mqtt_connect_head_t);

    // add payload size
    remaining_len += (int)strlen(options->connect_payload.client_id) + MQTT_STRING_LEN;
    if(options->connect_head.mqtt_connect_flag_u.bits.will_flag
        && options->connect_payload.will_topic
        && options->connect_payload.will_msg)
    {
        remaining_len += (int)strlen(options->connect_payload.will_topic) + MQTT_STRING_LEN;
        remaining_len += (int)strlen(options->connect_payload.will_msg) + MQTT_STRING_LEN;
    }

    if(options->connect_head.mqtt_connect_flag_u.bits.user_name_flag && options->connect_payload.user_name)
        remaining_len += (int)strlen(options->connect_payload.user_name) + MQTT_STRING_LEN;

    if(options->connect_head.mqtt_connect_flag_u.bits.psd_flag && options->connect_payload.password)
        remaining_len += (int)strlen(options->connect_payload.password) + MQTT_STRING_LEN;

    /* Encode fix header */
    len = mqtt_encode_fixhead(buf, MQTT_PACKET_TYPE_CONNECT, 0, 0, 0, remaining_len);
    if((len + remaining_len) > buf_len)
        return -1;

    /* check variable header and payload */
    // TODO
    /* Encode variable header */
    vhead_buf = buf + len;
    //#define SWAP16(x) ((x & 0xFF00) >> 8) | ((x & 0x00FF) << 8)
    //options->connect_head.keep_alive = SWAP16(options->connect_head.keep_alive);
    memcpy(vhead_buf, &(options->connect_head), sizeof(options->connect_head) - sizeof(options->connect_head.keep_alive));
    mqtt_encode_num(vhead_buf + sizeof(options->connect_head) - sizeof(options->connect_head.keep_alive), options->connect_head.keep_alive);

    /* Encode payload*/
    payload_buf = vhead_buf + sizeof(options->connect_head);

    payload_buf += mqtt_encode_string(payload_buf, options->connect_payload.client_id);

    if(options->connect_head.mqtt_connect_flag_u.bits.will_flag
        && options->connect_payload.will_topic
        && options->connect_payload.will_msg)
    {
        payload_buf += mqtt_encode_string(payload_buf, options->connect_payload.will_topic);
        payload_buf += mqtt_encode_string(payload_buf, options->connect_payload.will_msg);
    }

    if(options->connect_head.mqtt_connect_flag_u.bits.user_name_flag && options->connect_payload.user_name)
        payload_buf += mqtt_encode_string(payload_buf, options->connect_payload.user_name);

    if(options->connect_head.mqtt_connect_flag_u.bits.psd_flag && options->connect_payload.password)
        payload_buf += mqtt_encode_string(payload_buf, options->connect_payload.password);

    return (len + remaining_len);
}

int mqtt_encode_publish(unsigned char *buf, int buf_len, mqtt_publish_opt_t *options)
{
    int len = 0;
    int remaining_len = 0;
    unsigned char *vhead_buf;
    unsigned char *payload_buf;

    // add connect variable header size
    if(options->publish_head.topic)
        remaining_len += (int)strlen(options->publish_head.topic) + MQTT_STRING_LEN;

    remaining_len += sizeof(options->publish_head.packet_id);

    if(options->publish_payload.msg)
        remaining_len += (int)strlen(options->publish_payload.msg);
    /* Encode fix header */
    len = mqtt_encode_fixhead(buf, MQTT_PACKET_TYPE_PUBLISH, options->dup, 
                              options->qos, options->retain, remaining_len);

    /* Encode variable header */
    vhead_buf = buf + len;
    vhead_buf += mqtt_encode_string(vhead_buf, options->publish_head.topic);
    if(options->qos > 0)
        vhead_buf += mqtt_encode_num(vhead_buf, options->publish_head.packet_id);

    /* Encode payload*/
    payload_buf = vhead_buf;
    memcpy(payload_buf, options->publish_payload.msg, strlen(options->publish_payload.msg));

    return (len + remaining_len);
}

int mqtt_decode_publish(unsigned char *buf, int buf_len, mqtt_publish_opt_t *options)
{
    int len = 0, remaning_len = 0;
    unsigned char type = 0;
    unsigned char *vhead_buf;
    unsigned char *payload_buf;
    len = mqtt_decode_fixhead(buf, &type, &options->dup, &options->qos, &options->retain, &remaning_len);
    if(type != MQTT_PACKET_TYPE_PUBLISH)
    {
        // LOG(LOG_ERR, "decode pulish error");
        return -1;
    }

    vhead_buf = buf + len;
    vhead_buf += mqtt_decode_string(vhead_buf, &options->publish_head.topic, &options->publish_head.topic_len);

    if(options->qos > 0)
        vhead_buf += mqtt_decode_num(vhead_buf, &options->publish_head.packet_id);

    payload_buf = vhead_buf;
    options->publish_payload.msg = (char *)payload_buf;
    options->publish_payload.msg_len = remaning_len - options->publish_head.topic_len - MQTT_STRING_LEN;

    return 0;
}


int mqtt_encode_subscribe(unsigned char *buf, int buf_len, mqtt_subscribe_opt_t *options)
{
    int len = 0;
    int remaining_len = 0;
    unsigned char *vhead_buf;
    unsigned char *payload_buf;

    remaining_len += sizeof(options->subscribe_head);

    for(int i = 0; i < options->subscribe_payload.count; i++)
    {
        remaining_len += MQTT_STRING_LEN + MQTT_QOS_LEN + (int)strlen(options->subscribe_payload.topic[i]);
    }

    /* Encode fix header */
    len = mqtt_encode_fixhead(buf, MQTT_PACKET_TYPE_SUBSCRIBE, 0, 0, 0, remaining_len);
	/* Encode variable header */
    vhead_buf = buf + len;
    vhead_buf += mqtt_encode_num(vhead_buf, options->subscribe_head.packet_id);

    /* Encode payload*/
    payload_buf = vhead_buf;
    for(int i = 0; i < options->subscribe_payload.count; i++)
    {
        payload_buf += mqtt_encode_string(payload_buf, options->subscribe_payload.topic[i]);
        *payload_buf = options->subscribe_payload.qoss[i];
        payload_buf += 1;
    }

    return (len + remaining_len);
}

int mqtt_decode_suback(unsigned char *buf, int buf_len, mqtt_suback_opt_t *options)
{
    int i = 0;
    int len = 0, remaning_len = 0;
    unsigned char type = 0;
    unsigned char reserved = 0;
    unsigned char *vhead_buf;
    unsigned char *payload_buf;
    len = mqtt_decode_fixhead(buf, &type, &reserved, &reserved, &reserved, &remaning_len);
    if(type != MQTT_PACKET_TYPE_SUBACK)
    {
        // LOG(LOG_ERR, "decode suback error");
        return -1;
    }

    vhead_buf = buf + len;
    vhead_buf += mqtt_decode_num(vhead_buf, &options->suback_head.packet_id);

    payload_buf = vhead_buf;
    options->count = (remaning_len - MQTT_DATA_LEN);
    for(i = 0; i < options->count; i++)
        options->suback_payload.ret_code[i] = payload_buf[i];

    return 0;
}

int mqtt_encode_puback(unsigned char *buf, int buf_len, mqtt_puback_opt_t *options)
{
    int len = 0;
    int remaining_len = sizeof(options->puback_head);
    unsigned char *vhead_buf;

    len = mqtt_encode_fixhead(buf, options->type, 0, 0, 0, remaining_len);
    vhead_buf = buf + len;
    vhead_buf += mqtt_encode_num(vhead_buf, options->puback_head.packet_id);
    return (len + remaining_len);
}

int mqtt_encode_unsubscribe(unsigned char *buf, int buf_len, mqtt_unsubscribe_opt_t *options)
{
    int len = 0;
    int remaining_len = 0;
    unsigned char *vhead_buf;
    unsigned char *payload_buf;

    remaining_len += sizeof(options->unsubscribe_head);

    for(int i = 0; i < options->unsubscribe_payload.count; i++)
    {
        remaining_len += MQTT_STRING_LEN + (int)strlen(options->unsubscribe_payload.topic[i]);
    }

    /* Encode fix header */
    len = mqtt_encode_fixhead(buf, MQTT_PACKET_TYPE_UNSUBSCRIBE, 0, 0, 0, remaining_len);
    /* Encode variable header */
    vhead_buf = buf + len;
    vhead_buf += mqtt_encode_num(vhead_buf, options->unsubscribe_head.packet_id);

    /* Encode payload*/
    payload_buf = vhead_buf;
    for(int i = 0; i < options->unsubscribe_payload.count; i++)
    {
        payload_buf += mqtt_encode_string(payload_buf, options->unsubscribe_payload.topic[i]);
    }

    return (len + remaining_len);
}


int mqtt_encode_ping(unsigned char *buf, int buf_len)
{
    int len = 0;
    len = mqtt_encode_fixhead(buf, MQTT_PACKET_TYPE_PINGREQ, 0, 0, 0, 0);

    return len;
}
```
#### mqtt

# Community

# License
CenoOS is released under the Apache 2.0 license