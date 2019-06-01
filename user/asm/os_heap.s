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
	.file	"os_heap.c"
	.text
	.bss
	.align	2
HEAP_START_ADDR:
	.space	4
	.size	HEAP_START_ADDR, 4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[heap] sbrk: Heap and stack collision\012\015\000"
	.align	2
.LC1:
	.ascii	"[heap] sbrk: expand '\000"
	.align	2
.LC2:
	.ascii	"' at '\000"
	.align	2
.LC3:
	.ascii	"'\012\015\000"
	.text
	.align	2
	.global	sbrk
	.syntax unified
	.arm
	.fpu softvfp
	.type	sbrk, %function
sbrk:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, .L5
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L2
	ldr	r3, .L5
	ldr	r2, .L5+4
	str	r2, [r3]
.L2:
	ldr	r3, .L5
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L5
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L5+8
	cmp	r3, r2
	bls	.L3
	ldr	r0, .L5+12
	bl	uart_debug_print
.L3:
	ldr	r3, .L5
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L5
	str	r3, [r2]
	ldr	r0, .L5+16
	bl	uart_debug_print
	mov	r1, #10
	ldr	r0, [fp, #-16]
	bl	uart_debug_print_i32
	ldr	r0, .L5+20
	bl	uart_debug_print
	ldr	r3, .L5
	ldr	r3, [r3]
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L5+24
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	HEAP_START_ADDR
	.word	_ebss
	.word	_stack_ptr
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.word	.LC3
	.size	sbrk, .-sbrk
	.section	.rodata
	.align	2
.LC4:
	.ascii	"[heap] kernel heap: initial at '0x\000"
	.align	2
.LC5:
	.ascii	"[heap] user heap: initial at '0x\000"
	.text
	.align	2
	.global	os_heap_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_init, %function
os_heap_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 80
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #80
	ldr	r3, .L13
	ldr	r2, .L13+4
	str	r2, [r3]
	ldr	r0, .L13+8
	bl	uart_debug_print
	ldr	r3, .L13
	ldr	r3, [r3]
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L13+12
	bl	uart_debug_print
	ldr	r0, .L13+16
	bl	uart_debug_print
	ldr	r3, .L13
	ldr	r3, [r3]
	add	r3, r3, #2048
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L13+12
	bl	uart_debug_print
	mov	r0, #16
	bl	sbrk
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, #16
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	str	r2, [r3, #8]
	mov	r0, #12
	bl	os_heap_malloc
	str	r0, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #4
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, [fp, #-20]
	add	r3, r3, #8
	mov	r2, #3
	str	r2, [r3]
	ldr	r0, [fp, #-20]
	bl	os_heap_free
	mov	r0, #8
	bl	os_heap_malloc
	str	r0, [fp, #-24]
	ldr	r3, [fp, #-24]
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #4
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #8
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #12
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #16
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #20
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #24
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #28
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	add	r3, r3, #32
	mov	r2, #5
	str	r2, [r3]
	mov	r0, #40
	bl	os_heap_malloc
	str	r0, [fp, #-28]
	ldr	r0, [fp, #-28]
	bl	os_heap_free
	mov	r0, #40
	bl	os_heap_malloc
	str	r0, [fp, #-32]
	ldr	r0, [fp, #-32]
	bl	os_heap_free
	mov	r0, #40
	bl	os_heap_malloc
	str	r0, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L8
.L9:
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	mov	r0, r3
	bl	os_heap_malloc
	mov	r2, r0
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	sub	r1, fp, #4
	add	r3, r1, r3
	str	r2, [r3, #-76]
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L8:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	ble	.L9
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L10
.L11:
	ldr	r3, [fp, #-12]
	lsl	r3, r3, #2
	sub	r2, fp, #4
	add	r3, r2, r3
	ldr	r3, [r3, #-76]
	mov	r0, r3
	bl	os_heap_free
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L10:
	ldr	r3, [fp, #-12]
	cmp	r3, #9
	ble	.L11
	bl	print_heap
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	HEAP_START_ADDR
	.word	_ebss
	.word	.LC4
	.word	.LC3
	.word	.LC5
	.size	os_heap_init, .-os_heap_init
	.align	2
	.global	os_heap_find_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_find_block, %function
os_heap_find_block:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, .L21
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L16
.L18:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L16:
	ldr	r3, [fp, #-8]
	ldr	r2, .L21
	cmp	r3, r2
	beq	.L17
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-16]
	cmp	r2, r3
	bhi	.L18
.L17:
	ldr	r3, [fp, #-8]
	ldr	r2, .L21
	cmp	r3, r2
	beq	.L19
	ldr	r3, [fp, #-8]
	b	.L20
.L19:
	mov	r3, #0
.L20:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	_ebss
	.size	os_heap_find_block, .-os_heap_find_block
	.align	2
	.global	os_heap_malloc
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_malloc, %function
os_heap_malloc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	add	r3, r3, #23
	bic	r3, r3, #7
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-12]
	bl	os_heap_find_block
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L24
	ldr	r0, [fp, #-12]
	bl	sbrk
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	bne	.L25
	mov	r3, #0
	b	.L26
.L25:
	ldr	r3, [fp, #-12]
	orr	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	b	.L27
.L24:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	orr	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #8]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #8]
	str	r2, [r3, #8]
.L27:
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
.L26:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_heap_malloc, .-os_heap_malloc
	.align	2
	.global	os_heap_realloc
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_realloc, %function
os_heap_realloc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	ldr	r3, [fp, #-24]
	sub	r3, r3, #16
	str	r3, [fp, #-12]
	ldr	r0, [fp, #-28]
	bl	os_heap_malloc
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bne	.L29
	mov	r3, #0
	b	.L30
.L29:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	add	r3, r3, #16
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bcs	.L31
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
.L31:
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-16]
	bl	memcpy
	ldr	r0, [fp, #-24]
	bl	os_heap_free
	ldr	r3, [fp, #-16]
.L30:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_heap_realloc, .-os_heap_realloc
	.align	2
	.global	os_heap_free
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_free, %function
os_heap_free:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	sub	r3, r3, #16
	str	r3, [fp, #-8]
	ldr	r3, .L33
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	bic	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #8]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #8]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L34:
	.align	2
.L33:
	.word	_ebss
	.size	os_heap_free, .-os_heap_free
	.align	2
	.global	os_heap_calloc
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_calloc, %function
os_heap_calloc:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	mul	r1, r2, r3
	mov	r0, r1
	bl	os_heap_malloc
	mov	r3, r0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_heap_calloc, .-os_heap_calloc
	.align	2
	.global	memcpy
	.syntax unified
	.arm
	.fpu softvfp
	.type	memcpy, %function
memcpy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	str	r2, [fp, #-24]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	beq	.L38
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L39
.L38:
	mov	r3, #0
	b	.L40
.L39:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	b	.L41
.L42:
	ldr	r2, [fp, #-12]
	add	r3, r2, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r1, r3, #1
	str	r1, [fp, #-8]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L41:
	ldr	r3, [fp, #-24]
	sub	r2, r3, #1
	str	r2, [fp, #-24]
	cmp	r3, #0
	bne	.L42
	ldr	r3, [fp, #-16]
.L40:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	memcpy, .-memcpy
	.section	.rodata
	.align	2
.LC6:
	.ascii	"[heap] alloced block: at '\000"
	.align	2
.LC7:
	.ascii	"[heap] free block: at '\000"
	.align	2
.LC8:
	.ascii	"',size \000"
	.align	2
.LC9:
	.ascii	"\012\015\000"
	.text
	.align	2
	.global	print_heap
	.syntax unified
	.arm
	.fpu softvfp
	.type	print_heap, %function
print_heap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L48
	str	r3, [fp, #-8]
	b	.L44
.L47:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L45
	ldr	r0, .L48+4
	bl	uart_debug_print
	b	.L46
.L45:
	ldr	r0, .L48+8
	bl	uart_debug_print
.L46:
	ldr	r3, [fp, #-8]
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L48+12
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	bic	r3, r3, #1
	mov	r1, #10
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L48+16
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	bic	r3, r3, #1
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L44:
	ldr	r2, .L48+20
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	bcc	.L47
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	_ebss
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	_ebss+8192
	.size	print_heap, .-print_heap
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
