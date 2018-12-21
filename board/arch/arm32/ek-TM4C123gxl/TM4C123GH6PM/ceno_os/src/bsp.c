#include <stdint.h>
#include "../include/bsp.h"
#include "TM4C123GH6PM.h"

void system_init(void){
    SystemCoreClockUpdate();
    SysTick_Config(SystemCoreClock / BSP_TICKS_PER_SEC);
    /* set the SysTick interrupt priority (highest) */
    NVIC_SetPriority(SysTick_IRQn, 0U);
}

void delay(uint32_t tick){
    while(l_tickCtr<tick){
    }
    l_tickCtr = 0;
}
