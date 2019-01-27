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
	.file	"uart_debug.c"
	.text
	.align	2
	.global	uart_debug_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_init, %function
uart_debug_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L2
	ldr	r3, [r3, #1560]
	ldr	r2, .L2
	orr	r3, r3, #1
	str	r3, [r2, #1560]
	ldr	r3, .L2
	ldr	r3, [r3, #1544]
	ldr	r2, .L2
	orr	r3, r3, #1
	str	r3, [r2, #1544]
	ldr	r3, .L2+4
	mov	r2, #3
	str	r2, [r3, #1056]
	ldr	r3, .L2+4
	mov	r2, #17
	str	r2, [r3, #1324]
	ldr	r3, .L2+4
	mov	r2, #3
	str	r2, [r3, #1308]
	ldr	r3, .L2+8
	ldr	r3, [r3, #48]
	ldr	r2, .L2+8
	bic	r3, r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L2+8
	mov	r2, #104
	str	r2, [r3, #36]
	ldr	r3, .L2+8
	mov	r2, #11
	str	r2, [r3, #40]
	ldr	r3, .L2+8
	mov	r2, #96
	str	r2, [r3, #44]
	ldr	r3, .L2+8
	mov	r2, #0
	str	r2, [r3, #4040]
	ldr	r3, .L2+8
	ldr	r2, .L2+12
	str	r2, [r3, #48]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	1074782208
	.word	1073758208
	.word	1073790976
	.word	769
	.size	uart_debug_init, .-uart_debug_init
	.align	2
	.global	uart_debug_print
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_print, %function
uart_debug_print:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	b	.L5
.L6:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	uart_debug_print_char
.L5:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L6
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	uart_debug_print, .-uart_debug_print
	.align	2
	.global	uart_debug_print_char
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_print_char, %function
uart_debug_print_char:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	nop
.L8:
	ldr	r3, .L9
	ldr	r3, [r3, #24]
	and	r3, r3, #32
	cmp	r3, #0
	bne	.L8
	ldr	r2, .L9
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L10:
	.align	2
.L9:
	.word	1073790976
	.size	uart_debug_print_char, .-uart_debug_print_char
	.align	2
	.global	uart_debug_reveive
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_reveive, %function
uart_debug_reveive:
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
	.size	uart_debug_reveive, .-uart_debug_reveive
	.align	2
	.global	uart_debug_reveive_char
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_reveive_char, %function
uart_debug_reveive_char:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	nop
.L13:
	ldr	r3, .L15
	ldr	r3, [r3, #24]
	and	r3, r3, #16
	cmp	r3, #0
	bne	.L13
	ldr	r3, .L15
	ldr	r3, [r3]
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L16:
	.align	2
.L15:
	.word	1073790976
	.size	uart_debug_reveive_char, .-uart_debug_reveive_char
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
