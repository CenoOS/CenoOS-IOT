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
	.text
	.align	2
	.global	os_heap_block_free
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_block_free, %function
os_heap_block_free:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsl	r3, r3, #30
	and	r3, r3, #1073741824
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_block_free, .-os_heap_block_free
	.align	2
	.global	os_heap_block_size
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_block_size, %function
os_heap_block_size:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #1
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_block_size, .-os_heap_block_size
	.align	2
	.global	os_heap_block_free_set
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_block_free_set, %function
os_heap_block_free_set:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	mvn	r3, r3, lsl #31
	mvn	r3, r3, lsr #31
	and	r2, r2, r3
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_block_free_set, .-os_heap_block_free_set
	.align	2
	.global	os_heap_block_size_set
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_block_size_set, %function
os_heap_block_size_set:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	bic	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	b	.L9
.L7:
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	mvn	r3, r3, lsl #31
	mvn	r3, r3, lsr #31
	ldr	r2, [fp, #-8]
	str	r3, [r2]
.L9:
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_block_size_set, .-os_heap_block_size_set
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
	ldr	r3, .L14
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L11
	ldr	r3, .L14
	ldr	r2, .L14+4
	str	r2, [r3]
.L11:
	ldr	r3, .L14
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L14
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L14+8
	cmp	r3, r2
	bls	.L12
	ldr	r0, .L14+12
	bl	uart_debug_print
.L12:
	ldr	r3, .L14
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L14
	str	r3, [r2]
	ldr	r0, .L14+16
	bl	uart_debug_print
	mov	r1, #10
	ldr	r0, [fp, #-16]
	bl	uart_debug_print_i32
	ldr	r0, .L14+20
	bl	uart_debug_print
	ldr	r3, .L14
	ldr	r3, [r3]
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L14+24
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
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
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #24
	ldr	r3, .L18
	ldr	r2, .L18+4
	str	r2, [r3]
	ldr	r0, .L18+8
	bl	uart_debug_print
	ldr	r3, .L18
	ldr	r3, [r3]
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L18+12
	bl	uart_debug_print
	ldr	r0, .L18+16
	bl	uart_debug_print
	ldr	r3, .L18
	ldr	r3, [r3]
	add	r3, r3, #2048
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L18+12
	bl	uart_debug_print
	mov	r1, #10
	mov	r0, #108
	bl	uart_debug_print_i32
	mov	r0, #16
	bl	sbrk
	str	r0, [fp, #-8]
	mov	r1, #16
	ldr	r0, [fp, #-8]
	bl	os_heap_block_size_set
	mov	r1, #1
	ldr	r0, [fp, #-8]
	bl	os_heap_block_free_set
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #8]
	mov	r0, #12
	bl	os_heap_malloc
	str	r0, [fp, #-12]
	ldr	r3, [fp, #-12]
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	mov	r2, #3
	str	r2, [r3]
	ldr	r0, [fp, #-12]
	bl	os_heap_free
	mov	r0, #8
	bl	os_heap_malloc
	str	r0, [fp, #-16]
	ldr	r3, [fp, #-16]
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r3, #4
	mov	r2, #5
	str	r2, [r3]
	mov	r0, #40
	bl	os_heap_malloc
	str	r0, [fp, #-20]
	mov	r0, #40
	bl	os_heap_malloc
	str	r0, [fp, #-24]
	mov	r0, #40
	bl	os_heap_malloc
	str	r0, [fp, #-28]
	bl	print_heap
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	HEAP_START_ADDR
	.word	_ebss
	.word	.LC4
	.word	.LC3
	.word	.LC5
	.size	os_heap_init, .-os_heap_init
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
	ldr	r3, .L25
	str	r3, [fp, #-8]
	b	.L21
.L24:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L22
	ldr	r0, .L25+4
	bl	uart_debug_print
	b	.L23
.L22:
	ldr	r0, .L25+8
	bl	uart_debug_print
.L23:
	ldr	r3, [fp, #-8]
	add	r3, r3, #192
	mov	r1, #16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L25+12
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r3, r3, #1
	mov	r1, #10
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L25+16
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	lsr	r2, r3, #1
	mov	r3, r2
	lsl	r3, r3, #1
	add	r3, r3, r2
	lsl	r3, r3, #2
	add	r3, r3, #192
	ldr	r2, [fp, #-8]
	add	r3, r2, r3
	str	r3, [fp, #-8]
.L21:
	ldr	r2, .L25+20
	ldr	r3, [fp, #-8]
	cmp	r3, r2
	bcc	.L24
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	_ebss
	.word	.LC6
	.word	.LC7
	.word	.LC8
	.word	.LC9
	.word	_ebss+8192
	.size	print_heap, .-print_heap
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
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r3, .L33
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
	b	.L28
.L30:
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	str	r3, [fp, #-8]
.L28:
	ldr	r3, [fp, #-8]
	ldr	r2, .L33
	cmp	r3, r2
	beq	.L29
	ldr	r0, [fp, #-8]
	bl	os_heap_block_size
	mov	r2, r0
	ldr	r3, [fp, #-16]
	cmp	r3, r2
	bhi	.L30
.L29:
	ldr	r3, [fp, #-8]
	ldr	r2, .L33
	cmp	r3, r2
	beq	.L31
	ldr	r3, [fp, #-8]
	b	.L32
.L31:
	mov	r3, #0
.L32:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L34:
	.align	2
.L33:
	.word	_ebss
	.size	os_heap_find_block, .-os_heap_find_block
	.align	2
	.global	os_heap_extend
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_extend, %function
os_heap_extend:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_extend, .-os_heap_extend
	.align	2
	.global	os_heap_split_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_split_block, %function
os_heap_split_block:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_split_block, .-os_heap_split_block
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
	bne	.L38
	ldr	r0, [fp, #-12]
	bl	sbrk
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	bne	.L39
	mov	r3, #0
	b	.L40
.L39:
	ldr	r3, [fp, #-12]
	orr	r2, r3, #1
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	b	.L41
.L38:
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
.L41:
	ldr	r3, [fp, #-8]
	add	r3, r3, #16
.L40:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_heap_malloc, .-os_heap_malloc
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
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_calloc, .-os_heap_calloc
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
	bne	.L44
	mov	r3, #0
	b	.L45
.L44:
	ldr	r3, [fp, #-12]
	ldr	r3, [r3]
	add	r3, r3, #16
	str	r3, [fp, #-8]
	ldr	r2, [fp, #-28]
	ldr	r3, [fp, #-8]
	cmp	r2, r3
	bcs	.L46
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-8]
.L46:
	ldr	r2, [fp, #-8]
	ldr	r1, [fp, #-24]
	ldr	r0, [fp, #-16]
	bl	memcpy
	ldr	r0, [fp, #-24]
	bl	os_heap_free
	ldr	r3, [fp, #-16]
.L45:
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
	ldr	r3, .L48
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
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #8]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L49:
	.align	2
.L48:
	.word	_ebss
	.size	os_heap_free, .-os_heap_free
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
	beq	.L51
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L52
.L51:
	mov	r3, #0
	b	.L53
.L52:
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	str	r3, [fp, #-12]
	b	.L54
.L55:
	ldr	r2, [fp, #-12]
	add	r3, r2, #1
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	add	r1, r3, #1
	str	r1, [fp, #-8]
	ldrb	r2, [r2]	@ zero_extendqisi2
	strb	r2, [r3]
.L54:
	ldr	r3, [fp, #-24]
	sub	r2, r3, #1
	str	r2, [fp, #-24]
	cmp	r3, #0
	bne	.L55
	ldr	r3, [fp, #-16]
.L53:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	memcpy, .-memcpy
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
