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
    while(l_tickCtr<tick){
    }
    l_tickCtr = 0;
}
