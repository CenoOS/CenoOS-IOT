/**
 *	Ceno RTOS task 
 * 	
 * 2018-12-17 
 * neroyang
 * 
 * Copyright (C) 2018 CenoCloud. All Rights Reserved 
 *
 * Contract Information：
 * nerosoft@outlook.com
 * https://www.cenocloud.com
 */

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






