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
	.file	"os_obj.c"
	.text
	.comm	objs_container,8,4
	.align	2
	.global	os_obj_container_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_obj_container_init, %function
os_obj_container_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	sub	r3, fp, #16
	mov	r0, r3
	bl	os_list_init
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L2
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L1
.L2:
	ldr	r3, .L4
	mov	r2, r3
	sub	r3, fp, #16
	ldm	r3, {r0, r1}
	stm	r2, {r0, r1}
.L1:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	objs_container
	.size	os_obj_container_init, .-os_obj_container_init
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
