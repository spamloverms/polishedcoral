TwinkleGymEntry_MapScriptHeader:
	db 2 ; scene scripts
	scene_script TwinkleGymEntryTrigger0
	scene_script TwinkleGymEntryTrigger1

	db 0 ; callbacks

	db 2 ; warp events
	warp_def 11,  6, 7, TWINKLE_TOWN
	warp_def 11,  7, 7, TWINKLE_TOWN

	db 2 ; coord events
	xy_trigger 0,  9,  4, 0, TwinkleGymEntryClerkStopsYouL, 0, 0
	xy_trigger 0,  9,  9, 0, TwinkleGymEntryClerkStopsYouR, 0, 0

	db 4 ; bg events
	signpost  1,  2, SIGNPOST_IFNOTSET, TwinkleGymEntryBlueDoor
	signpost  1, 11, SIGNPOST_IFNOTSET, TwinkleGymEntryYellowDoor
	signpost  0,  6, SIGNPOST_IFNOTSET, TwinkleGymEntryRedDoor
	signpost  0,  7, SIGNPOST_IFNOTSET, TwinkleGymEntryRedDoor

	db 2 ; object events
	object_event  6,  7, SPRITE_BATTLE_GIRL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, TwinkleGymEntryClerk, -1
	object_event  9, 10, SPRITE_GYM_GUY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinkleGymGuyScript, -1

	
	const_def 1 ; object constants
	const TWINKLE_GYM_ENTRY_CLERK
	const TWINKLE_GYM_ENTRY_GYM_GUY
	
	
TwinkleGymEntryTrigger0:
	end
	
TwinkleGymEntryTrigger1:
	end
	
TwinkleGymEntryBlueDoor:
	dw EVENT_UNLOCKED_BLUE_DOOR
	checkitem B_ROOM_KEY
	iftrue .unlockdoor
	jumptext TwinkleGymEntryLockedDoorText
	
.unlockdoor:
	opentext
	writetext TwinkleGymEntryAskUnlockDoorText
	yesorno
	iffalse TwinkleGymEntryDontUnlockDoor
	closetext
	changeblock $2, $0, $4c
	setevent EVENT_UNLOCKED_BLUE_DOOR
	pause 7
	playsound SFX_WALL_OPEN
	pause 14
	opentext
	writetext TwinkleGymEntryUnlockDoorText
	waitbutton
	closetext
	callasm RefreshScreen_BridgeUpdate
	end
	
TwinkleGymEntryYellowDoor:
	dw EVENT_UNLOCKED_YELLOW_DOOR
	checkitem Y_ROOM_KEY
	iftrue .unlockdoor
	jumptext TwinkleGymEntryLockedDoorText
	
.unlockdoor:
	opentext
	writetext TwinkleGymEntryAskUnlockDoorText
	yesorno
	iffalse TwinkleGymEntryDontUnlockDoor
	closetext
	changeblock $a, $0, $4e
	setevent EVENT_UNLOCKED_YELLOW_DOOR
	pause 7
	playsound SFX_WALL_OPEN
	pause 14
	opentext
	writetext TwinkleGymEntryUnlockDoorText
	waitbutton
	closetext
	callasm RefreshScreen_BridgeUpdate
	end
	
TwinkleGymEntryRedDoor:
	dw EVENT_UNLOCKED_RED_DOOR
	checkitem R_ROOM_KEY
	iftrue .unlockdoor
	jumptext TwinkleGymEntryLockedDoorText
	
.unlockdoor:
	opentext
	writetext TwinkleGymEntryAskUnlockDoorText
	yesorno
	iffalse TwinkleGymEntryDontUnlockDoor
	closetext
	changeblock $6, $0, $4d
	setevent EVENT_UNLOCKED_RED_DOOR
	pause 7
	playsound SFX_WALL_OPEN
	pause 14
	opentext
	writetext TwinkleGymEntryUnlockDoorText
	waitbutton
	closetext
	callasm RefreshScreen_BridgeUpdate
	end
	
TwinkleGymEntryDontUnlockDoor:
	writetext TwinkleGymEntryBetterNotText
	waitbutton
	closetext
	end
	
TwinkleGymEntryClerkStopsYouL:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_ENTRY_CLERK, LEFT
	showemote EMOTE_SHOCK, TWINKLE_GYM_ENTRY_CLERK, 15
	pause 7
	spriteface PLAYER, RIGHT
	opentext
	writetext TwinkleGymEntryClerkTextExcuseMe
	waitbutton
	closetext
	spriteface TWINKLE_GYM_ENTRY_CLERK, DOWN
	applymovement PLAYER, Movement_TwinkleGymEntryL
	jump TwinkleGymEntryClerk
	
TwinkleGymEntryClerkStopsYouR:
	special Special_StopRunning
	playsound SFX_PAY_DAY
	spriteface TWINKLE_GYM_ENTRY_CLERK, RIGHT
	showemote EMOTE_SHOCK, TWINKLE_GYM_ENTRY_CLERK, 15
	pause 7
	spriteface PLAYER, LEFT
	opentext
	writetext TwinkleGymEntryClerkTextExcuseMe
	waitbutton
	closetext
	spriteface TWINKLE_GYM_ENTRY_CLERK, DOWN
	applymovement PLAYER, Movement_TwinkleGymEntryR
	jump TwinkleGymEntryClerk
	
TwinkleGymEntryClerk:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLUE_KEY
	iftrue .gotbluekey
	writetext TwinkleGymEntryClerkText1
	yesorno
	iffalse .saidno
	setevent EVENT_GOT_BLUE_KEY
	dotrigger $1
	writetext TwinkleGymEntryClerkText2
	waitbutton
	verbosegiveitem B_ROOM_KEY
	writetext TwinkleGymEntryClerkText3
	waitbutton
	closetext
	end
.gotbluekey
	checkevent EVENT_CAN_GET_YELLOW_KEY
	iftrue .yellow
	writetext TwinkleGymEntryClerkText3
	waitbutton
	closetext
	end
.yellow
	checkevent EVENT_GOT_YELLOW_KEY
	iftrue .gotyellowkey
	writetext TwinkleGymEntryClerkText4
	waitbutton
	closetext
	spriteface TWINKLE_GYM_ENTRY_CLERK, UP
	pause 20
	faceplayer
	opentext
	writetext TwinkleGymEntryClerkText5
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	takeitem B_ROOM_KEY
	verbosegiveitem Y_ROOM_KEY
	writetext TwinkleGymEntryClerkText6
	waitbutton
	closetext
	setevent EVENT_GOT_YELLOW_KEY
	end
.gotyellowkey
	checkevent EVENT_CAN_GET_RED_KEY
	iftrue .red
	writetext TwinkleGymEntryClerkText6
	waitbutton
	closetext
	end
.red
	checkevent EVENT_GOT_RED_KEY
	iftrue .gotredkey
	writetext TwinkleGymEntryClerkText7
	waitbutton
	closetext
	spriteface TWINKLE_GYM_ENTRY_CLERK, UP
	pause 20
	faceplayer
	opentext
	writetext TwinkleGymEntryClerkText8
	playsound SFX_LEVEL_UP 
	waitsfx
	waitbutton
	takeitem Y_ROOM_KEY
	verbosegiveitem R_ROOM_KEY
	writetext TwinkleGymEntryClerkText9
	waitbutton
	closetext
	setevent EVENT_GOT_RED_KEY
	end
.gotredkey
	writetext TwinkleGymEntryClerkText9
	waitbutton
	closetext
	end
.saidno
	writetext TwinkleGymEntryClerkSaidNo
	waitbutton
	closetext
	end
	
TwinkleGymGuyScript:
	jumptextfaceplayer TwinkleGymGuyText1
	
TwinkleGymGuyText1:
	text "Yo!"
	
	para "Champ in making!"
	
	para "You here for some"
	line "rest and relaxation?"
	
	para "I hope not, cuz you"
	line "aren't gonna find"
	cont "it!"
	
	para "Despite the weather"
	line "outside, this toasty"
	cont "GYM specializes in"
	cont "FIRE-type #MON!"

	para "Douse them with a"
	line "WATER or ROCK-type"
	cont "MOVE to take 'em"
	cont "down real quick!"
	
	para "ICE or GRASS-types"
	line "won't do well here,"
	cont "though…"
	
	para "You know all this,"
	line "kid!"
	
	para "Go kick some tail!"
	done
	
TwinkleGymGuyText2:
	text "Great job, kid!"
	
	para "Just like I said!"
	
	para "Now if you'll"
	line "excuse me,"
	
	para "I think I'm gonna"
	line "book some time in"
	cont "one of the rooms."
	
	para "I could use a spa"
	line "day!"
	done
	
TwinkleGymEntryClerkText1:
	text "Welcome to the"
	line "TWINKLE TOWN"
	cont "#MON GYM."
	
	para "Here, we provide"
	line "sauna and spa"
	cont "services as well"
	cont "as standard GYM"
	cont "battles."
	
	para "Are you here to"
	line "challenge the GYM?"
	done
	
TwinkleGymEntryClerkText2:
	text "Excellent!"
	
	para "You're going to be"
	line "in our BLUE ROOM"
	cont "today."
	
	para "Here is your key."
	done
	
TwinkleGymEntryClerkText3:
	text "The BLUE ROOM is"
	line "down the hall to"
	cont "the left."
	
	para "Please proceed to"
	line "the BLUE ROOM."
	
	para "Good luck!"
	done
	
TwinkleGymEntryClerkText4:
	text "What's that?"
	
	para "The wrong room?"
	
	para "Let me just check"
	line "here…"
	done
	
	
TwinkleGymEntryClerkText5:
	text "Oh my!"
	
	para "You're right!"
	
	para "You're supposed to"
	line "be in the YELLOW"
	cont "ROOM!"
	
	para "My mistake."
	
	para "Here is your key!"
	
	para "<PLAYER> handed"
	line "over the B.ROOM"
	cont "KEY."
	done
	
TwinkleGymEntryClerkText6:
	text "The YELLOW ROOM"
	line "is down the hall"
	cont "to the right."
	
	para "Please proceed to"
	line "the YELLOW ROOM."
	
	para "Good luck!"
	done
	
	
TwinkleGymEntryClerkText7:
	text "Hmm?"
	
	para "The wrong room"
	line "again?"
	
	para "One moment…"
	done
	
TwinkleGymEntryClerkText8:
	text "Oh dear…"
	
	para "I messed up again,"
	line "didn't I?"
	
	para "It says here you're"
	line "supposed to be in"
	cont "the RED ROOM."
	
	para "I'm sure of it"
	line "this time!"
	
	para "<PLAYER> handed"
	line "over the Y.ROOM" 
	cont "KEY."
	done
	
TwinkleGymEntryClerkText9:
	text "The RED ROOM is…"
	
	para "Well, I'm sure you"
	line "know where the RED"
	cont "ROOM is by now…"
	
	para "Good luck!"
	done
	
TwinkleGymEntryClerkTextExcuseMe:
	text "Excuse me!"
	done
	
TwinkleGymEntryClerkTextExcuseMe2:
	text "Are you here to"
	line "challenge the GYM?"
	done
	
TwinkleGymEntryClerkSaidNo:
	text "Alright then."
	
	para "Have a good day!"
	done

TwinkleGymEntryLockedDoorText:
	text "It's locked tight!"
	done
	
TwinkleGymEntryUnlockDoorText:
	text "The door unlocked!"
	done
	
TwinkleGymEntryAskUnlockDoorText:
	text "Looks like your"
	line "key works on this"
	cont "door."
	
	para "Unlock the door?"
	done
	
TwinkleGymEntryBetterNotText:
	text "Better not…"
	done
	
Movement_TwinkleGymEntryL:
	step_right
	step_right
	turn_step_up
	step_end
	
Movement_TwinkleGymEntryR:
	step_left
	step_left
	step_left
	turn_step_up
	step_end
