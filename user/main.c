#include <stdint.h>
#include "../include/os_thread.h"
#include "../bsp/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/bsp.H"

#include "../include/os_semaphore.h"

/* define binary semaphore */
OSBinarySemaphore* binSem;

uint32_t stack_blinky1[40];
OSThread blinky1;
void main_blinky1() {
    while (1) {

        /* wait */
        OSBinarySemaphore_acquire(binSem);

        BSP_ledGreenOn();
        OS_delay(BSP_TICKS_PER_SEC / 4U);
        BSP_ledGreenOff();
        OS_delay(BSP_TICKS_PER_SEC * 3U / 4U);
    }
}

uint32_t stack_blinky2[40];
OSThread blinky2;
void main_blinky2() {
    while (1) {
        BSP_ledBlueOn();
        OS_delay(BSP_TICKS_PER_SEC / 2U);
        BSP_ledBlueOff();
        OS_delay(BSP_TICKS_PER_SEC / 3U);

        /* enable binsem */
        OSBinarySemaphore_release(binSem);
    }
}

uint32_t stack_blinky3[40];
OSThread blinky3;
void main_blinky3() {
    while (1) {
        BSP_ledRedOn();
        OS_delay(BSP_TICKS_PER_SEC / 2U);
        BSP_ledRedOff();
        OS_delay(BSP_TICKS_PER_SEC *3U / 5U);
    }
}

uint32_t stack_idleThread[40];
int main() {
    BSP_init();
    OS_init(&stack_idleThread,sizeof(stack_idleThread));

    /* create binary semaphore */
    OSBinarySemaphore_create(binSem,NOT_AVIALIABLE);

    OSThread_start(&blinky1,
										5U,
                   &main_blinky1,
                   stack_blinky1, sizeof(stack_blinky1));

    OSThread_start(&blinky2,
										2U,
                   &main_blinky2,
                   stack_blinky2, sizeof(stack_blinky2));
	
    OSThread_start(&blinky3,
										3U,
                   &main_blinky3,
                   stack_blinky3, sizeof(stack_blinky3));

    OS_run();
    //return 0;
}























