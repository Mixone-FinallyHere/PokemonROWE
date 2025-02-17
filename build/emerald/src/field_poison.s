@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
.text
	.align	2, 0
	.type	 IsMonValidSpecies,function
	.thumb_func
IsMonValidSpecies:
	push	{lr}
	mov	r1, #0x41
	bl	GetMonData
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	cmp	r1, #0
	beq	.L4	@cond_branch
	ldr	r0, .L6
	cmp	r1, r0
	bne	.L3	@cond_branch
.L4:
	mov	r0, #0x0
	b	.L5
.L7:
	.align	2, 0
.L6:
	.word	0x4b7
.L3:
	mov	r0, #0x1
.L5:
	pop	{r1}
	bx	r1
.Lfe1:
	.size	 IsMonValidSpecies,.Lfe1-IsMonValidSpecies
	.align	2, 0
	.type	 AllMonsFainted,function
	.thumb_func
AllMonsFainted:
	push	{r4, r5, lr}
	ldr	r4, .L16
	mov	r5, #0x0
.L12:
	add	r0, r4, #0
	bl	IsMonValidSpecies
	cmp	r0, #0
	beq	.L11	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x39
	bl	GetMonData
	cmp	r0, #0
	beq	.L11	@cond_branch
	mov	r0, #0x0
	b	.L15
.L17:
	.align	2, 0
.L16:
	.word	gPlayerParty
.L11:
	add	r5, r5, #0x1
	add	r4, r4, #0x64
	cmp	r5, #0x5
	ble	.L12	@cond_branch
	mov	r0, #0x1
.L15:
	pop	{r4, r5}
	pop	{r1}
	bx	r1
.Lfe2:
	.size	 AllMonsFainted,.Lfe2-AllMonsFainted
	.align	2, 0
	.type	 FaintFromFieldPoison,function
	.thumb_func
FaintFromFieldPoison:
	push	{r4, r5, lr}
	add	sp, sp, #-0x4
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x64
	mov	r4, r0
	mul	r4, r4, r1
	ldr	r0, .L19
	add	r4, r4, r0
	mov	r0, #0x0
	str	r0, [sp]
	add	r0, r4, #0
	mov	r1, #0x7
	bl	AdjustFriendship
	add	r0, r4, #0
	mov	r1, #0x37
	mov	r2, sp
	bl	SetMonData
	ldr	r5, .L19+0x4
	add	r0, r4, #0
	mov	r1, #0x2
	add	r2, r5, #0
	bl	GetMonData
	add	r0, r5, #0
	bl	StringGetEnd10
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L20:
	.align	2, 0
.L19:
	.word	gPlayerParty
	.word	gStringVar1
.Lfe3:
	.size	 FaintFromFieldPoison,.Lfe3-FaintFromFieldPoison
	.align	2, 0
	.type	 MonFaintedFromPoison,function
	.thumb_func
MonFaintedFromPoison:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	mov	r1, #0x64
	mul	r1, r1, r0
	ldr	r0, .L24
	add	r4, r1, r0
	add	r0, r4, #0
	bl	IsMonValidSpecies
	cmp	r0, #0
	beq	.L22	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x39
	bl	GetMonData
	cmp	r0, #0
	bne	.L22	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x37
	bl	GetMonData
	bl	GetAilmentFromStatus
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	bne	.L22	@cond_branch
	mov	r0, #0x1
	b	.L23
.L25:
	.align	2, 0
.L24:
	.word	gPlayerParty
.L22:
	mov	r0, #0x0
.L23:
	pop	{r4}
	pop	{r1}
	bx	r1
.Lfe4:
	.size	 MonFaintedFromPoison,.Lfe4-MonFaintedFromPoison
	.align	2, 0
	.type	 Task_TryFieldPoisonWhiteOut,function
	.thumb_func
Task_TryFieldPoisonWhiteOut:
	push	{r4, r5, r6, lr}
	lsl	r0, r0, #0x18
	lsr	r6, r0, #0x18
	lsl	r0, r6, #0x2
	add	r0, r0, r6
	lsl	r0, r0, #0x3
	ldr	r1, .L47
	add	r4, r0, r1
	mov	r0, #0x0
	ldrsh	r5, [r4, r0]
	cmp	r5, #0x1
	beq	.L35	@cond_branch
	cmp	r5, #0x1
	bgt	.L45	@cond_branch
	cmp	r5, #0
	beq	.L28	@cond_branch
	b	.L26
.L48:
	.align	2, 0
.L47:
	.word	gTasks+0x8
.L45:
	cmp	r5, #0x2
	beq	.L37	@cond_branch
	b	.L26
.L28:
	ldrh	r1, [r4, #0x2]
	mov	r2, #0x2
	ldrsh	r0, [r4, r2]
	cmp	r0, #0x5
	bgt	.L30	@cond_branch
.L32:
	lsl	r0, r1, #0x18
	lsr	r0, r0, #0x18
	bl	MonFaintedFromPoison
	cmp	r0, #0
	bne	.L46	@cond_branch
	ldrh	r0, [r4, #0x2]
	add	r0, r0, #0x1
	strh	r0, [r4, #0x2]
	add	r1, r0, #0
	lsl	r0, r0, #0x10
	asr	r0, r0, #0x10
	cmp	r0, #0x5
	ble	.L32	@cond_branch
.L30:
	mov	r0, #0x2
	strh	r0, [r4]
	b	.L26
.L35:
	bl	IsFieldMessageBoxHidden
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L26	@cond_branch
	ldrh	r0, [r4]
	sub	r0, r0, #0x1
	strh	r0, [r4]
	b	.L26
.L37:
	bl	AllMonsFainted
	add	r1, r0, #0
	cmp	r1, #0
	beq	.L38	@cond_branch
	bl	InBattlePyramid
	add	r4, r0, #0
	bl	InBattlePike
	orr	r4, r4, r0
	lsl	r4, r4, #0x18
	cmp	r4, #0
	bne	.L40	@cond_branch
	bl	InTrainerHillChallenge
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L39	@cond_branch
.L40:
	ldr	r0, .L49
	strh	r5, [r0]
	b	.L42
.L50:
	.align	2, 0
.L49:
	.word	gSpecialVar_Result
.L39:
	ldr	r1, .L51
	mov	r0, #0x1
	strh	r0, [r1]
	b	.L42
.L52:
	.align	2, 0
.L51:
	.word	gSpecialVar_Result
.L46:
	ldrb	r0, [r4, #0x2]
	bl	FaintFromFieldPoison
	ldr	r0, .L53
	bl	ShowFieldMessage
	ldrh	r0, [r4]
	add	r0, r0, #0x1
	strh	r0, [r4]
	b	.L26
.L54:
	.align	2, 0
.L53:
	.word	gText_PkmnFainted3
.L38:
	ldr	r0, .L55
	strh	r1, [r0]
.L42:
	bl	EnableBothScriptContexts
	add	r0, r6, #0
	bl	DestroyTask
.L26:
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L56:
	.align	2, 0
.L55:
	.word	gSpecialVar_Result
.Lfe5:
	.size	 Task_TryFieldPoisonWhiteOut,.Lfe5-Task_TryFieldPoisonWhiteOut
	.align	2, 0
	.globl	TryFieldPoisonWhiteOut
	.type	 TryFieldPoisonWhiteOut,function
	.thumb_func
TryFieldPoisonWhiteOut:
	push	{lr}
	ldr	r0, .L58
	mov	r1, #0x50
	bl	CreateTask
	bl	ScriptContext1_Stop
	pop	{r0}
	bx	r0
.L59:
	.align	2, 0
.L58:
	.word	Task_TryFieldPoisonWhiteOut
.Lfe6:
	.size	 TryFieldPoisonWhiteOut,.Lfe6-TryFieldPoisonWhiteOut
	.align	2, 0
	.globl	DoPoisonFieldEffect
	.type	 DoPoisonFieldEffect,function
	.thumb_func
DoPoisonFieldEffect:
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L75
	mov	r7, #0x0
	mov	r6, #0x0
	mov	r5, #0x5
.L64:
	add	r0, r4, #0
	mov	r1, #0x5
	bl	GetMonData
	cmp	r0, #0
	beq	.L65	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x37
	bl	GetMonData
	bl	GetAilmentFromStatus
.L65:
	add	r4, r4, #0x64
	sub	r5, r5, #0x1
	cmp	r5, #0
	bge	.L64	@cond_branch
	cmp	r6, #0
	bne	.L71	@cond_branch
	cmp	r7, #0
	beq	.L70	@cond_branch
.L71:
	bl	FldEffPoison_Start
.L70:
	cmp	r6, #0
	beq	.L72	@cond_branch
	mov	r0, #0x2
	b	.L74
.L76:
	.align	2, 0
.L75:
	.word	gPlayerParty
.L72:
	cmp	r7, #0
	bne	.L73	@cond_branch
	mov	r0, #0x0
	b	.L74
.L73:
	mov	r0, #0x1
.L74:
	pop	{r4, r5, r6, r7}
	pop	{r1}
	bx	r1
.Lfe7:
	.size	 DoPoisonFieldEffect,.Lfe7-DoPoisonFieldEffect
.text
	.align	2, 0

