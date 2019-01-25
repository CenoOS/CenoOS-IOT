#ifndef __CENO_RTOS_BSP_H__
#define __CENO_RTOS_BSP_H__

//---SYSTEM CONTROL REGISTERS---//
#define SYS_CTRL_RCGC2  (*((volatile unsigned long *)0x400FE108))   //offset of RCGC2 register is 0x108
#define CLK_GPIOF   0x20
//---GPIO-F REGISTER---//
#define PORTF_DATA  (*((volatile unsigned long *)0x40025038))   //offset of DATA register for PF1, PF2, PF3 is 0x38 [PF7:PF0::9:2]
#define PORTF_DIR   (*((volatile unsigned long *)0x40025400))   //offset of DIR register is 0x400
#define PORTF_DEN   (*((volatile unsigned long *)0x4002551C))   //offset of DEN register is 0x51C
//---PORT-F I/O---//
#define PF1 0x02
#define PF2 0x04
#define PF3 0x08

void bsp_init(void);

void light_red_on(void);
void light_green_on(void);
void light_blue_on(void);

void light_red_off(void);
void light_green_off(void);
void light_blue_off(void);

#define BSP_TICKS_PER_SEC 1000U



typedef long clock_t;
extern volatile clock_t* l_tickCtr;

void os_on_startup(void);

void disable_irq(void);
void enable_irq(void);

void delay_block(clock_t tick);

#endif