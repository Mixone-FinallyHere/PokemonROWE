SlateportCity_NameRatersHouse_MapScripts:: @ 8209AA4
	.byte 0

SlateportCity_NameRatersHouse_EventScript_NameRater:: @ 8209AA5
	lock
	faceplayer
	clearflag FLAG_UNUSED_0x2A2 
	msgbox SlateportCity_NameRatersHouse_Text_PleasedToRateMonNickname, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_NameRatersHouse_EventScript_ChooseMonToRate
	setflag FLAG_UNUSED_0x2A2 
	msgbox SlateportCity_NameRatersHouse_Text_FineNameSuggestBetterOne, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_EventScript_ChooseMonToRate:: @ 8209AC6
	msgbox SlateportCity_NameRatersHouse_Text_CritiqueWhichMonNickname, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_EventScript_DeclineNameRate:: @ 8209AE9
	msgbox SlateportCity_NameRatersHouse_Text_DoVisitAgain, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_EventScript_RateMonNickname:: @ 8209AF3
	specialvar VAR_RESULT, ScriptGetPartyMonSpecies
	compare VAR_RESULT, SPECIES_EGG
	goto_if_eq SlateportCity_NameRatersHouse_EventScript_CantRateEgg
	special BufferMonNickname
	special IsMonOTIDNotPlayers
	compare VAR_RESULT, TRUE
	goto_if_eq SlateportCity_NameRatersHouse_EventScript_PlayerNotMonsOT
	specialvar VAR_RESULT, MonOTNameNotPlayer
	special BufferMonNickname
	compare VAR_RESULT, TRUE
	goto_if_eq SlateportCity_NameRatersHouse_EventScript_PlayerNotMonsOT
	msgbox SlateportCity_NameRatersHouse_Text_FineNameSuggestBetterOne, MSGBOX_YESNO
	compare VAR_RESULT, YES
	goto_if_eq SlateportCity_NameRatersHouse_EventScript_ChangeNickname
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_NameRatersHouse_EventScript_DeclineNameRate
	end

SlateportCity_NameRatersHouse_EventScript_CantRateEgg:: @ 8209B46
	msgbox SlateportCity_NameRatersHouse_Text_ThatIsMerelyAnEgg, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_EventScript_PlayerNotMonsOT:: @ 8209B50
	msgbox SlateportCity_NameRatersHouse_Text_MagnificentName, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_EventScript_ChangeNickname:: @ 8209B5A
	msgbox SlateportCity_NameRatersHouse_Text_WhatShallNewNameBe, MSGBOX_DEFAULT
	call Common_EventScript_NameReceivedPartyMon
	specialvar VAR_RESULT, TryPutNameRaterShowOnTheAir
	special BufferMonNickname
	compare VAR_RESULT, TRUE
	goto_if_eq SlateportCity_NameRatersHouse_EventScript_NewNameDifferent
	msgbox SlateportCity_NameRatersHouse_Text_NameNoDifferentYetSuperior, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_EventScript_NewNameDifferent:: @ 8209B84
	msgbox SlateportCity_NameRatersHouse_Text_MonShallBeKnownAsName, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_TradebackGuy_V1::
	lock
	faceplayer
	msgbox SlateportCity_NameRatersHouse_TradebackGuy_Text_IllTradeIfYouWant, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_NameRatersHouse_TradebackGuy_DeclineTrade
	special ChoosePartyMon
	waitstate
	compare VAR_0x8004, 255
	goto_if_eq SlateportCity_NameRatersHouse_TradebackGuy_DeclineTrade
	copyvar VAR_0x8005, VAR_0x8004
	setvar VAR_0x8004, 6
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox SlateportCity_NameRatersHouse_TradebackGuy_Text_ComeBack, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_TradebackGuy_V2::
	lock
	faceplayer
	msgbox SlateportCity_NameRatersHouse_TradebackGuy_Text_IllTradeIfYouWant, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq SlateportCity_NameRatersHouse_TradebackGuy_DeclineTrade
	special ChoosePartyMon
	waitstate
	compare VAR_0x8004, 255
	goto_if_eq SlateportCity_NameRatersHouse_TradebackGuy_DeclineTrade
	copyvar VAR_0x8005, VAR_0x8004
	setvar VAR_0x8004, 7
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	setvar VAR_0x8004, 8
	special CreateInGameTradePokemon
	special DoInGameTradeScene
	waitstate
	msgbox SlateportCity_NameRatersHouse_TradebackGuy_Text_ComeBack, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_TradebackGuy_DeclineTrade::
	msgbox SlateportCity_NameRatersHouse_TradebackGuy_Text_YouDontWantToThatsOkay, MSGBOX_DEFAULT
	release
	end

SlateportCity_NameRatersHouse_TradebackGuy_Text_IllTradeIfYouWant:
	.string "Hi! I'm the Tradeback Guy!\p"
	.string "If you have a Pokémon that only\n"
	.string "evolves through trading, then I\l"
	.string "can help you out!\p"
	.string "Do you have any Pokémon that you'd\n"
	.string "like to evolve?$"

SlateportCity_NameRatersHouse_TradebackGuy_Text_ComeBack:
	.string "Come back anytime!$"

SlateportCity_NameRatersHouse_TradebackGuy_Text_YouDontWantToThatsOkay:
	.string "Alright. Well, if you change\n"
	.string "your mind, I'll be here.$"

SlateportCity_NameRatersHouse_Text_PleasedToRateMonNickname: @ 8209B8E
	.string "Hi, hi! I'm the Name Rater!\p"
	.string "…Or rather, I used to be.\p"
	.string "Now you can rate nicknames in\n"
	.string "every Pokémon Center…\p"
	.string "But now I can enable Double\n"
	.string "Battle Mode, how about it?.$"

SlateportCity_NameRatersHouse_Text_CritiqueWhichMonNickname: @ 8209BFF
	.string "Talk to me to enable it\n"
	.string "anytime.$"

SlateportCity_NameRatersHouse_Text_FineNameSuggestBetterOne: @ 8209C2B
	.string "Consider it done!$"

SlateportCity_NameRatersHouse_Text_WhatShallNewNameBe: @ 8209CA4
	.string "Ah, good. Then, what shall the new\n"
	.string "nickname be?$"

SlateportCity_NameRatersHouse_Text_MonShallBeKnownAsName: @ 8209CD4
	.string "Done! From now on, this Pokémon\n"
	.string "shall be known as {STR_VAR_1}!\p"
	.string "It is a better name than before!\n"
	.string "How fortunate for you!$"

SlateportCity_NameRatersHouse_Text_DoVisitAgain: @ 8209D42
	.string "I see.\n"
	.string "Do come visit again.$"

SlateportCity_NameRatersHouse_Text_NameNoDifferentYetSuperior: @ 8209D5E
	.string "Done! From now on, this Pokémon\n"
	.string "shall be known as {STR_VAR_1}!\p"
	.string "It looks no different from before,\n"
	.string "and yet, this is vastly superior!\p"
	.string "How fortunate for you!$"

SlateportCity_NameRatersHouse_Text_MagnificentName: @ 8209DF0
	.string "Hmmm… {STR_VAR_1} it is!\p"
	.string "This is a magnificent nickname!\n"
	.string "It is impeccably beyond reproach!\p"
	.string "You'll do well to cherish your\n"
	.string "{STR_VAR_1} now and beyond.$"

SlateportCity_NameRatersHouse_Text_ThatIsMerelyAnEgg: @ 8209E74
	.string "Now, now.\n"
	.string "That is merely an Egg!$"

