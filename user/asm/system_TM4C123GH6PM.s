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
	.file	"system_TM4C123GH6PM.c"
	.text
	.global	SystemCoreClock
	.data
	.align	2
	.type	SystemCoreClock, %object
	.size	SystemCoreClock, 4
SystemCoreClock:
	.word	50000000
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	getOscClk, %function
getOscClk:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	str	r0, [fp, #-16]
	str	r1, [fp, #-20]
	ldr	r3, .L35
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-20]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L2
.L4:
	.word	.L3
	.word	.L5
	.word	.L6
	.word	.L7
.L3:
	ldr	r3, [fp, #-16]
	cmp	r3, #22
	ldrls	pc, [pc, r3, asl #2]
	b	.L34
.L10:
	.word	.L9
	.word	.L11
	.word	.L12
	.word	.L13
	.word	.L14
	.word	.L15
	.word	.L16
	.word	.L17
	.word	.L18
	.word	.L19
	.word	.L20
	.word	.L21
	.word	.L22
	.word	.L23
	.word	.L24
	.word	.L25
	.word	.L26
	.word	.L27
	.word	.L28
	.word	.L29
	.word	.L30
	.word	.L31
	.word	.L32
.L9:
	ldr	r3, .L35+4
	str	r3, [fp, #-8]
	b	.L8
.L11:
	ldr	r3, .L35+8
	str	r3, [fp, #-8]
	b	.L8
.L12:
	ldr	r3, .L35+12
	str	r3, [fp, #-8]
	b	.L8
.L13:
	mov	r3, #2457600
	str	r3, [fp, #-8]
	b	.L8
.L14:
	ldr	r3, .L35+16
	str	r3, [fp, #-8]
	b	.L8
.L15:
	mov	r3, #3686400
	str	r3, [fp, #-8]
	b	.L8
.L16:
	ldr	r3, .L35+20
	str	r3, [fp, #-8]
	b	.L8
.L17:
	mov	r3, #4096000
	str	r3, [fp, #-8]
	b	.L8
.L18:
	mov	r3, #4915200
	str	r3, [fp, #-8]
	b	.L8
.L19:
	ldr	r3, .L35+24
	str	r3, [fp, #-8]
	b	.L8
.L20:
	ldr	r3, .L35+28
	str	r3, [fp, #-8]
	b	.L8
.L21:
	ldr	r3, .L35+32
	str	r3, [fp, #-8]
	b	.L8
.L22:
	ldr	r3, .L35+36
	str	r3, [fp, #-8]
	b	.L8
.L23:
	ldr	r3, .L35+40
	str	r3, [fp, #-8]
	b	.L8
.L24:
	ldr	r3, .L35+44
	str	r3, [fp, #-8]
	b	.L8
.L25:
	mov	r3, #8192000
	str	r3, [fp, #-8]
	b	.L8
.L26:
	ldr	r3, .L35+48
	str	r3, [fp, #-8]
	b	.L8
.L27:
	ldr	r3, .L35
	str	r3, [fp, #-8]
	b	.L8
.L28:
	ldr	r3, .L35+52
	str	r3, [fp, #-8]
	b	.L8
.L29:
	ldr	r3, .L35+56
	str	r3, [fp, #-8]
	b	.L8
.L30:
	ldr	r3, .L35+60
	str	r3, [fp, #-8]
	b	.L8
.L31:
	ldr	r3, .L35+64
	str	r3, [fp, #-8]
	b	.L8
.L32:
	mov	r3, #16384000
	str	r3, [fp, #-8]
	nop
.L8:
	b	.L34
.L5:
	ldr	r3, .L35
	str	r3, [fp, #-8]
	b	.L2
.L6:
	ldr	r3, .L35+68
	str	r3, [fp, #-8]
	b	.L2
.L7:
	ldr	r3, .L35+72
	str	r3, [fp, #-8]
	b	.L2
.L34:
	nop
.L2:
	ldr	r3, [fp, #-8]
	mov	r0, r3
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L36:
	.align	2
.L35:
	.word	12000000
	.word	1000000
	.word	1843200
	.word	2000000
	.word	3579545
	.word	4000000
	.word	5000000
	.word	5120000
	.word	6000000
	.word	6144000
	.word	7372800
	.word	8000000
	.word	10000000
	.word	12288000
	.word	13560000
	.word	14318180
	.word	16000000
	.word	3000000
	.word	30000
	.size	getOscClk, .-getOscClk
	.global	__aeabi_uidiv
	.align	2
	.global	SystemCoreClockUpdate
	.syntax unified
	.arm
	.fpu softvfp
	.type	SystemCoreClockUpdate, %function
SystemCoreClockUpdate:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #8
	ldr	r3, .L48
	ldr	r3, [r3, #96]
	str	r3, [fp, #-8]
	ldr	r3, .L48
	ldr	r3, [r3, #112]
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L38
	ldr	r3, [fp, #-12]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L39
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #6
	and	r2, r3, #15
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #4
	and	r3, r3, #7
	mov	r1, r3
	mov	r0, r2
	bl	getOscClk
	mov	r2, r0
	ldr	r3, .L48+4
	str	r2, [r3]
	b	.L40
.L39:
	ldr	r3, .L48+4
	ldr	r2, .L48+8
	str	r2, [r3]
.L40:
	ldr	r3, [fp, #-8]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L47
	ldr	r3, [fp, #-12]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L42
	ldr	r3, .L48+4
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #23
	and	r3, r3, #63
	add	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L48+4
	str	r2, [r3]
	b	.L47
.L42:
	ldr	r3, .L48+4
	ldr	r2, [r3]
	ldr	r3, [fp, #-12]
	lsr	r3, r3, #23
	and	r3, r3, #63
	add	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidiv
	mov	r3, r0
	lsr	r3, r3, #1
	ldr	r2, .L48+4
	str	r3, [r2]
	b	.L47
.L38:
	ldr	r3, [fp, #-8]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L44
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #6
	and	r2, r3, #31
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #4
	and	r3, r3, #3
	mov	r1, r3
	mov	r0, r2
	bl	getOscClk
	mov	r2, r0
	ldr	r3, .L48+4
	str	r2, [r3]
	b	.L45
.L44:
	ldr	r3, .L48+4
	ldr	r2, .L48+8
	str	r2, [r3]
.L45:
	ldr	r3, [fp, #-8]
	and	r3, r3, #4194304
	cmp	r3, #0
	beq	.L47
	ldr	r3, [fp, #-8]
	and	r3, r3, #2048
	cmp	r3, #0
	beq	.L46
	ldr	r3, .L48+4
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #23
	and	r3, r3, #15
	add	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidiv
	mov	r3, r0
	mov	r2, r3
	ldr	r3, .L48+4
	str	r2, [r3]
	b	.L47
.L46:
	ldr	r3, .L48+4
	ldr	r2, [r3]
	ldr	r3, [fp, #-8]
	lsr	r3, r3, #23
	and	r3, r3, #15
	add	r3, r3, #1
	mov	r1, r3
	mov	r0, r2
	bl	__aeabi_uidiv
	mov	r3, r0
	lsr	r3, r3, #1
	ldr	r2, .L48+4
	str	r3, [r2]
.L47:
	nop
	sub	sp, fp, #4
	@ sp needed
	pop	{fp, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	1074782208
	.word	SystemCoreClock
	.word	400000000
	.size	SystemCoreClockUpdate, .-SystemCoreClockUpdate
	.align	2
	.global	SystemInit
	.syntax unified
	.arm
	.fpu softvfp
	.type	SystemInit, %function
SystemInit:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #12
	ldr	r3, .L58
	ldr	r3, [r3, #136]
	ldr	r2, .L58
	orr	r3, r3, #15728640
	str	r3, [r2, #136]
	ldr	r3, .L58+4
	ldr	r2, .L58+8
	str	r2, [r3, #112]
	ldr	r3, .L58+4
	ldr	r2, .L58+12
	str	r2, [r3, #96]
	ldr	r3, .L58+4
	ldr	r2, .L58+16
	str	r2, [r3, #96]
	ldr	r3, .L58+4
	ldr	r2, .L58+20
	str	r2, [r3, #112]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L51
.L52:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L51:
	ldr	r3, [fp, #-8]
	cmp	r3, #1000
	bcc	.L52
	ldr	r3, .L58+4
	ldr	r2, .L58+24
	str	r2, [r3, #96]
	ldr	r3, .L58+4
	ldr	r2, .L58+28
	str	r2, [r3, #112]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L53
.L54:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L53:
	ldr	r3, [fp, #-8]
	cmp	r3, #1000
	bcc	.L54
	ldr	r3, .L58+4
	ldr	r2, .L58+32
	str	r2, [r3, #96]
	nop
.L55:
	ldr	r3, .L58+4
	ldr	r3, [r3, #80]
	and	r3, r3, #64
	cmp	r3, #64
	bne	.L55
	ldr	r3, .L58+4
	ldr	r2, .L58+36
	str	r2, [r3, #96]
	ldr	r3, .L58+4
	mov	r2, #25165824
	str	r2, [r3, #112]
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L56
.L57:
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L56:
	ldr	r3, [fp, #-8]
	ldr	r2, .L58+40
	cmp	r3, r2
	bls	.L57
	nop
	add	sp, fp, #0
	@ sp needed
	ldr	fp, [sp], #4
	bx	lr
.L59:
	.align	2
.L58:
	.word	-536810240
	.word	1074782208
	.word	125839376
	.word	126761681
	.word	27143490
	.word	25176064
	.word	27135298
	.word	25167872
	.word	31329602
	.word	31327554
	.word	9999
	.size	SystemInit, .-SystemInit
	.ident	"GCC: (GNU Tools for Arm Embedded Processors 7-2018-q2-update) 7.3.1 20180622 (release) [ARM/embedded-7-branch revision 261907]"
