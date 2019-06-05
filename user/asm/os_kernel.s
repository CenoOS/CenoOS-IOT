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
	.comm	osTaskQueue,32,4
	.comm	osReadyTaskQueue,32,4
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
	.ascii	"ready task queue\000"
	.align	2
.LC3:
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
	ldr	r0, .L7
	bl	uart_debug_print
	bl	os_heap_init
	ldr	r3, .L7+4
	ldr	r3, [r3]
	ldr	r2, .L7+4
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
	ldr	r1, .L7+8
	ldr	r0, .L7+12
	bl	os_queue_create
	mov	r3, r0
	strb	r3, [fp, #-6]
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L4
	ldrb	r3, [fp, #-6]	@ zero_extendqisi2
	b	.L1
.L4:
	mov	r2, #32
	ldr	r1, .L7+16
	ldr	r0, .L7+20
	bl	os_queue_create
	mov	r3, r0
	strb	r3, [fp, #-7]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L5
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	b	.L1
.L5:
	ldr	r3, .L7+24
	str	r3, [sp, #4]
	mov	r3, #160
	str	r3, [sp]
	ldr	r3, .L7+28
	mov	r2, #0
	ldr	r1, .L7+32
	ldr	r0, .L7+36
	bl	os_task_create
	mov	r3, r0
	strb	r3, [fp, #-8]
	ldr	r3, .L7+40
	ldr	r2, .L7+36
	str	r2, [r3]
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	cmp	r3, #1
	bne	.L6
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	b	.L1
.L6:
.L1:
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC0
	.word	-536810208
	.word	.LC1
	.word	osTaskQueue
	.word	.LC2
	.word	osReadyTaskQueue
	.word	os_idle
	.word	stackTaskIdle
	.word	.LC3
	.word	osIdleTask
	.word	osTaskCurr
	.size	os_init, .-os_init
	.section	.rodata
	.align	2
.LC4:
	.ascii	"[task] idle. \000"
	.align	2
.LC5:
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
	b	.L10
.L11:
	ldr	r0, .L12
	bl	uart_debug_print
	mov	r1, #10
	ldr	r0, [fp, #-8]
	bl	uart_debug_print_i32
	ldr	r0, .L12+4
	bl	uart_debug_print
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L10:
	ldr	r3, [fp, #-8]
	cmn	r3, #1
	bne	.L11
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC4
	.word	.LC5
	.size	task_idle_thread, .-task_idle_thread
	.section	.rodata
	.align	2
.LC6:
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
	ldr	r0, .L15
	bl	os_queue_traverse
	ldr	r0, .L15+4
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
.L16:
	.align	2
.L15:
	.word	osTaskQueue
	.word	.LC6
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
.L18:
	bl	task_idle_thread
	b	.L18
	.size	os_idle, .-os_idle
	.section	.rodata
	.align	2
.LC7:
	.ascii	"[task] tasks traverse \012\015\000"
	.align	2
.LC8:
	.ascii	" |--[task] task : '\000"
	.align	2
.LC9:
	.ascii	"', timeout : '\000"
	.align	2
.LC10:
	.ascii	"ms'\012\015\000"
	.global	__aeabi_uidivmod
	.text
	.align	2
	.global	os_tick
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_tick, %function
os_tick:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	ldr	r3, .L24
	ldr	r3, [r3, #20]
	str	r3, [fp, #-8]
	ldr	r0, .L24+4
	bl	uart_debug_print
	ldr	r3, .L24+8
	str	r3, [fp, #-12]
	b	.L20
.L23:
	ldr	r3, .L24
	ldr	r2, [r3, #28]
	ldr	r3, [fp, #-8]
	lsl	r3, r3, #2
	add	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [fp, #-16]
	ldr	r0, .L24+12
	bl	uart_debug_print
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #24]
	mov	r0, r3
	bl	uart_debug_print
	ldr	r0, .L24+16
	bl	uart_debug_print
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #36]
	mov	r1, #10
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L24+20
	bl	uart_debug_print
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #36]
	sub	r2, r3, #1
	ldr	r3, [fp, #-16]
	str	r2, [r3, #36]
	ldr	r3, [fp, #-16]
	ldr	r3, [r3, #36]
	cmp	r3, #0
	bne	.L21
	ldr	r3, [fp, #-16]
	mov	r2, #2
	strb	r2, [r3, #32]
.L21:
	ldr	r3, [fp, #-16]
	ldrb	r3, [r3, #32]	@ zero_extendqisi2
	cmp	r3, #2
	bne	.L22
	ldr	r3, [fp, #-16]
	ldr	r2, [r3, #40]
	ldr	r3, [fp, #-12]
	ldr	r3, [r3, #40]
	cmp	r2, r3
	bls	.L22
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-12]
.L22:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	ldr	r3, .L24
	ldr	r3, [r3, #16]
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidivmod
	mov	r3, r1
	str	r3, [fp, #-8]
.L20:
	ldr	r3, .L24
	ldr	r3, [r3, #24]
	ldr	r2, [fp, #-8]
	cmp	r2, r3
	bne	.L23
	ldr	r1, [fp, #-12]
	ldr	r0, .L24+24
	bl	os_queue_item_en
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	osTaskQueue
	.word	.LC7
	.word	osIdleTask
	.word	.LC8
	.word	.LC9
	.word	.LC10
	.word	osReadyTaskQueue
	.size	os_tick, .-os_tick
	.section	.rodata
	.align	2
.LC11:
	.ascii	"[kernel] os ready queue size : '\000"
	.align	2
.LC12:
	.ascii	"'\012\015\000"
	.text
	.align	2
	.global	os_get_next_ready_from_task_queue
	.syntax unified
	.arm
	.fpu softvfp
	.type	os_get_next_ready_from_task_queue, %function
os_get_next_ready_from_task_queue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #16
	str	r0, [fp, #-16]
	ldr	r0, .L28
	bl	uart_debug_print
	ldr	r0, [fp, #-16]
	bl	os_queue_length
	mov	r3, r0
	mov	r1, #10
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L28+4
	bl	uart_debug_print
	sub	r3, fp, #12
	mov	r1, r3
	ldr	r0, [fp, #-16]
	bl	os_queue_item_de
	ldr	r3, [fp, #-12]
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	.LC11
	.word	.LC12
	.size	os_get_next_ready_from_task_queue, .-os_get_next_ready_from_task_queue
	.section	.rodata
	.align	2
.LC13:
	.ascii	"[kernel] os sched.\012\015\000"
	.align	2
.LC14:
	.ascii	"[scheduler] next task : '\000"
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
	ldr	r0, .L34
	bl	uart_debug_print
	ldr	r0, .L34+4
	bl	os_queue_length
	mov	r3, r0
	cmp	r3, #0
	bne	.L31
	ldr	r3, .L34+8
	ldr	r2, .L34+12
	str	r2, [r3]
	b	.L32
.L31:
	ldr	r0, .L34+4
	bl	os_get_next_ready_from_task_queue
	mov	r2, r0
	ldr	r3, .L34+8
	str	r2, [r3]
.L32:
	ldr	r0, .L34+16
	bl	uart_debug_print
	ldr	r3, .L34+8
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	mov	r0, r3
	bl	uart_debug_print
	ldr	r0, .L34+20
	bl	uart_debug_print
	ldr	r3, .L34+24
	mov	r2, #134217728
	str	r2, [r3]
	ldr	r3, .L34+24
	ldr	r3, [r3]
	lsr	r3, r3, #28
	and	r3, r3, #1
	mov	r1, #10
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L34+28
	bl	uart_debug_print
	ldr	r3, .L34+24
	mov	r2, #268435456
	str	r2, [r3]
	ldr	r3, .L34+24
	ldr	r3, [r3]
	lsr	r3, r3, #28
	and	r3, r3, #1
	mov	r1, #10
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L34+28
	bl	uart_debug_print
	ldr	r3, .L34+32
	ldr	r3, [r3]
	lsr	r3, r3, #10
	and	r3, r3, #1
	mov	r1, #10
	mov	r0, r3
	bl	uart_debug_print_i32
	ldr	r0, .L34+28
	bl	uart_debug_print
	ldr	r3, .L34+8
	ldr	r2, [r3]
	ldr	r3, .L34+36
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L33
	ldr	r3, .L34+24
	mov	r2, #268435456
	str	r2, [r3]
.L33:
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	.LC13
	.word	osReadyTaskQueue
	.word	osTaskNext
	.word	osIdleTask
	.word	.LC14
	.word	.LC12
	.word	-536810236
	.word	.LC5
	.word	-536810204
	.word	osTaskCurr
	.size	os_sched, .-os_sched
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
