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
#include "../include/os_api.h"

os_task_t* volatile osIdleTask;
uint32_t stackTaskIdle[40];

os_err_t os_init(void){

	//	(*((volatile unsigned long *)0x400FE108)) |= 0x20;
    // 	(*((volatile unsigned long *)0x40025400)) |= 0x0000000E;
   	// 	(*((volatile unsigned long *)0x4002551C)) |= 0x0000000E;
   	// 	(*((volatile unsigned long *)0x40025038)) = 0;
  	// 	(*((volatile unsigned long *)0x40025038)) |= 0x04;

	/**
	 * os objects container init
	 */
	os_err_t isOsObjectContainerInit = os_obj_container_init();
	if(isOsObjectContainerInit==OS_ERR){
		return isOsObjectContainerInit;
	}

	/**
	 * os idle task init
	 */
	os_err_t isOsIdleTaskInit = os_task_create(
		osIdleTask,
    	"taskIdle",
    	0,
    	stackTaskIdle,
    	sizeof(stackTaskIdle),
    	os_idle
	);
	
	if(isOsIdleTaskInit==OS_ERR){
		return isOsIdleTaskInit;
	}
}

os_err_t os_run(void){
	/* callback to configure and start interrupts */
	os_on_startup();
    disable_irq();
    os_sched();
    enable_irq();
}

os_err_t os_idle(void){

}

os_err_t os_tick(void){

}

os_task_t* os_get_next_ready_from_task_queue(os_queue_t* queue){

}

os_err_t os_sched(void){
	if(os_queue_size(osTaskQueue)<=0U){
		osTaskNext = osIdleTask;
	}else{
		/* get first ready task from task queue, task queue is sorted by priority */
		osTaskNext = os_get_next_ready_from_task_queue(osTaskQueue);
	}
	 
	/* trigger PendSV, if needed */
    if (osTaskNext != osTaskCurr) {
		/* todo : this need be a hal function */
        *(uint32_t volatile *)0xE000ED04 = (1U << 28);
    }
}
