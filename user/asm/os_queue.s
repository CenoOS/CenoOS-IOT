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
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #36
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L2
	mov	r3, #1
	b	.L1
.L2:
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
	ldr	r2, [fp, #-32]
	str	r2, [r3, #16]
.L1:
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_queue_create, .-os_queue_create
	.align	2
	.global	os_queue_add_item
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_add_item, %function
os_queue_add_item:
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
	.size	os_queue_add_item, .-os_queue_add_item
	.align	2
	.global	os_queue_remove
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_remove, %function
os_queue_remove:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_queue_remove, .-os_queue_remove
	.align	2
	.global	os_queue_clear
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_clear, %function
os_queue_clear:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_queue_clear, .-os_queue_clear
	.align	2
	.global	os_queue_size
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_queue_size, %function
os_queue_size:
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
	.size	os_queue_size, .-os_queue_size
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
