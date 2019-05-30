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
	.file	"uart_debug.c"
	.text
	.align	2
	.global	uart_debug_init
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_init, %function
uart_debug_init:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	ldr	r3, .L2
	ldr	r3, [r3, #1560]
	ldr	r2, .L2
	orr	r3, r3, #1
	str	r3, [r2, #1560]
	ldr	r3, .L2
	ldr	r3, [r3, #1544]
	ldr	r2, .L2
	orr	r3, r3, #1
	str	r3, [r2, #1544]
	ldr	r3, .L2+4
	mov	r2, #3
	str	r2, [r3, #1056]
	ldr	r3, .L2+4
	mov	r2, #17
	str	r2, [r3, #1324]
	ldr	r3, .L2+4
	mov	r2, #3
	str	r2, [r3, #1308]
	ldr	r3, .L2+8
	ldr	r3, [r3, #48]
	ldr	r2, .L2+8
	bic	r3, r3, #1
	str	r3, [r2, #48]
	ldr	r3, .L2+8
	mov	r2, #104
	str	r2, [r3, #36]
	ldr	r3, .L2+8
	mov	r2, #11
	str	r2, [r3, #40]
	ldr	r3, .L2+8
	mov	r2, #96
	str	r2, [r3, #44]
	ldr	r3, .L2+8
	mov	r2, #0
	str	r2, [r3, #4040]
	ldr	r3, .L2+8
	ldr	r2, .L2+12
	str	r2, [r3, #48]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L3:
	.align	2
.L2:
	.word	1074782208
	.word	1073758208
	.word	1073790976
	.word	769
	.size	uart_debug_init, .-uart_debug_init
	.align	2
	.global	uart_debug_print
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_print, %function
uart_debug_print:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	.syntax divided
@ 71 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/src/uart_debug.c" 1
	CPSID	I
	
@ 0 "" 2
	.arm
	.syntax unified
	b	.L5
.L6:
	ldr	r3, [fp, #-8]
	add	r2, r3, #1
	str	r2, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	mov	r0, r3
	bl	uart_debug_print_char
.L5:
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3]	@ zero_extendqisi2
	cmp	r3, #0
	bne	.L6
	.syntax divided
@ 77 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/src/uart_debug.c" 1
	CPSIE	I
	
@ 0 "" 2
	.arm
	.syntax unified
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	uart_debug_print, .-uart_debug_print
	.align	2
	.global	uart_debug_print_char
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_print_char, %function
uart_debug_print_char:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	mov	r3, r0
	strb	r3, [fp, #-5]
	nop
.L8:
	ldr	r3, .L9
	ldr	r3, [r3, #24]
	and	r3, r3, #32
	cmp	r3, #0
	bne	.L8
	ldr	r2, .L9
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	str	r3, [r2]
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L10:
	.align	2
.L9:
	.word	1073790976
	.size	uart_debug_print_char, .-uart_debug_print_char
	.align	2
	.global	uart_debug_reveive_char
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_reveive_char, %function
uart_debug_reveive_char:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	nop
.L12:
	ldr	r3, .L14
	ldr	r3, [r3, #24]
	and	r3, r3, #16
	cmp	r3, #0
	bne	.L12
	ldr	r3, .L14
	ldr	r3, [r3]
	strb	r3, [fp, #-5]
	ldrb	r3, [fp, #-5]	@ zero_extendqisi2
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L15:
	.align	2
.L14:
	.word	1073790976
	.size	uart_debug_reveive_char, .-uart_debug_reveive_char
	.align	2
	.global	uart_debug_print_number
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_print_number, %function
uart_debug_print_number:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	str	r0, [fp, #-8]
	str	r1, [fp, #-12]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bne	.L17
	ldr	r3, [fp, #-12]
	cmp	r3, #1
	bne	.L17
	mov	r0, #48
	bl	uart_debug_print_char
.L17:
	ldr	r3, [fp, #-8]
	cmp	r3, #1
	bne	.L18
	mov	r0, #49
	bl	uart_debug_print_char
.L18:
	ldr	r3, [fp, #-8]
	cmp	r3, #2
	bne	.L19
	mov	r0, #50
	bl	uart_debug_print_char
.L19:
	ldr	r3, [fp, #-8]
	cmp	r3, #3
	bne	.L20
	mov	r0, #51
	bl	uart_debug_print_char
.L20:
	ldr	r3, [fp, #-8]
	cmp	r3, #4
	bne	.L21
	mov	r0, #52
	bl	uart_debug_print_char
.L21:
	ldr	r3, [fp, #-8]
	cmp	r3, #5
	bne	.L22
	mov	r0, #53
	bl	uart_debug_print_char
.L22:
	ldr	r3, [fp, #-8]
	cmp	r3, #6
	bne	.L23
	mov	r0, #54
	bl	uart_debug_print_char
.L23:
	ldr	r3, [fp, #-8]
	cmp	r3, #7
	bne	.L24
	mov	r0, #55
	bl	uart_debug_print_char
.L24:
	ldr	r3, [fp, #-8]
	cmp	r3, #8
	bne	.L25
	mov	r0, #56
	bl	uart_debug_print_char
.L25:
	ldr	r3, [fp, #-8]
	cmp	r3, #9
	bne	.L26
	mov	r0, #57
	bl	uart_debug_print_char
.L26:
	ldr	r3, [fp, #-8]
	cmp	r3, #10
	bne	.L27
	mov	r0, #97
	bl	uart_debug_print_char
.L27:
	ldr	r3, [fp, #-8]
	cmp	r3, #11
	bne	.L28
	mov	r0, #98
	bl	uart_debug_print_char
.L28:
	ldr	r3, [fp, #-8]
	cmp	r3, #12
	bne	.L29
	mov	r0, #99
	bl	uart_debug_print_char
.L29:
	ldr	r3, [fp, #-8]
	cmp	r3, #13
	bne	.L30
	mov	r0, #100
	bl	uart_debug_print_char
.L30:
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	bne	.L31
	mov	r0, #101
	bl	uart_debug_print_char
.L31:
	ldr	r3, [fp, #-8]
	cmp	r3, #15
	bne	.L33
	mov	r0, #102
	bl	uart_debug_print_char
.L33:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
	.size	uart_debug_print_number, .-uart_debug_print_number
	.global	__aeabi_uidiv
	.align	2
	.global	uart_debug_print_i32
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_print_i32, %function
uart_debug_print_i32:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #36
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r3, [fp, #-44]
	cmp	r3, #16
	bne	.L35
	mov	r0, #48
	bl	uart_debug_print_char
	mov	r0, #120
	bl	uart_debug_print_char
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L36
.L37:
	ldr	r3, [fp, #-16]
	rsb	r3, r3, #7
	lsl	r3, r3, #2
	ldr	r2, [fp, #-40]
	lsr	r3, r2, r3
	and	r3, r3, #15
	str	r3, [fp, #-28]
	mov	r1, #1
	ldr	r0, [fp, #-28]
	bl	uart_debug_print_number
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L36:
	ldr	r3, [fp, #-16]
	cmp	r3, #7
	ble	.L37
	b	.L45
.L35:
	ldr	r3, [fp, #-44]
	cmp	r3, #10
	bne	.L45
	ldr	r3, .L46
	str	r3, [fp, #-32]
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L39
.L44:
	ldr	r3, [fp, #-32]
	mov	r1, r3
	ldr	r0, [fp, #-40]
	bl	__aeabi_uidiv
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	beq	.L40
	mov	r3, #1
	str	r3, [fp, #-20]
.L40:
	ldr	r3, [fp, #-20]
	cmp	r3, #0
	bne	.L41
	mov	r1, #0
	ldr	r0, [fp, #-24]
	bl	uart_debug_print_number
	b	.L42
.L41:
	mov	r1, #1
	ldr	r0, [fp, #-24]
	bl	uart_debug_print_number
.L42:
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	bcc	.L43
	ldr	r1, [fp, #-32]
	ldr	r2, [fp, #-24]
	mul	r3, r2, r1
	ldr	r2, [fp, #-40]
	sub	r3, r2, r3
	str	r3, [fp, #-40]
.L43:
	ldr	r2, [fp, #-32]
	ldr	r1, .L46+4
	umull	r3, r4, r2, r1
	lsr	r3, r4, #3
	str	r3, [fp, #-32]
.L39:
	ldr	r3, [fp, #-32]
	cmp	r3, #1
	bne	.L44
	mov	r1, #1
	ldr	r0, [fp, #-40]
	bl	uart_debug_print_number
.L45:
	nop
	sub	sp, fp, #8
	@ sp needed
	pop	{r4, fp, lr}
	bx	lr
.L47:
	.align	2
.L46:
	.word	1000000000
	.word	-858993459
	.size	uart_debug_print_i32, .-uart_debug_print_i32
	.align	2
	.global	uart_debug_print_os_register
	.syntax unified
	.arm
	.fpu softvfp
	.type	uart_debug_print_os_register, %function
uart_debug_print_os_register:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	.syntax divided
@ 179 "/Users/neroyang/project/Ceno-RTOS/board/arch/arm32/ek-TM4C123gxl/TM4C123GH6PM/ceno_os/src/uart_debug.c" 1
	MOV	r0, r15
	BL	uart_debug_print_i32
	MOV	r0, #10
	BL	uart_debug_print_char
	MOV	r0, pc
	BL	uart_debug_print_i32
	MOV	r0, lr
	BL	uart_debug_print_i32
	MOV	r0, r12
	BL	uart_debug_print_i32
	MOV	r0, r3
	BL	uart_debug_print_i32
	MOV	r0, r2
	BL	uart_debug_print_i32
	MOV	r0, r0
	BL	uart_debug_print_i32
	MOV	r0, r11
	BL	uart_debug_print_i32
	MOV	r0, r10
	BL	uart_debug_print_i32
	MOV	r0, r9
	BL	uart_debug_print_i32
	MOV	r0, r8
	BL	uart_debug_print_i32
	MOV	r0, r7
	BL	uart_debug_print_i32
	MOV	r0, r6
	BL	uart_debug_print_i32
	MOV	r0, r5
	BL	uart_debug_print_i32
	MOV	r0, r4
	BL	uart_debug_print_i32
	
@ 0 "" 2
	.arm
	.syntax unified
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
	.size	uart_debug_print_os_register, .-uart_debug_print_os_register
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
