@ Generated by gcc 2.9-arm-000512 for Thumb/elf
	.code	16
.gcc2_compiled.:
	.section .rodata
	.align	2, 0
	.type	 sSafariBufferCommands,object
	.size	 sSafariBufferCommands,232
sSafariBufferCommands:
	.word	SafariHandleGetMonData
	.word	SafariHandleGetRawMonData
	.word	SafariHandleSetMonData
	.word	SafariHandleSetRawMonData
	.word	SafariHandleLoadMonSprite
	.word	SafariHandleSwitchInAnim
	.word	SafariHandleReturnMonToBall
	.word	SafariHandleDrawTrainerPic
	.word	SafariHandleTrainerSlide
	.word	SafariHandleTrainerSlideBack
	.word	SafariHandleFaintAnimation
	.word	SafariHandlePaletteFade
	.word	SafariHandleSuccessBallThrowAnim
	.word	SafariHandleBallThrowAnim
	.word	SafariHandlePause
	.word	SafariHandleMoveAnimation
	.word	SafariHandlePrintString
	.word	SafariHandlePrintSelectionString
	.word	SafariHandleChooseAction
	.word	SafariHandleUnknownYesNoBox
	.word	SafariHandleChooseMove
	.word	SafariHandleChooseItem
	.word	SafariHandleChoosePokemon
	.word	SafariHandleCmd23
	.word	SafariHandleHealthBarUpdate
	.word	SafariHandleExpUpdate
	.word	SafariHandleStatusIconUpdate
	.word	SafariHandleStatusAnimation
	.word	SafariHandleStatusXor
	.word	SafariHandleDataTransfer
	.word	SafariHandleDMA3Transfer
	.word	SafariHandlePlayBGM
	.word	SafariHandleCmd32
	.word	SafariHandleTwoReturnValues
	.word	SafariHandleChosenMonReturnValue
	.word	SafariHandleOneReturnValue
	.word	SafariHandleOneReturnValue_Duplicate
	.word	SafariHandleCmd37
	.word	SafariHandleCmd38
	.word	SafariHandleCmd39
	.word	SafariHandleCmd40
	.word	SafariHandleHitAnimation
	.word	SafariHandleCmd42
	.word	SafariHandlePlaySE
	.word	SafariHandlePlayFanfareOrBGM
	.word	SafariHandleFaintingCry
	.word	SafariHandleIntroSlide
	.word	SafariHandleIntroTrainerBallThrow
	.word	SafariHandleDrawPartyStatusSummary
	.word	SafariHandleHidePartyStatusSummary
	.word	SafariHandleEndBounceEffect
	.word	SafariHandleSpriteInvisibility
	.word	SafariHandleBattleAnimation
	.word	SafariHandleLinkStandbyMsg
	.word	SafariHandleResetActionMoveSelection
	.word	SafariHandleCmd55
	.word	SafariHandleBattleDebug
	.word	SafariCmdEnd
.text
	.align	2, 0
	.type	 SpriteCB_Null4,function
	.thumb_func
SpriteCB_Null4:
	bx	lr
.Lfe1:
	.size	 SpriteCB_Null4,.Lfe1-SpriteCB_Null4
	.align	2, 0
	.globl	SetControllerToSafari
	.type	 SetControllerToSafari,function
	.thumb_func
SetControllerToSafari:
	ldr	r1, .L4
	ldr	r0, .L4+0x4
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L4+0x8
	str	r1, [r0]
	bx	lr
.L5:
	.align	2, 0
.L4:
	.word	gBattlerControllerFuncs
	.word	gActiveBattler
	.word	SafariBufferRunCommand
.Lfe2:
	.size	 SetControllerToSafari,.Lfe2-SetControllerToSafari
	.align	2, 0
	.type	 SafariBufferRunCommand,function
	.thumb_func
SafariBufferRunCommand:
	push	{lr}
	ldr	r2, .L10
	ldr	r1, .L10+0x4
	ldr	r0, .L10+0x8
	ldrb	r3, [r0]
	lsl	r0, r3, #0x2
	add	r0, r0, r1
	ldr	r1, [r2]
	ldr	r0, [r0]
	and	r1, r1, r0
	cmp	r1, #0
	beq	.L7	@cond_branch
	ldr	r0, .L10+0xc
	ldr	r0, [r0]
	lsl	r1, r3, #0x9
	add	r0, r0, #0x20
	add	r1, r0, r1
	ldrb	r0, [r1]
	cmp	r0, #0x39
	bhi	.L8	@cond_branch
	ldr	r0, .L10+0x10
	ldrb	r1, [r1]
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldr	r0, [r1]
	bl	_call_via_r0
	b	.L7
.L11:
	.align	2, 0
.L10:
	.word	gBattleControllerExecFlags
	.word	gBitTable
	.word	gActiveBattler
	.word	gBattleResources
	.word	sSafariBufferCommands
.L8:
	bl	SafariBufferExecCompleted
.L7:
	pop	{r0}
	bx	r0
.Lfe3:
	.size	 SafariBufferRunCommand,.Lfe3-SafariBufferRunCommand
	.align	2, 0
	.type	 HandleInputChooseAction,function
	.thumb_func
HandleInputChooseAction:
	push	{r4, r5, lr}
	ldr	r0, .L36
	ldrh	r1, [r0, #0x2e]
	mov	r2, #0x1
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L13	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	ldr	r1, .L36+0x4
	ldr	r0, .L36+0x8
	ldrb	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	cmp	r0, #0x1
	beq	.L16	@cond_branch
	cmp	r0, #0x1
	bgt	.L21	@cond_branch
	cmp	r0, #0
	beq	.L15	@cond_branch
	b	.L14
.L37:
	.align	2, 0
.L36:
	.word	gMain
	.word	gActionSelectionCursor
	.word	gActiveBattler
.L21:
	cmp	r0, #0x2
	beq	.L17	@cond_branch
	cmp	r0, #0x3
	beq	.L18	@cond_branch
	b	.L14
.L15:
	mov	r0, #0x1
	mov	r1, #0x5
	b	.L34
.L16:
	mov	r0, #0x1
	mov	r1, #0x6
	b	.L34
.L17:
	mov	r0, #0x1
	mov	r1, #0x7
.L34:
	mov	r2, #0x0
	bl	BtlController_EmitTwoReturnValues
	b	.L14
.L18:
	mov	r0, #0x1
	mov	r1, #0x8
	mov	r2, #0x0
	bl	BtlController_EmitTwoReturnValues
.L14:
	bl	SafariBufferExecCompleted
	b	.L22
.L13:
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L23	@cond_branch
	ldr	r5, .L38
	ldr	r4, .L38+0x4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L22	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	ActionSelectionDestroyCursorAt
	ldrb	r1, [r4]
	add	r1, r1, r5
	ldrb	r0, [r1]
	mov	r2, #0x1
	b	.L35
.L39:
	.align	2, 0
.L38:
	.word	gActionSelectionCursor
	.word	gActiveBattler
.L23:
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L26	@cond_branch
	ldr	r5, .L40
	ldr	r4, .L40+0x4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	add	r0, r2, #0
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L22	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	ActionSelectionDestroyCursorAt
	ldrb	r1, [r4]
	add	r1, r1, r5
	ldrb	r0, [r1]
	mov	r2, #0x1
	b	.L35
.L41:
	.align	2, 0
.L40:
	.word	gActionSelectionCursor
	.word	gActiveBattler
.L26:
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L29	@cond_branch
	ldr	r5, .L42
	ldr	r4, .L42+0x4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L22	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	ActionSelectionDestroyCursorAt
	ldrb	r1, [r4]
	add	r1, r1, r5
	ldrb	r0, [r1]
	mov	r2, #0x2
.L35:
	eor	r0, r0, r2
	strb	r0, [r1]
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	mov	r1, #0x0
	bl	ActionSelectionCreateCursorAt
	b	.L22
.L43:
	.align	2, 0
.L42:
	.word	gActionSelectionCursor
	.word	gActiveBattler
.L29:
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L22	@cond_branch
	ldr	r5, .L44
	ldr	r4, .L44+0x4
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r1, [r0]
	mov	r0, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L22	@cond_branch
	mov	r0, #0x5
	bl	PlaySE
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	ActionSelectionDestroyCursorAt
	ldrb	r1, [r4]
	add	r1, r1, r5
	ldrb	r0, [r1]
	mov	r2, #0x2
	eor	r0, r0, r2
	strb	r0, [r1]
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	mov	r1, #0x0
	bl	ActionSelectionCreateCursorAt
.L22:
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L45:
	.align	2, 0
.L44:
	.word	gActionSelectionCursor
	.word	gActiveBattler
.Lfe4:
	.size	 HandleInputChooseAction,.Lfe4-HandleInputChooseAction
	.align	2, 0
	.type	 CompleteOnBattlerSpriteCallbackDummy,function
	.thumb_func
CompleteOnBattlerSpriteCallbackDummy:
	push	{lr}
	ldr	r2, .L48
	ldr	r1, .L48+0x4
	ldr	r0, .L48+0x8
	ldrb	r0, [r0]
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r2, r2, #0x1c
	add	r0, r0, r2
	ldr	r1, [r0]
	ldr	r0, .L48+0xc
	cmp	r1, r0
	bne	.L47	@cond_branch
	bl	SafariBufferExecCompleted
.L47:
	pop	{r0}
	bx	r0
.L49:
	.align	2, 0
.L48:
	.word	gSprites
	.word	gBattlerSpriteIds
	.word	gActiveBattler
	.word	SpriteCallbackDummy
.Lfe5:
	.size	 CompleteOnBattlerSpriteCallbackDummy,.Lfe5-CompleteOnBattlerSpriteCallbackDummy
	.align	2, 0
	.type	 CompleteOnInactiveTextPrinter,function
	.thumb_func
CompleteOnInactiveTextPrinter:
	push	{lr}
	mov	r0, #0x0
	bl	IsTextPrinterActive
	lsl	r0, r0, #0x10
	cmp	r0, #0
	bne	.L51	@cond_branch
	bl	SafariBufferExecCompleted
.L51:
	pop	{r0}
	bx	r0
.Lfe6:
	.size	 CompleteOnInactiveTextPrinter,.Lfe6-CompleteOnInactiveTextPrinter
	.align	2, 0
	.type	 CompleteOnHealthboxSpriteCallbackDummy,function
	.thumb_func
CompleteOnHealthboxSpriteCallbackDummy:
	push	{lr}
	ldr	r2, .L54
	ldr	r1, .L54+0x4
	ldr	r0, .L54+0x8
	ldrb	r0, [r0]
	add	r0, r0, r1
	ldrb	r1, [r0]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r2, r2, #0x1c
	add	r0, r0, r2
	ldr	r1, [r0]
	ldr	r0, .L54+0xc
	cmp	r1, r0
	bne	.L53	@cond_branch
	bl	SafariBufferExecCompleted
.L53:
	pop	{r0}
	bx	r0
.L55:
	.align	2, 0
.L54:
	.word	gSprites
	.word	gHealthboxSpriteIds
	.word	gActiveBattler
	.word	SpriteCallbackDummy
.Lfe7:
	.size	 CompleteOnHealthboxSpriteCallbackDummy,.Lfe7-CompleteOnHealthboxSpriteCallbackDummy
	.align	2, 0
	.type	 sub_81595E4,function
	.thumb_func
sub_81595E4:
	push	{lr}
	ldr	r0, .L58
	ldrb	r1, [r0, #0x7]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L57	@cond_branch
	ldr	r2, .L58+0x4
	ldr	r0, .L58+0x8
	add	r3, r2, r0
	ldrb	r1, [r3]
	mov	r0, #0x3
	neg	r0, r0
	and	r0, r0, r1
	strb	r0, [r3]
	ldr	r0, .L58+0xc
	ldr	r0, [r0]
	str	r0, [r2]
	ldr	r0, [r2, #0x8]
	bl	SetMainCallback2
.L57:
	pop	{r0}
	bx	r0
.L59:
	.align	2, 0
.L58:
	.word	gPaletteFade
	.word	gMain
	.word	0x439
	.word	gPreBattleCallback1
.Lfe8:
	.size	 sub_81595E4,.Lfe8-sub_81595E4
	.align	2, 0
	.type	 CompleteOnSpecialAnimDone,function
	.thumb_func
CompleteOnSpecialAnimDone:
	push	{lr}
	ldr	r0, .L63
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L62	@cond_branch
	ldr	r0, .L63+0x4
	ldr	r2, [r0]
	ldr	r0, .L63+0x8
	ldrb	r1, [r0]
	ldr	r2, [r2, #0x4]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldrb	r1, [r0]
	mov	r0, #0x40
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L61	@cond_branch
.L62:
	bl	SafariBufferExecCompleted
.L61:
	pop	{r0}
	bx	r0
.L64:
	.align	2, 0
.L63:
	.word	gDoingBattleAnim
	.word	gBattleSpritesDataPtr
	.word	gActiveBattler
.Lfe9:
	.size	 CompleteOnSpecialAnimDone,.Lfe9-CompleteOnSpecialAnimDone
	.align	2, 0
	.type	 SafariOpenPokeblockCase,function
	.thumb_func
SafariOpenPokeblockCase:
	push	{lr}
	ldr	r0, .L67
	ldrb	r1, [r0, #0x7]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L66	@cond_branch
	ldr	r1, .L67+0x4
	ldr	r0, .L67+0x8
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L67+0xc
	str	r1, [r0]
	bl	FreeAllWindowBuffers
	bl	OpenPokeblockCaseInBattle
.L66:
	pop	{r0}
	bx	r0
.L68:
	.align	2, 0
.L67:
	.word	gPaletteFade
	.word	gBattlerControllerFuncs
	.word	gActiveBattler
	.word	CompleteWhenChosePokeblock
.Lfe10:
	.size	 SafariOpenPokeblockCase,.Lfe10-SafariOpenPokeblockCase
	.align	2, 0
	.type	 CompleteWhenChosePokeblock,function
	.thumb_func
CompleteWhenChosePokeblock:
	push	{lr}
	ldr	r0, .L71
	ldr	r1, [r0, #0x4]
	ldr	r0, .L71+0x4
	cmp	r1, r0
	bne	.L70	@cond_branch
	ldr	r0, .L71+0x8
	ldrb	r1, [r0, #0x7]
	mov	r0, #0x80
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L70	@cond_branch
	ldr	r0, .L71+0xc
	ldrh	r1, [r0]
	mov	r0, #0x1
	bl	BtlController_EmitOneReturnValue
	bl	SafariBufferExecCompleted
.L70:
	pop	{r0}
	bx	r0
.L72:
	.align	2, 0
.L71:
	.word	gMain
	.word	BattleMainCB2
	.word	gPaletteFade
	.word	gSpecialVar_ItemId
.Lfe11:
	.size	 CompleteWhenChosePokeblock,.Lfe11-CompleteWhenChosePokeblock
	.align	2, 0
	.type	 CompleteOnFinishedBattleAnimation,function
	.thumb_func
CompleteOnFinishedBattleAnimation:
	push	{lr}
	ldr	r0, .L75
	ldr	r2, [r0]
	ldr	r0, .L75+0x4
	ldrb	r1, [r0]
	ldr	r2, [r2, #0x4]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldrb	r1, [r0]
	mov	r0, #0x20
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L74	@cond_branch
	bl	SafariBufferExecCompleted
.L74:
	pop	{r0}
	bx	r0
.L76:
	.align	2, 0
.L75:
	.word	gBattleSpritesDataPtr
	.word	gActiveBattler
.Lfe12:
	.size	 CompleteOnFinishedBattleAnimation,.Lfe12-CompleteOnFinishedBattleAnimation
	.align	2, 0
	.type	 SafariBufferExecCompleted,function
	.thumb_func
SafariBufferExecCompleted:
	push	{r4, lr}
	add	sp, sp, #-0x4
	ldr	r1, .L80
	ldr	r4, .L80+0x4
	ldrb	r0, [r4]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L80+0x8
	str	r1, [r0]
	ldr	r0, .L80+0xc
	ldr	r0, [r0]
	mov	r1, #0x2
	and	r0, r0, r1
	cmp	r0, #0
	beq	.L78	@cond_branch
	bl	GetMultiplayerId
	mov	r1, sp
	strb	r0, [r1]
	mov	r0, #0x2
	mov	r1, #0x4
	mov	r2, sp
	bl	PrepareBufferDataTransferLink
	ldr	r0, .L80+0x10
	ldr	r1, [r0]
	ldrb	r0, [r4]
	lsl	r0, r0, #0x9
	add	r1, r1, #0x20
	add	r1, r1, r0
	mov	r0, #0x39
	strb	r0, [r1]
	b	.L79
.L81:
	.align	2, 0
.L80:
	.word	gBattlerControllerFuncs
	.word	gActiveBattler
	.word	SafariBufferRunCommand
	.word	gBattleTypeFlags
	.word	gBattleResources
.L78:
	ldr	r2, .L82
	ldr	r1, .L82+0x4
	ldrb	r0, [r4]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, [r0]
	ldr	r0, [r2]
	bic	r0, r0, r1
	str	r0, [r2]
.L79:
	add	sp, sp, #0x4
	pop	{r4}
	pop	{r0}
	bx	r0
.L83:
	.align	2, 0
.L82:
	.word	gBattleControllerExecFlags
	.word	gBitTable
.Lfe13:
	.size	 SafariBufferExecCompleted,.Lfe13-SafariBufferExecCompleted
	.align	2, 0
	.type	 CompleteOnFinishedStatusAnimation,function
	.thumb_func
CompleteOnFinishedStatusAnimation:
	push	{lr}
	ldr	r0, .L86
	ldr	r2, [r0]
	ldr	r0, .L86+0x4
	ldrb	r1, [r0]
	ldr	r2, [r2, #0x4]
	lsl	r0, r1, #0x1
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r2
	ldrb	r1, [r0]
	mov	r0, #0x10
	and	r0, r0, r1
	cmp	r0, #0
	bne	.L85	@cond_branch
	bl	SafariBufferExecCompleted
.L85:
	pop	{r0}
	bx	r0
.L87:
	.align	2, 0
.L86:
	.word	gBattleSpritesDataPtr
	.word	gActiveBattler
.Lfe14:
	.size	 CompleteOnFinishedStatusAnimation,.Lfe14-CompleteOnFinishedStatusAnimation
	.align	2, 0
	.type	 SafariHandleGetMonData,function
	.thumb_func
SafariHandleGetMonData:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe15:
	.size	 SafariHandleGetMonData,.Lfe15-SafariHandleGetMonData
	.align	2, 0
	.type	 SafariHandleGetRawMonData,function
	.thumb_func
SafariHandleGetRawMonData:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe16:
	.size	 SafariHandleGetRawMonData,.Lfe16-SafariHandleGetRawMonData
	.align	2, 0
	.type	 SafariHandleSetMonData,function
	.thumb_func
SafariHandleSetMonData:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe17:
	.size	 SafariHandleSetMonData,.Lfe17-SafariHandleSetMonData
	.align	2, 0
	.type	 SafariHandleSetRawMonData,function
	.thumb_func
SafariHandleSetRawMonData:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe18:
	.size	 SafariHandleSetRawMonData,.Lfe18-SafariHandleSetRawMonData
	.align	2, 0
	.type	 SafariHandleLoadMonSprite,function
	.thumb_func
SafariHandleLoadMonSprite:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe19:
	.size	 SafariHandleLoadMonSprite,.Lfe19-SafariHandleLoadMonSprite
	.align	2, 0
	.type	 SafariHandleSwitchInAnim,function
	.thumb_func
SafariHandleSwitchInAnim:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe20:
	.size	 SafariHandleSwitchInAnim,.Lfe20-SafariHandleSwitchInAnim
	.align	2, 0
	.type	 SafariHandleReturnMonToBall,function
	.thumb_func
SafariHandleReturnMonToBall:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe21:
	.size	 SafariHandleReturnMonToBall,.Lfe21-SafariHandleReturnMonToBall
	.align	2, 0
	.type	 SafariHandleDrawTrainerPic,function
	.thumb_func
SafariHandleDrawTrainerPic:
	push	{r4, r5, r6, lr}
	ldr	r4, .L96
	ldr	r0, [r4]
	ldrb	r0, [r0, #0x8]
	ldr	r5, .L96+0x4
	ldrb	r1, [r5]
	bl	DecompressTrainerBackPic
	ldr	r0, [r4]
	ldrb	r6, [r0, #0x8]
	ldrb	r0, [r5]
	bl	GetBattlerPosition
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r6, #0
	bl	SetMultiuseSpriteTemplateToTrainerBack
	ldr	r0, .L96+0x8
	ldr	r2, .L96+0xc
	ldr	r1, [r4]
	ldrb	r1, [r1, #0x8]
	lsl	r1, r1, #0x2
	add	r1, r1, r2
	ldrb	r1, [r1]
	mov	r2, #0x8
	sub	r2, r2, r1
	lsl	r2, r2, #0x12
	mov	r1, #0xa0
	lsl	r1, r1, #0xf
	add	r2, r2, r1
	asr	r2, r2, #0x10
	mov	r1, #0x50
	mov	r3, #0x1e
	bl	CreateSprite
	ldr	r6, .L96+0x10
	ldrb	r1, [r5]
	add	r1, r1, r6
	strb	r0, [r1]
	ldr	r4, .L96+0x14
	ldrb	r3, [r5]
	add	r0, r3, r6
	ldrb	r0, [r0]
	lsl	r1, r0, #0x4
	add	r1, r1, r0
	lsl	r1, r1, #0x2
	add	r1, r1, r4
	lsl	r3, r3, #0x4
	ldrb	r2, [r1, #0x5]
	mov	r0, #0xf
	and	r0, r0, r2
	orr	r0, r0, r3
	strb	r0, [r1, #0x5]
	ldrb	r0, [r5]
	add	r0, r0, r6
	ldrb	r1, [r0]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	mov	r1, #0xf0
	strh	r1, [r0, #0x24]
	ldrb	r0, [r5]
	add	r0, r0, r6
	ldrb	r1, [r0]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r0, r0, r4
	ldr	r1, .L96+0x18
	strh	r1, [r0, #0x2e]
	ldrb	r0, [r5]
	add	r0, r0, r6
	ldrb	r1, [r0]
	lsl	r0, r1, #0x4
	add	r0, r0, r1
	lsl	r0, r0, #0x2
	add	r4, r4, #0x1c
	add	r0, r0, r4
	ldr	r1, .L96+0x1c
	str	r1, [r0]
	ldr	r1, .L96+0x20
	ldrb	r0, [r5]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L96+0x24
	str	r1, [r0]
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L97:
	.align	2, 0
.L96:
	.word	gSaveBlock2Ptr
	.word	gActiveBattler
	.word	gMultiuseSpriteTemplate
	.word	gTrainerBackPicCoords
	.word	gBattlerSpriteIds
	.word	gSprites
	.word	0xfffe
	.word	sub_805D7AC
	.word	gBattlerControllerFuncs
	.word	CompleteOnBattlerSpriteCallbackDummy
.Lfe22:
	.size	 SafariHandleDrawTrainerPic,.Lfe22-SafariHandleDrawTrainerPic
	.align	2, 0
	.type	 SafariHandleTrainerSlide,function
	.thumb_func
SafariHandleTrainerSlide:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe23:
	.size	 SafariHandleTrainerSlide,.Lfe23-SafariHandleTrainerSlide
	.align	2, 0
	.type	 SafariHandleTrainerSlideBack,function
	.thumb_func
SafariHandleTrainerSlideBack:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe24:
	.size	 SafariHandleTrainerSlideBack,.Lfe24-SafariHandleTrainerSlideBack
	.align	2, 0
	.type	 SafariHandleFaintAnimation,function
	.thumb_func
SafariHandleFaintAnimation:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe25:
	.size	 SafariHandleFaintAnimation,.Lfe25-SafariHandleFaintAnimation
	.align	2, 0
	.type	 SafariHandlePaletteFade,function
	.thumb_func
SafariHandlePaletteFade:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe26:
	.size	 SafariHandlePaletteFade,.Lfe26-SafariHandlePaletteFade
	.align	2, 0
	.type	 SafariHandleSuccessBallThrowAnim,function
	.thumb_func
SafariHandleSuccessBallThrowAnim:
	push	{r4, r5, lr}
	ldr	r0, .L103
	ldr	r0, [r0]
	ldr	r2, [r0, #0x8]
	ldrb	r1, [r2, #0x8]
	mov	r0, #0x40
	neg	r0, r0
	and	r0, r0, r1
	mov	r1, #0x4
	orr	r0, r0, r1
	strb	r0, [r2, #0x8]
	ldr	r1, .L103+0x4
	mov	r0, #0x1
	strb	r0, [r1]
	ldr	r5, .L103+0x8
	ldrb	r4, [r5]
	mov	r0, #0x1
	bl	GetBattlerAtPosition
	add	r2, r0, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r0, r4, #0
	add	r1, r4, #0
	mov	r3, #0x4
	bl	InitAndLaunchSpecialAnimation
	ldr	r1, .L103+0xc
	ldrb	r0, [r5]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L103+0x10
	str	r1, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L104:
	.align	2, 0
.L103:
	.word	gBattleSpritesDataPtr
	.word	gDoingBattleAnim
	.word	gActiveBattler
	.word	gBattlerControllerFuncs
	.word	CompleteOnSpecialAnimDone
.Lfe27:
	.size	 SafariHandleSuccessBallThrowAnim,.Lfe27-SafariHandleSuccessBallThrowAnim
	.align	2, 0
	.type	 SafariHandleBallThrowAnim,function
	.thumb_func
SafariHandleBallThrowAnim:
	push	{r4, r5, lr}
	ldr	r0, .L106
	ldr	r1, [r0]
	ldr	r5, .L106+0x4
	ldrb	r0, [r5]
	lsl	r0, r0, #0x9
	add	r1, r1, #0x21
	add	r1, r1, r0
	ldrb	r2, [r1]
	ldr	r0, .L106+0x8
	ldr	r0, [r0]
	ldr	r3, [r0, #0x8]
	mov	r0, #0x3f
	and	r2, r2, r0
	ldrb	r1, [r3, #0x8]
	sub	r0, r0, #0x7f
	and	r0, r0, r1
	orr	r0, r0, r2
	strb	r0, [r3, #0x8]
	ldr	r1, .L106+0xc
	mov	r0, #0x1
	strb	r0, [r1]
	ldrb	r4, [r5]
	mov	r0, #0x1
	bl	GetBattlerAtPosition
	add	r2, r0, #0
	lsl	r2, r2, #0x18
	lsr	r2, r2, #0x18
	add	r0, r4, #0
	add	r1, r4, #0
	mov	r3, #0x4
	bl	InitAndLaunchSpecialAnimation
	ldr	r1, .L106+0x10
	ldrb	r0, [r5]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L106+0x14
	str	r1, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L107:
	.align	2, 0
.L106:
	.word	gBattleResources
	.word	gActiveBattler
	.word	gBattleSpritesDataPtr
	.word	gDoingBattleAnim
	.word	gBattlerControllerFuncs
	.word	CompleteOnSpecialAnimDone
.Lfe28:
	.size	 SafariHandleBallThrowAnim,.Lfe28-SafariHandleBallThrowAnim
	.align	2, 0
	.type	 SafariHandlePause,function
	.thumb_func
SafariHandlePause:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe29:
	.size	 SafariHandlePause,.Lfe29-SafariHandlePause
	.align	2, 0
	.type	 SafariHandleMoveAnimation,function
	.thumb_func
SafariHandleMoveAnimation:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe30:
	.size	 SafariHandleMoveAnimation,.Lfe30-SafariHandleMoveAnimation
	.align	2, 0
	.type	 SafariHandlePrintString,function
	.thumb_func
SafariHandlePrintString:
	push	{r4, lr}
	ldr	r0, .L111
	mov	r1, #0x0
	strh	r1, [r0]
	ldr	r0, .L111+0x4
	strh	r1, [r0]
	ldr	r0, .L111+0x8
	ldr	r4, .L111+0xc
	ldrb	r1, [r4]
	lsl	r1, r1, #0x9
	add	r1, r1, #0x20
	ldr	r0, [r0]
	add	r0, r0, r1
	ldrh	r0, [r0, #0x2]
	bl	BufferStringBattle
	ldr	r0, .L111+0x10
	mov	r1, #0x0
	bl	BattlePutTextOnWindow
	ldr	r1, .L111+0x14
	ldrb	r0, [r4]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L111+0x18
	str	r1, [r0]
	pop	{r4}
	pop	{r0}
	bx	r0
.L112:
	.align	2, 0
.L111:
	.word	gBattle_BG0_X
	.word	gBattle_BG0_Y
	.word	gBattleResources
	.word	gActiveBattler
	.word	gDisplayedStringBattle
	.word	gBattlerControllerFuncs
	.word	CompleteOnInactiveTextPrinter
.Lfe31:
	.size	 SafariHandlePrintString,.Lfe31-SafariHandlePrintString
	.align	2, 0
	.type	 SafariHandlePrintSelectionString,function
	.thumb_func
SafariHandlePrintSelectionString:
	push	{lr}
	ldr	r0, .L116
	ldrb	r0, [r0]
	bl	GetBattlerSide
	lsl	r0, r0, #0x18
	cmp	r0, #0
	bne	.L114	@cond_branch
	bl	SafariHandlePrintString
	b	.L115
.L117:
	.align	2, 0
.L116:
	.word	gActiveBattler
.L114:
	bl	SafariBufferExecCompleted
.L115:
	pop	{r0}
	bx	r0
.Lfe32:
	.size	 SafariHandlePrintSelectionString,.Lfe32-SafariHandlePrintSelectionString
	.align	2, 0
	.type	 HandleChooseActionAfterDma3,function
	.thumb_func
HandleChooseActionAfterDma3:
	push	{lr}
	bl	IsDma3ManagerBusyWithBgCopy
	lsl	r0, r0, #0x18
	lsr	r1, r0, #0x18
	cmp	r1, #0
	bne	.L119	@cond_branch
	ldr	r0, .L120
	strh	r1, [r0]
	ldr	r1, .L120+0x4
	mov	r0, #0xa0
	strh	r0, [r1]
	ldr	r1, .L120+0x8
	ldr	r0, .L120+0xc
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L120+0x10
	str	r1, [r0]
.L119:
	pop	{r0}
	bx	r0
.L121:
	.align	2, 0
.L120:
	.word	gBattle_BG0_X
	.word	gBattle_BG0_Y
	.word	gBattlerControllerFuncs
	.word	gActiveBattler
	.word	HandleInputChooseAction
.Lfe33:
	.size	 HandleChooseActionAfterDma3,.Lfe33-HandleChooseActionAfterDma3
	.align	2, 0
	.type	 SafariHandleChooseAction,function
	.thumb_func
SafariHandleChooseAction:
	push	{r4, lr}
	ldr	r1, .L128
	ldr	r0, .L128+0x4
	ldrb	r0, [r0]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L128+0x8
	str	r1, [r0]
	ldr	r0, .L128+0xc
	mov	r1, #0x2
	bl	BattlePutTextOnWindow
	mov	r4, #0x0
.L126:
	lsl	r0, r4, #0x18
	lsr	r0, r0, #0x18
	bl	ActionSelectionDestroyCursorAt
	add	r4, r4, #0x1
	cmp	r4, #0x3
	ble	.L126	@cond_branch
	ldr	r1, .L128+0x10
	ldr	r0, .L128+0x4
	ldrb	r0, [r0]
	add	r0, r0, r1
	ldrb	r0, [r0]
	mov	r1, #0x0
	bl	ActionSelectionCreateCursorAt
	ldr	r0, .L128+0x14
	bl	BattleStringExpandPlaceholdersToDisplayedString
	ldr	r0, .L128+0x18
	mov	r1, #0x1
	bl	BattlePutTextOnWindow
	pop	{r4}
	pop	{r0}
	bx	r0
.L129:
	.align	2, 0
.L128:
	.word	gBattlerControllerFuncs
	.word	gActiveBattler
	.word	HandleChooseActionAfterDma3
	.word	gText_SafariZoneMenu
	.word	gActionSelectionCursor
	.word	gText_WhatWillPkmnDo2
	.word	gDisplayedStringBattle
.Lfe34:
	.size	 SafariHandleChooseAction,.Lfe34-SafariHandleChooseAction
	.align	2, 0
	.type	 SafariHandleUnknownYesNoBox,function
	.thumb_func
SafariHandleUnknownYesNoBox:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe35:
	.size	 SafariHandleUnknownYesNoBox,.Lfe35-SafariHandleUnknownYesNoBox
	.align	2, 0
	.type	 SafariHandleChooseMove,function
	.thumb_func
SafariHandleChooseMove:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe36:
	.size	 SafariHandleChooseMove,.Lfe36-SafariHandleChooseMove
	.align	2, 0
	.type	 SafariHandleChooseItem,function
	.thumb_func
SafariHandleChooseItem:
	push	{lr}
	add	sp, sp, #-0x4
	mov	r0, #0x1
	neg	r0, r0
	mov	r1, #0x0
	str	r1, [sp]
	mov	r2, #0x0
	mov	r3, #0x10
	bl	BeginNormalPaletteFade
	ldr	r1, .L133
	ldr	r2, .L133+0x4
	ldrb	r0, [r2]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L133+0x8
	str	r1, [r0]
	ldr	r1, .L133+0xc
	ldrb	r0, [r2]
	strb	r0, [r1]
	add	sp, sp, #0x4
	pop	{r0}
	bx	r0
.L134:
	.align	2, 0
.L133:
	.word	gBattlerControllerFuncs
	.word	gActiveBattler
	.word	SafariOpenPokeblockCase
	.word	gBattlerInMenuId
.Lfe37:
	.size	 SafariHandleChooseItem,.Lfe37-SafariHandleChooseItem
	.align	2, 0
	.type	 SafariHandleChoosePokemon,function
	.thumb_func
SafariHandleChoosePokemon:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe38:
	.size	 SafariHandleChoosePokemon,.Lfe38-SafariHandleChoosePokemon
	.align	2, 0
	.type	 SafariHandleCmd23,function
	.thumb_func
SafariHandleCmd23:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe39:
	.size	 SafariHandleCmd23,.Lfe39-SafariHandleCmd23
	.align	2, 0
	.type	 SafariHandleHealthBarUpdate,function
	.thumb_func
SafariHandleHealthBarUpdate:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe40:
	.size	 SafariHandleHealthBarUpdate,.Lfe40-SafariHandleHealthBarUpdate
	.align	2, 0
	.type	 SafariHandleExpUpdate,function
	.thumb_func
SafariHandleExpUpdate:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe41:
	.size	 SafariHandleExpUpdate,.Lfe41-SafariHandleExpUpdate
	.align	2, 0
	.type	 SafariHandleStatusIconUpdate,function
	.thumb_func
SafariHandleStatusIconUpdate:
	push	{lr}
	ldr	r0, .L140
	ldr	r1, .L140+0x4
	ldrb	r1, [r1]
	add	r0, r1, r0
	ldrb	r0, [r0]
	ldr	r2, .L140+0x8
	lsl	r1, r1, #0x1
	add	r1, r1, r2
	ldrh	r2, [r1]
	mov	r1, #0x64
	mul	r1, r1, r2
	ldr	r2, .L140+0xc
	add	r1, r1, r2
	mov	r2, #0xb
	bl	UpdateHealthboxAttribute
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.L141:
	.align	2, 0
.L140:
	.word	gHealthboxSpriteIds
	.word	gActiveBattler
	.word	gBattlerPartyIndexes
	.word	gPlayerParty
.Lfe42:
	.size	 SafariHandleStatusIconUpdate,.Lfe42-SafariHandleStatusIconUpdate
	.align	2, 0
	.type	 SafariHandleStatusAnimation,function
	.thumb_func
SafariHandleStatusAnimation:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe43:
	.size	 SafariHandleStatusAnimation,.Lfe43-SafariHandleStatusAnimation
	.align	2, 0
	.type	 SafariHandleStatusXor,function
	.thumb_func
SafariHandleStatusXor:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe44:
	.size	 SafariHandleStatusXor,.Lfe44-SafariHandleStatusXor
	.align	2, 0
	.type	 SafariHandleDataTransfer,function
	.thumb_func
SafariHandleDataTransfer:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe45:
	.size	 SafariHandleDataTransfer,.Lfe45-SafariHandleDataTransfer
	.align	2, 0
	.type	 SafariHandleDMA3Transfer,function
	.thumb_func
SafariHandleDMA3Transfer:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe46:
	.size	 SafariHandleDMA3Transfer,.Lfe46-SafariHandleDMA3Transfer
	.align	2, 0
	.type	 SafariHandlePlayBGM,function
	.thumb_func
SafariHandlePlayBGM:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe47:
	.size	 SafariHandlePlayBGM,.Lfe47-SafariHandlePlayBGM
	.align	2, 0
	.type	 SafariHandleCmd32,function
	.thumb_func
SafariHandleCmd32:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe48:
	.size	 SafariHandleCmd32,.Lfe48-SafariHandleCmd32
	.align	2, 0
	.type	 SafariHandleTwoReturnValues,function
	.thumb_func
SafariHandleTwoReturnValues:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe49:
	.size	 SafariHandleTwoReturnValues,.Lfe49-SafariHandleTwoReturnValues
	.align	2, 0
	.type	 SafariHandleChosenMonReturnValue,function
	.thumb_func
SafariHandleChosenMonReturnValue:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe50:
	.size	 SafariHandleChosenMonReturnValue,.Lfe50-SafariHandleChosenMonReturnValue
	.align	2, 0
	.type	 SafariHandleOneReturnValue,function
	.thumb_func
SafariHandleOneReturnValue:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe51:
	.size	 SafariHandleOneReturnValue,.Lfe51-SafariHandleOneReturnValue
	.align	2, 0
	.type	 SafariHandleOneReturnValue_Duplicate,function
	.thumb_func
SafariHandleOneReturnValue_Duplicate:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe52:
	.size	 SafariHandleOneReturnValue_Duplicate,.Lfe52-SafariHandleOneReturnValue_Duplicate
	.align	2, 0
	.type	 SafariHandleCmd37,function
	.thumb_func
SafariHandleCmd37:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe53:
	.size	 SafariHandleCmd37,.Lfe53-SafariHandleCmd37
	.align	2, 0
	.type	 SafariHandleCmd38,function
	.thumb_func
SafariHandleCmd38:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe54:
	.size	 SafariHandleCmd38,.Lfe54-SafariHandleCmd38
	.align	2, 0
	.type	 SafariHandleCmd39,function
	.thumb_func
SafariHandleCmd39:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe55:
	.size	 SafariHandleCmd39,.Lfe55-SafariHandleCmd39
	.align	2, 0
	.type	 SafariHandleCmd40,function
	.thumb_func
SafariHandleCmd40:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe56:
	.size	 SafariHandleCmd40,.Lfe56-SafariHandleCmd40
	.align	2, 0
	.type	 SafariHandleHitAnimation,function
	.thumb_func
SafariHandleHitAnimation:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe57:
	.size	 SafariHandleHitAnimation,.Lfe57-SafariHandleHitAnimation
	.align	2, 0
	.type	 SafariHandleCmd42,function
	.thumb_func
SafariHandleCmd42:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe58:
	.size	 SafariHandleCmd42,.Lfe58-SafariHandleCmd42
	.align	2, 0
	.type	 SafariHandlePlaySE,function
	.thumb_func
SafariHandlePlaySE:
	push	{r4, lr}
	ldr	r4, .L161
	ldrb	r0, [r4]
	bl	GetBattlerSide
	lsl	r0, r0, #0x18
	mov	r3, #0x3f
	cmp	r0, #0
	bne	.L159	@cond_branch
	mov	r3, #0xc0
.L159:
	ldr	r0, .L161+0x4
	ldr	r1, [r0]
	ldrb	r2, [r4]
	lsl	r2, r2, #0x9
	add	r0, r1, #0
	add	r0, r0, #0x21
	add	r0, r0, r2
	ldrb	r0, [r0]
	add	r1, r1, #0x22
	add	r1, r1, r2
	ldrb	r1, [r1]
	lsl	r1, r1, #0x8
	orr	r0, r0, r1
	lsl	r1, r3, #0x18
	asr	r1, r1, #0x18
	bl	PlaySE12WithPanning
	bl	SafariBufferExecCompleted
	pop	{r4}
	pop	{r0}
	bx	r0
.L162:
	.align	2, 0
.L161:
	.word	gActiveBattler
	.word	gBattleResources
.Lfe59:
	.size	 SafariHandlePlaySE,.Lfe59-SafariHandlePlaySE
	.align	2, 0
	.type	 SafariHandlePlayFanfareOrBGM,function
	.thumb_func
SafariHandlePlayFanfareOrBGM:
	push	{r4, r5, lr}
	ldr	r5, .L166
	ldr	r1, [r5]
	ldr	r4, .L166+0x4
	ldrb	r0, [r4]
	lsl	r2, r0, #0x9
	add	r0, r1, #0
	add	r0, r0, #0x23
	add	r0, r0, r2
	ldrb	r0, [r0]
	cmp	r0, #0
	beq	.L164	@cond_branch
	bl	BattleStopLowHpSound
	ldr	r1, [r5]
	ldrb	r2, [r4]
	lsl	r2, r2, #0x9
	add	r0, r1, #0
	add	r0, r0, #0x21
	add	r0, r0, r2
	ldrb	r0, [r0]
	add	r1, r1, #0x22
	add	r1, r1, r2
	ldrb	r1, [r1]
	lsl	r1, r1, #0x8
	orr	r0, r0, r1
	bl	PlayBGM
	b	.L165
.L167:
	.align	2, 0
.L166:
	.word	gBattleResources
	.word	gActiveBattler
.L164:
	add	r0, r1, #0
	add	r0, r0, #0x21
	add	r0, r0, r2
	ldrb	r0, [r0]
	add	r1, r1, #0x22
	add	r1, r1, r2
	ldrb	r1, [r1]
	lsl	r1, r1, #0x8
	orr	r0, r0, r1
	bl	PlayFanfare
.L165:
	bl	SafariBufferExecCompleted
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.Lfe60:
	.size	 SafariHandlePlayFanfareOrBGM,.Lfe60-SafariHandlePlayFanfareOrBGM
	.align	2, 0
	.type	 SafariHandleFaintingCry,function
	.thumb_func
SafariHandleFaintingCry:
	push	{r4, r5, r6, lr}
	mov	r6, r9
	mov	r5, r8
	push	{r5, r6}
	ldr	r0, .L169
	mov	r9, r0
	ldr	r1, .L169+0x4
	mov	r8, r1
	ldrb	r0, [r1]
	lsl	r0, r0, #0x1
	add	r0, r0, r9
	ldrh	r0, [r0]
	mov	r6, #0x64
	mul	r0, r0, r6
	ldr	r5, .L169+0x8
	add	r0, r0, r5
	mov	r1, #0xb
	bl	GetMonData
	add	r4, r0, #0
	lsl	r4, r4, #0x10
	lsr	r4, r4, #0x10
	mov	r1, r8
	ldrb	r0, [r1]
	lsl	r0, r0, #0x1
	add	r0, r0, r9
	ldrh	r0, [r0]
	mul	r0, r0, r6
	add	r0, r0, r5
	mov	r1, #0x59
	bl	GetMonData
	add	r1, r0, #0
	lsl	r1, r1, #0x18
	lsr	r1, r1, #0x18
	add	r0, r4, #0
	bl	GetFormSpeciesId
	lsl	r0, r0, #0x10
	lsr	r0, r0, #0x10
	mov	r1, #0x19
	bl	PlayCry1
	bl	SafariBufferExecCompleted
	pop	{r3, r4}
	mov	r8, r3
	mov	r9, r4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L170:
	.align	2, 0
.L169:
	.word	gBattlerPartyIndexes
	.word	gActiveBattler
	.word	gPlayerParty
.Lfe61:
	.size	 SafariHandleFaintingCry,.Lfe61-SafariHandleFaintingCry
	.align	2, 0
	.type	 SafariHandleIntroSlide,function
	.thumb_func
SafariHandleIntroSlide:
	push	{lr}
	ldr	r0, .L172
	ldr	r1, [r0]
	ldr	r0, .L172+0x4
	ldrb	r0, [r0]
	lsl	r0, r0, #0x9
	add	r1, r1, #0x21
	add	r1, r1, r0
	ldrb	r0, [r1]
	bl	HandleIntroSlide
	ldr	r2, .L172+0x8
	ldrh	r0, [r2]
	mov	r1, #0x1
	orr	r0, r0, r1
	strh	r0, [r2]
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.L173:
	.align	2, 0
.L172:
	.word	gBattleResources
	.word	gActiveBattler
	.word	gIntroSlideFlags
.Lfe62:
	.size	 SafariHandleIntroSlide,.Lfe62-SafariHandleIntroSlide
	.align	2, 0
	.type	 SafariHandleIntroTrainerBallThrow,function
	.thumb_func
SafariHandleIntroTrainerBallThrow:
	push	{r4, r5, lr}
	ldr	r5, .L175
	ldr	r4, .L175+0x4
	ldrb	r1, [r4]
	add	r0, r1, r5
	ldrb	r0, [r0]
	ldr	r2, .L175+0x8
	lsl	r1, r1, #0x1
	add	r1, r1, r2
	ldrh	r2, [r1]
	mov	r1, #0x64
	mul	r1, r1, r2
	ldr	r2, .L175+0xc
	add	r1, r1, r2
	mov	r2, #0xa
	bl	UpdateHealthboxAttribute
	ldrb	r0, [r4]
	bl	sub_8076918
	ldrb	r0, [r4]
	add	r0, r0, r5
	ldrb	r0, [r0]
	bl	SetHealthboxSpriteVisible
	ldr	r1, .L175+0x10
	ldrb	r0, [r4]
	lsl	r0, r0, #0x2
	add	r0, r0, r1
	ldr	r1, .L175+0x14
	str	r1, [r0]
	pop	{r4, r5}
	pop	{r0}
	bx	r0
.L176:
	.align	2, 0
.L175:
	.word	gHealthboxSpriteIds
	.word	gActiveBattler
	.word	gBattlerPartyIndexes
	.word	gPlayerParty
	.word	gBattlerControllerFuncs
	.word	CompleteOnHealthboxSpriteCallbackDummy
.Lfe63:
	.size	 SafariHandleIntroTrainerBallThrow,.Lfe63-SafariHandleIntroTrainerBallThrow
	.align	2, 0
	.type	 SafariHandleDrawPartyStatusSummary,function
	.thumb_func
SafariHandleDrawPartyStatusSummary:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe64:
	.size	 SafariHandleDrawPartyStatusSummary,.Lfe64-SafariHandleDrawPartyStatusSummary
	.align	2, 0
	.type	 SafariHandleHidePartyStatusSummary,function
	.thumb_func
SafariHandleHidePartyStatusSummary:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe65:
	.size	 SafariHandleHidePartyStatusSummary,.Lfe65-SafariHandleHidePartyStatusSummary
	.align	2, 0
	.type	 SafariHandleEndBounceEffect,function
	.thumb_func
SafariHandleEndBounceEffect:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe66:
	.size	 SafariHandleEndBounceEffect,.Lfe66-SafariHandleEndBounceEffect
	.align	2, 0
	.type	 SafariHandleSpriteInvisibility,function
	.thumb_func
SafariHandleSpriteInvisibility:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe67:
	.size	 SafariHandleSpriteInvisibility,.Lfe67-SafariHandleSpriteInvisibility
	.align	2, 0
	.type	 SafariHandleBattleAnimation,function
	.thumb_func
SafariHandleBattleAnimation:
	push	{r4, r5, r6, lr}
	add	sp, sp, #-0x4
	ldr	r0, .L184
	ldr	r1, [r0]
	ldr	r6, .L184+0x4
	ldrb	r2, [r6]
	lsl	r5, r2, #0x9
	add	r0, r1, #0
	add	r0, r0, #0x21
	add	r0, r0, r5
	ldrb	r3, [r0]
	add	r0, r1, #0
	add	r0, r0, #0x22
	add	r0, r0, r5
	ldrb	r4, [r0]
	add	r1, r1, #0x23
	add	r1, r1, r5
	ldrb	r0, [r1]
	lsl	r0, r0, #0x8
	orr	r4, r4, r0
	str	r4, [sp]
	add	r0, r2, #0
	add	r1, r2, #0
	bl	TryHandleLaunchBattleTableAnimation
	lsl	r0, r0, #0x18
	cmp	r0, #0
	beq	.L182	@cond_branch
	bl	SafariBufferExecCompleted
	b	.L183
.L185:
	.align	2, 0
.L184:
	.word	gBattleResources
	.word	gActiveBattler
.L182:
	ldr	r0, .L186
	ldrb	r1, [r6]
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldr	r0, .L186+0x4
	str	r0, [r1]
.L183:
	add	sp, sp, #0x4
	pop	{r4, r5, r6}
	pop	{r0}
	bx	r0
.L187:
	.align	2, 0
.L186:
	.word	gBattlerControllerFuncs
	.word	CompleteOnFinishedBattleAnimation
.Lfe68:
	.size	 SafariHandleBattleAnimation,.Lfe68-SafariHandleBattleAnimation
	.align	2, 0
	.type	 SafariHandleLinkStandbyMsg,function
	.thumb_func
SafariHandleLinkStandbyMsg:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe69:
	.size	 SafariHandleLinkStandbyMsg,.Lfe69-SafariHandleLinkStandbyMsg
	.align	2, 0
	.type	 SafariHandleResetActionMoveSelection,function
	.thumb_func
SafariHandleResetActionMoveSelection:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe70:
	.size	 SafariHandleResetActionMoveSelection,.Lfe70-SafariHandleResetActionMoveSelection
	.align	2, 0
	.type	 SafariHandleCmd55,function
	.thumb_func
SafariHandleCmd55:
	push	{r4, lr}
	ldr	r2, .L192
	ldr	r0, .L192+0x4
	ldr	r1, [r0]
	ldr	r4, .L192+0x8
	ldrb	r0, [r4]
	lsl	r0, r0, #0x9
	add	r1, r1, #0x21
	add	r1, r1, r0
	ldrb	r0, [r1]
	strb	r0, [r2]
	mov	r0, #0x5
	bl	FadeOutMapMusic
	mov	r0, #0x3
	bl	BeginFastPaletteFade
	bl	SafariBufferExecCompleted
	ldr	r0, .L192+0xc
	ldr	r0, [r0]
	mov	r1, #0x6
	and	r0, r0, r1
	cmp	r0, #0x2
	bne	.L191	@cond_branch
	ldr	r0, .L192+0x10
	ldrb	r1, [r4]
	lsl	r1, r1, #0x2
	add	r1, r1, r0
	ldr	r0, .L192+0x14
	str	r0, [r1]
.L191:
	pop	{r4}
	pop	{r0}
	bx	r0
.L193:
	.align	2, 0
.L192:
	.word	gBattleOutcome
	.word	gBattleResources
	.word	gActiveBattler
	.word	gBattleTypeFlags
	.word	gBattlerControllerFuncs
	.word	sub_81595E4
.Lfe71:
	.size	 SafariHandleCmd55,.Lfe71-SafariHandleCmd55
	.align	2, 0
	.type	 SafariHandleBattleDebug,function
	.thumb_func
SafariHandleBattleDebug:
	push	{lr}
	bl	SafariBufferExecCompleted
	pop	{r0}
	bx	r0
.Lfe72:
	.size	 SafariHandleBattleDebug,.Lfe72-SafariHandleBattleDebug
	.align	2, 0
	.type	 SafariCmdEnd,function
	.thumb_func
SafariCmdEnd:
	bx	lr
.Lfe73:
	.size	 SafariCmdEnd,.Lfe73-SafariCmdEnd
.text
	.align	2, 0

