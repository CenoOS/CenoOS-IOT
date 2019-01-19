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
	.file	"os_ring_buffer.c"
	.text
	.align	2
	.global	os_ring_buffer_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_ring_buffer_init, %function
os_ring_buffer_init:
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
	.size	os_ring_buffer_init, .-os_ring_buffer_init
	.align	2
	.global	os_ring_buffer_push
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_ring_buffer_push, %function
os_ring_buffer_push:
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
	.size	os_ring_buffer_push, .-os_ring_buffer_push
	.align	2
	.global	os_ring_buffer_pop
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_ring_buffer_pop, %function
os_ring_buffer_pop:
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
	.size	os_ring_buffer_pop, .-os_ring_buffer_pop
	.align	2
	.global	os_ring_buffer_is_full
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_ring_buffer_is_full, %function
os_ring_buffer_is_full:
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
	.size	os_ring_buffer_is_full, .-os_ring_buffer_is_full
	.align	2
	.global	os_ring_buffer_is_empty
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_ring_buffer_is_empty, %function
os_ring_buffer_is_empty:
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
	.size	os_ring_buffer_is_empty, .-os_ring_buffer_is_empty
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
