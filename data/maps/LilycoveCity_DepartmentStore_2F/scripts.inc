LilycoveCity_DepartmentStore_2F_MapScripts:: @ 821FB2C
	.byte 0

LilycoveCity_DepartmentStore_2F_EventScript_Cook:: @ 821FB2D
	msgbox LilycoveCity_DepartmentStore_2F_Text_LearnToUseItemsProperly, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_2F_EventScript_PokefanF:: @ 821FB36
	msgbox LilycoveCity_DepartmentStore_2F_Text_GoodGiftForHusband, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_2F_EventScript_Sailor:: @ 821FB3F
	msgbox LilycoveCity_DepartmentStore_2F_Text_StockUpOnItems, MSGBOX_NPC
	end

LilycoveCity_DepartmentStore_2F_EventScript_ClerkLeft:: @ 821FB48
	lock
	faceplayer
	message gText_HowMayIServeYou
	waitmessage
	pokemart 0
	msgbox gText_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

LilycoveCity_DepartmentStore_2F_EventScript_ClerkRight:: @ 821FB7A
	lock
	faceplayer
	message gText_HowMayIServeYou
	waitmessage
	pokemart LilycoveCity_DepartmentStore_2F_Pokemart2
	msgbox gText_PleaseComeAgain, MSGBOX_DEFAULT
	release
	end

	.align 2
LilycoveCity_DepartmentStore_2F_Pokemart2: @ 821FB94
	.2byte ITEM_QUICK_BALL
	.2byte ITEM_DUSK_BALL
	.2byte ITEM_TIMER_BALL
	.2byte ITEM_NET_BALL
	.2byte ITEM_DIVE_BALL
	.2byte ITEM_REPEAT_BALL
	.2byte ITEM_LUXURY_BALL
	.2byte ITEM_NEST_BALL
	.2byte ITEM_HEAL_BALL
	.2byte ITEM_FLUFFY_TAIL
	.2byte ITEM_WAVE_MAIL
	.2byte ITEM_MECH_MAIL
	.2byte ITEM_NONE
	release
	end

LilycoveCity_DepartmentStore_2F_Text_LearnToUseItemsProperly: @ 821FBAC
	.string "Learn to use items properly.\n"
	.string "That's basic, really.$"

LilycoveCity_DepartmentStore_2F_Text_GoodGiftForHusband: @ 821FBDF
	.string "My husband is waiting at home.\n"
	.string "What would make a good gift for him?$"

LilycoveCity_DepartmentStore_2F_Text_StockUpOnItems: @ 821FC23
	.string "I'm leaving on a long journey soon.\n"
	.string "I need to stock up on items.$"

