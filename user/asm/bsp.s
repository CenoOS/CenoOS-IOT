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
	.file	"bsp.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	__NVIC_SetPriority, %function
__NVIC_SetPriority:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	str	r1, [fp, #-12]
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	blt	.L2
	ldr	r3, [fp, #-12]
	and	r2, r3, #255
	ldr	r1, .L5
	ldrsh	r3, [fp, #-6]
	lsl	r2, r2, #5
	and	r2, r2, #255
	add	r3, r1, r3
	strb	r2, [r3, #768]
	b	.L4
.L2:
	ldr	r3, [fp, #-12]
	and	r2, r3, #255
	ldr	r1, .L5+4
	ldrh	r3, [fp, #-6]
	and	r3, r3, #15
	sub	r3, r3, #4
	lsl	r2, r2, #5
	and	r2, r2, #255
	add	r3, r1, r3
	strb	r2, [r3, #24]
.L4:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L6:
	.align	2
.L5:
	.word	-536813312
	.word	-536810240
	.size	__NVIC_SetPriority, .-__NVIC_SetPriority
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	SysTick_Config, %function
SysTick_Config:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	cmp	r3, #16777216
	bcc	.L8
	mov	r3, #1
	b	.L9
.L8:
	ldr	r2, .L10
	ldr	r3, [fp, #-8]
	sub	r3, r3, #1
	str	r3, [r2, #4]
	mov	r1, #7
	mvn	r0, #0
	bl	__NVIC_SetPriority
	ldr	r3, .L10
	mov	r2, #0
	str	r2, [r3, #8]
	ldr	r3, .L10
	mov	r2, #7
	str	r2, [r3]
	mov	r3, #0
.L9:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	-536813552
	.size	SysTick_Config, .-SysTick_Config
	.bss
	.align	2
tickCtr:
	.space	4
	.size	tickCtr, 4
	.global	l_tickCtr
	.data
	.align	2
	.type	l_tickCtr, %object
	.size	l_tickCtr, 4
l_tickCtr:
	.word	tickCtr
	.text
	.align	2
	.global	os_on_startup
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_on_startup, %function
os_on_startup:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	SystemCoreClockUpdate
	ldr	r3, .L13
	ldr	r3, [r3]
	mov	r0, r3
	bl	SysTick_Config
	mov	r1, #0
	mvn	r0, #0
	bl	__NVIC_SetPriority
	bl	enable_irq
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	SystemCoreClock
	.size	os_on_startup, .-os_on_startup
	.align	2
	.global	disable_irq
	.syntax unified
	.arm
	.fpu softvfp
	.type	disable_irq, %function
disable_irq:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	.syntax divided
@ 18 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/src/bsp.c" 1
	CPSID	I
	
@ 0 "" 2
	.arm
	.syntax unified
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	disable_irq, .-disable_irq
	.align	2
	.global	enable_irq
	.syntax unified
	.arm
	.fpu softvfp
	.type	enable_irq, %function
enable_irq:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	.syntax divided
@ 24 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/src/bsp.c" 1
	CPSIE	I
	
@ 0 "" 2
	.arm
	.syntax unified
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	enable_irq, .-enable_irq
	.global	counter
	.bss
	.align	2
	.type	counter, %object
	.size	counter, 4
counter:
	.space	4
	.text
	.align	2
	.global	delay_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay_block, %function
delay_block:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	nop
.L18:
	ldr	r3, .L19
	ldr	r3, [r3]
	ldr	r3, [r3]
	cmp	r3, #0
	bgt	.L18
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	l_tickCtr
	.size	delay_block, .-delay_block
	.align	2
	.global	delay
	.syntax unified
	.arm
	.fpu softvfp
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	bsp_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	bsp_init, %function
bsp_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L23
	ldr	r3, [r3, #1544]
	ldr	r2, .L23
	orr	r3, r3, #32
	str	r3, [r2, #1544]
	ldr	r3, .L23+4
	mov	r2, #14
	str	r2, [r3, #1024]
	ldr	r3, .L23+4
	mov	r2, #14
	str	r2, [r3, #1308]
	ldr	r3, .L23+4
	ldr	r3, [r3, #1020]
	ldr	r2, .L23+4
	bic	r3, r3, #14
	str	r3, [r2, #1020]
	bl	uart_debug_init
	bl	disable_irq
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L24:
	.align	2
.L23:
	.word	1074782208
	.word	1073893376
	.size	bsp_init, .-bsp_init
	.align	2
	.global	light_red_on
	.syntax unified
	.arm
	.fpu softvfp
	.type	light_red_on, %function
light_red_on:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L26
	mov	r2, #2
	str	r2, [r3, #1020]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L27:
	.align	2
.L26:
	.word	1073893376
	.size	light_red_on, .-light_red_on
	.align	2
	.global	light_green_on
	.syntax unified
	.arm
	.fpu softvfp
	.type	light_green_on, %function
light_green_on:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L29
	mov	r2, #8
	str	r2, [r3, #1020]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L30:
	.align	2
.L29:
	.word	1073893376
	.size	light_green_on, .-light_green_on
	.align	2
	.global	light_blue_on
	.syntax unified
	.arm
	.fpu softvfp
	.type	light_blue_on, %function
light_blue_on:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L32
	mov	r2, #4
	str	r2, [r3, #1020]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L33:
	.align	2
.L32:
	.word	1073893376
	.size	light_blue_on, .-light_blue_on
	.align	2
	.global	light_red_off
	.syntax unified
	.arm
	.fpu softvfp
	.type	light_red_off, %function
light_red_off:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L35
	ldr	r3, [r3, #1020]
	ldr	r2, .L35
	bic	r3, r3, #2
	str	r3, [r2, #1020]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L36:
	.align	2
.L35:
	.word	1073893376
	.size	light_red_off, .-light_red_off
	.align	2
	.global	light_green_off
	.syntax unified
	.arm
	.fpu softvfp
	.type	light_green_off, %function
light_green_off:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L38
	ldr	r3, [r3, #1020]
	ldr	r2, .L38
	bic	r3, r3, #8
	str	r3, [r2, #1020]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L39:
	.align	2
.L38:
	.word	1073893376
	.size	light_green_off, .-light_green_off
	.align	2
	.global	light_blue_off
	.syntax unified
	.arm
	.fpu softvfp
	.type	light_blue_off, %function
light_blue_off:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L41
	ldr	r3, [r3, #1020]
	ldr	r2, .L41
	bic	r3, r3, #4
	str	r3, [r2, #1020]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L42:
	.align	2
.L41:
	.word	1073893376
	.size	light_blue_off, .-light_blue_off
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
