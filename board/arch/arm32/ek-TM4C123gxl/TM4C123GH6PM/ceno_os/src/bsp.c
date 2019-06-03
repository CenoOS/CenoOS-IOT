#include "../include/bsp.h"
#include "../include/uart_debug.h"
#include "TM4C123GH6PM.h"

#define BSP_TICKS_PER_SEC 1
static clock_t tickCtr = 0;
volatile clock_t* l_tickCtr = &tickCtr;

void os_on_startup(void){
    SystemCoreClockUpdate();
    SysTick_Config(SystemCoreClock / BSP_TICKS_PER_SEC);
    /* set the SysTick interrupt priority (highest) */
    NVIC_SetPriority(SysTick_IRQn, 0U);
	enable_irq();
}

void disable_irq(void){
	__asm	(
		"CPSID	I\n\t"
	);
}

void enable_irq(void){
	__asm	(
		"CPSIE	I\n\t"
	);
}

int volatile counter = 0;

void delay_block(clock_t tick){
   *l_tickCtr = tick;
    while((*l_tickCtr)>0);
}



void bsp_init(void){
	SYSCTL->RCGCGPIO |= (1<<5); // enable clock on PortF
	GPIOF->DIR = (1<<1) | (1<<2) | (1<<3); // make LED Pins PF1, PF2, PF3 outputs
	GPIOF->DEN = (1<<1) | (1<<2) | (1<<3); // enable degital function on LED pins;
	GPIOF->DATA &= ~((1<<1) | (1<<2) | (1<<3)); // turn off leds
	uart_debug_init();
	disable_irq();
}

void light_red_on(void){
	GPIOF->DATA = (1<<1);
}
void light_green_on(void){
	GPIOF->DATA = (1<<3);
}
void light_blue_on(void){
	GPIOF->DATA = (1<<2);
}

void light_red_off(void){
	GPIOF->DATA &= ~(1<<1);
}
void light_green_off(void){
	GPIOF->DATA &= ~(1<<3);
}
void light_blue_off(void){
	GPIOF->DATA &= ~(1<<2);
}