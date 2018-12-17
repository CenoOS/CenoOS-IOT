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
have a good trial!

## Drivers+BSP

## HAL

## Kernel
### Common
#### 基础定义
```c
#define os_thread_control_block_id_t unsigned int //线程ID
#define time_t unsigned int //时间
```
### Task
#### TCB
线程控制块定义
```c

typedef void (*os_task_handler_t)();

typedef struct os_task{
	os_task_id_t id;
	void* stackPointer;
	os_state_t state;		// 32 bit maybe more, but can be faster.
	
	#ifdef __CENO_RTOS_CONFIG_MEM_ON__
		uint32_t stackSize;
	#else
		uint32_t stackSize;
	#endif

	os_task_handler_t taskHandler;
	time_t timeout;
	uint16_t priority;

	queue_t taskQueue;
	os_task_t* nextTask;
	os_task_t* prevTask;
	
	#ifdef __CENO_RTOS_CONFIG_SEM_ON__
		queue_t semphoreQueue;
	#endif

	#ifdef __CENO_RTOS_CONFIG_MSG_ON__
		queue_t msgQueue;
	#endif

}os_task_t;


void os_init(void);

void os_task_add(void);

void os_task_switch_next(void);

void os_task_exit(void);

void os_run(void);

void os_idle_task(void);

```


## Network

### IP/TCP


### MQTT
#### packet
#### mqtt

# Community

# License
CenoOS is released under the Apache 2.0 license