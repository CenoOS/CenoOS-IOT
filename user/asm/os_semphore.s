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
	.file	"os_semphore.c"
	.text
	.align	2
	.global	os_sem_create
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_sem_create, %function
os_sem_create:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	bne	.L2
	mov	r3, #1
	b	.L5
.L2:
	ldr	r3, [fp, #-28]
	cmp	r3, #0
	bne	.L4
	mov	r3, #1
	b	.L5
.L4:
	mov	r3, #2
	strb	r3, [fp, #-8]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-24]
	mov	ip, r3
	sub	r3, fp, #20
	ldm	r3, {r0, r1, r2, r3}
	stm	ip, {r0, r1, r2, r3}
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #16]
	ldr	r3, [fp, #-24]
	add	r3, r3, #24
	mov	r2, #10
	ldr	r1, [fp, #-28]
	mov	r0, r3
	bl	os_queue_create
	mov	r3, r0
.L5:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_sem_create, .-os_sem_create
	.align	2
	.global	os_sem_del
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_sem_del, %function
os_sem_del:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	bl	__DISABLE_IRQ
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	cmp	r3, #0
	beq	.L7
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #16]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #16]
	b	.L8
.L7:
	ldr	r3, [fp, #-8]
	mov	r2, #3
	strb	r2, [r3, #32]
	ldr	r3, [fp, #-16]
	add	r3, r3, #24
	ldr	r1, [fp, #-8]
	mov	r0, r3
	bl	os_queue_add_item
.L8:
	bl	__ENABLE_IRQ
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_sem_del, .-os_sem_del
	.align	2
	.global	os_sem_give
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_sem_give, %function
os_sem_give:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	bl	__DISABLE_IRQ
	bl	__ENABLE_IRQ
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_sem_give, .-os_sem_give
	.align	2
	.global	os_sem_take
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_sem_take, %function
os_sem_take:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	bl	__DISABLE_IRQ
	bl	__ENABLE_IRQ
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_sem_take, .-os_sem_take
	.align	2
	.global	os_sem_count_get
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_sem_count_get, %function
os_sem_count_get:
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
	add	r3, r3, #16
	str	r3, [fp, #-12]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_sem_count_get, .-os_sem_count_get
	.align	2
	.global	os_sem_count_set
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_sem_count_set, %function
os_sem_count_set:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	bl	__DISABLE_IRQ
	ldr	r3, [fp, #-8]
	ldr	r2, [fp, #-12]
	str	r2, [r3, #16]
	bl	__ENABLE_IRQ
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	os_sem_count_set, .-os_sem_count_set
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
