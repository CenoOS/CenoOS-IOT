#ifndef __CENO_RTOS_BSP_H__
#define __CENO_RTOS_BSP_H__

#define BSP_TICKS_PER_SEC 1000U

typedef long clock_t;
static volatile clock_t l_tickCtr = 0;

void system_init(void);

#endif