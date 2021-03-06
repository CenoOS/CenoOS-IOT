/**
 * Ceno RTOS task 
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

#define TASK_MAX_SIZE 32

os_queue_t  osTaskQueue;
os_queue_t  osReadyTaskQueue;

volatile os_task_t osIdleTask;
uint32_t stackTaskIdle[40];

os_err_t os_init(void){
	uart_debug_print("[kernel] os init.\n\r");
	os_heap_init();

	/**
	 * Set the pendSV interrput priority to the losest level 0xFF
	 */
	*(uint32_t volatile *)0xE000ED20 |= (0xFFU << 16);


	/**
	 * os objects container init
	 */
	os_err_t isOsObjectContainerInit = os_obj_container_init();
	if(isOsObjectContainerInit==OS_ERR){
		return isOsObjectContainerInit;
	}

	/* task queue create*/
	os_err_t isOsTaskQueueCreate = os_queue_create(&osTaskQueue,"task queue",TASK_MAX_SIZE);
	if(isOsTaskQueueCreate==OS_ERR){
		return isOsTaskQueueCreate;
	}

	/* ready task queue create*/
	os_err_t isOsReadyTaskQueueCreate = os_queue_create(&osReadyTaskQueue,"ready task queue",TASK_MAX_SIZE);
	if(isOsReadyTaskQueueCreate==OS_ERR){
		return isOsReadyTaskQueueCreate;
	}

	/**
	 * os idle task init
	 */
	os_err_t isOsIdleTaskInit = os_task_create(
		&osIdleTask,
    	"taskIdle",
    	0,
    	stackTaskIdle,
    	sizeof(stackTaskIdle),
    	&os_idle
	);
	
	osTaskCurr = &osIdleTask;

	if(isOsIdleTaskInit==OS_ERR){
		return isOsIdleTaskInit;
	}
}

void task_idle_thread(){
	for(unsigned int i = 0;i<~0;i++){
		uart_debug_print("[task] idle. ");
		uart_debug_print_i32(i,10);
		uart_debug_print("\n\r");
	}
}

os_err_t os_run(void){
	os_queue_traverse(&osTaskQueue);
	uart_debug_print("[kernel] os run.\n\r");
	/* callback to configure and start interrupts */
	os_on_startup();

    disable_irq();
    os_sched();
    enable_irq();
}

os_err_t os_idle(void){
	while(1){
		task_idle_thread();
	}
}

os_err_t os_tick(void){
	uint32_t i = osTaskQueue.front;
	uart_debug_print("[task] tasks traverse \n\r");
	os_task_t *highTask = &osIdleTask;
	while( i != osTaskQueue.rear){
		os_task_t *t =  (os_task_t *)osTaskQueue.elems[i];
		uart_debug_print(" |--[task] task : '");
		uart_debug_print(t->obj.name);
		uart_debug_print("', timeout : '");
		uart_debug_print_i32(t->timeout,10);
		uart_debug_print("ms'\n\r");
		if(t->timeout > 0){
			t->timeout--;
			if (t->timeout == 0U) {
				t->state = OS_STATE_READY;	
			}
		}
		
		if(t->state == OS_STATE_READY && (t->priority > highTask->priority)){
			highTask = t;
		}
		i = (i+1) % osTaskQueue.size;
	}
	os_queue_item_en(&osReadyTaskQueue,highTask);
}

os_task_t* os_get_next_ready_from_task_queue(os_queue_t* queue){
	uart_debug_print("[kernel] os ready queue size : '");
	uart_debug_print_i32(os_queue_length(queue),10);
	uart_debug_print("'\n\r");
	uint32_t ptrToTask;
	os_queue_item_de(queue,&ptrToTask);
	os_task_t* t = (os_task_t *)ptrToTask;
	return t;
}

os_err_t os_sched(void){
	uart_debug_print("[kernel] os sched.\n\r");
	if(os_queue_length(&osReadyTaskQueue)<=0U){
		osTaskNext = &osIdleTask;
	}else{
		osTaskNext = os_get_next_ready_from_task_queue(&osReadyTaskQueue);
	}
	uart_debug_print("[scheduler] next task : '");
	uart_debug_print(osTaskNext->obj.name);
	uart_debug_print("'\n\r");
	

	*(uint32_t volatile *)0xE000ED04 = (1U << 27);
	uart_debug_print_i32(*(uint32_t volatile *)0xE000ED04>>28 & 1,10);
	uart_debug_print("\n\r");
	*(uint32_t volatile *)0xE000ED04 = (1U << 28);
	uart_debug_print_i32(*(uint32_t volatile *)0xE000ED04>>28 & 1,10);
	uart_debug_print("\n\r");
	uart_debug_print_i32(*(uint32_t volatile *)0xE000ED24>>10 & 1,10);
	uart_debug_print("\n\r");

	/* trigger PendSV, if needed */
 	if (osTaskNext != osTaskCurr) {
		/* todo : this need be a hal function */
        *(uint32_t volatile *)0xE000ED04 = (1U << 28);
    }
}
