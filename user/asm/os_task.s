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
	.comm	osTaskCurr,4,4
	.comm	osTaskNext,4,4
	.section	.rodata
	.align	2
.LC0:
	.ascii	"[task] create task : '\000"
	.align	2
.LC1:
	.ascii	"'\012\015\000"
	.align	2
.LC2:
	.ascii	"[task] task '\000"
	.align	2
.LC3:
	.ascii	"' add to queue '\000"
	.align	2
.LC4:
	.ascii	"'.\012\015\000"
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
	ldr	r0, .L5
	bl	uart_debug_print
	ldr	r0, [fp, #-28]
	bl	uart_debug_print
	ldr	r0, .L5+4
	bl	uart_debug_print
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
	ldr	r2, [fp, #8]
	ldr	r3, [fp, #-8]
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
	str	r2, [r3]
	ldr	r3, [fp, #-36]
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
	ldr	r2, .L5+8
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
	str	r2, [r3, #12]
	ldr	r3, [fp, #-24]
	ldr	r2, [fp, #-28]
	str	r2, [r3, #24]
	ldr	r3, [fp, #-24]
	mov	r2, #0
	str	r2, [r3, #36]
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
	ldr	r1, [fp, #-24]
	ldr	r0, .L5+12
	bl	os_queue_item_en
	mov	r3, r0
	strb	r3, [fp, #-13]
	ldr	r0, .L5+16
	bl	uart_debug_print
	ldr	r3, [fp, #-24]
	ldr	r3, [r3, #24]
	mov	r0, r3
	bl	uart_debug_print
	ldr	r0, .L5+20
	bl	uart_debug_print
	ldr	r3, .L5+12
	ldr	r3, [r3, #8]
	mov	r0, r3
	bl	uart_debug_print
	ldr	r0, .L5+24
	bl	uart_debug_print
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LC0
	.word	.LC1
	.word	-559038737
	.word	osTaskQueue
	.word	.LC2
	.word	.LC3
	.word	.LC4
	.size	os_task_create, .-os_task_create
	.section	.rodata
	.align	2
.LC5:
	.ascii	"[task] task switch next : '\000"
	.align	2
.LC6:
	.ascii	"[task] task current is null.\012\015\000"
	.align	2
.LC7:
	.ascii	"[task] task next is null.\012\015\000"
	.align	2
.LC8:
	.ascii	"[task] contex switch finished.\012\015\000"
	.text
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
	push	{fp, lr}
	add	fp, sp, #4
	ldr	r0, .L10
	bl	uart_debug_print
	ldr	r3, .L10+4
	ldr	r3, [r3]
	ldr	r3, [r3, #24]
	mov	r0, r3
	bl	uart_debug_print
	ldr	r0, .L10+8
	bl	uart_debug_print
	ldr	r3, .L10+12
	mov	r2, #0
	str	r2, [r3]
	ldr	r3, .L10+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L8
	ldr	r0, .L10+16
	bl	uart_debug_print
.L8:
	ldr	r3, .L10+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L9
	ldr	r0, .L10+20
	bl	uart_debug_print
.L9:
	.syntax divided
@ 99 "/Users/neroyang/project/Ceno-RTOS/kernel/ceno/src/os_task.c" 1
	CPSID		 I
	LDR		r1,.L10+12
	LDR		r1,[r1,#0x00]
	CBZ		r1,PendSV_restore
	LDR	r3, .L10+12
	LDR	r3, [r3]
	LDR	r3, [r3, #24]
	MOV	r0, r3
	BL	uart_debug_print
	PUSH		{r4-r11}
	LDR		r1,.L10+12
	LDR		r1,[r1,#0x00]
	STR		sp,[r1,#0x00]
	PendSV_restore:
	LDR		r1,.L10+4
	LDR		r1,[r1,#0x00]
	LDR		sp,[r1,#0x00]
	LDR	r3, .L10+4
	LDR	r3, [r3]
	LDR	r3, [r3, #24]
	MOV	r0, r3
	BL	uart_debug_print
	LDR		r1,.L10+4
	LDR		r1,[r1,#0x00]
	LDR		r2,.L10+12
	STR		r1,[r2,#0x00]
	POP		{r4-r11}
	POP		{r0-r3}
	POP		{r12,lr}
	CPSIE		I
	BX		lr
@ 0 "" 2
	.arm
	.syntax unified
	ldr	r0, .L10+24
	bl	uart_debug_print
	nop
	mov	r0, r3
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L11:
	.align	2
.L10:
	.word	.LC5
	.word	osTaskNext
	.word	.LC4
	.word	osTaskCurr
	.word	.LC6
	.word	.LC7
	.word	.LC8
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
	ldr	r2, .L14
	ldr	r3, [fp, #-8]
	str	r3, [r2]
	nop
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	osTaskCurr
	.size	os_task_switch_context, .-os_task_switch_context
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
