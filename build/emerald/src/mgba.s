@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
.text
	.align	2, 0
	.globl	mgba_printf
	.type	 mgba_printf,function
	.thumb_func
mgba_printf:
	push	{r1, r2, r3}
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r2, [sp, #0xc]
	mov	r0, #0x7
	and	r4, r4, r0
	add	r3, sp, #0x10
	ldr	r0, .L3
	mov	r5, #0x80
	lsl	r5, r5, #0x1
	add	r1, r5, #0
	bl	vsnprintf_
	ldr	r0, .L3+0x4
	orr	r4, r4, r5
	strh	r4, [r0]
	pop	{r4, r5}
	pop	{r3}
	add	sp, sp, #0xc
	bx	r3
.L4:
	.align	2, 0
.L3:
	.word	0x4fff600
	.word	0x4fff700
.Lfe1:
	.size	 mgba_printf,.Lfe1-mgba_printf
	.align	2, 0
	.globl	mgba_open
	.type	 mgba_open,function
	.thumb_func
mgba_open:
	push	{lr}
	ldr	r1, .L7
	ldr	r2, .L7+0x4
	add	r0, r2, #0
	strh	r0, [r1]
	mov	r2, #0x0
	ldrh	r1, [r1]
	ldr	r0, .L7+0x8
	cmp	r1, r0
	bne	.L6	@cond_branch
	mov	r2, #0x1
.L6:
	add	r0, r2, #0
	pop	{r1}
	bx	r1
.L8:
	.align	2, 0
.L7:
	.word	0x4fff780
	.word	0xc0de
	.word	0x1dea
.Lfe2:
	.size	 mgba_open,.Lfe2-mgba_open
	.align	2, 0
	.globl	mgba_close
	.type	 mgba_close,function
	.thumb_func
mgba_close:
	ldr	r1, .L10
	mov	r0, #0x0
	strh	r0, [r1]
	bx	lr
.L11:
	.align	2, 0
.L10:
	.word	0x4fff780
.Lfe3:
	.size	 mgba_close,.Lfe3-mgba_close
.text
	.align	2, 0

