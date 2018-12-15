#ifndef __BSP_H__
#define __BSP_H__

/* system clock tick [Hz] */
#define BSP_TICKS_PER_SEC 100U

void BSP_init(void);
void BSP_ledRedOn(void);
void BSP_ledRedOff(void);
void BSP_ledBlueOn(void);
void BSP_ledBlueOff(void);
void BSP_ledGreenOn(void);
void BSP_ledGreenOff(void);

extern void OS_tick(void);
extern void OS_sched(void);

#endif // __BSP_H__
