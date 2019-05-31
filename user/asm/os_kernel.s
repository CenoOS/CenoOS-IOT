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
	.comm	osTaskQueue,44,4
	.comm	osIdleTask,52,4
	.comm	stackTaskIdle,160,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[kernel] os init.\012\015\000"
	.align	2
.LC1:
	.ascii	"task queue\000"
	.align	2
.LC2:
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
	ldr	r0, .L6
	bl	uart_debug_print
	bl	os_heap_init
	ldr	r3, .L6+4
	ldr	r3, [r3]
	ldr	r2, .L6+4
	orr	r3, r3, #16711680
	str	r3, [r2]
	bl	os_obj_container_init
	mov	r3, r0
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L2
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	b	.L1
.L2:
	mov	r2, #32
	ldr	r1, .L6+8
	ldr	r0, .L6+12
	bl	os_queue_create
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	b	.L1
.L4:
	ldr	r3, .L6+16
	str	r3, [sp, #4]
	mov	r3, #160
	str	r3, [sp]
	ldr	r3, .L6+20
	mov	r2, #0
	ldr	r1, .L6+24
	ldr	r0, .L6+28
	bl	os_task_create
	mov	r3, r0
	strb	r3, [fp, #-7]
	ldr	r3, .L6+32
	ldr	r2, .L6+28
	str	r2, [r3]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L5
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	b	.L1
.L5:
.L1:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	.LC0
	.word	-536810208
	.word	.LC1
	.word	osTaskQueue
	.word	os_idle
	.word	stackTaskIdle
	.word	.LC2
	.word	osIdleTask
	.word	osTaskCurr
	.size	os_init, .-os_init
	.section	.rodata
	.align	2
.LC3:
	.ascii	"[task] idle. \000"
	.align	2
.LC4:
	.ascii	"\012\015\000"
	.text
	.align	2
	.global	task_idle_thread
	.syntax unified
	.arm
	.fpu softvfp
	.type	task_idle_thread, %function
task_idle_thread:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L9
.L10:
	ldr	r0, .L11
	bl	uart_debug_print
	mov	r1, #10
	ldr	r0, [fp, #-8]
	bl	uart_debug_print_i32
	ldr	r0, .L11+4
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L9:
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	bne	.L10
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	.LC3
	.word	.LC4
	.size	task_idle_thread, .-task_idle_thread
	.section	.rodata
	.align	2
.LC5:
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
	ldr	r0, .L14
	bl	uart_debug_print
	bl	os_on_startup
	bl	disable_irq
	bl	os_sched
	bl	enable_irq
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L15:
	.align	2
.L14:
	.word	.LC5
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
	push	{fp, lr}
	add	fp, sp, #4
.L17:
	bl	task_idle_thread
	b	.L17
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
	ldr	r3, .L21
	ldr	r3, [r3, #36]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L22:
	.align	2
.L21:
	.word	osTaskQueue
	.size	os_get_next_ready_from_task_queue, .-os_get_next_ready_from_task_queue
	.section	.rodata
	.align	2
.LC6:
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
	ldr	r0, .L27
	bl	uart_debug_print
	ldr	r0, .L27+4
	bl	os_queue_size
	mov	r3, r0
	cmp	r3, #0
	bne	.L24
	ldr	r3, .L27+8
	ldr	r2, .L27+12
	str	r2, [r3]
	b	.L25
.L24:
	ldr	r3, .L27+8
	ldr	r2, .L27+12
	str	r2, [r3]
.L25:
	ldr	r3, .L27+16
	mov	r2, #268435456
	str	r2, [r3]
	ldr	r3, .L27+8
	ldr	r2, [r3]
	ldr	r3, .L27+20
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L26
	ldr	r3, .L27+16
	mov	r2, #268435456
	str	r2, [r3]
.L26:
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	.LC6
	.word	osTaskQueue
	.word	osTaskNext
	.word	osIdleTask
	.word	-536810236
	.word	osTaskCurr
	.size	os_sched, .-os_sched
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
