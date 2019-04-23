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
	.file	"interrupt.c"
	.text
	.align	2
	.global	SysTick_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	SysTick_Handler, %function
SysTick_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	os_tick
	ldr	r3, .L4
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L3
	ldr	r3, .L4
	ldr	r3, [r3]
	ldr	r2, [r3]
	sub	r2, r2, #1
	str	r2, [r3]
.L3:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	l_tickCtr
	.size	SysTick_Handler, .-SysTick_Handler
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[kernel] PendSV triggered.\012\015\000"
	.text
	.align	2
	.global	PendSV_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PendSV_Handler, %function
PendSV_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L7
	bl	uart_debug_print
	bl	os_task_switch_next
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC0
	.size	PendSV_Handler, .-PendSV_Handler
	.align	2
	.global	NMI_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	NMI_Handler, %function
NMI_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	NMI_Handler, .-NMI_Handler
	.align	2
	.global	MemManage_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	MemManage_Handler, %function
MemManage_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	MemManage_Handler, .-MemManage_Handler
	.align	2
	.global	BusFault_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	BusFault_Handler, %function
BusFault_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	BusFault_Handler, .-BusFault_Handler
	.align	2
	.global	UsageFault_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UsageFault_Handler, %function
UsageFault_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UsageFault_Handler, .-UsageFault_Handler
	.align	2
	.global	HardFault_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	HardFault_Handler, %function
HardFault_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	HardFault_Handler, .-HardFault_Handler
	.align	2
	.global	SVC_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	SVC_Handler, %function
SVC_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SVC_Handler, .-SVC_Handler
	.align	2
	.global	DebugMon_Handler
	.syntax unified
	.arm
	.fpu softvfp
	.type	DebugMon_Handler, %function
DebugMon_Handler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	DebugMon_Handler, .-DebugMon_Handler
	.align	2
	.global	GPIOPortA_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortA_IRQHandler, %function
GPIOPortA_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortA_IRQHandler, .-GPIOPortA_IRQHandler
	.align	2
	.global	GPIOPortB_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortB_IRQHandler, %function
GPIOPortB_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortB_IRQHandler, .-GPIOPortB_IRQHandler
	.align	2
	.global	GPIOPortC_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortC_IRQHandler, %function
GPIOPortC_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortC_IRQHandler, .-GPIOPortC_IRQHandler
	.align	2
	.global	GPIOPortD_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortD_IRQHandler, %function
GPIOPortD_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortD_IRQHandler, .-GPIOPortD_IRQHandler
	.align	2
	.global	GPIOPortE_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortE_IRQHandler, %function
GPIOPortE_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortE_IRQHandler, .-GPIOPortE_IRQHandler
	.align	2
	.global	UART0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART0_IRQHandler, %function
UART0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART0_IRQHandler, .-UART0_IRQHandler
	.align	2
	.global	UART1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART1_IRQHandler, %function
UART1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART1_IRQHandler, .-UART1_IRQHandler
	.align	2
	.global	SSI0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	SSI0_IRQHandler, %function
SSI0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SSI0_IRQHandler, .-SSI0_IRQHandler
	.align	2
	.global	I2C0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	I2C0_IRQHandler, %function
I2C0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	I2C0_IRQHandler, .-I2C0_IRQHandler
	.align	2
	.global	PWMFault_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWMFault_IRQHandler, %function
PWMFault_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWMFault_IRQHandler, .-PWMFault_IRQHandler
	.align	2
	.global	PWMGen0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWMGen0_IRQHandler, %function
PWMGen0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWMGen0_IRQHandler, .-PWMGen0_IRQHandler
	.align	2
	.global	PWMGen1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWMGen1_IRQHandler, %function
PWMGen1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWMGen1_IRQHandler, .-PWMGen1_IRQHandler
	.align	2
	.global	PWMGen2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWMGen2_IRQHandler, %function
PWMGen2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWMGen2_IRQHandler, .-PWMGen2_IRQHandler
	.align	2
	.global	QEI0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	QEI0_IRQHandler, %function
QEI0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	QEI0_IRQHandler, .-QEI0_IRQHandler
	.align	2
	.global	ADCSeq0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADCSeq0_IRQHandler, %function
ADCSeq0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADCSeq0_IRQHandler, .-ADCSeq0_IRQHandler
	.align	2
	.global	ADCSeq1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADCSeq1_IRQHandler, %function
ADCSeq1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADCSeq1_IRQHandler, .-ADCSeq1_IRQHandler
	.align	2
	.global	ADCSeq2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADCSeq2_IRQHandler, %function
ADCSeq2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADCSeq2_IRQHandler, .-ADCSeq2_IRQHandler
	.align	2
	.global	ADCSeq3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADCSeq3_IRQHandler, %function
ADCSeq3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADCSeq3_IRQHandler, .-ADCSeq3_IRQHandler
	.align	2
	.global	Watchdog_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Watchdog_IRQHandler, %function
Watchdog_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Watchdog_IRQHandler, .-Watchdog_IRQHandler
	.align	2
	.global	Timer0A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer0A_IRQHandler, %function
Timer0A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer0A_IRQHandler, .-Timer0A_IRQHandler
	.align	2
	.global	Timer0B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer0B_IRQHandler, %function
Timer0B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer0B_IRQHandler, .-Timer0B_IRQHandler
	.align	2
	.global	Timer1A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer1A_IRQHandler, %function
Timer1A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer1A_IRQHandler, .-Timer1A_IRQHandler
	.align	2
	.global	Timer1B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer1B_IRQHandler, %function
Timer1B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer1B_IRQHandler, .-Timer1B_IRQHandler
	.align	2
	.global	Timer2A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer2A_IRQHandler, %function
Timer2A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer2A_IRQHandler, .-Timer2A_IRQHandler
	.align	2
	.global	Timer2B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer2B_IRQHandler, %function
Timer2B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer2B_IRQHandler, .-Timer2B_IRQHandler
	.align	2
	.global	Comp0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Comp0_IRQHandler, %function
Comp0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Comp0_IRQHandler, .-Comp0_IRQHandler
	.align	2
	.global	Comp1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Comp1_IRQHandler, %function
Comp1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Comp1_IRQHandler, .-Comp1_IRQHandler
	.align	2
	.global	Comp2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Comp2_IRQHandler, %function
Comp2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Comp2_IRQHandler, .-Comp2_IRQHandler
	.align	2
	.global	SysCtrl_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	SysCtrl_IRQHandler, %function
SysCtrl_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SysCtrl_IRQHandler, .-SysCtrl_IRQHandler
	.align	2
	.global	FlashCtrl_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	FlashCtrl_IRQHandler, %function
FlashCtrl_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	FlashCtrl_IRQHandler, .-FlashCtrl_IRQHandler
	.align	2
	.global	GPIOPortF_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortF_IRQHandler, %function
GPIOPortF_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortF_IRQHandler, .-GPIOPortF_IRQHandler
	.align	2
	.global	GPIOPortG_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortG_IRQHandler, %function
GPIOPortG_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortG_IRQHandler, .-GPIOPortG_IRQHandler
	.align	2
	.global	GPIOPortH_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortH_IRQHandler, %function
GPIOPortH_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortH_IRQHandler, .-GPIOPortH_IRQHandler
	.align	2
	.global	UART2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART2_IRQHandler, %function
UART2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART2_IRQHandler, .-UART2_IRQHandler
	.align	2
	.global	SSI1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	SSI1_IRQHandler, %function
SSI1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SSI1_IRQHandler, .-SSI1_IRQHandler
	.align	2
	.global	Timer3A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer3A_IRQHandler, %function
Timer3A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer3A_IRQHandler, .-Timer3A_IRQHandler
	.align	2
	.global	Timer3B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer3B_IRQHandler, %function
Timer3B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer3B_IRQHandler, .-Timer3B_IRQHandler
	.align	2
	.global	I2C1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	I2C1_IRQHandler, %function
I2C1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	I2C1_IRQHandler, .-I2C1_IRQHandler
	.align	2
	.global	QEI1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	QEI1_IRQHandler, %function
QEI1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	QEI1_IRQHandler, .-QEI1_IRQHandler
	.align	2
	.global	CAN0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	CAN0_IRQHandler, %function
CAN0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	CAN0_IRQHandler, .-CAN0_IRQHandler
	.align	2
	.global	CAN1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	CAN1_IRQHandler, %function
CAN1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	CAN1_IRQHandler, .-CAN1_IRQHandler
	.align	2
	.global	CAN2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	CAN2_IRQHandler, %function
CAN2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	CAN2_IRQHandler, .-CAN2_IRQHandler
	.align	2
	.global	Hibernate_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Hibernate_IRQHandler, %function
Hibernate_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Hibernate_IRQHandler, .-Hibernate_IRQHandler
	.align	2
	.global	USB0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	USB0_IRQHandler, %function
USB0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	USB0_IRQHandler, .-USB0_IRQHandler
	.align	2
	.global	PWMGen3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWMGen3_IRQHandler, %function
PWMGen3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWMGen3_IRQHandler, .-PWMGen3_IRQHandler
	.align	2
	.global	uDMAST_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	uDMAST_IRQHandler, %function
uDMAST_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	uDMAST_IRQHandler, .-uDMAST_IRQHandler
	.align	2
	.global	uDMAError_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	uDMAError_IRQHandler, %function
uDMAError_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	uDMAError_IRQHandler, .-uDMAError_IRQHandler
	.align	2
	.global	ADC1Seq0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADC1Seq0_IRQHandler, %function
ADC1Seq0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADC1Seq0_IRQHandler, .-ADC1Seq0_IRQHandler
	.align	2
	.global	ADC1Seq1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADC1Seq1_IRQHandler, %function
ADC1Seq1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADC1Seq1_IRQHandler, .-ADC1Seq1_IRQHandler
	.align	2
	.global	ADC1Seq2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADC1Seq2_IRQHandler, %function
ADC1Seq2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADC1Seq2_IRQHandler, .-ADC1Seq2_IRQHandler
	.align	2
	.global	ADC1Seq3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	ADC1Seq3_IRQHandler, %function
ADC1Seq3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	ADC1Seq3_IRQHandler, .-ADC1Seq3_IRQHandler
	.align	2
	.global	I2S0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	I2S0_IRQHandler, %function
I2S0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	I2S0_IRQHandler, .-I2S0_IRQHandler
	.align	2
	.global	EBI0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	EBI0_IRQHandler, %function
EBI0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	EBI0_IRQHandler, .-EBI0_IRQHandler
	.align	2
	.global	GPIOPortJ_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortJ_IRQHandler, %function
GPIOPortJ_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortJ_IRQHandler, .-GPIOPortJ_IRQHandler
	.align	2
	.global	GPIOPortK_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortK_IRQHandler, %function
GPIOPortK_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortK_IRQHandler, .-GPIOPortK_IRQHandler
	.align	2
	.global	GPIOPortL_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortL_IRQHandler, %function
GPIOPortL_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortL_IRQHandler, .-GPIOPortL_IRQHandler
	.align	2
	.global	SSI2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	SSI2_IRQHandler, %function
SSI2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SSI2_IRQHandler, .-SSI2_IRQHandler
	.align	2
	.global	SSI3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	SSI3_IRQHandler, %function
SSI3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SSI3_IRQHandler, .-SSI3_IRQHandler
	.align	2
	.global	UART3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART3_IRQHandler, %function
UART3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART3_IRQHandler, .-UART3_IRQHandler
	.align	2
	.global	UART4_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART4_IRQHandler, %function
UART4_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART4_IRQHandler, .-UART4_IRQHandler
	.align	2
	.global	UART5_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART5_IRQHandler, %function
UART5_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART5_IRQHandler, .-UART5_IRQHandler
	.align	2
	.global	UART6_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART6_IRQHandler, %function
UART6_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART6_IRQHandler, .-UART6_IRQHandler
	.align	2
	.global	UART7_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	UART7_IRQHandler, %function
UART7_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	UART7_IRQHandler, .-UART7_IRQHandler
	.align	2
	.global	I2C2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	I2C2_IRQHandler, %function
I2C2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	I2C2_IRQHandler, .-I2C2_IRQHandler
	.align	2
	.global	I2C3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	I2C3_IRQHandler, %function
I2C3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	I2C3_IRQHandler, .-I2C3_IRQHandler
	.align	2
	.global	Timer4A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer4A_IRQHandler, %function
Timer4A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer4A_IRQHandler, .-Timer4A_IRQHandler
	.align	2
	.global	Timer4B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer4B_IRQHandler, %function
Timer4B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer4B_IRQHandler, .-Timer4B_IRQHandler
	.align	2
	.global	Timer5A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer5A_IRQHandler, %function
Timer5A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer5A_IRQHandler, .-Timer5A_IRQHandler
	.align	2
	.global	Timer5B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Timer5B_IRQHandler, %function
Timer5B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Timer5B_IRQHandler, .-Timer5B_IRQHandler
	.align	2
	.global	WideTimer0A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer0A_IRQHandler, %function
WideTimer0A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer0A_IRQHandler, .-WideTimer0A_IRQHandler
	.align	2
	.global	WideTimer0B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer0B_IRQHandler, %function
WideTimer0B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer0B_IRQHandler, .-WideTimer0B_IRQHandler
	.align	2
	.global	WideTimer1A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer1A_IRQHandler, %function
WideTimer1A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer1A_IRQHandler, .-WideTimer1A_IRQHandler
	.align	2
	.global	WideTimer1B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer1B_IRQHandler, %function
WideTimer1B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer1B_IRQHandler, .-WideTimer1B_IRQHandler
	.align	2
	.global	WideTimer2A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer2A_IRQHandler, %function
WideTimer2A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer2A_IRQHandler, .-WideTimer2A_IRQHandler
	.align	2
	.global	WideTimer2B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer2B_IRQHandler, %function
WideTimer2B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer2B_IRQHandler, .-WideTimer2B_IRQHandler
	.align	2
	.global	WideTimer3A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer3A_IRQHandler, %function
WideTimer3A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer3A_IRQHandler, .-WideTimer3A_IRQHandler
	.align	2
	.global	WideTimer3B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer3B_IRQHandler, %function
WideTimer3B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer3B_IRQHandler, .-WideTimer3B_IRQHandler
	.align	2
	.global	WideTimer4A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer4A_IRQHandler, %function
WideTimer4A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer4A_IRQHandler, .-WideTimer4A_IRQHandler
	.align	2
	.global	WideTimer4B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer4B_IRQHandler, %function
WideTimer4B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer4B_IRQHandler, .-WideTimer4B_IRQHandler
	.align	2
	.global	WideTimer5A_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer5A_IRQHandler, %function
WideTimer5A_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer5A_IRQHandler, .-WideTimer5A_IRQHandler
	.align	2
	.global	WideTimer5B_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	WideTimer5B_IRQHandler, %function
WideTimer5B_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	WideTimer5B_IRQHandler, .-WideTimer5B_IRQHandler
	.align	2
	.global	FPU_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	FPU_IRQHandler, %function
FPU_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	FPU_IRQHandler, .-FPU_IRQHandler
	.align	2
	.global	PECI0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PECI0_IRQHandler, %function
PECI0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PECI0_IRQHandler, .-PECI0_IRQHandler
	.align	2
	.global	LPC0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	LPC0_IRQHandler, %function
LPC0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	LPC0_IRQHandler, .-LPC0_IRQHandler
	.align	2
	.global	I2C4_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	I2C4_IRQHandler, %function
I2C4_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	I2C4_IRQHandler, .-I2C4_IRQHandler
	.align	2
	.global	I2C5_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	I2C5_IRQHandler, %function
I2C5_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	I2C5_IRQHandler, .-I2C5_IRQHandler
	.align	2
	.global	GPIOPortM_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortM_IRQHandler, %function
GPIOPortM_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortM_IRQHandler, .-GPIOPortM_IRQHandler
	.align	2
	.global	GPIOPortN_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortN_IRQHandler, %function
GPIOPortN_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortN_IRQHandler, .-GPIOPortN_IRQHandler
	.align	2
	.global	QEI2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	QEI2_IRQHandler, %function
QEI2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	QEI2_IRQHandler, .-QEI2_IRQHandler
	.align	2
	.global	Fan0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	Fan0_IRQHandler, %function
Fan0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	Fan0_IRQHandler, .-Fan0_IRQHandler
	.align	2
	.global	GPIOPortP0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP0_IRQHandler, %function
GPIOPortP0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP0_IRQHandler, .-GPIOPortP0_IRQHandler
	.align	2
	.global	GPIOPortP1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP1_IRQHandler, %function
GPIOPortP1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP1_IRQHandler, .-GPIOPortP1_IRQHandler
	.align	2
	.global	GPIOPortP2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP2_IRQHandler, %function
GPIOPortP2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP2_IRQHandler, .-GPIOPortP2_IRQHandler
	.align	2
	.global	GPIOPortP3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP3_IRQHandler, %function
GPIOPortP3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP3_IRQHandler, .-GPIOPortP3_IRQHandler
	.align	2
	.global	GPIOPortP4_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP4_IRQHandler, %function
GPIOPortP4_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP4_IRQHandler, .-GPIOPortP4_IRQHandler
	.align	2
	.global	GPIOPortP5_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP5_IRQHandler, %function
GPIOPortP5_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP5_IRQHandler, .-GPIOPortP5_IRQHandler
	.align	2
	.global	GPIOPortP6_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP6_IRQHandler, %function
GPIOPortP6_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP6_IRQHandler, .-GPIOPortP6_IRQHandler
	.align	2
	.global	GPIOPortP7_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortP7_IRQHandler, %function
GPIOPortP7_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortP7_IRQHandler, .-GPIOPortP7_IRQHandler
	.align	2
	.global	GPIOPortQ0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ0_IRQHandler, %function
GPIOPortQ0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ0_IRQHandler, .-GPIOPortQ0_IRQHandler
	.align	2
	.global	GPIOPortQ1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ1_IRQHandler, %function
GPIOPortQ1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ1_IRQHandler, .-GPIOPortQ1_IRQHandler
	.align	2
	.global	GPIOPortQ2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ2_IRQHandler, %function
GPIOPortQ2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ2_IRQHandler, .-GPIOPortQ2_IRQHandler
	.align	2
	.global	GPIOPortQ3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ3_IRQHandler, %function
GPIOPortQ3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ3_IRQHandler, .-GPIOPortQ3_IRQHandler
	.align	2
	.global	GPIOPortQ4_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ4_IRQHandler, %function
GPIOPortQ4_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ4_IRQHandler, .-GPIOPortQ4_IRQHandler
	.align	2
	.global	GPIOPortQ5_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ5_IRQHandler, %function
GPIOPortQ5_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ5_IRQHandler, .-GPIOPortQ5_IRQHandler
	.align	2
	.global	GPIOPortQ6_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ6_IRQHandler, %function
GPIOPortQ6_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ6_IRQHandler, .-GPIOPortQ6_IRQHandler
	.align	2
	.global	GPIOPortQ7_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortQ7_IRQHandler, %function
GPIOPortQ7_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortQ7_IRQHandler, .-GPIOPortQ7_IRQHandler
	.align	2
	.global	GPIOPortR_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortR_IRQHandler, %function
GPIOPortR_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortR_IRQHandler, .-GPIOPortR_IRQHandler
	.align	2
	.global	GPIOPortS_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	GPIOPortS_IRQHandler, %function
GPIOPortS_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	GPIOPortS_IRQHandler, .-GPIOPortS_IRQHandler
	.align	2
	.global	PWM1Gen0_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWM1Gen0_IRQHandler, %function
PWM1Gen0_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWM1Gen0_IRQHandler, .-PWM1Gen0_IRQHandler
	.align	2
	.global	PWM1Gen1_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWM1Gen1_IRQHandler, %function
PWM1Gen1_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWM1Gen1_IRQHandler, .-PWM1Gen1_IRQHandler
	.align	2
	.global	PWM1Gen2_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWM1Gen2_IRQHandler, %function
PWM1Gen2_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWM1Gen2_IRQHandler, .-PWM1Gen2_IRQHandler
	.align	2
	.global	PWM1Gen3_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWM1Gen3_IRQHandler, %function
PWM1Gen3_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWM1Gen3_IRQHandler, .-PWM1Gen3_IRQHandler
	.align	2
	.global	PWM1Fault_IRQHandler
	.syntax unified
	.arm
	.fpu softvfp
	.type	PWM1Fault_IRQHandler, %function
PWM1Fault_IRQHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	PWM1Fault_IRQHandler, .-PWM1Fault_IRQHandler
	.align	2
	.global	SystemException_ISR
	.syntax unified
	.arm
	.fpu softvfp
	.type	SystemException_ISR, %function
SystemException_ISR:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	SystemException_ISR, .-SystemException_ISR
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
