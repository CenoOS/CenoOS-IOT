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
	.comm	task_01,4,4
	.comm	stack_task_01,160,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"test uart debug\012\015\000"
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
	ldr	r0, .L2
	bl	uart_debug_print
	bl	light_green_on
	mov	r0, #1000
	bl	delay_block
	bl	light_green_off
	mov	r0, #1000
	bl	delay_block
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LC0
	.size	task_01_thread, .-task_01_thread
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	bl	bsp_init
	bl	uart_debug_init
.L5:
	bl	task_01_thread
	b	.L5
	.size	main, .-main
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
