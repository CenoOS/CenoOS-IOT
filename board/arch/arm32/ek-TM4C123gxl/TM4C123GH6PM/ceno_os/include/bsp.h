#ifndef __CENO_RTOS_BSP_H__
#define __CENO_RTOS_BSP_H__

void bsp_init(void);
void enable_irq(void);
void disable_irq(void);

void light_red_on(void);
void light_green_on(void);
void light_blue_on(void);

void light_red_off(void);
void light_green_off(void);
void light_blue_off(void);

typedef long clock_t;
extern volatile clock_t* l_tickCtr;

void system_init(void);
void delay_block(clock_t tick);

#endif