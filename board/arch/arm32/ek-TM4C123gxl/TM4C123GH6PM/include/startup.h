#ifndef __START_UP_H__
#define __START_UP_H__

//main() of your program
extern int main(void);
extern void system_init(void);


//stack pointer
extern uint32_t _stack_ptr;
//.text/code,stored in Flash
extern uint32_t _etext;
//.data,copied into RAM on boot
extern uint32_t _data;
extern uint32_t _edata;
//.bss,unitialized variables
extern uint32_t _bss;
extern uint32_t _ebss;


void Reset_Handler(void);
extern void NMI_Handler(void);
extern void HardFault_Handler(void);
extern void MemManage_Handler(void);
extern void BusFault_Handler(void);
extern void UsageFault_Handler(void);
extern void HardFault_Handler(void);
extern void SysTick_Handler(void);
extern void SVC_Handler(void);
extern void DebugMon_Handler(void);
extern void PendSV_Handler(void);

extern void GPIOPortA_IRQHandler(void);
extern void GPIOPortB_IRQHandler(void);
extern void GPIOPortC_IRQHandler(void);
extern void GPIOPortD_IRQHandler(void);
extern void GPIOPortE_IRQHandler(void);
extern void UART0_IRQHandler(void);
extern void UART1_IRQHandler(void);
extern void SSI0_IRQHandler(void);
extern void I2C0_IRQHandler(void);
extern void PWMFault_IRQHandler(void);
extern void PWMGen0_IRQHandler(void);
extern void PWMGen1_IRQHandler(void);
extern void PWMGen2_IRQHandler(void);
extern void QEI0_IRQHandler(void);
extern void ADCSeq0_IRQHandler(void);
extern void ADCSeq1_IRQHandler(void);
extern void ADCSeq2_IRQHandler(void);
extern void ADCSeq3_IRQHandler(void);
extern void Watchdog_IRQHandler(void);
extern void Timer0A_IRQHandler(void);
extern void Timer0B_IRQHandler(void);
extern void Timer1A_IRQHandler(void);
extern void Timer1B_IRQHandler(void);
extern void Timer2A_IRQHandler(void);
extern void Timer2B_IRQHandler(void);
extern void Comp0_IRQHandler(void);
extern void Comp1_IRQHandler(void);
extern void Comp2_IRQHandler(void);
extern void SysCtrl_IRQHandler(void);
extern void FlashCtrl_IRQHandler(void);
extern void GPIOPortF_IRQHandler(void);
extern void GPIOPortG_IRQHandler(void);
extern void GPIOPortH_IRQHandler(void);
extern void UART2_IRQHandler(void);
extern void SSI1_IRQHandler(void);
extern void Timer3A_IRQHandler(void);
extern void Timer3B_IRQHandler(void);
extern void I2C1_IRQHandler(void);
extern void QEI1_IRQHandler(void);
extern void CAN0_IRQHandler(void);
extern void CAN1_IRQHandler(void);
extern void CAN2_IRQHandler(void);
extern void Hibernate_IRQHandler(void);
extern void USB0_IRQHandler(void);
extern void PWMGen3_IRQHandler(void);
extern void uDMAST_IRQHandler(void);
extern void uDMAError_IRQHandler(void);
extern void ADC1Seq0_IRQHandler(void);
extern void ADC1Seq1_IRQHandler(void);
extern void ADC1Seq2_IRQHandler(void);
extern void ADC1Seq3_IRQHandler(void);
extern void I2S0_IRQHandler(void);
extern void EBI0_IRQHandler(void);
extern void GPIOPortJ_IRQHandler(void);
extern void GPIOPortK_IRQHandler(void);
extern void GPIOPortL_IRQHandler(void);
extern void SSI2_IRQHandler(void);
extern void SSI3_IRQHandler(void);
extern void UART3_IRQHandler(void);
extern void UART4_IRQHandler(void);
extern void UART5_IRQHandler(void);
extern void UART6_IRQHandler(void);
extern void UART7_IRQHandler(void);
extern void I2C2_IRQHandler(void);
extern void I2C3_IRQHandler(void);
extern void Timer4A_IRQHandler(void);
extern void Timer4B_IRQHandler(void);
extern void Timer5A_IRQHandler(void);
extern void Timer5B_IRQHandler(void);
extern void WideTimer0A_IRQHandler(void);
extern void WideTimer0B_IRQHandler(void);
extern void WideTimer1A_IRQHandler(void);
extern void WideTimer1B_IRQHandler(void);
extern void WideTimer2A_IRQHandler(void);
extern void WideTimer2B_IRQHandler(void);
extern void WideTimer3A_IRQHandler(void);
extern void WideTimer3B_IRQHandler(void);
extern void WideTimer4A_IRQHandler(void);
extern void WideTimer4B_IRQHandler(void);
extern void WideTimer5A_IRQHandler(void);
extern void WideTimer5B_IRQHandler(void);
extern void FPU_IRQHandler(void);
extern void PECI0_IRQHandler(void);
extern void LPC0_IRQHandler(void);
extern void I2C4_IRQHandler(void);
extern void I2C5_IRQHandler(void);
extern void GPIOPortM_IRQHandler(void);
extern void GPIOPortN_IRQHandler(void);
extern void QEI2_IRQHandler(void);
extern void Fan0_IRQHandler(void);
extern void GPIOPortP0_IRQHandler(void);
extern void GPIOPortP1_IRQHandler(void);
extern void GPIOPortP2_IRQHandler(void);
extern void GPIOPortP3_IRQHandler(void);
extern void GPIOPortP4_IRQHandler(void);
extern void GPIOPortP5_IRQHandler(void);
extern void GPIOPortP6_IRQHandler(void);
extern void GPIOPortP7_IRQHandler(void);
extern void GPIOPortQ0_IRQHandler(void);
extern void GPIOPortQ1_IRQHandler(void);
extern void GPIOPortQ2_IRQHandler(void);
extern void GPIOPortQ3_IRQHandler(void);
extern void GPIOPortQ4_IRQHandler(void);
extern void GPIOPortQ5_IRQHandler(void);
extern void GPIOPortQ6_IRQHandler(void);
extern void GPIOPortQ7_IRQHandler(void);
extern void GPIOPortR_IRQHandler(void);
extern void GPIOPortS_IRQHandler(void);
extern void PWM1Gen0_IRQHandler(void);
extern void PWM1Gen1_IRQHandler(void);
extern void PWM1Gen2_IRQHandler(void);
extern void PWM1Gen3_IRQHandler(void);
extern void PWM1Fault_IRQHandler(void);
extern void SystemException_ISR(void);

#endif 