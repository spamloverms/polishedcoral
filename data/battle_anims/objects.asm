ABSOLUTE_X EQU $00
RELATIVE_X EQU $01

battleanimobj: MACRO
	db \1 ; flags
	; bit 7: priority
	; bit 6: y flip (for enemy)
	; bit 5: x flip (for enemy)
	; bit 0: enable enemy animation coord fixing (x = $b4 - x; see below for y)
	db \2 ; enemy animation y fix param
	; if $FF: y = y + 5 tiles
	; else:   y = -y - (1 tile) * (is_softboiled_animation)
	db \3 ; video sequence
	db \4 ; callback
	db \5 ; palette
	db \6 ; tile offset
ENDM

BattleAnimObjects:
; entries correspond to ANIM_OBJ_* constants
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT_BIG_YFIX
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_01
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_02
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_00, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_HIT_BIG
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_04
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_02, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_05
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_03, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_06
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_04, BATTLEANIMFUNC_1B, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_07
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_08
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_07, BATTLEANIMFUNC_09, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_0A
	battleanimobj RELATIVE_X, $aa, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_10, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_EMBER
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0E, BATTLEANIMFUNC_04, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_0C
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_03, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_0D
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_08, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_0E
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_0A, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_0F
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_03, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_BURNED
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_12, BATTLEANIMFUNC_08, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_11
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_13, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_12
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_14, BATTLEANIMFUNC_01, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_13
	battleanimobj RELATIVE_X | X_FLIP, $78, BATTLEANIMFRAMESET_16, BATTLEANIMFUNC_0B, PAL_BATTLE_OB_GREEN, $06 ; ANIM_OBJ_RAZOR_LEAF
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_12, PAL_BATTLE_OB_RED, $0b ; ANIM_OBJ_POKE_BALL
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_09, BATTLEANIMFUNC_13, PAL_BATTLE_OB_RED, $0b ; ANIM_OBJ_POKE_BALL_BLOCKED
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_00, PAL_BATTLE_OB_RED, $08 ; ANIM_OBJ_17
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_18, BATTLEANIMFUNC_00, PAL_BATTLE_OB_RED, $08 ; ANIM_OBJ_18
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_1D, BATTLEANIMFUNC_06, PAL_BATTLE_OB_GRAY, $0c ; ANIM_OBJ_ACID
	battleanimobj RELATIVE_X, $b4, BATTLEANIMFRAMESET_1F, BATTLEANIMFUNC_38, PAL_BATTLE_OB_GRAY, $0c ; ANIM_OBJ_SLUDGE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $07 ; ANIM_OBJ_1B
	battleanimobj RELATIVE_X, $a0, BATTLEANIMFRAMESET_08, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $07 ; ANIM_OBJ_1C
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_07, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_1D
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_07, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_1E
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_1B, BATTLEANIMFUNC_36, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_1F
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_36, PAL_BATTLE_OB_BLUE, $21 ; ANIM_OBJ_20
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_0C, PAL_BATTLE_OB_BLUE, $0d ; ANIM_OBJ_21
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_23, BATTLEANIMFUNC_0D, PAL_BATTLE_OB_BLUE, $0d ; ANIM_OBJ_22
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_0E, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_23
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $80, BATTLEANIMFRAMESET_27, BATTLEANIMFUNC_0F, PAL_BATTLE_OB_BLUE, $04 ; ANIM_OBJ_24
	battleanimobj RELATIVE_X, $b4, BATTLEANIMFRAMESET_2A, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $04 ; ANIM_OBJ_HYDRO_PUMP
	battleanimobj RELATIVE_X, $40, BATTLEANIMFRAMESET_2B, BATTLEANIMFUNC_11, PAL_BATTLE_OB_GREEN, $0f ; ANIM_OBJ_26
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_2C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_27
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_28
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_2E, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_29
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_2F, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $0a ; ANIM_OBJ_FROZEN
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_14, PAL_BATTLE_OB_BROWN, $11 ; ANIM_OBJ_2B
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_14, PAL_BATTLE_OB_YELLOW, $0d ; ANIM_OBJ_2C
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_31, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_2D
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_32, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_2E
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_33, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_2F
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_15, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_THUNDER_WAVE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_36, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_31
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_37, BATTLEANIMFUNC_03, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_LIGHTNING_BOLT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_38, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_33
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_39, BATTLEANIMFUNC_03, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_34
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_3C, BATTLEANIMFUNC_17, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_BITE
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_3E, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CUT_DOWN_LEFT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_3F, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_38
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_40, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_CUT_UP_RIGHT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_41, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_3A
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_42, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_3B
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_43, BATTLEANIMFUNC_18, PAL_BATTLE_OB_GREEN, $12 ; ANIM_OBJ_3C
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_44, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GREEN, $12 ; ANIM_OBJ_3D
	battleanimobj RELATIVE_X | X_FLIP, $b8, BATTLEANIMFRAMESET_45, BATTLEANIMFUNC_19, PAL_BATTLE_OB_GRAY, $13 ; ANIM_OBJ_GUST
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_46, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GREEN, $14 ; ANIM_OBJ_3F
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_47, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GREEN, $14 ; ANIM_OBJ_40
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_48, BATTLEANIMFUNC_1A, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_41
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_49, BATTLEANIMFUNC_1A, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_42
	battleanimobj RELATIVE_X | X_FLIP, $98, BATTLEANIMFRAMESET_4A, BATTLEANIMFUNC_01, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_43
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_4B, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_44
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_1C, PAL_BATTLE_OB_GREEN, $12 ; ANIM_OBJ_ABSORB
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_4D, BATTLEANIMFUNC_1D, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_46
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_51, BATTLEANIMFUNC_1E, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_47
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_52, BATTLEANIMFUNC_1F, PAL_BATTLE_OB_GREEN, $16 ; ANIM_OBJ_48
	battleanimobj RELATIVE_X | X_FLIP, $68, BATTLEANIMFRAMESET_56, BATTLEANIMFUNC_20, PAL_BATTLE_OB_GREEN, $06 ; ANIM_OBJ_4A
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_59, BATTLEANIMFUNC_21, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_4B
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_5C, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, $17 ; ANIM_OBJ_4C
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_5D, BATTLEANIMFUNC_22, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_4D
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $88, BATTLEANIMFRAMESET_5F, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_4E
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $88, BATTLEANIMFRAMESET_2D, BATTLEANIMFUNC_09, PAL_BATTLE_OB_YELLOW, $10 ; ANIM_OBJ_4F
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $18 ; ANIM_OBJ_50
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_60, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $18 ; ANIM_OBJ_HARDEN
	battleanimobj RELATIVE_X | X_FLIP, $50, BATTLEANIMFRAMESET_61, BATTLEANIMFUNC_23, PAL_BATTLE_OB_YELLOW, $19 ; ANIM_OBJ_CHICK
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_63, BATTLEANIMFUNC_24, PAL_BATTLE_OB_GRAY, $19 ; ANIM_OBJ_53
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_66, BATTLEANIMFUNC_25, PAL_BATTLE_OB_GRAY, $19 ; ANIM_OBJ_54
	battleanimobj RELATIVE_X, $50, BATTLEANIMFRAMESET_1C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $0c ; ANIM_OBJ_SKULL
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_67, BATTLEANIMFUNC_26, PAL_BATTLE_OB_BROWN, $1a ; ANIM_OBJ_56
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_68, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BROWN, $1a ; ANIM_OBJ_57
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_69, BATTLEANIMFUNC_01, PAL_BATTLE_OB_GRAY, $1a ; ANIM_OBJ_58
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_6D, BATTLEANIMFUNC_28, PAL_BATTLE_OB_YELLOW, $19 ; ANIM_OBJ_PARALYZED
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_6A, BATTLEANIMFUNC_27, PAL_BATTLE_OB_GRAY, $1b ; ANIM_OBJ_5A
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_29, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_5B
	battleanimobj RELATIVE_X | X_FLIP, $48, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_29, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_5C
	battleanimobj RELATIVE_X | X_FLIP, $48, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_29, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_5D
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_71, BATTLEANIMFUNC_2B, PAL_BATTLE_OB_GRAY, $1d ; ANIM_OBJ_5F
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_72, BATTLEANIMFUNC_2C, PAL_BATTLE_OB_GRAY, $1d ; ANIM_OBJ_60
	battleanimobj RELATIVE_X, $48, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_2D, PAL_BATTLE_OB_RED, $1e ; ANIM_OBJ_61
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_06, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_62
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_75, BATTLEANIMFUNC_2E, PAL_BATTLE_OB_BROWN, $19 ; ANIM_OBJ_63
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_2F, PAL_BATTLE_OB_GRAY, $11 ; ANIM_OBJ_65
	battleanimobj RELATIVE_X, $78, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_2A, PAL_BATTLE_OB_RED, $23 ; ANIM_OBJ_66
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_30, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_67
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_BONE_CLUB
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_77, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_BONE_RUSH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_08, PAL_BATTLE_OB_YELLOW, $23 ; ANIM_OBJ_6A
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_6C
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_31, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_6D
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_7D, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $18 ; ANIM_OBJ_WITHDRAW
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_2F, PAL_BATTLE_OB_BLUE, $0d ; ANIM_OBJ_71
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_7E, BATTLEANIMFUNC_33, PAL_BATTLE_OB_YELLOW, $12 ; ANIM_OBJ_GROWTH
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_2F, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_73
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_34, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_74
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_35, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_75
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_80, BATTLEANIMFUNC_33, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_76
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_81, BATTLEANIMFUNC_37, PAL_BATTLE_OB_GRAY, $11 ; ANIM_OBJ_SPEED_LINE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_85, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $22 ; ANIM_OBJ_78
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_86, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $22 ; ANIM_OBJ_79
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_87, BATTLEANIMFUNC_39, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_7A
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_30, BATTLEANIMFUNC_3A, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_7B
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_34, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_7C
	battleanimobj RELATIVE_X | X_FLIP | BEHIND_BG, $88, BATTLEANIMFRAMESET_88, BATTLEANIMFUNC_3B, PAL_BATTLE_OB_BLUE, $13 ; ANIM_OBJ_AGILITY
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_76, BATTLEANIMFUNC_25, PAL_BATTLE_OB_RED, $23 ; ANIM_OBJ_HEART
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_3C, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_SACRED_FIRE
	battleanimobj RELATIVE_X | X_FLIP, $68, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_29, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_COTTON_SPORE
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_8A, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_82
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_8C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_83
	battleanimobj RELATIVE_X | X_FLIP, $50, BATTLEANIMFRAMESET_8D, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $1f ; ANIM_OBJ_84
	battleanimobj RELATIVE_X, $40, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_40, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_85
	battleanimobj RELATIVE_X | X_FLIP, $a8, BATTLEANIMFRAMESET_8E, BATTLEANIMFUNC_41, PAL_BATTLE_OB_RED, $1f ; ANIM_OBJ_86
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_8F, BATTLEANIMFUNC_3E, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_87
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_93, BATTLEANIMFUNC_3E, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_88
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_97, BATTLEANIMFUNC_3D, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_89
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_3D, PAL_BATTLE_OB_YELLOW, $23 ; ANIM_OBJ_8A
	battleanimobj RELATIVE_X | X_FLIP, $70, BATTLEANIMFRAMESET_8B, BATTLEANIMFUNC_3F, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_SPIKES
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_02, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_90
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_7F, BATTLEANIMFUNC_42, PAL_BATTLE_OB_GRAY, $08 ; ANIM_OBJ_CONVERSION
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_9A, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1b ; ANIM_OBJ_92
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9D, BATTLEANIMFUNC_25, PAL_BATTLE_OB_GRAY, $25 ; ANIM_OBJ_95
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_9E, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $25 ; ANIM_OBJ_97
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $80, BATTLEANIMFRAMESET_9F, BATTLEANIMFUNC_3A, PAL_BATTLE_OB_GREEN, $23 ; ANIM_OBJ_98
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_A0, BATTLEANIMFUNC_16, PAL_BATTLE_OB_GRAY, $23 ; ANIM_OBJ_99
	battleanimobj RELATIVE_X | X_FLIP, $70, BATTLEANIMFRAMESET_78, BATTLEANIMFUNC_43, PAL_BATTLE_OB_YELLOW, $23 ; ANIM_OBJ_9A
	battleanimobj RELATIVE_X | X_FLIP, $c0, BATTLEANIMFRAMESET_A2, BATTLEANIMFUNC_01, PAL_BATTLE_OB_GRAY, $25 ; ANIM_OBJ_9B
	battleanimobj RELATIVE_X | X_FLIP, $40, BATTLEANIMFRAMESET_A3, BATTLEANIMFUNC_44, PAL_BATTLE_OB_YELLOW, $24 ; ANIM_OBJ_9C
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_A4, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $24 ; ANIM_OBJ_GLIMMER
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_A5, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, $24 ; ANIM_OBJ_9E
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_A6, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_A0
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_A7, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_A1
	battleanimobj RELATIVE_X | X_FLIP, $00, BATTLEANIMFRAMESET_B4, BATTLEANIMFUNC_4A, PAL_BATTLE_OB_BROWN, $0f ; ANIM_OBJ_A2
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_A8, BATTLEANIMFUNC_02, PAL_BATTLE_OB_YELLOW, $05 ; ANIM_OBJ_ZAP_CANNON
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_A9, BATTLEANIMFUNC_46, PAL_BATTLE_OB_GRAY, $23 ; ANIM_OBJ_A5
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_47, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_PERISH_SONG
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_AA, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $24 ; ANIM_OBJ_FORESIGHT
	battleanimobj RELATIVE_X | X_FLIP, $b8, BATTLEANIMFRAMESET_AB, BATTLEANIMFUNC_48, PAL_BATTLE_OB_GRAY, $13 ; ANIM_OBJ_RAPID_SPIN
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_AC, BATTLEANIMFUNC_44, PAL_BATTLE_OB_GRAY, $13 ; ANIM_OBJ_A9
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_05, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_AA
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_24, BATTLEANIMFUNC_43, PAL_BATTLE_OB_GRAY, $0e ; ANIM_OBJ_AB
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_AD, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, $17 ; ANIM_OBJ_MEAN_LOOK
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_AE, BATTLEANIMFUNC_49, PAL_BATTLE_OB_GRAY, $01 ; ANIM_OBJ_AD
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_AF, BATTLEANIMFUNC_01, PAL_BATTLE_OB_YELLOW, $11 ; ANIM_OBJ_AE
	battleanimobj RELATIVE_X | X_FLIP, $00, BATTLEANIMFRAMESET_B0, BATTLEANIMFUNC_4A, PAL_BATTLE_OB_GRAY, $04 ; ANIM_OBJ_AF
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_B1, BATTLEANIMFUNC_4C, PAL_BATTLE_OB_GRAY, $19 ; ANIM_OBJ_B1 ; UNUSED
	battleanimobj RELATIVE_X, $b8, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4D, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_B2
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_04, PAL_BATTLE_OB_BLUE, $15 ; ANIM_OBJ_B4
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, PAL_BATTLE_OB_BROWN, $09 ; ANIM_OBJ_ROCK_SMASH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_73, BATTLEANIMFUNC_08, PAL_BATTLE_OB_RED, $1e ; ANIM_OBJ_FLOWER
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_4F, PAL_BATTLE_OB_RED, $1f ; ANIM_OBJ_COTTON ; UNUSED
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B5, BATTLEANIMFUNC_00, PAL_BATTLE_OB_ENEMY, $28 ; ANIM_OBJ_PLAYERFEETFOLLOW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B6, BATTLEANIMFUNC_00, PAL_BATTLE_OB_PLAYER, $29 ; ANIM_OBJ_ENEMYFEETFOLLOW
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B7, BATTLEANIMFUNC_00, PAL_BATTLE_OB_ENEMY, $28 ; ANIM_OBJ_BA ; UNUSED
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_B8, BATTLEANIMFUNC_00, PAL_BATTLE_OB_PLAYER, $29 ; ANIM_OBJ_BB ; UNUSED
	battleanimobj RELATIVE_X, $80, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_36, PAL_BATTLE_OB_GRAY, $21 ; ANIM_OBJ_MOON
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $98, BATTLEANIMFRAMESET_74, BATTLEANIMFUNC_04, PAL_BATTLE_OB_GREEN, $15 ; ANIM_OBJ_ENERGY_BALL
	battleanimobj RELATIVE_X | X_FLIP, $20, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_4A, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICE ; ANIM_OBJ_HAIL
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_C1, BATTLEANIMFUNC_58, PAL_BATTLE_OB_GRAY, ANIM_GFX_SHINE ; ANIM_OBJ_POWER_GEM
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_BA, BATTLEANIMFUNC_02, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_FOCUS_BLAST
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_C2, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICICLE ; ANIM_OBJ_ICICLE
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_07, PAL_BATTLE_OB_BLUE, $09 ; ANIM_OBJ_SMALL_ICE_CHUNK
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_03, PAL_BATTLE_OB_RED, $03 ; ANIM_OBJ_FLAME_CHARGE
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, PAL_BATTLE_OB_GRAY, $09 ; ANIM_OBJ_SHELL_SMASH
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_14, PAL_BATTLE_OB_RED, $0d ; ANIM_OBJ_CHARGE
	battleanimobj RELATIVE_X | X_FLIP, $b0, BATTLEANIMFRAMESET_98, BATTLEANIMFUNC_29, PAL_BATTLE_OB_GRAY, $14 ; ANIM_OBJ_FEATHER_DANCE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_56, BATTLEANIMFUNC_2C, PAL_BATTLE_OB_GREEN, $1d ; ANIM_OBJ_BULLET_SEED
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $1f ; ANIM_OBJ_COTTON_GUARD
	battleanimobj RELATIVE_X, $8a, BATTLEANIMFRAMESET_11, BATTLEANIMFUNC_03, PAL_BATTLE_OB_BLUE, $03  ; ANIM_OBJ_BLUE_FLAME
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_51, BATTLEANIMFUNC_1E, PAL_BATTLE_OB_BLUE, $11 ; ANIM_OBJ_HEX
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_C4, BATTLEANIMFUNC_57, PAL_BATTLE_OB_BLUE, ANIM_GFX_CHARGE ; ANIM_OBJ_PSYSHOCK
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_40, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_POLISH_1
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_3F, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, $02 ; ANIM_OBJ_POLISH_2
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, PAL_BATTLE_OB_RED, ANIM_GFX_HEARTS ; ANIM_OBJ_HEART_BURST
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STARS ; ANIM_OBJ_STAR_BURST
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_7A, BATTLEANIMFUNC_45, PAL_BATTLE_OB_YELLOW, ANIM_GFX_SPEED ; ANIM_OBJ_DAZZLE
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_EC, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_NIGHT_SLASH
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_ED, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, ANIM_GFX_CUT ; ANIM_OBJ_NIGHT_SLASH_2
	battleanimobj RELATIVE_X, $8b, BATTLEANIMFRAMESET_63, BATTLEANIMFUNC_24, PAL_BATTLE_OB_GRAY, ANIM_GFX_STATUS ; ANIM_OBJ_NASTY_PLOT
	battleanimobj RELATIVE_X, $7b, BATTLEANIMFRAMESET_63, BATTLEANIMFUNC_24, PAL_BATTLE_OB_GRAY, ANIM_GFX_STATUS ; ANIM_OBJ_NASTY_PLOT_2
	battleanimobj RELATIVE_X, $6c, BATTLEANIMFRAMESET_87, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_FINGER_POINT
	battleanimobj RELATIVE_X, $66, BATTLEANIMFRAMESET_A4, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, ANIM_GFX_SHINE ; ANIM_OBJ_GLIMMER_Y_SET
	battleanimobj RELATIVE_X | X_FLIP, $9a, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_02, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_ROCK_BLAST
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_C3, BATTLEANIMFUNC_02, PAL_BATTLE_OB_BLUE, ANIM_GFX_CHARGE ; ANIM_OBJ_DRAGON_PULSE
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_80, BATTLEANIMFUNC_33, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_ROOST
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_D2, BATTLEANIMFUNC_09, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_BULLET_PUNCH
	battleanimobj RELATIVE_X | X_FLIP, $88, BATTLEANIMFRAMESET_7B, BATTLEANIMFUNC_50, PAL_BATTLE_OB_GRAY, ANIM_GFX_SKY_ATTACK ; ANIM_OBJ_BRAVE_BIRD
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_C4, BATTLEANIMFUNC_55, PAL_BATTLE_OB_BLUE, ANIM_GFX_CHARGE ; ANIM_OBJ_DARK_PULSE
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_E9, BATTLEANIMFUNC_3C, PAL_BATTLE_OB_RED, ANIM_GFX_CHARGE ; ANIM_OBJ_DRAGON_DANCE
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_E5, BATTLEANIMFUNC_1E, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_STONE_EDGE
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_E5, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_STONE_EDGE_STILL
	battleanimobj RELATIVE_X, $a0, BATTLEANIMFRAMESET_21, BATTLEANIMFUNC_25, PAL_BATTLE_OB_BLUE, ANIM_GFX_BUBBLE ; ANIM_OBJ_RISING_BUBBLE
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_67, BATTLEANIMFUNC_26, PAL_BATTLE_OB_BLUE, ANIM_GFX_SAND ; ANIM_OBJ_AQUA_TAIL
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_BE, BATTLEANIMFUNC_09, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT ; ANIM_OBJ_LONG_PUNCH
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_1C, PAL_BATTLE_OB_RED, ANIM_GFX_CHARGE ; ANIM_OBJ_DREAM_EATER
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_E6, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_GREEN, ANIM_GFX_BUG_BUZZ ; ANIM_OBJ_BUG_BUZZ_L
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_E7, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_GREEN, ANIM_GFX_BUG_BUZZ ; ANIM_OBJ_BUG_BUZZ_R
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_D1, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, ANIM_GFX_PSYCHIC ; ANIM_OBJ_ECHOED_VOICE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_14, PAL_BATTLE_OB_GREEN, ANIM_GFX_CHARGE ; ANIM_OBJ_ENERGY_BALL_1
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_E9, BATTLEANIMFUNC_5D, PAL_BATTLE_OB_GREEN, ANIM_GFX_CHARGE  ; ANIM_OBJ_ENERGY_BALL_2
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GREEN, ANIM_GFX_HIT ; ANIM_OBJ_GREEN_HIT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_C4, BATTLEANIMFUNC_57, PAL_BATTLE_OB_GRAY, ANIM_GFX_CHARGE ; ANIM_OBJ_FLASH_CANNON
	battleanimobj RELATIVE_X | X_FLIP, $9a, BATTLEANIMFRAMESET_E2, BATTLEANIMFUNC_09, PAL_BATTLE_OB_BLUE, ANIM_GFX_LEAF_STORM ; ANIM_OBJ_VORTEX_BLUE
	battleanimobj RELATIVE_X, $92, BATTLEANIMFRAMESET_E9, BATTLEANIMFUNC_50, PAL_BATTLE_OB_BLUE, ANIM_GFX_CHARGE  ; ANIM_OBJ_AURA_SPHERE
	battleanimobj RELATIVE_X, $b0, BATTLEANIMFRAMESET_10, BATTLEANIMFUNC_1E, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_FLARE_BLITZ
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_0F, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_RED, ANIM_GFX_FIRE ; ANIM_OBJ_FLARE_BLITZ_2
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_DC, BATTLEANIMFUNC_54, PAL_BATTLE_OB_RED, ANIM_GFX_SPEED ; ANIM_OBJ_RED_STAR
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_01, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BLUE, ANIM_GFX_HIT ; ANIM_OBJ_WATER_HIT
	battleanimobj RELATIVE_X, $92, BATTLEANIMFRAMESET_C1, BATTLEANIMFUNC_2C, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE  ; ANIM_OBJ_MOONBLAST
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_14, PAL_BATTLE_OB_YELLOW, $12 ; ANIM_OBJ_MOON_CHARGE
	battleanimobj RELATIVE_X | X_FLIP | Y_FLIP, $90, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_2B, PAL_BATTLE_OB_BROWN, ANIM_GFX_HORN_LEECH ; ANIM_OBJ_HORN_LEECH
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_C7, BATTLEANIMFUNC_52, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT; ANIM_OBJ_VERTICAL_CHOP
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_C7, BATTLEANIMFUNC_09, PAL_BATTLE_OB_GRAY, ANIM_GFX_HIT; ANIM_OBJ_VERTICAL_CHOP_STILL
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_8C, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, ANIM_GFX_MISC ; ANIM_OBJ_ANGER
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_B9, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GRAY, ANIM_GFX_TAUNT ; ANIM_OBJ_TAUNT
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_D3, BATTLEANIMFUNC_54, PAL_BATTLE_OB_BROWN, ANIM_GFX_WOOD ; ANIM_OBJ_WOOD_HAMMER
	battleanimobj RELATIVE_X | X_FLIP, $a0, BATTLEANIMFRAMESET_1D, BATTLEANIMFUNC_02, PAL_BATTLE_OB_GRAY, $15 ; ANIM_OBJ_GUNKSHOT
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_C4, BATTLEANIMFUNC_57, PAL_BATTLE_OB_YELLOW, ANIM_GFX_CHARGE ; ANIM_OBJ_SHOCK_WAVE_CHARGE
	battleanimobj RELATIVE_X, $8a, BATTLEANIMFRAMESET_EA, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_SHOCK_WAVE
	battleanimobj RELATIVE_X, $fa, BATTLEANIMFRAMESET_EA, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_SHOCK_WAVE_2
	battleanimobj RELATIVE_X | X_FLIP, $34, BATTLEANIMFRAMESET_31, BATTLEANIMFUNC_00, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LIGHTNING ; ANIM_OBJ_SHOCK_WAVE_3
	battleanimobj RELATIVE_X | X_FLIP, $ff, BATTLEANIMFRAMESET_41, BATTLEANIMFUNC_00, PAL_BATTLE_OB_GREEN, $02 ; ANIM_OBJ_POWER_WHIP
	battleanimobj RELATIVE_X, $a8, BATTLEANIMFRAMESET_9B, BATTLEANIMFUNC_3C, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STARS ; ANIM_OBJ_COSMIC_POWER
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STARS ; ANIM_OBJ_COSMIC_POWER_2
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_9B, BATTLEANIMFUNC_RADIAL_MOVE_OUT_SLOW, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STARS ; ANIM_OBJ_WISH
	battleanimobj ABSOLUTE_X, $00, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_58, PAL_BATTLE_OB_YELLOW, ANIM_GFX_STARS ; ANIM_OBJ_WISH2
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_1A, BATTLEANIMFUNC_57, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_ROCK_WRECKER_CHARGE
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_84, BATTLEANIMFUNC_58, PAL_BATTLE_OB_BROWN, ANIM_GFX_HUGE_ROCK ; ANIM_OBJ_ROCK_WRECKER
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_F3, BATTLEANIMFUNC_00, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_ROCK_WRECKER_GROW
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BLOCK, BATTLEANIMFUNC_00, PAL_BATTLE_OB_RED, ANIM_GFX_RED_X ; ANIM_OBJ_BLOCK
	battleanimobj RELATIVE_X, $ff, BATTLEANIMFRAMESET_BLOCK, BATTLEANIMFUNC_07, PAL_BATTLE_OB_RED, ANIM_GFX_RED_X ; ANIM_OBJ_BLOCK2
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_06, BATTLEANIMFUNC_04, PAL_BATTLE_OB_RED, ANIM_GFX_CHARGE ; ANIM_OBJ_SIGNAL_BEAM_R
	battleanimobj RELATIVE_X | X_FLIP, $90, BATTLEANIMFRAMESET_06, BATTLEANIMFUNC_04, PAL_BATTLE_OB_BLUE, ANIM_GFX_CHARGE ; ANIM_OBJ_SIGNAL_BEAM_B
	battleanimobj RELATIVE_X | X_FLIP, $ba, BATTLEANIMFRAMESET_19, BATTLEANIMFUNC_4E, PAL_BATTLE_OB_BROWN, ANIM_GFX_ROCKS ; ANIM_OBJ_ROCK_CLIMB
	battleanimobj RELATIVE_X | X_FLIP, $9a, BATTLEANIMFRAMESET_E2, BATTLEANIMFUNC_09, PAL_BATTLE_OB_YELLOW, ANIM_GFX_LEAF_STORM ; ANIM_OBJ_VORTEX_YELLOW
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_89, BATTLEANIMFUNC_02, PAL_BATTLE_OB_BLUE, ANIM_GFX_MISC ; ANIM_OBJ_SCALD
	battleanimobj RELATIVE_X | X_FLIP, $9A, BATTLEANIMFRAMESET_6F, BATTLEANIMFUNC_34, PAL_BATTLE_OB_GRAY, $1c ; ANIM_STEAM
	battleanimobj RELATIVE_X | X_FLIP, $78, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_2A, PAL_BATTLE_OB_GRAY, $1c ; ANIM_OBJ_CLEAR_SMOG
	battleanimobj RELATIVE_X | X_FLIP, $80, BATTLEANIMFRAMESET_70, BATTLEANIMFUNC_RADIAL_MOVE_OUT, PAL_BATTLE_OB_BLUE, $1c ; ANIM_OBJ_OMINOUS_WIND
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_0E, BATTLEANIMFUNC_04, PAL_BATTLE_OB_BLUE, ANIM_GFX_FIRE ; ANIM_OBJ_WILL_O_WISP
	battleanimobj RELATIVE_X, $88, BATTLEANIMFRAMESET_4C, BATTLEANIMFUNC_1C, PAL_BATTLE_OB_BLUE, $12 ; ANIM_OBJ_LEECH_LIFE
	battleanimobj RELATIVE_X, $90, BATTLEANIMFRAMESET_12, BATTLEANIMFUNC_50, PAL_BATTLE_OB_BLUE, ANIM_GFX_ICE; ANIM_OBJ_ICE_SHARD
	