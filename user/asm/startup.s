	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"startup.c"
	.text
	.global	vectors
	.section	.vector_table,"a",%progbits
	.align	2
	.type	vectors, %object
	.size	vectors, 616
vectors:
	.word	_stack_ptr
	.word	Reset_Handler
	.word	NMI_Handler
	.word	HardFault_Handler
	.word	MemManage_Handler
	.word	BusFault_Handler
	.word	UsageFault_Handler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	SVC_Handler
	.word	DebugMon_Handler
	.word	0
	.word	PendSV_Handler
	.word	SysTick_Handler
	.word	GPIOPortA_IRQHandler
	.word	GPIOPortB_IRQHandler
	.word	GPIOPortC_IRQHandler
	.word	GPIOPortD_IRQHandler
	.word	GPIOPortE_IRQHandler
	.word	UART0_IRQHandler
	.word	UART1_IRQHandler
	.word	SSI0_IRQHandler
	.word	I2C0_IRQHandler
	.word	PWMFault_IRQHandler
	.word	PWMGen0_IRQHandler
	.word	PWMGen1_IRQHandler
	.word	PWMGen2_IRQHandler
	.word	QEI0_IRQHandler
	.word	ADCSeq0_IRQHandler
	.word	ADCSeq1_IRQHandler
	.word	ADCSeq2_IRQHandler
	.word	ADCSeq3_IRQHandler
	.word	Watchdog_IRQHandler
	.word	Timer0A_IRQHandler
	.word	Timer0B_IRQHandler
	.word	Timer1A_IRQHandler
	.word	Timer1B_IRQHandler
	.word	Timer2A_IRQHandler
	.word	Timer2B_IRQHandler
	.word	Comp0_IRQHandler
	.word	Comp1_IRQHandler
	.word	Comp2_IRQHandler
	.word	SysCtrl_IRQHandler
	.word	FlashCtrl_IRQHandler
	.word	GPIOPortF_IRQHandler
	.word	GPIOPortG_IRQHandler
	.word	GPIOPortH_IRQHandler
	.word	UART2_IRQHandler
	.word	SSI1_IRQHandler
	.word	Timer3A_IRQHandler
	.word	Timer3B_IRQHandler
	.word	I2C1_IRQHandler
	.word	QEI1_IRQHandler
	.word	CAN0_IRQHandler
	.word	CAN1_IRQHandler
	.word	CAN2_IRQHandler
	.word	0
	.word	Hibernate_IRQHandler
	.word	USB0_IRQHandler
	.word	PWMGen3_IRQHandler
	.word	uDMAST_IRQHandler
	.word	uDMAError_IRQHandler
	.word	ADC1Seq0_IRQHandler
	.word	ADC1Seq1_IRQHandler
	.word	ADC1Seq2_IRQHandler
	.word	ADC1Seq3_IRQHandler
	.word	I2S0_IRQHandler
	.word	EBI0_IRQHandler
	.word	GPIOPortJ_IRQHandler
	.word	GPIOPortK_IRQHandler
	.word	GPIOPortL_IRQHandler
	.word	SSI2_IRQHandler
	.word	SSI3_IRQHandler
	.word	UART3_IRQHandler
	.word	UART4_IRQHandler
	.word	UART5_IRQHandler
	.word	UART6_IRQHandler
	.word	UART7_IRQHandler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	I2C2_IRQHandler
	.word	I2C3_IRQHandler
	.word	Timer4A_IRQHandler
	.word	Timer4B_IRQHandler
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	Timer5A_IRQHandler
	.word	Timer5B_IRQHandler
	.word	WideTimer0A_IRQHandler
	.word	WideTimer0B_IRQHandler
	.word	WideTimer1A_IRQHandler
	.word	WideTimer1B_IRQHandler
	.word	WideTimer2A_IRQHandler
	.word	WideTimer2B_IRQHandler
	.word	WideTimer3A_IRQHandler
	.word	WideTimer3B_IRQHandler
	.word	WideTimer4A_IRQHandler
	.word	WideTimer4B_IRQHandler
	.word	WideTimer5A_IRQHandler
	.word	WideTimer5B_IRQHandler
	.word	SystemException_ISR
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	PWM1Gen0_IRQHandler
	.word	PWM1Gen1_IRQHandler
	.word	PWM1Gen2_IRQHandler
	.word	PWM1Gen3_IRQHandler
	.word	PWM1Fault_IRQHandler
	.text
	.align	2
	.global	Reset_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Reset_Handler, %function
Reset_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L6
	str	r3, [fp, #-8]
	ldr	r3, .L6+4
	str	r3, [fp, #-12]
	b	.L2
.L3:
	ldr	r2, [fp, #-8]
	add	r3, r2, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-12]
	add	r1, r3, #4
	str	r1, [fp, #-12]
	ldr	r2, [r2]
	str	r2, [r3]
.L2:
	ldr	r3, [fp, #-12]
	ldr	r2, .L6+8
	cmp	r3, r2
	bcc	.L3
	ldr	r3, .L6+12
	str	r3, [fp, #-12]
	b	.L4
.L5:
	ldr	r3, [fp, #-12]
	add	r2, r3, #4
	str	r2, [fp, #-12]
	mov	r2, #0
	str	r2, [r3]
.L4:
	ldr	r3, [fp, #-12]
	ldr	r2, .L6+16
	cmp	r3, r2
	bcc	.L5
	bl	os_on_startup
	bl	main
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	_etext
	.word	_data
	.word	_edata
	.word	_bss
	.word	_ebss
	.size	Reset_Handler, .-Reset_Handler
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
