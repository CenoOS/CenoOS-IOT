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
	.file	"main.c"
	.text
	.comm	task_01,52,4
	.comm	stack_task_01,160,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[task] task 1 \012\015\000"
	.text
	.align	2
	.global	task_01_thread
	.syntax unified
	.arm
	.fpu softvfp
	.type	task_01_thread, %function
task_01_thread:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
.L2:
	ldr	r0, .L3
	bl	uart_debug_print
	mov	r0, #1
	bl	delay_block
	b	.L2
.L4:
	.align	2
.L3:
	.word	.LC0
	.size	task_01_thread, .-task_01_thread
	.comm	task_02,52,4
	.comm	stack_task_02,160,4
	.section	.rodata
	.align	2
.LC1:
	.ascii	"[task] task 2 \012\015\000"
	.text
	.align	2
	.global	task_02_thread
	.syntax unified
	.arm
	.fpu softvfp
	.type	task_02_thread, %function
task_02_thread:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
.L6:
	ldr	r0, .L7
	bl	uart_debug_print
	mov	r0, #1
	bl	delay_block
	b	.L6
.L8:
	.align	2
.L7:
	.word	.LC1
	.size	task_02_thread, .-task_02_thread
	.section	.rodata
	.align	2
.LC2:
	.ascii	"[debug] _______________begin______________\012\015\000"
	.align	2
.LC3:
	.ascii	"[main] main start.\012\015\000"
	.align	2
.LC4:
	.ascii	"task_01\000"
	.align	2
.LC5:
	.ascii	"task_02\000"
	.text
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	bl	bsp_init
	ldr	r0, .L11
	bl	uart_debug_print
	ldr	r0, .L11+4
	bl	uart_debug_print
	bl	os_init
	ldr	r3, .L11+8
	str	r3, [sp, #4]
	mov	r3, #160
	str	r3, [sp]
	ldr	r3, .L11+12
	mov	r2, #5
	ldr	r1, .L11+16
	ldr	r0, .L11+20
	bl	os_task_create
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldr	r3, .L11+24
	str	r3, [sp, #4]
	mov	r3, #160
	str	r3, [sp]
	ldr	r3, .L11+28
	mov	r2, #4
	ldr	r1, .L11+32
	ldr	r0, .L11+36
	bl	os_task_create
	mov	r3, r0
	strb	r3, [fp, #-6]
	bl	os_run
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LC2
	.word	.LC3
	.word	task_01_thread
	.word	stack_task_01
	.word	.LC4
	.word	task_01
	.word	task_02_thread
	.word	stack_task_02
	.word	.LC5
	.word	task_02
	.size	main, .-main
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
