/***************************************************
* Ceno Real-time Operating System  (CenoRTOS)
* version 0.1
* author neroyang
* email nerosoft@outlook.com
* time 2018-11-2 
* 
* Copyright (C) 2018 CenoCloud. All Rights Reserved 
*
* Contract Information：
* https://www.cenocloud.com
****************************************************/

#include <stdint.h>
#include "thread.h"
#include "TM4C123GH6PM.h"
#include "qassert.h"

#define BSP_TICKS_PER_SEC 1000

#define LED_RED   (1U << 1)
#define LED_BLUE  (1U << 2)
#define LED_GREEN (1U << 3)
Q_DEFINE_THIS_FILE

OSThread * volatile OS_curr; /* pointer to the current thread */
OSThread * volatile OS_next; /* pointer to the next thread to run */

OSThread *OS_thread[32+1];
uint32_t OS_readySet;/*bit mask of thread that are ready to run */
uint32_t OS_delayedSet;/*bit mask of thread that are delayed */


uint8_t __clz(uint32_t x)
{
	/* shift upper half down, rest is filled up with 0s */
	uint16_t upper = (x >> 16); 
	// mask upper half away
	uint16_t lower = (x & 0xFFFF);
	return upper ? __clz(upper) : 16 + __clz(lower);
}

#define LOG2(x)(32U - __clz(x))/*00000000 11000000 11000000 11000000 = (32-8) = 24*/


OSThread idleThread;
void main_idleThread() {
    while (1) {
        OS_onIdle();
    }
}

void OS_init(void *stkSto, uint32_t stkSize) {
    /* set the PendSV interrupt priority to the lowest level 0xFF */
    *(uint32_t volatile *)0xE000ED20 |= (0xFFU << 16);
	
	OSThread_start(&idleThread,
					0U,
                   &main_idleThread,
                   stkSto, stkSize);
}

void OS_sched(void) {
    /* OS_next = ... */
		if(OS_readySet ==0U){
			OS_next = OS_thread[0]; /*the idle thread*/
		}else{
			OS_next = OS_thread[LOG2(OS_readySet)];
			// Q_ASSERT(OS_next != (OSThread*)0);
		}

    if (OS_next != OS_curr) {
        *(uint32_t volatile *)0xE000ED04 = (1U << 28);
    }
}

void OS_delay(uint32_t ticks) {
	uint32_t bit;
   __disable_irq();
	
	/*never call OS_delay from idle thread */
	// Q_REQUIRE(OS_curr!=OS_thread[0]);

	OS_curr->timeout = ticks;
	bit = (1U << (OS_curr->prio-1U));
	OS_readySet &= ~bit;
	OS_delayedSet |= bit;
	
	OS_sched();
	__enable_irq();
}


void OS_run(void){
	OS_onStartup();
	
	__disable_irq();
    OS_sched();
    __enable_irq();
	
	// Q_ERROR();
}


void OS_tick(void){
	uint32_t workingSet = OS_delayedSet;
	while(workingSet!=0U){
		OSThread* t = OS_thread[LOG2(workingSet)];
		uint32_t bit;
		// Q_ASSERT((t!=(OSThread*)0) && (t->timeout!=0U));
		
		bit = (1U<<(t->prio-1U));
		
		--t->timeout;
		if(t->timeout ==0U){
			OS_readySet |= bit; /* insert into ready set */
			OS_delayedSet &= ~bit; /* remove from delayed set */
		}
		workingSet &= ~bit; /* remove from  working set*/
	}
}

void OSThread_start(
    OSThread *me,
		uint8_t prio,
    OSThreadHandler threadHandler,
    void *stkSto, uint32_t stkSize)
{
    /* round down the stack top to the 8-byte boundary
    * NOTE: ARM Cortex-M stack grows down from hi -> low memory
    */
    uint32_t *sp = (uint32_t *)((((uint32_t)stkSto + stkSize) / 8) * 8);
    uint32_t *stk_limit;
	
	// Q_REQUIRE((prio<Q_DIM(OS_thread)) 
		//    && (OS_thread[prio] == (OSThread*)0));
    
    *(--sp) = (1U << 24);  /* xPSR */
    *(--sp) = (uint32_t)threadHandler; /* PC */
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
		OS_thread[prio] = me;
		me->prio = prio;
		if(prio >0U ){
			OS_readySet |= (1U<<(prio-1U));
		}
}


void PendSV_Handler(void) {
   	// __asm__ __volatile__ ("IMPORT  OS_curr");  /* extern variable */
    // __asm__ __volatile__ ("IMPORT  OS_next");  /* extern variable */
   
    /* __disable_irq(); */
    __asm__ __volatile__ ("CPSID         I");

    /* if (OS_curr != (OSThread *)0) { */ 
    __asm__ __volatile__ ("LDR           r1,=OS_curr");
    __asm__ __volatile__ ("LDR           r1,[r1,#0x00]");
    __asm__ __volatile__ ("CBZ           r1,PendSV_restore");

    /*     push registers r4-r11 on the stack */
    __asm__ __volatile__ ("PUSH          {r4-r11}");    

    /*     OS_curr->sp = sp; */ 
    __asm__ __volatile__ ("LDR           r1,=OS_curr");
    __asm__ __volatile__ ("LDR           r1,[r1,#0x00]");
    __asm__ __volatile__ ("STR           sp,[r1,#0x00]");
    /* } */

	__asm__ __volatile__ ("PendSV_restore:");    
    /* sp = OS_next->sp; */
    __asm__ __volatile__ ("LDR           r1,=OS_next");
    __asm__ __volatile__ ("LDR           r1,[r1,#0x00]");
    __asm__ __volatile__ ("LDR           sp,[r1,#0x00]");

    /* OS_curr = OS_next; */
    __asm__ __volatile__ ("LDR           r1,=OS_next");
    __asm__ __volatile__ ("LDR           r1,[r1,#0x00]");
    __asm__ __volatile__ ("LDR           r2,=OS_curr");
    __asm__ __volatile__ ("STR           r1,[r2,#0x00]");

    /* pop registers r4-r11 */ 
    __asm__ __volatile__ ("POP           {r4-r11}");   

    /* __enable_irq(); */
    __asm__ __volatile__ ("CPSIE         I");

    /* return to the next thread */
    __asm__ __volatile__ ("BX            lr");    
}

void OS_onStartup(void){
    SystemCoreClockUpdate();
    SysTick_Config(SystemCoreClock / BSP_TICKS_PER_SEC);

    /* set the SysTick interrupt priority (highest) */
    NVIC_SetPriority(SysTick_IRQn, 0U);
}

void OS_onIdle(void){
	__WFI(); /* stop the cpu and wait for interrupt */
}

void SysTick_Handler(void) {
    OS_tick();
    __disable_irq();
    OS_sched();
    __enable_irq();
}

static uint32_t volatile l_tickCtr;


void BSP_init(void) {
    SYSCTL->RCGCGPIO  |= (1U << 5); /* enable Run mode for GPIOF */
    SYSCTL->GPIOHBCTL |= (1U << 5); /* enable AHB for GPIOF */
    GPIOF_AHB->DIR |= (LED_RED | LED_BLUE | LED_GREEN);
    GPIOF_AHB->DEN |= (LED_RED | LED_BLUE | LED_GREEN);
}


void BSP_ledRedOn(void) {
    GPIOF_AHB->DATA_Bits[LED_RED] = LED_RED;
}

void BSP_ledRedOff(void) {
    GPIOF_AHB->DATA_Bits[LED_RED] = 0U;
}

void BSP_ledBlueOn(void) {
    GPIOF_AHB->DATA_Bits[LED_BLUE] = LED_BLUE;
}

void BSP_ledBlueOff(void) {
    GPIOF_AHB->DATA_Bits[LED_BLUE] = 0U;
}

void BSP_ledGreenOn(void) {
    GPIOF_AHB->DATA_Bits[LED_GREEN] = LED_GREEN;
}

void BSP_ledGreenOff(void) {
    GPIOF_AHB->DATA_Bits[LED_GREEN] = 0U;
}