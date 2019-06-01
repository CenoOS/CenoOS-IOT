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
	.file	"os_queue.c"
	.text
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[queue] queue create : \000"
	.align	2
.LC1:
	.ascii	"\012\015\000"
	.align	2
.LC2:
	.ascii	"[queue] queue create : heap malloc failed!\012\015\000"
	.text
	.align	2
	.global	os_queue_create
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_create, %function
os_queue_create:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r0, .L6
	bl	uart_debug_print
	ldr	r0, [fp, #-28]
	bl	uart_debug_print
	ldr	r0, .L6+4
	bl	uart_debug_print
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L2
	mov	r3, #1
	b	.L5
.L2:
	ldr	r3, [fp, #-32]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	os_heap_malloc
	mov	r2, r0
	ldr	r3, [fp, #-24]
	str	r2, [r3, #28]
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #28]
	cmp	r3, #0
	bne	.L4
	ldr	r0, .L6+8
	bl	uart_debug_print
	mov	r3, #1
	b	.L5
.L4:
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	mov	r3, #4
	strb	r3, [fp, #-8]
	ldr	r3, [fp, #-24]
	mov	ip, r3
	sub	r3, fp, #20
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #20]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #24]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #16]
	mov	r3, #0
.L5:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	os_queue_create, .-os_queue_create
	.section	.rodata
	.align	2
.LC3:
	.ascii	"[queue] queue en : queue is full!\012\015\000"
	.global	__aeabi_uidivmod
	.text
	.align	2
	.global	os_queue_item_en
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_item_en, %function
os_queue_item_en:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	os_queue_is_full
	mov	r3, r0
	cmp	r3, #1
	bne	.L9
	ldr	r0, .L11
	bl	uart_debug_print
	mov	r3, #1
	b	.L10
.L9:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #24]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #24]
	add	r2, r3, #1
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #24]
	mov	r3, #0
.L10:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LC3
	.size	os_queue_item_en, .-os_queue_item_en
	.section	.rodata
	.align	2
.LC4:
	.ascii	"[queue] queue de : queue is empty!\012\015\000"
	.text
	.align	2
	.global	os_queue_item_de
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_item_de, %function
os_queue_item_de:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r0, [fp, #-8]
	bl	os_queue_is_empty
	mov	r3, r0
	cmp	r3, #1
	bne	.L14
	ldr	r0, .L16
	bl	uart_debug_print
	mov	r3, #1
	b	.L15
.L14:
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #20]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #20]
	add	r2, r3, #1
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3, #20]
	mov	r3, #0
.L15:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L17:
	.align	2
.L16:
	.word	.LC4
	.size	os_queue_item_de, .-os_queue_item_de
	.section	.rodata
	.align	2
.LC5:
	.ascii	"[queue] queue traverse \012\015\000"
	.align	2
.LC6:
	.ascii	" |--[queue item] at : '\000"
	.align	2
.LC7:
	.ascii	"'\012\015\000"
	.text
	.align	2
	.global	os_queue_traverse
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_traverse, %function
os_queue_traverse:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #20]
	str	r3, [fp, #-8]
	ldr	r0, .L21
	bl	uart_debug_print
	b	.L19
.L20:
	ldr	r0, .L21+4
	bl	uart_debug_print
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L21+8
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-8]
.L19:
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #24]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	bne	.L20
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	.LC5
	.word	.LC6
	.word	.LC7
	.size	os_queue_traverse, .-os_queue_traverse
	.align	2
	.global	os_queue_length
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_length, %function
os_queue_length:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #24]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #20]
	sub	r2, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_queue_length, .-os_queue_length
	.align	2
	.global	os_queue_is_empty
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_is_empty, %function
os_queue_is_empty:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #20]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #24]
	cmp	r2, r3
	bne	.L26
	mov	r3, #1
	b	.L27
.L26:
	mov	r3, #0
.L27:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_queue_is_empty, .-os_queue_is_empty
	.align	2
	.global	os_queue_is_full
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_is_full, %function
os_queue_is_full:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #24]
	add	r2, r3, #1
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidivmod
	mov	r3, r1
	mov	r2, r3
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #20]
	cmp	r2, r3
	bne	.L29
	mov	r3, #1
	b	.L30
.L29:
	mov	r3, #0
.L30:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_queue_is_full, .-os_queue_is_full
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
