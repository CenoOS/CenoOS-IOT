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
 * 
 *  *
 *				    ____________________
 *			Stack |                         |
 *				    |                        |
 *  higher        |        R4              | <-- SP saved in TCB (64B context)
 *  addresses    |        R5              |   ^
 *      |  ^       |        R6              |   |
 *      |  |       |        R7              |   | 8 registers pushed by handler:
 *      |  |       |        R8              |   | R4..R11
 *      |  |       |        R9              |   | Full task context is now stored
 *      V  |       |        R10             |   |
 *         |       |        R11             |   |
 *   direction   |        R0              | <-- SP when SVC handler gets control
 *   of growth   |        R1              |   ^
 *                 |        R2              |   |
 *                 |        R3              |   | 8 registers are pushed by
 *                 |        R12             |   | the NVIC hardware:
 *                 |        LR (R14)       |   | xPSR, PC, LR, R12, R3..R0
 *                 |        PC (R15)       |   |
 *                 |       xPSR             |   |
 *                 |                         | <-- SP before SVC
 *                 |      (stuff)          |
 *     Stack +   |                         |
 *    StackSize |____________________|
 *
 */
#include "../include/os_api.h"

os_task_t * volatile osTaskCurr;
os_task_t * volatile osTaskNext;



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

 	*(--sp) = (1U << 24);  /* xPSR */ /* 0x01000000 */
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
	me->timeout = 0;
	me->priority = priority;
	if(priority > 0U ){
		me->state=OS_STATE_READY;
	}

	os_err_t err = os_queue_item_en(&osTaskQueue,me);
	if(err==OS_ERR){
		uart_debug_print("[task] task add to queue failed!\n\r");
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
     		"LDR		r3,.L11+12\n\t"
	 		"LDR		r3,[r3,#0x00]\n\t"
     		"CBZ		r3,.PendSV_restore\n\t"

			"PUSH {r4,r11}\n\t"

     	/*     osTaskCurr->sp = sp; */
     		"LDR		r3,.L11+12\n\t"
	 		"LDR		r3,[r3]\n\t"
     		"STR		sp,[r3]\n\t"
     	/* } */
		
	".PendSV_restore:\n\t"  
     	/* sp = osTaskNext->sp; */
     	"LDR		r3,.L11+4\n\t"
		"LDR		r3, [r3]\n\t"
		"LDR		sp, [r3]\n\t"
     	
     	/* osTaskCurr = osTaskNext; */ 
	 	"LDR		r3,.L11+4\n\t"
   	 	"LDR		r3,[r3]\n\t"
   	 	"LDR		r2,.L11+12\n\t"
   	 	"STR		r3,[r2]\n\t"

		"POP {r4,r11}\n\t"
	
     	/* __enable_irq(); */
     	"CPSIE		I\n\t"

		"MOV r0,lr\n\t"

     	"BX		lr"
	);
	uart_debug_print("[task] contex switch finished. never be here!!!\n\r");
}

os_err_t os_task_exit(void){
	
}

os_err_t os_task_switch_context(os_task_t *next){
	osTaskCurr = next;
}

void delay(clock_t tick){
	osTaskCurr->state = OS_STATE_BLOCKED;
	osTaskCurr->timeout = tick;
}
