.set LOCALID_MOVE_RELEARNER, 1

FallarborTown_MoveRelearnersHouse_MapScripts:: @ 8201382
	.byte 0

FallarborTown_MoveRelearnersHouse_EventScript_MoveRelearner:: @ 8201383
	lockall
	clearflag FLAG_UNUSED_0x055
	applymovement LOCALID_MOVE_RELEARNER, Common_Movement_FacePlayer
	msgbox FallarborTown_MoveRelearnersHouse_Text_ImTheMoveTutor, MSGBOX_YESNO
	compare VAR_RESULT, NO
	goto_if_eq FallarborTown_MoveRelearnersHouse_EventScript_AskTeachMove
	setflag FLAG_UNUSED_0x055
	msgbox FallarborTown_MoveRelearnersHouse_Text_ThatsAHeartScaleWantMeToTeachMove, MSGBOX_DEFAULT	
	releaseall
	end

FallarborTown_MoveRelearnersHouse_EventScript_AskTeachMove:: @ 82013A8
	msgbox FallarborTown_MoveRelearnersHouse_Text_TutorWhichMon, MSGBOX_DEFAULT	
	releaseall
	end

FallarborTown_MoveRelearnersHouse_EventScript_ChooseMon:: @ 82013D6
	msgbox FallarborTown_MoveRelearnersHouse_Text_TutorWhichMon, MSGBOX_DEFAULT
	special ChooseMonForMoveRelearner
	waitstate
	compare VAR_0x8004, 255
	goto_if_eq FallarborTown_MoveRelearnersHouse_EventScript_ComeBackWithHeartScale
	special IsSelectedMonEgg
	compare VAR_RESULT, TRUE
	goto_if_eq FallarborTown_MoveRelearnersHouse_EventScript_CantTeachEgg
	compare VAR_0x8005, 0
	goto_if_eq FallarborTown_MoveRelearnersHouse_EventScript_NoMoveToTeachMon
	goto FallarborTown_MoveRelearnersHouse_EventScript_ChooseMove
	end

FallarborTown_MoveRelearnersHouse_EventScript_ChooseMove:: @ 820140C
	msgbox FallarborTown_MoveRelearnersHouse_Text_TeachWhichMove, MSGBOX_DEFAULT
	special TeachMoveRelearnerMove
	waitstate
	compare VAR_0x8004, 0
	goto_if_eq FallarborTown_MoveRelearnersHouse_EventScript_ChooseMon
	msgbox FallarborTown_MoveRelearnersHouse_Text_HandedOverHeartScale, MSGBOX_DEFAULT
	removeitem ITEM_HEART_SCALE
	goto FallarborTown_MoveRelearnersHouse_EventScript_ComeBackWithHeartScale
	end

FallarborTown_MoveRelearnersHouse_EventScript_NoMoveToTeachMon:: @ 8201436
	msgbox FallarborTown_MoveRelearnersHouse_Text_DontHaveMoveToTeachPokemon, MSGBOX_DEFAULT
	goto FallarborTown_MoveRelearnersHouse_EventScript_ChooseMon
	end

FallarborTown_MoveRelearnersHouse_EventScript_CantTeachEgg:: @ 8201444
	msgbox FallarborTown_MoveRelearnersHouse_Text_CantTeachEgg, MSGBOX_DEFAULT
	goto FallarborTown_MoveRelearnersHouse_EventScript_ChooseMon
	end

FallarborTown_MoveRelearnersHouse_EventScript_ComeBackWithHeartScale:: @ 8201452
	msgbox FallarborTown_MoveRelearnersHouse_Text_ComeBackWithHeartScale, MSGBOX_DEFAULT
	releaseall
	end

FallarborTown_MoveRelearnersHouse_Text_ImTheMoveTutor: @ 820145C
	.string "I'm the Emulator Changer.\p"
	.string "Some people like to use outdated\n"
	.string "emulators that can't handle all\l"
	.string "the features used in this game.\p"
	.string "Are you prehaps using Myboy!\n"
	.string "emulator?\p"
	.string "I can enable the Myboy! mode\n"
	.string "that disables the Dexnav to\l"
	.string "avoid crashes.p"
	.string "How about it?$"

FallarborTown_MoveRelearnersHouse_Text_ThatsAHeartScaleWantMeToTeachMove: @ 8201541
	.string "You can talk to me again, if you\n"
	.string "want to disable the Myboy mode!$"

FallarborTown_MoveRelearnersHouse_Text_TutorWhichMon: @ 82015A5
	.string "Talk to me if you change your mind$"

FallarborTown_MoveRelearnersHouse_Text_TeachWhichMove: @ 82015C3
	.string "Which move should I teach?$"

FallarborTown_MoveRelearnersHouse_Text_DontHaveMoveToTeachPokemon: @ 82015DE
	.string "Sorry…\p"
	.string "It doesn't appear as if I have any move\n"
	.string "I can teach that Pokémon.$"

FallarborTown_MoveRelearnersHouse_Text_HandedOverHeartScale: @ 8201627
	.string "{PLAYER} handed over one Heart Scale\n"
	.string "in exchange.$"

FallarborTown_MoveRelearnersHouse_Text_ComeBackWithHeartScale: @ 8201653
	.string "If your Pokémon need to learn a move,\n"
	.string "come back with a Heart Scale.$"

FallarborTown_MoveRelearnersHouse_Text_CantTeachEgg: @ 8201697
	.string "Hunh? There isn't a single move that\n"
	.string "I can teach an Egg.$"

