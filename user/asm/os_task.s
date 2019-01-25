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
	.file	"os_task.c"
	.text
	.comm	OS_curr,4,4
	.comm	OS_next,4,4
	.bss
	.align	2
taskQueue:
	.space	4
	.size	taskQueue, 4
	.text
	.align	2
	.global	os_task_create
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_task_create, %function
os_task_create:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #32
	str	r0, [fp, #-24]
	str	r1, [fp, #-28]
	str	r2, [fp, #-32]
	str	r3, [fp, #-36]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #4]
	add	r3, r2, r3
	bic	r3, r3, #7
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #16777216
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r2, [fp, #8]
	ldr	r3, [fp, #-8]
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #14
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #12
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #3
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #2
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #11
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #10
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #9
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #8
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #7
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #6
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #5
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r2, #4
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-8]
	str	r2, [r3, #20]
	ldr	r3, [fp, #4]
	sub	r3, r3, #1
	bic	r3, r3, #7
	add	r3, r3, #8
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
	b	.L2
.L3:
	ldr	r3, [fp, #-8]
	ldr	r2, .L5
	str	r2, [r3]
	ldr	r3, [fp, #-8]
	sub	r3, r3, #4
	str	r3, [fp, #-8]
.L2:
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-12]
	cmp	r2, r3
	bcs	.L3
	ldr	r3, [fp, #-24]
	mov	r2, #1
	str	r2, [r3]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-32]
	str	r2, [r3, #40]
	ldr	r3, [fp, #-32]
	cmp	r3, #0
	beq	.L4
	ldr	r3, [fp, #-24]
	mov	r2, #2
	strb	r2, [r3, #32]
.L4:
	ldr	r3, .L5+4
	ldr	r3, [r3]
	ldr	r1, [fp, #-24]
	mov	r0, r3
	bl	os_queue_add_item
	mov	r3, r0
	strb	r3, [fp, #-13]
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	-559038737
	.word	taskQueue
	.size	os_task_create, .-os_task_create
	.align	2
	.global	os_task_switch_next
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_task_switch_next, %function
os_task_switch_next:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	.syntax divided
@ 80 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_task.c" 1
	CPSID         I
	LDR           r1,=OS_curr
	LDR           r1,[r1,#0x00]
	CBZ           r1,PendSV_restore
	PUSH          {r4-r11}
	LDR           r1,=OS_curr
	LDR           r1,[r1,#0x00]
	STR           sp,[r1,#0x00]
	PendSV_restore:
	LDR           r1,=OS_next
	LDR           r1,[r1,#0x00]
	LDR           sp,[r1,#0x00]
	LDR           r1,=OS_next
	LDR           r1,[r1,#0x00]
	LDR           r2,=OS_curr
	STR           r1,[r2,#0x00]
	POP           {r4-r11}
	CPSIE         I
	BX            lr
	
@ 0 "" 2
	.arm
	.syntax unified
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	os_task_switch_next, .-os_task_switch_next
	.align	2
	.global	os_task_exit
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_task_exit, %function
os_task_exit:
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
	.size	os_task_exit, .-os_task_exit
	.align	2
	.global	os_task_switch_context
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_task_switch_context, %function
os_task_switch_context:
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
	.size	os_task_switch_context, .-os_task_switch_context
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
