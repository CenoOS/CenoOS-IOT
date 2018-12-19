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

typedef	unsigned int os_state_t;
#define OS_STATE_DORMANT 		1;
#define OS_STATE_READY 			2;
#define OS_STATE_RUNNING 		1;
#define OS_STATE_PENDING 		4;
#define OS_STATE_INTERRUPTED 	4;


typedef	unsigned int os_err_t;
#define OS_ERR 		1
#define OS_ERR_NONE 0


typedef void* cpu_stk_t;
typedef unsigned int cpu_stk_size_t;
typedef char cpu_char_t;

typedef unsigned int priority_t;


typedef unsigned int queue_size_t;
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

#### 队列
队列定义
```c
typedef struct queue{
	uint32_t size;
	uint32_t start;
	uint32_t end;

	uint32_t front;
	uint32_t rear;

	void* elems;
	void* ext; // you can write a message queue based on it
}queue_t;
```
##### 环形缓冲区
```c
os_err_t queue_create(queue_t me,uint32_t size);

os_err_t queue_add_item(queue_t* queue, void* itemPtr);

os_err_t queue_remove();
```

### Task
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


## Network

### IP/TCP


### MQTT
#### packet
#### mqtt

# Community

# License
CenoOS is released under the Apache 2.0 license