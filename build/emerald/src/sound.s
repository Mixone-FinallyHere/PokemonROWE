@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.globl	gMPlay_PokemonCry
	.section ewram_data,"aw"
	.align	2, 0
	.type	 gMPlay_PokemonCry,object
	.size	 gMPlay_PokemonCry,4
gMPlay_PokemonCry:
	.word	0x0
	.globl	gPokemonCryBGMDuckingCounter
	.type	 gPokemonCryBGMDuckingCounter,object
	.size	 gPokemonCryBGMDuckingCounter,1
gPokemonCryBGMDuckingCounter:
	.byte	0x0
	.section .rodata
	.align	2, 0
	.type	 sFanfares,object
sFanfares:
	.short	0x16f
	.short	0x50
	.short	0x172
	.short	0xa0
	.short	0x173
	.short	0xdc
	.short	0x174
	.short	0xdc
	.short	0x170
	.short	0xa0
	.short	0x171
	.short	0x154
	.short	0x17a
	.short	0xb4
	.short	0x183
	.short	0x78
	.short	0x184
	.short	0x2c6
	.short	0x185
	.short	0xfa
	.short	0x186
	.short	0x96
	.short	0x187
	.short	0xa0
	.short	0x226
	.short	0x1c2
	.short	0x212
	.short	0xaa
	.short	0x211
	.short	0xc4
	.short	0x1cb
	.short	0x139
	.short	0x1d2
	.short	0x13e
	.short	0x1cc
	.short	0x87
	.size	 sFanfares,72
.text
	.align	2, 0
	.globl	InitMapMusic
	.type	 InitMapMusic,function
	.thumb_func
InitMapMusic:
	push	{lr}
	ldr	r3, .L4
	mov	r2, #0x0
	ldr	r0, .L4+0x4
	ldr	r0, [r0]
	ldrb	r1, [r0, #0x15]
	mov	r0, #0x3
	and	r0, r0, r1
	cmp	r0, #0x2
	bne	.L3	@cond_branch
	mov	r2, #0x1
.L3:
	strb	r2, [r3]
	bl	ResetMapMusic
	pop	{r0}
	bx	r0
.L5:
	.align	2, 0
.L4:
	.word	gDisableMusic
	.word	gSaveBlock2Ptr
.Lfe1:
	.size	 InitMapMusic,.Lfe1-InitMapMusic
	.align	2, 0
	.globl	MapMusicMain
	.type	 MapMusicMain,function
	.thumb_func
MapMusicMain:
	push	{r4, r5, lr}
	ldr	r0, .L21
	ldrb	r1, [r0]
	add	r2, r0, #0
	cmp	r1, #0x7
	bhi	.L7	@cond_branch
	lsl	r0, r1, #0x2
	ldr	r1, .L21+0x4
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L22:
	.align	2, 0
.L21:
	.word	sMapMusicState
	.word	.L19
	.align	2, 0
	.align	2, 0
.L19:
	.word	.L7
	.word	.L9
	.word	.L7
	.word	.L7
	.word	.L7
	.word	.L13
	.word	.L15
	.word	.L17
.L9:
	mov	r0, #0x2
	strb	r0, [r2]
	ldr	r0, .L23
	ldrh	r0, [r0]
	bl	PlayBGM
	b	.L7
.L24:
	.align	2, 0
.L23:
	.word	sCurrentMapMusic
.L13:
	bl	IsBGMStopped
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r0, .L25
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L25+0x4
	strb	r1, [r0]
	b	.L7
.L26:
	.align	2, 0
.L25:
	.word	sNextMapMusic
	.word	sMapMusicState
.L15:
	bl	IsBGMStopped
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L7	@cond_branch
	bl	IsFanfareTaskInactive
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r2, .L27
	ldr	r1, .L27+0x4
	ldrh	r0, [r1]
	strh	r0, [r2]
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r1, .L27+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	ldrh	r0, [r2]
	bl	PlayBGM
	b	.L7
.L28:
	.align	2, 0
.L27:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.L17:
	bl	IsBGMStopped
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L7	@cond_branch
	bl	IsFanfareTaskInactive
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L7	@cond_branch
	ldr	r4, .L29
	ldrh	r0, [r4]
	ldr	r5, .L29+0x4
	ldrb	r1, [r5]
	bl	FadeInNewBGM
	ldr	r1, .L29+0x8
	ldrh	r0, [r4]
	strh	r0, [r1]
	mov	r2, #0x0
	strh	r2, [r4]
	ldr	r1, .L29+0xc
	mov	r0, #0x2
	strb	r0, [r1]
	strb	r2, [r5]
.L7:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L30:
	.align	2, 0
.L29:
	.word	sNextMapMusic
	.word	sMapMusicFadeInSpeed
	.word	sCurrentMapMusic
	.word	sMapMusicState
.Lfe2:
	.size	 MapMusicMain,.Lfe2-MapMusicMain
	.align	2, 0
	.globl	ResetMapMusic
	.type	 ResetMapMusic,function
	.thumb_func
ResetMapMusic:
	ldr	r0, .L32
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L32+0x4
	strh	r1, [r0]
	ldr	r0, .L32+0x8
	strb	r1, [r0]
	ldr	r0, .L32+0xc
	strb	r1, [r0]
	bx	lr
.L33:
	.align	2, 0
.L32:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
	.word	sMapMusicFadeInSpeed
.Lfe3:
	.size	 ResetMapMusic,.Lfe3-ResetMapMusic
	.align	2, 0
	.globl	GetCurrentMapMusic
	.type	 GetCurrentMapMusic,function
	.thumb_func
GetCurrentMapMusic:
	ldr	r0, .L35
	ldrh	r0, [r0]
	bx	lr
.L36:
	.align	2, 0
.L35:
	.word	sCurrentMapMusic
.Lfe4:
	.size	 GetCurrentMapMusic,.Lfe4-GetCurrentMapMusic
	.align	2, 0
	.globl	PlayNewMapMusic
	.type	 PlayNewMapMusic,function
	.thumb_func
PlayNewMapMusic:
	ldr	r1, .L38
	strh	r0, [r1]
	ldr	r1, .L38+0x4
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r1, .L38+0x8
	mov	r0, #0x1
	strb	r0, [r1]
	bx	lr
.L39:
	.align	2, 0
.L38:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe5:
	.size	 PlayNewMapMusic,.Lfe5-PlayNewMapMusic
	.align	2, 0
	.globl	StopMapMusic
	.type	 StopMapMusic,function
	.thumb_func
StopMapMusic:
	ldr	r0, .L41
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L41+0x4
	strh	r1, [r0]
	ldr	r1, .L41+0x8
	mov	r0, #0x1
	strb	r0, [r1]
	bx	lr
.L42:
	.align	2, 0
.L41:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe6:
	.size	 StopMapMusic,.Lfe6-StopMapMusic
	.align	2, 0
	.globl	FadeOutMapMusic
	.type	 FadeOutMapMusic,function
	.thumb_func
FadeOutMapMusic:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	bl	IsNotWaitingForBGMStop
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L44	@cond_branch
	add	r0, r4, #0
	bl	FadeOutBGM
.L44:
	ldr	r0, .L45
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L45+0x4
	strh	r1, [r0]
	ldr	r1, .L45+0x8
	mov	r0, #0x5
	strb	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
.L46:
	.align	2, 0
.L45:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe7:
	.size	 FadeOutMapMusic,.Lfe7-FadeOutMapMusic
	.align	2, 0
	.globl	FadeOutAndPlayNewMapMusic
	.type	 FadeOutAndPlayNewMapMusic,function
	.thumb_func
FadeOutAndPlayNewMapMusic:
	push	{r4, lr}
	add	r4, r0, #0
	add	r0, r1, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	bl	FadeOutMapMusic
	ldr	r1, .L48
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r0, .L48+0x4
	strh	r4, [r0]
	ldr	r1, .L48+0x8
	mov	r0, #0x6
	strb	r0, [r1]
	pop	{r4}
	pop	{r0}
	bx	r0
.L49:
	.align	2, 0
.L48:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
.Lfe8:
	.size	 FadeOutAndPlayNewMapMusic,.Lfe8-FadeOutAndPlayNewMapMusic
	.align	2, 0
	.globl	FadeOutAndFadeInNewMapMusic
	.type	 FadeOutAndFadeInNewMapMusic,function
	.thumb_func
FadeOutAndFadeInNewMapMusic:
	push	{r4, r5, lr}
	add	r4, r0, #0
	add	r0, r1, #0
	add	r5, r2, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	lsl	r5, r5, #0x18
	lsr	r5, r5, #0x18
	bl	FadeOutMapMusic
	ldr	r1, .L51
	mov	r0, #0x0
	strh	r0, [r1]
	ldr	r0, .L51+0x4
	strh	r4, [r0]
	ldr	r1, .L51+0x8
	mov	r0, #0x7
	strb	r0, [r1]
	ldr	r0, .L51+0xc
	strb	r5, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L52:
	.align	2, 0
.L51:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
	.word	sMapMusicFadeInSpeed
.Lfe9:
	.size	 FadeOutAndFadeInNewMapMusic,.Lfe9-FadeOutAndFadeInNewMapMusic
	.align	2, 0
	.globl	FadeInNewMapMusic
	.type	 FadeInNewMapMusic,function
	.thumb_func
FadeInNewMapMusic:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	bl	FadeInNewBGM
	ldr	r0, .L54
	strh	r4, [r0]
	ldr	r0, .L54+0x4
	mov	r2, #0x0
	strh	r2, [r0]
	ldr	r1, .L54+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	ldr	r0, .L54+0xc
	strb	r2, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
.L55:
	.align	2, 0
.L54:
	.word	sCurrentMapMusic
	.word	sNextMapMusic
	.word	sMapMusicState
	.word	sMapMusicFadeInSpeed
.Lfe10:
	.size	 FadeInNewMapMusic,.Lfe10-FadeInNewMapMusic
	.align	2, 0
	.globl	IsNotWaitingForBGMStop
	.type	 IsNotWaitingForBGMStop,function
	.thumb_func
IsNotWaitingForBGMStop:
	push	{lr}
	ldr	r0, .L61
	ldrb	r0, [r0]
	cmp	r0, #0x6
	beq	.L59	@cond_branch
	cmp	r0, #0x5
	beq	.L59	@cond_branch
	cmp	r0, #0x7
	beq	.L59	@cond_branch
	mov	r0, #0x1
	b	.L60
.L62:
	.align	2, 0
.L61:
	.word	sMapMusicState
.L59:
	mov	r0, #0x0
.L60:
	pop	{r1}
	bx	r1
.Lfe11:
	.size	 IsNotWaitingForBGMStop,.Lfe11-IsNotWaitingForBGMStop
	.align	2, 0
	.globl	PlayFanfareByFanfareNum
	.type	 PlayFanfareByFanfareNum,function
	.thumb_func
PlayFanfareByFanfareNum:
	push	{r4, lr}
	add	r4, r0, #0
	lsl	r4, r4, #0x18
	lsr	r4, r4, #0x18
	ldr	r0, .L64
	bl	m4aMPlayStop
	ldr	r0, .L64+0x4
	lsl	r4, r4, #0x2
	add	r4, r4, r0
	ldrh	r0, [r4]
	ldr	r2, .L64+0x8
	ldrh	r1, [r4, #0x2]
	strh	r1, [r2]
	bl	m4aSongNumStart
	pop	{r4}
	pop	{r0}
	bx	r0
.L65:
	.align	2, 0
.L64:
	.word	gMPlayInfo_BGM
	.word	sFanfares
	.word	sFanfareCounter
.Lfe12:
	.size	 PlayFanfareByFanfareNum,.Lfe12-PlayFanfareByFanfareNum
	.align	2, 0
	.globl	WaitFanfare
	.type	 WaitFanfare,function
	.thumb_func
WaitFanfare:
	push	{lr}
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	ldr	r2, .L72
	ldrh	r0, [r2]
	cmp	r0, #0
	beq	.L67	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r2]
	mov	r0, #0x0
	b	.L71
.L73:
	.align	2, 0
.L72:
	.word	sFanfareCounter
.L67:
	cmp	r1, #0
	bne	.L69	@cond_branch
	ldr	r0, .L74
	bl	m4aMPlayContinue
	b	.L70
.L75:
	.align	2, 0
.L74:
	.word	gMPlayInfo_BGM
.L69:
	mov	r0, #0x0
	bl	m4aSongNumStart
.L70:
	mov	r0, #0x1
.L71:
	pop	{r1}
	bx	r1
.Lfe13:
	.size	 WaitFanfare,.Lfe13-WaitFanfare
	.align	2, 0
	.globl	StopFanfareByFanfareNum
	.type	 StopFanfareByFanfareNum,function
	.thumb_func
StopFanfareByFanfareNum:
	push	{lr}
	lsl	r0, r0, #0x18
	ldr	r1, .L77
	lsr	r0, r0, #0x16
	add	r0, r0, r1
	ldrh	r0, [r0]
	bl	m4aSongNumStop
	pop	{r0}
	bx	r0
.L78:
	.align	2, 0
.L77:
	.word	sFanfares
.Lfe14:
	.size	 StopFanfareByFanfareNum,.Lfe14-StopFanfareByFanfareNum
	.align	2, 0
	.globl	PlayFanfare
	.type	 PlayFanfare,function
	.thumb_func
PlayFanfare:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	mov	r1, #0x0
	ldr	r2, .L86
.L83:
	ldrh	r0, [r2]
	cmp	r0, r3
	bne	.L82	@cond_branch
	lsl	r0, r1, #0x18
	lsr	r0, r0, #0x18
	bl	PlayFanfareByFanfareNum
	bl	CreateFanfareTask
	b	.L79
.L87:
	.align	2, 0
.L86:
	.word	sFanfares
.L82:
	add	r2, r2, #0x4
	add	r1, r1, #0x1
	cmp	r1, #0x11
	bls	.L83	@cond_branch
	mov	r0, #0x0
	bl	PlayFanfareByFanfareNum
	bl	CreateFanfareTask
.L79:
	pop	{r0}
	bx	r0
.Lfe15:
	.size	 PlayFanfare,.Lfe15-PlayFanfare
	.align	2, 0
	.globl	IsFanfareTaskInactive
	.type	 IsFanfareTaskInactive,function
	.thumb_func
IsFanfareTaskInactive:
	push	{lr}
	ldr	r0, .L91
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L89	@cond_branch
	mov	r0, #0x1
	b	.L90
.L92:
	.align	2, 0
.L91:
	.word	Task_Fanfare
.L89:
	mov	r0, #0x0
.L90:
	pop	{r1}
	bx	r1
.Lfe16:
	.size	 IsFanfareTaskInactive,.Lfe16-IsFanfareTaskInactive
	.align	2, 0
	.type	 Task_Fanfare,function
	.thumb_func
Task_Fanfare:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r1, .L96
	ldrh	r0, [r1]
	cmp	r0, #0
	beq	.L94	@cond_branch
	sub	r0, r0, #0x1
	strh	r0, [r1]
	b	.L95
.L97:
	.align	2, 0
.L96:
	.word	sFanfareCounter
.L94:
	ldr	r0, .L98
	bl	m4aMPlayContinue
	add	r0, r4, #0
	bl	DestroyTask
.L95:
	pop	{r4}
	pop	{r0}
	bx	r0
.L99:
	.align	2, 0
.L98:
	.word	gMPlayInfo_BGM
.Lfe17:
	.size	 Task_Fanfare,.Lfe17-Task_Fanfare
	.align	2, 0
	.type	 CreateFanfareTask,function
	.thumb_func
CreateFanfareTask:
	push	{r4, lr}
	ldr	r4, .L102
	add	r0, r4, #0
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L101	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x50
	bl	CreateTask
.L101:
	pop	{r4}
	pop	{r0}
	bx	r0
.L103:
	.align	2, 0
.L102:
	.word	Task_Fanfare
.Lfe18:
	.size	 CreateFanfareTask,.Lfe18-CreateFanfareTask
	.align	2, 0
	.globl	FadeInNewBGM
	.type	 FadeInNewBGM,function
	.thumb_func
FadeInNewBGM:
	push	{r4, r5, r6, r7, lr}
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r7, r1, #0x18
	ldr	r0, .L107
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L104	@cond_branch
	ldr	r6, .L107+0x4
	cmp	r5, r6
	bne	.L106	@cond_branch
	mov	r5, #0x0
.L106:
	add	r0, r5, #0
	bl	m4aSongNumStart
	ldr	r4, .L107+0x8
	add	r0, r4, #0
	bl	m4aMPlayImmInit
	add	r0, r4, #0
	add	r1, r6, #0
	mov	r2, #0x0
	bl	m4aMPlayVolumeControl
	add	r0, r5, #0
	bl	m4aSongNumStop
	add	r0, r4, #0
	add	r1, r7, #0
	bl	m4aMPlayFadeIn
.L104:
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L108:
	.align	2, 0
.L107:
	.word	gDisableMusic
	.word	0xffff
	.word	gMPlayInfo_BGM
.Lfe19:
	.size	 FadeInNewBGM,.Lfe19-FadeInNewBGM
	.align	2, 0
	.globl	FadeOutBGMTemporarily
	.type	 FadeOutBGMTemporarily,function
	.thumb_func
FadeOutBGMTemporarily:
	push	{lr}
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r0, .L110
	bl	m4aMPlayFadeOutTemporarily
	pop	{r0}
	bx	r0
.L111:
	.align	2, 0
.L110:
	.word	gMPlayInfo_BGM
.Lfe20:
	.size	 FadeOutBGMTemporarily,.Lfe20-FadeOutBGMTemporarily
	.align	2, 0
	.globl	IsBGMPausedOrStopped
	.type	 IsBGMPausedOrStopped,function
	.thumb_func
IsBGMPausedOrStopped:
	push	{lr}
	ldr	r0, .L116
	ldr	r1, [r0, #0x4]
	cmp	r1, #0
	blt	.L114	@cond_branch
	ldr	r0, .L116+0x4
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L114	@cond_branch
	mov	r0, #0x0
	b	.L115
.L117:
	.align	2, 0
.L116:
	.word	gMPlayInfo_BGM
	.word	0xffff
.L114:
	mov	r0, #0x1
.L115:
	pop	{r1}
	bx	r1
.Lfe21:
	.size	 IsBGMPausedOrStopped,.Lfe21-IsBGMPausedOrStopped
	.align	2, 0
	.globl	FadeInBGM
	.type	 FadeInBGM,function
	.thumb_func
FadeInBGM:
	push	{lr}
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r0, .L119
	bl	m4aMPlayFadeIn
	pop	{r0}
	bx	r0
.L120:
	.align	2, 0
.L119:
	.word	gMPlayInfo_BGM
.Lfe22:
	.size	 FadeInBGM,.Lfe22-FadeInBGM
	.align	2, 0
	.globl	FadeOutBGM
	.type	 FadeOutBGM,function
	.thumb_func
FadeOutBGM:
	push	{lr}
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	ldr	r0, .L122
	bl	m4aMPlayFadeOut
	pop	{r0}
	bx	r0
.L123:
	.align	2, 0
.L122:
	.word	gMPlayInfo_BGM
.Lfe23:
	.size	 FadeOutBGM,.Lfe23-FadeOutBGM
	.align	2, 0
	.globl	IsBGMStopped
	.type	 IsBGMStopped,function
	.thumb_func
IsBGMStopped:
	push	{lr}
	ldr	r0, .L127
	ldrh	r0, [r0, #0x4]
	cmp	r0, #0
	beq	.L125	@cond_branch
	mov	r0, #0x0
	b	.L126
.L128:
	.align	2, 0
.L127:
	.word	gMPlayInfo_BGM
.L125:
	mov	r0, #0x1
.L126:
	pop	{r1}
	bx	r1
.Lfe24:
	.size	 IsBGMStopped,.Lfe24-IsBGMStopped
	.align	2, 0
	.globl	PlayCry1
	.type	 PlayCry1,function
	.thumb_func
PlayCry1:
	push	{r4, r5, r6, lr}
	add	sp, sp, #-0x4
	lsl	r0, r0, #0x10
	lsr	r6, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	ldr	r0, .L131
	ldrb	r4, [r0]
	cmp	r4, #0
	bne	.L129	@cond_branch
	ldr	r0, .L131+0x4
	ldr	r1, .L131+0x8
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
	lsl	r1, r5, #0x18
	asr	r1, r1, #0x18
	str	r4, [sp]
	add	r0, r6, #0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
	ldr	r1, .L131+0xc
	mov	r0, #0x2
	strb	r0, [r1]
	bl	RestoreBGMVolumeAfterPokemonCry
.L129:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L132:
	.align	2, 0
.L131:
	.word	gDisableMusic
	.word	gMPlayInfo_BGM
	.word	0xffff
	.word	gPokemonCryBGMDuckingCounter
.Lfe25:
	.size	 PlayCry1,.Lfe25-PlayCry1
	.align	2, 0
	.globl	PlayCry2
	.type	 PlayCry2,function
	.thumb_func
PlayCry2:
	push	{r4, lr}
	add	sp, sp, #-0x4
	lsl	r0, r0, #0x10
	lsr	r4, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	ldr	r0, .L135
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L133	@cond_branch
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	lsl	r2, r2, #0x18
	asr	r2, r2, #0x18
	str	r0, [sp]
	add	r0, r4, #0
	bl	PlayCryInternal
.L133:
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
.L136:
	.align	2, 0
.L135:
	.word	gDisableMusic
.Lfe26:
	.size	 PlayCry2,.Lfe26-PlayCry2
	.align	2, 0
	.globl	PlayCry3
	.type	 PlayCry3,function
	.thumb_func
PlayCry3:
	push	{r4, r5, r6, lr}
	add	sp, sp, #-0x4
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	add	r6, r3, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r4, r2, #0
	ldr	r0, .L141
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L137	@cond_branch
	cmp	r2, #0x1
	bne	.L139	@cond_branch
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	str	r2, [sp]
	add	r0, r3, #0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
	b	.L137
.L142:
	.align	2, 0
.L141:
	.word	gDisableMusic
.L139:
	ldr	r0, .L143
	ldr	r1, .L143+0x4
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
	lsl	r1, r5, #0x18
	asr	r1, r1, #0x18
	str	r4, [sp]
	add	r0, r6, #0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
	ldr	r1, .L143+0x8
	mov	r0, #0x2
	strb	r0, [r1]
	bl	RestoreBGMVolumeAfterPokemonCry
.L137:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L144:
	.align	2, 0
.L143:
	.word	gMPlayInfo_BGM
	.word	0xffff
	.word	gPokemonCryBGMDuckingCounter
.Lfe27:
	.size	 PlayCry3,.Lfe27-PlayCry3
	.align	2, 0
	.globl	PlayCry4
	.type	 PlayCry4,function
	.thumb_func
PlayCry4:
	push	{r4, r5, r6, lr}
	add	sp, sp, #-0x4
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	add	r6, r3, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r4, r2, #0
	ldr	r0, .L150
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L145	@cond_branch
	cmp	r2, #0x1
	bne	.L147	@cond_branch
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	str	r2, [sp]
	add	r0, r3, #0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
	b	.L145
.L151:
	.align	2, 0
.L150:
	.word	gDisableMusic
.L147:
	ldr	r0, .L152
	ldr	r0, [r0]
	mov	r1, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L149	@cond_branch
	ldr	r0, .L152+0x4
	ldr	r1, .L152+0x8
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
.L149:
	lsl	r1, r5, #0x18
	asr	r1, r1, #0x18
	str	r4, [sp]
	add	r0, r6, #0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
.L145:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L153:
	.align	2, 0
.L152:
	.word	gBattleTypeFlags
	.word	gMPlayInfo_BGM
	.word	0xffff
.Lfe28:
	.size	 PlayCry4,.Lfe28-PlayCry4
	.align	2, 0
	.globl	PlayCry6
	.type	 PlayCry6,function
	.thumb_func
PlayCry6:
	push	{r4, r5, r6, lr}
	add	sp, sp, #-0x4
	lsl	r0, r0, #0x10
	lsr	r3, r0, #0x10
	add	r6, r3, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r5, r1, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r4, r2, #0
	ldr	r0, .L158
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L154	@cond_branch
	cmp	r2, #0x1
	bne	.L156	@cond_branch
	lsl	r1, r1, #0x18
	asr	r1, r1, #0x18
	str	r2, [sp]
	add	r0, r3, #0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
	b	.L154
.L159:
	.align	2, 0
.L158:
	.word	gDisableMusic
.L156:
	ldr	r0, .L160
	ldr	r1, .L160+0x4
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
	lsl	r1, r5, #0x18
	asr	r1, r1, #0x18
	str	r4, [sp]
	add	r0, r6, #0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
	ldr	r1, .L160+0x8
	mov	r0, #0x2
	strb	r0, [r1]
.L154:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L161:
	.align	2, 0
.L160:
	.word	gMPlayInfo_BGM
	.word	0xffff
	.word	gPokemonCryBGMDuckingCounter
.Lfe29:
	.size	 PlayCry6,.Lfe29-PlayCry6
	.align	2, 0
	.globl	PlayCry5
	.type	 PlayCry5,function
	.thumb_func
PlayCry5:
	push	{r4, r5, lr}
	add	sp, sp, #-0x4
	lsl	r0, r0, #0x10
	lsr	r5, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r4, r1, #0x18
	ldr	r0, .L164
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L162	@cond_branch
	ldr	r0, .L164+0x4
	ldr	r1, .L164+0x8
	mov	r2, #0x55
	bl	m4aMPlayVolumeControl
	str	r4, [sp]
	add	r0, r5, #0
	mov	r1, #0x0
	mov	r2, #0x78
	mov	r3, #0xa
	bl	PlayCryInternal
	ldr	r1, .L164+0xc
	mov	r0, #0x2
	strb	r0, [r1]
	bl	RestoreBGMVolumeAfterPokemonCry
.L162:
	add	sp, sp, #0x4
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L165:
	.align	2, 0
.L164:
	.word	gDisableMusic
	.word	gMPlayInfo_BGM
	.word	0xffff
	.word	gPokemonCryBGMDuckingCounter
.Lfe30:
	.size	 PlayCry5,.Lfe30-PlayCry5
	.align	2, 0
	.globl	PlayCryInternal
	.type	 PlayCryInternal,function
	.thumb_func
PlayCryInternal:
	push	{r4, r5, r6, r7, lr}
	mov	r7, sl
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6, r7}
	add	sp, sp, #-0x4
	ldr	r4, [sp, #0x24]
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	mov	sl, r1
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	lsl	r3, r3, #0x18
	lsr	r3, r3, #0x18
	str	r3, [sp]
	lsl	r4, r4, #0x18
	lsr	r0, r4, #0x18
	mov	r6, #0x8c
	mov	r1, #0x0
	mov	r9, r1
	mov	r5, #0x0
	mov	r4, #0xf0
	lsl	r4, r4, #0x6
	mov	r8, r5
	cmp	r0, #0xc
	bhi	.L167	@cond_branch
	lsl	r0, r0, #0x2
	ldr	r1, .L187
	add	r0, r0, r1
	ldr	r0, [r0]
	mov	pc, r0
.L188:
	.align	2, 0
.L187:
	.word	.L181
	.align	2, 0
	.align	2, 0
.L181:
	.word	.L167
	.word	.L169
	.word	.L170
	.word	.L171
	.word	.L172
	.word	.L173
	.word	.L174
	.word	.L175
	.word	.L176
	.word	.L177
	.word	.L178
	.word	.L180
	.word	.L179
.L169:
	mov	r6, #0x14
	mov	r5, #0xe1
	b	.L167
.L170:
	mov	r5, #0xe1
	ldr	r4, .L189
	mov	r0, #0x14
	mov	r8, r0
	mov	r2, #0x5a
	b	.L167
.L190:
	.align	2, 0
.L189:
	.word	0x3cf0
.L171:
	mov	r6, #0x32
	mov	r5, #0xc8
	ldr	r4, .L191
	mov	r1, #0x14
	b	.L185
.L192:
	.align	2, 0
.L191:
	.word	0x3db8
.L172:
	mov	r6, #0x19
	mov	r0, #0x1
	mov	r9, r0
	mov	r5, #0x64
	ldr	r4, .L193
	mov	r1, #0xc0
.L185:
	mov	r8, r1
	mov	r2, #0x5a
	b	.L167
.L194:
	.align	2, 0
.L193:
	.word	0x3cf0
.L173:
	mov	r5, #0xc8
	ldr	r4, .L195
	b	.L167
.L196:
	.align	2, 0
.L195:
	.word	0x3868
.L174:
	mov	r5, #0xdc
	ldr	r4, .L197
	mov	r0, #0xc0
	mov	r8, r0
	mov	r2, #0x46
	b	.L167
.L198:
	.align	2, 0
.L197:
	.word	0x3cc3
.L175:
	mov	r6, #0xa
	mov	r5, #0x64
	mov	r4, #0xe8
	lsl	r4, r4, #0x6
	b	.L167
.L176:
	mov	r6, #0x3c
	mov	r5, #0xe1
	mov	r4, #0xf4
	lsl	r4, r4, #0x6
	b	.L167
.L177:
	mov	r6, #0xf
	mov	r1, #0x1
	mov	r9, r1
	mov	r5, #0x7d
	ldr	r4, .L199
	b	.L167
.L200:
	.align	2, 0
.L199:
	.word	0x3b60
.L178:
	mov	r6, #0x64
	mov	r5, #0xe1
	ldr	r4, .L201
	b	.L167
.L202:
	.align	2, 0
.L201:
	.word	0x3b60
.L179:
	mov	r6, #0x14
	mov	r5, #0xe1
.L180:
	ldr	r4, .L203
.L167:
	add	r0, r2, #0
	bl	SetPokemonCryVolume
	mov	r1, sl
	lsl	r0, r1, #0x18
	asr	r0, r0, #0x18
	bl	SetPokemonCryPanpot
	add	r0, r4, #0
	bl	SetPokemonCryPitch
	add	r0, r6, #0
	bl	SetPokemonCryLength
	mov	r0, #0x0
	bl	SetPokemonCryProgress
	add	r0, r5, #0
	bl	SetPokemonCryRelease
	mov	r1, r8
	lsl	r0, r1, #0x18
	asr	r0, r0, #0x18
	bl	SetPokemonCryChorus
	ldr	r0, [sp]
	bl	SetPokemonCryPriority
	sub	r0, r7, #0x1
	lsl	r0, r0, #0x10
	lsr	r7, r0, #0x10
	mov	r0, r9
	cmp	r0, #0
	beq	.L183	@cond_branch
	lsl	r0, r7, #0x1
	add	r0, r0, r7
	lsl	r0, r0, #0x2
	ldr	r1, .L203+0x4
	b	.L186
.L204:
	.align	2, 0
.L203:
	.word	0x3a98
	.word	gCryTable2
.L183:
	lsl	r0, r7, #0x1
	add	r0, r0, r7
	lsl	r0, r0, #0x2
	ldr	r1, .L205
.L186:
	add	r0, r0, r1
	bl	SetPokemonCryTone
	ldr	r1, .L205+0x4
	str	r0, [r1]
	add	sp, sp, #0x4
	pop	{r3, r4, r5}
	mov	r8, r3
	mov	r9, r4
	mov	sl, r5
	pop	{r4, r5, r6, r7}
	pop	{r0}
	bx	r0
.L206:
	.align	2, 0
.L205:
	.word	gCryTable
	.word	gMPlay_PokemonCry
.Lfe31:
	.size	 PlayCryInternal,.Lfe31-PlayCryInternal
	.align	2, 0
	.globl	IsCryFinished
	.type	 IsCryFinished,function
	.thumb_func
IsCryFinished:
	push	{lr}
	ldr	r0, .L211
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L208	@cond_branch
	bl	ClearPokemonCrySongs
	mov	r0, #0x1
	b	.L210
.L212:
	.align	2, 0
.L211:
	.word	Task_DuckBGMForPokemonCry
.L208:
	mov	r0, #0x0
.L210:
	pop	{r1}
	bx	r1
.Lfe32:
	.size	 IsCryFinished,.Lfe32-IsCryFinished
	.align	2, 0
	.globl	StopCryAndClearCrySongs
	.type	 StopCryAndClearCrySongs,function
	.thumb_func
StopCryAndClearCrySongs:
	push	{lr}
	ldr	r0, .L214
	ldr	r0, [r0]
	bl	m4aMPlayStop
	bl	ClearPokemonCrySongs
	pop	{r0}
	bx	r0
.L215:
	.align	2, 0
.L214:
	.word	gMPlay_PokemonCry
.Lfe33:
	.size	 StopCryAndClearCrySongs,.Lfe33-StopCryAndClearCrySongs
	.align	2, 0
	.globl	StopCry
	.type	 StopCry,function
	.thumb_func
StopCry:
	push	{lr}
	ldr	r0, .L217
	ldr	r0, [r0]
	bl	m4aMPlayStop
	pop	{r0}
	bx	r0
.L218:
	.align	2, 0
.L217:
	.word	gMPlay_PokemonCry
.Lfe34:
	.size	 StopCry,.Lfe34-StopCry
	.align	2, 0
	.globl	IsCryPlayingOrClearCrySongs
	.type	 IsCryPlayingOrClearCrySongs,function
	.thumb_func
IsCryPlayingOrClearCrySongs:
	push	{lr}
	ldr	r0, .L223
	ldr	r0, [r0]
	bl	IsPokemonCryPlaying
	cmp	r0, #0
	bne	.L220	@cond_branch
	bl	ClearPokemonCrySongs
	mov	r0, #0x0
	b	.L222
.L224:
	.align	2, 0
.L223:
	.word	gMPlay_PokemonCry
.L220:
	mov	r0, #0x1
.L222:
	pop	{r1}
	bx	r1
.Lfe35:
	.size	 IsCryPlayingOrClearCrySongs,.Lfe35-IsCryPlayingOrClearCrySongs
	.align	2, 0
	.globl	IsCryPlaying
	.type	 IsCryPlaying,function
	.thumb_func
IsCryPlaying:
	push	{lr}
	ldr	r0, .L229
	ldr	r0, [r0]
	bl	IsPokemonCryPlaying
	cmp	r0, #0
	bne	.L226	@cond_branch
	mov	r0, #0x0
	b	.L228
.L230:
	.align	2, 0
.L229:
	.word	gMPlay_PokemonCry
.L226:
	mov	r0, #0x1
.L228:
	pop	{r1}
	bx	r1
.Lfe36:
	.size	 IsCryPlaying,.Lfe36-IsCryPlaying
	.align	2, 0
	.type	 Task_DuckBGMForPokemonCry,function
	.thumb_func
Task_DuckBGMForPokemonCry:
	push	{r4, lr}
	lsl	r0, r0, #0x18
	lsr	r4, r0, #0x18
	ldr	r1, .L234
	ldrb	r0, [r1]
	cmp	r0, #0
	beq	.L232	@cond_branch
	sub	r0, r0, #0x1
	strb	r0, [r1]
	b	.L231
.L235:
	.align	2, 0
.L234:
	.word	gPokemonCryBGMDuckingCounter
.L232:
	ldr	r0, .L236
	ldr	r0, [r0]
	bl	IsPokemonCryPlaying
	cmp	r0, #0
	bne	.L231	@cond_branch
	ldr	r0, .L236+0x4
	ldr	r1, .L236+0x8
	mov	r2, #0x80
	lsl	r2, r2, #0x1
	bl	m4aMPlayVolumeControl
	add	r0, r4, #0
	bl	DestroyTask
.L231:
	pop	{r4}
	pop	{r0}
	bx	r0
.L237:
	.align	2, 0
.L236:
	.word	gMPlay_PokemonCry
	.word	gMPlayInfo_BGM
	.word	0xffff
.Lfe37:
	.size	 Task_DuckBGMForPokemonCry,.Lfe37-Task_DuckBGMForPokemonCry
	.align	2, 0
	.type	 RestoreBGMVolumeAfterPokemonCry,function
	.thumb_func
RestoreBGMVolumeAfterPokemonCry:
	push	{r4, lr}
	ldr	r4, .L240
	add	r0, r4, #0
	bl	FuncIsActiveTask
	lsl	r0, r0, #0x18
	lsr	r0, r0, #0x18
	cmp	r0, #0x1
	beq	.L239	@cond_branch
	add	r0, r4, #0
	mov	r1, #0x50
	bl	CreateTask
.L239:
	pop	{r4}
	pop	{r0}
	bx	r0
.L241:
	.align	2, 0
.L240:
	.word	Task_DuckBGMForPokemonCry
.Lfe38:
	.size	 RestoreBGMVolumeAfterPokemonCry,.Lfe38-RestoreBGMVolumeAfterPokemonCry
	.align	2, 0
	.globl	PlayBGM
	.type	 PlayBGM,function
	.thumb_func
PlayBGM:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	ldr	r0, .L245
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L242	@cond_branch
	ldr	r0, .L245+0x4
	cmp	r1, r0
	beq	.L242	@cond_branch
	add	r0, r1, #0
	bl	m4aSongNumStart
.L242:
	pop	{r0}
	bx	r0
.L246:
	.align	2, 0
.L245:
	.word	gDisableMusic
	.word	0xffff
.Lfe39:
	.size	 PlayBGM,.Lfe39-PlayBGM
	.align	2, 0
	.globl	PlaySE
	.type	 PlaySE,function
	.thumb_func
PlaySE:
	push	{lr}
	lsl	r0, r0, #0x10
	lsr	r1, r0, #0x10
	ldr	r0, .L249
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L247	@cond_branch
	add	r0, r1, #0
	bl	m4aSongNumStart
.L247:
	pop	{r0}
	bx	r0
.L250:
	.align	2, 0
.L249:
	.word	gDisableMusic
.Lfe40:
	.size	 PlaySE,.Lfe40-PlaySE
	.align	2, 0
	.globl	PlaySE12WithPanning
	.type	 PlaySE12WithPanning,function
	.thumb_func
PlaySE12WithPanning:
	push	{r4, r5, r6, lr}
	mov	r6, r8
	push	{r6}
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r4, r1, #0x18
	ldr	r0, .L253
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L251	@cond_branch
	add	r0, r2, #0
	bl	m4aSongNumStart
	ldr	r6, .L253+0x4
	add	r0, r6, #0
	bl	m4aMPlayImmInit
	ldr	r0, .L253+0x8
	mov	r8, r0
	bl	m4aMPlayImmInit
	ldr	r5, .L253+0xc
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	add	r0, r6, #0
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	mov	r0, r8
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
.L251:
	pop	{r3}
	mov	r8, r3
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L254:
	.align	2, 0
.L253:
	.word	gDisableMusic
	.word	gMPlayInfo_SE1
	.word	gMPlayInfo_SE2
	.word	0xffff
.Lfe41:
	.size	 PlaySE12WithPanning,.Lfe41-PlaySE12WithPanning
	.align	2, 0
	.globl	PlaySE1WithPanning
	.type	 PlaySE1WithPanning,function
	.thumb_func
PlaySE1WithPanning:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	ldr	r0, .L257
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L255	@cond_branch
	add	r0, r2, #0
	bl	m4aSongNumStart
	ldr	r4, .L257+0x4
	add	r0, r4, #0
	bl	m4aMPlayImmInit
	ldr	r1, .L257+0x8
	lsl	r2, r5, #0x18
	asr	r2, r2, #0x18
	add	r0, r4, #0
	bl	m4aMPlayPanpotControl
.L255:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L258:
	.align	2, 0
.L257:
	.word	gDisableMusic
	.word	gMPlayInfo_SE1
	.word	0xffff
.Lfe42:
	.size	 PlaySE1WithPanning,.Lfe42-PlaySE1WithPanning
	.align	2, 0
	.globl	PlaySE2WithPanning
	.type	 PlaySE2WithPanning,function
	.thumb_func
PlaySE2WithPanning:
	push	{r4, r5, lr}
	lsl	r0, r0, #0x10
	lsr	r2, r0, #0x10
	lsl	r1, r1, #0x18
	lsr	r5, r1, #0x18
	ldr	r0, .L261
	ldrb	r0, [r0]
	cmp	r0, #0
	bne	.L259	@cond_branch
	add	r0, r2, #0
	bl	m4aSongNumStart
	ldr	r4, .L261+0x4
	add	r0, r4, #0
	bl	m4aMPlayImmInit
	ldr	r1, .L261+0x8
	lsl	r2, r5, #0x18
	asr	r2, r2, #0x18
	add	r0, r4, #0
	bl	m4aMPlayPanpotControl
.L259:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L262:
	.align	2, 0
.L261:
	.word	gDisableMusic
	.word	gMPlayInfo_SE2
	.word	0xffff
.Lfe43:
	.size	 PlaySE2WithPanning,.Lfe43-PlaySE2WithPanning
	.align	2, 0
	.globl	SE12PanpotControl
	.type	 SE12PanpotControl,function
	.thumb_func
SE12PanpotControl:
	push	{r4, r5, lr}
	add	r4, r0, #0
	ldr	r0, .L264
	ldr	r5, .L264+0x4
	lsl	r4, r4, #0x18
	asr	r4, r4, #0x18
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	ldr	r0, .L264+0x8
	add	r1, r5, #0
	add	r2, r4, #0
	bl	m4aMPlayPanpotControl
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L265:
	.align	2, 0
.L264:
	.word	gMPlayInfo_SE1
	.word	0xffff
	.word	gMPlayInfo_SE2
.Lfe44:
	.size	 SE12PanpotControl,.Lfe44-SE12PanpotControl
	.align	2, 0
	.globl	IsSEPlaying
	.type	 IsSEPlaying,function
	.thumb_func
IsSEPlaying:
	push	{lr}
	ldr	r0, .L271
	ldr	r1, [r0, #0x4]
	mov	r2, #0x80
	lsl	r2, r2, #0x18
	add	r3, r0, #0
	cmp	r1, #0
	bge	.L267	@cond_branch
	ldr	r0, .L271+0x4
	ldr	r0, [r0, #0x4]
	and	r0, r0, r2
	cmp	r0, #0
	bne	.L270	@cond_branch
.L267:
	ldr	r1, .L271+0x8
	ldrh	r0, [r3, #0x4]
	cmp	r0, #0
	bne	.L268	@cond_branch
	ldr	r0, .L271+0x4
	ldr	r0, [r0, #0x4]
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L268	@cond_branch
.L270:
	mov	r0, #0x0
	b	.L269
.L272:
	.align	2, 0
.L271:
	.word	gMPlayInfo_SE1
	.word	gMPlayInfo_SE2
	.word	0xffff
.L268:
	mov	r0, #0x1
.L269:
	pop	{r1}
	bx	r1
.Lfe45:
	.size	 IsSEPlaying,.Lfe45-IsSEPlaying
	.align	2, 0
	.globl	IsBGMPlaying
	.type	 IsBGMPlaying,function
	.thumb_func
IsBGMPlaying:
	push	{lr}
	ldr	r0, .L277
	ldr	r1, [r0, #0x4]
	cmp	r1, #0
	blt	.L275	@cond_branch
	ldr	r0, .L277+0x4
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L275	@cond_branch
	mov	r0, #0x1
	b	.L276
.L278:
	.align	2, 0
.L277:
	.word	gMPlayInfo_BGM
	.word	0xffff
.L275:
	mov	r0, #0x0
.L276:
	pop	{r1}
	bx	r1
.Lfe46:
	.size	 IsBGMPlaying,.Lfe46-IsBGMPlaying
	.align	2, 0
	.globl	IsSpecialSEPlaying
	.type	 IsSpecialSEPlaying,function
	.thumb_func
IsSpecialSEPlaying:
	push	{lr}
	ldr	r0, .L283
	ldr	r1, [r0, #0x4]
	cmp	r1, #0
	blt	.L281	@cond_branch
	ldr	r0, .L283+0x4
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L281	@cond_branch
	mov	r0, #0x1
	b	.L282
.L284:
	.align	2, 0
.L283:
	.word	gMPlayInfo_SE3
	.word	0xffff
.L281:
	mov	r0, #0x0
.L282:
	pop	{r1}
	bx	r1
.Lfe47:
	.size	 IsSpecialSEPlaying,.Lfe47-IsSpecialSEPlaying
	.comm	gDisableMusic, 4	@ 1

	.lcomm	sCurrentMapMusic,2

	.lcomm	sNextMapMusic,2

	.lcomm	sMapMusicState,1

	.lcomm	sMapMusicFadeInSpeed,1

	.lcomm	sFanfareCounter,2
.text
	.align	2, 0

