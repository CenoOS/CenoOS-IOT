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
	.file	"os_list.c"
	.text
	.align	2
	.global	os_list_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_list_init, %function
os_list_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_list_init, .-os_list_init
	.align	2
	.global	is_list_empty
	.syntax unified
	.arm
	.fpu softvfp
	.type	is_list_empty, %function
is_list_empty:
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
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	moveq	r3, #1
	movne	r3, #0
	and	r3, r3, #255
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	is_list_empty, .-is_list_empty
	.align	2
	.global	os_list_insert
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_list_insert, %function
os_list_insert:
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
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_list_insert, .-os_list_insert
	.align	2
	.global	os_list_add
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_list_add, %function
os_list_add:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-12]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_list_add, .-os_list_add
	.align	2
	.global	os_list_rm
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_list_rm, %function
os_list_rm:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_list_rm, .-os_list_rm
	.align	2
	.global	os_list_rm_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_list_rm_init, %function
os_list_rm_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	str	r0, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3, #4]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	ldr	r3, [r3]
	ldr	r2, [fp, #-8]
	ldr	r2, [r2, #4]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	ldr	r2, [r3, #4]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_list_rm_init, .-os_list_rm_init
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
