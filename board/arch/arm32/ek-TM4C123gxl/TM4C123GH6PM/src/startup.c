#include <stdint.h>
#include "../include/startup.h"

// +-----------------------------------------------------------------------------------+
// +										            Vector Table                                       +
// +-----------------------------------------------------------------------------------+
typedef void (*element_t)(void);

/* Defines a type for the vector table */
typedef union {
    element_t isr;   //all ISRs use this type
    void *stack_top; //pointer to top of the stack
} vector_table_t;

// +-----------------------------------------------------------------------------------+
// +					External Variables declaration					               +
// +-----------------------------------------------------------------------------------+

__attribute__((section(".vector_table"))) //marks this vector table as a part of the section "".vector_table"
//in the linker script
const vector_table_t vectors[] = {
    {.stack_top = &_stack_ptr}, // 0    Pointer to top of Stack
    Reset_Handler,              // 1    Reset handler is called when the <RESET> button is pressed
    NMI_Handler,                // 2    Non-Maskable Interrupt handler
    HardFault_Handler,          // 3    Hard Fault Handler
    MemManage_Handler,          // 4    Memory management fault Handler
    BusFault_Handler,           // 5    Bus Fault Handler
    UsageFault_Handler,         // 6    Usage Fault Handler
    0,                          // 7    Reserved
    0,                          // 8    Reserved
    0,                          // 9    Reserved
    0,                          // 10   Reserved
    SVC_Handler,                // 11   SuperVisor Call Handler
    DebugMon_Handler,           // 12   Debug Monitor Handler
    0,                          // 13   Reserved
    PendSV_Handler,             // 14   Pendeable interrupt driven request
    SysTick_Handler,            // 15   SysTick Timer handler
    GPIOPortA_IRQHandler,              // 16   GPIO Port A Interrupt Service Routine
    GPIOPortB_IRQHandler,              // 17   GPIO Port B Interrupt Service Routine
    GPIOPortC_IRQHandler,              // 18   GPIO Port C Interrupt Service Routine
    GPIOPortD_IRQHandler,              // 19   GPIO Port D Interrupt Service Routine
    GPIOPortE_IRQHandler,              // 20   GPIO Port C Interrupt Service Routine
    UART0_IRQHandler,                  // 21   UART 0
    UART1_IRQHandler,                  // 22   UART 1
    SSI0_IRQHandler,                   // 23   SPI 0
    I2C0_IRQHandler,
    PWMFault_IRQHandler,
    PWMGen0_IRQHandler,
    PWMGen1_IRQHandler,
    PWMGen2_IRQHandler,
    QEI0_IRQHandler,
    ADCSeq0_IRQHandler,
    ADCSeq1_IRQHandler,
    ADCSeq2_IRQHandler,
    ADCSeq3_IRQHandler,
    Watchdog_IRQHandler,
    Timer0A_IRQHandler,
    Timer0B_IRQHandler,
    Timer1A_IRQHandler,
    Timer1B_IRQHandler,
    Timer2A_IRQHandler,
    Timer2B_IRQHandler,
    Comp0_IRQHandler,
    Comp1_IRQHandler,
    Comp2_IRQHandler,
    SysCtrl_IRQHandler,
    FlashCtrl_IRQHandler,
    GPIOPortF_IRQHandler,
    GPIOPortG_IRQHandler,
    GPIOPortH_IRQHandler,
    UART2_IRQHandler,
    SSI1_IRQHandler,
    Timer3A_IRQHandler,
    Timer3B_IRQHandler,
    I2C1_IRQHandler,
    QEI1_IRQHandler,
    CAN0_IRQHandler,
    CAN1_IRQHandler,
    CAN2_IRQHandler,
    0,
    Hibernate_IRQHandler,
    USB0_IRQHandler,
    PWMGen3_IRQHandler,
    uDMAST_IRQHandler,
    uDMAError_IRQHandler,
    ADC1Seq0_IRQHandler,
    ADC1Seq1_IRQHandler,
    ADC1Seq2_IRQHandler,
    ADC1Seq3_IRQHandler,
    I2S0_IRQHandler,
    EBI0_IRQHandler,
    GPIOPortJ_IRQHandler,
    GPIOPortK_IRQHandler,
    GPIOPortL_IRQHandler,
    SSI2_IRQHandler,
    SSI3_IRQHandler,
    UART3_IRQHandler,
    UART4_IRQHandler,
    UART5_IRQHandler,
    UART6_IRQHandler,
    UART7_IRQHandler,
    0,
    0,
    0,
    0,
    I2C2_IRQHandler,
    I2C3_IRQHandler,
    Timer4A_IRQHandler,
    Timer4B_IRQHandler,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0, // 95 Reserved
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    Timer5A_IRQHandler,
    Timer5B_IRQHandler,
    WideTimer0A_IRQHandler,
    WideTimer0B_IRQHandler,
    WideTimer1A_IRQHandler,
    WideTimer1B_IRQHandler,
    WideTimer2A_IRQHandler,
    WideTimer2B_IRQHandler,
    WideTimer3A_IRQHandler,
    WideTimer3B_IRQHandler,
    WideTimer4A_IRQHandler,
    WideTimer4B_IRQHandler,
    WideTimer5A_IRQHandler,
    WideTimer5B_IRQHandler,
    SystemException_ISR,
    0, //123 Reserved
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    PWM1Gen0_IRQHandler,
    PWM1Gen1_IRQHandler,
    PWM1Gen2_IRQHandler,
    PWM1Gen3_IRQHandler,
    PWM1Fault_IRQHandler,
};

// +-----------------------------------------------------------------------------------+
// +                Implementations of Interrupt Service Routines                      +
// +-----------------------------------------------------------------------------------+
void Reset_Handler(void)
{

  uint32_t *src, *dest;

  /* copying of the .data values into RAM */

  src = &_etext;
  for (dest = &_data; dest < &_edata;)
  {
    *dest++ = *src++;
  }

  /* initializing .bss values to zero*/

  for (dest = &_bss; dest < &_ebss;)
  {
    *dest++ = 0;
  }

  /* your program's main() called */
  main();
}


void NMI_Handler(void){}
void MemManage_Handler(void){}
void BusFault_Handler(void){}
void UsageFault_Handler(void){}
void HardFault_Handler(void){}
void SVC_Handler(void){}
void DebugMon_Handler(void){}
void GPIOPortA_IRQHandler(void){}
void GPIOPortB_IRQHandler(void){}
void GPIOPortC_IRQHandler(void){}
void GPIOPortD_IRQHandler(void){}
void GPIOPortE_IRQHandler(void){}
void UART0_IRQHandler(void){}
void UART1_IRQHandler(void){}
void SSI0_IRQHandler(void){}
void I2C0_IRQHandler(void){}
void PWMFault_IRQHandler(void){}
void PWMGen0_IRQHandler(void){}
void PWMGen1_IRQHandler(void){}
void PWMGen2_IRQHandler(void){}
void QEI0_IRQHandler(void){}
void ADCSeq0_IRQHandler(void){}
void ADCSeq1_IRQHandler(void){}
void ADCSeq2_IRQHandler(void){}
void ADCSeq3_IRQHandler(void){}
void Watchdog_IRQHandler(void){}
void Timer0A_IRQHandler(void){}
void Timer0B_IRQHandler(void){}
void Timer1A_IRQHandler(void){}
void Timer1B_IRQHandler(void){}
void Timer2A_IRQHandler(void){}
void Timer2B_IRQHandler(void){}
void Comp0_IRQHandler(void){}
void Comp1_IRQHandler(void){}
void Comp2_IRQHandler(void){}
void SysCtrl_IRQHandler(void){}
void FlashCtrl_IRQHandler(void){}
void GPIOPortF_IRQHandler(void){}
void GPIOPortG_IRQHandler(void){}
void GPIOPortH_IRQHandler(void){}
void UART2_IRQHandler(void){}
void SSI1_IRQHandler(void){}
void Timer3A_IRQHandler(void){}
void Timer3B_IRQHandler(void){}
void I2C1_IRQHandler(void){}
void QEI1_IRQHandler(void){}
void CAN0_IRQHandler(void){}
void CAN1_IRQHandler(void){}
void CAN2_IRQHandler(void){}
void Hibernate_IRQHandler(void){}
void USB0_IRQHandler(void){}
void PWMGen3_IRQHandler(void){}
void uDMAST_IRQHandler(void){}
void uDMAError_IRQHandler(void){}
void ADC1Seq0_IRQHandler(void){}
void ADC1Seq1_IRQHandler(void){}
void ADC1Seq2_IRQHandler(void){}
void ADC1Seq3_IRQHandler(void){}
void I2S0_IRQHandler(void){}
void EBI0_IRQHandler(void){}
void GPIOPortJ_IRQHandler(void){}
void GPIOPortK_IRQHandler(void){}
void GPIOPortL_IRQHandler(void){}
void SSI2_IRQHandler(void){}
void SSI3_IRQHandler(void){}
void UART3_IRQHandler(void){}
void UART4_IRQHandler(void){}
void UART5_IRQHandler(void){}
void UART6_IRQHandler(void){}
void UART7_IRQHandler(void){}
void I2C2_IRQHandler(void){}
void I2C3_IRQHandler(void){}
void Timer4A_IRQHandler(void){}
void Timer4B_IRQHandler(void){}
void Timer5A_IRQHandler(void){}
void Timer5B_IRQHandler(void){}
void WideTimer0A_IRQHandler(void){}
void WideTimer0B_IRQHandler(void){}
void WideTimer1A_IRQHandler(void){}
void WideTimer1B_IRQHandler(void){}
void WideTimer2A_IRQHandler(void){}
void WideTimer2B_IRQHandler(void){}
void WideTimer3A_IRQHandler(void){}
void WideTimer3B_IRQHandler(void){}
void WideTimer4A_IRQHandler(void){}
void WideTimer4B_IRQHandler(void){}
void WideTimer5A_IRQHandler(void){}
void WideTimer5B_IRQHandler(void){}
void FPU_IRQHandler(void){}
void PECI0_IRQHandler(void){}
void LPC0_IRQHandler(void){}
void I2C4_IRQHandler(void){}
void I2C5_IRQHandler(void){}
void GPIOPortM_IRQHandler(void){}
void GPIOPortN_IRQHandler(void){}
void QEI2_IRQHandler(void){}
void Fan0_IRQHandler(void){}
void GPIOPortP0_IRQHandler(void){}
void GPIOPortP1_IRQHandler(void){}
void GPIOPortP2_IRQHandler(void){}
void GPIOPortP3_IRQHandler(void){}
void GPIOPortP4_IRQHandler(void){}
void GPIOPortP5_IRQHandler(void){}
void GPIOPortP6_IRQHandler(void){}
void GPIOPortP7_IRQHandler(void){}
void GPIOPortQ0_IRQHandler(void){}
void GPIOPortQ1_IRQHandler(void){}
void GPIOPortQ2_IRQHandler(void){}
void GPIOPortQ3_IRQHandler(void){}
void GPIOPortQ4_IRQHandler(void){}
void GPIOPortQ5_IRQHandler(void){}
void GPIOPortQ6_IRQHandler(void){}
void GPIOPortQ7_IRQHandler(void){}
void GPIOPortR_IRQHandler(void){}
void GPIOPortS_IRQHandler(void){}
void PWM1Gen0_IRQHandler(void){}
void PWM1Gen1_IRQHandler(void){}
void PWM1Gen2_IRQHandler(void){}
void PWM1Gen3_IRQHandler(void){}
void PWM1Fault_IRQHandler(void){}
void SystemException_ISR(void){}
/*****************************************END OF FILE*********************************************/
