#include <stdint.h>
#include "../include/bsp.h"
#include "TM4C123GH6PM.h"

extern void os_init(void);
void system_init(void){
    SystemCoreClockUpdate();
    SysTick_Config(SystemCoreClock / BSP_TICKS_PER_SEC);
    /* set the SysTick interrupt priority (highest) */
    NVIC_SetPriority(SysTick_IRQn, 0U);

    os_init();
}

void delay(uint32_t tick){
    l_tickCtr = tick;
    while(l_tickCtr!=0);
}



void bsp_init(void){
	SYS_CTRL_RCGC2 |= CLK_GPIOF;
   	PORTF_DIR |= 0x0000000E;    //set PF1, PF2, PF3 as output
   	PORTF_DEN |= 0x0000000E;    //enable PF1, PF2, PF3
   	PORTF_DATA = 0;
}

void light_red_on(void){
	PORTF_DATA |= (PF1);
}
void light_green_on(void){
	PORTF_DATA |= (PF3);
}
void light_blue_on(void){
	PORTF_DATA |= (PF2);
}

void light_red_off(void){
	PORTF_DATA &= ~(PF1);
}
void light_green_off(void){
	PORTF_DATA &= ~(PF3);
}
void light_blue_off(void){
	PORTF_DATA &= ~(PF2);
}