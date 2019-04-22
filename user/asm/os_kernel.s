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
	.file	"os_kernel.c"
	.text
	.comm	osIdleTask,4,4
	.comm	stackTaskIdle,160,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[kernel] os init.\012\015\000"
	.align	2
.LC1:
	.ascii	"taskIdle\000"
	.text
	.align	2
	.global	os_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_init, %function
os_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r0, .L5
	bl	uart_debug_print
	bl	os_obj_container_init
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L2
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L1
.L2:
	ldr	r3, .L5+4
	ldr	r0, [r3]
	ldr	r3, .L5+8
	str	r3, [sp, #4]
	mov	r3, #160
	str	r3, [sp]
	ldr	r3, .L5+12
	mov	r2, #0
	ldr	r1, .L5+16
	bl	os_task_create
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	b	.L1
.L4:
.L1:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	osIdleTask
	.word	os_idle
	.word	stackTaskIdle
	.word	.LC1
	.size	os_init, .-os_init
	.section	.rodata
	.align	2
.LC2:
	.ascii	"[kernel] os run.\012\015\000"
	.text
	.align	2
	.global	os_run
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_run, %function
os_run:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L8
	bl	uart_debug_print
	bl	os_on_startup
	bl	os_init
	bl	disable_irq
	bl	os_sched
	bl	enable_irq
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	.LC2
	.size	os_run, .-os_run
	.align	2
	.global	os_idle
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_idle, %function
os_idle:
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
	.size	os_idle, .-os_idle
	.align	2
	.global	os_tick
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_tick, %function
os_tick:
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
	.size	os_tick, .-os_tick
	.align	2
	.global	os_get_next_ready_from_task_queue
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_get_next_ready_from_task_queue, %function
os_get_next_ready_from_task_queue:
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
	.size	os_get_next_ready_from_task_queue, .-os_get_next_ready_from_task_queue
	.section	.rodata
	.align	2
.LC3:
	.ascii	"[kernel] os sched.\012\015\000"
	.text
	.align	2
	.global	os_sched
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_sched, %function
os_sched:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L17
	bl	uart_debug_print
	ldr	r3, .L17+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	os_queue_size
	mov	r3, r0
	cmp	r3, #0
	bne	.L14
	ldr	r3, .L17+8
	ldr	r3, [r3]
	ldr	r2, .L17+12
	str	r3, [r2]
	b	.L15
.L14:
	ldr	r3, .L17+4
	ldr	r3, [r3]
	mov	r0, r3
	bl	os_get_next_ready_from_task_queue
	mov	r2, r0
	ldr	r3, .L17+12
	str	r2, [r3]
.L15:
	ldr	r3, .L17+12
	ldr	r2, [r3]
	ldr	r3, .L17+16
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L16
	ldr	r3, .L17+20
	mov	r2, #268435456
	str	r2, [r3]
.L16:
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	.LC3
	.word	osTaskQueue
	.word	osIdleTask
	.word	osTaskNext
	.word	osTaskCurr
	.word	-536810236
	.size	os_sched, .-os_sched
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
