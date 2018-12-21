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

static os_queue_t* taskQueue;

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
	me->obj.name = name;
	me->priority = priority;
	if(priority > 0U ){
		me->state=OS_STATE_READY;
	}


	os_err_t err = os_queue_add_item(taskQueue,me);
	if(err==OS_ERR){
		/* add to task queue failed */
	}
}

os_err_t os_task_switch_next(void){
	/* context switch */
    asm  (
		/* __disable_irq(); */
		"CPSID         I"

    	/* if (OS_curr != (OSThread *)0) { */ 
    	"LDR           r1,=OS_curr"
    	"LDR           r1,[r1,#0x00]"
    	"CBZ           r1,PendSV_restore"

    	/*     push registers r4-r11 on the stack */
    	"PUSH          {r4-r11}"   

    	/*     OS_curr->sp = sp; */ 
    	"LDR           r1,=OS_curr"
    	"LDR           r1,[r1,#0x00]"
    	"STR           sp,[r1,#0x00]"
    	/* } */

		"PendSV_restore:"   
    	/* sp = OS_next->sp; */
    	"LDR           r1,=OS_next"
    	"LDR           r1,[r1,#0x00]"
    	"LDR           sp,[r1,#0x00]"

    	/* OS_curr = OS_next; */
		"LDR           r1,=OS_next"
   		"LDR           r1,[r1,#0x00]"
   		"LDR           r2,=OS_curr"
   		"STR           r1,[r2,#0x00]"

    	/* pop registers r4-r11 */ 
   		"POP           {r4-r11}"

    	/* __enable_irq(); */
    	"CPSIE         I"

    	/* return  thread */
    	"BX            lr"
	);
}

os_err_t os_task_exit(void){
	
}
