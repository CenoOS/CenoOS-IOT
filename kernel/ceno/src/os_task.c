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

os_task_t* volatile osTaskCurr;
os_task_t* volatile osTaskNext;

os_err_t os_task_create(os_task_t *me,
					cpu_char_t *name, 
					priority_t priority, 
					cpu_stk_t stkSto, 
					cpu_stk_size_t stackSize,
					os_task_handler_t taskHandler){
	uart_debug_print("[task] create task : '");
	uart_debug_print(name);
	uart_debug_print("'\n\r");
	/**
	 * round down the stack top to the 8-byte boundary
     * NOTE: ARM Cortex-M stack grows down from high -> low memory
     */
    uint32_t *sp = (uint32_t *)((((uint32_t)stkSto + stackSize) / 8) * 8);
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
    me->sp = sp;
    
    /* round up the bottom of the stack to the 8-byte boundary */
    stk_limit = (uint32_t *)(((((uint32_t)stkSto - 1U) / 8) + 1U) * 8);
    
	/* pre-fill the unused part of the stack with 0xDEADBEEF */
    for (sp = sp - 1U; sp >= stk_limit; --sp) {
        *sp = 0xDEADBEEFU;
    }
  
	/* 将线程放到线程数组里*/
	me->id = 1;
	me->obj.name = name;
	me->priority = priority;
	if(priority > 0U ){
		me->state=OS_STATE_READY;
	}

	os_err_t err = os_queue_add_item(&osTaskQueue,me);
	if(err==OS_ERR){
		/* add to task queue failed */
	}
	uart_debug_print("[task] task '");
	uart_debug_print(me->obj.name);
	uart_debug_print("' add to queue '");
	uart_debug_print(osTaskQueue.obj.name);
	uart_debug_print("'.\n\r");
}

os_err_t os_task_switch_next(void){
	uart_debug_print("[task] task switch next : '");
	uart_debug_print(osTaskNext->obj.name);
	uart_debug_print("'.\n\r");
	osTaskCurr = (os_task_t *)0;
	if(!osTaskCurr){
		uart_debug_print("[task] task current is null.\n\r");
	}
	if(!osTaskNext){
		uart_debug_print("[task] task next is null.\n\r");
	}
	/* context switch */
    __asm(
		/* __disable_irq(); */
		"CPSID		 I\n\t"

    	/* if (osTaskCurr != (os_task_t *)0) { */ 
    		"LDR		r1,=osTaskCurr\n\t"
    		"LDR		r1,[r1,#0x00]\n\t"
    		"CBZ		r1,PendSV_restore\n\t"

    	/*     push registers r4-r11 on the stack */
    		"PUSH		{r4-r11}\n\t"

    	/*     osTaskCurr->sp = sp; */
    		"LDR		r1,=osTaskCurr\n\t"
    		"LDR		r1,[r1,#0x00]\n\t"
    		"STR		sp,[r1,#0x00]\n\t"
    	/* } */

	"PendSV_restore:\n\t"   
    	/* sp = osTaskNext->sp; */
    	"LDR		r1,=osTaskNext\n\t"
    	"LDR		r1,[r1,#0x00]\n\t"
    	"LDR		sp,[r1,#0x00]\n\t"

    	/* osTaskCurr = osTaskNext; */
		"LDR		r1,=osTaskNext\n\t"
   		"LDR		r1,[r1,#0x00]\n\t"
   		"LDR		r2,=osTaskCurr\n\t"
   		"STR		r1,[r2,#0x00]\n\t"

    	/* pop registers r4-r11 */
   		"POP		{r4-r11}\n\t"

    	/* __enable_irq(); */
    	"CPSIE		I\n\t"

    	/* return  thread */
    	"BX		lr"
	);
}

os_err_t os_task_exit(void){
	
}

os_err_t os_task_switch_context(os_task_t *next){
	osTaskCurr = next;
}
