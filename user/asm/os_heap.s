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
	.comm	lastHeapBlock,4,4
	.text
	.align	2
	.global	os_heap_is_free
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_is_free, %function
os_heap_is_free:
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
	.size	os_heap_is_free, .-os_heap_is_free
	.align	2
	.global	os_heap_size
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_size, %function
os_heap_size:
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
	.size	os_heap_size, .-os_heap_size
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[heap] _sbrk: Heap and stack collision\012\015\000"
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
	ldr	r3, .L9
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L6
	ldr	r3, .L9
	ldr	r2, .L9+4
	str	r2, [r3]
.L6:
	ldr	r3, .L9
	ldr	r3, [r3]
	str	r3, [fp, #-8]
	ldr	r3, .L9
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L9+8
	cmp	r3, r2
	bls	.L7
	ldr	r0, .L9+12
	bl	uart_debug_print
.L7:
	ldr	r3, .L9
	ldr	r2, [r3]
	ldr	r3, [fp, #-16]
	add	r3, r2, r3
	ldr	r2, .L9
	str	r3, [r2]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	HEAP_START_ADDR
	.word	_ebss
	.word	_stack_ptr
	.word	.LC0
	.size	sbrk, .-sbrk
	.section	.rodata
	.align	2
.LC1:
	.ascii	"[heap] heap initial at: '0x\000"
	.align	2
.LC2:
	.ascii	"'\012\015\000"
	.text
	.align	2
	.global	os_heap_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_init, %function
os_heap_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r3, .L12
	ldr	r2, .L12+4
	str	r2, [r3]
	ldr	r0, .L12+8
	bl	uart_debug_print
	ldr	r3, .L12
	ldr	r3, [r3]
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L12+12
	bl	uart_debug_print
	ldr	r3, .L12+16
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L12+12
	bl	uart_debug_print
	mov	r0, #512
	bl	sbrk
	mov	r3, r0
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L12+12
	bl	uart_debug_print
	mov	r0, #512
	bl	sbrk
	mov	r3, r0
	mov	r0, r3
	bl	uart_debug_print_i32
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	HEAP_START_ADDR
	.word	_ebss
	.word	.LC1
	.word	.LC2
	.word	_stack_ptr
	.size	os_heap_init, .-os_heap_init
	.align	2
	.global	os_heap_find_block
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_find_block, %function
os_heap_find_block:
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
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
	.size	os_heap_realloc, .-os_heap_realloc
	.align	2
	.global	os_heap_free
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_heap_free, %function
os_heap_free:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_heap_free, .-os_heap_free
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
