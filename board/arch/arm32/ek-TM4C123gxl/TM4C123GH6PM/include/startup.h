#ifndef __START_UP_H__
#define __START_UP_H__

//main() of your program
extern int main(void);


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
void NMI_Handler(void);
void HardFault_Handler(void);
void MemManage_Handler(void);
void BusFault_Handler(void);
void UsageFault_Handler(void);
void HardFault_Handler(void);
extern void SysTick_Handler(void);
void SVC_Handler(void);
void DebugMon_Handler(void);
extern void PendSV_Handler(void);

void GPIOPortA_IRQHandler(void);
void GPIOPortB_IRQHandler(void);
void GPIOPortC_IRQHandler(void);
void GPIOPortD_IRQHandler(void);
void GPIOPortE_IRQHandler(void);
void UART0_IRQHandler(void);
void UART1_IRQHandler(void);
void SSI0_IRQHandler(void);
void I2C0_IRQHandler(void);
void PWMFault_IRQHandler(void);
void PWMGen0_IRQHandler(void);
void PWMGen1_IRQHandler(void);
void PWMGen2_IRQHandler(void);
void QEI0_IRQHandler(void);
void ADCSeq0_IRQHandler(void);
void ADCSeq1_IRQHandler(void);
void ADCSeq2_IRQHandler(void);
void ADCSeq3_IRQHandler(void);
void Watchdog_IRQHandler(void);
void Timer0A_IRQHandler(void);
void Timer0B_IRQHandler(void);
void Timer1A_IRQHandler(void);
void Timer1B_IRQHandler(void);
void Timer2A_IRQHandler(void);
void Timer2B_IRQHandler(void);
void Comp0_IRQHandler(void);
void Comp1_IRQHandler(void);
void Comp2_IRQHandler(void);
void SysCtrl_IRQHandler(void);
void FlashCtrl_IRQHandler(void);
void GPIOPortF_IRQHandler(void);
void GPIOPortG_IRQHandler(void);
void GPIOPortH_IRQHandler(void);
void UART2_IRQHandler(void);
void SSI1_IRQHandler(void);
void Timer3A_IRQHandler(void);
void Timer3B_IRQHandler(void);
void I2C1_IRQHandler(void);
void QEI1_IRQHandler(void);
void CAN0_IRQHandler(void);
void CAN1_IRQHandler(void);
void CAN2_IRQHandler(void);
void Hibernate_IRQHandler(void);
void USB0_IRQHandler(void);
void PWMGen3_IRQHandler(void);
void uDMAST_IRQHandler(void);
void uDMAError_IRQHandler(void);
void ADC1Seq0_IRQHandler(void);
void ADC1Seq1_IRQHandler(void);
void ADC1Seq2_IRQHandler(void);
void ADC1Seq3_IRQHandler(void);
void I2S0_IRQHandler(void);
void EBI0_IRQHandler(void);
void GPIOPortJ_IRQHandler(void);
void GPIOPortK_IRQHandler(void);
void GPIOPortL_IRQHandler(void);
void SSI2_IRQHandler(void);
void SSI3_IRQHandler(void);
void UART3_IRQHandler(void);
void UART4_IRQHandler(void);
void UART5_IRQHandler(void);
void UART6_IRQHandler(void);
void UART7_IRQHandler(void);
void I2C2_IRQHandler(void);
void I2C3_IRQHandler(void);
void Timer4A_IRQHandler(void);
void Timer4B_IRQHandler(void);
void Timer5A_IRQHandler(void);
void Timer5B_IRQHandler(void);
void WideTimer0A_IRQHandler(void);
void WideTimer0B_IRQHandler(void);
void WideTimer1A_IRQHandler(void);
void WideTimer1B_IRQHandler(void);
void WideTimer2A_IRQHandler(void);
void WideTimer2B_IRQHandler(void);
void WideTimer3A_IRQHandler(void);
void WideTimer3B_IRQHandler(void);
void WideTimer4A_IRQHandler(void);
void WideTimer4B_IRQHandler(void);
void WideTimer5A_IRQHandler(void);
void WideTimer5B_IRQHandler(void);
void FPU_IRQHandler(void);
void PECI0_IRQHandler(void);
void LPC0_IRQHandler(void);
void I2C4_IRQHandler(void);
void I2C5_IRQHandler(void);
void GPIOPortM_IRQHandler(void);
void GPIOPortN_IRQHandler(void);
void QEI2_IRQHandler(void);
void Fan0_IRQHandler(void);
void GPIOPortP0_IRQHandler(void);
void GPIOPortP1_IRQHandler(void);
void GPIOPortP2_IRQHandler(void);
void GPIOPortP3_IRQHandler(void);
void GPIOPortP4_IRQHandler(void);
void GPIOPortP5_IRQHandler(void);
void GPIOPortP6_IRQHandler(void);
void GPIOPortP7_IRQHandler(void);
void GPIOPortQ0_IRQHandler(void);
void GPIOPortQ1_IRQHandler(void);
void GPIOPortQ2_IRQHandler(void);
void GPIOPortQ3_IRQHandler(void);
void GPIOPortQ4_IRQHandler(void);
void GPIOPortQ5_IRQHandler(void);
void GPIOPortQ6_IRQHandler(void);
void GPIOPortQ7_IRQHandler(void);
void GPIOPortR_IRQHandler(void);
void GPIOPortS_IRQHandler(void);
void PWM1Gen0_IRQHandler(void);
void PWM1Gen1_IRQHandler(void);
void PWM1Gen2_IRQHandler(void);
void PWM1Gen3_IRQHandler(void);
void PWM1Fault_IRQHandler(void);
void SystemException_ISR(void);

#endif 