SECTION "bank00", ROM0

SECTION "rst00", ROM0[$00]

Unknown_0x0000:
INCBIN "baserom.gb", $0000, $0008 - $0000

SECTION "rst08", ROM0[$08]

UnknownData_0x0008:
INCBIN "baserom.gb", $0008, $0010 - $0008

SECTION "rst10", ROM0[$10]

UnknownData_0x0010:
INCBIN "baserom.gb", $0010, $0018 - $0010

SECTION "rst18", ROM0[$18]

UnknownData_0x0018:
INCBIN "baserom.gb", $0018, $0020 - $0018

SECTION "rst20", ROM0[$20]

UnknownData_0x0020:
INCBIN "baserom.gb", $0020, $0028 - $0020

SECTION "rst28", ROM0[$28]

UnknownData_0x0028:
INCBIN "baserom.gb", $0028, $0030 - $0028

SECTION "rst30", ROM0[$30]

UnknownData_0x0030:
INCBIN "baserom.gb", $0030, $0038 - $0030

SECTION "rst38", ROM0[$38]

UnknownData_0x0038:
INCBIN "baserom.gb", $0038, $0040 - $0038

SECTION "vblankInt", ROM0[$40]
	push af
	push hl
	push bc
	push de
	jp Unknown_0x0159

UnknownData_0x0047:
INCBIN "baserom.gb", $0047, $0048 - $0047

SECTION "lcdstatInt", ROM0[$48]
	jp $DA13

UnknownData_0x004B:
INCBIN "baserom.gb", $004B, $0050 - $004B

SECTION "timerInt", ROM0[$50]
	push af
	push hl
	push bc
	push de
	jp Unknown_0x0333

UnknownData_0x0057:
INCBIN "baserom.gb", $0057, $0058 - $0057

SECTION "serialInt", ROM0[$58]

UnknownData_0x0058:
INCBIN "baserom.gb", $0058, $0060 - $0058

SECTION "joypadInt", ROM0[$60]

UnknownData_0x0060:
INCBIN "baserom.gb", $0060, $0100 - $0060

SECTION "start", ROM0[$100]
	nop
	jp Unknown_0x0150

SECTION "Header", ROM0[$134]
	db "KIRBY2";Title
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $30,$31;0x144 New Licensee Code
	db $03;SGB Flag
	db $03;Cart Type
	db $04;ROM Size
	db $02;RAM Size
	db $01;Destination Code
	db $33;Old Licensee Code
	db $00;Version

SECTION "Home", ROM0[$150]

Unknown_0x0150:
	di
	ld a,$1A
	ld [$2100],a
	jp Unknown_0x68000

Unknown_0x0159:
	ld a,[$FF00+$B5]
	or a
	jr z,Unknown_0x016F

Unknown_0x015E:
	ld a,[$FF00+$44]
	cp $91
	jr nz,Unknown_0x015E
	ld hl,$FF40
	res 7,[hl]
	xor a
	ld [$FF00+$B5],a
	jp Unknown_0x029F

Unknown_0x016F:
	ld a,[$DA0F]
	cp $01
	jp c,Unknown_0x0193
	ld a,$C0
	jr z,Unknown_0x017C
	inc a

Unknown_0x017C:
	ld [$FF00+$89],a
	call $FF88
	ld a,[$DA0F]
	dec a
	ld hl,$DA02
	jr z,Unknown_0x018D
	ld hl,$DA04

Unknown_0x018D:
	ld a,[hli]
	ld [$FF00+$42],a
	ld a,[hl]
	ld [$FF00+$43],a

Unknown_0x0193:
	ld hl,$CD00
	ld c,$47
	ld a,[hli]
	ld [$FF00+c],a
	inc c
	ld a,[hli]
	ld [$FF00+c],a
	inc c
	ld a,[hl]
	ld [$FF00+c],a
	ld a,[$DA27]
	or a
	jp z,Unknown_0x0210
	ld [$DA25],sp
	ld de,$001F
	bit 2,a
	jr z,Unknown_0x01DD
	bit 0,a
	jr z,Unknown_0x01C8
	ld a,[$DA23]
	ld sp,$C200

Unknown_0x01BB:
	pop hl
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	add hl,de
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	dec a
	jr nz,Unknown_0x01BB

Unknown_0x01C8:
	ld a,[$DA24]
	ld sp,$C300

Unknown_0x01CE:
	pop hl
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	add hl,de
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	dec a
	jr nz,Unknown_0x01CE
	jr Unknown_0x0207

Unknown_0x01DD:
	bit 1,a
	jr z,Unknown_0x01F4
	ld a,[$DA24]
	ld sp,$C300

Unknown_0x01E7:
	pop hl
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	add hl,de
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	dec a
	jr nz,Unknown_0x01E7

Unknown_0x01F4:
	ld a,[$DA23]
	ld sp,$C200

Unknown_0x01FA:
	pop hl
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	add hl,de
	pop bc
	ld [hl],c
	inc l
	ld [hl],b
	dec a
	jr nz,Unknown_0x01FA

Unknown_0x0207:
	ld sp,$DA25
	pop hl
	ld sp,hl
	xor a
	ld [$DA27],a

Unknown_0x0210:
	xor a
	ld [$FF00+$45],a
	ld hl,$DA14
	ld a,$A4
	ld [hli],a
	ld [hl],$02
	ld [$DA18],sp
	ld sp,$DA1A
	pop de
	pop hl
	ld c,h
	ld h,$C4
	ld a,[$FF00+$92]
	ld b,a
	pop af
	reti

Unknown_0x022B:
	ld a,l
	cp b
	jr z,Unknown_0x023E

Unknown_0x022F:
	ld e,[hl]
	inc l
	ld d,[hl]
	inc l
	ld c,[hl]
	inc l

Unknown_0x0235:
	ld a,[hl]
	ld [de],a
	inc l
	inc de
	dec c
	jr nz,Unknown_0x0235
	jr Unknown_0x022B

Unknown_0x023E:
	di
	cp b
	jr z,Unknown_0x0245
	ei
	jr Unknown_0x022F

Unknown_0x0245:
	ld h,c
	ld bc,$022B
	push bc
	push af
	push hl
	push de

Unknown_0x024D:
	ld sp,$DA18
	pop hl
	ld sp,hl
	ld a,[$DA29]
	ld [$FF00+$45],a
	ld hl,$DA14
	ld a,[$DA16]
	ld [hli],a
	ld a,[$DA17]
	ld [hl],a
	ld hl,$FF40
	ld a,[$DA2B]
	or a
	jr z,Unknown_0x026F
	res 1,[hl]
	jr Unknown_0x0271

Unknown_0x026F:
	set 1,[hl]

Unknown_0x0271:
	ld a,[$FF00+$0F]
	and $FD
	ld [$FF00+$0F],a
	ld a,[$FF00+$FF]
	and $FE
	ld [$FF00+$FF],a
	ei
	call $DA10
	xor a
	ld [$DA0F],a
	ld a,$01
	ld [$DA0C],a

Unknown_0x028A:
	ld a,[$FF00+$A4]
	push af
	ld a,$00
	call Unknown_0x05F3
	call Unknown_0x2BFD
	pop af
	call Unknown_0x05F3
	ld a,[$FF00+$FF]
	or $01
	ld [$FF00+$FF],a

Unknown_0x029F:
	pop de
	pop bc
	pop hl
	pop af
	reti
	ld h,c
	push af
	push hl
	push de
	jr Unknown_0x024D
	push af
	push hl
	push bc
	push de
	ld hl,$FF40
	bit 5,[hl]
	jr z,Unknown_0x029F
	ld b,$0F

Unknown_0x02B7:
	nop
	dec b
	jr nz,Unknown_0x02B7
	res 1,[hl]
	ld a,$E4
	ld [$FF00+$47],a
	jp Unknown_0x029F
	push af
	push hl
	push bc
	push de
	ld hl,$FF40
	ld a,[hl]
	set 3,a
	res 1,a
	ld b,$0C

Unknown_0x02D2:
	nop
	dec b
	jr nz,Unknown_0x02D2
	ld [hl],a
	xor a
	ld hl,$FF42
	ld [hli],a
	ld [hl],a
	jp Unknown_0x029F
	push af
	push hl
	push bc
	push de
	ld hl,$FF40
	ld a,[hl]
	res 3,a
	set 1,a
	ld b,$0C

Unknown_0x02EE:
	nop
	dec b
	jr nz,Unknown_0x02EE
	ld [hl],a
	ld hl,$DA2E
	ld a,[hli]
	ld [$FF00+$42],a
	ld a,[hl]
	ld [$FF00+$43],a
	ld hl,$DA14
	ld a,$C4
	ld [hli],a
	ld [hl],$02
	ld a,[$DA2A]
	ld [$FF00+$45],a
	jp Unknown_0x029F
	push af
	push hl
	push bc
	push de
	ld a,[$DA2D]
	ld hl,$FF43
	ld b,$0F

Unknown_0x0318:
	nop
	dec b
	jr nz,Unknown_0x0318
	ld [hl],a
	jp Unknown_0x029F

UnknownData_0x0320:
INCBIN "baserom.gb", $0320, $0333 - $0320

Unknown_0x0333:
	ld a,$01
	ld [$DA0D],a
	ld a,[$FF00+$40]
	bit 7,a
	jp z,Unknown_0x028A
	jp Unknown_0x029F
	ret

Unknown_0x0343:
	ld hl,$DA0C

Unknown_0x0346:
	di
	bit 0,[hl]
	jr nz,Unknown_0x034F
	db $76;halt
	ei
	jr Unknown_0x0346

Unknown_0x034F:
	ei
	ld [hl],$00
	ld hl,$DA0E
	inc [hl]
	ret

Unknown_0x0357:
	ld a,[$DA3E]
	ld [$FF00+$84],a
	ld a,[$DEED]
	or a
	jr nz,Unknown_0x0369
	ld b,$01
	ld hl,$DA3E
	jr Unknown_0x0386

Unknown_0x0369:
	ld a,[$DA38]
	or a
	ret nz
	ld b,$02
	ld a,[$FF00+$00]
	ld c,a
	jr Unknown_0x037A

Unknown_0x0375:
	ld a,[$FF00+$00]
	cp c
	jr z,Unknown_0x03B2

Unknown_0x037A:
	cpl
	and $03
	add a,a
	add a,a
	ld e,a
	ld d,$00
	ld hl,$DA3E
	add hl,de

Unknown_0x0386:
	ld e,[hl]
	ld a,$20
	ld [$FF00+$00],a
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	swap a
	and $F0
	ld d,a
	ld a,$10
	ld [$FF00+$00],a
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	and $0F
	or d
	cpl
	call Unknown_0x041E
	ld a,$30
	ld [$FF00+$00],a
	dec b
	jr nz,Unknown_0x0375

Unknown_0x03B2:
	ld a,[$DA3A]
	or a
	jp z,Unknown_0x03F8
	ld hl,$DA3C
	ld a,[hli]
	ld b,[hl]
	ld c,a
	cp $FE
	jr nz,Unknown_0x03CA
	ld a,b
	cp $BE
	jr nz,Unknown_0x03CA
	dec bc
	dec bc

Unknown_0x03CA:
	ld a,[$DA3A]
	cp $02
	jr z,Unknown_0x03D1

Unknown_0x03D1:
	ld a,[$DA3B]
	dec a
	jr nz,Unknown_0x03E2
	inc bc
	inc bc
	inc bc
	ld a,[bc]
	dec bc
	ld hl,$DA3C
	ld [hl],c
	inc hl
	ld [hl],b

Unknown_0x03E2:
	ld [$DA3B],a
	ld a,[$FF00+$A5]
	ld e,a
	ld a,[bc]
	ld hl,$FFA5
	call Unknown_0x041E
	ld b,$04
	ld hl,$DA42
	ld c,$A9
	jr Unknown_0x03FF

Unknown_0x03F8:
	ld b,$08
	ld hl,$DA3E
	ld c,$A5

Unknown_0x03FF:
	ld a,[hli]
	ld [$FF00+c],a
	inc c
	dec b
	jr nz,Unknown_0x03FF
	ld a,[$FF00+$A5]
	cp $0F
	ret nz
	ld a,[$FF00+$A6]
	cp $0F
	ret z
	or a
	ret z
	ld e,$34
	ld hl,$6002
	ld a,$1E
	call Unknown_0x05CF
	jp Unknown_0x0150

Unknown_0x041E:
	ld d,a
	ld [hli],a
	xor e
	and d
	ld [hli],a
	jr z,Unknown_0x0429
	ld [hli],a
	ld [hl],$14
	ret

Unknown_0x0429:
	inc hl
	or [hl]
	jr z,Unknown_0x0432
	dec [hl]
	dec hl
	ld [hl],$00
	ret

Unknown_0x0432:
	ld [hl],$03
	dec hl
	ld [hl],d
	ret

Unknown_0x0437:
	call Unknown_0x0496
	call Unknown_0x04AE
	call Unknown_0x0343
	ld d,$01
	ld hl,$5FEB
	ld a,$1E
	call Unknown_0x05CF
	ld hl,$5DFF
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x0452:
	ld a,$01
	ld [$FF00+$B5],a

Unknown_0x0456:
	ld a,[$FF00+$B5]
	or a
	jr nz,Unknown_0x0456
	di
	ld hl,$FF0F
	res 0,[hl]
	res 1,[hl]
	ld a,$FF
	ld [$FF00+$05],a
	ld a,$04
	ld [$FF00+$07],a
	ei
	ret

Unknown_0x046D:
	call Unknown_0x0483
	ld hl,$5DFF
	ld a,$1E
	call Unknown_0x05CF
	ld d,$00
	ld hl,$5FEB
	ld a,$1E
	call Unknown_0x05CF
	ret

Unknown_0x0483:
	ld hl,$DA0D
	ld [hl],$00

Unknown_0x0488:
	db $76;halt
	bit 0,[hl]
	jr z,Unknown_0x0488
	xor a
	ld [$FF00+$07],a
	ld hl,$FF40
	set 7,[hl]
	ret

Unknown_0x0496:
	ld a,[$DA28]
	ld de,$DA23
	rra
	jr nc,Unknown_0x04A0
	inc de

Unknown_0x04A0:
	xor a
	ld [$DA09],a
	ld [$DA22],a
	ld [de],a
	ld hl,$DA06
	ld [hli],a
	ld [hl],a
	ret

Unknown_0x04AE:
	ld a,[$DA08]
	ld c,a
	ld h,a
	ld de,$DA0A
	rra
	jr nc,Unknown_0x04BA
	inc de

Unknown_0x04BA:
	ld a,[de]
	ld b,a
	ld a,[$DA09]
	ld l,a
	ld [de],a
	sub b
	jr nc,Unknown_0x04CA
	ld b,a
	xor a

Unknown_0x04C6:
	ld [hli],a
	inc b
	jr nz,Unknown_0x04C6

Unknown_0x04CA:
	srl h
	ld hl,$DA02
	jr nc,Unknown_0x04D4
	ld hl,$DA04

Unknown_0x04D4:
	ld a,[$DA00]
	ld b,a
	ld a,[$DA06]
	add a,b
	ld [hli],a
	ld a,[$DA01]
	ld b,a
	ld a,[$DA07]
	add a,b
	ld [hli],a
	ld a,[$DA28]
	ld b,a
	ld de,$DA23
	rra
	jr nc,Unknown_0x04F1
	inc de

Unknown_0x04F1:
	ld a,[de]
	or a
	jr z,Unknown_0x050E
	bit 0,b
	ld hl,$DA27
	di
	jr nz,Unknown_0x0503
	set 0,[hl]
	res 2,[hl]
	jr Unknown_0x0507

Unknown_0x0503:
	set 1,[hl]
	set 2,[hl]

Unknown_0x0507:
	ei
	ld a,b
	xor $01
	ld [$DA28],a

Unknown_0x050E:
	ld a,c
	and $01
	inc a
	ld [$DA0F],a
	ld a,c
	xor $01
	ld [$DA08],a
	ret

Unknown_0x051C:
	ld a,[$DA09]
	rrca
	rrca
	add a,[hl]
	cp $29
	ret nc
	ld a,[de]
	dec e
	or a
	jr z,Unknown_0x0532
	inc a
	ret nz
	ld a,[de]
	cp $C0
	ret c
	jr Unknown_0x0536

Unknown_0x0532:
	ld a,[de]
	cp $C0
	ret nc

Unknown_0x0536:
	add a,$10
	ld c,a
	dec e
	ld a,[de]
	dec e
	or a
	jr z,Unknown_0x0547
	inc a
	ret nz
	ld a,[de]
	cp $CC
	ret c
	jr Unknown_0x054B

Unknown_0x0547:
	ld a,[de]
	cp $CC
	ret nc

Unknown_0x054B:
	add a,$08
	ld b,a
	inc hl
	ld a,[$DA08]
	ld d,a
	ld a,[$DA09]
	ld e,a
	ld a,[$FF00+$93]
	rla
	jr c,Unknown_0x058B

Unknown_0x055C:
	ld a,[hli]
	add a,c
	cp $A0
	jr nc,Unknown_0x0581
	ld [de],a
	inc e
	ld a,[hli]
	add a,b
	cp $A8
	jr nc,Unknown_0x0586
	ld [de],a
	inc e
	ld a,[$FF00+$94]
	add a,[hl]
	inc hl
	ld [de],a
	inc e
	ld a,[$FF00+$95]
	xor [hl]
	inc hl
	ld [de],a
	inc e

Unknown_0x0578:
	bit 0,a
	jr z,Unknown_0x055C
	ld a,e
	ld [$DA09],a
	ret

Unknown_0x0581:
	inc hl
	inc hl
	ld a,[hli]
	jr Unknown_0x0578

Unknown_0x0586:
	dec e
	inc hl
	ld a,[hli]
	jr Unknown_0x0578

Unknown_0x058B:
	ld a,[hli]
	add a,c
	cp $A0
	jr nc,Unknown_0x05B5
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	sub $07
	add a,b
	cp $A8
	jr nc,Unknown_0x05BA
	ld [de],a
	inc e
	ld a,[$FF00+$94]
	add a,[hl]
	inc hl
	ld [de],a
	inc e
	ld a,[$FF00+$95]
	xor [hl]
	xor $20
	inc hl
	ld [de],a
	inc e

Unknown_0x05AC:
	bit 0,a
	jr z,Unknown_0x058B
	ld a,e
	ld [$DA09],a
	ret

Unknown_0x05B5:
	inc hl
	inc hl
	ld a,[hli]
	jr Unknown_0x05AC

Unknown_0x05BA:
	dec e
	inc hl
	ld a,[hli]
	jr Unknown_0x05AC

Unknown_0x05BF:
	ld [$FF00+$96],a
	ld a,[$FF00+$A4]
	push af
	ld a,[$FF00+$96]
	call Unknown_0x05DD
	call Unknown_0x0621
	pop af
	jr Unknown_0x05DD

Unknown_0x05CF:
	ld [$FF00+$96],a
	ld a,[$FF00+$A4]
	push af
	ld a,[$FF00+$96]
	call Unknown_0x05DD
	call Unknown_0x0620
	pop af

Unknown_0x05DD:
	di
	ld [$2100],a
	ld [$FF00+$A4],a
	ei
	ret

Unknown_0x05E5:
	ld [$FF00+$96],a
	ld a,[$FF00+$A4]
	push af
	ld a,[$FF00+$96]
	call Unknown_0x05F3
	call Unknown_0x0620
	pop af

Unknown_0x05F3:
	ld [$2100],a
	ld [$FF00+$A4],a
	ret

Unknown_0x05F9:
	di
	ld a,l
	ld [$DA11],a
	ld a,h
	ld [$DA12],a
	ei
	ret

Unknown_0x0604:
	ld a,l
	ld [$DA11],a
	ld a,h
	ld [$DA12],a
	ret

Unknown_0x060D:
	ld [$FF00+$96],a
	ld a,[$FF00+$A4]
	push af
	ld a,[$FF00+$96]
	call Unknown_0x05DD
	call Unknown_0x0708
	pop af
	jr Unknown_0x05DD

UnknownData_0x061D:
INCBIN "baserom.gb", $061D, $0620 - $061D

Unknown_0x0620:
	jp hl

Unknown_0x0621:
	inc b
	inc c
	jr Unknown_0x0628

Unknown_0x0625:
	ld a,[hli]
	ld [de],a
	inc de

Unknown_0x0628:
	dec c
	jr nz,Unknown_0x0625
	dec b
	jr nz,Unknown_0x0625
	ret

Unknown_0x062F:
	inc b
	inc c
	jr Unknown_0x0634

Unknown_0x0633:
	ld [hli],a

Unknown_0x0634:
	dec c
	jr nz,Unknown_0x0633
	dec b
	jr nz,Unknown_0x0633
	ret

Unknown_0x063B:
	call Unknown_0x0647
	push bc
	ld b,a
	ld c,e
	call Unknown_0x2885
	ld a,b
	pop bc
	ret

Unknown_0x0647:
	push de
	push hl
	ld hl,$DA30
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld d,h
	ld e,l
	add hl,hl
	add hl,hl
	add hl,de
	ld de,$3711
	add hl,de
	ld a,l
	ld [$DA30],a
	ld a,h
	ld [$DA31],a
	pop hl
	pop de
	ret

Unknown_0x0663:
	ld hl,$066D
	add a,l
	ld l,a
	jr nc,Unknown_0x066B
	inc h

Unknown_0x066B:
	ld a,[hl]
	ret

UnknownData_0x066D:
INCBIN "baserom.gb", $066D, $0675 - $066D

Unknown_0x0675:
	push de
	add a,$03
	ld e,a
	ld a,[$FF00+$92]
	ld d,a
	ld a,[$DA1C]
	sub d
	dec a
	cp e
	pop de
	ret
	ld a,[$DA0F]
	or a
	jr nz,Unknown_0x0693
	ld a,[$DA39]
	or a
	ret z
	xor a
	ld [$DA39],a

Unknown_0x0693:
	ld hl,$DA33
	dec [hl]
	ret nz
	ld a,[$DA34]
	cp $0C
	jr z,Unknown_0x06BF
	ld e,a
	ld d,$CD
	ld a,[$DA38]
	or a
	jr nz,Unknown_0x06C9
	ld hl,$CD00
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	inc e
	ld [hl],a
	ld a,e
	ld [$DA34],a

Unknown_0x06B8:
	ld a,[$DA32]
	ld [$DA33],a
	ret

Unknown_0x06BF:
	xor a

Unknown_0x06C0:
	ld [$DA36],a
	ld hl,$0342
	jp Unknown_0x0604

Unknown_0x06C9:
	ld a,[$CD0C]
	or a
	jr nz,Unknown_0x06D5
	xor a
	ld [$DA38],a
	jr Unknown_0x06C0

Unknown_0x06D5:
	dec a
	ld [$CD0C],a
	jr nz,Unknown_0x06EF
	ld a,[$DA37]
	cp $FF
	jr z,Unknown_0x06EF
	cp $01
	ld a,$FF
	jr z,Unknown_0x06E9
	xor a

Unknown_0x06E9:
	ld hl,$CD00
	ld [hli],a
	ld [hli],a
	ld [hl],a

Unknown_0x06EF:
	ld a,[de]
	ld h,a
	inc e
	ld a,e
	ld [$DA34],a
	ld a,[$FF00+$A4]
	push af
	ld a,$1E
	call Unknown_0x05F3
	ld e,h
	call Unknown_0x7A00C
	pop af
	call Unknown_0x05F3
	jr Unknown_0x06B8

Unknown_0x0708:
	ld a,e
	ld [$FF00+$97],a
	ld a,d
	ld [$FF00+$98],a

Unknown_0x070E:
	ld a,[hl]
	cp $FF
	ret z
	and $E0
	cp $E0
	jr nz,Unknown_0x0728
	ld a,[hl]
	add a,a
	add a,a
	add a,a
	and $E0
	push af
	ld a,[hli]
	and $03
	ld b,a
	ld a,[hli]
	ld c,a
	inc bc
	jr Unknown_0x0730

Unknown_0x0728:
	push af
	ld a,[hli]
	and $1F
	ld c,a
	ld b,$00
	inc c

Unknown_0x0730:
	inc b
	inc c
	pop af
	bit 7,a
	jr nz,Unknown_0x077B
	cp $20
	jr z,Unknown_0x074F
	cp $40
	jr z,Unknown_0x075B
	cp $60
	jr z,Unknown_0x076E

Unknown_0x0743:
	dec c
	jr nz,Unknown_0x074A
	dec b
	jp z,Unknown_0x070E

Unknown_0x074A:
	ld a,[hli]
	ld [de],a
	inc de
	jr Unknown_0x0743

Unknown_0x074F:
	ld a,[hli]

Unknown_0x0750:
	dec c
	jr nz,Unknown_0x0757
	dec b
	jp z,Unknown_0x070E

Unknown_0x0757:
	ld [de],a
	inc de
	jr Unknown_0x0750

Unknown_0x075B:
	dec c
	jr nz,Unknown_0x0762
	dec b
	jp z,Unknown_0x076A

Unknown_0x0762:
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hld]
	ld [de],a
	inc de
	jr Unknown_0x075B

Unknown_0x076A:
	inc hl
	inc hl
	jr Unknown_0x070E

Unknown_0x076E:
	ld a,[hli]

Unknown_0x076F:
	dec c
	jr nz,Unknown_0x0776
	dec b
	jp z,Unknown_0x070E

Unknown_0x0776:
	ld [de],a
	inc de
	inc a
	jr Unknown_0x076F

Unknown_0x077B:
	push hl
	push af
	ld a,[hli]
	ld l,[hl]
	ld h,a
	ld a,[$FF00+$97]
	add a,l
	ld l,a
	ld a,[$FF00+$98]
	adc a,h
	ld h,a
	pop af
	cp $80
	jr z,Unknown_0x0795
	cp $A0
	jr z,Unknown_0x07A0
	cp $C0
	jr z,Unknown_0x07B2

Unknown_0x0795:
	dec c
	jr nz,Unknown_0x079B
	dec b
	jr z,Unknown_0x07BE

Unknown_0x079B:
	ld a,[hli]
	ld [de],a
	inc de
	jr Unknown_0x0795

Unknown_0x07A0:
	dec c
	jr nz,Unknown_0x07A7
	dec b
	jp z,Unknown_0x07BE

Unknown_0x07A7:
	ld a,[hli]
	push hl
	ld h,$D9
	ld l,a
	ld a,[hl]
	pop hl
	ld [de],a
	inc de
	jr Unknown_0x07A0

Unknown_0x07B2:
	dec c
	jr nz,Unknown_0x07B9
	dec b
	jp z,Unknown_0x07BE

Unknown_0x07B9:
	ld a,[hld]
	ld [de],a
	inc de
	jr Unknown_0x07B2

Unknown_0x07BE:
	pop hl
	inc hl
	inc hl
	jp Unknown_0x070E

Unknown_0x07C4:
	ld [$FF00+$84],a

Unknown_0x07C6:
	push de
	push bc
	ld b,h
	ld c,l

Unknown_0x07CA:
	call Unknown_0x0B94
	jr nc,Unknown_0x07D8
	pop hl
	pop de
	ld h,$00
	ld a,h
	ld [$DA4A],a
	ret

Unknown_0x07D8:
	ld a,h
	ld [$DA4A],a
	ld l,$22
	ld [hl],$42
	inc l
	ld [hl],$03
	ld a,$80
	ld l,$03
	ld [hl],a
	ld l,$06
	ld [hl],a
	pop bc
	ld l,$04
	ld [hl],c
	inc l
	ld [hl],b
	pop bc
	ld l,$07
	ld [hl],c
	inc l
	ld [hl],b
	call Unknown_0x0C06
	ld a,[$FF00+$84]

Unknown_0x07FC:
	ld l,$00
	ld [hl],a
	ld e,a
	ld d,$00
	sla a
	rl d
	add a,e
	ld e,a
	ld a,$77
	adc a,d
	ld d,a
	xor a
	ld l,$0D
	ld [hli],a
	ld [hl],a
	ld l,$0F
	ld [hli],a
	ld [hl],a
	ld l,$11
	ld [hli],a
	ld [hl],a
	ld l,$45
	ld [hli],a
	ld [hl],a
	ld l,$4A
	ld [hli],a
	ld [hl],a
	ld a,$FF
	ld l,$15
	ld [hl],a
	ld l,$49
	ld [hl],a
	ld l,$48
	ld [hl],a
	ld a,[$FF00+$A4]
	ld [$FF00+$84],a
	ld a,$07
	call Unknown_0x05DD
	ld a,[de]
	ld c,a
	inc de
	ld a,[de]
	ld b,a
	inc de
	ld a,[de]
	ld e,a
	ld a,[$FF00+$84]
	call Unknown_0x05DD
	call Unknown_0x0855
	ret

Unknown_0x0846:
	ld a,[$FF00+$9A]
	ld h,a

Unknown_0x0849:
	ld a,h
	cp $A0
	ret c
	cp $B3
	ret nc
	ld l,$00
	ld a,[hl]
	inc a
	ret z

Unknown_0x0855:
	call Unknown_0x0C2A
	ld l,$19
	ld [hl],e
	inc l
	ld [hl],b
	inc l
	ld [hl],c
	xor a
	ld l,$24
	ld [hl],a
	ld l,$47
	ld [hl],a
	ld l,$28
	ld [hl],$39
	ret

Unknown_0x086B:
	ld a,[$DA46]
	jr Unknown_0x087F

Unknown_0x0870:
	ld [$FF00+$9A],a
	ld h,a
	ld l,$01
	ld a,[hl]
	ld [$DA49],a
	call Unknown_0x08A1
	ld a,[$DA49]

Unknown_0x087F:
	or a
	jr nz,Unknown_0x0870
	ld a,[$DA46]
	jr Unknown_0x089D

Unknown_0x0887:
	ld [$FF00+$9A],a
	ld d,a
	ld e,$01
	ld a,[de]
	ld [$DA49],a
	ld e,$22
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	call Unknown_0x0620
	ld a,[$DA49]

Unknown_0x089D:
	or a
	jr nz,Unknown_0x0887
	ret

Unknown_0x08A1:
	ld l,$19
	ld a,$24
	ld [$FF00+$9B],a
	ld e,a

Unknown_0x08A8:
	ld a,[hli]
	ld b,a
	and $A0
	jr nz,Unknown_0x08B9
	bit 6,b
	jr nz,Unknown_0x08DE
	ld d,h
	ld a,[de]
	or a
	jr z,Unknown_0x08C6
	dec a
	ld [de],a

Unknown_0x08B9:
	inc l
	inc l

Unknown_0x08BB:
	ld a,[$FF00+$9B]
	cp $26
	ret nc
	inc a
	ld [$FF00+$9B],a
	ld e,a
	jr Unknown_0x08A8

Unknown_0x08C6:
	ld a,b
	call Unknown_0x05DD
	ld a,[hli]
	ld b,a
	ld c,[hl]
	push hl

Unknown_0x08CE:
	ld a,[bc]
	inc bc
	add a,a
	ld h,$3F
	ld l,a
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

Unknown_0x08D8:
	pop hl
	ld [hl],c
	dec l
	ld [hl],b
	jr Unknown_0x08B9

Unknown_0x08DE:
	ld a,b
	and $1F
	call Unknown_0x05DD
	ld a,[hli]
	ld b,a
	ld a,[hli]
	push hl
	ld d,h
	ld l,a
	ld h,b
	call Unknown_0x0620
	pop hl
	jr Unknown_0x08BB
	ld h,d
	push de
	call Unknown_0x0BBA
	pop de
	jp Unknown_0x08D8
	ld a,[$FF00+$9B]
	sub $24
	ld l,a
	add a,a
	add a,l
	add a,$19
	ld l,a
	ld h,d
	set 7,[hl]
	jp Unknown_0x08D8
	ld a,[$FF00+$9B]
	ld e,a
	ld a,[bc]
	inc bc
	dec a
	ld [de],a
	jp Unknown_0x08D8
	ld h,d
	ld a,[$FF00+$9B]
	ld l,a
	ld e,$27
	ld a,[de]
	dec a
	ld [hl],a
	jp Unknown_0x08D8
	ld a,[bc]
	inc bc
	ld e,$15
	ld [de],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld e,$15
	ld [de],a
	ld a,[$FF00+$9B]
	ld e,a
	ld a,[bc]
	inc bc
	dec a
	ld [de],a
	jp Unknown_0x08D8
	ld a,[bc]
	inc bc
	ld e,a
	ld a,[bc]
	inc bc
	ld [de],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld e,a
	ld a,[de]
	ld e,$27
	ld [de],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld e,a
	ld h,d
	ld l,$27
	ld a,[hl]
	ld [de],a
	jp Unknown_0x08CE
	ld e,$25
	xor a
	ld [de],a
	ld h,d
	ld l,$1E
	ld a,[bc]
	inc bc
	ld [hld],a
	ld a,[bc]
	inc bc
	ld [hld],a
	ld a,[bc]
	inc bc
	ld [hl],a
	jp Unknown_0x08CE

UnknownData_0x0968:
INCBIN "baserom.gb", $0968, $096C - $0968
	ld h,d
	ld h,d
	ld l,$21
	ld a,[bc]
	inc bc
	ld [hld],a
	ld a,[bc]
	inc bc
	ld [hld],a
	ld a,[bc]
	inc bc
	ld [hl],a
	jp Unknown_0x08CE
	ld e,$22
	ld a,[bc]
	inc bc
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	ld [de],a
	jp Unknown_0x08CE
	ld h,d
	ld l,$18
	ld a,[bc]
	inc bc
	ld [hld],a
	ld a,[bc]
	inc bc
	ld [hld],a
	ld a,[bc]
	inc bc
	ld [hl],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld e,a
	ld a,[bc]
	ld b,a
	ld c,e
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld l,a
	ld a,[bc]
	inc bc
	ld h,a
	ld a,[$FF00+$9B]
	sub $24
	ld e,a
	add a,a
	add a,e
	add a,$19
	ld e,a
	ld a,[bc]
	ld [de],a
	call Unknown_0x05DD
	ld b,h
	ld c,l
	jp Unknown_0x08CE
	ld e,$27
	ld a,[de]
	or a
	jr nz,Unknown_0x09C9
	ld a,[bc]
	inc bc
	ld e,a
	ld a,[bc]
	ld b,a
	ld c,e
	jp Unknown_0x08CE

Unknown_0x09C9:
	inc bc
	inc bc
	jp Unknown_0x08CE
	ld e,$27
	ld a,[de]
	or a
	jr z,Unknown_0x09DD
	ld a,[bc]
	inc bc
	ld e,a
	ld a,[bc]
	ld b,a
	ld c,e
	jp Unknown_0x08CE

Unknown_0x09DD:
	inc bc
	inc bc
	jp Unknown_0x08CE
	ld h,b
	ld l,c
	ld e,$27
	ld a,[de]
	cp [hl]
	jr nc,Unknown_0x09F1
	inc hl
	ld a,[hli]
	ld c,a
	ld b,[hl]
	jp Unknown_0x08CE

Unknown_0x09F1:
	inc bc
	inc bc
	inc bc
	jp Unknown_0x08CE
	ld h,b
	ld l,c
	ld e,$27
	ld a,[de]
	cp [hl]
	jr c,Unknown_0x0A06
	inc hl
	ld a,[hli]
	ld c,a
	ld b,[hl]
	jp Unknown_0x08CE

Unknown_0x0A06:
	inc bc
	inc bc
	inc bc
	jp Unknown_0x08CE
	ld e,$0D
	ld a,[bc]
	inc bc
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	ld [de],a
	jp Unknown_0x08CE
	ld e,$0F
	ld a,[bc]
	inc bc
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	ld [de],a
	jp Unknown_0x08CE
	xor a
	ld h,d
	ld l,$0D
	ld [hli],a
	ld [hl],a
	ld l,$0F
	ld [hli],a
	ld [hl],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld e,$11
	ld [de],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld e,$12
	ld [de],a
	jp Unknown_0x08CE
	ld a,[bc]
	ld e,a
	inc bc
	ld h,d
	ld l,$28
	ld a,[hl]
	dec a
	ld l,a
	ld [hl],b
	dec l
	ld [hl],c
	dec l
	ld [hl],e
	ld e,$28
	ld a,l
	ld [de],a
	jp Unknown_0x08CE
	ld h,d
	ld l,$28
	ld a,[hl]
	ld l,a
	dec [hl]
	jr z,Unknown_0x0A65
	inc l
	ld c,[hl]
	inc l
	ld b,[hl]
	jp Unknown_0x08CE

Unknown_0x0A65:
	inc l
	inc l
	inc l
	ld e,$28
	ld a,l
	ld [de],a
	jp Unknown_0x08CE
	ld h,d
	ld l,$28
	ld a,[hl]
	dec a
	ld l,a
	ld a,[bc]
	inc bc
	ld e,a
	ld a,[bc]
	inc bc
	ld [hl],b
	dec l
	ld [hl],c
	ld b,a
	ld c,e
	ld e,$28
	ld a,l
	ld [de],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld l,a
	ld a,[bc]
	inc bc
	ld h,a
	push hl
	ld a,[$FF00+$9B]
	sub $24
	ld e,a
	add a,a
	add a,e
	add a,$19
	ld e,a
	ld a,[de]
	ld [$FF00+$84],a
	ld a,[bc]
	inc bc
	ld [de],a
	call Unknown_0x05DD
	ld h,d
	ld l,$28
	ld a,[hl]
	dec a
	ld l,a
	ld a,[$FF00+$84]
	ld [hld],a
	ld [hl],b
	dec l
	ld [hl],c
	pop bc
	ld e,$28
	ld a,l
	ld [de],a
	jp Unknown_0x08CE
	ld h,d
	ld l,$28
	ld a,[hl]
	ld l,a
	ld c,[hl]
	inc l
	ld b,[hl]
	inc l
	ld e,$28
	ld a,l
	ld [de],a
	jp Unknown_0x08CE
	ld h,d
	ld l,$28
	ld a,[hl]
	ld l,a
	ld c,[hl]
	inc l
	ld b,[hl]
	inc l
	ld a,[$FF00+$9B]
	sub $24
	ld e,a
	add a,a
	add a,e
	add a,$19
	ld e,a
	ld a,[hli]
	ld [de],a
	call Unknown_0x05DD
	ld e,$28
	ld a,l
	ld [de],a
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld l,a
	ld a,[bc]
	inc bc
	ld h,a
	call Unknown_0x0620
	jp Unknown_0x08CE
	ld a,[bc]
	inc bc
	ld l,a
	ld a,[bc]
	inc bc
	ld h,a
	call Unknown_0x0620
	ld a,[$FF00+$9B]
	ld e,a
	ld a,[de]
	dec a
	ld [de],a
	jp Unknown_0x08D8
	call Unknown_0x1099
	jp Unknown_0x08CE
	call Unknown_0x10B6
	jp Unknown_0x08CE
	call Unknown_0x1018
	jp Unknown_0x08CE
	call Unknown_0x1EC0
	jp Unknown_0x08CE
	call Unknown_0x1011
	jp Unknown_0x08CE
	ld h,b
	ld l,c
	ld e,$27
	ld a,[de]
	cp [hl]
	jr nc,Unknown_0x0B33
	inc hl
	rlca
	ld c,a
	ld b,$00
	add hl,bc
	ld a,[hli]
	ld c,a
	ld b,[hl]
	jp Unknown_0x08CE

Unknown_0x0B33:
	ld a,[hli]
	rlca
	ld c,a
	ld b,$00
	add hl,bc
	ld b,h
	ld c,l
	jp Unknown_0x08CE
	push bc
	ld a,[bc]
	inc bc
	rlca
	add a,c
	ld c,a
	jr nc,Unknown_0x0B47
	inc b

Unknown_0x0B47:
	ld h,d
	ld l,$28
	ld a,[hl]
	dec a
	ld l,a
	ld [hl],b
	dec l
	ld [hl],c
	ld e,$28
	ld a,l
	ld [de],a
	pop bc
	ld h,b
	ld l,c
	ld e,$27
	ld a,[de]
	cp [hl]
	jr nc,Unknown_0x0B69
	inc hl
	rlca
	ld c,a
	ld b,$00
	add hl,bc
	ld a,[hli]
	ld c,a
	ld b,[hl]
	jp Unknown_0x08CE

Unknown_0x0B69:
	ld a,[hli]
	rlca
	ld c,a
	ld b,$00
	add hl,bc
	ld b,h
	ld c,l
	jp Unknown_0x08CE
	ld e,$03
	ld a,$80
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	ld [de],a
	jp Unknown_0x08CE
	ld e,$06
	ld a,$80
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	ld [de],a
	jp Unknown_0x08CE

Unknown_0x0B94:
	ld a,[$DA48]
	or a
	jr z,Unknown_0x0BA8
	ld h,a
	ld l,$01

Unknown_0x0B9D:
	cp b
	jr c,Unknown_0x0BA3
	cp c
	jr c,Unknown_0x0BAA

Unknown_0x0BA3:
	ld h,a
	ld a,[hl]
	or a
	jr nz,Unknown_0x0B9D

Unknown_0x0BA8:
	scf
	ret

Unknown_0x0BAA:
	cp h
	jr nz,Unknown_0x0BB3
	ld a,[hl]
	ld [$DA48],a
	and a
	ret

Unknown_0x0BB3:
	ld d,h
	ld e,l
	ld h,a
	ld a,[hl]
	ld [de],a
	and a
	ret

Unknown_0x0BBA:
	ld a,h
	cp $A0
	ret c
	cp $B3
	ret nc
	ld l,$00
	ld a,[hl]
	inc a
	ret z
	ld [hl],$FF
	call Unknown_0x0C2A
	ld l,$01
	ld a,[hl]
	or a
	ld l,$02
	jr nz,Unknown_0x0BD8
	ld de,$DA47
	jr Unknown_0x0BDA

Unknown_0x0BD8:
	ld d,a
	ld e,l

Unknown_0x0BDA:
	ld a,[hl]
	ld [de],a
	or a
	ld l,$01
	jr nz,Unknown_0x0BE6
	ld de,$DA46
	jr Unknown_0x0BE8

Unknown_0x0BE6:
	ld d,a
	ld e,l

Unknown_0x0BE8:
	ld a,[hl]
	ld [de],a
	ld a,[$DA49]
	cp h
	jr nz,Unknown_0x0BF4
	ld a,[hl]
	ld [$DA49],a

Unknown_0x0BF4:
	ld de,$DA48
	ld a,[de]
	ld l,$01
	ld [hl],a
	ld a,h
	ld [de],a
	ld l,$49
	ld e,[hl]
	ld d,$BB
	xor a
	ld [de],a
	ld d,h
	ret

Unknown_0x0C06:
	ld de,$DA47
	ld a,[de]
	ld l,$02
	ld [hl],a
	ld l,$01
	ld [hl],$00
	or a
	jr nz,Unknown_0x0C1A
	ld a,h
	ld [de],a
	ld [$DA46],a
	ret

Unknown_0x0C1A:
	ld b,h
	ld h,a
	ld [hl],b
	ld a,b
	ld [de],a
	ld h,a
	ld a,[$DA49]
	or a
	ret nz
	ld a,h
	ld [$DA49],a
	ret

Unknown_0x0C2A:
	ld l,$1C
	ld [hl],$80
	ld l,$1F
	ld [hl],$80
	ld l,$25
	ld [hl],$00
	inc l
	ld [hl],$00
	ret

Unknown_0x0C3A:
	call Unknown_0x0C48
	push hl
	ld hl,$747D
	ld a,$02
	call Unknown_0x05CF
	pop hl
	ret

Unknown_0x0C48:
	xor a
	ld [$FF00+$B4],a
	ld hl,$A06C
	res 0,[hl]
	ld a,[$A054]
	cp $80
	jr c,Unknown_0x0C5C
	ld a,$60
	ld [$A054],a

Unknown_0x0C5C:
	ld h,$A0
	jp Unknown_0x0849

Unknown_0x0C61:
	ld h,d
	ld l,$03
	ld de,$DA4B
	ld bc,$009B
	call Unknown_0x0621
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x0C71:
	ld e,$03
	ld hl,$DA4B
	ld bc,$009B
	call Unknown_0x0621
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x0C80:
	ld e,$11
	ld a,[de]

Unknown_0x0C83:
	ld e,$0D
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ret

Unknown_0x0C91:
	ld e,$12
	ld a,[de]

Unknown_0x0C94:
	ld e,$0F
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ret

Unknown_0x0CA2:
	ld h,d
	ld l,$0E
	ld a,[hld]
	rla
	jr c,Unknown_0x0CB7
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	jr c,Unknown_0x0CB7
	ld e,$0C
	jp Unknown_0x0D04

Unknown_0x0CB4:
	ld h,d
	ld l,$0D

Unknown_0x0CB7:
	ld a,[hl]
	add a,e
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hld],a
	rla
	ret c
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	ret c
	ld a,b
	ld [hld],a
	ld [hl],c
	ret

Unknown_0x0CC9:
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x0CD3:
	ld h,d
	ld l,$0E
	ld a,[hld]
	rla
	jr nc,Unknown_0x0CF2
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	jr nc,Unknown_0x0CF2
	ld e,$0C
	jp Unknown_0x0D04

Unknown_0x0CE5:
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x0CEF:
	ld h,d
	ld l,$0D

Unknown_0x0CF2:
	ld a,[hl]
	sub e
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hld],a
	rla
	ret nc
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	ret nc
	ld a,b
	ld [hld],a
	ld [hl],c
	ret

Unknown_0x0D04:
	ld h,d
	ld l,$0E
	ld a,[hld]
	rla
	jr c,Unknown_0x0D17
	ld a,[hl]
	sub e
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hl],a
	ret nc
	xor a
	ld [hld],a
	ld [hl],a
	ret

Unknown_0x0D17:
	ld a,[hl]
	add a,e
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hl],a
	ret nc
	xor a
	ld [hld],a
	ld [hl],a
	ret

Unknown_0x0D23:
	ld h,d
	ld l,$10
	ld a,[hld]
	rla
	jr c,Unknown_0x0D38
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	jr c,Unknown_0x0D38
	ld e,$0C
	jp Unknown_0x0D85

Unknown_0x0D35:
	ld h,d
	ld l,$0F

Unknown_0x0D38:
	ld a,[hl]
	add a,e
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hld],a
	rla
	ret c
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	ret c
	ld a,b
	ld [hld],a
	ld [hl],c
	ret

UnknownData_0x0D4A:
INCBIN "baserom.gb", $0D4A, $0D54 - $0D4A

Unknown_0x0D54:
	ld h,d
	ld l,$10
	ld a,[hld]
	rla
	jr nc,Unknown_0x0D73
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	jr nc,Unknown_0x0D73
	ld e,$0C
	jp Unknown_0x0D85

Unknown_0x0D66:
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x0D70:
	ld h,d
	ld l,$0F

Unknown_0x0D73:
	ld a,[hl]
	sub e
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hld],a
	rla
	ret nc
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	ret nc
	ld a,b
	ld [hld],a
	ld [hl],c
	ret

Unknown_0x0D85:
	ld h,d
	ld l,$10
	ld a,[hld]
	rla
	jr c,Unknown_0x0D98
	ld a,[hl]
	sub e
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hl],a
	ret nc
	xor a
	ld [hld],a
	ld [hl],a
	ret

Unknown_0x0D98:
	ld a,[hl]
	add a,e
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hl],a
	ret nc
	xor a
	ld [hld],a
	ld [hl],a
	ret

Unknown_0x0DA4:
	ld e,$0D
	ld h,d
	ld l,$03

Unknown_0x0DA9:
	ld a,[de]
	add a,[hl]
	ld [hli],a
	inc e
	ld a,[de]
	ld b,$00
	bit 7,a
	jr z,Unknown_0x0DB5
	dec b

Unknown_0x0DB5:
	adc a,[hl]
	ld [hli],a
	inc e
	ld a,b
	adc a,[hl]
	ld [hli],a
	ld a,[de]
	add a,[hl]
	ld [hli],a
	inc e
	ld a,[de]
	ld b,$00
	bit 7,a
	jr z,Unknown_0x0DC7
	dec b

Unknown_0x0DC7:
	adc a,[hl]
	ld [hli],a
	inc e
	ld a,b
	adc a,[hl]
	ld [hl],a
	ret
	ld a,[$A06C]
	rra
	jr nc,Unknown_0x0DDE
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1F40A
	jr Unknown_0x0DF0

Unknown_0x0DDE:
	call Unknown_0x0E2C
	ld a,[$A05D]
	cp $00
	jr nz,Unknown_0x0DF0
	ld a,$0B
	call Unknown_0x05DD
	call Unknown_0x2F85B

Unknown_0x0DF0:
	jp Unknown_0x0F22
	call Unknown_0x3467

Unknown_0x0DF6:
	call Unknown_0x0E2C
	jp Unknown_0x0F22
	call Unknown_0x347D
	call Unknown_0x0E4B
	jp Unknown_0x0F22
	call Unknown_0x0F01
	jp Unknown_0x0F22
	call Unknown_0x0E9D
	jp Unknown_0x0F22
	ld a,$08
	call Unknown_0x05DD
	call Unknown_0x217AC
	ret
	ld a,$08
	call Unknown_0x05DD
	call Unknown_0x213CB
	ret
	ld a,$08
	call Unknown_0x05DD
	call Unknown_0x216A6
	ret

Unknown_0x0E2C:
	ld e,$04
	ld hl,$DB51
	ld b,d
	ld c,$09

Unknown_0x0E34:
	ld a,[de]
	sub [hl]
	ld [bc],a
	inc e
	inc hl
	inc c
	ld a,[de]
	sbc a,[hl]
	ld [bc],a
	inc e
	inc e
	inc hl
	inc c
	ld a,[de]
	sub [hl]
	ld [bc],a
	inc e
	inc hl
	inc c
	ld a,[de]
	sbc a,[hl]
	ld [bc],a
	ret

Unknown_0x0E4B:
	ld e,$04
	ld hl,$DB51
	ld b,d
	ld c,$09
	ld a,[de]
	sub [hl]
	ld [bc],a
	ld [$FF00+$84],a
	inc e
	inc hl
	inc c
	ld a,[de]
	sbc a,[hl]
	ld [bc],a
	inc a
	cp $01
	ld a,[$FF00+$84]
	jr z,Unknown_0x0E6D
	jr nc,Unknown_0x0E94
	cp $E0
	jr nc,Unknown_0x0E71
	jr Unknown_0x0E94

Unknown_0x0E6D:
	cp $C0
	jr nc,Unknown_0x0E94

Unknown_0x0E71:
	inc e
	inc e
	inc hl
	inc c
	ld a,[de]
	sub [hl]
	ld [bc],a
	ld [$FF00+$84],a
	inc e
	inc hl
	inc c
	ld a,[de]
	sbc a,[hl]
	ld [bc],a
	inc a
	cp $01
	ld a,[$FF00+$84]
	jr z,Unknown_0x0E8F
	jr nc,Unknown_0x0E94
	cp $E0
	jr nc,Unknown_0x0E93
	jr Unknown_0x0E94

Unknown_0x0E8F:
	cp $A0
	jr nc,Unknown_0x0E94

Unknown_0x0E93:
	ret

Unknown_0x0E94:
	ld e,$15
	ld a,$FF
	ld [de],a
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x0E9D:
	ld e,$04
	ld hl,$DB51
	ld b,d
	ld c,$09
	ld a,[de]
	sub [hl]
	ld [bc],a
	ld [$FF00+$84],a
	inc e
	inc hl
	inc c
	ld a,[de]
	sbc a,[hl]
	ld [bc],a
	inc a
	cp $01
	ld a,[$FF00+$84]
	jr z,Unknown_0x0EBF
	jr nc,Unknown_0x0EE6
	cp $E0
	jr nc,Unknown_0x0EC3
	jr Unknown_0x0EE6

Unknown_0x0EBF:
	cp $C0
	jr nc,Unknown_0x0EE6

Unknown_0x0EC3:
	inc e
	inc e
	inc hl
	inc c
	ld a,[de]
	sub [hl]
	ld [bc],a
	ld [$FF00+$84],a
	inc e
	inc hl
	inc c
	ld a,[de]
	sbc a,[hl]
	ld [bc],a
	inc a
	cp $01
	ld a,[$FF00+$84]
	jr z,Unknown_0x0EE1
	jr nc,Unknown_0x0EE6
	cp $E0
	jr nc,Unknown_0x0EE5
	jr Unknown_0x0EE6

Unknown_0x0EE1:
	cp $A0
	jr nc,Unknown_0x0EE6

Unknown_0x0EE5:
	ret

Unknown_0x0EE6:
	ld e,$15
	ld a,$FF
	ld [de],a
	ld h,d
	push de
	call Unknown_0x0BBA
	pop de
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$15
	ld a,$FF
	ld [hl],a
	call Unknown_0x0BBA
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x0F01:
	ld e,$48
	ld a,[de]
	ld h,a
	ld e,$04
	ld l,$09
	ld b,d
	ld c,l
	ld a,[de]
	add a,[hl]
	ld [bc],a
	inc e
	inc l
	inc c
	ld a,[de]
	adc a,[hl]
	ld [bc],a
	inc e
	inc e
	inc l
	inc c
	ld a,[de]
	add a,[hl]
	ld [bc],a
	inc e
	inc l
	inc c
	ld a,[de]
	adc a,[hl]
	ld [bc],a
	ret

Unknown_0x0F22:
	ld e,$15
	ld a,[de]
	cp $FF
	ret z
	add a,a
	ld c,a
	ld h,d
	ld l,$16
	ld a,[hli]
	call Unknown_0x05DD
	ld a,[hli]
	ld l,[hl]
	ld h,a
	ld b,$00
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld c,$93
	ld e,$45
	ld a,[de]
	ld [$FF00+c],a
	inc e
	inc c
	ld a,[de]
	ld [$FF00+c],a
	inc e
	inc c
	ld a,[de]
	ld [$FF00+c],a
	ld e,$0C
	push de
	call Unknown_0x051C
	pop de
	ret

Unknown_0x0F50:
	push de
	ld h,b
	ld l,c
	ld a,[hli]
	ld [$FF00+$84],a
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld c,a
	push hl
	call Unknown_0x0F67
	pop bc
	pop de
	ld a,h
	or a
	ret z
	ld l,$48
	ld [hl],d
	ret

Unknown_0x0F67:
	ld h,d
	ld l,$07
	ld a,[hli]
	ld e,a
	ld d,[hl]
	push de
	ld l,$04
	ld a,[hli]
	ld e,a
	ld d,[hl]
	push de
	jp Unknown_0x07CA

Unknown_0x0F77:
	ld a,[bc]
	inc bc
	ld e,a

Unknown_0x0F7A:
	push de
	push bc
	ld a,$01
	ld [$FF00+$84],a
	ld bc,$A2A5
	call Unknown_0x0F67
	pop bc
	pop de
	ld a,h
	or a
	ret z
	ld l,$48
	ld [hl],d
	ld l,$51
	ld [hl],e
	ret

Unknown_0x0F92:
	ld a,$01
	ld [$FF00+$84],a
	ld hl,$DB34
	ld a,$A5
	ld [hli],a
	ld [hl],$A2
	ld h,b
	ld l,c
	call Unknown_0x0FD0
	ret z
	ld l,$51
	ld a,[$FF00+$80]
	ld [hl],a
	ld e,$45
	ld l,e
	ld a,[de]
	ld [hl],a
	ret

Unknown_0x0FAF:
	ld a,$02
	ld [$FF00+$84],a
	ld hl,$DB34
	ld a,$A8
	ld [hli],a
	ld [hl],$A5
	ld h,b
	ld l,c
	call Unknown_0x0FD0
	ret z
	ld l,$5A
	ld a,[$FF00+$80]
	ld [hl],a
	ld e,$45
	ld l,e
	ld a,[de]
	ld [hl],a
	ld l,$4C
	ld [hl],$00
	ret

Unknown_0x0FD0:
	ld a,[hli]
	ld [$FF00+$80],a
	ld a,[hli]
	ld [$FF00+$85],a
	ld a,[hli]
	ld [$FF00+$86],a
	push de
	push hl
	ld h,d
	ld l,$45
	ld a,[hl]
	rla
	ld a,[$FF00+$85]
	jr nc,Unknown_0x0FE6
	cpl
	inc a

Unknown_0x0FE6:
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld l,$04
	ld a,[hli]
	add a,c
	ld c,a
	ld a,[hli]
	adc a,b
	ld b,a
	inc l
	ld a,[$FF00+$86]
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld a,[hli]
	add a,e
	ld e,a
	ld a,[hl]
	adc a,d
	ld d,a
	ld hl,$DB34
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call Unknown_0x07C6
	pop bc
	pop de
	ld a,h
	or a
	ret z
	ld l,$48
	ld [hl],d
	ret

Unknown_0x1011:
	call Unknown_0x0647
	ld e,$27
	ld [de],a
	ret

Unknown_0x1018:
	ld e,$45

Unknown_0x101A:
	ld a,[de]
	rla
	ld e,$0D
	ld a,[bc]
	inc bc
	jr c,Unknown_0x1026
	ld [de],a
	ld a,[bc]
	jr Unknown_0x102E

Unknown_0x1026:
	cpl
	add a,$01
	ld [de],a
	ld a,[bc]
	cpl
	adc a,$00

Unknown_0x102E:
	inc e
	inc bc
	ld [de],a
	ret
	ld e,$45
	ld a,[de]
	rla
	ld e,$11
	ld a,[bc]
	inc bc
	jr nc,Unknown_0x103E
	cpl
	inc a

Unknown_0x103E:
	ld [de],a
	ret
	ld e,$07
	jr Unknown_0x1046
	ld e,$04

Unknown_0x1046:
	ld h,b
	ld l,c
	ld a,[de]
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,[de]
	adc a,[hl]
	ld [de],a
	inc hl
	ld b,h
	ld c,l
	ret
	ld h,$A0
	ld a,h

Unknown_0x1057:
	cp d
	jr z,Unknown_0x1060
	call Unknown_0x0BBA
	ld a,[$FF00+$9A]
	ld d,a

Unknown_0x1060:
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x1057
	ret

Unknown_0x1067:
	ld h,$A0
	ld a,h

Unknown_0x106A:
	cp d
	jr z,Unknown_0x1079
	ld l,$19
	set 5,[hl]
	ld l,$1C
	set 5,[hl]
	ld l,$1F
	set 5,[hl]

Unknown_0x1079:
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x106A
	ret
	ld h,$A0
	ld a,h

Unknown_0x1083:
	cp d
	jr z,Unknown_0x1092
	ld l,$19
	res 5,[hl]
	ld l,$1C
	res 5,[hl]
	ld l,$1F
	res 5,[hl]

Unknown_0x1092:
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x1083
	ret

Unknown_0x1099:
	ld a,[bc]
	ld e,a
	inc bc
	push bc
	ld hl,Unknown_0x4299
	ld a,$1E
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x10AA:
	ld hl,Unknown_0x3C299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x10B6:
	ld a,[bc]

Unknown_0x10B7:
	ld e,a
	inc bc
	push bc
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret
	ld a,[bc]
	ld [$DB6F],a
	jr Unknown_0x10B7

UnknownData_0x10CD:
INCBIN "baserom.gb", $10CD, $10DE - $10CD

Unknown_0x10DE:
	ld a,$08
	call Unknown_0x05DD
	jp Unknown_0x20062
	ld e,$09
	ld hl,Unknown_0x602E
	ld a,$1E
	call Unknown_0x05CF
	call Unknown_0x1126
	call Unknown_0x1134
	ld hl,$5B28
	ld a,$07
	call Unknown_0x05CF
	ld hl,$DEDE
	set 2,[hl]
	set 1,[hl]
	set 3,[hl]
	set 5,[hl]
	set 6,[hl]
	ld a,[$A05B]
	inc a
	ld [$DEE0],a
	ld a,[$A071]
	or a
	jr z,Unknown_0x111D
	ld hl,$DEDF
	set 1,[hl]

Unknown_0x111D:
	ld a,$07
	ld [$FF00+$4B],a
	ld a,$80
	ld [$FF00+$4A],a
	ret

Unknown_0x1126:
	ld a,$0B
	call Unknown_0x05DD
	ld hl,Unknown_0x2E8A0
	ld de,$8000
	jp Unknown_0x0708

Unknown_0x1134:
	ld a,$0B
	call Unknown_0x05DD
	ld hl,Unknown_0x2F122
	ld de,$9630
	call Unknown_0x0708
	ld a,$0B
	call Unknown_0x05DD
	ld hl,Unknown_0x2F20F
	ld de,$8800
	call Unknown_0x0708
	ld a,$0B
	call Unknown_0x05DD
	ld hl,Unknown_0x2ED87
	ld de,$8600
	call Unknown_0x0708
	ret
	ld a,$07
	call Unknown_0x05DD
	jr Unknown_0x1196
	ld hl,$747D
	ld a,$02
	call Unknown_0x05CF
	ld a,[$A051]
	cp $0D
	jr nz,Unknown_0x1183
	ld a,$0B
	call Unknown_0x05DD
	ld hl,$6980
	ld de,$8000
	jp Unknown_0x0708

Unknown_0x1183:
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1F458
	call Unknown_0x1196
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1F472

Unknown_0x1196:
	ld a,[$DF11]
	ld h,$00
	ld l,a
	ld b,h
	ld c,l
	add hl,hl
	add hl,bc
	add hl,hl
	add hl,bc
	ld bc,$74BB
	add hl,bc
	ld a,[hli]
	ld e,a
	ld a,[hli]
	ld d,a
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld [$FF00+$84],a
	push bc
	ld a,[hli]
	ld c,a
	ld b,[hl]
	pop hl
	ld a,[$FF00+$84]
	call Unknown_0x05DD
	jp Unknown_0x0621
	xor a
	ld [$A082],a
	ld [$FF00+$A5],a
	ld [$FF00+$A6],a

Unknown_0x11C6:
	call Unknown_0x0496
	ld a,[$A06C]
	rra
	jr c,Unknown_0x11D4
	ld a,$FF
	ld [$A05D],a

Unknown_0x11D4:
	call Unknown_0x086B
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C259
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C3CB
	call Unknown_0x04AE
	ld hl,Unknown_0x1DB85
	ld a,$07
	call Unknown_0x05CF
	ld hl,Unknown_0x1DBD2
	ld a,$07
	call Unknown_0x05CF
	call Unknown_0x0343
	call Unknown_0x0357
	ld a,[$A082]
	or a
	jr nz,Unknown_0x1219
	ld a,[$DA3A]
	cp $02
	jr nz,Unknown_0x1219
	ld a,[$DA3F]
	and $0B
	jr z,Unknown_0x1219
	ld a,$09
	ld [$A082],a

Unknown_0x1219:
	ld a,[$A082]
	or a
	jr z,Unknown_0x11C6
	ret
	call Unknown_0x1564
	ld bc,$000E
	add hl,bc
	ld a,[hld]
	ld b,a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	call Unknown_0x05DD
	ld de,$A004
	ld a,[de]
	and $F0
	swap a
	ld b,a
	inc e
	ld a,[de]
	swap a
	or b
	ld b,a
	ld e,$07
	ld a,[de]
	and $F0
	swap a
	ld c,a
	inc e
	ld a,[de]
	swap a
	or c
	ld c,a
	ld de,$0003

Unknown_0x1250:
	ld a,[hli]
	cp b
	jr nz,Unknown_0x125A
	ld a,[hli]
	cp c
	jr nz,Unknown_0x125B
	jr Unknown_0x1267

Unknown_0x125A:
	inc hl

Unknown_0x125B:
	ld a,[hli]
	cp $20
	jr nc,Unknown_0x125B
	cp $01
	jr z,Unknown_0x1250
	add hl,de
	jr Unknown_0x1250

Unknown_0x1267:
	push hl
	ld a,[hli]
	cp $60
	ld e,$04
	jr nz,Unknown_0x1279
	ld hl,$4276
	ld a,$1A
	call Unknown_0x05CF
	jr Unknown_0x1281

Unknown_0x1279:
	ld hl,Unknown_0x20280
	ld a,$1A
	call Unknown_0x05CF

Unknown_0x1281:
	call Unknown_0x0437
	pop hl
	ret
	call Unknown_0x1564

Unknown_0x1289:
	ld a,[hli]
	ld [$DB3D],a
	ld c,a
	ld a,[hli]
	ld [$DB3E],a
	push hl
	ld b,a
	ld hl,$CD2D
	ld a,$B3
	jr Unknown_0x129C

Unknown_0x129B:
	add a,c

Unknown_0x129C:
	ld [hli],a
	dec b
	jr nz,Unknown_0x129B
	sla c
	ld a,[$DB3E]
	ld b,a
	ld hl,$CD35
	ld a,$3D
	jr Unknown_0x12AE

Unknown_0x12AD:
	add a,c

Unknown_0x12AE:
	ld [hli],a
	dec b
	jr nz,Unknown_0x12AD
	pop hl
	ld c,$04
	ld de,$DB45

Unknown_0x12B8:
	ld a,[hli]
	swap a
	ld b,a
	and $F0
	ld [de],a
	inc de
	ld a,b
	and $0F
	ld [de],a
	inc de
	dec c
	jr nz,Unknown_0x12B8
	push hl
	ld hl,$DB45
	ld de,$DB3F
	ld a,[hli]
	add a,$08
	ld [de],a
	inc de
	ld a,[hli]
	adc a,$00
	ld [de],a
	inc de
	ld a,[hli]
	add a,$08
	ld [de],a
	inc de
	ld a,[hli]
	adc a,$00
	ld [de],a
	inc de
	ld a,[hli]
	add a,$98
	ld [de],a
	inc de
	ld a,[hl]
	adc a,$00
	ld [de],a
	pop hl
	push hl
	ld bc,$000A
	add hl,bc
	ld de,$B300
	call Unknown_0x0708
	pop hl
	inc hl
	inc hl
	push hl
	ld a,[hld]
	ld b,a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	call Unknown_0x05DD
	ld bc,$0003
	add hl,bc
	push hl
	ld a,[hli]
	ld [$DB5C],a
	ld de,$CF00
	call Unknown_0x0708
	ld c,$05
	ld hl,$CF00
	ld de,$C500

Unknown_0x131C:
	ld a,[$DB5C]
	ld b,a

Unknown_0x1320:
	ld a,[hli]
	ld [de],a
	inc e
	dec b
	jr nz,Unknown_0x1320
	ld e,$00
	inc d
	dec c
	jr nz,Unknown_0x131C
	pop hl
	dec hl
	ld a,[hld]
	ld b,a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	ld [$DB5A],a
	call Unknown_0x05DD
	ld a,[hli]
	cpl
	inc a
	swap a
	ld d,a
	and $F0
	ld e,a
	ld a,d
	or $F0
	ld d,a
	ld a,e
	add a,$30
	ld e,a
	ld a,d
	adc a,$96
	ld d,a
	and $0F
	or e
	swap a
	ld [$DB59],a
	ld a,l
	ld [$DB5B],a
	ld a,h
	ld [$DB5C],a
	call Unknown_0x0708
	ld a,[$DB58]
	call Unknown_0x05DD
	pop hl
	push hl
	ld bc,$0007
	add hl,bc
	bit 0,[hl]
	ld a,$86
	jr z,Unknown_0x1388
	ld a,$0C
	call Unknown_0x05DD
	ld hl,Unknown_0x307D1
	ld de,$8860
	call Unknown_0x0708
	ld a,d
	and $0F
	or e
	swap a

Unknown_0x1388:
	ld [$DB5E],a
	ld a,[$DB73]
	or a
	jr z,Unknown_0x13A3
	pop hl
	ld a,[$DB60]
	ld hl,$14D0
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x139E
	inc h

Unknown_0x139E:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jr Unknown_0x13AE

Unknown_0x13A3:
	ld a,[$DB58]
	call Unknown_0x05DD
	pop hl
	ld bc,$0003
	add hl,bc

Unknown_0x13AE:
	ld a,[hld]
	ld b,a
	ld [$DB5D],a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	call Unknown_0x05DD
	ld de,$DB7F

Unknown_0x13BD:
	ld a,[hli]
	cp $FF
	jp z,Unknown_0x1445
	ld [$FF00+$84],a
	push hl
	ld l,a
	ld h,$00
	ld [de],a
	inc de
	ld a,[$DB5E]
	ld [de],a
	inc de
	add hl,hl
	ld b,h
	ld c,l
	add hl,hl
	add hl,bc
	ld bc,$5629
	add hl,bc
	ld a,$07
	call Unknown_0x05DD
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[hli]
	ld [de],a
	inc de
	ld a,[$FF00+$84]
	cp $13
	jr z,Unknown_0x143B
	cp $14
	jr z,Unknown_0x143B
	cp $15
	jr z,Unknown_0x143B
	cp $16
	jr z,Unknown_0x143B
	cp $1C
	jr z,Unknown_0x143B
	cp $1F
	jr z,Unknown_0x143B
	cp $3E
	jr z,Unknown_0x143B
	push de
	inc hl
	inc hl
	ld a,[hld]
	ld b,a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	call Unknown_0x05DD
	ld a,[$FF00+$84]
	cp $11
	jr nz,Unknown_0x141F
	ld de,$8D80
	call Unknown_0x0708
	jr Unknown_0x143A

Unknown_0x141F:
	ld a,[$DB5E]
	swap a
	ld d,a
	and $F0
	ld e,a
	ld a,d
	and $0F
	add a,$80
	ld d,a
	call Unknown_0x0708
	ld a,d
	and $0F
	or e
	swap a
	ld [$DB5E],a

Unknown_0x143A:
	pop de

Unknown_0x143B:
	pop hl
	ld a,[$DB5D]
	call Unknown_0x05DD
	jp Unknown_0x13BD

Unknown_0x1445:
	ld a,$FF
	ld [de],a
	ld b,$00
	ld de,$CD3D

Unknown_0x144D:
	ld a,[hli]
	cp $FF
	jr z,Unknown_0x145C
	ld [de],a
	ld c,a
	inc e
	ld a,b
	ld [de],a
	inc e
	add a,c
	ld b,a
	jr Unknown_0x144D

Unknown_0x145C:
	ld a,b
	ld [$DB5F],a
	ld c,$03
	ld de,$CA00

Unknown_0x1465:
	ld a,[$DB5F]
	ld b,a

Unknown_0x1469:
	ld a,[hli]
	ld [de],a
	inc e
	dec b
	jr nz,Unknown_0x1469
	ld e,$00
	inc d
	dec c
	jr nz,Unknown_0x1465
	ld hl,$BB00
	ld bc,$0100
	ld a,$00
	call Unknown_0x062F
	xor a
	ld hl,$DB4F
	ld [hli],a
	ld [hli],a
	ld de,$A004
	ld a,[de]
	inc e
	sub $50
	ld [hli],a
	ld a,[de]
	inc e
	sbc a,$00
	ld [hli],a
	inc e
	ld a,[de]
	inc e
	sub $40
	ld [hli],a
	ld a,[de]
	sbc a,$00
	ld [hl],a
	call Unknown_0x1513
	ld hl,$DB51
	ld a,[hli]
	and $F0
	sub $10
	ld [$DB55],a
	ld [$DB7D],a
	inc hl
	ld a,[hl]
	and $F0
	sub $10
	ld [$DB56],a
	ld [$DB7E],a
	ld hl,$CD56
	ld bc,$0018
	ld a,$00
	call Unknown_0x062F
	xor a
	ld [$DB72],a
	ld [$DB70],a
	ld [$DB71],a
	ret

UnknownData_0x14D0:
INCBIN "baserom.gb", $14D0, $14EE - $14D0
	ld a,[$DB5A]
	call Unknown_0x05DD
	ld a,[$DB59]
	bit 7,a
	ld b,$90
	jr z,Unknown_0x14FF
	ld b,$80

Unknown_0x14FF:
	swap a
	ld d,a
	and $F0
	ld e,a
	ld a,d
	and $0F
	add a,b
	ld d,a
	ld hl,$DB5B
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp Unknown_0x0708

Unknown_0x1513:
	ld hl,$DB45
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB51
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x1526
	bit 7,[hl]
	jr z,Unknown_0x1529

Unknown_0x1526:
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x1529:
	ld hl,$DB49
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB51
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x153B
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x153B:
	ld hl,$DB47
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x154E
	bit 7,[hl]
	jr z,Unknown_0x1551

Unknown_0x154E:
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x1551:
	ld hl,$DB4B
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x1563
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x1563:
	ret

Unknown_0x1564:
	ld a,$08
	call Unknown_0x05DD
	ld a,[$DB57]
	ld l,a
	ld h,$00
	ld b,h
	ld c,l
	add hl,hl
	add hl,bc
	ld bc,$511F
	add hl,bc
	ld a,[hld]
	ld b,a
	ld [$DB58],a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	call Unknown_0x05DD
	ret

Unknown_0x1584:
	xor a
	ld hl,$FF42
	ld [hli],a
	ld [hl],a
	ld hl,$DA00
	ld [hli],a
	ld [hl],a
	ld hl,$DB51
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ret

Unknown_0x1597:
	ld [$FF00+$80],a
	ld a,[$FF00+$A4]
	push af
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C37B
	pop af
	jp Unknown_0x05DD

Unknown_0x15A8:
	ld [$FF00+$84],a
	call Unknown_0x15E3
	ld a,[$FF00+$84]
	ld [hl],a

Unknown_0x15B0:
	call Unknown_0x15FC
	ld d,h
	ld e,l
	ld a,[$DA22]
	ld l,a
	ld a,[$DA28]
	ld h,a
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld a,[$FF00+$84]
	ld c,a
	ld b,$C5
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	ld a,l
	ld [$DA22],a
	ld a,[$DA28]
	ld hl,$DA23
	rra
	jr nc,Unknown_0x15E1
	ld hl,$DA24

Unknown_0x15E1:
	inc [hl]
	ret

Unknown_0x15E3:
	ld hl,$CD2D
	ld a,d
	add a,l
	ld l,a
	ld a,[hl]
	add a,b
	ld h,a
	ld [$FF00+$9D],a
	ld a,e
	and $F0
	ld l,a
	ld a,c
	swap a
	and $0F
	add a,l
	ld l,a
	ld [$FF00+$9C],a
	ret

Unknown_0x15FC:
	ld a,e
	ld h,$26
	rla
	rl h
	rla
	rl h
	and $C0
	ld l,a
	ld a,c
	rra
	rra
	rra
	and $1E
	add a,l
	ld l,a
	ret

Unknown_0x1611:
	ld [$FF00+$84],a
	ld hl,$DB62
	add a,l
	ld l,a
	jr nc,Unknown_0x161B
	inc h

Unknown_0x161B:
	ld e,[hl]
	ld a,[$FF00+$84]
	ld hl,$163E
	add a,l
	ld l,a
	jr nc,Unknown_0x1626
	inc h

Unknown_0x1626:
	ld a,[hl]
	or e
	inc a
	ret

Unknown_0x162A:
	ld [$FF00+$84],a
	ld a,e
	call Unknown_0x0663
	ld e,a
	ld a,[$FF00+$84]
	ld hl,$DB62
	add a,l
	ld l,a
	jr nc,Unknown_0x163B
	inc h

Unknown_0x163B:
	ld a,[hl]
	and e
	ret

UnknownData_0x163E:
INCBIN "baserom.gb", $163E, $1646 - $163E

Unknown_0x1646:
	ld a,[$DB3D]
	dec a
	cp b
	jr c,Unknown_0x165C
	ld a,[$DB3E]
	dec a
	cp d
	jr c,Unknown_0x165C
	call Unknown_0x15E3
	ld l,[hl]
	ld h,$C9
	ld a,[hl]
	ret

Unknown_0x165C:
	xor a
	ld hl,$FF9C
	ld [hli],a
	ld [hl],a
	ld a,$00
	ret

Unknown_0x1665:
	ld hl,$FF9C
	ld a,[hli]
	ld h,[hl]
	ld l,a
	or h
	jr z,Unknown_0x1684
	ld a,l
	sub $10
	ld l,a
	jr nc,Unknown_0x167F
	ld a,d
	or a
	jr z,Unknown_0x1684
	ld a,[$DB3D]
	cpl
	inc a
	add a,h
	ld h,a

Unknown_0x167F:
	ld l,[hl]
	ld h,$C9
	ld a,[hl]
	ret

Unknown_0x1684:
	ld a,$00
	ret

Unknown_0x1687:
	ld hl,$FF9C
	ld a,[hli]
	ld h,[hl]
	ld l,a
	or h
	jr z,Unknown_0x16A7
	ld a,l
	add a,$10
	ld l,a
	jr nc,Unknown_0x16A2
	ld a,[$DB3E]
	dec a
	cp d
	jr z,Unknown_0x16A7
	ld a,[$DB3D]
	add a,h
	ld h,a

Unknown_0x16A2:
	ld l,[hl]
	ld h,$C9
	ld a,[hl]
	ret

Unknown_0x16A7:
	ld a,$00
	ret

Unknown_0x16AA:
	ld hl,$FF9C
	ld a,[hli]
	ld h,[hl]
	ld l,a
	or h
	jr z,Unknown_0x16CA
	inc l
	ld a,l
	and $0F
	jr nz,Unknown_0x16C5
	ld a,[$DB3D]
	dec a
	cp b
	jr z,Unknown_0x16CA
	ld a,l
	sub $10
	ld l,a
	inc h

Unknown_0x16C5:
	ld l,[hl]
	ld h,$C9
	ld a,[hl]
	ret

Unknown_0x16CA:
	ld a,$00
	ret

Unknown_0x16CD:
	ld hl,$FF9C
	ld a,[hli]
	ld h,[hl]
	ld l,a
	or h
	jr z,Unknown_0x16EC
	dec l
	ld a,l
	and $0F
	cp $0F
	jr nz,Unknown_0x16E7
	ld a,b
	or a
	jr z,Unknown_0x16EC
	ld a,l
	add a,$10
	ld l,a
	dec h

Unknown_0x16E7:
	ld l,[hl]
	ld h,$C9
	ld a,[hl]
	ret

Unknown_0x16EC:
	ld a,$00
	ret

Unknown_0x16EF:
	call Unknown_0x1646
	and $07
	ld [$FF00+$9E],a
	cp $01
	jr z,Unknown_0x16FC
	and a
	ret

Unknown_0x16FC:
	call Unknown_0x16AA
	and $07
	cp $01
	jr c,Unknown_0x170B
	jr z,Unknown_0x1714
	cp $04
	jr nc,Unknown_0x1714

Unknown_0x170B:
	ld a,c
	and $0F
	ld l,a
	ld a,$10
	sub l
	scf
	ret

Unknown_0x1714:
	and a
	ret

Unknown_0x1716:
	call Unknown_0x1646
	and $07
	ld [$FF00+$9E],a
	ld hl,$172A
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1726
	inc h

Unknown_0x1726:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x172A:
INCBIN "baserom.gb", $172A, $173A - $172A
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	sub l
	scf
	ret
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	ld h,a
	ld a,$0F
	sub h
	sub l
	scf
	ret
	and a
	ret
	call Unknown_0x16AA
	and $07
	ld hl,$1766
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1762
	inc h

Unknown_0x1762:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x1766:
INCBIN "baserom.gb", $1766, $1798 - $1766
	ld a,c
	and $0F
	ld l,a
	ld a,$10
	sub l
	scf
	ret
	and a
	ret

Unknown_0x17A3:
	call Unknown_0x1646
	and $07
	ld [$FF00+$9E],a
	cp $01
	jr z,Unknown_0x17B0
	and a
	ret

Unknown_0x17B0:
	call Unknown_0x16CD
	and $07
	cp $01
	jr c,Unknown_0x17BF
	jr z,Unknown_0x17C5
	cp $04
	jr nc,Unknown_0x17C5

Unknown_0x17BF:
	ld a,c
	and $0F
	cpl
	scf
	ret

Unknown_0x17C5:
	and a
	ret

Unknown_0x17C7:
	call Unknown_0x1646
	and $07
	ld [$FF00+$9E],a
	ld hl,$17DB
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x17D7
	inc h

Unknown_0x17D7:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x17DB:
INCBIN "baserom.gb", $17DB, $17EB - $17DB
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	ld h,a
	ld a,$0F
	sub h
	sub l
	scf
	ret
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	sub l
	scf
	ret
	and a
	ret
	call Unknown_0x16CD
	and $07
	ld hl,$1817
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1813
	inc h

Unknown_0x1813:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x1817:
INCBIN "baserom.gb", $1817, $1827 - $1817
	ld a,$05
	ld [$FF00+$9E],a
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	cpl
	sub l
	scf
	ret
	ld a,$07
	ld [$FF00+$9E],a
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	sub $10
	sub l
	scf
	ret
	ld a,c
	and $0F
	cpl
	scf
	ret
	and a
	ret

Unknown_0x184E:
	call Unknown_0x1646
	ld [$FF00+$9F],a
	and $07
	ld [$FF00+$9E],a
	ld hl,$1864
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1860
	inc h

Unknown_0x1860:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x1864:
INCBIN "baserom.gb", $1864, $1874 - $1864
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	ld h,a
	ld a,$0F
	sub l
	sub h
	scf
	ret
	ld a,e
	and $0F
	ld h,a
	ld a,c
	and $0F
	sub h
	scf
	ret
	and a
	ret
	call Unknown_0x1665
	and $07
	ld hl,$18A0
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x189C
	inc h

Unknown_0x189C:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x18A0:
INCBIN "baserom.gb", $18A0, $18B0 - $18A0
	ld a,e
	and $0F
	cpl
	scf
	ret
	and a
	ret
	ld a,$04
	ld [$FF00+$9E],a
	ld a,e
	and $0F
	ld h,a
	ld a,c
	and $0F
	cpl
	sub h
	scf
	ret
	ld a,$05
	ld [$FF00+$9E],a
	ld a,e
	and $0F
	ld h,a
	ld a,c
	and $0F
	sub $10
	sub h
	scf
	ret

Unknown_0x18D7:
	call Unknown_0x1646
	and $07
	ld [$FF00+$9E],a
	ld hl,$18EB
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x18E7
	inc h

Unknown_0x18E7:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x18EB:
INCBIN "baserom.gb", $18EB, $18FB - $18EB
	ld a,e
	and $0F
	ld h,a
	ld a,c
	and $0F
	sub h
	scf
	ret
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	ld h,a
	ld a,$0F
	sub l
	sub h
	scf
	ret
	and a
	ret
	call Unknown_0x1687
	and $07
	ld hl,$1927
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1923
	inc h

Unknown_0x1923:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x1927:
INCBIN "baserom.gb", $1927, $1937 - $1927
	ld a,e
	and $0F
	ld h,a
	ld a,$10
	sub h
	scf
	ret
	and a
	ret
	ld a,$06
	ld [$FF00+$9E],a
	ld a,e
	and $0F
	ld h,a
	ld a,c
	and $0F
	add a,$10
	sub h
	scf
	ret
	ld a,$07
	ld [$FF00+$9E],a
	ld a,c
	and $0F
	ld l,a
	ld a,e
	and $0F
	ld h,a
	ld a,$1F
	sub l
	sub h
	scf
	ret

Unknown_0x1964:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAF
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a

Unknown_0x1973:
	call Unknown_0x1AF6
	ld hl,$FFAD
	jr c,Unknown_0x197D
	set 7,[hl]

Unknown_0x197D:
	ld a,[hl]
	ret

Unknown_0x197F:
	call Unknown_0x1AEA
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x19A5
	bit 7,[hl]
	jr nz,Unknown_0x1996
	call Unknown_0x184E
	jr nc,Unknown_0x199F
	rlca
	jr c,Unknown_0x19C6
	jr Unknown_0x199F

Unknown_0x1996:
	call Unknown_0x18D7
	jr nc,Unknown_0x199F
	dec a
	rlca
	jr nc,Unknown_0x19C6

Unknown_0x199F:
	ld a,[$FF00+$9E]
	cp $01
	jr z,Unknown_0x19C6

Unknown_0x19A5:
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$0E
	bit 7,[hl]
	jr nz,Unknown_0x19B8
	call Unknown_0x17C7
	jr nc,Unknown_0x19C1
	rlca
	jr c,Unknown_0x19C6
	jr Unknown_0x19C1

Unknown_0x19B8:
	call Unknown_0x1716
	jr nc,Unknown_0x19C1
	dec a
	rlca
	jr nc,Unknown_0x19C6

Unknown_0x19C1:
	ld a,[$FF00+$9A]
	ld d,a
	and a
	ret

Unknown_0x19C6:
	ld a,[$FF00+$9A]
	ld d,a
	scf
	ret

Unknown_0x19CB:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a

Unknown_0x19DD:
	call Unknown_0x1D8B
	jr nc,Unknown_0x19E7
	ld hl,$FFAD
	set 5,[hl]

Unknown_0x19E7:
	call Unknown_0x1B61
	ld hl,$FFAD
	jr c,Unknown_0x19F1
	set 7,[hl]

Unknown_0x19F1:
	ld a,[hl]
	ret

Unknown_0x19F3:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a

Unknown_0x1A05:
	call Unknown_0x1D8B
	jr nc,Unknown_0x1A0F
	ld hl,$FFAD
	set 5,[hl]

Unknown_0x1A0F:
	call Unknown_0x1B61
	ld hl,$FFAD
	jr c,Unknown_0x1A23
	set 7,[hl]
	call Unknown_0x1BDA
	ld hl,$FFAD
	jr c,Unknown_0x1A23
	set 4,[hl]

Unknown_0x1A23:
	ld a,[hl]
	ret

Unknown_0x1A25:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$0D
	ld [hli],a

Unknown_0x1A3A:
	call Unknown_0x1DC7
	jr nc,Unknown_0x1A44
	ld hl,$FFAD
	set 5,[hl]

Unknown_0x1A44:
	ld e,$10
	ld a,[de]
	rla
	jr nc,Unknown_0x1A56
	call Unknown_0x1C0A
	ld hl,$FFAD
	jr nc,Unknown_0x1A60
	set 6,[hl]
	jr Unknown_0x1A60

Unknown_0x1A56:
	call Unknown_0x1C88
	ld hl,$FFAD
	jr nc,Unknown_0x1A60
	set 7,[hl]

Unknown_0x1A60:
	ld a,[hl]
	ret

Unknown_0x1A62:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$0D
	ld [hli],a
	call Unknown_0x1DC7
	jr nc,Unknown_0x1A81
	ld hl,$FFAD
	set 5,[hl]

Unknown_0x1A81:
	call Unknown_0x1C0A
	jr nc,Unknown_0x1A8B
	ld hl,$FFAD
	set 6,[hl]

Unknown_0x1A8B:
	call Unknown_0x1C88
	ld hl,$FFAD
	jr nc,Unknown_0x1A95
	set 7,[hl]

Unknown_0x1A95:
	ld a,[hl]
	ret

Unknown_0x1A97:
	call Unknown_0x1AEA
	call Unknown_0x1646
	and $7F
	cp $08
	ld a,[$FF00+$9A]
	ld d,a
	ret
	push bc
	call Unknown_0x1AB3
	ld e,$27
	ld a,$00
	jr nz,Unknown_0x1AB0
	inc a

Unknown_0x1AB0:
	ld [de],a
	pop bc
	ret

Unknown_0x1AB3:
	call Unknown_0x1AEA
	call Unknown_0x1646
	and $C0
	cp $80
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x1AC1:
	ld h,d
	xor a
	ld b,a
	ld c,a
	bit 7,e
	jr z,Unknown_0x1ACA
	cpl

Unknown_0x1ACA:
	ld d,a
	call Unknown_0x1AD9
	call Unknown_0x1646
	and $C0
	cp $80
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x1AD9:
	ld l,$04
	ld a,[hli]
	add a,c
	ld c,a
	ld a,[hl]
	adc a,b
	ld b,a
	ld l,$07
	ld a,[hli]
	add a,e
	ld e,a
	ld a,[hl]
	adc a,d
	ld d,a
	ret

Unknown_0x1AEA:
	ld h,d
	ld l,$04
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld l,$07
	ld a,[hli]
	ld e,a
	ld d,[hl]
	ret

Unknown_0x1AF6:
	ld h,d
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr c,Unknown_0x1B4F
	bit 3,c
	jr z,Unknown_0x1B28
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0x1B45
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0x1B4F
	ld a,[$FF00+$B1]
	add a,l
	jr Unknown_0x1B4F

Unknown_0x1B28:
	ld a,[$FF00+$B0]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0x1B45
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0x1B4F
	ld a,[$FF00+$B0]
	cpl
	scf
	adc a,l
	jr Unknown_0x1B4F

Unknown_0x1B45:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,$00
	ld [de],a
	scf
	ret

Unknown_0x1B4F:
	inc a
	jr nz,Unknown_0x1B45
	ld a,[$FF00+$9A]
	ld d,a
	ld a,[$FF00+$9E]
	ld e,$4D
	ld [de],a
	ld a,[$FF00+$9F]
	ld e,$4E
	ld [de],a
	and a
	ret

Unknown_0x1B61:
	ld h,d
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr c,Unknown_0x1BBA
	bit 3,c
	jr z,Unknown_0x1B93
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0x1BB0
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0x1BBA
	ld a,[$FF00+$B1]
	add a,l
	jr Unknown_0x1BBA

Unknown_0x1B93:
	ld a,[$FF00+$B0]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0x1BB0
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0x1BBA
	ld a,[$FF00+$B0]
	cpl
	scf
	adc a,l
	jr Unknown_0x1BBA

Unknown_0x1BB0:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,$00
	ld [de],a
	scf
	ret

Unknown_0x1BBA:
	inc a
	ld l,a
	rlca
	sbc a,a
	ld b,a
	ld a,[$FF00+$9A]
	ld h,a
	ld a,l
	ld l,$06
	ld [hl],$80
	inc l
	add a,[hl]
	ld [hli],a
	ld a,b
	adc a,[hl]
	ld [hl],a
	ld a,[$FF00+$9E]
	ld l,$4D
	ld [hl],a
	ld a,[$FF00+$9F]
	ld l,$4E
	ld [hl],a
	ld d,h
	and a
	ret

Unknown_0x1BDA:
	ld h,d
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld l,$4D
	ld a,[hl]
	cp $04
	jr nc,Unknown_0x1BF1
	ld l,$0E
	bit 7,[hl]
	jr z,Unknown_0x1BF6
	jr Unknown_0x1BFA

Unknown_0x1BF1:
	ld b,$00
	ld c,b
	jr Unknown_0x1C00

Unknown_0x1BF6:
	ld a,[$FF00+$B1]
	jr Unknown_0x1BFC

Unknown_0x1BFA:
	ld a,[$FF00+$B0]

Unknown_0x1BFC:
	ld c,a
	rla
	sbc a,a
	ld b,a

Unknown_0x1C00:
	call Unknown_0x1AD9
	call Unknown_0x184E
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x1C0A:
	ld h,d
	ld a,[$FF00+$AE]
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x18D7
	jr nc,Unknown_0x1C24
	ld l,a
	dec a
	rlca
	jr nc,Unknown_0x1C76
	jp Unknown_0x1E6D

Unknown_0x1C24:
	bit 3,c
	jr z,Unknown_0x1C51
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x18D7
	jp nc,Unknown_0x1E6D
	ld l,a
	ld a,[$FF00+$9E]
	cp $07
	jp z,Unknown_0x1E6D
	cp $06
	ld a,l
	jr nz,Unknown_0x1C4A
	ld a,[$FF00+$B1]
	cpl
	scf
	adc a,l
	ld l,a

Unknown_0x1C4A:
	dec a
	rlca
	jr nc,Unknown_0x1C76
	jp Unknown_0x1E6D

Unknown_0x1C51:
	ld a,[$FF00+$B0]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x18D7
	jp nc,Unknown_0x1E6D
	ld l,a
	ld a,[$FF00+$9E]
	cp $06
	jp z,Unknown_0x1E6D
	cp $07
	ld a,l
	jr nz,Unknown_0x1C71
	ld a,[$FF00+$B0]
	add a,l
	ld l,a

Unknown_0x1C71:
	dec a
	rlca
	jp c,Unknown_0x1E6D

Unknown_0x1C76:
	ld a,[$FF00+$9A]
	ld h,a
	ld a,l
	ld l,$06
	ld [hl],$80
	inc l
	add a,[hl]
	ld [hli],a
	ld a,$00
	adc a,[hl]
	ld [hl],a
	ld d,h
	scf
	ret

Unknown_0x1C88:
	xor a
	ld [$DB7C],a
	ld h,d
	ld a,[$FF00+$AF]
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr nc,Unknown_0x1CAC
	ld l,a
	rlca
	jr c,Unknown_0x1D06
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,[$FF00+$9E]
	ld [de],a
	jr Unknown_0x1CFE

Unknown_0x1CAC:
	bit 3,c
	jr z,Unknown_0x1CD3
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0x1CF6
	ld l,a
	ld a,[$FF00+$9E]
	cp $05
	jr z,Unknown_0x1CF6
	cp $04
	ld a,l
	jr nz,Unknown_0x1CCE
	ld a,[$FF00+$B1]
	add a,l
	ld l,a

Unknown_0x1CCE:
	rlca
	jr c,Unknown_0x1D38
	jr Unknown_0x1CF6

Unknown_0x1CD3:
	ld a,[$FF00+$B0]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0x1CF6
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	jr z,Unknown_0x1CF6
	cp $05
	ld a,l
	jr nz,Unknown_0x1CF3
	ld a,[$FF00+$B0]
	cpl
	scf
	adc a,l
	ld l,a

Unknown_0x1CF3:
	rlca
	jr c,Unknown_0x1D38

Unknown_0x1CF6:
	ld a,[$FF00+$9A]
	ld h,a
	ld d,a
	ld l,$4D
	ld [hl],$00

Unknown_0x1CFE:
	ld e,$4F
	ld a,[$DB7C]
	ld [de],a
	and a
	ret

Unknown_0x1D06:
	ld a,$01
	ld [$DB7C],a
	ld a,[$FF00+$9A]
	ld h,a
	ld c,l
	ld l,$4D
	ld a,[hl]
	cp $04
	jr nc,Unknown_0x1D6E
	ld a,[$FF00+$9E]
	ld e,$00
	cp $04
	jr c,Unknown_0x1D5A
	ld l,$4F
	bit 0,[hl]
	jr nz,Unknown_0x1D3C
	ld l,$06
	ld b,[hl]
	ld l,$0F
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF
	bit 7,a
	jr nz,Unknown_0x1D3C
	add a,c
	jr nc,Unknown_0x1D3C
	jr Unknown_0x1D6E

Unknown_0x1D38:
	ld a,[$FF00+$9A]
	ld h,a
	ld c,l

Unknown_0x1D3C:
	ld a,[$FF00+$9E]
	cp $04
	ld e,$00
	jr c,Unknown_0x1D5A
	ld l,$03
	ld b,[hl]
	ld l,$0D
	ld a,[hli]
	jr z,Unknown_0x1D54
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$00
	cpl
	jr Unknown_0x1D59

Unknown_0x1D54:
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF

Unknown_0x1D59:
	ld e,a

Unknown_0x1D5A:
	ld l,$06
	ld b,[hl]
	ld l,$0F
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF
	add a,e
	bit 7,a
	jr nz,Unknown_0x1CF6
	add a,c
	jp nc,Unknown_0x1CF6

Unknown_0x1D6E:
	ld l,$06
	ld [hl],$80
	inc l
	ld a,c
	add a,[hl]
	ld [hli],a
	ld a,$FF
	adc a,[hl]
	ld [hl],a
	ld a,[$FF00+$9E]
	ld l,$4D
	ld [hl],a
	ld a,[$FF00+$9F]
	ld l,$4E
	ld [hl],a
	ld l,$4F
	ld [hl],$00
	ld d,h
	scf
	ret

Unknown_0x1D8B:
	ld h,d
	ld l,$0E
	ld a,[$FF00+$AE]
	ld e,a
	rla
	sbc a,a
	ld d,a
	bit 7,[hl]

Unknown_0x1D96:
	jr nz,Unknown_0x1DAF
	ld a,[$FF00+$B1]
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x17A3
	jp nc,Unknown_0x1E6D
	ld l,a
	rlca
	jp c,Unknown_0x1E2A
	jp Unknown_0x1E6D

Unknown_0x1DAF:
	ld a,[$FF00+$B0]
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x16EF
	jp nc,Unknown_0x1E6D
	ld l,a
	dec a
	rlca
	jp nc,Unknown_0x1E4C
	jp Unknown_0x1E6D

Unknown_0x1DC7:
	ld h,d
	ld l,$0E
	ld a,[$FF00+$AE]
	ld e,a
	rla
	sbc a,a
	ld d,a
	bit 7,[hl]
	jr nz,Unknown_0x1DFE
	ld a,[$FF00+$B1]
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x17A3
	jr nc,Unknown_0x1DE7
	ld l,a
	rlca
	jp c,Unknown_0x1E2A

Unknown_0x1DE7:
	ld a,[$FF00+$B2]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x17A3
	jp nc,Unknown_0x1E6D
	ld l,a
	rlca
	jp c,Unknown_0x1E2A
	jp Unknown_0x1E6D

Unknown_0x1DFE:
	ld a,[$FF00+$B0]
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x16EF
	jr nc,Unknown_0x1E12
	ld l,a
	dec a
	rlca
	jp nc,Unknown_0x1E4C

Unknown_0x1E12:
	ld a,[$FF00+$B2]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x16EF
	jp nc,Unknown_0x1E6D
	ld l,a
	dec a
	rlca
	jp nc,Unknown_0x1E4C
	jp Unknown_0x1E6D

Unknown_0x1E2A:
	ld c,l
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$03
	ld b,[hl]
	ld l,$0D
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF
	add a,c
	jp nc,Unknown_0x1E6D
	ld l,$03
	ld [hl],$80
	inc l
	ld a,c
	add a,[hl]
	ld [hli],a
	ld a,$FF
	adc a,[hl]
	ld [hl],a
	ld d,h
	scf
	ret

Unknown_0x1E4C:
	ld c,l
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$03
	ld b,[hl]
	ld l,$0D
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$00
	add a,c
	jr c,Unknown_0x1E6D
	ld l,$03
	ld [hl],$80
	inc l
	ld a,c
	add a,[hl]
	ld [hli],a
	ld a,$00
	adc a,[hl]
	ld [hl],a
	ld d,h
	scf
	ret

Unknown_0x1E6D:
	ld a,[$FF00+$9A]
	ld d,a
	and a
	ret
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc hl
	ld a,[de]
	sbc a,[hl]
	ld e,$0A
	ld [de],a
	dec e
	ld a,c
	ld [de],a
	ld e,$45
	ld a,[de]
	rlca
	ld e,$0A
	ld a,[de]
	jr c,Unknown_0x1EA5
	rlca
	jp c,Unknown_0x0DF6
	rrca
	ld b,a
	dec e
	ld a,[de]
	sub $AC
	ld a,b
	sbc a,$00
	jp c,Unknown_0x0DF6

Unknown_0x1E9D:
	ld e,$05
	ld bc,$40EB
	jp Unknown_0x0846

Unknown_0x1EA5:
	rlca
	jp nc,Unknown_0x0DF6
	dec e
	ld a,[de]
	cp $F4
	jr c,Unknown_0x1E9D
	jp Unknown_0x0DF6

UnknownData_0x1EB2:
INCBIN "baserom.gb", $1EB2, $1EC0 - $1EB2

Unknown_0x1EC0:
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ld e,$45
	and $80
	xor $C0
	ld [de],a
	ret

Unknown_0x1ED3:
	ld h,d
	ld l,$12
	ld a,[hl]
	or a
	ret z
	ld l,$0F
	ld c,a
	rlca
	sbc a,a
	ld b,a
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	ret

Unknown_0x1EE6:
	ld h,d
	ld l,$11
	ld a,[hl]
	or a
	ret z
	ld l,$0D
	ld c,a
	rlca
	sbc a,a
	ld b,a
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	ret

Unknown_0x1EF9:
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0x1F0D:
	ld hl,$DD2C
	ld a,[hl]
	bit 2,a
	ret

Unknown_0x1F14:
	push de
	push bc
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,[hl]
	inc l
	ld d,[hl]
	ld a,c
	sub e
	ld a,b
	sbc a,d
	jr c,Unknown_0x1F3B
	ld a,c
	sub e
	ld e,a
	ld a,b
	cp d
	jr z,Unknown_0x1F34
	ld a,$FF
	add a,e
	ld e,a

Unknown_0x1F34:
	ld a,e
	pop bc
	pop de
	cp b
	ret nc
	jr Unknown_0x1F4B

Unknown_0x1F3B:
	ld a,e
	sub c
	ld c,a
	ld a,d
	cp b
	jr z,Unknown_0x1F46
	ld a,$FF
	add a,c
	ld c,a

Unknown_0x1F46:
	ld a,c
	pop bc
	pop de
	cp b
	ret nc

Unknown_0x1F4B:
	push de
	push bc
	ld e,$07
	ld l,e
	ld h,$A0
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,[hl]
	inc l
	ld d,[hl]
	ld a,c
	sub e
	ld a,b
	sbc a,d
	jr c,Unknown_0x1F70
	ld a,c
	sub e
	ld c,a
	ld a,b
	cp d
	jr z,Unknown_0x1F6B
	ld a,$FF
	add a,c
	ld c,a

Unknown_0x1F6B:
	ld a,c
	pop bc
	pop de
	cp c
	ret

Unknown_0x1F70:
	ld a,e
	sub c
	ld e,a
	ld a,b
	cp d
	jr z,Unknown_0x1F7B
	ld a,$FF
	add a,e
	ld e,a

Unknown_0x1F7B:
	ld a,e
	pop bc
	pop de
	cp c
	ret
	push bc
	call Unknown_0x1964
	and $80
	ld e,$27
	ld [de],a
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	pop bc
	ret

UnknownData_0x1F91:
INCBIN "baserom.gb", $1F91, $1F9C - $1F91

Unknown_0x1F9C:
	ld h,$A0

Unknown_0x1F9E:
	ld l,e
	ld a,[de]
	sub [hl]
	ld c,a
	inc l
	inc e
	ld a,[de]
	sbc a,[hl]
	jr nc,Unknown_0x1FAC
	ld a,c
	cpl
	inc a
	ld c,a

Unknown_0x1FAC:
	ld a,c
	cp b
	ret

Unknown_0x1FAF:
	ld e,$0F
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0x1FBD:
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret

Unknown_0x1FD1:
	ld a,[bc]
	inc bc
	ld h,d
	ld l,$45
	bit 7,[hl]
	jr z,Unknown_0x1FDC
	cpl
	inc a

Unknown_0x1FDC:
	ld l,a
	rla
	sbc a,a
	ld h,a
	ld e,$04
	ld a,[de]
	add a,l
	ld [de],a
	inc e
	ld a,[de]
	adc a,h
	ld [de],a
	ld a,[bc]
	inc bc
	ld l,a
	rla
	sbc a,a
	ld h,a
	ld e,$07
	ld a,[de]
	add a,l
	ld [de],a
	inc e
	ld a,[de]
	adc a,h
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld e,$46
	ld l,e
	ld a,[hl]
	ld [de],a
	ret
	ld a,[$DA4A]
	and a
	ret z
	ld h,a
	ld e,$46
	ld l,e
	ld a,[de]
	ld [hl],a
	ret
	ld e,$5E
	ld a,[bc]
	ld [de],a
	inc bc
	inc e
	ld a,[bc]
	ld [de],a
	inc bc
	inc e
	ld a,[bc]
	ld [de],a
	inc bc
	ret

Unknown_0x201D:
	call Unknown_0x202B

Unknown_0x2020:
	ld e,$27
	jr nc,Unknown_0x2028
	ld a,$01
	ld [de],a
	ret

Unknown_0x2028:
	xor a
	ld [de],a
	ret

Unknown_0x202B:
	ld e,$07

Unknown_0x202D:
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ret
	call Unknown_0x203D
	jp Unknown_0x2020

Unknown_0x203D:
	ld e,$04
	jp Unknown_0x202D
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc

Unknown_0x2048:
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x2053
	inc h

Unknown_0x2053:
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld e,$39
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	jp Unknown_0x2053
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	ld e,a
	add a,a
	add a,e
	add a,l
	jr nc,Unknown_0x2078
	inc h

Unknown_0x2078:
	ld l,a
	jp Unknown_0x2053
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$0F
	ld a,[hli]
	ld [de],a
	ld e,$3D
	ld [de],a
	ld a,[hl]
	inc e
	ld [de],a
	ld e,$10
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc

Unknown_0x2096:
	ld e,$5C
	ld a,[de]
	add a,a
	add a,l
	jr nc,Unknown_0x209E
	inc h

Unknown_0x209E:
	ld l,a
	ld e,$0F
	ld a,[hli]
	ld [de],a
	ld e,$3D
	ld [de],a
	ld a,[hl]
	inc e
	ld [de],a
	ld e,$10
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x20BE
	inc h

Unknown_0x20BE:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$12
	ld a,[hli]
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	jp Unknown_0x20BE
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	jp Unknown_0x20F0
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	jp Unknown_0x20E5

Unknown_0x20E5:
	ld e,$27
	ld a,[de]
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x20F9
	inc h
	jr Unknown_0x20F9

Unknown_0x20F0:
	ld e,$5C
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x20F9
	inc h

Unknown_0x20F9:
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0x2107
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

Unknown_0x2107:
	ld e,$0D
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0x2123
	inc h

Unknown_0x2123:
	ld e,$45
	ld a,[de]
	rlca
	ld e,$11
	ld a,[hli]
	jr c,Unknown_0x212E
	ld [de],a
	ret

Unknown_0x212E:
	cpl
	inc a
	ld [de],a
	ret

UnknownData_0x2132:
INCBIN "baserom.gb", $2132, $213A - $2132
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jp nc,Unknown_0x2164
	inc h
	jp Unknown_0x2164

UnknownData_0x214F:
INCBIN "baserom.gb", $214F, $215E - $214F
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc

Unknown_0x2164:
	ld e,$45
	ld a,[de]
	rlca
	jr nc,Unknown_0x217E
	ld e,$11
	ld a,[hli]
	cpl
	inc a
	ld [de],a
	ld e,$3B
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0x217E:
	ld a,[hli]
	ld e,$11
	ld [de],a
	ld e,$3B
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jp nc,Unknown_0x21A5
	inc h
	jp Unknown_0x21A5
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc

Unknown_0x21A5:
	ld e,$11
	ld a,[hli]
	ld [de],a
	ld e,$45
	ld a,[de]
	rlca
	jr nc,Unknown_0x21BD
	ld e,$3B
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0x21BD:
	ld e,$3B
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

Unknown_0x21C5:
	ld h,d
	ld l,$11
	ld e,[hl]
	ld l,$3B
	ld c,[hl]
	inc l
	ld b,[hl]
	bit 7,b
	jr nz,Unknown_0x21D5
	jp Unknown_0x0CB4

Unknown_0x21D5:
	jp Unknown_0x0CEF

Unknown_0x21D8:
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	bit 7,b
	jr nz,Unknown_0x21E8
	jp Unknown_0x0D35

Unknown_0x21E8:
	jp Unknown_0x0D70

Unknown_0x21EB:
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	jp Unknown_0x0D35

Unknown_0x21F7:
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	jp Unknown_0x0D70
	ld a,[bc]
	inc bc
	push bc
	ld e,$07
	ld h,$A0
	ld l,e
	ld c,a
	rlca
	jr c,Unknown_0x2220
	ld a,[de]
	add a,c
	ld c,a
	inc e
	ld a,[de]
	adc a,$00
	ld b,a
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x222E

Unknown_0x221D:
	xor a
	jr Unknown_0x2230

Unknown_0x2220:
	ld a,[de]
	add a,c
	ld c,a
	inc e
	ld a,[de]
	adc a,$FF
	ld b,a
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x221D

Unknown_0x222E:
	ld a,$01

Unknown_0x2230:
	ld e,$27
	ld [de],a
	pop bc
	ret

Unknown_0x2235:
	ld e,$4D
	ld a,[de]
	cp $04
	jr z,Unknown_0x2242
	cp $05
	jr z,Unknown_0x2242
	xor a
	ret

Unknown_0x2242:
	ld a,$01
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0x2253
	inc h

Unknown_0x2253:
	ld e,$24
	ld a,[hl]
	ld [de],a
	ret
	ld e,$12
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	ld h,$A0
	ld l,$86
	ld e,$4C
	ld a,[de]
	ld [hl],a
	ld hl,$DEDF
	set 0,[hl]
	ld hl,$DEE4
	ld [hl],$00
	ret
	ld h,$A0
	ld e,$4C
	ld l,$85
	ld a,[de]
	ld [hl],a
	ret
	ld h,$A0
	xor a
	ld l,$85
	ld [hl],a
	ret
	ld hl,$DEDF
	res 0,[hl]
	ld hl,$DEDE
	set 0,[hl]
	ret

Unknown_0x228D:
	ld h,$A5
	ld c,$03

Unknown_0x2291:
	push bc
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x22B4
	ld l,$4C
	ld a,[hl]
	or a
	jr z,Unknown_0x22B4
	ld e,$04
	ld b,$28
	call Unknown_0x1F9E
	jr nc,Unknown_0x22B4
	ld e,$07
	ld b,$20
	call Unknown_0x1F9E
	jr nc,Unknown_0x22B4
	pop bc
	scf
	ret

Unknown_0x22B4:
	pop bc
	dec c
	ret z
	inc h
	jr Unknown_0x2291
	ld h,b
	ld l,c
	ld a,[hli]
	ld [$FF00+$84],a
	ld bc,$A8B2
	ld a,[hli]

Unknown_0x22C3:
	push af
	push de
	push hl
	call Unknown_0x0F67
	pop bc
	pop de
	ld a,h
	or a
	jr z,Unknown_0x22E4
	ld l,$48
	ld [hl],d
	ld e,l
	ld a,h
	ld [de],a
	ld e,$45
	ld l,e
	ld a,[de]
	ld [hl],a
	ld e,$5C
	ld l,e
	ld a,[de]
	ld [hl],a
	pop af
	ld l,$5B
	ld [hl],a
	ret

Unknown_0x22E4:
	pop af
	ret
	ld h,b
	ld l,c
	ld a,[hli]
	ld [$FF00+$84],a
	ld bc,$A8B2
	ld a,[hli]

Unknown_0x22EF:
	push af
	push de
	push hl
	call Unknown_0x0F67
	pop bc
	pop de
	ld a,h
	or a
	jr z,Unknown_0x230D
	ld l,$48
	ld [hl],d
	ld e,$45
	ld l,e
	ld a,[de]
	ld [hl],a
	ld e,$5C
	ld l,e
	ld a,[de]
	ld [hl],a
	pop af
	ld l,$5B
	ld [hl],a
	ret

Unknown_0x230D:
	pop af
	ret

Unknown_0x230F:
	ld hl,$FF84
	ld [hl],e
	ld bc,$A8B2
	jp Unknown_0x22C3

Unknown_0x2319:
	ld hl,$FF84
	ld [hl],e
	ld bc,$A8B2
	jp Unknown_0x22EF

Unknown_0x2323:
	ld bc,$1EB2
	call Unknown_0x255B
	ld e,$41
	ld a,[de]
	or a
	ret nz
	call Unknown_0x0C71
	ld h,d
	ld l,$60
	ld [hl],$3F
	ld l,$44
	ld [hl],$18
	xor a
	ret

Unknown_0x233C:
	ld e,$44
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x2348
	sub $01
	ld [de],a
	jr c,Unknown_0x2360

Unknown_0x2348:
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 1,a
	jr nz,Unknown_0x235D
	bit 0,a
	jr nz,Unknown_0x2358
	xor a
	ret

Unknown_0x2358:
	call Unknown_0x0C61
	scf
	ret

Unknown_0x235D:
	pop hl
	scf
	ret

Unknown_0x2360:
	ld l,$60
	ld h,d
	ld [hl],$2D
	jr Unknown_0x2348
	push bc
	ld e,$08
	ld bc,$6410
	call Unknown_0x0C3A
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

Unknown_0x2375:
	ld e,$F8
	call Unknown_0x1AC1
	ret nz
	ld e,$03
	ld bc,$4D53
	call Unknown_0x0846
	pop hl
	ret

Unknown_0x2385:
	call Unknown_0x1A97
	ret nz
	ld e,$03
	ld bc,$4E33
	call Unknown_0x0846
	pop hl
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld a,[bc]
	ld e,a
	inc bc
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	inc bc
	push bc
	ld b,a
	ld c,l
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x23AC
	call Unknown_0x0849

Unknown_0x23AC:
	pop bc
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$21
	ld a,[bc]
	ld [hld],a
	inc bc
	ld a,[bc]
	ld [hld],a
	inc bc
	ld a,[bc]
	ld [hl],a
	inc bc
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	call Unknown_0x23CA
	pop bc
	ret

Unknown_0x23CA:
	ld e,$40
	ld a,[de]
	rlca
	rlca
	ld c,a
	ld e,$5C
	ld a,[de]
	rlca
	add a,c
	add a,l
	ld l,a
	jr nc,Unknown_0x23DA
	inc h

Unknown_0x23DA:
	ld c,[hl]
	inc hl
	ld b,[hl]
	ld e,$45
	ld a,[de]
	rlca
	jr nc,Unknown_0x23ED
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x23ED:
	ld h,d
	ld l,$0D
	ld [hl],c
	inc l
	ld [hl],b
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0x2402
	inc h

Unknown_0x2402:
	ld a,[hl]
	or a
	jr z,Unknown_0x2414
	cp $FF
	jr z,Unknown_0x2411
	ld l,a
	ld e,$3F
	ld a,[de]
	cp l
	jr c,Unknown_0x2414

Unknown_0x2411:
	xor a
	jr Unknown_0x2416

Unknown_0x2414:
	ld a,$01

Unknown_0x2416:
	ld e,$27
	ld [de],a
	ret
	call Unknown_0x0F50
	ld a,h
	ld e,$27
	ld [de],a
	ret

Unknown_0x2422:
	ld a,[$FF00+$A4]
	push af
	ld a,$10
	call Unknown_0x05DD
	call Unknown_0x2435
	pop af
	call Unknown_0x05DD
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x2435:
	ld hl,$CD52
	ld a,[hli]
	or [hl]
	ld a,[$FF00+$92]
	ld c,a
	ld a,[$DA1C]
	jr nz,Unknown_0x2449
	cp c
	ret nz
	ld l,$4D
	ld [hl],$00
	ret

Unknown_0x2449:
	sub c
	dec a
	cp $04
	ret c
	sub $03
	ld e,a
	ld a,[hld]
	or a
	jr nz,Unknown_0x245A
	ld a,[hl]
	cp e
	jr nc,Unknown_0x245A
	ld e,a

Unknown_0x245A:
	ld a,[hl]
	sub e
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hl],a
	ld b,$C4
	ld l,$4E
	ld a,[hli]
	ld [bc],a
	inc c
	ld a,[hli]
	ld [bc],a
	inc c
	ld a,e
	ld [bc],a
	ld [$FF00+$84],a
	inc c
	ld a,[hli]
	ld h,[hl]
	ld l,a

Unknown_0x2473:
	ld a,[hli]
	ld [bc],a
	inc c
	dec e
	jr nz,Unknown_0x2473
	ld a,c
	ld [$FF00+$92],a
	ld de,$CD4E
	ld a,[$FF00+$84]
	ld c,a
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,$00
	ld [de],a
	inc e
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

Unknown_0x2491:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	ld [hli],a
	jp Unknown_0x1973

Unknown_0x24A5:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	ld [hli],a
	jp Unknown_0x19DD

Unknown_0x24B9:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	ld [hli],a
	jp Unknown_0x1A05

Unknown_0x24CD:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,[bc]
	ld e,a
	inc bc
	ld [hli],a
	ld a,[bc]
	ld [$FF00+$80],a
	inc bc
	ld [hli],a
	ld a,[bc]
	inc bc
	ld [hli],a
	ld a,[bc]
	ld [hli],a
	ld a,[$FF00+$80]
	sub e
	ld [hli],a
	jp Unknown_0x1A3A

Unknown_0x24E8:
	ld e,$48
	ld a,[de]
	ld h,a

Unknown_0x24EC:
	ld a,[bc]
	inc bc
	ld [$FF00+$80],a
	ld a,[bc]
	inc bc
	push bc
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$07
	ld l,e
	ld a,[hli]
	add a,c
	ld [de],a
	inc e
	ld a,[hl]
	adc a,b
	ld [de],a
	ld a,[$FF00+$80]
	ld l,$45
	bit 7,[hl]
	jr z,Unknown_0x250B
	cpl
	inc a

Unknown_0x250B:
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$04
	ld l,e
	ld a,[hli]
	add a,c
	ld [de],a
	inc e
	ld a,[hl]
	adc a,b
	ld [de],a
	pop bc
	ret

Unknown_0x251B:
	ld e,$44
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x252C
	sub $01
	ld [de],a
	jr c,Unknown_0x254D
	ld l,$60
	ld h,d
	ld [hl],$3F

Unknown_0x252C:
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 1,a
	jr nz,Unknown_0x2546
	bit 0,a
	jr nz,Unknown_0x253C
	xor a
	ret

Unknown_0x253C:
	call Unknown_0x0C61
	ld hl,$DD12
	set 3,[hl]
	scf
	ret

Unknown_0x2546:
	ld e,$4C
	xor a
	ld [de],a
	pop hl
	scf
	ret

Unknown_0x254D:
	ld hl,$DD12
	bit 2,[hl]
	jr nz,Unknown_0x252C
	ld l,$60
	ld h,d
	ld [hl],$2D
	jr Unknown_0x252C

Unknown_0x255B:
	xor a
	ld [$DD2C],a
	ld a,c
	ld [$DD29],a
	ld a,b
	ld [$DD2A],a
	call Unknown_0x2588
	jr c,Unknown_0x2584
	ld h,$A5
	ld l,$00

Unknown_0x2570:
	ld a,[hl]
	inc a
	jr z,Unknown_0x257B
	push hl
	call Unknown_0x26B6
	pop hl
	jr c,Unknown_0x2584

Unknown_0x257B:
	inc h
	ld a,h
	cp $A8
	jr nz,Unknown_0x2570
	call Unknown_0x2753

Unknown_0x2584:
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x2588:
	ld a,[$A05D]
	inc a
	jr z,Unknown_0x25FC
	cp $05
	jr z,Unknown_0x25FC
	cp $01
	jr z,Unknown_0x259D
	ld e,$61
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x25FC

Unknown_0x259D:
	ld e,$04
	ld hl,$A05E
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	jr z,Unknown_0x25B4
	inc a
	jr nz,Unknown_0x25FC
	ld a,c
	cpl
	inc a
	jr z,Unknown_0x25FC
	ld c,a

Unknown_0x25B4:
	ld a,[$FF00+$A2]
	ld b,a
	ld e,$5E
	ld a,[de]
	add a,b
	scf
	sbc a,c
	jr c,Unknown_0x25FC
	ld e,$07
	ld l,$60
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	jr z,Unknown_0x25D5
	inc a
	jr nz,Unknown_0x25FC
	ld a,c
	cpl
	inc a
	jr z,Unknown_0x25FC
	ld c,a

Unknown_0x25D5:
	ld a,[$FF00+$A3]
	ld b,a
	ld e,$5F
	ld a,[de]
	add a,b
	scf
	sbc a,c
	jr c,Unknown_0x25FC
	ld a,[$A05D]
	ld hl,$25F0
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x25EC
	inc h

Unknown_0x25EC:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x25F0:
INCBIN "baserom.gb", $25F0, $25FC - $25F0

Unknown_0x25FC:
	and a
	ret
	ld a,[$A057]
	bit 6,a
	jr nz,Unknown_0x2665
	ld hl,$DD2C
	set 2,[hl]
	ld e,$60
	ld a,[de]
	bit 3,a
	jr nz,Unknown_0x2665
	ld hl,$A055
	inc [hl]
	ld h,d
	ld l,$0D
	xor a
	ld [hli],a
	ld [hl],a
	ld l,$0F
	ld [hli],a
	ld [hl],a
	ld l,$22
	ld [hl],$F6
	inc l
	ld [hl],$0D
	ld hl,$A057
	set 7,[hl]
	ld e,$00
	ld a,[de]
	cp $2F
	jr nz,Unknown_0x2641
	ld hl,$A057
	set 0,[hl]
	ld a,$01
	ld [$A059],a
	ld e,$3C
	ld a,[de]
	jr Unknown_0x265B

Unknown_0x2641:
	ld a,[$A057]
	rra
	jr c,Unknown_0x2662
	ld hl,$DD29
	ld a,[hli]
	add a,$00
	ld h,[hl]
	jr nc,Unknown_0x2651
	inc h

Unknown_0x2651:
	ld l,a
	ld a,[hl]
	bit 7,a
	jr nz,Unknown_0x2662
	ld hl,$A059
	inc [hl]

Unknown_0x265B:
	ld [$A058],a
	xor a
	ld [$A05A],a

Unknown_0x2662:
	jp Unknown_0x284F

Unknown_0x2665:
	and a
	ret
	ld e,$60
	ld a,[de]
	bit 1,a
	jr nz,Unknown_0x2680
	ld a,[$A062]
	ld b,a
	ld e,$4C
	ld a,[de]
	sub b
	jp c,Unknown_0x2829
	jp z,Unknown_0x2829
	ld [de],a
	jp Unknown_0x2820

Unknown_0x2680:
	and a
	ret

Unknown_0x2682:
	ld e,$60
	ld a,[de]
	bit 1,a
	jr nz,Unknown_0x26A4
	call Unknown_0x2871
	ld a,[$A045]
	ld [$DD2B],a
	ld a,[$A062]
	ld b,a
	ld e,$4C
	ld a,[de]
	sub b
	jp c,Unknown_0x2836
	jp z,Unknown_0x2836
	ld [de],a
	jp Unknown_0x2820

Unknown_0x26A4:
	and a
	ret
	ld e,$60
	ld a,[de]
	bit 2,a
	jr nz,Unknown_0x26B4
	ld hl,$A06C
	set 3,[hl]
	jr Unknown_0x2682

Unknown_0x26B4:
	and a
	ret

Unknown_0x26B6:
	ld l,$4C
	ld a,[hl]
	or a
	jr z,Unknown_0x2706
	ld e,$60
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x2706
	ld e,$04
	ld l,e
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ld [$DD2B],a
	jr z,Unknown_0x26DB
	inc a
	jr nz,Unknown_0x2706
	ld a,c
	cpl
	inc a
	jr z,Unknown_0x2706
	ld c,a

Unknown_0x26DB:
	ld l,$39
	ld b,[hl]
	ld e,$5E
	ld a,[de]
	add a,b
	scf
	sbc a,c
	jr c,Unknown_0x2706
	ld e,$07
	ld l,e
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	jr z,Unknown_0x26FB
	inc a
	jr nz,Unknown_0x2706
	ld a,c
	cpl
	inc a
	jr z,Unknown_0x2706
	ld c,a

Unknown_0x26FB:
	ld l,$3A
	ld b,[hl]
	ld e,$5F
	ld a,[de]
	add a,b
	scf
	sbc a,c
	jr nc,Unknown_0x2708

Unknown_0x2706:
	and a
	ret

Unknown_0x2708:
	ld e,$60
	ld a,[de]
	bit 6,a
	jr nz,Unknown_0x2726
	ld l,$5A
	ld a,[hl]
	cp $06
	jr z,Unknown_0x2726
	cp $0A
	jr z,Unknown_0x2726
	cp $16
	jr z,Unknown_0x2726
	ld e,$07
	ld bc,$4C83
	call Unknown_0x0849

Unknown_0x2726:
	ld e,$60
	ld a,[de]
	bit 4,a
	jr nz,Unknown_0x2706
	ld l,$5A
	ld a,[hl]
	cp $00
	jr nz,Unknown_0x2739
	ld a,[de]
	bit 5,a
	jr nz,Unknown_0x2706

Unknown_0x2739:
	ld e,$4C
	ld l,e
	ld a,[de]
	sub [hl]
	jp c,Unknown_0x2748
	jp z,Unknown_0x2748
	ld [de],a
	jp Unknown_0x2820

Unknown_0x2748:
	ld l,$5A
	ld a,[hl]
	cp $12
	jp nz,Unknown_0x2836
	jp Unknown_0x2829

Unknown_0x2753:
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ld [$DD2B],a
	jr z,Unknown_0x276D
	inc a
	jr nz,Unknown_0x279A
	ld a,c
	cpl
	inc a
	jr z,Unknown_0x279A
	ld c,a

Unknown_0x276D:
	ld a,[$FF00+$A0]
	ld b,a
	ld e,$5E
	ld a,[de]
	add a,b
	scf
	sbc a,c
	jr c,Unknown_0x279A
	ld e,$07
	ld hl,$CD54
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	jr z,Unknown_0x278F
	inc a
	jr nz,Unknown_0x279A
	ld a,c
	cpl
	inc a
	jr z,Unknown_0x279A
	ld c,a

Unknown_0x278F:
	ld a,[$FF00+$A1]
	ld b,a
	ld e,$5F
	ld a,[de]
	add a,b
	scf
	sbc a,c
	jr nc,Unknown_0x279C

Unknown_0x279A:
	and a
	ret

Unknown_0x279C:
	ld hl,$DD2C
	set 3,[hl]
	ld e,$61
	ld a,[de]
	bit 6,a
	jr nz,Unknown_0x279A
	call Unknown_0x2809
	jr c,Unknown_0x279A
	ld a,[$A05D]
	cp $01
	jr z,Unknown_0x279A
	cp $04
	jr z,Unknown_0x279A
	ld a,[$A054]
	or a
	jp nz,Unknown_0x27F3
	ld hl,$DD29
	ld a,[hli]
	add a,$01
	ld h,[hl]
	jr nc,Unknown_0x27C9
	inc h

Unknown_0x27C9:
	ld l,a
	ld a,[hl]
	ld [$A044],a
	or a
	jr z,Unknown_0x27D7
	and $0F
	ld b,a
	call Unknown_0x3A8B

Unknown_0x27D7:
	ld a,$FF
	ld [$A05D],a
	ld e,$01
	ld bc,Unknown_0x4EC9
	call Unknown_0x0C48
	ld a,[$DD2B]
	and $80
	or $40
	ld [$A053],a
	ld a,$01
	ld [$A054],a

Unknown_0x27F3:
	ld e,$60
	ld a,[de]
	bit 0,a
	jr nz,Unknown_0x279A
	ld e,$4C
	ld a,[de]
	sub $02
	jp c,Unknown_0x2836
	jp z,Unknown_0x2836
	ld [de],a
	jp Unknown_0x2820

Unknown_0x2809:
	ld a,[$A050]
	cp $09
	jr nz,Unknown_0x281E
	ld a,[$A056]
	or a
	jr nz,Unknown_0x281C
	ld a,[$A055]
	or a
	jr z,Unknown_0x281E

Unknown_0x281C:
	scf
	ret

Unknown_0x281E:
	and a
	ret

Unknown_0x2820:
	ld hl,$DD2C
	set 0,[hl]
	ld b,$08
	jr Unknown_0x2851

Unknown_0x2829:
	ld hl,$DD2C
	set 1,[hl]
	ld b,$0B
	call Unknown_0x2851
	ret nc
	jr Unknown_0x2841

Unknown_0x2836:
	ld hl,$DD2C
	set 1,[hl]
	ld b,$05
	call Unknown_0x2851
	ret nc

Unknown_0x2841:
	ld e,$4A
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld h,$02
	call Unknown_0x30E0
	scf
	ret

Unknown_0x284F:
	ld b,$02

Unknown_0x2851:
	ld hl,$DD29
	ld a,[hli]
	add a,b
	ld h,[hl]
	jr nc,Unknown_0x285A
	inc h

Unknown_0x285A:
	ld l,a
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	or c
	jr z,Unknown_0x286F
	ld e,[hl]
	call Unknown_0x0846
	ld a,[$DD2B]
	cpl
	ld l,$5D
	ld [hl],a
	scf
	ret

Unknown_0x286F:
	and a
	ret

Unknown_0x2871:
	ld hl,$A06C
	bit 0,[hl]
	ret nz
	set 0,[hl]
	ld hl,$A076
	ld [hl],$00
	ret

UnknownData_0x287F:
INCBIN "baserom.gb", $287F, $2885 - $287F

Unknown_0x2885:
	push af
	xor a
	ld [$FF00+$80],a
	jr Unknown_0x289A

UnknownData_0x288B:
INCBIN "baserom.gb", $288B, $289A - $288B

Unknown_0x289A:
	push de
	push hl
	ld a,b
	cp c
	jr nc,Unknown_0x28A2
	ld b,c
	ld c,a

Unknown_0x28A2:
	ld h,$D7
	ld l,c
	ld d,[hl]
	inc h
	ld e,[hl]
	dec h
	ld l,b
	ld a,[hl]
	inc h
	ld l,[hl]
	ld h,a
	add hl,de
	push af
	ld d,$D8
	ld a,b
	sub c
	ld e,a
	ld a,[de]
	ld c,a
	dec d
	ld a,[de]
	ld b,a
	ld a,l
	sub c
	ld l,a
	ld a,h
	sbc a,b
	ld h,a
	jr nc,Unknown_0x28C6
	pop af
	ccf
	jr Unknown_0x28C7

Unknown_0x28C6:
	pop af

Unknown_0x28C7:
	rr h
	rr l
	ld b,h
	ld c,l
	ld a,[$FF00+$80]
	rlca
	jr nc,Unknown_0x28DC
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x28DC:
	pop hl
	pop de
	pop af
	ret

Unknown_0x28E0:
	push af
	push hl
	ld a,b
	xor d
	ld [$FF00+$81],a
	bit 7,b
	jr z,Unknown_0x28F4
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x28F4:
	push bc
	ld b,e
	call Unknown_0x2885
	ld l,c
	ld h,b
	ld bc,$0080
	add hl,bc
	ld l,h
	ld h,$00
	pop bc
	ld c,e
	call Unknown_0x2885
	add hl,bc
	ld a,[$FF00+$81]
	rlca
	jr nc,Unknown_0x2917
	ld a,l
	cpl
	add a,$01
	ld l,a
	ld a,h
	cpl
	adc a,$00
	ld h,a

Unknown_0x2917:
	ld c,l
	ld b,h
	pop hl
	pop af
	ret

Unknown_0x291C:
	add a,$40

Unknown_0x291E:
	push hl
	ld [$FF00+$80],a
	and $7F
	cp $40
	jr c,Unknown_0x292A
	cpl
	add a,$81

Unknown_0x292A:
	ld hl,Unknown_0x2988
	ld d,$00
	ld e,a
	add hl,de
	ld e,[hl]
	ld d,$00
	ld a,[$FF00+$80]
	sla a
	jr nc,Unknown_0x293C
	ld d,$FF

Unknown_0x293C:
	pop hl
	ret

Unknown_0x293E:
	push af
	xor a
	ld [$FF00+$87],a
	push de
	push hl
	ld a,b
	cp c
	jr nc,Unknown_0x294A
	ld b,c
	ld c,a

Unknown_0x294A:
	ld h,$D7
	ld l,c
	ld d,[hl]
	inc h
	ld e,[hl]
	dec h
	ld l,b
	ld a,[hl]
	inc h
	ld l,[hl]
	ld h,a
	add hl,de
	push af
	ld d,$D8
	ld a,b
	sub c
	ld e,a
	ld a,[de]
	ld c,a
	dec d
	ld a,[de]
	ld b,a
	ld a,l
	sub c
	ld l,a
	ld a,h
	sbc a,b
	ld h,a
	jr nc,Unknown_0x296E
	pop af
	ccf
	jr Unknown_0x296F

Unknown_0x296E:
	pop af

Unknown_0x296F:
	rr h
	rr l
	ld b,h
	ld c,l
	ld a,[$FF00+$87]
	rlca
	jr nc,Unknown_0x2984
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x2984:
	pop hl
	pop de
	pop af
	ret

Unknown_0x2988:
INCBIN "baserom.gb", $2988, $2A2B - $2988
	ld a,e
	ld [$DD2E],a
	add a,a
	add a,a
	ld b,a
	add a,a
	add a,b
	ld bc,$29C9
	add a,c
	jr nc,Unknown_0x2A3B
	inc b

Unknown_0x2A3B:
	ld c,a
	call Unknown_0x2AF8
	ld a,[bc]
	inc bc
	ld e,a
	push bc
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	pop bc
	ld a,[bc]
	inc bc
	ld e,a
	push de
	ld a,[bc]
	inc bc
	push bc
	call Unknown_0x05DD
	pop bc
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld de,$8000
	push bc
	call Unknown_0x0708
	pop bc
	ld a,[bc]
	inc bc
	push bc
	call Unknown_0x05DD
	pop bc
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld de,$9000
	push bc
	call Unknown_0x0708
	pop bc
	ld a,[bc]
	inc bc
	push bc
	call Unknown_0x05DD
	pop bc
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld de,$9800
	push bc
	call Unknown_0x0708
	ld a,$47
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld a,$08
	call Unknown_0x05DD
	call Unknown_0x20000
	pop bc
	ld a,[bc]
	ld h,$A0
	ld l,$B3
	ld b,$00
	ld c,b
	ld d,c
	ld e,d
	call Unknown_0x07C4
	pop de
	ld hl,$6011
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$DD2E]
	add a,$03
	ld d,a
	ld e,$04
	ld hl,$4246
	ld a,$1A
	call Unknown_0x05CF

Unknown_0x2AC4:
	call Unknown_0x0496
	call Unknown_0x086B
	call Unknown_0x04AE
	call Unknown_0x0343
	ld a,[$DD2D]
	and a
	jr nz,Unknown_0x2ADC
	ld a,[$DA46]
	and a
	jr nz,Unknown_0x2AC4

Unknown_0x2ADC:
	ld a,[$DD2E]
	add a,$03
	ld d,a
	ld e,$04
	ld hl,Unknown_0x6C27B
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld hl,Unknown_0x6DADA
	ld a,$07
	call Unknown_0x05CF
	ret

Unknown_0x2AF8:
	call Unknown_0x1584
	ld hl,$DD2D
	ld [hl],a
	ld hl,$FFA5
	ld [hl],a
	ld a,$E4
	ld [$CD09],a
	ld a,$D0
	ld [$CD0A],a
	ld a,$E4
	ld [$CD0B],a
	ret

Unknown_0x2B13:
	ld a,[$DD2F]
	inc a
	ret z
	ld a,[$CD4D]
	or a
	ret z
	push de
	call Unknown_0x2435
	pop de
	ld a,[$CD4D]
	or a
	ret nz
	dec a
	ld [$DD2F],a
	ret
	ld de,$CF00
	call Unknown_0x0708
	di
	ld a,e
	sub $00
	ld e,a
	ld a,d
	sbc a,$CF
	ld hl,$CD53
	ld [hld],a
	ld [hl],e
	ld a,$01
	ld [$CD4D],a
	xor a
	ld [$DD58],a
	ld a,$FF
	ld [$FF00+$45],a
	ld [$DA29],a
	jr Unknown_0x2B83
	push af
	push hl
	push bc
	push de
	ld a,[$FF00+$A4]
	ld [$DD34],a
	ld [$DD32],sp
	ld hl,$DA14
	ld a,$77
	ld [hli],a
	ld [hl],$2B
	ld a,$80
	ld [$FF00+$45],a
	ld a,[$DD37]
	call Unknown_0x05F3
	ld sp,$DD35
	pop hl
	ld sp,hl
	jp Unknown_0x029F
	push af
	push hl
	push bc
	push de
	ld a,[$FF00+$A4]
	ld [$DD37],a
	ld [$DD35],sp

Unknown_0x2B83:
	ld a,[$DD34]
	call Unknown_0x05F3
	ld sp,$DD32
	pop hl
	ld sp,hl
	jp Unknown_0x029F
	ld hl,$DD2D
	ld [hl],$01
	ret

Unknown_0x2B97:
	ld hl,$CE8A
	add hl,bc
	ld [hl],$24
	xor a
	ld hl,$CE92
	add hl,bc
	ld [hl],a
	ld hl,$CE9A
	add hl,bc
	ld [hl],a
	ld hl,$CEA2
	add hl,bc
	ld [hl],a
	ld hl,$CEAA
	add hl,bc
	ld [hl],a
	ld hl,$CEB2
	add hl,bc
	ld [hl],a
	ld hl,Unknown_0x2BF5
	add hl,bc
	ld a,[hl]
	ld hl,$CEBA
	add hl,bc
	ld [hl],a
	inc de
	ld a,[de]
	ld hl,$CE5A
	add hl,bc
	ld [hl],a
	inc de
	ld a,[de]
	ld hl,$CE62
	add hl,bc
	ld [hl],a
	inc de
	ld a,[de]
	sra a
	sra a
	add a,$F0
	ld l,a
	ld h,$2B
	jr nc,Unknown_0x2BDD
	inc h

Unknown_0x2BDD:
	ld a,[hl]
	ld hl,$CE4A
	add hl,bc
	ld [hl],a
	ld hl,$CE52
	add hl,bc
	ld [hl],$01
	ld hl,$CE82
	add hl,bc
	ld [hl],$01
	ret

UnknownData_0x2BF0:
INCBIN "baserom.gb", $2BF0, $2BF5 - $2BF0

Unknown_0x2BF5:
INCBIN "baserom.gb", $2BF5, $2BFD - $2BF5

Unknown_0x2BFD:
	ld a,$1F
	call Unknown_0x05F3
	ld b,$07

Unknown_0x2C04:
	ld h,$CE
	ld a,$52
	add a,b
	ld l,a
	ld a,[hl]
	and a
	jr z,Unknown_0x2C48
	ld a,b
	cp $04
	ld a,$1A
	jr c,Unknown_0x2C17
	ld a,$2E

Unknown_0x2C17:
	ld [$FF00+$99],a
	ld h,$CE
	ld a,$5A
	add a,b
	ld l,a
	push hl
	ld e,[hl]
	add a,$08
	ld l,a
	push hl
	ld d,[hl]
	push bc
	call Unknown_0x2C5A
	pop bc
	pop hl
	ld [hl],d
	pop hl
	ld [hl],e
	call Unknown_0x2F31
	ld h,$CE
	ld a,$72
	add a,b
	ld l,a
	push hl
	ld e,[hl]
	add a,$08
	ld l,a
	push hl
	ld d,[hl]
	push bc
	call Unknown_0x2F4B
	pop bc
	pop hl
	ld [hl],d
	pop hl
	ld [hl],e

Unknown_0x2C48:
	ld a,$04
	cp b
	jr nz,Unknown_0x2C52
	ld a,$1E
	call Unknown_0x05F3

Unknown_0x2C52:
	dec b
	bit 7,b
	jr z,Unknown_0x2C04
	jp Unknown_0x78368

Unknown_0x2C5A:
	ld h,$CE
	ld a,$52
	add a,b
	ld l,a
	dec [hl]
	jr z,Unknown_0x2C65
	ret

Unknown_0x2C64:
	inc de

Unknown_0x2C65:
	ld h,$CE
	ld a,[de]
	ld c,a
	and $E0
	cp $E0
	jp z,Unknown_0x2D60
	ld a,$4A
	add a,b
	ld l,a
	ld a,[hl]
	cp $0F
	jr nz,Unknown_0x2C97
	bit 4,c
	jp nz,Unknown_0x2CCA
	ld a,c
	and $0F
	cp $0F
	jr z,Unknown_0x2CB3
	add a,$D1
	ld l,a
	ld h,$30
	jr nc,Unknown_0x2C8D
	inc h

Unknown_0x2C8D:
	ld c,[hl]
	ld a,$12
	call Unknown_0x30BF
	ld [hl],c
	jp Unknown_0x2CCA

Unknown_0x2C97:
	ld a,c
	and $1F
	cp $10
	jr z,Unknown_0x2CB3
	bit 4,a
	jr z,Unknown_0x2CA4
	or $E0

Unknown_0x2CA4:
	ld c,a
	ld a,$8A
	add a,b
	ld l,a
	ld a,[hl]
	add a,c
	push de
	call Unknown_0x2EF5
	pop de
	jp Unknown_0x2CCA

Unknown_0x2CB3:
	call Unknown_0x2D34
	ld c,a
	ld h,$CE
	ld a,$82
	add a,b
	ld l,a
	ld a,[hl]
	and a
	jr z,Unknown_0x2CC3
	ld [hl],$01

Unknown_0x2CC3:
	ld a,c
	and a
	jp z,Unknown_0x2C64
	inc de
	ret

Unknown_0x2CCA:
	call Unknown_0x2D34
	ld c,a
	ld h,$CE
	ld a,$82
	add a,b
	ld l,a
	ld [hl],$FF
	add a,$10
	ld l,a
	ld a,[hl]
	and a
	jr z,Unknown_0x2CEF
	push bc
	push de
	ld e,a
	ld h,$CE
	ld a,$82
	add a,b
	ld l,a
	push hl
	ld b,e
	call Unknown_0x293E
	pop hl
	ld [hl],b
	pop de
	pop bc

Unknown_0x2CEF:
	push bc
	call Unknown_0x2CF7
	pop bc
	jp Unknown_0x2CC3

Unknown_0x2CF7:
	ld h,$CE
	ld a,$A2
	add a,b
	ld l,a
	ld a,[hl]
	bit 7,a
	jr nz,Unknown_0x2D33

Unknown_0x2D02:
	add a,a
	add a,a

Unknown_0x2D04:
	push de
	add a,$00
	ld e,a
	ld d,$40
	jr nc,Unknown_0x2D0D
	inc d

Unknown_0x2D0D:
	ld h,$CE
	ld a,$72
	add a,b
	ld l,a
	ld a,[de]
	ld [hl],a
	ld a,$7A
	add a,b
	ld l,a
	inc de
	ld a,[de]
	ld [hl],a
	ld h,$30
	ld a,$C7
	add a,b
	ld l,a
	jr nc,Unknown_0x2D25
	inc h

Unknown_0x2D25:
	ld c,[hl]
	ld h,$CE
	ld a,$C2
	add a,b
	ld l,a
	ld [hl],c
	add a,$A8
	ld l,a
	ld [hl],$01
	pop de

Unknown_0x2D33:
	ret

Unknown_0x2D34:
	ld a,[de]
	and $E0
	cp $C0
	jr nz,Unknown_0x2D3F
	inc de
	ld a,[de]
	jr Unknown_0x2D56

Unknown_0x2D3F:
	ld h,$CE
	ld a,$AA
	add a,b
	ld l,a
	ld a,[de]
	and $E0
	swap a
	srl a
	add a,[hl]
	add a,$15
	ld l,a
	ld a,$00
	adc a,$DE
	ld h,a
	ld a,[hl]

Unknown_0x2D56:
	ld c,a
	ld h,$CE
	ld a,$52
	add a,b
	ld l,a
	ld a,c
	ld [hl],a
	ret

Unknown_0x2D60:
	ld a,c
	cp $F0
	jr nz,Unknown_0x2D7D
	inc de
	ld h,$CE
	ld a,$9A
	add a,b
	ld l,a
	ld a,[de]

Unknown_0x2D6D:
	swap a
	and $F0
	ld c,a
	ld a,[hl]
	and $0F
	or c
	ld [hl],a
	call Unknown_0x3043
	jp Unknown_0x2C64

Unknown_0x2D7D:
	cp $F1
	jr nz,Unknown_0x2DA1
	inc de
	ld a,[de]
	ld c,a
	ld h,$CE
	ld a,$9A
	add a,b
	ld l,a
	ld a,[hl]
	swap a
	and $0F
	add a,c
	bit 7,c
	jr nz,Unknown_0x2D9C
	cp $10
	jr c,Unknown_0x2D9F
	ld a,$0F
	jr Unknown_0x2D9F

Unknown_0x2D9C:
	jr c,Unknown_0x2D9F
	xor a

Unknown_0x2D9F:
	jr Unknown_0x2D6D

Unknown_0x2DA1:
	cp $F2
	jr nz,Unknown_0x2DB6
	inc de
	ld a,[de]
	add a,a
	ld c,a
	add a,a
	add a,c
	ld hl,$CEAA

Unknown_0x2DAE:
	ld c,a
	ld a,l
	add a,b
	ld l,a
	ld [hl],c
	jp Unknown_0x2C64

Unknown_0x2DB6:
	cp $F3
	jr nz,Unknown_0x2DCB
	inc de
	ld h,$CE
	ld a,$52
	add a,b
	ld l,a
	ld a,[de]
	ld [hl],a
	ld a,$82
	add a,b
	ld l,a
	ld [hl],$FF
	inc de
	ret

Unknown_0x2DCB:
	cp $F4
	jr nz,Unknown_0x2DD7
	inc de
	ld a,[de]
	ld hl,$CE92
	jp Unknown_0x2DAE

Unknown_0x2DD7:
	cp $F5
	jr nz,Unknown_0x2DE3
	inc de
	ld a,[de]
	ld hl,$CE8A
	jp Unknown_0x2DAE

Unknown_0x2DE3:
	cp $F6
	jr nz,Unknown_0x2DF8
	inc de
	ld h,$CE
	ld a,$A2
	add a,b
	ld l,a
	ld a,[de]
	ld [hl],a
	bit 7,a
	call nz,Unknown_0x2D02
	jp Unknown_0x2C64

Unknown_0x2DF8:
	cp $F7
	jr nz,Unknown_0x2E04
	inc de
	ld a,[de]
	ld hl,$CEB2
	jp Unknown_0x2DAE

Unknown_0x2E04:
	cp $E2
	jr nz,Unknown_0x2E1A
	inc de
	ld a,[de]
	ld c,a
	inc de
	ld a,[de]
	push de
	ld d,a
	ld e,c
	call Unknown_0x2F11
	call Unknown_0x2CF7
	pop de
	jp Unknown_0x2C64

Unknown_0x2E1A:
	cp $E3
	jr nz,Unknown_0x2E31
	inc de
	ld a,[de]
	push de
	cpl
	inc a
	ld e,a
	ld d,$00
	rla
	jr nc,Unknown_0x2E2A
	dec d

Unknown_0x2E2A:
	call Unknown_0x30AA
	pop de
	jp Unknown_0x2C64

Unknown_0x2E31:
	cp $FE
	jr nz,Unknown_0x2E6B
	inc de
	ld a,[de]
	ld c,a
	push de
	ld h,$CE
	ld a,$4A
	add a,b
	ld l,a
	ld e,[hl]
	srl e
	srl e
	ld d,$00
	ld hl,$CE42
	add hl,de
	ld a,c
	rra
	jr nc,Unknown_0x2E50
	set 4,d

Unknown_0x2E50:
	rra
	jr nc,Unknown_0x2E54
	inc d

Unknown_0x2E54:
	inc e
	dec e
	jr z,Unknown_0x2E5D

Unknown_0x2E58:
	rlc d
	dec e
	jr nz,Unknown_0x2E58

Unknown_0x2E5D:
	ld a,b
	cp $04
	jr c,Unknown_0x2E66
	inc l
	inc l
	inc l
	inc l

Unknown_0x2E66:
	ld [hl],d
	pop de
	jp Unknown_0x2C64

Unknown_0x2E6B:
	cp $E1
	jr nz,Unknown_0x2E77
	inc de
	ld a,[de]
	ld [$CE00],a
	jp Unknown_0x2C64

Unknown_0x2E77:
	cp $FF
	jr nz,Unknown_0x2E8B
	ld h,$CE
	ld a,$52
	add a,b
	ld l,a
	ld [hl],$00
	add a,$18
	ld l,a
	xor a
	ld [hl],a
	jp Unknown_0x3037

Unknown_0x2E8B:
	ld hl,$CEBA
	call Unknown_0x2E94
	jp Unknown_0x2C65

Unknown_0x2E94:
	ld a,l
	add a,b
	ld l,a
	push hl
	ld a,$64
	add a,[hl]
	ld l,a
	ld a,$DD
	adc a,$00
	ld h,a
	call Unknown_0x2EAA
	ld a,l
	sub $64
	pop hl
	ld [hl],a
	ret

Unknown_0x2EAA:
	ld a,[de]
	cp $F8
	jr nz,Unknown_0x2EB7
	inc de
	ld a,[de]
	ld c,a
	inc de
	ld a,[de]
	ld d,a
	ld e,c
	ret

Unknown_0x2EB7:
	cp $FA
	jr nz,Unknown_0x2ECA
	inc de
	inc de
	inc de
	dec hl
	ld [hl],d
	dec hl
	ld [hl],e
	dec de
	ld a,[de]
	ld c,a
	dec de
	ld a,[de]
	ld e,a
	ld d,c
	ret

Unknown_0x2ECA:
	cp $FB
	jr nz,Unknown_0x2ED3
	ld e,[hl]
	inc hl
	ld d,[hl]
	inc hl
	ret

Unknown_0x2ED3:
	cp $FC
	jr nz,Unknown_0x2EE2
	inc de
	ld a,[de]
	ld c,a
	inc de
	dec hl
	ld [hl],d
	dec hl
	ld [hl],e
	dec hl
	ld [hl],c
	ret

Unknown_0x2EE2:
	cp $FD
	jr nz,Unknown_0x2EF4
	dec [hl]
	jr z,Unknown_0x2EF0
	inc hl
	ld e,[hl]
	inc hl
	ld d,[hl]
	dec hl
	dec hl
	ret

Unknown_0x2EF0:
	inc hl
	inc hl
	inc hl
	inc de

Unknown_0x2EF4:
	ret

Unknown_0x2EF5:
	ld e,a
	ld a,$B2
	add a,b
	ld l,a
	ld a,[hl]
	add a,a
	add a,$CF
	ld l,a
	ld a,$00
	adc a,$30
	ld h,a
	ld a,[hli]
	rlc e
	add a,e
	ld e,a
	ld a,[hl]
	adc a,$00
	ld h,a
	ld l,e
	ld a,[hli]
	ld d,a
	ld e,[hl]

Unknown_0x2F11:
	ld h,$CE
	ld a,$4A
	add a,b
	ld l,a
	ld a,[hl]
	cp $0A
	jr z,Unknown_0x2F23
	ld a,$03
	call Unknown_0x30BE
	jr Unknown_0x2F2D

Unknown_0x2F23:
	ld a,$00
	call Unknown_0x30BE
	ld [hl],$80
	inc l
	inc l
	inc l

Unknown_0x2F2D:
	ld a,e
	ld [hli],a
	ld [hl],d
	ret

Unknown_0x2F31:
	ld h,$CE
	ld a,$82
	add a,b
	ld l,a
	ld a,[hl]
	and a
	ret z
	cp $FF
	ret z
	dec [hl]
	ret nz
	ld a,$A2
	add a,b
	ld l,a
	ld a,[hl]
	add a,a
	add a,a
	add a,$02
	jp Unknown_0x2D04

Unknown_0x2F4B:
	ld h,$CE
	ld a,$6A
	add a,b
	ld l,a
	dec [hl]
	jr z,Unknown_0x2F56
	ret

Unknown_0x2F55:
	inc de

Unknown_0x2F56:
	ld h,$CE
	ld a,[de]
	ld c,a
	and $E0
	jr nz,Unknown_0x2F69
	ld a,c
	and $1F
	ld c,a
	ld a,$6A
	add a,b
	ld l,a
	ld [hl],c
	inc de
	ret

Unknown_0x2F69:
	cp $20
	jr nz,Unknown_0x2F86
	push bc
	push de
	call Unknown_0x309C
	call Unknown_0x30AA
	pop de
	pop bc

Unknown_0x2F77:
	ld a,[de]
	and $10
	jr z,Unknown_0x2F55
	ld h,$CE
	ld a,$6A
	add a,b
	ld l,a
	ld [hl],$01
	inc de
	ret

Unknown_0x2F86:
	cp $40
	jr nz,Unknown_0x2F90
	ld a,c
	and $0F
	jp Unknown_0x2FAE

Unknown_0x2F90:
	cp $60
	jr nz,Unknown_0x2FB6
	push de
	call Unknown_0x309C
	ld h,$CE
	ld a,$9A
	add a,b
	ld l,a
	ld a,[hl]
	and $0F
	add a,e
	bit 7,a
	jr z,Unknown_0x2FA7
	xor a

Unknown_0x2FA7:
	cp $10
	jr c,Unknown_0x2FAD
	ld a,$0F

Unknown_0x2FAD:
	pop de

Unknown_0x2FAE:
	push de
	call Unknown_0x3037
	pop de
	jp Unknown_0x2F77

Unknown_0x2FB6:
	cp $80
	jr nz,Unknown_0x300D
	ld h,$CE
	ld a,$4A
	add a,b
	ld l,a
	ld a,[hl]
	cp $0A
	jr z,Unknown_0x2FD8
	ld a,$01
	call Unknown_0x30BE
	ld a,c
	rrca
	rrca
	and $C0
	ld c,a
	ld a,[hl]
	and $3F
	or c
	ld [hl],a
	jp Unknown_0x2F77

Unknown_0x2FD8:
	ld a,c
	and $0F
	ld hl,$CED2
	cp [hl]
	jr z,Unknown_0x2FFE
	push de
	ld [hl],a
	swap a
	ld e,a
	ld d,$00
	ld hl,$DDE5
	add hl,de
	xor a
	ld [$FF00+$1A],a
	call Unknown_0x3001
	ld a,$80
	ld [$FF00+$1A],a
	ld a,[$CE14]
	set 7,a
	ld [$FF00+$1E],a
	pop de

Unknown_0x2FFE:
	jp Unknown_0x2F77

Unknown_0x3001:
	ld de,$FF30
	ld c,$10

Unknown_0x3006:
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,Unknown_0x3006
	ret

Unknown_0x300D:
	cp $E0
	jr nz,Unknown_0x3036
	ld a,c
	cp $F0
	jr nz,Unknown_0x3022
	inc de
	ld a,[de]
	ld c,a
	ld a,$00
	call Unknown_0x30B6
	ld [hl],c
	jp Unknown_0x2F55

Unknown_0x3022:
	cp $FF
	jr nz,Unknown_0x302D
	ld a,$6A
	add a,b
	ld l,a
	ld [hl],$00
	ret

Unknown_0x302D:
	ld hl,$CEC2
	call Unknown_0x2E94
	jp Unknown_0x2F56

Unknown_0x3036:
	ret

Unknown_0x3037:
	ld c,a
	ld h,$CE
	ld a,$9A
	add a,b
	ld l,a
	ld a,[hl]
	and $F0
	or c
	ld [hl],a

Unknown_0x3043:
	push de
	ld a,$FF
	sub [hl]
	swap a
	and $0F
	ld e,a
	ld a,[hl]
	and $0F
	sub e
	ld e,a
	jr nc,Unknown_0x3055
	ld e,$00

Unknown_0x3055:
	push hl
	ld hl,$CE01
	ld a,b
	cp $04
	jr c,Unknown_0x305F
	inc l

Unknown_0x305F:
	ld a,$FF
	sub [hl]
	swap a
	and $0F
	ld d,a
	pop hl
	ld a,e
	sub d
	jr nc,Unknown_0x306D
	xor a

Unknown_0x306D:
	ld e,a
	ld a,$4A
	add a,b
	ld l,a
	ld a,[hl]
	cp $0A
	jr z,Unknown_0x3085
	ld a,$02
	call Unknown_0x30BE
	swap e
	ld a,[hl]
	and $0F
	or e
	ld [hl],a
	pop de
	ret

Unknown_0x3085:
	srl e
	srl e
	ld d,$00
	ld hl,Unknown_0x3098
	add hl,de
	ld e,[hl]
	ld a,$02
	call Unknown_0x30B6
	ld [hl],e
	pop de
	ret

Unknown_0x3098:
INCBIN "baserom.gb", $3098, $309C - $3098

Unknown_0x309C:
	ld a,c
	and $0F
	ld d,$00
	bit 3,a
	jr z,Unknown_0x30A8
	or $F0
	dec d

Unknown_0x30A8:
	ld e,a
	ret

Unknown_0x30AA:
	ld a,$03
	call Unknown_0x30B6
	ld a,e
	add a,[hl]
	ld [hli],a
	ld a,d
	adc a,[hl]
	ld [hl],a
	ret

Unknown_0x30B6:
	push af
	ld h,$CE
	ld a,$4A
	add a,b
	ld l,a
	pop af

Unknown_0x30BE:
	add a,[hl]

Unknown_0x30BF:
	ld hl,$FF99
	add a,[hl]
	ld l,a
	ld h,$CE
	ret

UnknownData_0x30C7:
INCBIN "baserom.gb", $30C7, $30E0 - $30C7

Unknown_0x30E0:
	push de
	ld l,c
	ld d,b
	ld e,$00
	jr Unknown_0x30F4

Unknown_0x30E7:
	ld a,c
	add a,l
	daa
	ld c,a
	ld a,b
	adc a,d
	daa
	ld b,a
	ld a,e
	adc a,$00
	daa
	ld e,a

Unknown_0x30F4:
	dec h
	jr nz,Unknown_0x30E7
	ld hl,$DEDD
	ld a,[hl]
	add a,c
	daa
	ld [hld],a
	ld a,[hl]
	adc a,b
	daa
	ld [hld],a
	ld a,[hl]
	adc a,e
	daa
	ld [hl],a
	jr c,Unknown_0x310F
	ld hl,$DEDE

Unknown_0x310B:
	set 0,[hl]
	pop de
	ret

Unknown_0x310F:
	ld a,$99
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld e,$21
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld hl,$A084
	ld a,[hl]
	cp $99
	jr nc,Unknown_0x3129
	and a
	inc a
	daa

Unknown_0x3129:
	ld [hl],a
	ld hl,$DEDE
	set 2,[hl]
	jr Unknown_0x310B

Unknown_0x3131:
	xor a
	ld [$DEDE],a
	ld hl,$9C21
	ld c,$70
	ld de,$DEDB
	ld a,[de]
	ld b,a
	inc de
	ld b,a
	swap a
	and $0F
	add a,c
	ld [hli],a
	ld a,b
	and $0F
	add a,c
	ld [hli],a
	ld a,[de]
	inc de
	ld b,a
	swap a
	and $0F
	add a,c
	ld [hli],a
	ld a,b
	and $0F
	add a,c
	ld [hli],a
	ld a,[de]
	ld b,a
	swap a
	and $0F
	add a,c
	ld [hli],a
	ld a,b
	and $0F
	add a,c
	ld [hli],a
	ld a,c
	ld [hl],a
	ld hl,$9C02
	ld a,[$A071]
	and a
	jr nz,Unknown_0x3178
	ld a,[$DEE3]
	rra
	jr Unknown_0x317B

Unknown_0x3178:
	ld a,[$DEE5]

Unknown_0x317B:
	ld d,$06
	and a
	jr z,Unknown_0x3187

Unknown_0x3180:
	ld [hl],$64
	inc hl
	dec d
	dec a
	jr nz,Unknown_0x3180

Unknown_0x3187:
	ld a,d
	and a
	jr z,Unknown_0x3191

Unknown_0x318B:
	ld [hl],$63
	inc hl
	dec d
	jr nz,Unknown_0x318B

Unknown_0x3191:
	ld hl,$9C09
	ld de,$DEE1
	ld a,[de]
	and a
	ld b,a
	ld c,$07
	ld a,$68

Unknown_0x319E:
	jr z,Unknown_0x31A7
	ld [hli],a
	dec c
	dec b
	jr nz,Unknown_0x319E
	jr Unknown_0x31AD

Unknown_0x31A7:
	ld a,$67

Unknown_0x31A9:
	ld [hli],a
	dec c
	jr nz,Unknown_0x31A9

Unknown_0x31AD:
	ld hl,$9C2A
	ld de,$A084
	ld a,[de]
	ld d,$70
	ld e,a
	swap a
	and $0F
	add a,d
	ld [hli],a
	ld a,e
	and $0F
	add a,d
	ld [hl],a
	ld hl,$9C2F
	ld a,[$DB60]
	inc a
	ld e,$70
	add a,e
	ld [hl],a

Unknown_0x31CD:
	ld bc,$9690
	ld de,$DEE0
	ld a,[de]
	swap a
	ld l,a
	and $0F
	ld h,a
	ld a,l
	and $F0
	ld l,a
	sla l
	rl h
	sla l
	rl h
	ld a,[$FF00+$A4]
	push af
	ld a,$07
	call Unknown_0x05DD
	ld de,Unknown_0x1D7DC
	add hl,de
	ld d,$40

Unknown_0x31F4:
	ld a,[hli]
	ld [bc],a
	inc c
	dec d
	jr nz,Unknown_0x31F4
	pop af
	jp Unknown_0x05DD

UnknownData_0x31FE:
INCBIN "baserom.gb", $31FE, $3212 - $31FE
	ld a,$01
	ld [$DF03],a
	ld a,$E4
	ld [$CD09],a
	ld a,$D0
	ld [$CD0A],a
	ld a,$90
	ld [$CD0B],a
	call Unknown_0x33CB
	ld e,$15
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	ld a,$0F
	call Unknown_0x05DD
	ld hl,Unknown_0x3C983
	ld de,$8000
	call Unknown_0x0708
	ld bc,$31FE
	ld a,[$A071]
	ld d,a
	add a,a
	add a,a
	add a,d
	add a,c
	ld c,a
	jr nc,Unknown_0x3250
	inc b

Unknown_0x3250:
	ld a,[bc]
	inc bc
	push bc
	call Unknown_0x05DD
	pop bc
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld de,$8200
	call Unknown_0x0708
	ld a,[$A071]
	and a
	pop bc
	jr z,Unknown_0x3276
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	ld de,$8E00
	call Unknown_0x0708

Unknown_0x3276:
	ld a,$08
	call Unknown_0x05DD
	call Unknown_0x20000
	ld a,$92
	ld [$DB5E],a
	ld bc,$0060
	ld de,$0240
	ld a,$CE
	ld hl,$A0A1
	call Unknown_0x07C4
	ld a,$0A
	ld [$DB58],a
	call Unknown_0x05DD
	ld hl,Unknown_0x2B81C
	call Unknown_0x1289
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C1DC
	ld a,$67
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld e,$04
	ld hl,$424E
	ld a,$1A
	call Unknown_0x05CF

Unknown_0x32B8:
	call Unknown_0x0496
	call Unknown_0x086B
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C259
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C3CB
	call Unknown_0x04AE
	ld hl,Unknown_0x1DB85
	ld a,$07
	call Unknown_0x05CF
	ld hl,Unknown_0x1DBD2
	ld a,$07
	call Unknown_0x05CF
	call Unknown_0x0343
	ld hl,$DD2D
	ld a,[hl]
	and a
	jr nz,Unknown_0x32F1
	ld a,[$DA46]
	and a
	jr nz,Unknown_0x32B8

Unknown_0x32F1:
	ld e,$04
	ld hl,$4280
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ret
	ld a,$FF
	ld [$FF00+$45],a
	ld [$DA29],a
	ld a,$00
	ld [$DF03],a
	ld a,$E4
	ld [$CD09],a
	ld a,$E0
	ld [$CD0A],a
	ld a,$E4
	ld [$CD0B],a
	call Unknown_0x33CB
	ld e,$1C
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	ld a,$47
	ld [$FF00+$40],a
	ld a,$0F
	call Unknown_0x05DD
	ld hl,Unknown_0x3C000
	ld de,$8000
	call Unknown_0x0708
	ld a,$08
	call Unknown_0x05DD
	call Unknown_0x20000
	ld a,$0F
	call Unknown_0x05DD
	ld hl,$6111
	ld a,[$DB60]
	add a,a
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x3353
	inc h

Unknown_0x3353:
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld e,a
	ld a,[hl]
	ld d,a
	ld a,$9A
	ld hl,$A0A1
	call Unknown_0x07C4
	call Unknown_0x34CC
	call Unknown_0x33D5
	call Unknown_0x3467
	call Unknown_0x3492
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C1DC
	call Unknown_0x046D
	ld a,[$DB60]
	ld e,a
	ld hl,$6011
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$DB60]
	add a,$1B
	ld d,a
	ld e,$04
	ld hl,$4246
	ld a,$1A
	call Unknown_0x05CF

Unknown_0x3396:
	call Unknown_0x0496
	call Unknown_0x086B
	ld a,$07
	call Unknown_0x05DD
	call Unknown_0x1C259
	call Unknown_0x04AE
	call Unknown_0x0343
	ld hl,$DD2D
	ld a,[hl]
	and a
	jr nz,Unknown_0x33B7
	ld a,[$DA46]
	and a
	jr nz,Unknown_0x3396

Unknown_0x33B7:
	ld a,[$DB60]
	add a,$1B
	ld d,a
	ld e,$04
	ld hl,$427B
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ret

Unknown_0x33CB:
	ld hl,$DD2D
	xor a
	ld [hl],a
	ld hl,$FFA5
	ld [hl],a
	ret

Unknown_0x33D5:
	call Unknown_0x34A3
	ld a,[hli]
	ld [$DB3D],a
	ld c,a
	ld a,[hli]
	ld [$DB3E],a
	push hl
	ld b,a
	ld hl,$CD2D
	ld a,$B3
	jr Unknown_0x33EB

Unknown_0x33EA:
	add a,c

Unknown_0x33EB:
	ld [hli],a
	dec b
	jr nz,Unknown_0x33EA
	pop hl
	ld c,$04
	ld de,$DB45

Unknown_0x33F5:
	ld a,[hli]
	swap a
	ld b,a
	and $F0
	ld [de],a
	inc de
	ld a,b
	and $0F
	ld [de],a
	inc de
	dec c
	jr nz,Unknown_0x33F5
	push hl
	ld bc,$000A
	add hl,bc
	ld de,$B300
	call Unknown_0x0708
	pop hl
	inc hl
	inc hl
	ld a,[hld]
	ld b,a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	call Unknown_0x05DD
	ld bc,$0003
	add hl,bc
	push hl
	ld a,[hli]
	ld [$DB5C],a
	ld de,$CF00
	call Unknown_0x0708
	ld c,$05
	ld hl,$CF00
	ld de,$C500

Unknown_0x3433:
	ld a,[$DB5C]
	ld b,a

Unknown_0x3437:
	ld a,[hli]
	ld [de],a
	inc e
	dec b
	jr nz,Unknown_0x3437
	ld e,$00
	inc d
	dec c
	jr nz,Unknown_0x3433
	pop hl
	dec hl
	ld a,[hld]
	ld b,a
	ld a,[hld]
	ld l,[hl]
	ld h,a
	ld a,b
	call Unknown_0x05DD
	inc hl
	xor a
	ld [$DB59],a
	ld a,[$DF03]
	and a
	jr nz,Unknown_0x3460
	ld de,$8800
	call Unknown_0x0708
	ret

Unknown_0x3460:
	ld de,$9000
	call Unknown_0x0708
	ret

Unknown_0x3467:
	ld de,$A004
	ld hl,$DB51
	ld a,[de]
	inc e
	sub $50
	ld [hli],a
	ld a,[de]
	inc e
	sbc a,$00
	ld [hli],a
	xor a
	ld [hli],a
	ld [hl],a
	jp Unknown_0x1513

Unknown_0x347D:
	ld hl,$DB51
	xor a
	ld [hli],a
	ld [hli],a
	ld de,$A007
	ld a,[de]
	inc e
	sub $40
	ld [hli],a
	ld a,[de]
	sbc a,$00
	ld [hl],a
	jp Unknown_0x1513

Unknown_0x3492:
	ld hl,$DB51
	ld a,[hli]
	and $F0
	ld [$DB55],a
	inc hl
	ld a,[hl]
	and $F0
	ld [$DB56],a
	ret

Unknown_0x34A3:
	ld a,$0F
	call Unknown_0x05DD
	ld a,[$DB6A]
	and $7F
	ld b,$00

Unknown_0x34AF:
	srl a
	jr nc,Unknown_0x34B6
	inc b
	jr Unknown_0x34AF

Unknown_0x34B6:
	ld a,b
	add a,a
	add a,b
	ld hl,$612D
	add a,l
	ld l,a
	jr nc,Unknown_0x34C1
	inc h

Unknown_0x34C1:
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld a,[hl]
	ld h,b
	ld l,c
	call Unknown_0x05DD
	ret

Unknown_0x34CC:
	ld a,[$DD63]
	ld b,a
	ld a,$00

Unknown_0x34D2:
	ld hl,$6111
	rr b
	call c,Unknown_0x34E0
	inc a
	cp $07
	ret z
	jr Unknown_0x34D2

Unknown_0x34E0:
	push bc
	push af
	add a,a
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x34E9
	inc h

Unknown_0x34E9:
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld e,a
	ld a,[hl]
	ld d,a
	ld a,$9D
	ld h,$A8
	ld l,$B2
	call Unknown_0x07C4
	pop af
	pop bc
	ret

Unknown_0x34FD:
	ld a,[$FF00+$A4]
	push af
	ld a,[$A069]
	call Unknown_0x05DD
	ld h,d
	ld l,$6A
	ld a,[hli]
	or [hl]
	ld a,[$FF00+$92]
	ld c,a
	ld a,[$DA1C]
	jr nz,Unknown_0x351C
	cp c
	jr nz,Unknown_0x3563
	ld l,$64
	ld [hl],$00
	jr Unknown_0x3563

Unknown_0x351C:
	sub c
	dec a
	cp $04
	jr c,Unknown_0x3563
	sub $03
	ld e,a
	ld a,[hld]
	or a
	jr nz,Unknown_0x352E
	ld a,[hl]
	cp e
	jr nc,Unknown_0x352E
	ld e,a

Unknown_0x352E:
	ld a,[hl]
	sub e
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hl],a
	ld b,$C4
	ld l,$65
	ld a,[hli]
	ld [bc],a
	inc c
	ld a,[hli]
	ld [bc],a
	inc c
	ld a,e
	ld [bc],a
	ld [$FF00+$84],a
	inc c
	ld a,[hli]
	ld h,[hl]
	ld l,a

Unknown_0x3547:
	ld a,[hli]
	ld [bc],a
	inc c
	dec e
	jr nz,Unknown_0x3547
	ld a,c
	ld [$FF00+$92],a
	ld e,$65
	ld a,[$FF00+$84]
	ld c,a
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,$00
	ld [de],a
	inc e
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a

Unknown_0x3563:
	pop af
	call Unknown_0x05DD
	ret
	ld a,[bc]
	ld [$DF11],a
	inc bc
	ld hl,Unknown_0x6B48B
	ld a,$07
	call Unknown_0x05CF
	ret
	ld hl,$7452
	ld a,$07
	call Unknown_0x05CF
	ret
	ld hl,Unknown_0x746C
	ld a,$07
	call Unknown_0x05CF
	ret
	ld a,[$A071]
	or a
	jr nz,Unknown_0x3594
	ld hl,$A04C
	ld [hl],$0C
	ret

Unknown_0x3594:
	ld hl,$A072
	ld [hl],$06
	ret

Unknown_0x359A:
	ld hl,$FFB4
	ld a,[$FF00+$A6]
	or [hl]
	ld [hl],a
	ret

Unknown_0x35A2:
	xor a
	ld [$FF00+$B4],a
	ret
	ld a,[$DB60]
	sub $02
	ld e,$27
	ld [de],a
	ret

Unknown_0x35AF:
	ld e,$07
	ld a,[de]
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	adc a,$00
	ld [de],a
	ret

Unknown_0x35BB:
	ld e,$87
	call Unknown_0x35E2
	ld a,[$A071]
	push bc
	ld hl,$35DC
	add a,l
	ld l,a
	jr nc,Unknown_0x35CC
	inc h

Unknown_0x35CC:
	ld a,[hl]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld h,d
	ld l,$8B
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	pop bc
	ret

UnknownData_0x35DC:
INCBIN "baserom.gb", $35DC, $35E0 - $35DC
	ld e,$03

Unknown_0x35E2:
	xor a
	ld [de],a
	inc e
	ld hl,$DB51
	ld a,[bc]
	add a,[hl]
	ld [de],a
	inc hl
	inc e
	inc bc
	ld a,[bc]
	adc a,[hl]
	ld [de],a
	inc hl
	inc e
	xor a
	ld [de],a
	inc e
	inc bc
	ld a,[bc]
	add a,[hl]
	ld [de],a
	inc hl
	inc e
	inc bc
	ld a,[bc]
	adc a,[hl]
	ld [de],a
	inc bc
	ret

Unknown_0x3602:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0x3613
	bit 4,a
	ld a,$40
	jr nz,Unknown_0x3610
	ld a,$C0

Unknown_0x3610:
	ld e,$45
	ld [de],a

Unknown_0x3613:
	ret

Unknown_0x3614:
	ld e,$7D
	ld a,[de]
	rra
	ret

Unknown_0x3619:
	ld a,[$DA36]
	or a
	jr nz,Unknown_0x3627
	ld a,[$FF00+$A5]
	and $40
	jr z,Unknown_0x3627
	scf
	ret

Unknown_0x3627:
	and a
	ret

Unknown_0x3629:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x3646
	ld a,[$A071]
	ld hl,$3648
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x363B
	inc h

Unknown_0x363B:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call Unknown_0x0620
	call Unknown_0xB53A
	jr nc,Unknown_0x3648

Unknown_0x3646:
	and a
	ret

Unknown_0x3648:
	scf
	ret

UnknownData_0x364A:
INCBIN "baserom.gb", $364A, $3650 - $364A

Unknown_0x3650:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x3664
	ld hl,$A500

Unknown_0x3659:
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x3669
	inc h
	ld a,h
	cp $A8
	jr nz,Unknown_0x3659

Unknown_0x3664:
	call Unknown_0x35A2
	and a
	ret

Unknown_0x3669:
	scf
	ret

Unknown_0x366B:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x3686
	ld a,[$A05B]
	cp $03
	jr z,Unknown_0x368D
	ld hl,$A500

Unknown_0x367B:
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x368B
	inc h
	ld a,h
	cp $A8
	jr nz,Unknown_0x367B

Unknown_0x3686:
	call Unknown_0x35A2
	and a
	ret

Unknown_0x368B:
	scf
	ret

Unknown_0x368D:
	ld hl,$A500

Unknown_0x3690:
	ld a,[hl]
	cp $FF
	jr nz,Unknown_0x3686
	inc h
	ld a,h
	cp $A8
	jr nz,Unknown_0x3690
	jr Unknown_0x368B

Unknown_0x369D:
	ld a,[$FF00+$A5]
	and $80
	jr nz,Unknown_0x36A5
	and a
	ret

Unknown_0x36A5:
	ld h,d
	ld e,$4D
	ld a,[de]
	cp $02
	jr nz,Unknown_0x36E4
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld a,[$FF00+$B1]
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr nc,Unknown_0x36C8
	ld a,[$FF00+$9E]
	cp $02
	jr nz,Unknown_0x36E1

Unknown_0x36C8:
	ld a,[$FF00+$B3]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0x36DC
	ld a,[$FF00+$9E]
	cp $02
	jr nz,Unknown_0x36E1

Unknown_0x36DC:
	ld a,[$FF00+$9A]
	ld d,a
	scf
	ret

Unknown_0x36E1:
	ld a,[$FF00+$9A]
	ld d,a

Unknown_0x36E4:
	and a
	ret

Unknown_0x36E6:
	ld a,[$FF00+$A5]
	and $40
	jr nz,Unknown_0x36EE
	and a
	ret

Unknown_0x36EE:
	ld h,d
	ld l,$04
	ld c,[hl]
	inc l
	ld b,[hl]
	ld l,$07
	ld e,[hl]
	inc l
	ld d,[hl]
	call Unknown_0x1646
	cp $10
	jr z,Unknown_0x3716
	cp $90
	jr z,Unknown_0x3716
	cp $18
	jr z,Unknown_0x370D

Unknown_0x3708:
	and a
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x370D:
	ld a,[$DB60]
	call Unknown_0x1611
	or a
	jr nz,Unknown_0x3708

Unknown_0x3716:
	ld a,[$CD4D]
	or a
	jr nz,Unknown_0x3708
	call Unknown_0x1067
	scf
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x3724:
	ld a,[$FF00+$A6]
	and $04
	jr nz,Unknown_0x372C
	and a
	ret

Unknown_0x372C:
	ld e,$28
	ld hl,Unknown_0x4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	scf
	ret

Unknown_0x373B:
	ld e,$45
	ld a,[de]
	rla
	ld a,[$FF00+$A5]
	ld b,$10
	jr c,Unknown_0x3747
	ld b,$20

Unknown_0x3747:
	and b
	jr nz,Unknown_0x374C
	and a
	ret

Unknown_0x374C:
	scf
	ret

Unknown_0x374E:
	call Unknown_0x3847
	ld e,$6D
	ld a,[de]
	cp h
	jr nz,Unknown_0x3759
	and a
	ret

Unknown_0x3759:
	scf
	ret

Unknown_0x375B:
	ld a,[$FF00+$A5]
	and $02
	jr z,Unknown_0x3763
	and a
	ret

Unknown_0x3763:
	scf
	ret

Unknown_0x3765:
	ld a,[$A070]
	or a
	jr nz,Unknown_0x377A
	call Unknown_0x1AB3
	jr nz,Unknown_0x377A
	ld e,$00
	ld bc,$0140
	call Unknown_0x0D35
	scf
	ret

Unknown_0x377A:
	and a
	ret

Unknown_0x377C:
	ld a,[$A070]
	or a
	jr nz,Unknown_0x3784

Unknown_0x3782:
	and a
	ret

Unknown_0x3784:
	call Unknown_0x1AB3
	jr z,Unknown_0x3782
	scf
	ret

Unknown_0x378B:
	ld a,[$A070]
	or a
	jr nz,Unknown_0x37A6
	call Unknown_0x1AB3
	jr nz,Unknown_0x37A6
	call Unknown_0x3A48
	call Unknown_0x3C5A
	ld e,$00
	ld bc,$0140
	call Unknown_0x0D35
	scf
	ret

Unknown_0x37A6:
	and a
	ret

Unknown_0x37A8:
	ld a,[$A070]
	or a
	jr nz,Unknown_0x37B0

Unknown_0x37AE:
	and a
	ret

Unknown_0x37B0:
	call Unknown_0x1AB3
	jr z,Unknown_0x37AE
	call Unknown_0x3A57
	call Unknown_0x3C5A
	scf
	ret

Unknown_0x37BD:
	ld a,[$FF00+$A5]
	and $41
	jr nz,Unknown_0x37C5
	and a
	ret

Unknown_0x37C5:
	xor a
	ld [$A06E],a
	scf
	ret

Unknown_0x37CB:
	ld a,[$FF00+$A5]
	ld b,$00
	and $F1
	jr z,Unknown_0x37DF
	ld b,$02
	bit 0,a
	jr nz,Unknown_0x37DF
	dec b
	bit 7,a
	jr nz,Unknown_0x37DF
	inc b

Unknown_0x37DF:
	ld e,$6F
	ld a,[de]
	cp b
	jr nz,Unknown_0x37E7
	and a
	ret

Unknown_0x37E7:
	ld a,b
	ld [de],a
	scf
	ret

Unknown_0x37EB:
	ld e,$0F
	ld a,[de]
	sub c
	inc e
	ld a,[de]
	sbc a,b
	ccf
	ret

Unknown_0x37F4:
	call Unknown_0x0846

Unknown_0x37F7:
	ld a,$08
	call Unknown_0x05DD
	jp Unknown_0x23358
	ld e,$45
	ld a,[de]
	xor $80
	ld [de],a
	ret
	ld a,[$A05B]
	ld e,$27
	inc a
	ld [de],a
	ret
	ld a,[$FF00+$A5]
	and $40
	jr z,Unknown_0x3818
	ld a,[$A070]
	dec a

Unknown_0x3818:
	ld e,$27
	ld [de],a
	ret
	call Unknown_0x3826
	ld a,$00
	rla
	ld e,$27
	ld [de],a
	ret

Unknown_0x3826:
	ld e,$45
	ld a,[de]
	rla
	ld a,[$FF00+$A5]
	jr c,Unknown_0x3834
	bit 4,a
	jr nz,Unknown_0x383A
	jr Unknown_0x3838

Unknown_0x3834:
	bit 5,a
	jr nz,Unknown_0x383A

Unknown_0x3838:
	and a
	ret

Unknown_0x383A:
	scf
	ret
	call Unknown_0x3847
	ld e,$27
	ld a,h
	ld [de],a
	ld e,$6D
	ld [de],a
	ret

Unknown_0x3847:
	ld e,$4D
	ld a,[de]
	cp $04
	ld h,$00
	jr c,Unknown_0x3861
	ld e,$45
	ld a,[de]
	jr nz,Unknown_0x385C
	inc h
	rla
	jr nc,Unknown_0x3861
	inc h
	jr Unknown_0x3861

Unknown_0x385C:
	inc h
	rla
	jr c,Unknown_0x3861
	inc h

Unknown_0x3861:
	ld e,$4E
	ld a,[de]
	and $F0
	cp $70
	ret nz
	ld a,h
	add a,$03
	ld h,a
	ret

Unknown_0x386E:
	ld e,$45
	ld a,[de]
	rla
	ld a,[$FF00+$A5]
	jr c,Unknown_0x387E
	bit 4,a
	jr z,Unknown_0x3890
	ld e,h
	jp Unknown_0x0CA2

Unknown_0x387E:
	bit 5,a
	jr z,Unknown_0x3890
	ld e,h
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a
	jp Unknown_0x0CD3

Unknown_0x3890:
	ld e,l
	jp Unknown_0x0D04

Unknown_0x3894:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0x38B8
	bit 4,a
	ld e,$45
	jr z,Unknown_0x38A7
	ld a,$40
	ld [de],a
	ld e,h
	jp Unknown_0x0CA2

Unknown_0x38A7:
	ld a,$C0
	ld [de],a
	ld e,h
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a
	jp Unknown_0x0CD3

Unknown_0x38B8:
	ld e,l
	jp Unknown_0x0D04

Unknown_0x38BC:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0x38FD
	bit 4,a
	ld e,$45
	ld a,[de]
	jr z,Unknown_0x38DA
	rla
	jr c,Unknown_0x38D2
	ld a,[$FF00+$85]
	ld e,a
	jp Unknown_0x0CA2

Unknown_0x38D2:
	ld a,[$FF00+$86]
	ld e,a
	ld b,h
	ld c,l
	jp Unknown_0x0CA2

Unknown_0x38DA:
	rla
	jr nc,Unknown_0x38ED
	ld a,[$FF00+$85]
	ld e,a
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a
	jp Unknown_0x0CD3

Unknown_0x38ED:
	ld a,[$FF00+$86]
	ld e,a
	ld a,l
	cpl
	add a,$01
	ld c,a
	ld a,h
	cpl
	adc a,$00
	ld b,a
	jp Unknown_0x0CD3

Unknown_0x38FD:
	ld e,$45
	ld a,[de]
	rla
	ld e,$0D
	ld a,[de]
	jr c,Unknown_0x390B
	rla
	jr nc,Unknown_0x390E
	jr Unknown_0x3914

Unknown_0x390B:
	rla
	jr nc,Unknown_0x3914

Unknown_0x390E:
	ld a,[$FF00+$80]
	ld e,a
	jp Unknown_0x0D04

Unknown_0x3914:
	ld a,[$FF00+$81]
	ld e,a
	jp Unknown_0x0D04

Unknown_0x391A:
	call Unknown_0xB6DF
	jr Unknown_0x3927

Unknown_0x391F:
	call Unknown_0x1DC7
	jr Unknown_0x3927

Unknown_0x3924:
	call Unknown_0x1D8B

Unknown_0x3927:
	jr nc,Unknown_0x393C
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$0E
	ld a,[de]
	xor b
	rla
	jr c,Unknown_0x393A
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a

Unknown_0x393A:
	scf
	ret

Unknown_0x393C:
	and a
	ret

Unknown_0x393E:
	call Unknown_0xB766
	jr Unknown_0x3946

Unknown_0x3943:
	call Unknown_0x1C0A

Unknown_0x3946:
	jr nc,Unknown_0x3950
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0x3950:
	and a
	ret

Unknown_0x3952:
	call Unknown_0xB766
	jr Unknown_0x395A

Unknown_0x3957:
	call Unknown_0x1C0A

Unknown_0x395A:
	jr nc,Unknown_0x3970
	ld a,[$FF00+$9E]
	cp $01
	jr z,Unknown_0x3968
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a

Unknown_0x3968:
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0x3970:
	and a
	ret

Unknown_0x3972:
	call Unknown_0xB7DD
	jr Unknown_0x397A

Unknown_0x3977:
	call Unknown_0x1C88

Unknown_0x397A:
	jr nc,Unknown_0x398B
	ld a,[$FF00+$9F]
	cp $31
	call z,Unknown_0x3C63
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0x398B:
	and a
	ret

Unknown_0x398D:
	call Unknown_0xB7DD
	jr Unknown_0x3995

Unknown_0x3992:
	call Unknown_0x1C88

Unknown_0x3995:
	jr nc,Unknown_0x39BA
	ld a,[$FF00+$9F]
	cp $31
	call z,Unknown_0x3C63
	ld h,d
	ld l,$10
	ld a,[hld]
	rla
	jr c,Unknown_0x39B2
	ld a,[hli]
	sub $B3
	ld a,[hl]
	sbc a,$00
	jr c,Unknown_0x39B2
	ld e,$52
	ld a,$02
	ld [de],a

Unknown_0x39B2:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0x39BA:
	and a
	ret

Unknown_0x39BC:
	call Unknown_0xB766
	jr Unknown_0x39C4

Unknown_0x39C1:
	call Unknown_0x1C0A

Unknown_0x39C4:
	jr nc,Unknown_0x39EE
	ld h,d
	ld l,$10
	ld a,[hld]
	rla
	jr nc,Unknown_0x39DA
	ld a,[hli]
	sub $40
	ld a,[hl]
	sbc a,$FF
	jr nc,Unknown_0x39DA
	ld a,$01
	ld e,$52
	ld [de],a

Unknown_0x39DA:
	ld a,[$FF00+$9E]
	cp $01
	jr z,Unknown_0x39E6
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a

Unknown_0x39E6:
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0x39EE:
	and a
	ret
	ld a,[$A058]
	bit 7,a
	ld h,$00
	jr nz,Unknown_0x3A02
	inc h
	ld a,[$A059]
	cp $02
	jr c,Unknown_0x3A02
	inc h

Unknown_0x3A02:
	ld e,$27
	ld a,h
	ld [de],a
	ret
	ld a,[$A058]
	ld [$A05B],a
	ld a,[$A05A]
	ld [$A05C],a
	xor a
	ld [$A074],a
	ret
	ld e,$56
	ld a,[de]
	cp $02
	jr nc,Unknown_0x3A20
	xor a

Unknown_0x3A20:
	ld e,$27
	ld [de],a
	ret

Unknown_0x3A24:
	ld a,[$A070]
	or a
	jr nz,Unknown_0x3A46
	call Unknown_0x1AB3
	jr nz,Unknown_0x3A46
	ld e,$00
	ld bc,$0140
	call Unknown_0x0D35
	call Unknown_0x2809
	jr c,Unknown_0x3A3E
	scf
	ret

Unknown_0x3A3E:
	ld a,$01
	ld [$A070],a
	call Unknown_0x3C5A

Unknown_0x3A46:
	and a
	ret

Unknown_0x3A48:
	ld a,$0C
	ld [$A06E],a
	xor a
	ld [$A06F],a
	ld a,$01
	ld [$A070],a
	ret

Unknown_0x3A57:
	xor a
	ld [$A070],a
	ret

UnknownData_0x3A5C:
INCBIN "baserom.gb", $3A5C, $3A6B - $3A5C
	push bc
	ld a,[$A071]
	ld hl,$3A87
	add a,l
	ld l,a
	jr nc,Unknown_0x3A77
	inc h

Unknown_0x3A77:
	ld a,[hl]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld h,d
	ld l,$07
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	pop bc
	ret

UnknownData_0x3A87:
INCBIN "baserom.gb", $3A87, $3A8B - $3A87

Unknown_0x3A8B:
	ld a,[$A071]
	or a
	ld hl,$A04C
	jr z,Unknown_0x3A9D
	ld a,b
	srl a
	adc a,$00
	ld b,a
	ld hl,$A072

Unknown_0x3A9D:
	ld a,[hl]
	sub b
	ld [hl],a
	jr nc,Unknown_0x3AA4
	xor a
	ld [hl],a

Unknown_0x3AA4:
	ld a,$01
	ld [$A054],a
	ret

Unknown_0x3AAA:
	ld [$A062],a
	ld a,[hli]
	ld [$A05D],a
	ld e,$45
	ld a,[de]
	rla
	ld a,[hli]
	jr nc,Unknown_0x3ABA
	cpl
	inc a

Unknown_0x3ABA:
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$04
	ld a,[de]
	inc e
	add a,c
	ld [$A05E],a
	ld a,[de]
	adc a,b
	ld [$A05F],a
	ld a,[hli]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$07
	ld a,[de]
	inc e
	add a,c
	ld [$A060],a
	ld a,[de]
	adc a,b
	ld [$A061],a
	ld a,[hli]
	ld [$FF00+$A2],a
	ld a,[hl]
	ld [$FF00+$A3],a
	ret

Unknown_0x3AE4:
	ld a,[$A05B]
	jr Unknown_0x3AEB

Unknown_0x3AE9:
	ld a,$FF

Unknown_0x3AEB:
	ld [$DF15],a
	ld a,[$A05D]
	inc a
	jr nz,Unknown_0x3AF6
	and a
	ret

Unknown_0x3AF6:
	xor a
	ld [$DF0B],a
	ld hl,$FFA3
	ld e,$60
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	ld a,[de]
	sbc a,$00
	ld b,a
	ld a,c
	and $F0
	ld c,a
	push bc
	dec e
	ld a,[de]
	add a,[hl]
	sub c
	swap a
	and $0F
	inc a
	ld [$DF0E],a
	dec l
	ld e,$5E
	ld a,[de]
	sub [hl]
	ld [$DF0F],a
	ld c,a
	inc e
	ld a,[de]
	sbc a,$00
	ld [$DF10],a
	ld b,a
	ld a,c
	and $F0
	ld c,a
	dec e
	ld a,[de]
	add a,[hl]
	sub c
	swap a
	and $0F
	inc a
	ld [$DF0C],a
	ld [$DF0D],a
	pop de
	jr Unknown_0x3B5B

Unknown_0x3B3F:
	ld hl,$DF0F
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld a,[$DF0C]
	ld [$DF0D],a
	ld a,e
	add a,$10
	ld e,a
	jr nc,Unknown_0x3B52
	inc d

Unknown_0x3B52:
	jr Unknown_0x3B5B

Unknown_0x3B54:
	ld a,c
	add a,$10
	ld c,a
	jr nc,Unknown_0x3B5B
	inc b

Unknown_0x3B5B:
	call Unknown_0x3B8F
	jr nc,Unknown_0x3B65
	ld a,$01
	ld [$DF0B],a

Unknown_0x3B65:
	ld a,[$DF0D]
	dec a
	ld [$DF0D],a
	jr nz,Unknown_0x3B54
	ld a,[$DF0E]
	dec a
	ld [$DF0E],a
	jr nz,Unknown_0x3B3F
	ld a,[$DF0B]
	or a
	jr nz,Unknown_0x3B82
	ld a,[$FF00+$9A]
	ld d,a
	and a
	ret

Unknown_0x3B82:
	ld a,[$FF00+$9A]
	ld d,a
	call Unknown_0x2871
	ld e,$0F
	call Unknown_0x0F7A
	scf
	ret

Unknown_0x3B8F:
	call Unknown_0x1646
	ld [$DF13],a
	ld h,a
	and $07
	cp $01
	jr nz,Unknown_0x3BF2
	ld a,h
	cp $21
	jr z,Unknown_0x3BCD
	cp $29
	jr nz,Unknown_0x3BAD
	ld a,[$DF15]
	inc a
	jr z,Unknown_0x3BF2
	jr Unknown_0x3BCD

Unknown_0x3BAD:
	cp $41
	jr c,Unknown_0x3BF2
	cp $79
	jr nc,Unknown_0x3BF2
	rra
	rra
	rra
	and $1F
	sub $08
	push hl
	ld hl,$3BF4
	add a,l
	ld l,a
	jr nc,Unknown_0x3BC5
	inc h

Unknown_0x3BC5:
	ld h,[hl]
	ld a,[$DF15]
	cp h
	pop hl
	jr nz,Unknown_0x3BF2

Unknown_0x3BCD:
	push bc
	push de
	ld a,l
	ld [$FF00+$80],a
	call Unknown_0x3C02
	ld a,[$FF00+$80]
	inc a
	call Unknown_0x15A8
	ld a,[$DF13]
	cp $71
	ld e,$19
	jr nz,Unknown_0x3BE6
	ld e,$53

Unknown_0x3BE6:
	ld hl,Unknown_0x4299
	ld a,$1E
	call Unknown_0x05CF
	pop de
	pop bc
	scf
	ret

Unknown_0x3BF2:
	and a
	ret

UnknownData_0x3BF4:
INCBIN "baserom.gb", $3BF4, $3BFB - $3BF4

Unknown_0x3BFB:
	call Unknown_0x3C09
	ret z
	ld [hl],$10
	ret

Unknown_0x3C02:
	call Unknown_0x3C0E
	ret z
	ld [hl],$05
	ret

Unknown_0x3C09:
	ld hl,$A8B2
	jr Unknown_0x3C11

Unknown_0x3C0E:
	ld hl,$A2A5

Unknown_0x3C11:
	push bc
	push de
	ld a,e
	and $F0
	or $08
	ld e,a
	ld a,c
	and $F0
	or $08
	ld c,a
	ld a,$01
	call Unknown_0x07C4
	ld a,h
	or a
	ld l,$51
	pop de
	pop bc
	ret

Unknown_0x3C2B:
	ld h,d
	ld l,$45
	ld a,[hl]
	rla
	jr nc,Unknown_0x3C3C
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x3C3C:
	ld l,$0D
	ld [hl],c
	inc l
	ld [hl],b
	ret
	ld a,[$A05B]
	inc a
	ld [$DEE0],a
	ld hl,$DEDE
	set 3,[hl]
	ret
	ld a,[bc]
	inc bc
	ld [$DEE0],a
	ld hl,$DEDE
	set 3,[hl]
	ret

Unknown_0x3C5A:
	ld bc,Unknown_0x3C60
	jp Unknown_0x0F92

Unknown_0x3C60:
INCBIN "baserom.gb", $3C60, $3C63 - $3C60

Unknown_0x3C63:
	ld b,$08
	ld hl,$CD56

Unknown_0x3C68:
	ld a,[hli]
	or a
	jr z,Unknown_0x3C72
	inc l
	inc l
	dec b
	jr nz,Unknown_0x3C68
	ret

Unknown_0x3C72:
	dec l
	ld [hl],$20
	inc l
	ld a,[$FF00+$9C]
	ld c,a
	ld [hli],a
	ld a,[$FF00+$9D]
	ld b,a
	ld [hl],a
	ld a,[bc]
	inc a
	ld [bc],a
	ld [$FF00+$84],a
	ld e,c
	swap c
	call Unknown_0x15B0
	ld hl,$DF12
	inc [hl]
	ld a,[$FF00+$9A]
	ld d,a
	and a
	ret
	call Unknown_0x2AF8
	xor a
	ld hl,$DF37
	ld [hli],a
	ld [hl],a
	ld e,$61
	ld hl,Unknown_0x4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,$18
	call Unknown_0x05DD
	ld hl,Unknown_0x62B11
	ld de,$9000
	call Unknown_0x0708
	ld a,$18
	call Unknown_0x05DD
	ld hl,Unknown_0x6249F
	ld de,$8000
	call Unknown_0x0708
	ld hl,$DD30
	ld a,e
	ld [hli],a
	ld [hl],d
	ld a,e
	sub $00
	ld e,a
	ld a,d
	sbc a,$80
	ld d,a
	ld a,e
	ld b,$04

Unknown_0x3CD2:
	srl d
	rra
	dec b
	jr nz,Unknown_0x3CD2
	ld [$DF34],a
	ld a,$18
	call Unknown_0x05DD
	ld hl,Unknown_0x62D6B
	ld de,$9800
	call Unknown_0x0708
	ld hl,$9960
	ld de,$9C00
	ld bc,$00E0
	call Unknown_0x0621
	ld hl,$DF35
	ld a,$32
	ld [hli],a
	ld a,$62
	ld [hli],a
	xor a
	ld [hl],a
	ld hl,Unknown_0x61B1B
	ld a,$07
	call Unknown_0x05CF
	call Unknown_0x046D
	ld e,$1D
	ld hl,Unknown_0x62011
	ld a,$1E
	call Unknown_0x05CF
	ld a,$08
	call Unknown_0x05DD
	call Unknown_0x20000
	ld a,$8B
	ld h,$A0
	ld l,$B3
	ld b,$00
	ld c,b
	ld d,c
	ld e,d
	call Unknown_0x07C4
	ld de,$0C04
	ld hl,$4246
	ld a,$1A
	call Unknown_0x05CF

Unknown_0x3D36:
	call Unknown_0x0496
	call Unknown_0x086B
	call Unknown_0x04AE
	call Unknown_0x0343
	ld a,[$DD2D]
	and a
	jr nz,Unknown_0x3D4E
	ld a,[$DA46]
	and a
	jr nz,Unknown_0x3D36

Unknown_0x3D4E:
	ld de,$0C04
	ld hl,Unknown_0x6027B
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld hl,Unknown_0x61ADA
	ld a,$07
	call Unknown_0x05CF
	ret

Unknown_0x3D65:
	ld hl,$DF35
	ld a,[hli]
	ld c,a
	ld a,[hl]
	ld h,a
	ld l,c
	ld e,$43
	ld a,[hli]
	ld [de],a
	ld a,[hli]
	ld [$DD2F],a
	ld [$DF39],a
	ld a,[$FF00+$A4]
	push hl
	push af
	push de
	ld a,$07
	call Unknown_0x05DD
	ld a,[$DF39]
	ld l,a
	ld h,$00
	ld d,h
	ld e,l
	add hl,hl
	add hl,de
	add hl,hl
	ld de,$5629
	add hl,de
	pop de
	ld e,$18
	ld a,[hli]
	ld [de],a
	dec e
	ld a,[hli]
	ld [de],a
	dec e
	ld a,[hl]
	ld [de],a
	ld e,$46
	ld a,[$DF34]
	ld [de],a
	pop af
	call Unknown_0x05DD
	pop hl
	ld bc,$DF35
	ld a,l
	ld [bc],a
	inc bc
	ld a,h
	ld [bc],a
	ld hl,Unknown_0x61A1C
	ld a,$07
	call Unknown_0x05CF
	ret

Unknown_0x3DB8:
	ld hl,$DF35
	ld a,[hli]
	ld c,a
	ld a,[hl]
	ld h,a
	ld l,c
	ld a,[hli]
	and $07
	swap a
	rla
	ld bc,$9C00
	add a,c
	ld c,a
	jr nc,Unknown_0x3DCE
	inc b

Unknown_0x3DCE:
	ld a,[hli]
	add a,c
	ld c,a
	jr nc,Unknown_0x3DD4
	inc b

Unknown_0x3DD4:
	ld a,[$FF00+$92]
	ld e,a
	ld d,$C4
	ld a,[hli]
	push af
	bit 0,a
	jr nz,Unknown_0x3DE3
	ld a,$07
	jr Unknown_0x3DE6

Unknown_0x3DE3:
	ld a,$0B
	dec c

Unknown_0x3DE6:
	ld [$FF00+$4B],a
	ld a,c
	ld [de],a
	inc e
	ld a,b
	ld [de],a
	inc e
	pop af
	ld [de],a
	inc e
	ld b,a

Unknown_0x3DF2:
	ld a,[hli]
	ld [de],a
	inc e
	dec b
	jr nz,Unknown_0x3DF2
	ld a,e
	ld [$FF00+$92],a
	ld bc,$DF35
	ld a,l
	ld [bc],a
	inc bc
	ld a,h
	ld [bc],a
	ret

UnknownData_0x3E04:
INCBIN "baserom.gb", $3E04, $4000 - $3E04

SECTION "Bank01", ROMX, BANK[$01]

UnknownData_0x4000:
INCBIN "baserom.gb", $4000, $4027 - $4000
	ld hl,$79F4
	ld a,$01
	call Unknown_0x05CF
	ret

UnknownData_0x4030:
INCBIN "baserom.gb", $4030, $4083 - $4030
	ld a,[$DB73]
	dec a
	jr z,Unknown_0x409E
	ld a,[$A071]
	or a
	ld e,$4C
	ld h,$04
	jr z,Unknown_0x4097
	ld e,$72
	ld h,$02

Unknown_0x4097:
	ld a,[de]
	cp h
	ld a,$00
	jr nc,Unknown_0x409E
	inc a

Unknown_0x409E:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x40A2:
INCBIN "baserom.gb", $40A2, $40D6 - $40A2
	call Unknown_0x34FD
	ret
	push bc
	ld h,$A2

Unknown_0x40DD:
	ld l,$00
	ld a,[hl]
	inc a
	jr z,Unknown_0x40F1
	ld l,$4C
	ld a,[hl]
	or a
	jr z,Unknown_0x40F1
	ld e,$03
	ld bc,$4E40
	call Unknown_0x0849

Unknown_0x40F1:
	inc h
	ld a,h
	cp $A8
	jr c,Unknown_0x40DD
	pop bc
	ret

UnknownData_0x40F9:
INCBIN "baserom.gb", $40F9, $4132 - $40F9
	ld a,[$A05B]
	inc a
	ld e,$27
	ld [de],a
	ret

UnknownData_0x413A:
INCBIN "baserom.gb", $413A, $417C - $413A
	push bc
	ld bc,Unknown_0x418E
	call Unknown_0x0F50
	jr z,Unknown_0x418C
	ld l,$39
	ld a,[$A071]
	dec a
	ld [hl],a

Unknown_0x418C:
	pop bc
	ret

Unknown_0x418E:
INCBIN "baserom.gb", $418E, $4191 - $418E
	xor a
	ld [$DEE3],a
	ld hl,$DEDF
	res 1,[hl]
	ret
	ld a,[$DEFF]
	or a
	ret nz
	ld a,[$DB6F]
	ld e,a
	push bc
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

UnknownData_0x41B2:
INCBIN "baserom.gb", $41B2, $41EA - $41B2
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld e,$39
	ld a,[$DB53]
	ld [de],a
	ld hl,$6FB9
	ld a,$08
	call Unknown_0x05CF
	ld hl,$741F
	ld a,$08
	call Unknown_0x05CF
	ret

UnknownData_0x4207:
INCBIN "baserom.gb", $4207, $421F - $4207
	ld a,[$DB6D]
	call Unknown_0x0663
	ld e,a
	ld a,[$DB60]
	ld hl,$DB62
	add a,l
	ld l,a
	jr nc,Unknown_0x4231
	inc h

Unknown_0x4231:
	ld a,[hl]
	or e
	ld [hl],a
	push bc
	ld hl,$6D6C
	ld a,$0F
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret
	push bc
	ld hl,$47CE
	ld a,$08
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x4250:
INCBIN "baserom.gb", $4250, $4299 - $4250

Unknown_0x4299:
INCBIN "baserom.gb", $4299, $446E - $4299
	ld hl,$470E
	ld a,$08
	call Unknown_0x05CF
	ret
	xor a
	ld [$DB3C],a
	ret
	ld a,[$DB3C]
	jr Unknown_0x4486
	ld a,[$A051]
	sub $04

Unknown_0x4486:
	ld e,$27
	ld [de],a
	ret
	ld e,$45
	ld a,[de]
	rla
	ld hl,$FFF7
	jr nc,Unknown_0x4496
	ld hl,$0009

Unknown_0x4496:
	ld e,$04
	ld a,[de]
	add a,l
	ld [de],a
	inc e
	ld a,[de]
	adc a,h
	ld [de],a
	ld h,d
	ld l,$3B
	dec e
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hl],a
	ret
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld hl,Unknown_0x741F
	ld a,$08
	call Unknown_0x05CF
	ret

UnknownData_0x44BF:
INCBIN "baserom.gb", $44BF, $4508 - $44BF
	ld hl,$0807
	call Unknown_0x7BAF
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x452F
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x452F:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x453D
	ld e,$01
	ld bc,$4697
	jp Unknown_0x37F4

Unknown_0x453D:
	call Unknown_0x7A55
	jr nc,Unknown_0x454A
	ld e,$01
	ld bc,$4583
	jp Unknown_0x37F4

Unknown_0x454A:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x4558
	ld e,$01
	ld bc,$49FA
	jp Unknown_0x37F4

Unknown_0x4558:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x4566
	ld e,$01
	ld bc,$729D
	jp Unknown_0x37F4

Unknown_0x4566:
	call Unknown_0x36E6
	jr nc,Unknown_0x4573
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4573:
	call Unknown_0x3619
	jr nc,Unknown_0x4580
	ld e,$01
	ld bc,$4A48
	jp Unknown_0x37F4

Unknown_0x4580:
	jp Unknown_0x37F7

UnknownData_0x4583:
INCBIN "baserom.gb", $4583, $45E4 - $4583
	call Unknown_0x359A
	call Unknown_0x7C45

Unknown_0x45EA:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A9E
	jr nc,Unknown_0x4602
	ld e,$01
	ld bc,$44E0
	jp Unknown_0x37F4

Unknown_0x4602:
	call Unknown_0x7ADB
	jr nc,Unknown_0x460F
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x460F:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x461D
	ld e,$01
	ld bc,$4697
	jp Unknown_0x37F4

Unknown_0x461D:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x462C
	ld e,$01
	ld bc,$44E0
	jp Unknown_0x37F4

Unknown_0x462C:
	call Unknown_0x373B
	jr nc,Unknown_0x4639
	ld e,$01
	ld bc,$467F
	jp Unknown_0x37F4

Unknown_0x4639:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x4647
	ld e,$01
	ld bc,$49FA
	jp Unknown_0x37F4

Unknown_0x4647:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x4655
	ld e,$01
	ld bc,$729D
	jp Unknown_0x37F4

Unknown_0x4655:
	call Unknown_0x36E6
	jr nc,Unknown_0x4662
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4662:
	call Unknown_0x3619
	jr nc,Unknown_0x466F
	ld e,$01
	ld bc,$4A48
	jp Unknown_0x37F4

Unknown_0x466F:
	call Unknown_0x374E
	jr nc,Unknown_0x467C
	ld e,$01
	ld bc,$4583
	jp Unknown_0x37F4

Unknown_0x467C:
	jp Unknown_0x37F7

UnknownData_0x467F:
INCBIN "baserom.gb", $467F, $468E - $467F
	call Unknown_0x359A
	call Unknown_0x7C20
	jp Unknown_0x45EA

UnknownData_0x4697:
INCBIN "baserom.gb", $4697, $46BD - $4697
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x46CE
	ld e,$01
	ld bc,$46A6
	jp Unknown_0x37F4

Unknown_0x46CE:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x46E1
	ld h,d
	ld l,$1F
	ld [hl],$41
	inc l
	ld [hl],$46
	inc l
	ld [hl],$E1

Unknown_0x46E1:
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x470A
	ld e,$01
	ld bc,$44C6
	jp Unknown_0x37F4

Unknown_0x470A:
	call Unknown_0x39C1
	jr nc,Unknown_0x4717
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x4717:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x4725
	ld e,$01
	ld bc,$729D
	jp Unknown_0x37F4

Unknown_0x4725:
	call Unknown_0x36E6
	jr nc,Unknown_0x4732
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4732:
	call Unknown_0x3614
	jr nc,Unknown_0x473F
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x473F:
	jp Unknown_0x37F7

UnknownData_0x4742:
INCBIN "baserom.gb", $4742, $478C - $4742
	ld hl,$0807
	call Unknown_0x7BAF
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A8C
	call Unknown_0x3992
	jr nc,Unknown_0x47BB
	ld e,$01
	ld bc,$44C6
	jp Unknown_0x37F4

Unknown_0x47BB:
	call Unknown_0x39C1
	jr nc,Unknown_0x47C8
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x47C8:
	ld e,$52
	ld a,[de]
	or a
	jr z,Unknown_0x47D6
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x47D6:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x47E4
	ld e,$01
	ld bc,$729D
	jp Unknown_0x37F4

Unknown_0x47E4:
	call Unknown_0x3619
	jr nc,Unknown_0x47F1
	ld e,$01
	ld bc,$4A48
	jp Unknown_0x37F4

Unknown_0x47F1:
	call Unknown_0x3765
	jr nc,Unknown_0x47FE
	ld e,$01
	ld bc,$4C05
	jp Unknown_0x37F4

Unknown_0x47FE:
	call Unknown_0x36E6
	jr nc,Unknown_0x480B
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x480B:
	jp Unknown_0x37F7

UnknownData_0x480E:
INCBIN "baserom.gb", $480E, $481B - $480E
	ld hl,$A06C
	res 3,[hl]
	ret
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld hl,Unknown_0x48B6
	ld a,$01
	call Unknown_0x3AAA
	call Unknown_0x7D6E
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x4855
	ld e,$01
	ld bc,$494E
	jp Unknown_0x37F4

Unknown_0x4855:
	call Unknown_0x39C1
	jr nc,Unknown_0x4862
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x4862:
	ld hl,$A06C
	bit 3,[hl]
	jr z,Unknown_0x4871
	ld e,$01
	ld bc,$48BB
	jp Unknown_0x37F4

Unknown_0x4871:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x487F
	ld e,$01
	ld bc,$729D
	jp Unknown_0x37F4

Unknown_0x487F:
	call Unknown_0x3619
	jr nc,Unknown_0x488C
	ld e,$01
	ld bc,$4A48
	jp Unknown_0x37F4

Unknown_0x488C:
	call Unknown_0x3765
	jr nc,Unknown_0x4899
	ld e,$01
	ld bc,$4C05
	jp Unknown_0x37F4

Unknown_0x4899:
	call Unknown_0x36E6
	jr nc,Unknown_0x48A6
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x48A6:
	call Unknown_0x3614
	jr nc,Unknown_0x48B3
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x48B3:
	jp Unknown_0x37F7

Unknown_0x48B6:
INCBIN "baserom.gb", $48B6, $4967 - $48B6
	ld e,$40
	ld bc,$0280
	call Unknown_0x0D23
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x498A
	ld e,$01
	ld bc,$44C6
	jp Unknown_0x37F4

Unknown_0x498A:
	call Unknown_0x39C1
	jr nc,Unknown_0x4997
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x4997:
	call Unknown_0x3619
	jr nc,Unknown_0x49A4
	ld e,$01
	ld bc,$4A48
	jp Unknown_0x37F4

Unknown_0x49A4:
	call Unknown_0x3765
	jr nc,Unknown_0x49B1
	ld e,$01
	ld bc,$4C05
	jp Unknown_0x37F4

Unknown_0x49B1:
	call Unknown_0x3614
	jr nc,Unknown_0x49BE
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x49BE:
	jp Unknown_0x37F7

UnknownData_0x49C1:
INCBIN "baserom.gb", $49C1, $49D4 - $49C1
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D35
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x49F7
	ld e,$01
	ld bc,$44C6
	jp Unknown_0x37F4

Unknown_0x49F7:
	jp Unknown_0x37F7

UnknownData_0x49FA:
INCBIN "baserom.gb", $49FA, $4A07 - $49FA
	call Unknown_0x7C2E
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x4A25
	ld e,$01
	ld bc,$4742
	jp Unknown_0x37F4

Unknown_0x4A25:
	call Unknown_0x36A5
	jr nc,Unknown_0x4A32
	ld e,$01
	ld bc,$49C1
	jp Unknown_0x37F4

Unknown_0x4A32:
	ld a,[$FF00+$A5]
	bit 7,a
	jr nz,Unknown_0x4A40
	ld e,$01
	ld bc,$44C6
	jp Unknown_0x37F4

Unknown_0x4A40:
	ld e,$15
	ld a,$04
	ld [de],a
	jp Unknown_0x37F7

UnknownData_0x4A48:
INCBIN "baserom.gb", $4A48, $4A5D - $4A48
	call Unknown_0x7CFD
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	call Unknown_0x36E6
	jr nc,Unknown_0x4A84
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4A84:
	jp Unknown_0x37F7

UnknownData_0x4A87:
INCBIN "baserom.gb", $4A87, $4A9D - $4A87
	call Unknown_0x359A
	ld e,$50
	ld bc,$FEB3
	call Unknown_0x0D54
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x4ACD
	ld e,$01
	ld bc,$4BB5
	jp Unknown_0x37F4

Unknown_0x4ACD:
	call Unknown_0x3765
	jr nc,Unknown_0x4ADA
	ld e,$01
	ld bc,$4B55
	jp Unknown_0x37F4

Unknown_0x4ADA:
	call Unknown_0x36E6
	jr nc,Unknown_0x4AE7
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4AE7:
	jp Unknown_0x37F7

UnknownData_0x4AEA:
INCBIN "baserom.gb", $4AEA, $4AFA - $4AEA
	call Unknown_0x359A
	ld e,$14
	ld bc,$0100
	call Unknown_0x0D23
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0x4B2A
	ld e,$01
	ld bc,$4A87
	jp Unknown_0x37F4

Unknown_0x4B2A:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x4B38
	ld e,$01
	ld bc,$4BB5
	jp Unknown_0x37F4

Unknown_0x4B38:
	call Unknown_0x3765
	jr nc,Unknown_0x4B45
	ld e,$01
	ld bc,$4B55
	jp Unknown_0x37F4

Unknown_0x4B45:
	call Unknown_0x36E6
	jr nc,Unknown_0x4B52
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4B52:
	jp Unknown_0x37F7

UnknownData_0x4B55:
INCBIN "baserom.gb", $4B55, $4BD6 - $4B55
	ld e,$14
	ld bc,$0100
	call Unknown_0x0D23
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	call Unknown_0x3765
	jr nc,Unknown_0x4C02
	ld e,$01
	ld bc,$4C05
	jp Unknown_0x37F4

Unknown_0x4C02:
	jp Unknown_0x37F7

UnknownData_0x4C05:
INCBIN "baserom.gb", $4C05, $4C28 - $4C05
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x4C49
	ld e,$01
	ld bc,$4D46
	jp Unknown_0x37F4

Unknown_0x4C49:
	call Unknown_0x37BD
	jr nc,Unknown_0x4C56
	ld e,$01
	ld bc,$4D46
	jp Unknown_0x37F4

Unknown_0x4C56:
	call Unknown_0x7A55
	jr nc,Unknown_0x4C63
	ld e,$01
	ld bc,$4C81
	jp Unknown_0x37F4

Unknown_0x4C63:
	ld a,[$FF00+$A5]
	and $02
	jr z,Unknown_0x4C71
	ld e,$01
	ld bc,$4DE6
	jp Unknown_0x37F4

Unknown_0x4C71:
	call Unknown_0x36E6
	jr nc,Unknown_0x4C7E
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4C7E:
	jp Unknown_0x37F7

UnknownData_0x4C81:
INCBIN "baserom.gb", $4C81, $4CC4 - $4C81
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0x7C8E
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A9E
	jr nc,Unknown_0x4CE5
	ld e,$01
	ld bc,$4C14
	jp Unknown_0x37F4

Unknown_0x4CE5:
	call Unknown_0x7ADB
	jr nc,Unknown_0x4CF2
	ld e,$01
	ld bc,$4D46
	jp Unknown_0x37F4

Unknown_0x4CF2:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x4D01
	ld e,$01
	ld bc,$4C14
	jp Unknown_0x37F4

Unknown_0x4D01:
	call Unknown_0x37BD
	jr nc,Unknown_0x4D0E
	ld e,$01
	ld bc,$4D46
	jp Unknown_0x37F4

Unknown_0x4D0E:
	call Unknown_0x36E6
	jr nc,Unknown_0x4D1B
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4D1B:
	call Unknown_0x374E
	jr nc,Unknown_0x4D28
	ld e,$01
	ld bc,$4C81
	jp Unknown_0x37F4

Unknown_0x4D28:
	ld a,[$FF00+$A5]
	and $02
	jr z,Unknown_0x4D36
	ld e,$01
	ld bc,$4DE6
	jp Unknown_0x37F4

Unknown_0x4D36:
	call Unknown_0x377C
	jr nc,Unknown_0x4D43
	ld e,$01
	ld bc,$4EB6
	jp Unknown_0x37F4

Unknown_0x4D43:
	jp Unknown_0x37F7

UnknownData_0x4D46:
INCBIN "baserom.gb", $4D46, $4D87 - $4D46
	call Unknown_0x359A
	call Unknown_0x7D16
	call Unknown_0x7CCA
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x4DAB
	ld e,$01
	ld bc,$44C6
	jp Unknown_0x37F4

Unknown_0x4DAB:
	call Unknown_0x3943
	call Unknown_0x37CB
	jr nc,Unknown_0x4DBB
	ld e,$01
	ld bc,$4D46
	jp Unknown_0x37F4

Unknown_0x4DBB:
	ld a,[$FF00+$A5]
	and $02
	jr z,Unknown_0x4DC9
	ld e,$01
	ld bc,$4DE6
	jp Unknown_0x37F4

Unknown_0x4DC9:
	call Unknown_0x377C
	jr nc,Unknown_0x4DD6
	ld e,$01
	ld bc,$4EB6
	jp Unknown_0x37F4

Unknown_0x4DD6:
	call Unknown_0x36E6
	jr nc,Unknown_0x4DE3
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x4DE3:
	jp Unknown_0x37F7

UnknownData_0x4DE6:
INCBIN "baserom.gb", $4DE6, $4E47 - $4DE6
	call Unknown_0x7A1B
	call Unknown_0x4E8D
	call Unknown_0x3AE9
	call Unknown_0x7D9C
	jr nc,Unknown_0x4E5D
	ld e,$01
	ld bc,$4E00
	jp Unknown_0x37F4

Unknown_0x4E5D:
	call Unknown_0x375B
	jr nc,Unknown_0x4E6A
	ld e,$01
	ld bc,$4E3B
	jp Unknown_0x37F4

Unknown_0x4E6A:
	call Unknown_0x377C
	jr nc,Unknown_0x4E77
	ld e,$01
	ld bc,$4EB6
	jp Unknown_0x37F4

Unknown_0x4E77:
	jp Unknown_0x37F7
	call Unknown_0x7A1B
	call Unknown_0x377C
	jr nc,Unknown_0x4E8A
	ld e,$01
	ld bc,$4EB6
	jp Unknown_0x37F4

Unknown_0x4E8A:
	jp Unknown_0x37F7

Unknown_0x4E8D:
	ld e,$27
	ld a,[de]
	ld hl,$4EA1
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x4E99
	inc h

Unknown_0x4E99:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,$02
	jp Unknown_0x3AAA

UnknownData_0x4EA1:
INCBIN "baserom.gb", $4EA1, $4EC9 - $4EA1

Unknown_0x4EC9:
INCBIN "baserom.gb", $4EC9, $4F1A - $4EC9
	ld a,[$DB78]
	ld [$CD00],a
	ret

UnknownData_0x4F21:
INCBIN "baserom.gb", $4F21, $4F3F - $4F21
	ld a,[$A050]
	cp $0D
	ld a,$00
	jr nz,Unknown_0x4F49
	inc a

Unknown_0x4F49:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x4F4D:
INCBIN "baserom.gb", $4F4D, $500C - $4F4D
	call Unknown_0x507A
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x502A
	ld e,$01
	ld bc,$4FD6
	jp Unknown_0x37F4

Unknown_0x502A:
	call Unknown_0x3957
	call Unknown_0x506E
	jr nc,Unknown_0x503A
	ld e,$01
	ld bc,$52A8
	jp Unknown_0x37F4

Unknown_0x503A:
	jp Unknown_0x37F7
	call Unknown_0x7A42
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x505B
	ld e,$01
	ld bc,$52A8
	jp Unknown_0x37F4

Unknown_0x505B:
	call Unknown_0x3957
	call Unknown_0x506E
	jr nc,Unknown_0x506B
	ld e,$01
	ld bc,$52A8
	jp Unknown_0x37F4

Unknown_0x506B:
	jp Unknown_0x37F7

Unknown_0x506E:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x5078
	dec a
	ld [de],a
	and a
	ret

Unknown_0x5078:
	scf
	ret

Unknown_0x507A:
	ld a,[$A070]
	or a
	ld e,$10
	ld bc,$0280
	jr z,Unknown_0x508A
	ld e,$04
	ld bc,$00E0

Unknown_0x508A:
	jp Unknown_0x0D23

UnknownData_0x508D:
INCBIN "baserom.gb", $508D, $5105 - $508D
	call Unknown_0x507A
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	jr nc,Unknown_0x5123
	ld e,$01
	ld bc,$50ED
	jp Unknown_0x37F4

Unknown_0x5123:
	call Unknown_0x3957
	call Unknown_0x506E
	jr nc,Unknown_0x5133
	ld e,$01
	ld bc,$52A8
	jp Unknown_0x37F4

Unknown_0x5133:
	jp Unknown_0x37F7

UnknownData_0x5136:
INCBIN "baserom.gb", $5136, $5252 - $5136
	ld a,[$DB76]
	or a
	ret z
	ld a,[$DA36]
	or a
	ret nz
	ld hl,$DB78
	ld a,[hli]
	ld [$CD00],a
	ld a,[hli]
	ld [$CD01],a
	ld a,[hl]
	ld [$CD02],a
	ret

UnknownData_0x526C:
INCBIN "baserom.gb", $526C, $52C9 - $526C
	ld a,[$DB73]
	ld e,$27
	ld [de],a
	ret
	ld a,$05
	ld [$A082],a
	ret
	call Unknown_0x7A1B
	jp Unknown_0x37F7
	ld hl,$7EA8
	ld a,$02
	call Unknown_0x05CF
	jp Unknown_0x37F7
	ld hl,$7EA8
	ld a,$02
	call Unknown_0x05CF
	ld e,$7C
	ld a,[de]
	or a
	jr z,Unknown_0x52FD
	ld e,$01
	ld bc,$52A8
	jp Unknown_0x37F4

Unknown_0x52FD:
	jp Unknown_0x37F7
	ld hl,$7EE2
	ld a,$02
	call Unknown_0x05CF
	jp Unknown_0x37F7
	ld hl,Unknown_0x7F1C
	ld a,$02
	call Unknown_0x05CF
	jp Unknown_0x37F7
	ld e,$44
	ld a,[de]
	swap a
	and $0F
	ld e,$27
	ld [de],a
	ret
	ld e,$44
	ld a,[de]
	and $0F
	ld e,$27
	ld [de],a
	ret

Unknown_0x532A:
	push bc
	ld bc,$B2B3
	ld a,$2F
	ld [$FF00+$84],a
	call Unknown_0x0F67
	ld a,[$FF00+$9A]
	ld d,a
	ld a,h
	or a
	jr z,Unknown_0x5354
	ld l,$48
	ld [hl],d
	ld l,$45
	ld e,l
	ld a,[de]
	xor $80
	ld [hl],a
	ld a,[$A074]
	ld l,$39
	ld [hl],a
	ld a,[$A05B]
	ld l,$3C
	ld [hl],a
	pop bc
	ret

Unknown_0x5354:
	ld h,$B2
	call Unknown_0x0BBA
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	jr Unknown_0x532A

Unknown_0x535F:
INCBIN "baserom.gb", $535F, $5389 - $535F
	ld e,$71
	ld a,[de]
	or a
	ld e,$4C
	jr z,Unknown_0x5393
	ld e,$72

Unknown_0x5393:
	xor a
	ld [de],a
	ret

UnknownData_0x5396:
INCBIN "baserom.gb", $5396, $5429 - $5396
	ld a,[$A051]
	sub $0D
	ld e,$27
	ld [de],a
	ret
	push de
	push bc
	ld a,$23
	ld [$FF00+$84],a
	ld bc,$A0B3
	call Unknown_0x0F67
	pop bc
	pop de
	ld a,h
	or a
	ld e,$39
	ld a,[de]
	jr z,Unknown_0x544D
	ld l,$48
	ld [hl],d
	ld l,$39
	ld [hl],a

Unknown_0x544D:
	inc a
	ld [de],a
	ret

UnknownData_0x5450:
INCBIN "baserom.gb", $5450, $545B - $5450
	ld e,$1E
	ld bc,$0380
	call Unknown_0x0D35
	jp Unknown_0x0DA4

UnknownData_0x5466:
INCBIN "baserom.gb", $5466, $54A9 - $5466

Unknown_0x54A9:
INCBIN "baserom.gb", $54A9, $54AC - $54A9
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	ld e,l
	ld a,[hl]
	ld [de],a
	ld a,$0A
	ld [$A081],a
	xor a
	ld [$A080],a
	ld hl,$4DA9
	ld a,$03
	call Unknown_0x05CF
	ret

UnknownData_0x54C7:
INCBIN "baserom.gb", $54C7, $54E3 - $54C7
	ld hl,$79F4
	ld a,$01
	call Unknown_0x05CF
	ret

UnknownData_0x54EC:
INCBIN "baserom.gb", $54EC, $5525 - $54EC
	ld hl,$4DF5
	ld a,$03
	call Unknown_0x05CF
	ld a,e
	or a
	ret z
	ld e,$48
	ld a,[de]
	ld h,a
	ld e,$1D
	ld bc,$51A3
	call Unknown_0x0849
	ld e,$01
	ld bc,Unknown_0x54A9
	jp Unknown_0x0846

UnknownData_0x5544:
INCBIN "baserom.gb", $5544, $5588 - $5544
	ld e,$48
	ld a,[de]
	ld h,a
	ld e,$45
	ld l,e
	ld a,[hl]
	ld [de],a
	ret
	call Unknown_0x0DA4
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	ld b,a
	ld e,$45
	ld a,[de]
	rla
	ld a,b
	jr c,Unknown_0x55A9
	cp $98
	jr nc,Unknown_0x55AC
	ret

Unknown_0x55A9:
	cp $08
	ret nc

Unknown_0x55AC:
	ld e,$01
	ld bc,$55B4
	jp Unknown_0x0846

UnknownData_0x55B4:
INCBIN "baserom.gb", $55B4, $5613 - $55B4
	ld a,$08
	call Unknown_0x0C94
	call Unknown_0x0DA4
	ld e,$10
	ld a,[de]
	rla
	ret c
	ld b,$02
	ld e,$44
	ld a,b
	ld [de],a
	call Unknown_0x3A8B
	ld e,$01
	ld bc,Unknown_0x535F
	jp Unknown_0x0846

UnknownData_0x5631:
INCBIN "baserom.gb", $5631, $5677 - $5631
	ld hl,$0807
	call Unknown_0x7BAF
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x569E
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x569E:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x56AC
	ld e,$01
	ld bc,$581E
	jp Unknown_0x37F4

Unknown_0x56AC:
	call Unknown_0x3650
	jr nc,Unknown_0x56B9
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x56B9:
	call Unknown_0x7A55
	jr nc,Unknown_0x56C6
	ld e,$01
	ld bc,$56FE
	jp Unknown_0x37F4

Unknown_0x56C6:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x56D4
	ld e,$01
	ld bc,$5B9B
	jp Unknown_0x37F4

Unknown_0x56D4:
	call Unknown_0x36E6
	jr nc,Unknown_0x56E1
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x56E1:
	call Unknown_0x3619
	jr nc,Unknown_0x56EE
	ld e,$01
	ld bc,$5BE9
	jp Unknown_0x37F4

Unknown_0x56EE:
	call Unknown_0x3724
	jr nc,Unknown_0x56FB
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x56FB:
	jp Unknown_0x37F7

UnknownData_0x56FE:
INCBIN "baserom.gb", $56FE, $575F - $56FE
	call Unknown_0x359A
	call Unknown_0x7C45

Unknown_0x5765:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A9E
	jr nc,Unknown_0x577D
	ld e,$01
	ld bc,$564F
	jp Unknown_0x37F4

Unknown_0x577D:
	call Unknown_0x7ADB
	jr nc,Unknown_0x578A
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x578A:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x5798
	ld e,$01
	ld bc,$581E
	jp Unknown_0x37F4

Unknown_0x5798:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x57A7
	ld e,$01
	ld bc,$564F
	jp Unknown_0x37F4

Unknown_0x57A7:
	call Unknown_0x3650
	jr nc,Unknown_0x57B4
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x57B4:
	call Unknown_0x373B
	jr nc,Unknown_0x57C1
	ld e,$01
	ld bc,$5806
	jp Unknown_0x37F4

Unknown_0x57C1:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x57CF
	ld e,$01
	ld bc,$5B9B
	jp Unknown_0x37F4

Unknown_0x57CF:
	call Unknown_0x36E6
	jr nc,Unknown_0x57DC
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x57DC:
	call Unknown_0x3619
	jr nc,Unknown_0x57E9
	ld e,$01
	ld bc,$5BE9
	jp Unknown_0x37F4

Unknown_0x57E9:
	call Unknown_0x374E
	jr nc,Unknown_0x57F6
	ld e,$01
	ld bc,$56FE
	jp Unknown_0x37F4

Unknown_0x57F6:
	call Unknown_0x3724
	jr nc,Unknown_0x5803
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x5803:
	jp Unknown_0x37F7

UnknownData_0x5806:
INCBIN "baserom.gb", $5806, $5815 - $5806
	call Unknown_0x359A
	call Unknown_0x7C20
	jp Unknown_0x5765

UnknownData_0x581E:
INCBIN "baserom.gb", $581E, $5844 - $581E
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x5855
	ld e,$01
	ld bc,$582D
	jp Unknown_0x37F4

Unknown_0x5855:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x5868
	ld h,d
	ld l,$1F
	ld [hl],$41
	inc l
	ld [hl],$58
	inc l
	ld [hl],$68

Unknown_0x5868:
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x5891
	ld e,$01
	ld bc,$5638
	jp Unknown_0x37F4

Unknown_0x5891:
	call Unknown_0x39C1
	jr nc,Unknown_0x589E
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x589E:
	call Unknown_0x3650
	jr nc,Unknown_0x58AB
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x58AB:
	call Unknown_0x36E6
	jr nc,Unknown_0x58B8
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x58B8:
	call Unknown_0x3614
	jr nc,Unknown_0x58C5
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x58C5:
	jp Unknown_0x37F7

UnknownData_0x58C8:
INCBIN "baserom.gb", $58C8, $590F - $58C8
	ld hl,$0807
	call Unknown_0x7BAF
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A8C
	call Unknown_0x3992
	jr nc,Unknown_0x593E
	ld e,$01
	ld bc,$5638
	jp Unknown_0x37F4

Unknown_0x593E:
	call Unknown_0x39C1
	jr nc,Unknown_0x594B
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x594B:
	ld e,$52
	ld a,[de]
	or a
	jr z,Unknown_0x5959
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5959:
	call Unknown_0x3650
	jr nc,Unknown_0x5966
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x5966:
	call Unknown_0x3619
	jr nc,Unknown_0x5973
	ld e,$01
	ld bc,$5BE9
	jp Unknown_0x37F4

Unknown_0x5973:
	call Unknown_0x3765
	jr nc,Unknown_0x5980
	ld e,$01
	ld bc,$5DA6
	jp Unknown_0x37F4

Unknown_0x5980:
	call Unknown_0x36E6
	jr nc,Unknown_0x598D
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x598D:
	call Unknown_0x3724
	jr nc,Unknown_0x599A
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x599A:
	call Unknown_0x3614
	jr nc,Unknown_0x59A7
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x59A7:
	jp Unknown_0x37F7

UnknownData_0x59AA:
INCBIN "baserom.gb", $59AA, $59B7 - $59AA
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld hl,Unknown_0x5A4B
	ld a,$01
	call Unknown_0x3AAA
	call Unknown_0x7D6E
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x59EB
	ld e,$01
	ld bc,$5AEF
	jp Unknown_0x37F4

Unknown_0x59EB:
	call Unknown_0x39C1
	jr nc,Unknown_0x59F8
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x59F8:
	ld hl,$A06C
	bit 3,[hl]
	jr z,Unknown_0x5A07
	ld e,$01
	ld bc,$5A50
	jp Unknown_0x37F4

Unknown_0x5A07:
	call Unknown_0x3650
	jr nc,Unknown_0x5A14
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x5A14:
	call Unknown_0x3619
	jr nc,Unknown_0x5A21
	ld e,$01
	ld bc,$5BE9
	jp Unknown_0x37F4

Unknown_0x5A21:
	call Unknown_0x3765
	jr nc,Unknown_0x5A2E
	ld e,$01
	ld bc,$5DA6
	jp Unknown_0x37F4

Unknown_0x5A2E:
	call Unknown_0x36E6
	jr nc,Unknown_0x5A3B
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5A3B:
	call Unknown_0x3614
	jr nc,Unknown_0x5A48
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5A48:
	jp Unknown_0x37F7

Unknown_0x5A4B:
INCBIN "baserom.gb", $5A4B, $5A5A - $5A4B
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A8C
	call Unknown_0x3992
	jr nc,Unknown_0x5A83
	ld e,$01
	ld bc,$5638
	jp Unknown_0x37F4

Unknown_0x5A83:
	call Unknown_0x39C1
	jr nc,Unknown_0x5A90
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5A90:
	ld e,$10
	ld a,[de]
	rla
	jr c,Unknown_0x5A9E
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5A9E:
	call Unknown_0x3650
	jr nc,Unknown_0x5AAB
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x5AAB:
	call Unknown_0x3619
	jr nc,Unknown_0x5AB8
	ld e,$01
	ld bc,$5BE9
	jp Unknown_0x37F4

Unknown_0x5AB8:
	call Unknown_0x3765
	jr nc,Unknown_0x5AC5
	ld e,$01
	ld bc,$5DA6
	jp Unknown_0x37F4

Unknown_0x5AC5:
	call Unknown_0x36E6
	jr nc,Unknown_0x5AD2
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5AD2:
	call Unknown_0x3724
	jr nc,Unknown_0x5ADF
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x5ADF:
	call Unknown_0x3614
	jr nc,Unknown_0x5AEC
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5AEC:
	jp Unknown_0x37F7

UnknownData_0x5AEF:
INCBIN "baserom.gb", $5AEF, $5B08 - $5AEF
	ld e,$40
	ld bc,$0280
	call Unknown_0x0D23
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x5B2B
	ld e,$01
	ld bc,$5638
	jp Unknown_0x37F4

Unknown_0x5B2B:
	call Unknown_0x39C1
	jr nc,Unknown_0x5B38
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5B38:
	call Unknown_0x3619
	jr nc,Unknown_0x5B45
	ld e,$01
	ld bc,$5BE9
	jp Unknown_0x37F4

Unknown_0x5B45:
	call Unknown_0x3765
	jr nc,Unknown_0x5B52
	ld e,$01
	ld bc,$5DA6
	jp Unknown_0x37F4

Unknown_0x5B52:
	call Unknown_0x3614
	jr nc,Unknown_0x5B5F
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5B5F:
	jp Unknown_0x37F7

UnknownData_0x5B62:
INCBIN "baserom.gb", $5B62, $5B75 - $5B62
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D35
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x5B98
	ld e,$01
	ld bc,$5638
	jp Unknown_0x37F4

Unknown_0x5B98:
	jp Unknown_0x37F7

UnknownData_0x5B9B:
INCBIN "baserom.gb", $5B9B, $5BA8 - $5B9B
	call Unknown_0x7C2E
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x7ADB
	jr nc,Unknown_0x5BC6
	ld e,$01
	ld bc,$58C8
	jp Unknown_0x37F4

Unknown_0x5BC6:
	call Unknown_0x36A5
	jr nc,Unknown_0x5BD3
	ld e,$01
	ld bc,$5B62
	jp Unknown_0x37F4

Unknown_0x5BD3:
	ld a,[$FF00+$A5]
	bit 7,a
	jr nz,Unknown_0x5BE1
	ld e,$01
	ld bc,$5638
	jp Unknown_0x37F4

Unknown_0x5BE1:
	ld e,$15
	ld a,$04
	ld [de],a
	jp Unknown_0x37F7

UnknownData_0x5BE9:
INCBIN "baserom.gb", $5BE9, $5BFE - $5BE9
	call Unknown_0x7CFD
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	call Unknown_0x36E6
	jr nc,Unknown_0x5C25
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5C25:
	jp Unknown_0x37F7

UnknownData_0x5C28:
INCBIN "baserom.gb", $5C28, $5C3E - $5C28
	call Unknown_0x359A
	ld e,$50
	ld bc,$FEB3
	call Unknown_0x0D54
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x5C6E
	ld e,$01
	ld bc,$5D56
	jp Unknown_0x37F4

Unknown_0x5C6E:
	call Unknown_0x3765
	jr nc,Unknown_0x5C7B
	ld e,$01
	ld bc,$5CF6
	jp Unknown_0x37F4

Unknown_0x5C7B:
	call Unknown_0x36E6
	jr nc,Unknown_0x5C88
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5C88:
	jp Unknown_0x37F7

UnknownData_0x5C8B:
INCBIN "baserom.gb", $5C8B, $5C9B - $5C8B
	call Unknown_0x359A
	ld e,$14
	ld bc,$0100
	call Unknown_0x0D23
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0x5CCB
	ld e,$01
	ld bc,$5C28
	jp Unknown_0x37F4

Unknown_0x5CCB:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x5CD9
	ld e,$01
	ld bc,$5D56
	jp Unknown_0x37F4

Unknown_0x5CD9:
	call Unknown_0x3765
	jr nc,Unknown_0x5CE6
	ld e,$01
	ld bc,$5CF6
	jp Unknown_0x37F4

Unknown_0x5CE6:
	call Unknown_0x36E6
	jr nc,Unknown_0x5CF3
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5CF3:
	jp Unknown_0x37F7

UnknownData_0x5CF6:
INCBIN "baserom.gb", $5CF6, $5D09 - $5CF6
	call Unknown_0x359A
	ld e,$20
	ld bc,$FE80
	call Unknown_0x0D54
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x5D39
	ld e,$01
	ld bc,$5D56
	jp Unknown_0x37F4

Unknown_0x5D39:
	call Unknown_0x377C
	jr nc,Unknown_0x5D46
	ld e,$01
	ld bc,$5D03
	jp Unknown_0x37F4

Unknown_0x5D46:
	call Unknown_0x36E6
	jr nc,Unknown_0x5D53
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5D53:
	jp Unknown_0x37F7

UnknownData_0x5D56:
INCBIN "baserom.gb", $5D56, $5D77 - $5D56
	ld e,$14
	ld bc,$0100
	call Unknown_0x0D23
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	call Unknown_0x3765
	jr nc,Unknown_0x5DA3
	ld e,$01
	ld bc,$5DA6
	jp Unknown_0x37F4

Unknown_0x5DA3:
	jp Unknown_0x37F7

UnknownData_0x5DA6:
INCBIN "baserom.gb", $5DA6, $5DC9 - $5DA6
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x5DEA
	ld e,$01
	ld bc,$5EFF
	jp Unknown_0x37F4

Unknown_0x5DEA:
	call Unknown_0x37BD
	jr nc,Unknown_0x5DF7
	ld e,$01
	ld bc,$5EFF
	jp Unknown_0x37F4

Unknown_0x5DF7:
	call Unknown_0x7A55
	jr nc,Unknown_0x5E04
	ld e,$01
	ld bc,$5E2E
	jp Unknown_0x37F4

Unknown_0x5E04:
	call Unknown_0x3650
	jr nc,Unknown_0x5E11
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x5E11:
	call Unknown_0x36E6
	jr nc,Unknown_0x5E1E
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5E1E:
	call Unknown_0x3724
	jr nc,Unknown_0x5E2B
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x5E2B:
	jp Unknown_0x37F7

UnknownData_0x5E2E:
INCBIN "baserom.gb", $5E2E, $5E71 - $5E2E
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0x7C8E
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A9E
	jr nc,Unknown_0x5E92
	ld e,$01
	ld bc,$5DB5
	jp Unknown_0x37F4

Unknown_0x5E92:
	call Unknown_0x7ADB
	jr nc,Unknown_0x5E9F
	ld e,$01
	ld bc,$5EFF
	jp Unknown_0x37F4

Unknown_0x5E9F:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x5EAE
	ld e,$01
	ld bc,$5DB5
	jp Unknown_0x37F4

Unknown_0x5EAE:
	call Unknown_0x37BD
	jr nc,Unknown_0x5EBB
	ld e,$01
	ld bc,$5EFF
	jp Unknown_0x37F4

Unknown_0x5EBB:
	call Unknown_0x36E6
	jr nc,Unknown_0x5EC8
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5EC8:
	call Unknown_0x374E
	jr nc,Unknown_0x5ED5
	ld e,$01
	ld bc,$5E2E
	jp Unknown_0x37F4

Unknown_0x5ED5:
	call Unknown_0x3650
	jr nc,Unknown_0x5EE2
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x5EE2:
	call Unknown_0x377C
	jr nc,Unknown_0x5EEF
	ld e,$01
	ld bc,$5FAB
	jp Unknown_0x37F4

Unknown_0x5EEF:
	call Unknown_0x3724
	jr nc,Unknown_0x5EFC
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x5EFC:
	jp Unknown_0x37F7

UnknownData_0x5EFF:
INCBIN "baserom.gb", $5EFF, $5F40 - $5EFF
	call Unknown_0x359A
	call Unknown_0x7D16
	call Unknown_0x7CCA
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x5F64
	ld e,$01
	ld bc,$5638
	jp Unknown_0x37F4

Unknown_0x5F64:
	call Unknown_0x3943
	call Unknown_0x37CB
	jr nc,Unknown_0x5F74
	ld e,$01
	ld bc,$5EFF
	jp Unknown_0x37F4

Unknown_0x5F74:
	call Unknown_0x3650
	jr nc,Unknown_0x5F81
	ld e,$01
	ld bc,$5FBE
	jp Unknown_0x37F4

Unknown_0x5F81:
	call Unknown_0x377C
	jr nc,Unknown_0x5F8E
	ld e,$01
	ld bc,$5FAB
	jp Unknown_0x37F4

Unknown_0x5F8E:
	call Unknown_0x36E6
	jr nc,Unknown_0x5F9B
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x5F9B:
	call Unknown_0x3724
	jr nc,Unknown_0x5FA8
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x5FA8:
	jp Unknown_0x37F7

UnknownData_0x5FAB:
INCBIN "baserom.gb", $5FAB, $602E - $5FAB

Unknown_0x602E:
INCBIN "baserom.gb", $602E, $6095 - $602E
	ld a,$04
	ld [$A05D],a
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3957
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7
	ld a,[$A070]
	or a
	ld e,$45
	ld a,[de]
	ld e,$38
	jr nz,Unknown_0x60D0
	rla
	ld bc,$0300
	jr nc,Unknown_0x60DB
	ld bc,$FD00

Unknown_0x60CB:
	call Unknown_0x0CD3
	jr Unknown_0x60DE

Unknown_0x60D0:
	rla
	ld bc,$0180
	jr nc,Unknown_0x60DB
	ld bc,$FE80
	jr Unknown_0x60CB

Unknown_0x60DB:
	call Unknown_0x0CA2

Unknown_0x60DE:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld hl,Unknown_0x611A
	ld a,$04
	call Unknown_0x3AAA
	call Unknown_0x3AE4
	call Unknown_0x7B09
	call Unknown_0x7A8C
	jr nc,Unknown_0x6101
	ld e,$01
	ld bc,$606B
	jp Unknown_0x37F4

Unknown_0x6101:
	call Unknown_0x3992
	jr nc,Unknown_0x610E
	ld e,$01
	ld bc,$6078
	jp Unknown_0x37F4

Unknown_0x610E:
	call Unknown_0x3943
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

Unknown_0x611A:
INCBIN "baserom.gb", $611A, $611F - $611A
	ld a,[$A070]
	or a
	ld e,$20
	ld bc,$0280
	jr z,Unknown_0x612F
	ld e,$08
	ld bc,$0140

Unknown_0x612F:
	call Unknown_0x0D23
	ld e,$0E
	call Unknown_0x0D04
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3957
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

UnknownData_0x6154:
INCBIN "baserom.gb", $6154, $6196 - $6154
	ld hl,$1B1A
	call Unknown_0x7BAF
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x61BD
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x61BD:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x61CB
	ld e,$01
	ld bc,$6345
	jp Unknown_0x37F4

Unknown_0x61CB:
	call Unknown_0x7A55
	jr nc,Unknown_0x61D8
	ld e,$01
	ld bc,$6221
	jp Unknown_0x37F4

Unknown_0x61D8:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x61E6
	ld e,$01
	ld bc,$67B9
	jp Unknown_0x37F4

Unknown_0x61E6:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x61F4
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x61F4:
	call Unknown_0x36E6
	jr nc,Unknown_0x6201
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6201:
	call Unknown_0x3619
	jr nc,Unknown_0x620E
	ld e,$01
	ld bc,$6875
	jp Unknown_0x37F4

Unknown_0x620E:
	call Unknown_0x3724
	jr nc,Unknown_0x621B
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x621B:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x6221:
INCBIN "baserom.gb", $6221, $6282 - $6221
	call Unknown_0x359A
	call Unknown_0x7C45

Unknown_0x6288:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A9E
	jr nc,Unknown_0x62A0
	ld e,$01
	ld bc,$616E
	jp Unknown_0x37F4

Unknown_0x62A0:
	call Unknown_0x7ADB
	jr nc,Unknown_0x62AD
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x62AD:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x62BB
	ld e,$01
	ld bc,$6345
	jp Unknown_0x37F4

Unknown_0x62BB:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x62CA
	ld e,$01
	ld bc,$616E
	jp Unknown_0x37F4

Unknown_0x62CA:
	call Unknown_0x373B
	jr nc,Unknown_0x62D7
	ld e,$01
	ld bc,$632D
	jp Unknown_0x37F4

Unknown_0x62D7:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x62E5
	ld e,$01
	ld bc,$67B9
	jp Unknown_0x37F4

Unknown_0x62E5:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x62F3
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x62F3:
	call Unknown_0x36E6
	jr nc,Unknown_0x6300
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6300:
	call Unknown_0x3619
	jr nc,Unknown_0x630D
	ld e,$01
	ld bc,$6875
	jp Unknown_0x37F4

Unknown_0x630D:
	call Unknown_0x374E
	jr nc,Unknown_0x631A
	ld e,$01
	ld bc,$6221
	jp Unknown_0x37F4

Unknown_0x631A:
	call Unknown_0x3724
	jr nc,Unknown_0x6327
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x6327:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x632D:
INCBIN "baserom.gb", $632D, $633C - $632D
	call Unknown_0x359A
	call Unknown_0x7C20
	jp Unknown_0x6288

UnknownData_0x6345:
INCBIN "baserom.gb", $6345, $6368 - $6345
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x6379
	ld e,$01
	ld bc,$6354
	jp Unknown_0x37F4

Unknown_0x6379:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x638C
	ld h,d
	ld l,$1F
	ld [hl],$41
	inc l
	ld [hl],$63
	inc l
	ld [hl],$8C

Unknown_0x638C:
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x63B5
	ld e,$01
	ld bc,$615B
	jp Unknown_0x37F4

Unknown_0x63B5:
	call Unknown_0x39C1
	jr nc,Unknown_0x63C2
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x63C2:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x63D0
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x63D0:
	call Unknown_0x36E6
	jr nc,Unknown_0x63DD
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x63DD:
	call Unknown_0x3614
	jr nc,Unknown_0x63EA
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x63EA:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x63F0:
INCBIN "baserom.gb", $63F0, $6435 - $63F0
	ld hl,$1B1A
	call Unknown_0x7BAF
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A8C
	call Unknown_0x3992
	jr nc,Unknown_0x6464
	ld e,$01
	ld bc,$615B
	jp Unknown_0x37F4

Unknown_0x6464:
	call Unknown_0x39C1
	jr nc,Unknown_0x6471
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x6471:
	ld e,$52
	ld a,[de]
	or a
	jr z,Unknown_0x647F
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x647F:
	call Unknown_0x64D4
	jr nc,Unknown_0x648C
	ld e,$01
	ld bc,$64EC
	jp Unknown_0x37F4

Unknown_0x648C:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x649A
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x649A:
	call Unknown_0x3619
	jr nc,Unknown_0x64A7
	ld e,$01
	ld bc,$6875
	jp Unknown_0x37F4

Unknown_0x64A7:
	call Unknown_0x3765
	jr nc,Unknown_0x64B4
	ld e,$01
	ld bc,$6A41
	jp Unknown_0x37F4

Unknown_0x64B4:
	call Unknown_0x36E6
	jr nc,Unknown_0x64C1
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x64C1:
	call Unknown_0x3724
	jr nc,Unknown_0x64CE
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x64CE:
	call Unknown_0x6C37
	jp Unknown_0x37F7

Unknown_0x64D4:
	ld a,[$A05B]
	cp $01
	jr z,Unknown_0x64DD

Unknown_0x64DB:
	and a
	ret

Unknown_0x64DD:
	ld e,$0F
	ld a,[de]
	sub $80
	inc e
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x64DB
	sbc a,$02
	ccf
	ret

UnknownData_0x64EC:
INCBIN "baserom.gb", $64EC, $6510 - $64EC
	call Unknown_0x359A
	ld e,$20
	ld bc,$0080
	call Unknown_0x0D23
	call Unknown_0x7CB8
	call Unknown_0x659A
	ld hl,$6E0C
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3943
	call Unknown_0x3992
	push af
	call Unknown_0x65AB
	pop af
	jr nc,Unknown_0x6544
	ld e,$01
	ld bc,$615B
	jp Unknown_0x37F4

Unknown_0x6544:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x6552
	ld e,$01
	ld bc,$65B6
	jp Unknown_0x37F4

Unknown_0x6552:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x6560
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x6560:
	call Unknown_0x3619
	jr nc,Unknown_0x656D
	ld e,$01
	ld bc,$6875
	jp Unknown_0x37F4

Unknown_0x656D:
	call Unknown_0x3765
	jr nc,Unknown_0x657A
	ld e,$01
	ld bc,$6A41
	jp Unknown_0x37F4

Unknown_0x657A:
	call Unknown_0x36E6
	jr nc,Unknown_0x6587
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6587:
	call Unknown_0x3724
	jr nc,Unknown_0x6594
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x6594:
	call Unknown_0x6C37
	jp Unknown_0x37F7

Unknown_0x659A:
	ld e,$45
	ld a,[de]
	rla
	ld e,$3C
	ld a,[de]
	jr nc,Unknown_0x65A5
	cpl
	inc a

Unknown_0x65A5:
	add a,$05
	ld e,$15
	ld [de],a
	ret

Unknown_0x65AB:
	ld h,d
	ld e,$0D
	ld l,$8D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x65B6:
INCBIN "baserom.gb", $65B6, $65C3 - $65B6
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld hl,Unknown_0x6665
	ld a,$01
	call Unknown_0x3AAA
	call Unknown_0x7D6E
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x65F7
	ld e,$01
	ld bc,$670A
	jp Unknown_0x37F4

Unknown_0x65F7:
	call Unknown_0x39C1
	jr nc,Unknown_0x6604
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x6604:
	ld hl,$A06C
	bit 3,[hl]
	jr z,Unknown_0x6613
	ld e,$01
	ld bc,$666A
	jp Unknown_0x37F4

Unknown_0x6613:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x6621
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x6621:
	call Unknown_0x3619
	jr nc,Unknown_0x662E
	ld e,$01
	ld bc,$6875
	jp Unknown_0x37F4

Unknown_0x662E:
	call Unknown_0x3765
	jr nc,Unknown_0x663B
	ld e,$01
	ld bc,$6A41
	jp Unknown_0x37F4

Unknown_0x663B:
	call Unknown_0x36E6
	jr nc,Unknown_0x6648
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6648:
	call Unknown_0x3724
	jr nc,Unknown_0x6655
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x6655:
	call Unknown_0x3614
	jr nc,Unknown_0x6662
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x6662:
	jp Unknown_0x37F7

Unknown_0x6665:
INCBIN "baserom.gb", $6665, $6723 - $6665
	ld e,$40
	ld bc,$0280
	call Unknown_0x0D23
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x6746
	ld e,$01
	ld bc,$615B
	jp Unknown_0x37F4

Unknown_0x6746:
	call Unknown_0x39C1
	jr nc,Unknown_0x6753
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x6753:
	call Unknown_0x3619
	jr nc,Unknown_0x6760
	ld e,$01
	ld bc,$6875
	jp Unknown_0x37F4

Unknown_0x6760:
	call Unknown_0x3765
	jr nc,Unknown_0x676D
	ld e,$01
	ld bc,$6A41
	jp Unknown_0x37F4

Unknown_0x676D:
	call Unknown_0x3614
	jr nc,Unknown_0x677A
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x677A:
	jp Unknown_0x37F7

UnknownData_0x677D:
INCBIN "baserom.gb", $677D, $6790 - $677D
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D35
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x67B3
	ld e,$01
	ld bc,$615B
	jp Unknown_0x37F4

Unknown_0x67B3:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x67B9:
INCBIN "baserom.gb", $67B9, $67C6 - $67B9
	call Unknown_0x7C2E
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x67E4
	ld e,$01
	ld bc,$63F0
	jp Unknown_0x37F4

Unknown_0x67E4:
	call Unknown_0x36A5
	jr nc,Unknown_0x67F1
	ld e,$01
	ld bc,$677D
	jp Unknown_0x37F4

Unknown_0x67F1:
	ld a,[$FF00+$A5]
	bit 7,a
	jr nz,Unknown_0x67FF
	ld e,$01
	ld bc,$615B
	jp Unknown_0x37F4

Unknown_0x67FF:
	ld e,$15
	ld a,$08
	ld [de],a
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x680A:
INCBIN "baserom.gb", $680A, $684C - $680A
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x685A
	ld e,$01
	ld bc,$6836
	jp Unknown_0x37F4

Unknown_0x685A:
	call Unknown_0x7A1B
	call Unknown_0x378B
	call Unknown_0x37A8
	call Unknown_0x686C
	call Unknown_0x3AE4
	jp Unknown_0x37F7

Unknown_0x686C:
	call Unknown_0x6C40
	ld e,$3E
	ld a,[de]
	jp Unknown_0x3AAA

UnknownData_0x6875:
INCBIN "baserom.gb", $6875, $688A - $6875
	call Unknown_0x7CFD
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	call Unknown_0x36E6
	jr nc,Unknown_0x68B1
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x68B1:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x68B7:
INCBIN "baserom.gb", $68B7, $68CD - $68B7
	call Unknown_0x359A
	ld e,$50
	ld bc,$FEB3
	call Unknown_0x0D54
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x68FD
	ld e,$01
	ld bc,$69EE
	jp Unknown_0x37F4

Unknown_0x68FD:
	call Unknown_0x3765
	jr nc,Unknown_0x690A
	ld e,$01
	ld bc,$698B
	jp Unknown_0x37F4

Unknown_0x690A:
	call Unknown_0x36E6
	jr nc,Unknown_0x6917
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6917:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x691D:
INCBIN "baserom.gb", $691D, $692D - $691D
	call Unknown_0x359A
	ld e,$14
	ld bc,$0100
	call Unknown_0x0D23
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0x695D
	ld e,$01
	ld bc,$68B7
	jp Unknown_0x37F4

Unknown_0x695D:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x696B
	ld e,$01
	ld bc,$69EE
	jp Unknown_0x37F4

Unknown_0x696B:
	call Unknown_0x3765
	jr nc,Unknown_0x6978
	ld e,$01
	ld bc,$698B
	jp Unknown_0x37F4

Unknown_0x6978:
	call Unknown_0x36E6
	jr nc,Unknown_0x6985
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6985:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x698B:
INCBIN "baserom.gb", $698B, $6A0F - $698B
	ld e,$14
	ld bc,$0100
	call Unknown_0x0D23
	call Unknown_0x7CC1
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3943
	call Unknown_0x3765
	jr nc,Unknown_0x6A3B
	ld e,$01
	ld bc,$6A41
	jp Unknown_0x37F4

Unknown_0x6A3B:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x6A41:
INCBIN "baserom.gb", $6A41, $6A5A - $6A41
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x6A7B
	ld e,$01
	ld bc,$6B91
	jp Unknown_0x37F4

Unknown_0x6A7B:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x6A89
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x6A89:
	call Unknown_0x37BD
	jr nc,Unknown_0x6A96
	ld e,$01
	ld bc,$6B91
	jp Unknown_0x37F4

Unknown_0x6A96:
	call Unknown_0x7A55
	jr nc,Unknown_0x6AA3
	ld e,$01
	ld bc,$6AC3
	jp Unknown_0x37F4

Unknown_0x6AA3:
	call Unknown_0x3724
	jr nc,Unknown_0x6AB0
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x6AB0:
	call Unknown_0x36E6
	jr nc,Unknown_0x6ABD
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6ABD:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x6AC3:
INCBIN "baserom.gb", $6AC3, $6AFF - $6AC3
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0x7C8E
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A9E
	jr nc,Unknown_0x6B20
	ld e,$01
	ld bc,$6A4D
	jp Unknown_0x37F4

Unknown_0x6B20:
	call Unknown_0x7ADB
	jr nc,Unknown_0x6B2D
	ld e,$01
	ld bc,$6B91
	jp Unknown_0x37F4

Unknown_0x6B2D:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x6B3C
	ld e,$01
	ld bc,$6A4D
	jp Unknown_0x37F4

Unknown_0x6B3C:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x6B4A
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x6B4A:
	call Unknown_0x37BD
	jr nc,Unknown_0x6B57
	ld e,$01
	ld bc,$6B91
	jp Unknown_0x37F4

Unknown_0x6B57:
	call Unknown_0x36E6
	jr nc,Unknown_0x6B64
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6B64:
	call Unknown_0x374E
	jr nc,Unknown_0x6B71
	ld e,$01
	ld bc,$6AC3
	jp Unknown_0x37F4

Unknown_0x6B71:
	call Unknown_0x377C
	jr nc,Unknown_0x6B7E
	ld e,$01
	ld bc,$6C2B
	jp Unknown_0x37F4

Unknown_0x6B7E:
	call Unknown_0x3724
	jr nc,Unknown_0x6B8B
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x6B8B:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x6B91:
INCBIN "baserom.gb", $6B91, $6BBC - $6B91
	call Unknown_0x359A
	call Unknown_0x7D16
	call Unknown_0x7CCA
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x6BE0
	ld e,$01
	ld bc,$615B
	jp Unknown_0x37F4

Unknown_0x6BE0:
	call Unknown_0x3943
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x6BF1
	ld e,$01
	ld bc,$680A
	jp Unknown_0x37F4

Unknown_0x6BF1:
	call Unknown_0x37CB
	jr nc,Unknown_0x6BFE
	ld e,$01
	ld bc,$6B91
	jp Unknown_0x37F4

Unknown_0x6BFE:
	call Unknown_0x377C
	jr nc,Unknown_0x6C0B
	ld e,$01
	ld bc,$6C2B
	jp Unknown_0x37F4

Unknown_0x6C0B:
	call Unknown_0x36E6
	jr nc,Unknown_0x6C18
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x6C18:
	call Unknown_0x3724
	jr nc,Unknown_0x6C25
	ld e,$01
	ld bc,$40A2
	jp Unknown_0x37F4

Unknown_0x6C25:
	call Unknown_0x6C37
	jp Unknown_0x37F7

UnknownData_0x6C2B:
INCBIN "baserom.gb", $6C2B, $6C37 - $6C2B

Unknown_0x6C37:
	call Unknown_0x6C40
	ret z
	ld a,$01
	jp Unknown_0x3AAA

Unknown_0x6C40:
	ld e,$15
	ld a,[de]
	ld hl,$6C51
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x6C4C
	inc h

Unknown_0x6C4C:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	or h
	ret

UnknownData_0x6C51:
INCBIN "baserom.gb", $6C51, $6D53 - $6C51
	ld a,$04
	ld [$A05D],a
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3957
	jp Unknown_0x37F7

UnknownData_0x6D6F:
INCBIN "baserom.gb", $6D6F, $6D77 - $6D6F
	ld a,[$A070]
	or a
	ld e,$60
	ld bc,$0400
	jr z,Unknown_0x6D87
	ld e,$40
	ld bc,$0200

Unknown_0x6D87:
	call Unknown_0x0D23
	ld a,[$A070]
	or a
	ld e,$0E
	jr z,Unknown_0x6D94
	ld e,$09

Unknown_0x6D94:
	call Unknown_0x0D04
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x6DCF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x6DB5
	ld e,$01
	ld bc,$6DDF
	jp Unknown_0x37F4

Unknown_0x6DB5:
	call Unknown_0x3957
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0x6DC6
	ld e,$01
	ld bc,$6E8A
	jp Unknown_0x37F4

Unknown_0x6DC6:
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

Unknown_0x6DCF:
	ld hl,Unknown_0x6DDA
	ld a,$06
	call Unknown_0x3AAA
	jp Unknown_0x3AE4

Unknown_0x6DDA:
INCBIN "baserom.gb", $6DDA, $6E00 - $6DDA
	ld a,[$A070]
	or a
	ld a,$04
	jr z,Unknown_0x6E0A
	ld a,$08

Unknown_0x6E0A:
	ld e,$24
	ld [de],a
	ret
	ld e,$0E
	ld a,[de]
	ld h,a
	dec e
	ld a,[de]
	or h
	ret z
	ld e,$45
	ld a,[de]
	xor h
	rla
	ld e,$15
	ld a,[de]
	jr c,Unknown_0x6E28
	inc a
	cp $08
	jr c,Unknown_0x6E2F
	xor a
	jr Unknown_0x6E2F

Unknown_0x6E28:
	dec a
	cp $08
	jr c,Unknown_0x6E2F
	ld a,$07

Unknown_0x6E2F:
	ld [de],a
	ret
	call Unknown_0x7BC7
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld a,$04
	ld [$A05D],a
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	call nz,Unknown_0x6DCF
	call Unknown_0x7B09
	call Unknown_0x1D8B
	call Unknown_0x7ADB
	jr nc,Unknown_0x6E5E
	ld e,$01
	ld bc,$6D6F
	jp Unknown_0x37F4

Unknown_0x6E5E:
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0x6E6C
	ld e,$01
	ld bc,$6E8A
	jp Unknown_0x37F4

Unknown_0x6E6C:
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	ld e,$3A
	jr z,Unknown_0x6E7A
	ld a,$78
	ld [de],a

Unknown_0x6E7A:
	ld a,[de]
	dec a
	ld [de],a
	jr nz,Unknown_0x6E87
	ld e,$01
	ld bc,$6E8A
	jp Unknown_0x37F4

Unknown_0x6E87:
	jp Unknown_0x37F7

UnknownData_0x6E8A:
INCBIN "baserom.gb", $6E8A, $6EB3 - $6E8A
	call Unknown_0x7A1B
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

UnknownData_0x6EBF:
INCBIN "baserom.gb", $6EBF, $6EFE - $6EBF
	call Unknown_0x7A1B
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$15
	ld a,[de]
	or a
	jr z,Unknown_0x6F24
	cp $02
	ld hl,Unknown_0x6F3B
	jr c,Unknown_0x6F1C
	ld hl,Unknown_0x6F40
	jr z,Unknown_0x6F1C
	ld hl,Unknown_0x6F45

Unknown_0x6F1C:
	ld a,$05
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x6F24:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x6F38
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x6F38
	ld e,$01
	ld bc,$6EEE
	jp Unknown_0x37F4

Unknown_0x6F38:
	jp Unknown_0x37F7

Unknown_0x6F3B:
INCBIN "baserom.gb", $6F3B, $6F40 - $6F3B

Unknown_0x6F40:
INCBIN "baserom.gb", $6F40, $6F45 - $6F40

Unknown_0x6F45:
INCBIN "baserom.gb", $6F45, $6FE4 - $6F45
	call Unknown_0x7A1B
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$3B
	ld a,[de]
	cp $01
	jr c,Unknown_0x7004
	ld hl,Unknown_0x701B
	jr z,Unknown_0x6FFC
	ld hl,Unknown_0x7020

Unknown_0x6FFC:
	ld a,$03
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x7004:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x7018
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x7018
	ld e,$01
	ld bc,$6FD2
	jp Unknown_0x37F4

Unknown_0x7018:
	jp Unknown_0x37F7

Unknown_0x701B:
INCBIN "baserom.gb", $701B, $7020 - $701B

Unknown_0x7020:
INCBIN "baserom.gb", $7020, $705A - $7020
	call Unknown_0x7A1B
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$15
	ld a,[de]
	or a
	jr z,Unknown_0x7074
	ld a,$02
	ld hl,Unknown_0x7095
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x7074:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x707E
	dec a
	ld [de],a
	jr Unknown_0x7092

Unknown_0x707E:
	ld a,[$A070]
	or a
	jr nz,Unknown_0x708A
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x7092

Unknown_0x708A:
	ld e,$01
	ld bc,$704D
	jp Unknown_0x37F4

Unknown_0x7092:
	jp Unknown_0x37F7

Unknown_0x7095:
INCBIN "baserom.gb", $7095, $70AE - $7095

Unknown_0x70AE:
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$3B
	ld a,[de]
	xor b
	rla
	ret nc
	ld a,b
	ld [de],a
	ld a,$02
	ld e,$3C
	ld [de],a
	ld a,$16
	ld e,$15
	ld [de],a
	ret

UnknownData_0x70C5:
INCBIN "baserom.gb", $70C5, $70D0 - $70C5
	ld e,$3C
	ld a,[de]
	cp $02
	ld a,$16
	jr nc,Unknown_0x70DB
	ld a,$07

Unknown_0x70DB:
	ld e,$15
	ld [de],a
	ld e,$3C
	ld a,[de]
	dec a
	ld [de],a
	ret

UnknownData_0x70E4:
INCBIN "baserom.gb", $70E4, $70F7 - $70E4
	call Unknown_0x359A
	ld e,$3C
	ld a,[de]
	or a
	jr nz,Unknown_0x7120
	ld a,[$FF00+$A5]
	and $F0
	jr z,Unknown_0x7119
	ld e,$3E
	ld a,[de]
	cp $0F
	jr nc,Unknown_0x7112
	inc a
	ld [de],a
	xor a
	jr Unknown_0x7114

Unknown_0x7112:
	ld a,$01

Unknown_0x7114:
	ld e,$15
	ld [de],a
	jr Unknown_0x7120

Unknown_0x7119:
	xor a
	ld e,$15
	ld [de],a
	ld e,$3E
	ld [de],a

Unknown_0x7120:
	call Unknown_0x7CDC
	call Unknown_0x7CD3
	call Unknown_0x70AE
	jr nc,Unknown_0x7133
	ld e,$01
	ld bc,$70E4
	call Unknown_0x0846

Unknown_0x7133:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x3650
	jr nc,Unknown_0x7148
	ld e,$01
	ld bc,$7158
	jp Unknown_0x37F4

Unknown_0x7148:
	call Unknown_0x725F
	jr nc,Unknown_0x7155
	ld e,$01
	ld bc,$4EC9
	jp Unknown_0x37F4

Unknown_0x7155:
	jp Unknown_0x37F7

UnknownData_0x7158:
INCBIN "baserom.gb", $7158, $71C9 - $7158
	ld e,$0E
	call Unknown_0x0D85
	ld e,$0E
	call Unknown_0x0D04
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld e,$15
	ld a,[de]
	cp $02
	jr c,Unknown_0x7201
	cp $06
	jr c,Unknown_0x71F0
	cp $1A
	jr c,Unknown_0x7201
	cp $1E
	jr nc,Unknown_0x7201
	sub $14

Unknown_0x71F0:
	ld hl,$7223
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x71F9
	inc h

Unknown_0x71F9:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,$02
	call Unknown_0x3AAA

Unknown_0x7201:
	ld e,$3F
	ld a,[de]
	or a
	jr z,Unknown_0x7217
	call Unknown_0x359A
	call Unknown_0x3650
	jr nc,Unknown_0x7217
	ld e,$01
	ld bc,$7158
	jp Unknown_0x37F4

Unknown_0x7217:
	call Unknown_0x725F
	jr nc,Unknown_0x7224
	ld e,$01
	ld bc,$4EC9
	jp Unknown_0x37F4

Unknown_0x7224:
	jp Unknown_0x37F7

UnknownData_0x7227:
INCBIN "baserom.gb", $7227, $725F - $7227

Unknown_0x725F:
	ld a,[$A054]
	or a
	jr z,Unknown_0x7267

Unknown_0x7265:
	and a
	ret

Unknown_0x7267:
	ld hl,$DB4B
	ld a,[hli]
	ld e,a
	ld a,[hl]
	ld hl,$DB54
	sub [hl]
	jr nz,Unknown_0x7265
	dec hl
	ld a,[hl]
	sub e
	jr nz,Unknown_0x7265
	ld e,$3D
	ld a,[de]
	cp $0C
	jr nc,Unknown_0x728B
	ld b,$1B
	bit 1,a
	jr nz,Unknown_0x7287
	ld b,$E4

Unknown_0x7287:
	ld hl,$CD00
	ld [hl],b

Unknown_0x728B:
	or a
	jr z,Unknown_0x7292
	dec a
	ld [de],a
	jr Unknown_0x7265

Unknown_0x7292:
	ld e,$44
	ld a,$02
	ld [de],a
	ld b,a
	call Unknown_0x3A8B
	scf
	ret

UnknownData_0x729D:
INCBIN "baserom.gb", $729D, $72BE - $729D
	xor a
	ld hl,$A153
	ld [hl],a
	inc h
	ld [hl],a
	inc h
	ld [hl],a
	ld [$A055],a
	ld [$A056],a
	ld [$A059],a
	ld [$A057],a
	dec a
	ld [$A058],a
	ld e,$45
	ld a,[de]
	rla
	ld a,$3C
	jr c,Unknown_0x72E1
	cpl
	inc a

Unknown_0x72E1:
	ld [$A063],a
	ret
	call Unknown_0x7A1B
	ld a,[$A056]
	or a
	jr z,Unknown_0x72FC
	ld a,[$A055]
	or a
	jr nz,Unknown_0x72FC
	ld e,$01
	ld bc,$741A
	jp Unknown_0x37F4

Unknown_0x72FC:
	ld h,d
	ld l,$39
	ld a,[hl]
	or a
	jr z,Unknown_0x7306
	dec [hl]
	jr Unknown_0x7320

Unknown_0x7306:
	ld a,[$FF00+$A5]
	bit 1,a
	jr nz,Unknown_0x7320
	ld a,[$A056]
	or a
	jr nz,Unknown_0x7320
	ld a,[$A055]
	or a
	jr nz,Unknown_0x7320
	ld e,$01
	ld bc,$73FB
	jp Unknown_0x37F4

Unknown_0x7320:
	call Unknown_0x3A24
	jr nc,Unknown_0x732D
	ld e,$01
	ld bc,$4C05
	jp Unknown_0x37F4

Unknown_0x732D:
	ld e,$3D
	ld a,[de]
	or a
	jr z,Unknown_0x7337
	dec a
	ld [de],a
	jr Unknown_0x733A

Unknown_0x7337:
	call Unknown_0x7348

Unknown_0x733A:
	ld hl,Unknown_0x7343
	call Unknown_0x3AAA
	jp Unknown_0x37F7

Unknown_0x7343:
INCBIN "baserom.gb", $7343, $7348 - $7343

Unknown_0x7348:
	ld a,[$A057]
	rla
	jr c,Unknown_0x7360
	ld a,[$A055]
	or a
	jr nz,Unknown_0x7360
	ld a,[$A056]
	or a
	jr nz,Unknown_0x7360
	ld a,[$A100]
	inc a
	jr z,Unknown_0x7361

Unknown_0x7360:
	ret

Unknown_0x7361:
	ld a,[$A071]
	ld hl,$7F00
	add a,a
	add a,l
	ld l,a
	ld a,[hli]
	ld b,[hl]
	ld c,a
	ld e,$45
	ld a,[de]
	rla
	jr c,Unknown_0x7398

Unknown_0x7373:
	ld hl,$A007
	ld a,[bc]
	cp $80
	jr z,Unknown_0x73BE
	inc c
	add a,[hl]
	inc l
	ld e,a
	ld a,[bc]
	inc c
	adc a,[hl]
	ld d,a
	ld hl,$A004
	ld a,[bc]
	inc c
	push bc
	add a,[hl]
	inc l
	ld c,a
	ld a,[hl]
	adc a,$00
	ld b,a
	call Unknown_0x73C2
	pop bc
	jr c,Unknown_0x73BE
	jr Unknown_0x7373

Unknown_0x7398:
	ld hl,$A007
	ld a,[bc]
	cp $80
	jr z,Unknown_0x73BE
	inc c
	add a,[hl]
	inc l
	ld e,a
	ld a,[bc]
	inc c
	adc a,[hl]
	ld d,a
	ld hl,$A004
	ld a,[bc]
	inc c
	push bc
	ld c,a
	ld a,[hli]
	sub c
	ld c,a
	ld a,[hl]
	sbc a,$00
	ld b,a
	call Unknown_0x73C2
	pop bc
	jr c,Unknown_0x73BE
	jr Unknown_0x7398

Unknown_0x73BE:
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x73C2:
	call Unknown_0x1646
	cp $21
	jr z,Unknown_0x73CB
	and a
	ret

Unknown_0x73CB:
	ld a,l
	ld [$FF00+$80],a
	push bc
	push de
	ld a,e
	and $F0
	or $08
	ld e,a
	ld a,c
	and $F0
	or $08
	ld c,a
	ld hl,$A1A2
	ld a,$03
	call Unknown_0x07C4
	ld l,$50
	ld [hl],$00
	ld hl,$A055
	inc [hl]
	ld hl,$A057
	set 6,[hl]
	pop de
	pop bc
	ld a,[$FF00+$80]
	inc a
	call Unknown_0x15A8
	scf
	ret

UnknownData_0x73FB:
INCBIN "baserom.gb", $73FB, $7407 - $73FB
	call Unknown_0x7A1B
	call Unknown_0x3765
	jr nc,Unknown_0x7417
	ld e,$01
	ld bc,$4C05
	jp Unknown_0x37F4

Unknown_0x7417:
	jp Unknown_0x37F7

UnknownData_0x741A:
INCBIN "baserom.gb", $741A, $741F - $741A

Unknown_0x741F:
INCBIN "baserom.gb", $741F, $743B - $741F
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7C45
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3957
	call Unknown_0x3765
	jr nc,Unknown_0x7467
	ld e,$01
	ld bc,$7815
	jp Unknown_0x37F4

Unknown_0x7467:
	jp Unknown_0x37F7

UnknownData_0x746A:
INCBIN "baserom.gb", $746A, $746C - $746A

Unknown_0x746C:
INCBIN "baserom.gb", $746C, $7496 - $746C
	call Unknown_0x3847
	ld a,h
	ld e,$6D
	ld [de],a
	ld hl,$74AA
	add a,l
	ld l,a
	jr nc,Unknown_0x74A5
	inc h

Unknown_0x74A5:
	ld a,[hl]
	ld e,$15
	ld [de],a
	ret

UnknownData_0x74AA:
INCBIN "baserom.gb", $74AA, $74B0 - $74AA
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x3924
	call Unknown_0x7ADB
	jr nc,Unknown_0x74D1
	ld e,$01
	ld bc,$76A8
	jp Unknown_0x37F4

Unknown_0x74D1:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x74DF
	ld e,$01
	ld bc,$760D
	jp Unknown_0x37F4

Unknown_0x74DF:
	call Unknown_0x7A55
	jr nc,Unknown_0x74EC
	ld e,$01
	ld bc,$7525
	jp Unknown_0x37F4

Unknown_0x74EC:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x74FA
	ld e,$01
	ld bc,$777F
	jp Unknown_0x37F4

Unknown_0x74FA:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x7508
	ld e,$01
	ld bc,$770C
	jp Unknown_0x37F4

Unknown_0x7508:
	call Unknown_0x36E6
	jr nc,Unknown_0x7515
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x7515:
	call Unknown_0x374E
	jr nc,Unknown_0x7522
	ld e,$01
	ld bc,$7488
	jp Unknown_0x37F4

Unknown_0x7522:
	jp Unknown_0x37F7

UnknownData_0x7525:
INCBIN "baserom.gb", $7525, $7567 - $7525
	call Unknown_0x359A
	call Unknown_0x7C45

Unknown_0x756D:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x7A9E
	jr nc,Unknown_0x7585
	ld e,$01
	ld bc,$7488
	jp Unknown_0x37F4

Unknown_0x7585:
	call Unknown_0x7ADB
	jr nc,Unknown_0x7592
	ld e,$01
	ld bc,$76A8
	jp Unknown_0x37F4

Unknown_0x7592:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x75A0
	ld e,$01
	ld bc,$760D
	jp Unknown_0x37F4

Unknown_0x75A0:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x75AF
	ld e,$01
	ld bc,$7488
	jp Unknown_0x37F4

Unknown_0x75AF:
	call Unknown_0x373B
	jr nc,Unknown_0x75BC
	ld e,$01
	ld bc,$75F5
	jp Unknown_0x37F4

Unknown_0x75BC:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x75CA
	ld e,$01
	ld bc,$777F
	jp Unknown_0x37F4

Unknown_0x75CA:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x75D8
	ld e,$01
	ld bc,$770C
	jp Unknown_0x37F4

Unknown_0x75D8:
	call Unknown_0x374E
	jr nc,Unknown_0x75E5
	ld e,$01
	ld bc,$7525
	jp Unknown_0x37F4

Unknown_0x75E5:
	call Unknown_0x36E6
	jr nc,Unknown_0x75F2
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x75F2:
	jp Unknown_0x37F7

UnknownData_0x75F5:
INCBIN "baserom.gb", $75F5, $7604 - $75F5
	call Unknown_0x359A
	call Unknown_0x7C20
	jp Unknown_0x756D

UnknownData_0x760D:
INCBIN "baserom.gb", $760D, $7630 - $760D
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x7641
	ld e,$01
	ld bc,$761C
	jp Unknown_0x37F4

Unknown_0x7641:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x7654
	ld h,d
	ld l,$1F
	ld [hl],$41
	inc l
	ld [hl],$76
	inc l
	ld [hl],$54

Unknown_0x7654:
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x767D
	ld e,$01
	ld bc,$7471
	jp Unknown_0x37F4

Unknown_0x767D:
	call Unknown_0x39C1
	jr nc,Unknown_0x768A
	ld e,$01
	ld bc,$76A8
	jp Unknown_0x37F4

Unknown_0x768A:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x7698
	ld e,$01
	ld bc,$770C
	jp Unknown_0x37F4

Unknown_0x7698:
	call Unknown_0x36E6
	jr nc,Unknown_0x76A5
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x76A5:
	jp Unknown_0x37F7

UnknownData_0x76A8:
INCBIN "baserom.gb", $76A8, $76B5 - $76A8
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0x7CB8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3992
	jr nc,Unknown_0x76DE
	ld e,$01
	ld bc,$7471
	jp Unknown_0x37F4

Unknown_0x76DE:
	call Unknown_0x3957
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x76EF
	ld e,$01
	ld bc,$770C
	jp Unknown_0x37F4

Unknown_0x76EF:
	call Unknown_0x3765
	jr nc,Unknown_0x76FC
	ld e,$01
	ld bc,$7815
	jp Unknown_0x37F4

Unknown_0x76FC:
	call Unknown_0x36E6
	jr nc,Unknown_0x7709
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x7709:
	jp Unknown_0x37F7

UnknownData_0x770C:
INCBIN "baserom.gb", $770C, $7741 - $770C
	ld e,$45
	ld a,[de]
	rla
	ld a,[$FF00+$A5]
	jr c,Unknown_0x774F
	bit 4,a
	jr z,Unknown_0x7755
	jr Unknown_0x7758

Unknown_0x774F:
	bit 5,a
	jr z,Unknown_0x7755
	jr Unknown_0x7758

Unknown_0x7755:
	call Unknown_0x7A35

Unknown_0x7758:
	call Unknown_0x7A42
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	call Unknown_0x3957
	call Unknown_0x3765
	jr nc,Unknown_0x777C
	ld e,$01
	ld bc,$4C05
	jp Unknown_0x37F4

Unknown_0x777C:
	jp Unknown_0x37F7

UnknownData_0x777F:
INCBIN "baserom.gb", $777F, $77ED - $777F
	ld a,[$A05B]
	bit 7,a
	jr z,Unknown_0x77F7
	xor a
	jr Unknown_0x7800

Unknown_0x77F7:
	ld hl,$7804
	add a,l
	ld l,a
	jr nc,Unknown_0x77FF
	inc h

Unknown_0x77FF:
	ld a,[hl]

Unknown_0x7800:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x7804:
INCBIN "baserom.gb", $7804, $780B - $7804
	call Unknown_0x7A1B
	jp Unknown_0x37F7
	call Unknown_0x34FD
	ret

UnknownData_0x7815:
INCBIN "baserom.gb", $7815, $79F4 - $7815
	ld a,[$A051]
	ld hl,$7A0D
	add a,l
	ld l,a
	jr nc,Unknown_0x79FF
	inc h

Unknown_0x79FF:
	ld a,[hl]
	ld [$A051],a
	ld a,$00
	ld [$A050],a
	xor a
	ld [$A054],a
	ret

UnknownData_0x7A0D:
INCBIN "baserom.gb", $7A0D, $7A1B - $7A0D

Unknown_0x7A1B:
	call Unknown_0x7A35
	call Unknown_0x7A42
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x7B09
	call Unknown_0x391F
	call Unknown_0x3977
	jp Unknown_0x3957

Unknown_0x7A35:
	ld a,[$A070]
	or a
	ld e,$0E
	jr z,Unknown_0x7A3F
	ld e,$09

Unknown_0x7A3F:
	jp Unknown_0x0D04

Unknown_0x7A42:
	ld a,[$A070]
	or a
	ld e,$20
	ld bc,$0280
	jr z,Unknown_0x7A52
	ld e,$08
	ld bc,$00E0

Unknown_0x7A52:
	jp Unknown_0x0D23

Unknown_0x7A55:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0x7A8A
	ld h,d
	ld de,$FFF9
	bit 4,a
	jr z,Unknown_0x7A73
	ld bc,$0007
	call Unknown_0x1AD9
	call Unknown_0x17A3
	jr nc,Unknown_0x7A82
	rla
	jr c,Unknown_0x7A87
	jr Unknown_0x7A82

Unknown_0x7A73:
	ld bc,$FFF8
	call Unknown_0x1AD9
	call Unknown_0x16EF
	jr nc,Unknown_0x7A82
	dec a
	rla
	jr nc,Unknown_0x7A87

Unknown_0x7A82:
	ld a,[$FF00+$9A]
	ld d,a
	scf
	ret

Unknown_0x7A87:
	ld a,[$FF00+$9A]
	ld d,a

Unknown_0x7A8A:
	and a
	ret

Unknown_0x7A8C:
	call Unknown_0x1DC7
	jr nc,Unknown_0x7A9C
	call Unknown_0x7ABB
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0x7A9C:
	and a
	ret

Unknown_0x7A9E:
	call Unknown_0x1D8B
	jr nc,Unknown_0x7AB9
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$0E
	ld a,[de]
	xor b
	rla
	jr c,Unknown_0x7AB9
	call Unknown_0x7ABB
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0x7AB9:
	and a
	ret

Unknown_0x7ABB:
	ld h,d
	ld l,$0E
	ld a,[hld]
	rla
	ld a,[hli]
	ld e,$52
	jr c,Unknown_0x7AD0
	sub $B3
	ld a,[hl]
	sbc a,$00
	jr c,Unknown_0x7ADA
	ld a,$03
	jr Unknown_0x7AD9

Unknown_0x7AD0:
	add a,$B3
	ld a,[hl]
	adc a,$00
	jr c,Unknown_0x7ADA
	ld a,$04

Unknown_0x7AD9:
	ld [de],a

Unknown_0x7ADA:
	ret

Unknown_0x7ADB:
	call Unknown_0x1B61
	ret c
	ld a,[$FF00+$9E]
	cp $04
	jr c,Unknown_0x7AFF
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr c,Unknown_0x7AFC
	ld a,[$FF00+$9A]
	ld d,a
	jr Unknown_0x7AFF

Unknown_0x7AFC:
	call Unknown_0x1BBA

Unknown_0x7AFF:
	ld e,$4E
	ld a,[de]
	cp $31
	call z,Unknown_0x3C63
	and a
	ret

Unknown_0x7B09:
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$0D
	ld [hli],a
	ld a,$F3
	ld [hli],a
	ret

UnknownData_0x7B1F:
INCBIN "baserom.gb", $7B1F, $7B2B - $7B1F
	ld e,$45
	ld a,[de]
	rla
	ld e,$52
	ld a,[de]
	jr nc,Unknown_0x7B35
	cpl

Unknown_0x7B35:
	rra
	ld a,[bc]
	inc bc
	jr c,Unknown_0x7B3B
	ld a,[bc]

Unknown_0x7B3B:
	inc bc
	ld e,$15
	ld [de],a
	ret
	push bc
	call Unknown_0x1AB3
	pop bc
	jr nz,Unknown_0x7B72
	ld a,$01
	ld [$A070],a
	push bc
	call Unknown_0x7B09
	call Unknown_0x1AF6
	pop bc
	jr nc,Unknown_0x7B5C
	ld e,$27
	ld a,$06
	ld [de],a
	ret

Unknown_0x7B5C:
	ld h,d
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ld l,$0D
	ld a,[hli]
	or [hl]
	ld e,$27
	jr nz,Unknown_0x7B6E
	ld a,$04
	ld [de],a
	ret

Unknown_0x7B6E:
	ld a,$05
	ld [de],a
	ret

Unknown_0x7B72:
	xor a
	ld [$A070],a
	ld a,[$A050]
	cp $0D
	jr nz,Unknown_0x7B83
	ld e,$27
	ld a,$03
	ld [de],a
	ret

Unknown_0x7B83:
	ld e,$10
	ld a,[de]
	rla
	jr c,Unknown_0x7B93
	push bc
	call Unknown_0x7B09
	call Unknown_0x1AF6
	pop bc
	jr nc,Unknown_0x7B99

Unknown_0x7B93:
	ld e,$27
	ld a,$02
	ld [de],a
	ret

Unknown_0x7B99:
	ld h,d
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ld l,$0D
	ld a,[hli]
	or [hl]
	ld e,$27
	jr nz,Unknown_0x7BAB
	ld a,$00
	ld [de],a
	ret

Unknown_0x7BAB:
	ld a,$01
	ld [de],a
	ret

Unknown_0x7BAF:
	ld e,$45
	ld a,[de]
	rla
	ld a,[$FF00+$A5]
	bit 5,a
	jr nc,Unknown_0x7BBB
	bit 4,a

Unknown_0x7BBB:
	jr z,Unknown_0x7BC6
	ld e,$15
	ld a,[de]
	cp h
	ld a,l
	jr z,Unknown_0x7BC5
	ld a,h

Unknown_0x7BC5:
	ld [de],a

Unknown_0x7BC6:
	ret

Unknown_0x7BC7:
	ld e,$4E
	ld a,[de]
	and $F0
	cp $70
	ld b,$00
	jr z,Unknown_0x7BDA
	inc b
	ld a,[$A070]
	or a
	jr nz,Unknown_0x7BDA
	inc b

Unknown_0x7BDA:
	ld e,$4D
	ld a,[de]
	cp $04
	jr c,Unknown_0x7C0F
	ld e,$20
	jr nz,Unknown_0x7BFA
	bit 1,b
	jr nz,Unknown_0x7BF4
	ld e,$0B
	bit 0,b
	ld bc,$FF00
	jr nz,Unknown_0x7BF7
	ld e,$18

Unknown_0x7BF4:
	ld bc,$FE20

Unknown_0x7BF7:
	jp Unknown_0x0CD3

Unknown_0x7BFA:
	bit 1,b
	jr nz,Unknown_0x7C09
	ld e,$0B
	bit 0,b
	ld bc,$0100
	jr nz,Unknown_0x7C0C
	ld e,$18

Unknown_0x7C09:
	ld bc,$01E0

Unknown_0x7C0C:
	jp Unknown_0x0CA2

Unknown_0x7C0F:
	bit 1,b
	ld e,$0E
	jr nz,Unknown_0x7C1D
	bit 0,b
	ld e,$05
	jr nz,Unknown_0x7C1D
	ld e,$04

Unknown_0x7C1D:
	jp Unknown_0x0D04

Unknown_0x7C20:
	ld e,$6D
	ld a,[de]
	cp $03
	ld e,$28
	jr c,Unknown_0x7C2B
	ld e,$08

Unknown_0x7C2B:
	jp Unknown_0x0D04

Unknown_0x7C2E:
	call Unknown_0x3847
	ld a,h
	ld hl,$7C3F
	add a,l
	ld l,a
	jr nc,Unknown_0x7C3A
	inc h

Unknown_0x7C3A:
	ld a,[hl]
	ld e,a
	jp Unknown_0x0D04

UnknownData_0x7C3F:
INCBIN "baserom.gb", $7C3F, $7C45 - $7C3F

Unknown_0x7C45:
	ld e,$6D
	ld a,[de]
	cp $03
	jr nc,Unknown_0x7C6D
	cp $01
	jr z,Unknown_0x7C5B
	jr nc,Unknown_0x7C64
	ld hl,$200E
	ld bc,$0133
	jp Unknown_0x386E

Unknown_0x7C5B:
	ld hl,$080E
	ld bc,$00A0
	jp Unknown_0x386E

Unknown_0x7C64:
	ld hl,$200E
	ld bc,$01E0
	jp Unknown_0x386E

Unknown_0x7C6D:
	cp $04
	jr z,Unknown_0x7C7C
	jr nc,Unknown_0x7C85
	ld hl,$1804
	ld bc,$0133
	jp Unknown_0x386E

Unknown_0x7C7C:
	ld hl,$0604
	ld bc,$00A0
	jp Unknown_0x386E

Unknown_0x7C85:
	ld hl,$1804
	ld bc,$01E0
	jp Unknown_0x386E

Unknown_0x7C8E:
	ld e,$6D
	ld a,[de]
	cp $03
	jr c,Unknown_0x7C97
	sub $03

Unknown_0x7C97:
	cp $01
	jr z,Unknown_0x7CA6
	jr nc,Unknown_0x7CAF
	ld hl,$0B05
	ld bc,$0099
	jp Unknown_0x386E

Unknown_0x7CA6:
	ld hl,$0305
	ld bc,$0040
	jp Unknown_0x386E

Unknown_0x7CAF:
	ld hl,$0B05
	ld bc,$0100
	jp Unknown_0x386E

Unknown_0x7CB8:
	ld hl,$160E
	ld bc,$0133
	jp Unknown_0x3894

Unknown_0x7CC1:
	ld hl,$1609
	ld bc,$00C0
	jp Unknown_0x3894

Unknown_0x7CCA:
	ld hl,$0809
	ld bc,$010C
	jp Unknown_0x3894

Unknown_0x7CD3:
	ld hl,$2C0E
	ld bc,$0133
	jp Unknown_0x3894

Unknown_0x7CDC:
	ld a,[$FF00+$A5]
	ld e,a
	and $41
	jr nz,Unknown_0x7CF0
	ld a,e
	and $80
	jr z,Unknown_0x7CF8
	ld e,$2C
	ld bc,$0133
	jp Unknown_0x0D23

Unknown_0x7CF0:
	ld e,$2C
	ld bc,$FECD
	jp Unknown_0x0D54

Unknown_0x7CF8:
	ld e,$0E
	jp Unknown_0x0D85

Unknown_0x7CFD:
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0x7D0D
	ld e,$50
	ld bc,$FEB3
	call Unknown_0x0D54
	jr Unknown_0x7D15

Unknown_0x7D0D:
	ld e,$14
	ld bc,$0100
	call Unknown_0x0D23

Unknown_0x7D15:
	ret

Unknown_0x7D16:
	ld h,d
	ld l,$6E
	ld a,[hl]
	or a
	jr z,Unknown_0x7D20
	dec [hl]
	jr Unknown_0x7D2F

Unknown_0x7D20:
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0x7D2F
	ld [hl],$0F
	ld l,$0F
	ld [hl],$00
	inc l
	ld [hl],$FF

Unknown_0x7D2F:
	ld e,$08
	ld bc,$00E0
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x7D3F
	ld e,$10
	ld bc,$0200

Unknown_0x7D3F:
	jp Unknown_0x0D23

UnknownData_0x7D42:
INCBIN "baserom.gb", $7D42, $7D6E - $7D42

Unknown_0x7D6E:
	call Unknown_0x3AE9
	ret nc
	ld hl,$A06C
	set 3,[hl]
	ret
	ld h,$00
	ld a,[$FF00+$A5]
	bit 6,a
	jr nz,Unknown_0x7D86
	inc h
	bit 7,a
	jr nz,Unknown_0x7D86
	inc h

Unknown_0x7D86:
	ld a,h
	ld e,$27
	ld [de],a
	ret
	ld e,$27
	ld a,[de]
	cp $02
	jr nc,Unknown_0x7D96
	add a,$05
	jr Unknown_0x7D98

Unknown_0x7D96:
	ld a,$04

Unknown_0x7D98:
	ld e,$15
	ld [de],a
	ret

Unknown_0x7D9C:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0x7DAD
	bit 4,a
	ld a,$40
	jr nz,Unknown_0x7DAA
	ld a,$C0

Unknown_0x7DAA:
	ld e,$45
	ld [de],a

Unknown_0x7DAD:
	ld e,$27
	ld a,[de]
	ld l,a
	ld a,[$FF00+$A5]
	and $F0
	ld h,l
	jr z,Unknown_0x7DC4
	ld h,$00
	bit 6,a
	jr nz,Unknown_0x7DC4
	inc h
	bit 7,a
	jr nz,Unknown_0x7DC4
	inc h

Unknown_0x7DC4:
	ld a,h
	cp l
	jr nz,Unknown_0x7DCA
	and a
	ret

Unknown_0x7DCA:
	ld [de],a
	scf
	ret

UnknownData_0x7DCD:
INCBIN "baserom.gb", $7DCD, $7F1C - $7DCD

Unknown_0x7F1C:
INCBIN "baserom.gb", $7F1C, $8000 - $7F1C

SECTION "Bank02", ROMX, BANK[$02]

UnknownData_0x8000:
INCBIN "baserom.gb", $8000, $8040 - $8000
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0x80C0
	jr nc,Unknown_0x8053
	ld e,$02
	ld bc,$4025
	call Unknown_0x0846

Unknown_0x8053:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x806E
	ld e,$02
	ld bc,$42BD
	jp Unknown_0x37F4

Unknown_0x806E:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x807C
	ld e,$02
	ld bc,$41ED
	jp Unknown_0x37F4

Unknown_0x807C:
	call Unknown_0x3650
	jr nc,Unknown_0x8089
	ld e,$02
	ld bc,$4393
	jp Unknown_0x37F4

Unknown_0x8089:
	call Unknown_0xB663
	jr nc,Unknown_0x8096
	ld e,$02
	ld bc,$40F5
	jp Unknown_0x37F4

Unknown_0x8096:
	call Unknown_0x369D
	jr nc,Unknown_0x80A3
	ld e,$02
	ld bc,$4352
	jp Unknown_0x37F4

Unknown_0x80A3:
	call Unknown_0x36E6
	jr nc,Unknown_0x80B0
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x80B0:
	call Unknown_0x3724
	jr nc,Unknown_0x80BD
	ld e,$01
	ld bc,$40F9
	jp Unknown_0x37F4

Unknown_0x80BD:
	jp Unknown_0x37F7

Unknown_0x80C0:
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$3B
	ld a,[de]
	xor b
	rla
	ret nc
	ld a,b
	ld [de],a
	ld a,$07
	ld e,$3C
	ld [de],a
	ld a,$04
	ld e,$15
	ld [de],a
	ret

UnknownData_0x80D7:
INCBIN "baserom.gb", $80D7, $80DA - $80D7

Unknown_0x80DA:
INCBIN "baserom.gb", $80DA, $80E2 - $80DA
	ld e,$3C
	ld a,[de]
	cp $04
	ld a,$04
	jr nc,Unknown_0x80EC
	dec a

Unknown_0x80EC:
	ld e,$15
	ld [de],a
	ld e,$3C
	ld a,[de]
	dec a
	ld [de],a
	ret

UnknownData_0x80F5:
INCBIN "baserom.gb", $80F5, $8133 - $80F5
	call Unknown_0x359A
	call Unknown_0xB96D

Unknown_0x8139:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0xB6C5
	jr nc,Unknown_0x8151
	ld e,$02
	ld bc,$4025
	jp Unknown_0x37F4

Unknown_0x8151:
	call Unknown_0xB5A1
	jr nc,Unknown_0x815E
	ld e,$02
	ld bc,$42BD
	jp Unknown_0x37F4

Unknown_0x815E:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x816C
	ld e,$02
	ld bc,$41ED
	jp Unknown_0x37F4

Unknown_0x816C:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x817B
	ld e,$02
	ld bc,$4025
	jp Unknown_0x37F4

Unknown_0x817B:
	call Unknown_0x3650
	jr nc,Unknown_0x8188
	ld e,$02
	ld bc,$4393
	jp Unknown_0x37F4

Unknown_0x8188:
	call Unknown_0x369D
	jr nc,Unknown_0x8195
	ld e,$02
	ld bc,$4352
	jp Unknown_0x37F4

Unknown_0x8195:
	call Unknown_0x373B
	jr nc,Unknown_0x81A2
	ld e,$02
	ld bc,$41CC
	jp Unknown_0x37F4

Unknown_0x81A2:
	call Unknown_0x36E6
	jr nc,Unknown_0x81AF
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x81AF:
	call Unknown_0x374E
	jr nc,Unknown_0x81BC
	ld e,$02
	ld bc,$40F5
	jp Unknown_0x37F4

Unknown_0x81BC:
	call Unknown_0x3724
	jr nc,Unknown_0x81C9
	ld e,$01
	ld bc,$40F9
	jp Unknown_0x37F4

Unknown_0x81C9:
	jp Unknown_0x37F7

UnknownData_0x81CC:
INCBIN "baserom.gb", $81CC, $81E4 - $81CC
	call Unknown_0x359A
	call Unknown_0xB968
	jp Unknown_0x8139

UnknownData_0x81ED:
INCBIN "baserom.gb", $81ED, $822F - $81ED
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x8240
	ld e,$02
	ld bc,$4203
	jp Unknown_0x37F4

Unknown_0x8240:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x8253
	ld h,d
	ld l,$1F
	ld [hl],$42
	inc l
	ld [hl],$42
	inc l
	ld [hl],$D8

Unknown_0x8253:
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBAB3
	call Unknown_0x80C0
	jr nc,Unknown_0x826B
	ld e,$02
	ld bc,$41FC
	call Unknown_0x0846

Unknown_0x826B:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x8286
	ld e,$02
	ld bc,$400A
	jp Unknown_0x37F4

Unknown_0x8286:
	call Unknown_0x39BC
	jr nc,Unknown_0x8293
	ld e,$02
	ld bc,$42BD
	jp Unknown_0x37F4

Unknown_0x8293:
	call Unknown_0x3650
	jr nc,Unknown_0x82A0
	ld e,$02
	ld bc,$4393
	jp Unknown_0x37F4

Unknown_0x82A0:
	call Unknown_0x3765
	jr nc,Unknown_0x82AD
	ld e,$02
	ld bc,$4A41
	jp Unknown_0x37F4

Unknown_0x82AD:
	call Unknown_0x36E6
	jr nc,Unknown_0x82BA
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x82BA:
	jp Unknown_0x37F7

UnknownData_0x82BD:
INCBIN "baserom.gb", $82BD, $82D8 - $82BD
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBAB3
	call Unknown_0x80C0
	jr nc,Unknown_0x82F3
	ld e,$02
	ld bc,$42BD
	call Unknown_0x0846

Unknown_0x82F3:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x830E
	ld e,$02
	ld bc,$400A
	jp Unknown_0x37F4

Unknown_0x830E:
	call Unknown_0x39BC
	jr nc,Unknown_0x831B
	ld e,$02
	ld bc,$42BD
	jp Unknown_0x37F4

Unknown_0x831B:
	call Unknown_0x3650
	jr nc,Unknown_0x8328
	ld e,$02
	ld bc,$4393
	jp Unknown_0x37F4

Unknown_0x8328:
	call Unknown_0x3765
	jr nc,Unknown_0x8335
	ld e,$02
	ld bc,$4A41
	jp Unknown_0x37F4

Unknown_0x8335:
	call Unknown_0x36E6
	jr nc,Unknown_0x8342
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8342:
	call Unknown_0x3724
	jr nc,Unknown_0x834F
	ld e,$01
	ld bc,$40F9
	jp Unknown_0x37F4

Unknown_0x834F:
	jp Unknown_0x37F7

UnknownData_0x8352:
INCBIN "baserom.gb", $8352, $836D - $8352
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D35
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x8390
	ld e,$02
	ld bc,$400A
	jp Unknown_0x37F4

Unknown_0x8390:
	jp Unknown_0x37F7

UnknownData_0x8393:
INCBIN "baserom.gb", $8393, $8413 - $8393
	ld e,$45
	ld a,[de]
	cpl
	ld [de],a
	ld e,$3B
	ld [de],a
	ret
	ld a,[$FF00+$A5]
	and $02
	ld e,$27
	ld [de],a
	ret

UnknownData_0x8424:
INCBIN "baserom.gb", $8424, $8435 - $8424
	ld hl,$7EA8
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$3F
	ld a,[de]
	or a
	jr z,Unknown_0x8461
	ld e,$15
	ld a,[de]
	cp $01
	jr c,Unknown_0x8461
	ld hl,Unknown_0x8491
	jr z,Unknown_0x8458
	ld hl,Unknown_0x8496

Unknown_0x8458:
	ld e,$3E
	ld a,[de]
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x8461:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x848E
	ld a,[$FF00+$A5]
	bit 1,a
	jr nz,Unknown_0x8475
	ld e,$02
	ld bc,$4424
	jp Unknown_0x37F4

Unknown_0x8475:
	and $30
	jr z,Unknown_0x848E
	bit 5,a
	ld e,$45
	ld a,[de]
	jr nz,Unknown_0x848B
	rla
	jr nc,Unknown_0x848E

Unknown_0x8483:
	ld e,$02
	ld bc,$43EC
	jp Unknown_0x37F4

Unknown_0x848B:
	rla
	jr nc,Unknown_0x8483

Unknown_0x848E:
	jp Unknown_0x37F7

Unknown_0x8491:
INCBIN "baserom.gb", $8491, $8496 - $8491

Unknown_0x8496:
INCBIN "baserom.gb", $8496, $84CA - $8496
	ld a,$04
	ld [$A05D],a
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x3952
	jp Unknown_0x37F7

UnknownData_0x84E6:
INCBIN "baserom.gb", $84E6, $84EB - $84E6
	ld a,[$A070]
	or a
	ld e,$60
	ld bc,$0400
	jr z,Unknown_0x84FB
	ld e,$40
	ld bc,$0200

Unknown_0x84FB:
	call Unknown_0x0D23
	ld a,[$A070]
	or a
	ld e,$0E
	jr z,Unknown_0x8508
	ld e,$09

Unknown_0x8508:
	call Unknown_0x0D04
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x8557
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x8529
	ld e,$02
	ld bc,$457F
	jp Unknown_0x37F4

Unknown_0x8529:
	call Unknown_0x3952
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0x853A
	ld e,$02
	ld bc,$461F
	jp Unknown_0x37F4

Unknown_0x853A:
	call Unknown_0x3765
	jr nc,Unknown_0x8547
	ld e,$02
	ld bc,$4567
	jp Unknown_0x37F4

Unknown_0x8547:
	call Unknown_0x377C
	jr nc,Unknown_0x8554
	ld e,$02
	ld bc,$4573
	jp Unknown_0x37F4

Unknown_0x8554:
	jp Unknown_0x37F7

Unknown_0x8557:
	ld a,$02
	ld hl,Unknown_0x8562
	call Unknown_0x3AAA
	jp Unknown_0x3AE4

Unknown_0x8562:
INCBIN "baserom.gb", $8562, $859A - $8562
	ld e,$4D
	ld a,[de]
	cp $04
	ld a,$08
	jr c,Unknown_0x85A5
	ld a,$04

Unknown_0x85A5:
	ld e,$24
	ld [de],a
	ld e,$0E
	ld a,[de]
	ld h,a
	dec e
	ld a,[de]
	or h
	ret z
	ld e,$45
	ld a,[de]
	xor h
	rla
	ld e,$15
	ld a,[de]
	jr c,Unknown_0x85C2
	inc a
	cp $08
	jr c,Unknown_0x85C9
	xor a
	jr Unknown_0x85C9

Unknown_0x85C2:
	dec a
	cp $08
	jr c,Unknown_0x85C9
	ld a,$07

Unknown_0x85C9:
	ld [de],a
	ret
	call Unknown_0xB9FB
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	call nz,Unknown_0x8557
	call Unknown_0xB926
	call Unknown_0xB6DF
	call Unknown_0xB5A1
	jr nc,Unknown_0x85F3
	ld e,$02
	ld bc,$44E6
	jp Unknown_0x37F4

Unknown_0x85F3:
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0x8601
	ld e,$02
	ld bc,$461F
	jp Unknown_0x37F4

Unknown_0x8601:
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	ld e,$3A
	jr z,Unknown_0x860F
	ld a,$78
	ld [de],a

Unknown_0x860F:
	ld a,[de]
	dec a
	ld [de],a
	jr nz,Unknown_0x861C
	ld e,$02
	ld bc,$461F
	jp Unknown_0x37F4

Unknown_0x861C:
	jp Unknown_0x37F7

UnknownData_0x861F:
INCBIN "baserom.gb", $861F, $867D - $861F
	call Unknown_0xBEA8
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

Unknown_0x8689:
	ld e,$7C
	ld a,[de]
	rra
	ret

UnknownData_0x868E:
INCBIN "baserom.gb", $868E, $869B - $868E
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x86B6
	ld e,$02
	ld bc,$481C
	jp Unknown_0x37F4

Unknown_0x86B6:
	call Unknown_0x8689
	jr nc,Unknown_0x86C3
	ld e,$02
	ld bc,$4660
	jp Unknown_0x37F4

Unknown_0x86C3:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x86D1
	ld e,$02
	ld bc,$478A
	jp Unknown_0x37F4

Unknown_0x86D1:
	call Unknown_0xB663
	jr nc,Unknown_0x86DE
	ld e,$02
	ld bc,$46EE
	jp Unknown_0x37F4

Unknown_0x86DE:
	call Unknown_0x369D
	jr nc,Unknown_0x86EB
	ld e,$02
	ld bc,$487F
	jp Unknown_0x37F4

Unknown_0x86EB:
	jp Unknown_0x37F7

UnknownData_0x86EE:
INCBIN "baserom.gb", $86EE, $871B - $86EE
	call Unknown_0xB99D
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0xB6C5
	jr nc,Unknown_0x8736
	ld e,$02
	ld bc,$468E
	jp Unknown_0x37F4

Unknown_0x8736:
	call Unknown_0xB5A1
	jr nc,Unknown_0x8743
	ld e,$02
	ld bc,$481C
	jp Unknown_0x37F4

Unknown_0x8743:
	call Unknown_0x8689
	jr nc,Unknown_0x8750
	ld e,$02
	ld bc,$4660
	jp Unknown_0x37F4

Unknown_0x8750:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x875E
	ld e,$02
	ld bc,$478A
	jp Unknown_0x37F4

Unknown_0x875E:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x876D
	ld e,$02
	ld bc,$468E
	jp Unknown_0x37F4

Unknown_0x876D:
	call Unknown_0x369D
	jr nc,Unknown_0x877A
	ld e,$02
	ld bc,$487F
	jp Unknown_0x37F4

Unknown_0x877A:
	call Unknown_0x374E
	jr nc,Unknown_0x8787
	ld e,$02
	ld bc,$46EE
	jp Unknown_0x37F4

Unknown_0x8787:
	jp Unknown_0x37F7

UnknownData_0x878A:
INCBIN "baserom.gb", $878A, $87AB - $878A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x87B9
	ld e,$02
	ld bc,$4797
	jp Unknown_0x37F4

Unknown_0x87B9:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x87CC
	ld h,d
	ld l,$1F
	ld [hl],$42
	inc l
	ld [hl],$48
	inc l
	ld [hl],$2F

Unknown_0x87CC:
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBABC
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x87F2
	ld e,$02
	ld bc,$4649
	jp Unknown_0x37F4

Unknown_0x87F2:
	call Unknown_0x39BC
	jr nc,Unknown_0x87FF
	ld e,$02
	ld bc,$481C
	jp Unknown_0x37F4

Unknown_0x87FF:
	call Unknown_0x8689
	jr nc,Unknown_0x880C
	ld e,$02
	ld bc,$4660
	jp Unknown_0x37F4

Unknown_0x880C:
	call Unknown_0x3765
	jr nc,Unknown_0x8819
	ld e,$02
	ld bc,$48C2
	jp Unknown_0x37F4

Unknown_0x8819:
	jp Unknown_0x37F7

UnknownData_0x881C:
INCBIN "baserom.gb", $881C, $882F - $881C
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBABC
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x8855
	ld e,$02
	ld bc,$4649
	jp Unknown_0x37F4

Unknown_0x8855:
	call Unknown_0x39BC
	jr nc,Unknown_0x8862
	ld e,$02
	ld bc,$481C
	jp Unknown_0x37F4

Unknown_0x8862:
	call Unknown_0x8689
	jr nc,Unknown_0x886F
	ld e,$02
	ld bc,$4660
	jp Unknown_0x37F4

Unknown_0x886F:
	call Unknown_0x3765
	jr nc,Unknown_0x887C
	ld e,$02
	ld bc,$48C2
	jp Unknown_0x37F4

Unknown_0x887C:
	jp Unknown_0x37F7

UnknownData_0x887F:
INCBIN "baserom.gb", $887F, $88DB - $887F
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x88F6
	ld e,$02
	ld bc,$49B2
	jp Unknown_0x37F4

Unknown_0x88F6:
	call Unknown_0x8689
	jr nc,Unknown_0x8903
	ld e,$02
	ld bc,$4660
	jp Unknown_0x37F4

Unknown_0x8903:
	call Unknown_0x37BD
	jr nc,Unknown_0x8910
	ld e,$02
	ld bc,$49B2
	jp Unknown_0x37F4

Unknown_0x8910:
	call Unknown_0xB663
	jr nc,Unknown_0x891D
	ld e,$02
	ld bc,$4920
	jp Unknown_0x37F4

Unknown_0x891D:
	jp Unknown_0x37F7

UnknownData_0x8920:
INCBIN "baserom.gb", $8920, $8944 - $8920
	call Unknown_0xBAFD
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0xB6C5
	jr nc,Unknown_0x895F
	ld e,$02
	ld bc,$48CE
	jp Unknown_0x37F4

Unknown_0x895F:
	call Unknown_0xB5A1
	jr nc,Unknown_0x896C
	ld e,$02
	ld bc,$49B2
	jp Unknown_0x37F4

Unknown_0x896C:
	call Unknown_0x8689
	jr nc,Unknown_0x8979
	ld e,$02
	ld bc,$4660
	jp Unknown_0x37F4

Unknown_0x8979:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x8988
	ld e,$02
	ld bc,$48CE
	jp Unknown_0x37F4

Unknown_0x8988:
	call Unknown_0x37BD
	jr nc,Unknown_0x8995
	ld e,$02
	ld bc,$49B2
	jp Unknown_0x37F4

Unknown_0x8995:
	call Unknown_0x374E
	jr nc,Unknown_0x89A2
	ld e,$02
	ld bc,$4920
	jp Unknown_0x37F4

Unknown_0x89A2:
	call Unknown_0x377C
	jr nc,Unknown_0x89AF
	ld e,$02
	ld bc,$4A29
	jp Unknown_0x37F4

Unknown_0x89AF:
	jp Unknown_0x37F7

UnknownData_0x89B2:
INCBIN "baserom.gb", $89B2, $89DB - $89B2
	call Unknown_0xBB81
	call Unknown_0xBBB6
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x89FC
	ld e,$02
	ld bc,$4649
	jp Unknown_0x37F4

Unknown_0x89FC:
	call Unknown_0x393E
	call Unknown_0x8689
	jr nc,Unknown_0x8A0C
	ld e,$02
	ld bc,$4660
	jp Unknown_0x37F4

Unknown_0x8A0C:
	call Unknown_0x37CB
	jr nc,Unknown_0x8A19
	ld e,$02
	ld bc,$49B2
	jp Unknown_0x37F4

Unknown_0x8A19:
	call Unknown_0x377C
	jr nc,Unknown_0x8A26
	ld e,$02
	ld bc,$4A29
	jp Unknown_0x37F4

Unknown_0x8A26:
	jp Unknown_0x37F7

UnknownData_0x8A29:
INCBIN "baserom.gb", $8A29, $8A6B - $8A29
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0x80C0
	jr nc,Unknown_0x8A7E
	ld e,$02
	ld bc,$4A50
	call Unknown_0x0846

Unknown_0x8A7E:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x8A99
	ld e,$02
	ld bc,$4BB6
	jp Unknown_0x37F4

Unknown_0x8A99:
	call Unknown_0x37BD
	jr nc,Unknown_0x8AA6
	ld e,$02
	ld bc,$4BB6
	jp Unknown_0x37F4

Unknown_0x8AA6:
	call Unknown_0x3650
	jr nc,Unknown_0x8AB3
	ld e,$02
	ld bc,$4393
	jp Unknown_0x37F4

Unknown_0x8AB3:
	call Unknown_0xB663
	jr nc,Unknown_0x8AC0
	ld e,$02
	ld bc,$4ADD
	jp Unknown_0x37F4

Unknown_0x8AC0:
	call Unknown_0x36E6
	jr nc,Unknown_0x8ACD
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8ACD:
	call Unknown_0x3724
	jr nc,Unknown_0x8ADA
	ld e,$01
	ld bc,$40F9
	jp Unknown_0x37F4

Unknown_0x8ADA:
	jp Unknown_0x37F7

UnknownData_0x8ADD:
INCBIN "baserom.gb", $8ADD, $8B1B - $8ADD
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0x80C0
	jr nc,Unknown_0x8B2E
	ld e,$02
	ld bc,$4ADD
	call Unknown_0x0846

Unknown_0x8B2E:
	call Unknown_0xBAD3
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0xB6C5
	jr nc,Unknown_0x8B49
	ld e,$02
	ld bc,$4A50
	jp Unknown_0x37F4

Unknown_0x8B49:
	call Unknown_0xB5A1
	jr nc,Unknown_0x8B56
	ld e,$02
	ld bc,$4BB6
	jp Unknown_0x37F4

Unknown_0x8B56:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x8B65
	ld e,$02
	ld bc,$4A50
	jp Unknown_0x37F4

Unknown_0x8B65:
	call Unknown_0x37BD
	jr nc,Unknown_0x8B72
	ld e,$02
	ld bc,$4BB6
	jp Unknown_0x37F4

Unknown_0x8B72:
	call Unknown_0x3650
	jr nc,Unknown_0x8B7F
	ld e,$02
	ld bc,$4393
	jp Unknown_0x37F4

Unknown_0x8B7F:
	call Unknown_0x36E6
	jr nc,Unknown_0x8B8C
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8B8C:
	call Unknown_0x374E
	jr nc,Unknown_0x8B99
	ld e,$02
	ld bc,$4ADD
	jp Unknown_0x37F4

Unknown_0x8B99:
	call Unknown_0x3724
	jr nc,Unknown_0x8BA6
	ld e,$01
	ld bc,$40F9
	jp Unknown_0x37F4

Unknown_0x8BA6:
	call Unknown_0x377C
	jr nc,Unknown_0x8BB3
	ld e,$02
	ld bc,$4C62
	jp Unknown_0x37F4

Unknown_0x8BB3:
	jp Unknown_0x37F7

UnknownData_0x8BB6:
INCBIN "baserom.gb", $8BB6, $8BEA - $8BB6
	call Unknown_0x359A
	call Unknown_0xBB55
	call Unknown_0xBBAD
	call Unknown_0x80C0
	jr nc,Unknown_0x8C00
	ld e,$02
	ld bc,$4BB6
	call Unknown_0x0846

Unknown_0x8C00:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x8C1B
	ld e,$02
	ld bc,$400A
	jp Unknown_0x37F4

Unknown_0x8C1B:
	call Unknown_0x393E
	call Unknown_0x3650
	jr nc,Unknown_0x8C2B
	ld e,$02
	ld bc,$4393
	jp Unknown_0x37F4

Unknown_0x8C2B:
	call Unknown_0x37CB
	jr nc,Unknown_0x8C38
	ld e,$02
	ld bc,$4BB6
	jp Unknown_0x37F4

Unknown_0x8C38:
	call Unknown_0x377C
	jr nc,Unknown_0x8C45
	ld e,$02
	ld bc,$4C62
	jp Unknown_0x37F4

Unknown_0x8C45:
	call Unknown_0x36E6
	jr nc,Unknown_0x8C52
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8C52:
	call Unknown_0x3724
	jr nc,Unknown_0x8C5F
	ld e,$01
	ld bc,$40F9
	jp Unknown_0x37F4

Unknown_0x8C5F:
	jp Unknown_0x37F7

UnknownData_0x8C62:
INCBIN "baserom.gb", $8C62, $8C9C - $8C62
	ld hl,Unknown_0xB2BE
	ld a,$01
	call Unknown_0x05CF
	ret
	call Unknown_0xBEA8
	ld a,[$A056]
	or a
	jr z,Unknown_0x8CBC
	ld a,[$A055]
	or a
	jr nz,Unknown_0x8CBC
	ld e,$02
	ld bc,$4D2C
	jp Unknown_0x37F4

Unknown_0x8CBC:
	ld h,d
	ld l,$39
	ld a,[hl]
	or a
	jr z,Unknown_0x8CC6
	dec [hl]
	jr Unknown_0x8CE0

Unknown_0x8CC6:
	ld a,[$FF00+$A5]
	bit 1,a
	jr nz,Unknown_0x8CE0
	ld a,[$A056]
	or a
	jr nz,Unknown_0x8CE0
	ld a,[$A055]
	or a
	jr nz,Unknown_0x8CE0
	ld e,$02
	ld bc,$4D0D
	jp Unknown_0x37F4

Unknown_0x8CE0:
	call Unknown_0x3A24
	jr nc,Unknown_0x8CED
	ld e,$02
	ld bc,$4A41
	jp Unknown_0x37F4

Unknown_0x8CED:
	ld e,$3D
	ld a,[de]
	or a
	jr z,Unknown_0x8CF7
	dec a
	ld [de],a
	jr Unknown_0x8CFF

Unknown_0x8CF7:
	ld hl,Unknown_0xB348
	ld a,$01
	call Unknown_0x05CF

Unknown_0x8CFF:
	ld hl,Unknown_0x8D08
	call Unknown_0x3AAA
	jp Unknown_0x37F7

Unknown_0x8D08:
INCBIN "baserom.gb", $8D08, $8D44 - $8D08
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xB96D
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x3952
	call Unknown_0x3765
	jr nc,Unknown_0x8D70
	ld e,$02
	ld bc,$51C0
	jp Unknown_0x37F4

Unknown_0x8D70:
	jp Unknown_0x37F7

UnknownData_0x8D73:
INCBIN "baserom.gb", $8D73, $8DA4 - $8D73
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x8DC5
	ld e,$02
	ld bc,$4F8A
	jp Unknown_0x37F4

Unknown_0x8DC5:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x8DD3
	ld e,$02
	ld bc,$4EE2
	jp Unknown_0x37F4

Unknown_0x8DD3:
	call Unknown_0xB663
	jr nc,Unknown_0x8DE0
	ld e,$02
	ld bc,$4E0C
	jp Unknown_0x37F4

Unknown_0x8DE0:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x8DEE
	ld e,$02
	ld bc,$51DB
	jp Unknown_0x37F4

Unknown_0x8DEE:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x8DFC
	ld e,$02
	ld bc,$5220
	jp Unknown_0x37F4

Unknown_0x8DFC:
	call Unknown_0x36E6
	jr nc,Unknown_0x8E09
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8E09:
	jp Unknown_0x37F7

UnknownData_0x8E0C:
INCBIN "baserom.gb", $8E0C, $8E3C - $8E0C
	call Unknown_0x359A
	call Unknown_0xB96D

Unknown_0x8E42:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0xB6C5
	jr nc,Unknown_0x8E5A
	ld e,$02
	ld bc,$4D91
	jp Unknown_0x37F4

Unknown_0x8E5A:
	call Unknown_0xB5A1
	jr nc,Unknown_0x8E67
	ld e,$02
	ld bc,$4F8A
	jp Unknown_0x37F4

Unknown_0x8E67:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x8E75
	ld e,$02
	ld bc,$4EE2
	jp Unknown_0x37F4

Unknown_0x8E75:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x8E84
	ld e,$02
	ld bc,$4D91
	jp Unknown_0x37F4

Unknown_0x8E84:
	call Unknown_0x373B
	jr nc,Unknown_0x8E91
	ld e,$02
	ld bc,$4ECA
	jp Unknown_0x37F4

Unknown_0x8E91:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x8E9F
	ld e,$02
	ld bc,$51DB
	jp Unknown_0x37F4

Unknown_0x8E9F:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x8EAD
	ld e,$02
	ld bc,$5220
	jp Unknown_0x37F4

Unknown_0x8EAD:
	call Unknown_0x36E6
	jr nc,Unknown_0x8EBA
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8EBA:
	call Unknown_0x374E
	jr nc,Unknown_0x8EC7
	ld e,$02
	ld bc,$4E0C
	jp Unknown_0x37F4

Unknown_0x8EC7:
	jp Unknown_0x37F7

UnknownData_0x8ECA:
INCBIN "baserom.gb", $8ECA, $8ED9 - $8ECA
	call Unknown_0x359A
	call Unknown_0xB968
	jp Unknown_0x8E42

UnknownData_0x8EE2:
INCBIN "baserom.gb", $8EE2, $8F05 - $8EE2
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x8F16
	ld e,$02
	ld bc,$4EF1
	jp Unknown_0x37F4

Unknown_0x8F16:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x8F29
	ld h,d
	ld l,$1F
	ld [hl],$42
	inc l
	ld [hl],$4F
	inc l
	ld [hl],$9C

Unknown_0x8F29:
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBAB3
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x8F52
	ld e,$02
	ld bc,$4D76
	jp Unknown_0x37F4

Unknown_0x8F52:
	call Unknown_0x39BC
	jr nc,Unknown_0x8F5F
	ld e,$02
	ld bc,$4F8A
	jp Unknown_0x37F4

Unknown_0x8F5F:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x8F6D
	ld e,$02
	ld bc,$51DB
	jp Unknown_0x37F4

Unknown_0x8F6D:
	call Unknown_0x3765
	jr nc,Unknown_0x8F7A
	ld e,$02
	ld bc,$51C0
	jp Unknown_0x37F4

Unknown_0x8F7A:
	call Unknown_0x36E6
	jr nc,Unknown_0x8F87
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8F87:
	jp Unknown_0x37F7

UnknownData_0x8F8A:
INCBIN "baserom.gb", $8F8A, $8F9C - $8F8A
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBAB3
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x8FC5
	ld e,$02
	ld bc,$4D76
	jp Unknown_0x37F4

Unknown_0x8FC5:
	call Unknown_0x39BC
	jr nc,Unknown_0x8FD2
	ld e,$02
	ld bc,$4F8A
	jp Unknown_0x37F4

Unknown_0x8FD2:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x8FE0
	ld e,$02
	ld bc,$51DB
	jp Unknown_0x37F4

Unknown_0x8FE0:
	call Unknown_0x3765
	jr nc,Unknown_0x8FED
	ld e,$02
	ld bc,$51C0
	jp Unknown_0x37F4

Unknown_0x8FED:
	call Unknown_0x36E6
	jr nc,Unknown_0x8FFA
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x8FFA:
	jp Unknown_0x37F7

UnknownData_0x8FFD:
INCBIN "baserom.gb", $8FFD, $9011 - $8FFD
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x9032
	ld e,$02
	ld bc,$5138
	jp Unknown_0x37F4

Unknown_0x9032:
	call Unknown_0x37BD
	jr nc,Unknown_0x903F
	ld e,$02
	ld bc,$5138
	jp Unknown_0x37F4

Unknown_0x903F:
	call Unknown_0xB663
	jr nc,Unknown_0x904C
	ld e,$02
	ld bc,$5078
	jp Unknown_0x37F4

Unknown_0x904C:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x905A
	ld e,$02
	ld bc,$51DB
	jp Unknown_0x37F4

Unknown_0x905A:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0x9068
	ld e,$02
	ld bc,$5220
	jp Unknown_0x37F4

Unknown_0x9068:
	call Unknown_0x36E6
	jr nc,Unknown_0x9075
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x9075:
	jp Unknown_0x37F7

UnknownData_0x9078:
INCBIN "baserom.gb", $9078, $9161 - $9078
	call Unknown_0x359A
	call Unknown_0xBB55
	call Unknown_0xBBAD
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x9185
	ld e,$02
	ld bc,$4D76
	jp Unknown_0x37F4

Unknown_0x9185:
	call Unknown_0x393E
	call Unknown_0x37CB
	jr nc,Unknown_0x9195
	ld e,$02
	ld bc,$5138
	jp Unknown_0x37F4

Unknown_0x9195:
	call Unknown_0x377C
	jr nc,Unknown_0x91A2
	ld e,$02
	ld bc,$51CF
	jp Unknown_0x37F4

Unknown_0x91A2:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0x91B0
	ld e,$02
	ld bc,$51DB
	jp Unknown_0x37F4

Unknown_0x91B0:
	call Unknown_0x36E6
	jr nc,Unknown_0x91BD
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x91BD:
	jp Unknown_0x37F7

UnknownData_0x91C0:
INCBIN "baserom.gb", $91C0, $920D - $91C0
	call Unknown_0xBEA8
	call Unknown_0x3765
	jr nc,Unknown_0x921D
	ld e,$02
	ld bc,$4A41
	jp Unknown_0x37F4

Unknown_0x921D:
	jp Unknown_0x37F7

UnknownData_0x9220:
INCBIN "baserom.gb", $9220, $9289 - $9220
	call Unknown_0xBEA8
	jp Unknown_0x37F7
	call Unknown_0x34FD
	ret

UnknownData_0x9293:
INCBIN "baserom.gb", $9293, $92C0 - $9293
	call Unknown_0xBEA8
	ld a,$02
	ld hl,Unknown_0x92EB
	call Unknown_0x3AAA
	call Unknown_0x3AE9
	call Unknown_0x375B
	jr nc,Unknown_0x92DB
	ld e,$02
	ld bc,$52B6
	jp Unknown_0x37F4

Unknown_0x92DB:
	call Unknown_0x377C
	jr nc,Unknown_0x92E8
	ld e,$02
	ld bc,$4C62
	jp Unknown_0x37F4

Unknown_0x92E8:
	jp Unknown_0x37F7

Unknown_0x92EB:
INCBIN "baserom.gb", $92EB, $92F0 - $92EB
	call Unknown_0xBEA8
	call Unknown_0x377C
	jr nc,Unknown_0x9300
	ld e,$02
	ld bc,$4C62
	jp Unknown_0x37F4

Unknown_0x9300:
	jp Unknown_0x37F7

UnknownData_0x9303:
INCBIN "baserom.gb", $9303, $9346 - $9303
	call Unknown_0x359A
	call Unknown_0x3602
	ld c,$00
	call Unknown_0x93D3
	jr nc,Unknown_0x935B
	ld e,$02
	ld bc,$532B
	call Unknown_0x0846

Unknown_0x935B:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x9376
	ld e,$02
	ld bc,$56B7
	jp Unknown_0x37F4

Unknown_0x9376:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x9384
	ld e,$02
	ld bc,$55DA
	jp Unknown_0x37F4

Unknown_0x9384:
	call Unknown_0xB663
	jr nc,Unknown_0x9391
	ld e,$02
	ld bc,$542F
	jp Unknown_0x37F4

Unknown_0x9391:
	call Unknown_0x369D
	jr nc,Unknown_0x939E
	ld e,$02
	ld bc,$5759
	jp Unknown_0x37F4

Unknown_0x939E:
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x93A9
	call Unknown_0xA02D
	jr Unknown_0x93D0

Unknown_0x93A9:
	call Unknown_0x3650
	jr nc,Unknown_0x93B6
	ld e,$02
	ld bc,$57A3
	jp Unknown_0x37F4

Unknown_0x93B6:
	call Unknown_0x36E6
	jr nc,Unknown_0x93C3
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x93C3:
	call Unknown_0x3724
	jr nc,Unknown_0x93D0
	ld e,$01
	ld bc,$410C
	jp Unknown_0x37F4

Unknown_0x93D0:
	jp Unknown_0x37F7

Unknown_0x93D3:
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$3B
	ld a,[de]
	xor b
	rla
	ret nc
	ld a,b
	ld [de],a
	bit 0,c
	ld a,$0F
	jr z,Unknown_0x93E7
	ld a,$07

Unknown_0x93E7:
	ld e,$3C
	ld [de],a
	ld a,$04
	ld e,$15
	ld [de],a
	ret

UnknownData_0x93F0:
INCBIN "baserom.gb", $93F0, $9406 - $93F0
	ld e,$3C
	ld a,[de]
	cp $08
	jr Unknown_0x9412
	ld e,$3C
	ld a,[de]
	cp $04

Unknown_0x9412:
	ld a,$04
	jr nc,Unknown_0x9417
	dec a

Unknown_0x9417:
	ld e,$15
	ld [de],a
	ld e,$3C
	ld a,[de]
	dec a
	ld [de],a
	ret

UnknownData_0x9420:
INCBIN "baserom.gb", $9420, $951E - $9420
	call Unknown_0x9528
	ld a,$00
	rla
	ld e,$27
	ld [de],a
	ret

Unknown_0x9528:
	ld e,$45
	ld a,[de]
	rla
	ld a,[$FF00+$A5]
	jr nc,Unknown_0x9536
	bit 4,a
	jr nz,Unknown_0x953C
	jr Unknown_0x953A

Unknown_0x9536:
	bit 5,a
	jr nz,Unknown_0x953C

Unknown_0x953A:
	and a
	ret

Unknown_0x953C:
	scf
	ret
	call Unknown_0x359A
	call Unknown_0xBBCD
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0xB6C5
	jr nc,Unknown_0x955C
	ld e,$02
	ld bc,$532B
	jp Unknown_0x37F4

Unknown_0x955C:
	call Unknown_0xB5A1
	jr nc,Unknown_0x9569
	ld e,$02
	ld bc,$56B7
	jp Unknown_0x37F4

Unknown_0x9569:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x9577
	ld e,$02
	ld bc,$55DA
	jp Unknown_0x37F4

Unknown_0x9577:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x958B
	call Unknown_0x3826
	jr c,Unknown_0x958B
	ld e,$02
	ld bc,$532B
	jp Unknown_0x37F4

Unknown_0x958B:
	call Unknown_0x369D
	jr nc,Unknown_0x9598
	ld e,$02
	ld bc,$5759
	jp Unknown_0x37F4

Unknown_0x9598:
	call Unknown_0x374E
	jr nc,Unknown_0x95A5
	ld e,$02
	ld bc,$542F
	jp Unknown_0x37F4

Unknown_0x95A5:
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x95B0
	call Unknown_0xA02D
	jr Unknown_0x95D7

Unknown_0x95B0:
	call Unknown_0x3650
	jr nc,Unknown_0x95BD
	ld e,$02
	ld bc,$57A3
	jp Unknown_0x37F4

Unknown_0x95BD:
	call Unknown_0x36E6
	jr nc,Unknown_0x95CA
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x95CA:
	call Unknown_0x3724
	jr nc,Unknown_0x95D7
	ld e,$01
	ld bc,$410C
	jp Unknown_0x37F4

Unknown_0x95D7:
	jp Unknown_0x37F7

UnknownData_0x95DA:
INCBIN "baserom.gb", $95DA, $961C - $95DA
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x962D
	ld e,$02
	ld bc,$55F0
	jp Unknown_0x37F4

Unknown_0x962D:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x9640
	ld h,d
	ld l,$1F
	ld [hl],$42
	inc l
	ld [hl],$56
	inc l
	ld [hl],$D2

Unknown_0x9640:
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBC3C
	ld c,$00
	call Unknown_0x93D3
	jr nc,Unknown_0x965A
	ld e,$02
	ld bc,$55E9
	call Unknown_0x0846

Unknown_0x965A:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x9675
	ld e,$02
	ld bc,$5310
	jp Unknown_0x37F4

Unknown_0x9675:
	call Unknown_0x39BC
	jr nc,Unknown_0x9682
	ld e,$02
	ld bc,$56B7
	jp Unknown_0x37F4

Unknown_0x9682:
	call Unknown_0x3765
	jr nc,Unknown_0x968F
	ld e,$02
	ld bc,$60A3
	jp Unknown_0x37F4

Unknown_0x968F:
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x969A
	call Unknown_0xA02D
	jr Unknown_0x96B4

Unknown_0x969A:
	call Unknown_0x3650
	jr nc,Unknown_0x96A7
	ld e,$02
	ld bc,$57A3
	jp Unknown_0x37F4

Unknown_0x96A7:
	call Unknown_0x36E6
	jr nc,Unknown_0x96B4
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x96B4:
	jp Unknown_0x37F7

UnknownData_0x96B7:
INCBIN "baserom.gb", $96B7, $96D2 - $96B7
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBC3C
	ld c,$00
	call Unknown_0x93D3
	jr nc,Unknown_0x96EF
	ld e,$02
	ld bc,$56B7
	call Unknown_0x0846

Unknown_0x96EF:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x970A
	ld e,$02
	ld bc,$5310
	jp Unknown_0x37F4

Unknown_0x970A:
	call Unknown_0x39BC
	jr nc,Unknown_0x9717
	ld e,$02
	ld bc,$56B7
	jp Unknown_0x37F4

Unknown_0x9717:
	call Unknown_0x3765
	jr nc,Unknown_0x9724
	ld e,$02
	ld bc,$60A3
	jp Unknown_0x37F4

Unknown_0x9724:
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x972F
	call Unknown_0xA02D
	jr Unknown_0x9756

Unknown_0x972F:
	call Unknown_0x3650
	jr nc,Unknown_0x973C
	ld e,$02
	ld bc,$57A3
	jp Unknown_0x37F4

Unknown_0x973C:
	call Unknown_0x36E6
	jr nc,Unknown_0x9749
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0x9749:
	call Unknown_0x3724
	jr nc,Unknown_0x9756
	ld e,$01
	ld bc,$410C
	jp Unknown_0x37F4

Unknown_0x9756:
	jp Unknown_0x37F7

UnknownData_0x9759:
INCBIN "baserom.gb", $9759, $9774 - $9759
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D35
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x9797
	ld e,$02
	ld bc,$5310
	jp Unknown_0x37F4

Unknown_0x9797:
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x97A0
	call Unknown_0xA02D

Unknown_0x97A0:
	jp Unknown_0x37F7

UnknownData_0x97A3:
INCBIN "baserom.gb", $97A3, $97FB - $97A3
	call Unknown_0xBEE2
	call Unknown_0x981E
	call Unknown_0x3765
	jr nc,Unknown_0x980E
	ld e,$02
	ld bc,$5B12
	jp Unknown_0x37F4

Unknown_0x980E:
	call Unknown_0x377C
	jr nc,Unknown_0x981B
	ld e,$02
	ld bc,$58A4
	jp Unknown_0x37F4

Unknown_0x981B:
	jp Unknown_0x37F7

Unknown_0x981E:
	ld e,$15
	ld a,[de]
	or a
	jr z,Unknown_0x983B
	cp $02
	ld hl,Unknown_0x983C
	jr c,Unknown_0x9833
	ld hl,Unknown_0x9841
	jr z,Unknown_0x9833
	ld hl,Unknown_0x9846

Unknown_0x9833:
	ld a,$04
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x983B:
	ret

Unknown_0x983C:
INCBIN "baserom.gb", $983C, $9841 - $983C

Unknown_0x9841:
INCBIN "baserom.gb", $9841, $9846 - $9841

Unknown_0x9846:
INCBIN "baserom.gb", $9846, $9892 - $9846

Unknown_0x9892:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x98A2
	dec a
	ld [de],a
	ld a,[$FF00+$A5]
	and $02
	jr z,Unknown_0x98A2
	and a
	ret

Unknown_0x98A2:
	scf
	ret

UnknownData_0x98A4:
INCBIN "baserom.gb", $98A4, $9983 - $98A4
	call Unknown_0xBBCD
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x981E
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x99A4
	ld e,$02
	ld bc,$5A70
	jp Unknown_0x37F4

Unknown_0x99A4:
	call Unknown_0x369D
	jr nc,Unknown_0x99B1
	ld e,$02
	ld bc,$5ACC
	jp Unknown_0x37F4

Unknown_0x99B1:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x99BF
	ld e,$02
	ld bc,$59DC
	jp Unknown_0x37F4

Unknown_0x99BF:
	call Unknown_0x374E
	jr nc,Unknown_0x99CC
	ld e,$02
	ld bc,$58B0
	jp Unknown_0x37F4

Unknown_0x99CC:
	call Unknown_0x9892
	jr nc,Unknown_0x99D9
	ld e,$07
	ld bc,$6C92
	jp Unknown_0x37F4

Unknown_0x99D9:
	jp Unknown_0x37F7

UnknownData_0x99DC:
INCBIN "baserom.gb", $99DC, $9A79 - $99DC
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBC45
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x981E
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x9AA2
	ld e,$02
	ld bc,$57E1
	jp Unknown_0x37F4

Unknown_0x9AA2:
	call Unknown_0x39BC
	jr nc,Unknown_0x9AAF
	ld e,$02
	ld bc,$5A70
	jp Unknown_0x37F4

Unknown_0x9AAF:
	call Unknown_0x3765
	jr nc,Unknown_0x9ABC
	ld e,$02
	ld bc,$5B12
	jp Unknown_0x37F4

Unknown_0x9ABC:
	call Unknown_0x9892
	jr nc,Unknown_0x9AC9
	ld e,$07
	ld bc,$6C92
	jp Unknown_0x37F4

Unknown_0x9AC9:
	jp Unknown_0x37F7

UnknownData_0x9ACC:
INCBIN "baserom.gb", $9ACC, $9B4F - $9ACC
	ld a,$04
	ld [$A05D],a
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x3952
	jp Unknown_0x37F7

UnknownData_0x9B6B:
INCBIN "baserom.gb", $9B6B, $9B78 - $9B6B
	ld a,[$A070]
	or a
	ld e,$60
	ld bc,$0400
	jr z,Unknown_0x9B88
	ld e,$40
	ld bc,$0200

Unknown_0x9B88:
	call Unknown_0x0D23
	ld a,[$A070]
	or a
	ld e,$0E
	jr z,Unknown_0x9B95
	ld e,$08

Unknown_0x9B95:
	call Unknown_0x0D04
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x9BE4
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x9BB6
	ld e,$02
	ld bc,$5C0C
	jp Unknown_0x37F4

Unknown_0x9BB6:
	call Unknown_0x3952
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0x9BC7
	ld e,$02
	ld bc,$5C8A
	jp Unknown_0x37F4

Unknown_0x9BC7:
	call Unknown_0x3765
	jr nc,Unknown_0x9BD4
	ld e,$02
	ld bc,$5BF4
	jp Unknown_0x37F4

Unknown_0x9BD4:
	call Unknown_0x377C
	jr nc,Unknown_0x9BE1
	ld e,$02
	ld bc,$5C00
	jp Unknown_0x37F4

Unknown_0x9BE1:
	jp Unknown_0x37F7

Unknown_0x9BE4:
	ld hl,Unknown_0x9BEF
	ld a,$08
	call Unknown_0x3AAA
	jp Unknown_0x3AE4

Unknown_0x9BEF:
INCBIN "baserom.gb", $9BEF, $9C31 - $9BEF
	call Unknown_0xBBE3
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld a,$04
	ld [$A05D],a
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	call nz,Unknown_0x9BE4
	call Unknown_0xB93C
	call Unknown_0xB6DF
	call Unknown_0xB5A1
	jr nc,Unknown_0x9C5E
	ld e,$02
	ld bc,$5B6B
	jp Unknown_0x37F4

Unknown_0x9C5E:
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0x9C6C
	ld e,$02
	ld bc,$5C8A
	jp Unknown_0x37F4

Unknown_0x9C6C:
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	ld e,$3A
	jr z,Unknown_0x9C7A
	ld a,$78
	ld [de],a

Unknown_0x9C7A:
	ld a,[de]
	dec a
	ld [de],a
	jr nz,Unknown_0x9C87
	ld e,$02
	ld bc,$5C8A
	jp Unknown_0x37F4

Unknown_0x9C87:
	jp Unknown_0x37F7

UnknownData_0x9C8A:
INCBIN "baserom.gb", $9C8A, $9CCF - $9C8A

Unknown_0x9CCF:
	ld a,[$DB76]
	or a
	ret z
	ld a,[$DA36]
	or a
	ret nz
	ld hl,$CD00
	ld a,$E4
	ld [hli],a
	ld a,$D0
	ld [hli],a
	ld a,$E4
	ld [hli],a
	ret
	call Unknown_0xBEE2
	call Unknown_0x3765
	jr nc,Unknown_0x9CF6
	ld e,$02
	ld bc,$6013
	jp Unknown_0x37F4

Unknown_0x9CF6:
	call Unknown_0x377C
	jr nc,Unknown_0x9D03
	ld e,$02
	ld bc,$5D84
	jp Unknown_0x37F4

Unknown_0x9D03:
	jp Unknown_0x37F7

Unknown_0x9D06:
	ld e,$15
	ld a,[de]
	cp $02
	ret c
	ld a,$02
	ld hl,Unknown_0x9D17
	call Unknown_0x3AAA
	jp Unknown_0x3AE4

Unknown_0x9D17:
INCBIN "baserom.gb", $9D17, $9D32 - $9D17
	call Unknown_0x9CCF
	call Unknown_0xBC5C
	call Unknown_0xBD3F
	ld hl,$6E08
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x9D06
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x393E
	call Unknown_0xA193
	call Unknown_0x377C
	jr nc,Unknown_0x9D62
	ld e,$02
	ld bc,$5D84
	jp Unknown_0x37F4

Unknown_0x9D62:
	call Unknown_0x9D72
	jr nc,Unknown_0x9D6F
	ld e,$07
	ld bc,$6D5C
	jp Unknown_0x37F4

Unknown_0x9D6F:
	jp Unknown_0x37F7

Unknown_0x9D72:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x9D7C
	dec a
	ld [de],a

Unknown_0x9D7A:
	and a
	ret

Unknown_0x9D7C:
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x9D7A
	scf
	ret

UnknownData_0x9D84:
INCBIN "baserom.gb", $9D84, $9E63 - $9D84
	ld a,[$FF00+$A5]
	and $30
	ld h,$00
	jr z,Unknown_0x9E7D
	bit 4,a
	ld e,$45
	ld a,[de]
	jr z,Unknown_0x9E78
	inc h
	rla
	jr c,Unknown_0x9E7D
	jr Unknown_0x9E7C

Unknown_0x9E78:
	inc h
	rla
	jr nc,Unknown_0x9E7D

Unknown_0x9E7C:
	inc h

Unknown_0x9E7D:
	ld e,$27
	ld a,h
	ld [de],a
	ret
	call Unknown_0x9CCF
	call Unknown_0xBBCD
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x9D06
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0x9EA6
	ld e,$02
	ld bc,$5F75
	jp Unknown_0x37F4

Unknown_0x9EA6:
	call Unknown_0x369D
	jr nc,Unknown_0x9EB3
	ld e,$02
	ld bc,$5FCA
	jp Unknown_0x37F4

Unknown_0x9EB3:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0x9EC1
	ld e,$02
	ld bc,$5EDE
	jp Unknown_0x37F4

Unknown_0x9EC1:
	call Unknown_0x374E
	jr nc,Unknown_0x9ECE
	ld e,$02
	ld bc,$5D90
	jp Unknown_0x37F4

Unknown_0x9ECE:
	call Unknown_0x9D72
	jr nc,Unknown_0x9EDB
	ld e,$07
	ld bc,$6D5C
	jp Unknown_0x37F4

Unknown_0x9EDB:
	jp Unknown_0x37F7

UnknownData_0x9EDE:
INCBIN "baserom.gb", $9EDE, $9EFE - $9EDE
	call Unknown_0x9CCF
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x9F0F
	ld e,$02
	ld bc,$5EE8
	jp Unknown_0x37F4

Unknown_0x9F0F:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0x9F22
	ld h,d
	ld l,$1F
	ld [hl],$42
	inc l
	ld [hl],$5F
	inc l
	ld [hl],$7E

Unknown_0x9F22:
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBC45
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x9D06
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x9F4B
	ld e,$02
	ld bc,$5CB5
	jp Unknown_0x37F4

Unknown_0x9F4B:
	call Unknown_0x39BC
	jr nc,Unknown_0x9F58
	ld e,$02
	ld bc,$5F75
	jp Unknown_0x37F4

Unknown_0x9F58:
	call Unknown_0x3765
	jr nc,Unknown_0x9F65
	ld e,$02
	ld bc,$6013
	jp Unknown_0x37F4

Unknown_0x9F65:
	call Unknown_0x9D72
	jr nc,Unknown_0x9F72
	ld e,$07
	ld bc,$6D5C
	jp Unknown_0x37F4

Unknown_0x9F72:
	jp Unknown_0x37F7

UnknownData_0x9F75:
INCBIN "baserom.gb", $9F75, $9F7E - $9F75
	call Unknown_0x9CCF
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBC45
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x9D06
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0x9FAA
	ld e,$02
	ld bc,$5CB5
	jp Unknown_0x37F4

Unknown_0x9FAA:
	call Unknown_0x39BC
	call Unknown_0x3765
	jr nc,Unknown_0x9FBA
	ld e,$02
	ld bc,$6013
	jp Unknown_0x37F4

Unknown_0x9FBA:
	call Unknown_0x9D72
	jr nc,Unknown_0x9FC7
	ld e,$07
	ld bc,$6D5C
	jp Unknown_0x37F4

Unknown_0x9FC7:
	jp Unknown_0x37F7

UnknownData_0x9FCA:
INCBIN "baserom.gb", $9FCA, $A02D - $9FCA

Unknown_0xA02D:
	ld e,$40
	ld a,[de]
	or a
	ret z
	dec a
	ld [de],a
	jr z,Unknown_0xA06A
	and $01
	jr nz,Unknown_0xA05A
	ld a,[de]
	and $02
	ld e,$47
	ld a,[de]
	jr nz,Unknown_0xA046
	res 4,a
	jr Unknown_0xA048

Unknown_0xA046:
	set 4,a

Unknown_0xA048:
	ld [de],a
	ld bc,Unknown_0xA077
	call Unknown_0x0F77
	ld e,$3A
	ld a,[de]
	inc a
	cp $0B
	jr c,Unknown_0xA059
	ld a,$02

Unknown_0xA059:
	ld [de],a

Unknown_0xA05A:
	ld a,$02
	ld hl,Unknown_0xA072
	call Unknown_0x3AAA
	call Unknown_0x3AE4
	ld a,[$FF00+$A5]
	and $02
	ret nz

Unknown_0xA06A:
	ld e,$02
	ld bc,$6078
	jp Unknown_0x0846

Unknown_0xA072:
INCBIN "baserom.gb", $A072, $A077 - $A072

Unknown_0xA077:
INCBIN "baserom.gb", $A077, $A0B8 - $A077
	ld e,$15
	ld a,[de]
	cp $03
	ret nz
	ld e,$3C
	ld a,[de]
	cp $04
	ret c
	ld a,$03
	ld [de],a
	ret

UnknownData_0xA0C8:
INCBIN "baserom.gb", $A0C8, $A115 - $A0C8
	call Unknown_0x359A
	call Unknown_0xBC5C
	call Unknown_0xBCD9
	ld c,$01
	call Unknown_0x93D3
	jr nc,Unknown_0xA12D
	ld e,$02
	ld bc,$60CB
	call Unknown_0x0846

Unknown_0xA12D:
	ld hl,$6E08
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x393E
	call Unknown_0xA193
	call Unknown_0xB8DA
	jr nc,Unknown_0xA151
	ld e,$02
	ld bc,$60CB
	jp Unknown_0x37F4

Unknown_0xA151:
	call Unknown_0x377C
	jr nc,Unknown_0xA15E
	ld e,$02
	ld bc,$619E
	jp Unknown_0x37F4

Unknown_0xA15E:
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0xA169
	call Unknown_0xA02D
	jr Unknown_0xA190

Unknown_0xA169:
	call Unknown_0x3650
	jr nc,Unknown_0xA176
	ld e,$02
	ld bc,$57A3
	jp Unknown_0x37F4

Unknown_0xA176:
	call Unknown_0x36E6
	jr nc,Unknown_0xA183
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA183:
	call Unknown_0x3724
	jr nc,Unknown_0xA190
	ld e,$01
	ld bc,$410C
	jp Unknown_0x37F4

Unknown_0xA190:
	jp Unknown_0x37F7

Unknown_0xA193:
	ld h,d
	ld e,$0F
	ld l,$8F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0xA19E:
INCBIN "baserom.gb", $A19E, $A1D3 - $A19E
	ld hl,Unknown_0xB2BE
	ld a,$01
	call Unknown_0x05CF
	ret
	call Unknown_0xBEE2
	ld a,[$A056]
	or a
	jr z,Unknown_0xA1F3
	ld a,[$A055]
	or a
	jr nz,Unknown_0xA1F3
	ld e,$02
	ld bc,$6263
	jp Unknown_0x37F4

Unknown_0xA1F3:
	ld h,d
	ld l,$39
	ld a,[hl]
	or a
	jr z,Unknown_0xA1FD
	dec [hl]
	jr Unknown_0xA217

Unknown_0xA1FD:
	ld a,[$FF00+$A5]
	bit 1,a
	jr nz,Unknown_0xA217
	ld a,[$A056]
	or a
	jr nz,Unknown_0xA217
	ld a,[$A055]
	or a
	jr nz,Unknown_0xA217
	ld e,$02
	ld bc,$6244
	jp Unknown_0x37F4

Unknown_0xA217:
	call Unknown_0x3A24
	jr nc,Unknown_0xA224
	ld e,$02
	ld bc,$60A3
	jp Unknown_0x37F4

Unknown_0xA224:
	ld e,$3D
	ld a,[de]
	or a
	jr z,Unknown_0xA22E
	dec a
	ld [de],a
	jr Unknown_0xA236

Unknown_0xA22E:
	ld hl,Unknown_0xB348
	ld a,$01
	call Unknown_0x05CF

Unknown_0xA236:
	ld hl,Unknown_0xA23F
	call Unknown_0x3AAA
	jp Unknown_0x37F7

Unknown_0xA23F:
INCBIN "baserom.gb", $A23F, $A250 - $A23F
	call Unknown_0xBEE2
	call Unknown_0x3765
	jr nc,Unknown_0xA260
	ld e,$02
	ld bc,$60A3
	jp Unknown_0x37F4

Unknown_0xA260:
	jp Unknown_0x37F7

UnknownData_0xA263:
INCBIN "baserom.gb", $A263, $A27B - $A263
	call Unknown_0xBF09
	call Unknown_0xBBCD
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x3952
	call Unknown_0x3765
	jr nc,Unknown_0xA2A2
	ld e,$02
	ld bc,$665D
	jp Unknown_0x37F4

Unknown_0xA2A2:
	jp Unknown_0x37F7

UnknownData_0xA2A5:
INCBIN "baserom.gb", $A2A5, $A2D6 - $A2A5
	call Unknown_0x359A
	call Unknown_0x3602
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0xA2F7
	ld e,$02
	ld bc,$654B
	jp Unknown_0x37F4

Unknown_0xA2F7:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0xA305
	ld e,$02
	ld bc,$64A3
	jp Unknown_0x37F4

Unknown_0xA305:
	call Unknown_0xB663
	jr nc,Unknown_0xA312
	ld e,$02
	ld bc,$6348
	jp Unknown_0x37F4

Unknown_0xA312:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0xA320
	ld e,$02
	ld bc,$6678
	jp Unknown_0x37F4

Unknown_0xA320:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0xA32E
	ld e,$02
	ld bc,$66BD
	jp Unknown_0x37F4

Unknown_0xA32E:
	call Unknown_0x36E6
	jr nc,Unknown_0xA33B
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA33B:
	jp Unknown_0x37F7

UnknownData_0xA33E:
INCBIN "baserom.gb", $A33E, $A41D - $A33E
	call Unknown_0x359A
	call Unknown_0xBBCD
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0xB6C5
	jr nc,Unknown_0xA43B
	ld e,$02
	ld bc,$62C3
	jp Unknown_0x37F4

Unknown_0xA43B:
	call Unknown_0xB5A1
	jr nc,Unknown_0xA448
	ld e,$02
	ld bc,$654B
	jp Unknown_0x37F4

Unknown_0xA448:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0xA456
	ld e,$02
	ld bc,$64A3
	jp Unknown_0x37F4

Unknown_0xA456:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0xA46A
	call Unknown_0x3826
	jr c,Unknown_0xA46A
	ld e,$02
	ld bc,$62C3
	jp Unknown_0x37F4

Unknown_0xA46A:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0xA478
	ld e,$02
	ld bc,$6678
	jp Unknown_0x37F4

Unknown_0xA478:
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0xA486
	ld e,$02
	ld bc,$66BD
	jp Unknown_0x37F4

Unknown_0xA486:
	call Unknown_0x36E6
	jr nc,Unknown_0xA493
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA493:
	call Unknown_0x374E
	jr nc,Unknown_0xA4A0
	ld e,$02
	ld bc,$6348
	jp Unknown_0x37F4

Unknown_0xA4A0:
	jp Unknown_0x37F7

UnknownData_0xA4A3:
INCBIN "baserom.gb", $A4A3, $A4C6 - $A4A3
	call Unknown_0x359A
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0xA4D7
	ld e,$02
	ld bc,$64B2
	jp Unknown_0x37F4

Unknown_0xA4D7:
	ld bc,$FF50
	call Unknown_0x37EB
	jr nc,Unknown_0xA4EA
	ld h,d
	ld l,$1F
	ld [hl],$42
	inc l
	ld [hl],$65
	inc l
	ld [hl],$5E

Unknown_0xA4EA:
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBC3C
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0xA513
	ld e,$02
	ld bc,$62A8
	jp Unknown_0x37F4

Unknown_0xA513:
	call Unknown_0x39BC
	jr nc,Unknown_0xA520
	ld e,$02
	ld bc,$654B
	jp Unknown_0x37F4

Unknown_0xA520:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0xA52E
	ld e,$02
	ld bc,$6678
	jp Unknown_0x37F4

Unknown_0xA52E:
	call Unknown_0x3765
	jr nc,Unknown_0xA53B
	ld e,$02
	ld bc,$665D
	jp Unknown_0x37F4

Unknown_0xA53B:
	call Unknown_0x36E6
	jr nc,Unknown_0xA548
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA548:
	jp Unknown_0x37F7

UnknownData_0xA54B:
INCBIN "baserom.gb", $A54B, $A55E - $A54B
	call Unknown_0x359A
	ld e,$20
	ld bc,$0280
	call Unknown_0x0D23
	call Unknown_0xBC3C
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0xA587
	ld e,$02
	ld bc,$62A8
	jp Unknown_0x37F4

Unknown_0xA587:
	call Unknown_0x39BC
	jr nc,Unknown_0xA594
	ld e,$02
	ld bc,$654B
	jp Unknown_0x37F4

Unknown_0xA594:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0xA5A2
	ld e,$02
	ld bc,$6678
	jp Unknown_0x37F4

Unknown_0xA5A2:
	call Unknown_0x3765
	jr nc,Unknown_0xA5AF
	ld e,$02
	ld bc,$665D
	jp Unknown_0x37F4

Unknown_0xA5AF:
	call Unknown_0x36E6
	jr nc,Unknown_0xA5BC
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA5BC:
	jp Unknown_0x37F7

UnknownData_0xA5BF:
INCBIN "baserom.gb", $A5BF, $A5F8 - $A5BF
	call Unknown_0x359A
	call Unknown_0xBC5C
	call Unknown_0xBCD9
	ld hl,$6E08
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x393E
	call Unknown_0xA193
	call Unknown_0xB8DA
	jr nc,Unknown_0xA625
	ld e,$02
	ld bc,$65C2
	jp Unknown_0x37F4

Unknown_0xA625:
	call Unknown_0x377C
	jr nc,Unknown_0xA632
	ld e,$02
	ld bc,$666C
	jp Unknown_0x37F4

Unknown_0xA632:
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0xA640
	ld e,$02
	ld bc,$6678
	jp Unknown_0x37F4

Unknown_0xA640:
	call Unknown_0x3629
	jr nc,Unknown_0xA64D
	ld e,$02
	ld bc,$66BD
	jp Unknown_0x37F4

Unknown_0xA64D:
	call Unknown_0x36E6
	jr nc,Unknown_0xA65A
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA65A:
	jp Unknown_0x37F7

UnknownData_0xA65D:
INCBIN "baserom.gb", $A65D, $A6AA - $A65D
	call Unknown_0xBEE2
	call Unknown_0x3765
	jr nc,Unknown_0xA6BA
	ld e,$02
	ld bc,$60A3
	jp Unknown_0x37F4

Unknown_0xA6BA:
	jp Unknown_0x37F7

UnknownData_0xA6BD:
INCBIN "baserom.gb", $A6BD, $A726 - $A6BD
	call Unknown_0xBEE2
	jp Unknown_0x37F7
	call Unknown_0x34FD
	ret

UnknownData_0xA730:
INCBIN "baserom.gb", $A730, $A77C - $A730
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0xA822
	jr nc,Unknown_0xA78F
	ld e,$02
	ld bc,$6767
	call Unknown_0x0846

Unknown_0xA78F:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0xA7AA
	ld e,$02
	ld bc,$6860
	jp Unknown_0x37F4

Unknown_0xA7AA:
	call Unknown_0xB663
	jr nc,Unknown_0xA7B7
	ld e,$02
	ld bc,$6860
	jp Unknown_0x37F4

Unknown_0xA7B7:
	call Unknown_0x369D
	jr nc,Unknown_0xA7C4
	ld e,$02
	ld bc,$696B
	jp Unknown_0x37F4

Unknown_0xA7C4:
	ld a,[$FF00+$A5]
	and $40
	jr z,Unknown_0xA7D2
	ld e,$02
	ld bc,$6860
	jp Unknown_0x37F4

Unknown_0xA7D2:
	ld a,[$FF00+$A6]
	and $01
	jr z,Unknown_0xA7E0
	ld e,$02
	ld bc,$6857
	jp Unknown_0x37F4

Unknown_0xA7E0:
	ld e,$3E
	ld a,[de]
	or a
	jr z,Unknown_0xA7F8
	call Unknown_0xAD18
	call Unknown_0xAD3C
	jr nc,Unknown_0xA7F6
	ld e,$07
	ld bc,$6E2C
	jp Unknown_0x37F4

Unknown_0xA7F6:
	jr Unknown_0xA81F

Unknown_0xA7F8:
	call Unknown_0x366B
	jr nc,Unknown_0xA805
	ld e,$02
	ld bc,$69B8
	jp Unknown_0x37F4

Unknown_0xA805:
	call Unknown_0x36E6
	jr nc,Unknown_0xA812
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA812:
	call Unknown_0x3724
	jr nc,Unknown_0xA81F
	ld e,$01
	ld bc,$411F
	jp Unknown_0x37F4

Unknown_0xA81F:
	jp Unknown_0x37F7

Unknown_0xA822:
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$3B
	ld a,[de]
	xor b
	rla
	ret nc
	ld a,b
	ld [de],a
	ld a,$07
	ld e,$3C
	ld [de],a
	ld a,$04
	ld e,$15
	ld [de],a
	ret

UnknownData_0xA839:
INCBIN "baserom.gb", $A839, $A844 - $A839
	ld e,$3C
	ld a,[de]
	cp $04
	ld a,$04
	jr nc,Unknown_0xA84E
	dec a

Unknown_0xA84E:
	ld e,$15
	ld [de],a
	ld e,$3C
	ld a,[de]
	dec a
	ld [de],a
	ret

UnknownData_0xA857:
INCBIN "baserom.gb", $A857, $A8C7 - $A857
	call Unknown_0x359A
	call Unknown_0xBD84
	call Unknown_0xBD56
	call Unknown_0xA822
	jr nc,Unknown_0xA8DD
	ld e,$02
	ld bc,$6860
	call Unknown_0x0846

Unknown_0xA8DD:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	jr nc,Unknown_0xA90C
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0xA8FF
	ld e,$02
	ld bc,$6767
	jp Unknown_0x37F4

Unknown_0xA8FF:
	call Unknown_0x369D
	jr nc,Unknown_0xA90C
	ld e,$02
	ld bc,$696B
	jp Unknown_0x37F4

Unknown_0xA90C:
	call Unknown_0x393E
	call Unknown_0x3765
	jr nc,Unknown_0xA91C
	ld e,$02
	ld bc,$6E1B
	jp Unknown_0x37F4

Unknown_0xA91C:
	call Unknown_0xB8FB
	jr nc,Unknown_0xA929
	ld e,$02
	ld bc,$6863
	jp Unknown_0x37F4

Unknown_0xA929:
	ld e,$3E
	ld a,[de]
	or a
	jr z,Unknown_0xA941
	call Unknown_0xAD18
	call Unknown_0xAD3C
	jr nc,Unknown_0xA93F
	ld e,$07
	ld bc,$6E2C
	jp Unknown_0x37F4

Unknown_0xA93F:
	jr Unknown_0xA968

Unknown_0xA941:
	call Unknown_0x366B
	jr nc,Unknown_0xA94E
	ld e,$02
	ld bc,$69B8
	jp Unknown_0x37F4

Unknown_0xA94E:
	call Unknown_0x36E6
	jr nc,Unknown_0xA95B
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xA95B:
	call Unknown_0x3724
	jr nc,Unknown_0xA968
	ld e,$01
	ld bc,$411F
	jp Unknown_0x37F4

Unknown_0xA968:
	jp Unknown_0x37F7

UnknownData_0xA96B:
INCBIN "baserom.gb", $A96B, $A986 - $A96B
	ld e,$0E
	ld bc,$0060
	call Unknown_0x0D35
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	ld e,$3E
	ld a,[de]
	or a
	jr z,Unknown_0xA9B5
	call Unknown_0xAD18
	call Unknown_0xAD3C
	jr nc,Unknown_0xA9B5
	ld e,$07
	ld bc,$6E2C
	jp Unknown_0x37F4

Unknown_0xA9B5:
	jp Unknown_0x37F7

UnknownData_0xA9B8:
INCBIN "baserom.gb", $A9B8, $AA08 - $A9B8
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x3972
	call Unknown_0x391A
	call c,Unknown_0x3972
	call Unknown_0x393E
	ld e,$39
	ld a,[de]
	or a
	jr z,Unknown_0xAA56
	ld a,[$A070]
	or a
	ld bc,$0160
	jr z,Unknown_0xAA31
	ld bc,$0042

Unknown_0xAA31:
	call Unknown_0x3C2B
	ld e,$0F
	ld a,[$A070]
	or a
	jr nz,Unknown_0xAA44
	ld a,$60
	ld [de],a
	inc e
	ld a,$01
	jr Unknown_0xAA4A

Unknown_0xAA44:
	ld a,$42
	ld [de],a
	inc e
	ld a,$00

Unknown_0xAA4A:
	ld [de],a
	ld hl,Unknown_0xAA5F
	ld a,$04
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0xAA56:
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

Unknown_0xAA5F:
INCBIN "baserom.gb", $AA5F, $AB01 - $AA5F
	ld a,[$A070]
	or a
	jr nz,Unknown_0xAB0C
	call Unknown_0xBD84
	jr Unknown_0xAB14

Unknown_0xAB0C:
	ld e,$08
	ld bc,$00E0
	call Unknown_0x0D23

Unknown_0xAB14:
	ld a,[$A070]
	or a
	jr nz,Unknown_0xAB1F
	call Unknown_0xBD56
	jr Unknown_0xAB24

Unknown_0xAB1F:
	ld e,$09
	call Unknown_0x0D04

Unknown_0xAB24:
	ld e,$39
	ld a,[de]
	ld e,$45
	ld [de],a
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	jr nc,Unknown_0xAB45
	call Unknown_0x369D
	jr nc,Unknown_0xAB45
	call Unknown_0x35AF

Unknown_0xAB45:
	call Unknown_0x393E
	ld e,$3A
	ld a,[de]
	or a
	ld hl,Unknown_0xAB6C
	ld a,$02
	jr z,Unknown_0xAB58
	ld hl,Unknown_0xAB67
	ld a,$02

Unknown_0xAB58:
	call Unknown_0x3AAA
	call Unknown_0x3AE4
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

Unknown_0xAB67:
INCBIN "baserom.gb", $AB67, $AB6C - $AB67

Unknown_0xAB6C:
INCBIN "baserom.gb", $AB6C, $ABA2 - $AB6C
	ld a,$04
	ld [$A05D],a
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x3952
	jp Unknown_0x37F7

UnknownData_0xABBE:
INCBIN "baserom.gb", $ABBE, $ABC5 - $ABBE
	ld a,[$A070]
	or a
	ld e,$60
	ld bc,$0400
	jr z,Unknown_0xABD5
	ld e,$40
	ld bc,$0200

Unknown_0xABD5:
	call Unknown_0x0D23
	ld a,[$A070]
	or a
	ld e,$0E
	jr z,Unknown_0xABE2
	ld e,$09

Unknown_0xABE2:
	call Unknown_0x0D04
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xAC36
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x398D
	jr nc,Unknown_0xAC03
	ld e,$02
	ld bc,$6C63
	jp Unknown_0x37F4

Unknown_0xAC03:
	call Unknown_0x3952
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0xAC14
	ld e,$02
	ld bc,$6D02
	jp Unknown_0x37F4

Unknown_0xAC14:
	call Unknown_0x3765
	jr nc,Unknown_0xAC21
	ld e,$02
	ld bc,$6C4B
	jp Unknown_0x37F4

Unknown_0xAC21:
	call Unknown_0x377C
	jr nc,Unknown_0xAC2E
	ld e,$02
	ld bc,$6C57
	jp Unknown_0x37F4

Unknown_0xAC2E:
	jp Unknown_0x37F7

Unknown_0xAC31:
	ld hl,Unknown_0xAC46
	jr Unknown_0xAC39

Unknown_0xAC36:
	ld hl,Unknown_0xAC41

Unknown_0xAC39:
	ld a,$04
	call Unknown_0x3AAA
	jp Unknown_0x3AE4

Unknown_0xAC41:
INCBIN "baserom.gb", $AC41, $AC46 - $AC41

Unknown_0xAC46:
INCBIN "baserom.gb", $AC46, $AC99 - $AC46
	call Unknown_0xBE4F
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld a,$04
	ld [$A05D],a
	ld e,$15
	ld a,[de]
	cp $01
	jr z,Unknown_0xACB4
	cp $02
	jr nz,Unknown_0xACB9

Unknown_0xACB4:
	call Unknown_0xAC31
	jr Unknown_0xACC3

Unknown_0xACB9:
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	call nz,Unknown_0xAC36

Unknown_0xACC3:
	call Unknown_0xB952
	call Unknown_0xB6DF
	call Unknown_0xB5A1
	jr nc,Unknown_0xACD6
	ld e,$02
	ld bc,$6BBE
	jp Unknown_0x37F4

Unknown_0xACD6:
	ld a,[$FF00+$A6]
	and $02
	jr z,Unknown_0xACE4
	ld e,$02
	ld bc,$6D02
	jp Unknown_0x37F4

Unknown_0xACE4:
	ld e,$0D
	ld a,[de]
	ld b,a
	inc e
	ld a,[de]
	or b
	ld e,$3A
	jr z,Unknown_0xACF2
	ld a,$78
	ld [de],a

Unknown_0xACF2:
	ld a,[de]
	dec a
	ld [de],a
	jr nz,Unknown_0xACFF
	ld e,$02
	ld bc,$6D02
	jp Unknown_0x37F4

Unknown_0xACFF:
	jp Unknown_0x37F7

UnknownData_0xAD02:
INCBIN "baserom.gb", $AD02, $AD18 - $AD02

Unknown_0xAD18:
	ld e,$3E
	ld a,[de]
	or a
	ret z
	ld e,$15
	ld a,[de]
	cp $07
	ld hl,Unknown_0xAD32
	jr nz,Unknown_0xAD2A
	ld hl,$6D37

Unknown_0xAD2A:
	ld a,$04
	call Unknown_0x3AAA
	jp Unknown_0x3AE4

Unknown_0xAD32:
INCBIN "baserom.gb", $AD32, $AD3C - $AD32

Unknown_0xAD3C:
	ld e,$3E
	ld a,[de]
	dec a
	jr z,Unknown_0xAD4B
	ld [de],a
	ld a,[$FF00+$A5]
	and $02
	jr z,Unknown_0xAD4B
	and a
	ret

Unknown_0xAD4B:
	scf
	ret

UnknownData_0xAD4D:
INCBIN "baserom.gb", $AD4D, $AD85 - $AD4D
	ld e,$15
	ld a,[de]
	cp $04
	ret c
	ld e,$45
	ld a,[de]
	xor $80
	ld [de],a
	ld e,$3B
	ld [de],a
	ret
	ld e,$3F
	ld a,[de]
	or a
	jr z,Unknown_0xAD9F
	dec a
	ld [de],a
	jr Unknown_0xADCD

Unknown_0xAD9F:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0xADCD
	and $10
	ld e,$45
	ld a,[de]
	ld e,$15
	jr z,Unknown_0xADB8
	rla
	ld a,[de]
	jr nc,Unknown_0xADB5
	inc a
	jr Unknown_0xADC0

Unknown_0xADB5:
	dec a
	jr Unknown_0xADC0

Unknown_0xADB8:
	rla
	ld a,[de]
	jr nc,Unknown_0xADBF
	dec a
	jr Unknown_0xADC0

Unknown_0xADBF:
	inc a

Unknown_0xADC0:
	or a
	jr z,Unknown_0xADCD
	cp $07
	jr z,Unknown_0xADCD
	ld [de],a
	ld a,$08
	ld e,$3F
	ld [de],a

Unknown_0xADCD:
	call Unknown_0xBF36
	call Unknown_0xAE05
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x393E
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$3A
	ld a,[de]
	dec a
	jr nz,Unknown_0xAE01
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0xAE02
	ld e,$02
	ld bc,$6D75
	jp Unknown_0x37F4

Unknown_0xAE01:
	ld [de],a

Unknown_0xAE02:
	jp Unknown_0x37F7

Unknown_0xAE05:
	ld a,[$A070]
	or a
	jr nz,Unknown_0xAE13
	ld e,$0E
	ld bc,$0060
	jp Unknown_0x0D23

Unknown_0xAE13:
	ld e,$0E
	ld bc,$0060
	jp Unknown_0x0D23

UnknownData_0xAE1B:
INCBIN "baserom.gb", $AE1B, $AE3F - $AE1B
	call Unknown_0x359A
	call Unknown_0x3602
	call Unknown_0xA822
	jr nc,Unknown_0xAE52
	ld e,$02
	ld bc,$6E2A
	call Unknown_0x0846

Unknown_0xAE52:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0xB5A1
	jr nc,Unknown_0xAE6D
	ld e,$02
	ld bc,$6EC9
	jp Unknown_0x37F4

Unknown_0xAE6D:
	call Unknown_0x37BD
	jr nc,Unknown_0xAE7A
	ld e,$02
	ld bc,$6EC9
	jp Unknown_0x37F4

Unknown_0xAE7A:
	call Unknown_0xB663
	jr nc,Unknown_0xAE87
	ld e,$02
	ld bc,$6EC9
	jp Unknown_0x37F4

Unknown_0xAE87:
	ld e,$3E
	ld a,[de]
	or a
	jr z,Unknown_0xAE9F
	call Unknown_0xAD18
	call Unknown_0xAD3C
	jr nc,Unknown_0xAE9D
	ld e,$07
	ld bc,$6E2C
	jp Unknown_0x37F4

Unknown_0xAE9D:
	jr Unknown_0xAEC6

Unknown_0xAE9F:
	call Unknown_0x366B
	jr nc,Unknown_0xAEAC
	ld e,$02
	ld bc,$69B8
	jp Unknown_0x37F4

Unknown_0xAEAC:
	call Unknown_0x36E6
	jr nc,Unknown_0xAEB9
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xAEB9:
	call Unknown_0x3724
	jr nc,Unknown_0xAEC6
	ld e,$01
	ld bc,$411F
	jp Unknown_0x37F4

Unknown_0xAEC6:
	jp Unknown_0x37F7

UnknownData_0xAEC9:
INCBIN "baserom.gb", $AEC9, $AF00 - $AEC9
	call Unknown_0x359A
	call Unknown_0xBE1A
	call Unknown_0xBE46
	call Unknown_0xA822
	jr nc,Unknown_0xAF16
	ld e,$02
	ld bc,$6EC9
	call Unknown_0x0846

Unknown_0xAF16:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	jr nc,Unknown_0xAF38
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0xAF38
	ld e,$02
	ld bc,$6E2A
	jp Unknown_0x37F4

Unknown_0xAF38:
	call Unknown_0x393E
	call Unknown_0x37CB
	jr nc,Unknown_0xAF48
	ld e,$02
	ld bc,$6EC9
	jp Unknown_0x37F4

Unknown_0xAF48:
	call Unknown_0x377C
	jr nc,Unknown_0xAF55
	ld e,$02
	ld bc,$6F97
	jp Unknown_0x37F4

Unknown_0xAF55:
	ld e,$3E
	ld a,[de]
	or a
	jr z,Unknown_0xAF6D
	call Unknown_0xAD18
	call Unknown_0xAD3C
	jr nc,Unknown_0xAF6B
	ld e,$07
	ld bc,$6E2C
	jp Unknown_0x37F4

Unknown_0xAF6B:
	jr Unknown_0xAF94

Unknown_0xAF6D:
	call Unknown_0x366B
	jr nc,Unknown_0xAF7A
	ld e,$02
	ld bc,$69B8
	jp Unknown_0x37F4

Unknown_0xAF7A:
	call Unknown_0x36E6
	jr nc,Unknown_0xAF87
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xAF87:
	call Unknown_0x3724
	jr nc,Unknown_0xAF94
	ld e,$01
	ld bc,$411F
	jp Unknown_0x37F4

Unknown_0xAF94:
	jp Unknown_0x37F7

UnknownData_0xAF97:
INCBIN "baserom.gb", $AF97, $AFD7 - $AF97
	ld hl,Unknown_0xB2BE
	ld a,$01
	call Unknown_0x05CF
	ret
	call Unknown_0xBF1C
	ld a,[$A056]
	or a
	jr z,Unknown_0xAFF7
	ld a,[$A055]
	or a
	jr nz,Unknown_0xAFF7
	ld e,$02
	ld bc,$7067
	jp Unknown_0x37F4

Unknown_0xAFF7:
	ld h,d
	ld l,$39
	ld a,[hl]
	or a
	jr z,Unknown_0xB001
	dec [hl]
	jr Unknown_0xB01B

Unknown_0xB001:
	ld a,[$FF00+$A5]
	bit 1,a
	jr nz,Unknown_0xB01B
	ld a,[$A056]
	or a
	jr nz,Unknown_0xB01B
	ld a,[$A055]
	or a
	jr nz,Unknown_0xB01B
	ld e,$02
	ld bc,$7048
	jp Unknown_0x37F4

Unknown_0xB01B:
	call Unknown_0x3A24
	jr nc,Unknown_0xB028
	ld e,$02
	ld bc,$6E1B
	jp Unknown_0x37F4

Unknown_0xB028:
	ld e,$3D
	ld a,[de]
	or a
	jr z,Unknown_0xB032
	dec a
	ld [de],a
	jr Unknown_0xB03A

Unknown_0xB032:
	ld hl,Unknown_0xB348
	ld a,$01
	call Unknown_0x05CF

Unknown_0xB03A:
	ld hl,Unknown_0xB043
	call Unknown_0x3AAA
	jp Unknown_0x37F7

Unknown_0xB043:
INCBIN "baserom.gb", $B043, $B054 - $B043
	call Unknown_0xBF1C
	call Unknown_0x3765
	jr nc,Unknown_0xB064
	ld e,$02
	ld bc,$6E1B
	jp Unknown_0x37F4

Unknown_0xB064:
	jp Unknown_0x37F7

UnknownData_0xB067:
INCBIN "baserom.gb", $B067, $B07F - $B067
	ld e,$0E
	ld bc,$0060
	call Unknown_0x0D23
	call Unknown_0xBD7B
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x393E
	call Unknown_0x3765
	jr nc,Unknown_0xB0AB
	ld e,$02
	ld bc,$71FD
	jp Unknown_0x37F4

Unknown_0xB0AB:
	jp Unknown_0x37F7

UnknownData_0xB0AE:
INCBIN "baserom.gb", $B0AE, $B0BC - $B0AE

Unknown_0xB0BC:
INCBIN "baserom.gb", $B0BC, $B110 - $B0BC
	call Unknown_0x359A
	call Unknown_0xBD84
	call Unknown_0xBD56
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	call Unknown_0x393E
	ld a,[$FF00+$B4]
	and $02
	jr z,Unknown_0xB13B
	ld e,$02
	ld bc,$7218
	jp Unknown_0x37F4

Unknown_0xB13B:
	call Unknown_0x3629
	jr nc,Unknown_0xB148
	ld e,$02
	ld bc,$725D
	jp Unknown_0x37F4

Unknown_0xB148:
	call Unknown_0x3765
	jr nc,Unknown_0xB155
	ld e,$02
	ld bc,$71FD
	jp Unknown_0x37F4

Unknown_0xB155:
	call Unknown_0xB8FB
	jr nc,Unknown_0xB162
	ld e,$02
	ld bc,$70CF
	jp Unknown_0x37F4

Unknown_0xB162:
	call Unknown_0x36E6
	jr nc,Unknown_0xB16F
	ld e,$08
	ld bc,$6282
	jp Unknown_0x37F4

Unknown_0xB16F:
	jp Unknown_0x37F7

UnknownData_0xB172:
INCBIN "baserom.gb", $B172, $B24A - $B172
	call Unknown_0xBF1C
	call Unknown_0x3765
	jr nc,Unknown_0xB25A
	ld e,$02
	ld bc,$6E1B
	jp Unknown_0x37F4

Unknown_0xB25A:
	jp Unknown_0x37F7

UnknownData_0xB25D:
INCBIN "baserom.gb", $B25D, $B2BE - $B25D

Unknown_0xB2BE:
INCBIN "baserom.gb", $B2BE, $B2C6 - $B2BE
	call Unknown_0xBF1C
	jp Unknown_0x37F7
	call Unknown_0x34FD
	ret

UnknownData_0xB2D0:
INCBIN "baserom.gb", $B2D0, $B2FD - $B2D0
	call Unknown_0xBF1C
	ld a,$02
	ld hl,Unknown_0xB328
	call Unknown_0x3AAA
	call Unknown_0x3AE9
	call Unknown_0x375B
	jr nc,Unknown_0xB318
	ld e,$02
	ld bc,$72F3
	jp Unknown_0x37F4

Unknown_0xB318:
	call Unknown_0x377C
	jr nc,Unknown_0xB325
	ld e,$02
	ld bc,$6F97
	jp Unknown_0x37F4

Unknown_0xB325:
	jp Unknown_0x37F7

Unknown_0xB328:
INCBIN "baserom.gb", $B328, $B32D - $B328
	call Unknown_0xBF1C
	call Unknown_0x377C
	jr nc,Unknown_0xB33D
	ld e,$02
	ld bc,$6F97
	jp Unknown_0x37F4

Unknown_0xB33D:
	jp Unknown_0x37F7

UnknownData_0xB340:
INCBIN "baserom.gb", $B340, $B348 - $B340

Unknown_0xB348:
INCBIN "baserom.gb", $B348, $B417 - $B348
	ld hl,Unknown_0x80DA
	ld a,$01
	call Unknown_0x05CF
	ret
	ld a,$06
	ld [$A072],a
	xor a
	ld [$DEE5],a
	ld hl,$DEDF
	set 1,[hl]
	ret
	ld a,[$DEFF]
	or a
	ret nz
	ld a,[$A071]
	cp $02
	ld e,$09
	jr z,Unknown_0xB445
	cp $03
	ld e,$0B
	jr z,Unknown_0xB445
	ld e,$14

Unknown_0xB445:
	push bc
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret
	push bc
	ld a,[$A071]
	ld hl,$7467
	ld e,a
	ld hl,$606D
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

UnknownData_0xB468:
INCBIN "baserom.gb", $B468, $B46B - $B468
	ld a,[$A064]
	or a
	jr z,Unknown_0xB474
	call Unknown_0x34FD

Unknown_0xB474:
	ld hl,Unknown_0xB0BC
	ld a,$08
	call Unknown_0x05CF
	ret
	ld a,[$A051]
	ld hl,$7499
	add a,l
	ld l,a
	jr nc,Unknown_0xB488
	inc h

Unknown_0xB488:
	ld a,[hl]
	or a
	jr z,Unknown_0xB498
	ld [$A05B],a
	inc a
	ld [$DEE0],a
	ld hl,$DEDE
	set 3,[hl]

Unknown_0xB498:
	ret

UnknownData_0xB499:
INCBIN "baserom.gb", $B499, $B4A7 - $B499
	push bc
	call Unknown_0x1AB3
	pop bc
	jr nz,Unknown_0xB4E8
	ld a,$01
	ld [$A070],a
	push bc
	ld a,[$A071]
	ld hl,$7532
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0xB4C0
	inc h

Unknown_0xB4C0:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call Unknown_0x0620
	call Unknown_0xB53A
	pop bc
	jr nc,Unknown_0xB4D2
	ld e,$27
	ld a,$06
	ld [de],a
	ret

Unknown_0xB4D2:
	ld h,d
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ld l,$0D
	ld a,[hli]
	or [hl]
	ld e,$27
	jr nz,Unknown_0xB4E4
	ld a,$04
	ld [de],a
	ret

Unknown_0xB4E4:
	ld a,$05
	ld [de],a
	ret

Unknown_0xB4E8:
	xor a
	ld [$A070],a
	ld a,[$A050]
	cp $0D
	jr nz,Unknown_0xB4F9
	ld e,$27
	ld a,$03
	ld [de],a
	ret

Unknown_0xB4F9:
	ld e,$10
	ld a,[de]
	rla
	jr c,Unknown_0xB518
	push bc
	ld a,[$A071]
	ld hl,$7532
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0xB50C
	inc h

Unknown_0xB50C:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call Unknown_0x0620
	call Unknown_0xB53A
	pop bc
	jr nc,Unknown_0xB51E

Unknown_0xB518:
	ld e,$27
	ld a,$02
	ld [de],a
	ret

Unknown_0xB51E:
	ld h,d
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ld l,$0D
	ld a,[hli]
	or [hl]
	ld e,$27
	jr nz,Unknown_0xB530
	ld a,$00
	ld [de],a
	ret

Unknown_0xB530:
	ld a,$01
	ld [de],a
	ret

UnknownData_0xB534:
INCBIN "baserom.gb", $B534, $B53A - $B534

Unknown_0xB53A:
	ld h,d
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr c,Unknown_0xB58F
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0xB568
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xB58F
	ld a,[$FF00+$B1]
	add a,l
	jr Unknown_0xB58F

Unknown_0xB568:
	ld a,[$FF00+$B3]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0xB585
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xB58F
	ld a,[$FF00+$B0]
	cpl
	scf
	adc a,l
	jr Unknown_0xB58F

Unknown_0xB585:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,$00
	ld [de],a
	scf
	ret

Unknown_0xB58F:
	inc a
	jr nz,Unknown_0xB585
	ld a,[$FF00+$9A]
	ld d,a
	ld a,[$FF00+$9E]
	ld e,$4D
	ld [de],a
	ld a,[$FF00+$9F]
	ld e,$4E
	ld [de],a
	and a
	ret

Unknown_0xB5A1:
	ld h,d
	ld e,$4D
	ld a,[de]
	ld [$FF00+$84],a
	xor a
	ld [$FF00+$85],a
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr c,Unknown_0xB61E
	ld a,[$FF00+$84]
	cp $05
	ld a,[$FF00+$B0]
	jr z,Unknown_0xB5E7
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0xB5DF
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xB610
	ld a,[$FF00+$B1]
	add a,l
	jr Unknown_0xB60C

Unknown_0xB5DF:
	ld a,[$FF00+$84]
	cp $04
	jr z,Unknown_0xB602
	ld a,[$FF00+$B3]

Unknown_0xB5E7:
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0xB602
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xB610
	ld a,[$FF00+$B0]
	cpl
	scf
	adc a,l
	jr Unknown_0xB60C

Unknown_0xB602:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,$00
	ld [de],a
	scf
	ret

Unknown_0xB60C:
	ld hl,$FF85
	inc [hl]

Unknown_0xB610:
	ld b,a
	ld a,[$FF00+$84]
	cp $04
	jr nc,Unknown_0xB61D
	ld a,[$FF00+$9E]
	cp $04
	jr nc,Unknown_0xB602

Unknown_0xB61D:
	ld a,b

Unknown_0xB61E:
	inc a
	ld l,a
	rlca
	sbc a,a
	ld b,a
	ld a,[$FF00+$9A]
	ld h,a
	ld a,l
	ld l,$06
	ld [hl],$80
	inc l
	add a,[hl]
	ld [hli],a
	ld a,b
	adc a,[hl]
	ld [hl],a
	ld a,[$FF00+$9E]
	ld l,$4D
	ld [hl],a
	ld a,[$FF00+$9F]
	ld l,$4E
	ld [hl],a
	ld a,[$FF00+$85]
	or a
	jr z,Unknown_0xB658
	xor a
	ld [$FF00+$85],a
	ld a,[$FF00+$AF]
	inc a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr c,Unknown_0xB61E
	ld a,[$FF00+$9A]
	ld h,a

Unknown_0xB658:
	ld d,h
	ld e,$4E
	ld a,[de]
	cp $31
	call z,Unknown_0x3C63
	and a
	ret

Unknown_0xB663:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0xB6C3
	ld h,d
	bit 4,a
	ld de,$0000
	jr z,Unknown_0xB696
	ld a,[$FF00+$B1]
	inc a
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x17A3
	jr nc,Unknown_0xB683
	rla
	jr c,Unknown_0xB6C0

Unknown_0xB683:
	ld a,[$FF00+$AE]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x17A3
	jr nc,Unknown_0xB6BB
	rla
	jr nc,Unknown_0xB6BB
	jr Unknown_0xB6C0

Unknown_0xB696:
	ld a,[$FF00+$B0]
	dec a
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x16EF
	jr nc,Unknown_0xB6A9
	dec a
	rla
	jr nc,Unknown_0xB6C0

Unknown_0xB6A9:
	ld a,[$FF00+$AE]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x16EF
	jr nc,Unknown_0xB6BB
	dec a
	rla
	jr nc,Unknown_0xB6C0

Unknown_0xB6BB:
	ld a,[$FF00+$9A]
	ld d,a
	scf
	ret

Unknown_0xB6C0:
	ld a,[$FF00+$9A]
	ld d,a

Unknown_0xB6C3:
	and a
	ret

Unknown_0xB6C5:
	call Unknown_0xB6DF
	jr nc,Unknown_0xB6DD
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$0E
	ld a,[de]
	xor b
	rla
	jr c,Unknown_0xB6DD
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	scf
	ret

Unknown_0xB6DD:
	and a
	ret

Unknown_0xB6DF:
	ld h,d
	ld l,$0E
	ld de,$0000
	bit 7,[hl]
	jr nz,Unknown_0xB726
	ld a,[$FF00+$B1]
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x17A3
	jr nc,Unknown_0xB6FC
	ld l,a
	rlca
	jp c,Unknown_0x1E2A

Unknown_0xB6FC:
	ld a,[$FF00+$AE]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x17A3
	jr nc,Unknown_0xB70F
	ld l,a
	rlca
	jp c,Unknown_0x1E2A

Unknown_0xB70F:
	ld a,[$FF00+$B2]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x17A3
	jp nc,Unknown_0x1E6D
	ld l,a
	rlca
	jp c,Unknown_0x1E2A
	jp Unknown_0x1E6D

Unknown_0xB726:
	ld a,[$FF00+$B0]
	ld c,a
	rla
	sbc a,a
	ld b,a
	call Unknown_0x1AD9
	call Unknown_0x16EF
	jr nc,Unknown_0xB73A
	ld l,a
	dec a
	rlca
	jp nc,Unknown_0x1E4C

Unknown_0xB73A:
	ld a,[$FF00+$AE]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x16EF
	jr nc,Unknown_0xB74E
	ld l,a
	dec a
	rlca
	jp nc,Unknown_0x1E4C

Unknown_0xB74E:
	ld a,[$FF00+$B2]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x16EF
	jp nc,Unknown_0x1E6D
	ld l,a
	dec a
	rlca
	jp nc,Unknown_0x1E4C
	jp Unknown_0x1E6D

Unknown_0xB766:
	ld h,d
	ld a,[$FF00+$AE]
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x18D7
	jr nc,Unknown_0xB780
	ld l,a
	dec a
	rlca
	jr nc,Unknown_0xB7CB
	jp Unknown_0x1E6D

Unknown_0xB780:
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x18D7
	jp nc,Unknown_0xB7A6
	ld l,a
	ld a,[$FF00+$9E]
	cp $07
	jp z,Unknown_0xB7A6
	cp $06
	ld a,l
	jr nz,Unknown_0xB7A2
	ld a,[$FF00+$B1]
	cpl
	scf
	adc a,l
	ld l,a

Unknown_0xB7A2:
	dec a
	rlca
	jr nc,Unknown_0xB7CB

Unknown_0xB7A6:
	ld a,[$FF00+$B3]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x18D7
	jp nc,Unknown_0x1E6D
	ld l,a
	ld a,[$FF00+$9E]
	cp $06
	jp z,Unknown_0x1E6D
	cp $07
	ld a,l
	jr nz,Unknown_0xB7C6
	ld a,[$FF00+$B0]
	add a,l
	ld l,a

Unknown_0xB7C6:
	dec a
	rlca
	jp c,Unknown_0x1E6D

Unknown_0xB7CB:
	ld a,[$FF00+$9A]
	ld h,a
	ld a,l
	ld l,$06
	ld [hl],$80
	inc l
	add a,[hl]
	ld [hli],a
	ld a,$00
	adc a,[hl]
	ld [hl],a
	ld d,h
	scf
	ret

Unknown_0xB7DD:
	xor a
	ld [$DB7C],a
	ld h,d
	ld a,[$FF00+$AF]
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x184E
	jr nc,Unknown_0xB801
	ld l,a
	rlca
	jr c,Unknown_0xB855
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,[$FF00+$9E]
	ld [de],a
	jr Unknown_0xB84D

Unknown_0xB801:
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0xB822
	ld l,a
	ld a,[$FF00+$9E]
	cp $05
	jr z,Unknown_0xB822
	cp $04
	ld a,l
	jr nz,Unknown_0xB81F
	ld a,[$FF00+$B1]
	add a,l
	ld l,a

Unknown_0xB81F:
	rlca
	jr c,Unknown_0xB887

Unknown_0xB822:
	ld a,[$FF00+$B3]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x184E
	jr nc,Unknown_0xB845
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	jr z,Unknown_0xB845
	cp $05
	ld a,l
	jr nz,Unknown_0xB842
	ld a,[$FF00+$B0]
	cpl
	scf
	adc a,l
	ld l,a

Unknown_0xB842:
	rlca
	jr c,Unknown_0xB887

Unknown_0xB845:
	ld a,[$FF00+$9A]
	ld h,a
	ld d,a
	ld l,$4D
	ld [hl],$00

Unknown_0xB84D:
	ld e,$4F
	ld a,[$DB7C]
	ld [de],a
	and a
	ret

Unknown_0xB855:
	ld a,$01
	ld [$DB7C],a
	ld a,[$FF00+$9A]
	ld h,a
	ld c,l
	ld l,$4D
	ld a,[hl]
	cp $04
	jr nc,Unknown_0xB8BD
	ld a,[$FF00+$9E]
	ld e,$00
	cp $04
	jr c,Unknown_0xB8A9
	ld l,$4F
	bit 0,[hl]
	jr nz,Unknown_0xB88B
	ld l,$06
	ld b,[hl]
	ld l,$0F
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF
	bit 7,a
	jr nz,Unknown_0xB88B
	add a,c
	jr nc,Unknown_0xB88B
	jr Unknown_0xB8BD

Unknown_0xB887:
	ld a,[$FF00+$9A]
	ld h,a
	ld c,l

Unknown_0xB88B:
	ld a,[$FF00+$9E]
	cp $04
	ld e,$00
	jr c,Unknown_0xB8A9
	ld l,$03
	ld b,[hl]
	ld l,$0D
	ld a,[hli]
	jr z,Unknown_0xB8A3
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$00
	cpl
	jr Unknown_0xB8A8

Unknown_0xB8A3:
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF

Unknown_0xB8A8:
	ld e,a

Unknown_0xB8A9:
	ld l,$06
	ld b,[hl]
	ld l,$0F
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF
	add a,e
	bit 7,a
	jr nz,Unknown_0xB845
	add a,c
	jp nc,Unknown_0xB845

Unknown_0xB8BD:
	ld l,$06
	ld [hl],$80
	inc l
	ld a,c
	add a,[hl]
	ld [hli],a
	ld a,$FF
	adc a,[hl]
	ld [hl],a
	ld a,[$FF00+$9E]
	ld l,$4D
	ld [hl],a
	ld d,h
	ld a,[$FF00+$9F]
	ld l,$4E
	ld [hl],a
	ld l,$4F
	ld [hl],$00
	scf
	ret

Unknown_0xB8DA:
	ld e,$6F
	ld a,[$FF00+$A6]
	and $01
	ld b,$02
	jr nz,Unknown_0xB8F7
	ld a,[$FF00+$A5]
	and $F1
	ld b,$00
	jr z,Unknown_0xB8ED
	inc b

Unknown_0xB8ED:
	ld a,[de]
	cp $02
	jr z,Unknown_0xB8F5
	cp b
	jr nz,Unknown_0xB8F7

Unknown_0xB8F5:
	and a
	ret

Unknown_0xB8F7:
	ld a,b
	ld [de],a
	scf
	ret

Unknown_0xB8FB:
	ld e,$3D
	ld a,[$FF00+$A6]
	and $01
	ld b,$05
	jr nz,Unknown_0xB922
	ld a,[$FF00+$A5]
	ld b,$00
	and $F0
	jr z,Unknown_0xB918
	inc b
	bit 6,a
	jr nz,Unknown_0xB918
	inc b
	bit 7,a
	jr nz,Unknown_0xB918
	inc b

Unknown_0xB918:
	ld a,[de]
	cp $05
	jr z,Unknown_0xB920
	cp b
	jr nz,Unknown_0xB922

Unknown_0xB920:
	and a
	ret

Unknown_0xB922:
	ld a,b
	ld [de],a
	scf
	ret

Unknown_0xB926:
	ld hl,$FFAE
	ld a,$F3
	ld [hli],a
	ld a,$0A
	ld [hli],a
	ld a,$F7
	ld [hli],a
	ld a,$08
	ld [hli],a
	ld a,$17
	ld [hli],a
	ld a,$EF
	ld [hli],a
	ret

Unknown_0xB93C:
	ld hl,$FFAE
	ld a,$F5
	ld [hli],a
	ld a,$08
	ld [hli],a
	ld a,$F7
	ld [hli],a
	ld a,$08
	ld [hli],a
	ld a,$13
	ld [hli],a
	ld a,$EF
	ld [hli],a
	ret

Unknown_0xB952:
	ld hl,$FFAE
	ld a,$F4
	ld [hli],a
	ld a,$0C
	ld [hli],a
	ld a,$F7
	ld [hli],a
	ld a,$08
	ld [hli],a
	ld a,$18
	ld [hli],a
	ld a,$EF
	ld [hli],a
	ret

Unknown_0xB968:
	ld e,$28
	jp Unknown_0x0D04

Unknown_0xB96D:
	ld e,$6D
	ld a,[de]
	cp $03
	jr nc,Unknown_0xB995
	cp $01
	jr z,Unknown_0xB983
	jr nc,Unknown_0xB98C

Unknown_0xB97A:
	ld hl,$200E
	ld bc,$014C
	jp Unknown_0x386E

Unknown_0xB983:
	ld hl,$080E
	ld bc,$00A0
	jp Unknown_0x386E

Unknown_0xB98C:
	ld hl,$200E
	ld bc,$01E0
	jp Unknown_0x386E

Unknown_0xB995:
	cp $04
	jr z,Unknown_0xB983
	jr nc,Unknown_0xB98C
	jr Unknown_0xB97A

Unknown_0xB99D:
	ld e,$6D
	ld a,[de]
	cp $03
	jr nc,Unknown_0xB9F3
	cp $01
	jr z,Unknown_0xB9C1
	jr nc,Unknown_0xB9DA

Unknown_0xB9AA:
	ld bc,$014C
	ld hl,$00A6
	ld a,$20
	ld [$FF00+$85],a
	ld a,$10
	ld [$FF00+$86],a
	ld a,$0E
	ld [$FF00+$80],a
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xB9C1:
	ld bc,$00A0
	ld hl,$00F0
	ld a,$08
	ld [$FF00+$85],a
	ld a,$10
	ld [$FF00+$86],a
	ld a,$0E
	ld [$FF00+$80],a
	ld a,$0E
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xB9DA:
	ld bc,$01E0
	ld hl,$0050
	ld a,$20
	ld [$FF00+$85],a
	ld a,$04
	ld [$FF00+$86],a
	ld a,$0E
	ld [$FF00+$80],a
	ld a,$0E
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xB9F3:
	cp $04
	jr z,Unknown_0xB9C1
	jr nc,Unknown_0xB9DA
	jr Unknown_0xB9AA

Unknown_0xB9FB:
	ld b,$00
	ld e,$4D
	ld a,[de]
	cp $04
	jr c,Unknown_0xBA76
	ld a,[$FF00+$A5]
	jr nz,Unknown_0xBA3F
	and $10
	ld a,[$A070]
	jr z,Unknown_0xBA27
	or a
	jr nz,Unknown_0xBA1F
	bit 0,b
	ld e,$04
	jr z,Unknown_0xBA1A
	ld e,$04

Unknown_0xBA1A:
	ld bc,$0010
	jr Unknown_0xBA24

Unknown_0xBA1F:
	ld e,$02
	ld bc,$0008

Unknown_0xBA24:
	jp Unknown_0x0CA2

Unknown_0xBA27:
	or a
	jr nz,Unknown_0xBA37
	bit 0,b
	ld e,$20
	jr z,Unknown_0xBA32
	ld e,$18

Unknown_0xBA32:
	ld bc,$FE20
	jr Unknown_0xBA3C

Unknown_0xBA37:
	ld e,$0B
	ld bc,$FF00

Unknown_0xBA3C:
	jp Unknown_0x0CD3

Unknown_0xBA3F:
	and $20
	ld a,[$A070]
	jr z,Unknown_0xBA5E
	or a
	jr nz,Unknown_0xBA56
	bit 0,b
	ld e,$04
	jr z,Unknown_0xBA51
	ld e,$04

Unknown_0xBA51:
	ld bc,$FFF0
	jr Unknown_0xBA5B

Unknown_0xBA56:
	ld e,$02
	ld bc,$FFF8

Unknown_0xBA5B:
	jp Unknown_0x0CD3

Unknown_0xBA5E:
	or a
	jr nz,Unknown_0xBA6E
	bit 0,b
	ld e,$20
	jr z,Unknown_0xBA69
	ld e,$18

Unknown_0xBA69:
	ld bc,$01E0
	jr Unknown_0xBA73

Unknown_0xBA6E:
	ld e,$0B
	ld bc,$0100

Unknown_0xBA73:
	jp Unknown_0x0CA2

Unknown_0xBA76:
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0xBA9E
	ld h,a
	ld a,[$A070]
	or a
	jr nz,Unknown_0xBA90
	bit 0,b
	ld e,$20
	jr z,Unknown_0xBA8B
	ld e,$18

Unknown_0xBA8B:
	ld bc,$014C
	jr Unknown_0xBA95

Unknown_0xBA90:
	ld e,$0B
	ld bc,$0099

Unknown_0xBA95:
	ld a,h
	and $10
	jp nz,Unknown_0x0CA2
	jp Unknown_0x0CC9

Unknown_0xBA9E:
	ld a,[$A070]
	or a
	jr nz,Unknown_0xBAAE
	bit 0,b
	ld e,$0E
	jr z,Unknown_0xBAB0
	ld e,$04
	jr Unknown_0xBAB0

Unknown_0xBAAE:
	ld e,$05

Unknown_0xBAB0:
	jp Unknown_0x0D04

Unknown_0xBAB3:
	ld hl,$160E
	ld bc,$014C
	jp Unknown_0x3894

Unknown_0xBABC:
	ld bc,$014C
	ld hl,$00A6
	ld a,$16
	ld [$FF00+$85],a
	ld a,$0B
	ld [$FF00+$86],a
	ld a,$0E
	ld [$FF00+$80],a
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xBAD3:
	ld e,$6D
	ld a,[de]
	cp $03
	jr c,Unknown_0xBADC
	sub $03

Unknown_0xBADC:
	cp $01
	jr z,Unknown_0xBAEB
	jr nc,Unknown_0xBAF4
	ld hl,$0B05
	ld bc,$0099
	jp Unknown_0x386E

Unknown_0xBAEB:
	ld hl,$0305
	ld bc,$0040
	jp Unknown_0x386E

Unknown_0xBAF4:
	ld hl,$0B05
	ld bc,$0100
	jp Unknown_0x386E

Unknown_0xBAFD:
	ld e,$6D
	ld a,[de]
	cp $03
	jr c,Unknown_0xBB06
	sub $03

Unknown_0xBB06:
	cp $01
	jr z,Unknown_0xBB23
	jr nc,Unknown_0xBB3C
	ld bc,$0099
	ld hl,$004D
	ld a,$0B
	ld [$FF00+$85],a
	ld a,$06
	ld [$FF00+$86],a
	ld a,$05
	ld [$FF00+$80],a
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xBB23:
	ld bc,$0040
	ld hl,$0080
	ld a,$03
	ld [$FF00+$85],a
	ld a,$06
	ld [$FF00+$86],a
	ld a,$05
	ld [$FF00+$80],a
	ld a,$05
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xBB3C:
	ld bc,$0100
	ld hl,$0020
	ld a,$0B
	ld [$FF00+$85],a
	ld a,$02
	ld [$FF00+$86],a
	ld a,$05
	ld [$FF00+$80],a
	ld a,$05
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xBB55:
	ld h,d
	ld l,$6E
	ld a,[hl]
	or a
	jr z,Unknown_0xBB5F
	dec [hl]
	jr Unknown_0xBB6E

Unknown_0xBB5F:
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0xBB6E
	ld [hl],$0F
	ld l,$0F
	ld [hl],$00
	inc l
	ld [hl],$FF

Unknown_0xBB6E:
	ld e,$08
	ld bc,$00E0
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0xBB7E
	ld e,$10
	ld bc,$0200

Unknown_0xBB7E:
	jp Unknown_0x0D23

Unknown_0xBB81:
	ld h,d
	ld l,$6E
	ld a,[hl]
	or a
	jr z,Unknown_0xBB8B
	dec [hl]
	jr Unknown_0xBB9A

Unknown_0xBB8B:
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0xBB9A
	ld [hl],$0F
	ld l,$0F
	ld [hl],$00
	inc l
	ld [hl],$FF

Unknown_0xBB9A:
	ld e,$08
	ld bc,$00E0
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0xBBAA
	ld e,$10
	ld bc,$0200

Unknown_0xBBAA:
	jp Unknown_0x0D23

Unknown_0xBBAD:
	ld hl,$0809
	ld bc,$010C
	jp Unknown_0x3894

Unknown_0xBBB6:
	ld bc,$010C
	ld hl,$0086
	ld a,$08
	ld [$FF00+$85],a
	ld a,$04
	ld [$FF00+$86],a
	ld a,$09
	ld [$FF00+$80],a
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xBBCD:
	ld e,$6D
	ld a,[de]
	ld hl,$7BDD
	add a,l
	ld l,a
	jr nc,Unknown_0xBBD8
	inc h

Unknown_0xBBD8:
	ld a,[hl]
	ld e,a
	jp Unknown_0x0D04

UnknownData_0xBBDD:
INCBIN "baserom.gb", $BBDD, $BBE3 - $BBDD

Unknown_0xBBE3:
	ld e,$4E
	ld a,[de]
	and $F0
	cp $70
	ld b,$00
	jr z,Unknown_0xBBF6
	inc b
	ld a,[$A070]
	or a
	jr nz,Unknown_0xBBF6
	inc b

Unknown_0xBBF6:
	ld e,$4D
	ld a,[de]
	cp $04
	jr c,Unknown_0xBC2B
	ld e,$20
	jr nz,Unknown_0xBC16
	bit 1,b
	jr nz,Unknown_0xBC10
	ld e,$0B
	bit 0,b
	ld bc,$FF00
	jr nz,Unknown_0xBC13
	ld e,$18

Unknown_0xBC10:
	ld bc,$FE20

Unknown_0xBC13:
	jp Unknown_0x0CD3

Unknown_0xBC16:
	bit 1,b
	jr nz,Unknown_0xBC25
	ld e,$0B
	bit 0,b
	ld bc,$0100
	jr nz,Unknown_0xBC28
	ld e,$18

Unknown_0xBC25:
	ld bc,$01E0

Unknown_0xBC28:
	jp Unknown_0x0CA2

Unknown_0xBC2B:
	bit 1,b
	ld e,$0E
	jr nz,Unknown_0xBC39
	bit 0,b
	ld e,$05
	jr nz,Unknown_0xBC39
	ld e,$04

Unknown_0xBC39:
	jp Unknown_0x0D04

Unknown_0xBC3C:
	ld hl,$160E
	ld bc,$0160
	jp Unknown_0x3894

Unknown_0xBC45:
	ld bc,$0160
	ld hl,$00A6
	ld a,$16
	ld [$FF00+$85],a
	ld a,$0B
	ld [$FF00+$86],a
	ld a,$0E
	ld [$FF00+$80],a
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xBC5C:
	ld a,[$FF00+$A5]
	and $C1
	ld [$FF00+$84],a
	bit 0,a
	jr z,Unknown_0xBC7E
	ld e,$43
	ld a,[$FF00+$A6]
	bit 0,a
	jr nz,Unknown_0xBC75
	ld a,[de]
	or a
	jr z,Unknown_0xBC7E
	dec a
	jr Unknown_0xBC77

Unknown_0xBC75:
	ld a,$10

Unknown_0xBC77:
	ld [de],a
	ld a,[$FF00+$84]
	and $FE
	ld [$FF00+$84],a

Unknown_0xBC7E:
	ld h,d
	ld l,$10
	ld a,[$FF00+$A6]
	bit 0,a
	jr nz,Unknown_0xBCBC

Unknown_0xBC87:
	ld a,[hld]
	rla
	jr c,Unknown_0xBC98
	ld a,[hli]
	sub $E0
	ld a,[hl]
	sbc a,$00
	jr c,Unknown_0xBCA0

Unknown_0xBC93:
	ld e,$12
	jp Unknown_0x0D85

Unknown_0xBC98:
	ld a,[hli]
	sub $20
	ld a,[hl]
	sbc a,$FF
	jr c,Unknown_0xBC93

Unknown_0xBCA0:
	ld a,[$FF00+$84]
	or a
	jr nz,Unknown_0xBCAA
	ld e,$08
	jp Unknown_0x0D85

Unknown_0xBCAA:
	ld e,$10
	bit 7,a
	jr z,Unknown_0xBCB6
	ld bc,$00E0
	jp Unknown_0x0D35

Unknown_0xBCB6:
	ld bc,$FF20
	jp Unknown_0x0D70

Unknown_0xBCBC:
	ld a,[$FF00+$84]
	and $C0
	or a
	jr nz,Unknown_0xBCCB
	ld a,[$FF00+$A5]
	and $30
	jr nz,Unknown_0xBC87
	jr Unknown_0xBCD2

Unknown_0xBCCB:
	bit 7,a
	ld bc,$0150
	jr nz,Unknown_0xBCD5

Unknown_0xBCD2:
	ld bc,$FEB0

Unknown_0xBCD5:
	ld [hl],b
	dec l
	ld [hl],c
	ret

Unknown_0xBCD9:
	ld e,$45
	ld a,[$FF00+$A5]
	and $30
	ld [$FF00+$84],a
	jr z,Unknown_0xBCEC
	bit 4,a
	ld a,$40
	jr nz,Unknown_0xBCEB
	ld a,$C0

Unknown_0xBCEB:
	ld [de],a

Unknown_0xBCEC:
	ld h,d
	ld l,$0E
	ld a,[$FF00+$A6]
	bit 0,a
	jr nz,Unknown_0xBD2A

Unknown_0xBCF5:
	ld a,[hld]
	rla
	jr c,Unknown_0xBD06
	ld a,[hli]
	sub $0C
	ld a,[hl]
	sbc a,$01
	jr c,Unknown_0xBD0E

Unknown_0xBD01:
	ld e,$12
	jp Unknown_0x0D04

Unknown_0xBD06:
	ld a,[hli]
	sub $F4
	ld a,[hl]
	sbc a,$FE
	jr c,Unknown_0xBD01

Unknown_0xBD0E:
	ld a,[$FF00+$84]
	or a
	jr nz,Unknown_0xBD18
	ld e,$08
	jp Unknown_0x0D04

Unknown_0xBD18:
	ld e,$10
	bit 4,a
	jr z,Unknown_0xBD24
	ld bc,$010C
	jp Unknown_0x0CB4

Unknown_0xBD24:
	ld bc,$FEF4
	jp Unknown_0x0CEF

Unknown_0xBD2A:
	ld a,[$FF00+$84]
	or a
	jr z,Unknown_0xBCF5
	ld e,$45
	ld a,[de]
	rla
	ld bc,$0192
	jr nc,Unknown_0xBD3B
	ld bc,$FE6E

Unknown_0xBD3B:
	ld [hl],b
	dec l
	ld [hl],c
	ret

Unknown_0xBD3F:
	ld bc,$010C
	ld hl,$0086
	ld a,$10
	ld [$FF00+$85],a
	ld a,$04
	ld [$FF00+$86],a
	ld a,$08
	ld [$FF00+$80],a
	ld [$FF00+$81],a
	jp Unknown_0x38BC

Unknown_0xBD56:
	ld a,[$FF00+$A6]
	bit 0,a
	jr z,Unknown_0xBD72
	ld a,[$FF00+$A5]
	and $30
	jr z,Unknown_0xBD72
	bit 4,a
	ld bc,$01B9
	jr nz,Unknown_0xBD6C
	ld bc,$FE47

Unknown_0xBD6C:
	ld h,d
	ld l,$0E
	ld [hl],b
	dec l
	ld [hl],c

Unknown_0xBD72:
	ld hl,$1A0C
	ld bc,$0126
	jp Unknown_0x3894

Unknown_0xBD7B:
	ld hl,$1A0C
	ld bc,$0126
	jp Unknown_0x386E

Unknown_0xBD84:
	ld a,[$FF00+$A5]
	and $C1
	ld [$FF00+$84],a
	bit 0,a
	jr z,Unknown_0xBDA6
	ld e,$43
	ld a,[$FF00+$A6]
	bit 0,a
	jr nz,Unknown_0xBD9D
	ld a,[de]
	or a
	jr z,Unknown_0xBDA6
	dec a
	jr Unknown_0xBD9F

Unknown_0xBD9D:
	ld a,$10

Unknown_0xBD9F:
	ld [de],a
	ld a,[$FF00+$84]
	and $FE
	ld [$FF00+$84],a

Unknown_0xBDA6:
	ld h,d
	ld l,$10
	ld a,[$FF00+$A6]
	bit 0,a
	jr nz,Unknown_0xBDFD

Unknown_0xBDAF:
	ld a,[hld]
	rla
	jr nc,Unknown_0xBDC0
	ld a,[hli]
	sub $B3
	ld a,[hl]
	sbc a,$FE
	jr nc,Unknown_0xBDC0
	ld e,$1C
	jp Unknown_0x0D85

Unknown_0xBDC0:
	ld a,[$FF00+$84]
	bit 6,a
	jr nz,Unknown_0xBDD6
	bit 0,a
	jr nz,Unknown_0xBDD6
	bit 7,a
	jr z,Unknown_0xBDDE
	ld e,$20
	ld bc,$014C
	jp Unknown_0x0D23

Unknown_0xBDD6:
	ld e,$20
	ld bc,$FEB3
	jp Unknown_0x0D70

Unknown_0xBDDE:
	ld bc,$0060
	ld l,$10
	ld a,[hld]
	rla
	jr c,Unknown_0xBDF8
	ld a,[$FF00+$A5]
	and $30
	jr nz,Unknown_0xBDF3
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0xBDF8

Unknown_0xBDF3:
	ld e,$0E
	jp Unknown_0x0D85

Unknown_0xBDF8:
	ld e,$0E
	jp Unknown_0x0D23

Unknown_0xBDFD:
	ld a,[$FF00+$84]
	ld e,a
	and $C0
	jr nz,Unknown_0xBE0C
	ld a,[$FF00+$A5]
	and $30
	jr nz,Unknown_0xBDAF
	jr Unknown_0xBE13

Unknown_0xBE0C:
	bit 7,a
	ld bc,$01F3
	jr nz,Unknown_0xBE16

Unknown_0xBE13:
	ld bc,$FE0D

Unknown_0xBE16:
	ld [hl],b
	dec l
	ld [hl],c
	ret

Unknown_0xBE1A:
	ld h,d
	ld l,$6E
	ld a,[hl]
	or a
	jr z,Unknown_0xBE24
	dec [hl]
	jr Unknown_0xBE33

Unknown_0xBE24:
	ld a,[$FF00+$A5]
	and $41
	jr z,Unknown_0xBE33
	ld [hl],$0F
	ld l,$0F
	ld [hl],$00
	inc l
	ld [hl],$FF

Unknown_0xBE33:
	ld e,$08
	ld bc,$00E0
	ld a,[$FF00+$A5]
	and $80
	jr z,Unknown_0xBE43
	ld e,$10
	ld bc,$0200

Unknown_0xBE43:
	jp Unknown_0x0D23

Unknown_0xBE46:
	ld hl,$0809
	ld bc,$010C
	jp Unknown_0x3894

Unknown_0xBE4F:
	ld e,$4E
	ld a,[de]
	and $F0
	cp $70
	ld b,$00
	jr z,Unknown_0xBE62
	inc b
	ld a,[$A070]
	or a
	jr nz,Unknown_0xBE62
	inc b

Unknown_0xBE62:
	ld e,$4D
	ld a,[de]
	cp $04
	jr c,Unknown_0xBE97
	ld e,$20
	jr nz,Unknown_0xBE82
	bit 1,b
	jr nz,Unknown_0xBE7C
	ld e,$0B
	bit 0,b
	ld bc,$FF00
	jr nz,Unknown_0xBE7F
	ld e,$18

Unknown_0xBE7C:
	ld bc,$FE20

Unknown_0xBE7F:
	jp Unknown_0x0CD3

Unknown_0xBE82:
	bit 1,b
	jr nz,Unknown_0xBE91
	ld e,$0B
	bit 0,b
	ld bc,$0100
	jr nz,Unknown_0xBE94
	ld e,$18

Unknown_0xBE91:
	ld bc,$01E0

Unknown_0xBE94:
	jp Unknown_0x0CA2

Unknown_0xBE97:
	bit 1,b
	ld e,$0E
	jr nz,Unknown_0xBEA5
	bit 0,b
	ld e,$05
	jr nz,Unknown_0xBEA5
	ld e,$04

Unknown_0xBEA5:
	jp Unknown_0x0D04

Unknown_0xBEA8:
	call Unknown_0xBEC2
	call Unknown_0xBECF
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB926
	call Unknown_0x391A
	call Unknown_0x3972
	jp Unknown_0x3952

Unknown_0xBEC2:
	ld a,[$A070]
	or a
	ld e,$0E
	jr z,Unknown_0xBECC
	ld e,$09

Unknown_0xBECC:
	jp Unknown_0x0D04

Unknown_0xBECF:
	ld a,[$A070]
	or a
	ld e,$20
	ld bc,$0280
	jr z,Unknown_0xBEDF
	ld e,$08
	ld bc,$00E0

Unknown_0xBEDF:
	jp Unknown_0x0D23

Unknown_0xBEE2:
	call Unknown_0xBEFC
	call Unknown_0xBF09
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB93C
	call Unknown_0x391A
	call Unknown_0x3972
	jp Unknown_0x3952

Unknown_0xBEFC:
	ld a,[$A070]
	or a
	ld e,$0E
	jr z,Unknown_0xBF06
	ld e,$08

Unknown_0xBF06:
	jp Unknown_0x0D04

Unknown_0xBF09:
	ld a,[$A070]
	or a
	jr z,Unknown_0xBF14
	ld e,$08
	jp Unknown_0x0D85

Unknown_0xBF14:
	ld e,$20
	ld bc,$0280
	jp Unknown_0x0D23

Unknown_0xBF1C:
	call Unknown_0xBF36
	call Unknown_0xBF43
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0xB952
	call Unknown_0x391A
	call Unknown_0x3972
	jp Unknown_0x393E

Unknown_0xBF36:
	ld a,[$A070]
	or a
	ld e,$0C
	jr z,Unknown_0xBF40
	ld e,$09

Unknown_0xBF40:
	jp Unknown_0x0D04

Unknown_0xBF43:
	ld a,[$A070]
	or a
	jr nz,Unknown_0xBF4E
	ld e,$0E
	jp Unknown_0x0D85

Unknown_0xBF4E:
	ld e,$08
	ld bc,$00E0
	jp Unknown_0x0D23

UnknownData_0xBF56:
INCBIN "baserom.gb", $BF56, $C000 - $BF56

SECTION "Bank03", ROMX, BANK[$03]

UnknownData_0xC000:
INCBIN "baserom.gb", $C000, $C009 - $C000
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$5D
	ld e,l
	ld a,[hl]
	xor $80
	ld [de],a
	ret

UnknownData_0xC015:
INCBIN "baserom.gb", $C015, $C099 - $C015

Unknown_0xC099:
INCBIN "baserom.gb", $C099, $C0B0 - $C099

Unknown_0xC0B0:
INCBIN "baserom.gb", $C0B0, $C0FD - $C0B0

Unknown_0xC0FD:
INCBIN "baserom.gb", $C0FD, $C168 - $C0FD
	ld bc,$4015
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld e,$04
	ld b,$28
	call Unknown_0x1F9C
	jr nc,Unknown_0xC18C
	ld e,$07
	ld b,$28
	call Unknown_0x1F9C
	jr nc,Unknown_0xC18C
	ld e,$03
	ld bc,Unknown_0xC0B0
	jp Unknown_0x0846

Unknown_0xC18C:
	call Unknown_0x0DA4
	ld e,$40
	ld a,[de]
	rlca
	ld hl,$41A0
	add a,l
	ld l,a
	ld a,h
	adc a,$00
	ld h,a
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0xC1A0:
INCBIN "baserom.gb", $C1A0, $C1A8 - $C1A0
	call Unknown_0xD026

Unknown_0xC1AB:
	or a
	jr z,Unknown_0xC1C7
	bit 5,a
	ld h,d
	ld l,$3D
	ld [hl],$02
	ret z
	call Unknown_0x1FAF

Unknown_0xC1B9:
	ld e,$0E
	ld a,[de]
	and $80
	xor $80
	rlca
	add a,$02
	ld e,$40
	ld [de],a
	ret

Unknown_0xC1C7:
	ld h,d
	ld l,$3D
	dec [hl]
	jr nz,Unknown_0xC1D5
	ld e,$03
	ld bc,$408C
	jp Unknown_0x0846

Unknown_0xC1D5:
	call Unknown_0x1FBD
	jr Unknown_0xC1B9
	call Unknown_0x19CB
	jr Unknown_0xC1AB
	call Unknown_0xD0D0

Unknown_0xC1E2:
	or a
	jr z,Unknown_0xC200
	bit 7,a
	jr nz,Unknown_0xC1F1
	bit 6,a
	ld h,d
	ld l,$3D
	ld [hl],$02
	ret z

Unknown_0xC1F1:
	call Unknown_0x1FBD

Unknown_0xC1F4:
	ld e,$10
	ld a,[de]
	and $80
	xor $80
	rlca
	ld e,$40
	ld [de],a
	ret

Unknown_0xC200:
	ld h,d
	ld l,$3D
	dec [hl]
	jr nz,Unknown_0xC20E
	ld e,$03
	ld bc,$408C
	jp Unknown_0x0846

Unknown_0xC20E:
	call Unknown_0x1FAF
	jr Unknown_0xC1F4
	call Unknown_0xD0F8
	jr Unknown_0xC1E2
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4015
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$40
	ld a,$01
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xC099
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4015
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4015
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld e,$27
	ld a,[de]
	cp $01
	jr nz,Unknown_0xC266
	call Unknown_0x202B
	ret c
	jr Unknown_0xC26A

Unknown_0xC266:
	call Unknown_0x202B
	ret nc

Unknown_0xC26A:
	ld e,$03
	ld bc,Unknown_0xC0FD
	jp Unknown_0x0846
	ld bc,$4015
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld h,d
	ld l,$3E
	dec [hl]
	ret nz
	ld [hl],$02
	ld l,$47
	ld a,$10
	xor [hl]
	ld [hl],a
	ret
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$4023
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	push bc
	ld b,$10
	ld e,$07
	call Unknown_0x1F9C
	ld a,$00
	jr nc,Unknown_0xC2B1
	call Unknown_0x0647
	cp $80
	ld a,$00
	jr nc,Unknown_0xC2B1
	inc a

Unknown_0xC2B1:
	ld e,$27
	ld [de],a
	pop bc
	ret
	ld e,$07
	ld h,$A0
	ld l,e
	ld a,[de]
	sub [hl]
	inc l
	inc e
	ld a,[de]
	sbc a,[hl]
	jr z,Unknown_0xC2C9
	jr c,Unknown_0xC2CC
	ld a,$02
	jr Unknown_0xC2CE

Unknown_0xC2C9:
	xor a
	jr Unknown_0xC2CE

Unknown_0xC2CC:
	ld a,$01

Unknown_0xC2CE:
	ld e,$27
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	push hl
	call Unknown_0x202B
	pop hl
	jr c,Unknown_0xC2EC
	ld a,l
	cpl
	add a,$01
	ld l,a
	ld a,h
	cpl
	adc a,$00
	ld h,a

Unknown_0xC2EC:
	ld e,$0F
	ld a,l
	ld [de],a
	ld a,h
	inc e
	ld [de],a
	ret

UnknownData_0xC2F4:
INCBIN "baserom.gb", $C2F4, $C36C - $C2F4
	ld bc,$4015
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	jp Unknown_0xC18C
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4015
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x19CB
	bit 5,a
	ret z
	ld hl,Unknown_0xCF04
	ld a,$1D
	call Unknown_0x05CF
	ret

UnknownData_0xC398:
INCBIN "baserom.gb", $C398, $C3B4 - $C398

Unknown_0xC3B4:
INCBIN "baserom.gb", $C3B4, $C471 - $C3B4

Unknown_0xC471:
INCBIN "baserom.gb", $C471, $C553 - $C471
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4

UnknownData_0xC55C:
INCBIN "baserom.gb", $C55C, $C577 - $C55C
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$27
	ld a,[hl]
	ld e,$46
	ld [de],a
	ret

UnknownData_0xC582:
INCBIN "baserom.gb", $C582, $C5E7 - $C582
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld a,[hli]
	ld [$DCFF],a
	ld a,[hl]
	ld [$DD00],a
	ld hl,Unknown_0xC3B4
	ld c,[hl]
	inc hl
	ld e,[hl]
	ld hl,$DB51
	ld a,c
	add a,[hl]
	ld c,a
	inc hl
	ld a,[hl]
	adc a,$00
	ld b,a
	ld hl,$DB53
	ld a,e
	add a,[hl]
	ld e,a
	inc hl
	ld a,[hl]
	adc a,$00
	ld d,a
	ld hl,$DCFF
	ld a,$02
	call Unknown_0x1597
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

Unknown_0xC61F:
INCBIN "baserom.gb", $C61F, $C74E - $C61F

Unknown_0xC74E:
INCBIN "baserom.gb", $C74E, $C7CF - $C74E
	ld a,$01
	ld [$A07E],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld a,[hli]
	ld [$DCFF],a
	ld a,[hli]
	ld [$DD00],a
	ld c,[hl]
	inc hl
	ld e,[hl]
	ld hl,$DB51
	ld a,c
	add a,[hl]
	ld c,a
	inc hl
	ld a,[hl]
	adc a,$00
	ld b,a
	ld hl,$DB53
	ld a,e
	add a,[hl]
	ld e,a
	inc hl
	ld a,[hl]
	adc a,$00
	ld d,a
	ld hl,$DCFF
	ld a,$02
	call Unknown_0x1597
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

UnknownData_0xC80A:
INCBIN "baserom.gb", $C80A, $C95A - $C80A
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4494
	jp Unknown_0x255B

UnknownData_0xC966:
INCBIN "baserom.gb", $C966, $C9A1 - $C966
	ld bc,$4398
	call Unknown_0x233C
	ret nc
	ld e,$03
	ld bc,$461F
	jp Unknown_0x0846
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$15
	ld e,l
	ld a,$2F
	sub [hl]
	ld [de],a
	ld l,$47
	ld e,l
	ld a,[hl]
	ld [de],a
	ret
	ld bc,$43A6
	call Unknown_0x233C
	ret nc
	ld e,$03
	ld bc,Unknown_0xC74E
	jp Unknown_0x0846
	ld e,$5B
	ld a,[de]
	or a
	jr nz,Unknown_0xC9E6
	ld bc,$4398
	call Unknown_0x233C
	jr nc,Unknown_0xC9F6
	ld e,$03
	ld bc,$461F
	jp Unknown_0x0846

Unknown_0xC9E6:
	ld bc,$43A6
	call Unknown_0x233C
	jr nc,Unknown_0xC9F6
	ld e,$03
	ld bc,Unknown_0xC74E
	jp Unknown_0x0846

Unknown_0xC9F6:
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xC9FF
	dec a
	ld [de],a
	ret

Unknown_0xC9FF:
	ld e,$3B
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld b,a
	ld a,h
	ld [de],a
	dec e
	ld a,l
	ld [de],a
	ld a,b
	add a,b
	ld hl,$446F
	add a,l
	ld l,a
	jr nc,Unknown_0xCA17
	inc h

Unknown_0xCA17:
	ld a,[$DB51]
	add a,[hl]
	ld c,a
	inc hl
	ld b,$00
	ld a,[$DB53]
	add a,[hl]
	ld e,a
	ld d,b
	ld a,$0D
	ld h,$A8
	ld l,$B2
	call Unknown_0x07C4
	ld a,h
	or a
	ret z
	ld a,[$FF00+$9A]
	ld d,a
	ld l,$48
	ld [hl],d
	ld l,$5B
	ld [hl],$01
	ld e,$26
	ld a,$60
	ld [de],a
	ret

UnknownData_0xCA41:
INCBIN "baserom.gb", $CA41, $CA44 - $CA41
	ld bc,$444F
	jp Unknown_0x255B
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xCA7A
	dec a
	ld [de],a
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$444F
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$03
	ld bc,$486B
	jp Unknown_0x0846

Unknown_0xCA7A:
	ld bc,$444F
	call Unknown_0x255B
	ret c
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$27
	ld a,[hl]
	cp $04
	jr z,Unknown_0xCA9B

Unknown_0xCA8C:
	ld e,$27
	ld [de],a
	ld h,d
	ld l,$1F
	ld [hl],$43
	inc l
	ld [hl],$4A
	inc l
	ld [hl],$52
	ret

Unknown_0xCA9B:
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$15
	ld a,[hl]
	cp $03
	jr z,Unknown_0xCAAA
	cp $04
	jr nz,Unknown_0xCA8C

Unknown_0xCAAA:
	ld e,$03
	ld bc,$486C
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$444F
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	ld l,$26
	dec [hl]
	jr z,Unknown_0xCAE2
	ld e,$3B
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	jp Unknown_0xCC59

Unknown_0xCAE2:
	ld e,$27
	ld a,[de]
	cp $04
	jr z,Unknown_0xCAF1
	ld e,$03
	ld bc,$4884
	jp Unknown_0x0846

Unknown_0xCAF1:
	ld e,$03
	ld bc,$488D
	jp Unknown_0x0846
	ld e,$5B
	ld a,[de]
	or a
	jr nz,Unknown_0xCB0F
	ld bc,$4398
	call Unknown_0x233C
	jr nc,Unknown_0xCB1F
	ld e,$03
	ld bc,Unknown_0xC61F
	jp Unknown_0x0846

Unknown_0xCB0F:
	ld bc,$43A6
	call Unknown_0x233C
	jr nc,Unknown_0xCB1F
	ld e,$03
	ld bc,$474E
	jp Unknown_0x0846

Unknown_0xCB1F:
	ld e,$40
	ld a,[de]
	cp $03
	ret z
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xCB2E
	dec a
	ld [de],a
	ret

Unknown_0xCB2E:
	ld e,$3B
	ld a,[de]
	inc e
	ld l,a
	ld a,[de]
	ld h,a
	ld e,$26
	ld a,$2C
	ld [de],a
	ld a,[$DB51]
	add a,[hl]
	ld c,a
	inc hl
	ld a,[$DB53]
	add a,[hl]
	ld e,a
	inc hl
	ld a,l
	ld b,h
	ld l,$3B
	ld h,d
	ld [hli],a
	ld [hl],b
	xor a
	ld b,a
	ld d,a
	ld a,$0D
	ld h,$A8
	ld l,$B2
	call Unknown_0x07C4
	ld a,[$FF00+$9A]
	ld d,a
	ld l,$48
	ld [hl],d
	ld l,$5B
	ld [hl],$02
	ld l,$40
	ld e,l
	ld a,[de]
	ld [hl],a
	inc a
	ld [de],a
	ret
	ld bc,$4494
	jp Unknown_0x255B
	ld bc,$43A6
	call Unknown_0x233C
	jr nc,Unknown_0xCB81
	ld e,$03
	ld bc,$474E
	jp Unknown_0x0846

Unknown_0xCB81:
	ld e,$40
	ld a,[de]
	cp $02
	ret z
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xCB90
	dec a
	ld [de],a
	ret

Unknown_0xCB90:
	ld e,$3B
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	cp $FF
	ret z
	ld b,a
	ld a,h
	ld [de],a
	dec e
	ld a,l
	ld [de],a
	ld a,b
	ld e,$3F
	ld [de],a
	ld a,$03
	ld e,$0D
	call Unknown_0x2319
	ld e,$26
	ld a,$18
	ld [de],a
	ret
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xCBBF
	dec a
	ld [de],a
	call Unknown_0x1EE6
	jr Unknown_0xCBC2

Unknown_0xCBBF:
	call Unknown_0x1ED3

Unknown_0xCBC2:
	call Unknown_0x0DA4
	ld bc,$4494
	jp Unknown_0x255B
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	ret z
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	call Unknown_0x0647
	and $07
	ld e,$27
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0xCBF2
	inc h

Unknown_0xCBF2:
	ld a,[hli]
	ld e,$39
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld e,$39
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	cp $FF
	jr nz,Unknown_0xCC10
	ld a,[hli]
	cpl
	inc a
	add a,l
	ld l,a
	ld a,$FF
	adc a,h
	ld h,a
	ld a,[hli]

Unknown_0xCC10:
	ld e,$27
	ld [de],a
	ld e,$39
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	xor a
	ld e,$26
	ld [de],a
	ret
	push bc
	call Unknown_0x0647
	ld c,$00

Unknown_0xCC25:
	sub $2B
	jr c,Unknown_0xCC2C
	inc c
	jr Unknown_0xCC25

Unknown_0xCC2C:
	ld hl,$445D
	ld a,c
	rlca
	add a,c
	add a,l
	ld l,a
	jr nc,Unknown_0xCC37
	inc h

Unknown_0xCC37:
	ld e,$3B
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	pop bc
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$26
	ld a,$03
	ld [de],a
	ld e,$27
	ld a,[de]
	cp $04
	jr nz,Unknown_0xCC59
	ld a,l
	add a,$0F
	ld l,a
	jr nc,Unknown_0xCC59
	inc h

Unknown_0xCC59:
	call Unknown_0x20BE
	call Unknown_0x20F9
	ld e,$3B
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld a,$A2
	ld e,$3B
	ld [de],a
	inc e
	ld a,$44
	ld [de],a
	xor a
	ld e,$40
	ld [de],a
	ret
	push bc
	call Unknown_0x0647
	ld c,$00

Unknown_0xCC7B:
	sub $34
	jr c,Unknown_0xCC82
	inc c
	jr Unknown_0xCC7B

Unknown_0xCC82:
	ld e,c
	pop bc
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,e
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0xCC91
	inc h

Unknown_0xCC91:
	ld e,$3B
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	xor a
	ld e,$26
	ld [de],a
	ld e,$40
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$3F
	ld a,[hl]
	ld hl,$44B2
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xCCB3
	inc h

Unknown_0xCCB3:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hli]
	ld [de],a
	ld e,$26
	ld a,[hli]
	ld [de],a
	ld e,$12
	ld a,[hl]
	ld [de],a
	ret
	ld hl,Unknown_0xC471
	ld e,$04
	ld a,[$DB51]
	add a,[hl]
	inc hl
	ld [de],a
	ld e,$07
	ld a,[$DB53]
	add a,[hl]
	ld [de],a
	ld e,$26
	ld a,$2A
	ld [de],a
	ld e,$45
	ld a,$C0
	ld [de],a
	ret
	push bc
	ld h,$A8
	ld c,$0A

Unknown_0xCCE9:
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0xCD02
	ld l,$48
	ld a,[hl]
	cp d
	jr nz,Unknown_0xCD02
	ld a,c
	ld [$FF00+$80],a
	call Unknown_0x0BBA
	ld a,[$FF00+$9A]
	ld d,a
	ld a,[$FF00+$80]
	ld c,a

Unknown_0xCD02:
	dec c
	jr z,Unknown_0xCD08
	inc h
	jr Unknown_0xCCE9

Unknown_0xCD08:
	pop bc
	ret
	xor a
	ld [$DD01],a
	ret
	ld hl,$DD01
	ld a,[hl]
	inc [hl]
	ld hl,$44C1
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xCD20
	inc h

Unknown_0xCD20:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hli]
	ld [de],a
	jp Unknown_0x20BE
	push bc
	call Unknown_0xCFB2
	ld e,$27
	ld [de],a
	pop bc
	ld e,$40
	ld l,a
	and $03
	jr z,Unknown_0xCD40
	dec a
	ld [de],a
	ret

Unknown_0xCD40:
	ld a,l
	rrca
	rrca
	inc a
	ld [de],a
	ret

Unknown_0xCD46:
INCBIN "baserom.gb", $CD46, $CD6F - $CD46
	call Unknown_0x0DA4
	ld b,d
	ld c,$62
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$4C
	xor a
	ld [de],a
	ld e,$03
	ld bc,$4966
	jp Unknown_0x0846
	push bc
	ld e,$63
	ld hl,Unknown_0xCD46
	ld c,$0D

Unknown_0xCD93:
	ld a,[hli]
	ld [de],a
	inc e
	dec c
	jr nz,Unknown_0xCD93
	pop bc
	ret

UnknownData_0xCD9B:
INCBIN "baserom.gb", $CD9B, $CDA9 - $CD9B
	ld e,$48
	ld a,[de]
	ld h,a
	jr Unknown_0xCDB5
	ld a,$A0
	ld h,a
	ld e,$48
	ld [de],a

Unknown_0xCDB5:
	ld e,$07
	ld l,e
	ld a,[de]
	sub [hl]
	ld [de],a
	inc l
	inc e
	ld a,[de]
	sbc a,[hl]
	ld [de],a
	ld e,$04
	ld l,e
	ld a,[de]
	sub [hl]
	ld [de],a
	inc l
	inc e
	ld a,[de]
	sbc a,[hl]
	ld [de],a
	rla
	ld a,$D6
	jr nc,Unknown_0xCDD2
	cpl
	inc a

Unknown_0xCDD2:
	ld e,$11
	ld [de],a
	ret
	call Unknown_0xCDFE
	ret nc
	ld e,$4A
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld a,[$A056]
	inc a
	ld h,a
	call Unknown_0x30E0
	ld hl,$A056
	inc [hl]
	ld hl,$A055
	dec [hl]
	ld h,d
	jp Unknown_0x0BBA
	call Unknown_0xCDFE
	ld e,$00
	jr nc,Unknown_0xCDFD
	inc e

Unknown_0xCDFD:
	ret

Unknown_0xCDFE:
	ld a,[$A081]
	dec a
	ld b,a
	add a,a
	inc a
	ld c,a
	ld e,$04
	ld a,[de]
	add a,b
	cp c
	ret c
	call Unknown_0x0C80
	ld h,d
	ld l,$07
	ld a,[$A080]
	cpl
	inc a
	add a,[hl]
	cpl
	inc a
	ld b,a
	ld c,$00
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld l,$0F
	ld [hl],c
	inc l
	ld [hl],b
	call Unknown_0x0DA4
	and a
	ret

UnknownData_0xCE33:
INCBIN "baserom.gb", $CE33, $CF04 - $CE33

Unknown_0xCF04:
INCBIN "baserom.gb", $CF04, $CF12 - $CF04
	call Unknown_0x0647
	and $03
	inc a
	ld e,a
	ld a,[$DD11]
	add a,e
	cp $05
	jr c,Unknown_0xCF23
	sub $05

Unknown_0xCF23:
	ld e,$27
	ld [de],a
	ld [$DD11],a
	ret

UnknownData_0xCF2A:
INCBIN "baserom.gb", $CF2A, $CF73 - $CF2A
	call Unknown_0x0DA4
	ld bc,$4FA4
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 3,a
	ret z
	ld e,$5C
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	call Unknown_0x1EC0
	cpl
	ld [de],a
	ld bc,Unknown_0xCFA1
	call Unknown_0x0FAF
	call Unknown_0x2871
	ld h,d
	jp Unknown_0x0BBA

Unknown_0xCFA1:
INCBIN "baserom.gb", $CFA1, $CFB2 - $CFA1

Unknown_0xCFB2:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F5
	ld [hli],a
	ld a,$0A
	ld [hli],a
	ld a,$F5
	ld [hli],a
	ld a,$0A
	ld [hli],a
	ld a,$0D
	ld [hli],a
	call Unknown_0xD180
	jr c,Unknown_0xCFDF
	ld hl,$FFAD
	set 2,[hl]
	ld h,d
	ld l,$04
	ld a,[hl]
	sub $04
	ld [hli],a
	jp nc,Unknown_0xD021
	dec [hl]
	jp Unknown_0xD021

Unknown_0xCFDF:
	call Unknown_0xD1F4
	jr c,Unknown_0xCFF7
	ld hl,$FFAD
	set 3,[hl]
	ld h,d
	ld l,$04
	ld a,[hl]
	add a,$04
	ld [hli],a
	jp nc,Unknown_0xD021
	inc [hl]
	jp Unknown_0xD021

Unknown_0xCFF7:
	call Unknown_0x1C0A
	jr nc,Unknown_0xD00D
	ld hl,$FFAD
	set 0,[hl]
	ld l,$07
	ld h,d
	ld a,[hl]
	sub $04
	ld [hli],a
	jr nc,Unknown_0xD021
	dec [hl]
	jr Unknown_0xD021

Unknown_0xD00D:
	call Unknown_0x1C88
	jr nc,Unknown_0xD021
	ld hl,$FFAD
	set 1,[hl]
	ld l,$07
	ld h,d
	ld a,[hl]
	add a,$04
	ld [hli],a
	jr nc,Unknown_0xD021
	inc [hl]

Unknown_0xD021:
	ld hl,$FFAD
	ld a,[hl]
	ret

Unknown_0xD026:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	call Unknown_0xD04E
	jr nc,Unknown_0xD042
	ld hl,$FFAD
	set 5,[hl]

Unknown_0xD042:
	call Unknown_0xD05C
	ld hl,$FFAD
	jr c,Unknown_0xD04C
	set 6,[hl]

Unknown_0xD04C:
	ld a,[hl]
	ret

Unknown_0xD04E:
	ld h,d
	ld l,$0E
	ld a,[$FF00+$AF]
	ld e,a
	rla
	sbc a,a
	ld d,a
	bit 7,[hl]
	jp Unknown_0x1D96

Unknown_0xD05C:
	ld h,d
	ld a,[$FF00+$AE]
	dec a
	ld e,a
	rla
	sbc a,a
	ld d,a
	ld b,$00
	ld c,b
	call Unknown_0x1AD9
	call Unknown_0x18D7
	jr c,Unknown_0xD0B5
	bit 3,c
	jr z,Unknown_0xD090
	ld a,[$FF00+$B1]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x18D7
	jr nc,Unknown_0xD0AB
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xD0B5
	ld a,[$FF00+$B1]
	cpl
	scf
	adc a,l
	jr Unknown_0xD0B5

Unknown_0xD090:
	ld a,[$FF00+$B0]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,bc
	ld b,h
	ld c,l
	call Unknown_0x18D7
	jr nc,Unknown_0xD0AB
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xD0B5
	ld a,[$FF00+$B0]
	add a,l
	jr Unknown_0xD0B5

Unknown_0xD0AB:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,$00
	ld [de],a
	scf
	ret

Unknown_0xD0B5:
	dec a
	ld l,a
	rlca
	sbc a,a
	ld b,a
	ld a,[$FF00+$9A]
	ld h,a
	ld a,l
	ld l,$06
	ld [hl],$00
	inc l
	add a,[hl]
	ld [hli],a
	ld a,b
	adc a,[hl]
	ld [hl],a
	ld a,[$FF00+$9E]
	ld l,$4D
	ld [hl],a
	ld d,h
	and a
	ret

Unknown_0xD0D0:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	call Unknown_0xD251
	jr nc,Unknown_0xD0EC
	ld hl,$FFAD
	set 7,[hl]

Unknown_0xD0EC:
	call Unknown_0xD180
	ld hl,$FFAD
	jr c,Unknown_0xD0F6
	set 5,[hl]

Unknown_0xD0F6:
	ld a,[hl]
	ret

Unknown_0xD0F8:
	xor a
	ld [$FF00+$AD],a
	ld hl,$FFAE
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	ld a,$F9
	ld [hli],a
	ld a,$06
	ld [hli],a
	call Unknown_0xD251
	jr nc,Unknown_0xD114
	ld hl,$FFAD
	set 7,[hl]

Unknown_0xD114:
	call Unknown_0xD1F4
	ld hl,$FFAD
	jr c,Unknown_0xD11E
	set 5,[hl]

Unknown_0xD11E:
	ld a,[hl]
	ret

Unknown_0xD120:
	ld h,d
	ld bc,$0007
	ld de,$FFF9
	call Unknown_0x1AD9
	call Unknown_0x17A3
	jr nc,Unknown_0xD132
	rla
	jr c,Unknown_0xD176

Unknown_0xD132:
	ld a,[$FF00+$9A]
	ld h,a
	ld bc,$0007
	ld de,$0006
	call Unknown_0x1AD9
	call Unknown_0x17A3
	jr nc,Unknown_0xD146
	rla
	jr c,Unknown_0xD176

Unknown_0xD146:
	ld a,[$FF00+$9A]
	ld h,a
	ld bc,$FFF8
	ld de,$FFF9
	call Unknown_0x1AD9
	call Unknown_0x16EF
	jr nc,Unknown_0xD15B
	dec a
	rla
	jr nc,Unknown_0xD176

Unknown_0xD15B:
	ld a,[$FF00+$9A]
	ld h,a
	ld bc,$0005
	ld de,$0006
	call Unknown_0x1AD9
	call Unknown_0x16EF
	jr nc,Unknown_0xD170
	dec a
	rla
	jr nc,Unknown_0xD176

Unknown_0xD170:
	ld a,[$FF00+$9A]
	ld d,a

Unknown_0xD173:
	ld a,$00
	ret

Unknown_0xD176:
	ld a,[$FF00+$9A]
	ld d,a
	ld a,[$FF00+$9E]
	cp $01
	ret z
	jr Unknown_0xD173

Unknown_0xD180:
	ld h,d
	ld a,[$FF00+$B0]
	dec a
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld d,$00
	ld e,d
	call Unknown_0x1AD9
	call Unknown_0x1716
	jr c,Unknown_0xD1D9
	bit 3,e
	jr z,Unknown_0xD1B4
	ld a,[$FF00+$AF]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x1716
	jr nc,Unknown_0xD1CF
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xD1D9
	ld a,[$FF00+$AF]
	cpl
	scf
	adc a,l
	jr Unknown_0xD1D9

Unknown_0xD1B4:
	ld a,[$FF00+$AE]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x1716
	jr nc,Unknown_0xD1CF
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xD1D9
	ld a,[$FF00+$AE]
	add a,l
	jr Unknown_0xD1D9

Unknown_0xD1CF:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,$00
	ld [de],a
	scf
	ret

Unknown_0xD1D9:
	dec a

Unknown_0xD1DA:
	ld l,a
	rlca
	sbc a,a
	ld b,a
	ld a,[$FF00+$9A]
	ld h,a
	ld a,l
	ld l,$03
	ld [hl],$00
	inc l
	add a,[hl]
	ld [hli],a
	ld a,b
	adc a,[hl]
	ld [hl],a
	ld a,[$FF00+$9E]
	ld l,$4D
	ld [hl],a
	ld d,h
	and a
	ret

Unknown_0xD1F4:
	ld h,d
	ld a,[$FF00+$B1]
	inc a
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld d,$00
	ld e,d
	call Unknown_0x1AD9
	call Unknown_0x17C7
	jr c,Unknown_0xD24D
	bit 3,e
	jr z,Unknown_0xD226
	ld a,[$FF00+$AF]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x17C7
	jr nc,Unknown_0xD243
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xD24D
	ld a,[$FF00+$AF]
	add a,l
	jr Unknown_0xD24D

Unknown_0xD226:
	ld a,[$FF00+$AE]
	ld l,a
	rla
	sbc a,a
	ld h,a
	add hl,de
	ld d,h
	ld e,l
	call Unknown_0x17C7
	jr nc,Unknown_0xD243
	ld l,a
	ld a,[$FF00+$9E]
	cp $04
	ld a,l
	jr c,Unknown_0xD24D
	ld a,[$FF00+$AE]
	cpl
	scf
	adc a,l
	jr Unknown_0xD24D

Unknown_0xD243:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$4D
	ld a,$00
	ld [de],a
	scf
	ret

Unknown_0xD24D:
	inc a
	jp Unknown_0xD1DA

Unknown_0xD251:
	ld h,d
	ld l,$10
	ld c,$00
	ld b,c
	bit 7,[hl]
	jr nz,Unknown_0xD272
	ld a,[$FF00+$AF]
	ld e,a
	rla
	sbc a,a
	ld d,a
	call Unknown_0x1AD9
	call Unknown_0x184E
	jp nc,Unknown_0x1E6D
	ld l,a
	rlca
	jp c,Unknown_0xD28A
	jp Unknown_0x1E6D

Unknown_0xD272:
	ld a,[$FF00+$AE]
	ld e,a
	rla
	sbc a,a
	ld d,a
	call Unknown_0x1AD9
	call Unknown_0x18D7
	jp nc,Unknown_0x1E6D
	ld l,a
	dec a
	rlca
	jp nc,Unknown_0xD2AC
	jp Unknown_0x1E6D

Unknown_0xD28A:
	ld c,l
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$06
	ld b,[hl]
	ld l,$0F
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$FF
	add a,c
	jp nc,Unknown_0x1E6D
	ld l,$06
	ld [hl],$80
	inc l
	ld a,c
	add a,[hl]
	ld [hli],a
	ld a,$FF
	adc a,[hl]
	ld [hl],a
	ld d,h
	scf
	ret

Unknown_0xD2AC:
	ld c,l
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$06
	ld b,[hl]
	ld l,$0F
	ld a,[hli]
	scf
	sbc a,b
	ld a,[hl]
	sbc a,$00
	add a,c
	jp c,Unknown_0x1E6D
	ld l,$06
	ld [hl],$80
	inc l
	ld a,c
	add a,[hl]
	ld [hli],a
	ld a,$00
	adc a,[hl]
	ld [hl],a
	ld d,h
	scf
	ret
	push bc
	ld a,[$DB3E]
	ld b,a
	ld a,[$DB3D]
	jr Unknown_0xD2D9

Unknown_0xD2D8:
	add a,a

Unknown_0xD2D9:
	dec b
	jr nz,Unknown_0xD2D8
	ld [$FF00+$80],a
	ld d,$C9
	ld hl,$B300
	ld b,$00

Unknown_0xD2E5:
	ld e,[hl]
	ld a,[de]
	cp $40
	jr z,Unknown_0xD2EF
	cp $98
	jr nz,Unknown_0xD334

Unknown_0xD2EF:
	inc e
	ld a,e
	ld [hl],a
	ld [$FF00+$81],a
	push hl
	push de
	push bc
	ld a,[de]
	cp $10
	jr z,Unknown_0xD30A
	cp $18
	jr z,Unknown_0xD30A
	cp $90
	jr z,Unknown_0xD30A
	ld e,l
	swap l
	ld c,l
	jr Unknown_0xD320

Unknown_0xD30A:
	ld e,l
	swap l
	ld c,l
	ld a,[$DB3D]
	ld b,a
	ld a,h
	ld d,$FF
	sub $B3

Unknown_0xD317:
	inc d
	sub b
	jr nc,Unknown_0xD317
	add a,b
	ld b,a
	call Unknown_0x3BFB

Unknown_0xD320:
	ld a,[$FF00+$81]
	ld [$FF00+$84],a
	call Unknown_0x15B0
	ld e,$24
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	pop bc
	pop de
	pop hl

Unknown_0xD334:
	inc l
	dec b
	jr nz,Unknown_0xD2E5
	inc h
	ld a,[$FF00+$80]
	dec a
	ld [$FF00+$80],a
	jr nz,Unknown_0xD2E5
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0xD345:
INCBIN "baserom.gb", $D345, $D373 - $D345

Unknown_0xD373:
INCBIN "baserom.gb", $D373, $D483 - $D373
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5345
	jp Unknown_0x255B

UnknownData_0xD48F:
INCBIN "baserom.gb", $D48F, $D497 - $D48F

Unknown_0xD497:
INCBIN "baserom.gb", $D497, $D4A1 - $D497
	ld bc,$5345
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld e,$04
	ld b,$48
	call Unknown_0x1F9C
	ret nc
	ld e,$07
	ld b,$48
	call Unknown_0x1F9C
	ret nc
	ld e,$03
	ld bc,Unknown_0xD4F1
	jp Unknown_0x0846

UnknownData_0xD4C3:
INCBIN "baserom.gb", $D4C3, $D4D3 - $D4C3
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5345
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xD497
	jp Unknown_0x0846

Unknown_0xD4F1:
INCBIN "baserom.gb", $D4F1, $D520 - $D4F1
	call Unknown_0x1ED3
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$5345
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret

UnknownData_0xD534:
INCBIN "baserom.gb", $D534, $D595 - $D534

Unknown_0xD595:
INCBIN "baserom.gb", $D595, $D5B1 - $D595
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc hl
	ld a,[de]
	sbc a,[hl]
	ret nc
	ld a,c
	cp $F8
	ret nc
	ld e,$03
	ld bc,Unknown_0xD595
	jp Unknown_0x0846

UnknownData_0xD5CA:
INCBIN "baserom.gb", $D5CA, $D615 - $D5CA

Unknown_0xD615:
INCBIN "baserom.gb", $D615, $D621 - $D615

Unknown_0xD621:
INCBIN "baserom.gb", $D621, $D62B - $D621
	call Unknown_0x0DA4
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	jr nz,Unknown_0xD64A
	ld e,$03
	ld bc,Unknown_0xD615
	jp Unknown_0x0846

Unknown_0xD64A:
	call Unknown_0xD656
	ld e,$4D
	ld a,[de]
	cp $04
	ret c
	jp Unknown_0x1EF9

Unknown_0xD656:
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 4,a
	ret z
	jp Unknown_0x1EF9
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xD621
	jp Unknown_0x0846

UnknownData_0xD688:
INCBIN "baserom.gb", $D688, $D6AB - $D688
	ld e,$5C
	ld a,[de]
	ld hl,Unknown_0xD373
	or a
	jr z,Unknown_0xD6B5
	inc hl

Unknown_0xD6B5:
	ld e,$26
	ld a,[hli]
	ld [de],a
	ld e,$3B
	ld [de],a
	inc e
	inc hl
	ld a,[hli]
	ld [de],a
	inc e
	inc hl
	ld a,[hli]
	ld [de],a
	inc e
	inc hl
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0xD6C9:
INCBIN "baserom.gb", $D6C9, $D6E2 - $D6C9
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	add a,e
	ld hl,$537F
	add a,l
	ld l,a
	jr nc,Unknown_0xD6F0
	inc h

Unknown_0xD6F0:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	ld a,[hli]
	inc e
	ld [de],a
	ld a,[hl]
	ld e,$26
	ld [de],a
	ret
	call Unknown_0x0DA4
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	jr nz,Unknown_0xD71B
	ld e,$03
	ld bc,Unknown_0xD615
	jp Unknown_0x0846

Unknown_0xD71B:
	call Unknown_0xD656
	call Unknown_0x2235
	ld h,d
	ld l,$40
	cp [hl]
	jr z,Unknown_0xD72E
	ld [hl],a
	ld hl,$536B
	call Unknown_0x23CA

Unknown_0xD72E:
	ld l,$26
	ld h,d
	dec [hl]
	ret nz
	ld e,$3B
	ld a,[de]
	ld [hl],a
	ld e,$07
	ld h,$A0
	ld l,e
	ld a,[de]
	sub [hl]
	ld c,a
	inc l
	inc e
	ld a,[de]
	sbc a,[hl]
	ld e,$3C
	jr c,Unknown_0xD74B
	ld a,[de]
	cp c
	jr c,Unknown_0xD74C

Unknown_0xD74B:
	inc e

Unknown_0xD74C:
	inc e
	ld a,[de]
	ld b,a
	call Unknown_0x0647
	cp b
	ret nc
	ld e,$03
	ld bc,$56C9
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	ld h,d
	bit 5,a
	jr nz,Unknown_0xD78F
	bit 6,a
	jr nz,Unknown_0xD77E
	ld l,$26
	dec [hl]
	ret nz
	jr Unknown_0xD783

Unknown_0xD77E:
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a

Unknown_0xD783:
	ld h,d
	ld l,$1F
	ld [hl],$43
	inc l
	ld [hl],$57
	inc l
	ld [hl],$D6
	ret

Unknown_0xD78F:
	ld l,$0D
	xor a
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld h,d
	ld l,$1F
	ld [hl],$43
	inc l
	ld [hl],$57
	inc l
	ld [hl],$A2
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$03
	ld bc,$5688
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	ld b,a
	ld h,d
	bit 5,b
	jr z,Unknown_0xD7FE
	ld l,$0D
	xor a
	ld [hli],a
	ld [hli],a
	inc l
	bit 7,[hl]
	jr z,Unknown_0xD7FE
	ld [hld],a
	ld [hl],a

Unknown_0xD7FE:
	bit 7,b
	ret z
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$03
	ld bc,$5688
	jp Unknown_0x0846

UnknownData_0xD81C:
INCBIN "baserom.gb", $D81C, $D854 - $D81C

Unknown_0xD854:
INCBIN "baserom.gb", $D854, $D86C - $D854

Unknown_0xD86C:
INCBIN "baserom.gb", $D86C, $D8E4 - $D86C
	ld bc,$538D
	call Unknown_0x255B
	ret c
	call Unknown_0x19CB
	bit 7,a
	ret nz
	ld e,$03
	ld bc,$5848
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$538D
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0xDA2D
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xD854
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$538D
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0xDA2D
	call Unknown_0x19CB
	bit 7,a
	jr z,Unknown_0xD94C
	bit 5,a
	jr z,Unknown_0xD93E
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a

Unknown_0xD93E:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	ret nz
	ld e,$03
	ld bc,Unknown_0xD86C
	jp Unknown_0x0846

Unknown_0xD94C:
	ld e,$03
	ld bc,$5848
	jp Unknown_0x0846
	ld bc,$538D
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0xDA2D
	call Unknown_0x19CB
	bit 7,a
	jr nz,Unknown_0xD979
	ld hl,$53B5
	call Unknown_0x2048
	ld h,d
	ld l,$1F
	ld [hl],$43
	inc l
	ld [hl],$59
	inc l
	ld [hl],$99

Unknown_0xD979:
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xD982
	dec a
	ld [de],a
	ret

Unknown_0xD982:
	ld a,$06
	ld [de],a
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld b,a
	ld a,h
	ld [de],a
	dec e
	ld a,l
	ld [de],a
	ld a,b
	ld e,$31
	jp Unknown_0x230F

UnknownData_0xD999:
INCBIN "baserom.gb", $D999, $D9C2 - $D999
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$539B
	jp Unknown_0x255B
	push bc
	call Unknown_0xD120
	or a
	jr z,Unknown_0xD9E2
	call Unknown_0x0647
	cp $80
	jr nc,Unknown_0xD9E2
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a

Unknown_0xD9E2:
	pop bc
	ret
	ld a,[bc]
	inc bc
	push bc
	ld b,a
	ld e,$04
	call Unknown_0x1F9C
	jr c,Unknown_0xD9F4
	pop bc
	inc bc
	xor a
	jr Unknown_0xDA06

Unknown_0xD9F4:
	pop bc
	ld a,[bc]
	inc bc
	push bc
	ld b,a
	ld e,$07
	call Unknown_0x1F9C
	jr nc,Unknown_0xDA04
	ld a,$01
	jr Unknown_0xDA05

Unknown_0xDA04:
	xor a

Unknown_0xDA05:
	pop bc

Unknown_0xDA06:
	ld e,$27
	ld [de],a
	ret
	ld e,$3D
	ld hl,$53C1
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5B
	ld a,[de]
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xDA27
	inc h

Unknown_0xDA27:
	call Unknown_0x20F9
	jp Unknown_0x20BE

Unknown_0xDA2D:
	ld e,$F8
	call Unknown_0x1AC1
	ret nz
	ld e,$03
	ld bc,$5A3B
	jp Unknown_0x0846

UnknownData_0xDA3B:
INCBIN "baserom.gb", $DA3B, $DBF7 - $DA3B

Unknown_0xDBF7:
INCBIN "baserom.gb", $DBF7, $DC2A - $DBF7

Unknown_0xDC2A:
INCBIN "baserom.gb", $DC2A, $DC90 - $DC2A

Unknown_0xDC90:
INCBIN "baserom.gb", $DC90, $DCAF - $DC90
	ld e,$3F
	ld a,[de]
	dec a
	jr nz,Unknown_0xDCB8
	call Unknown_0x1EE6

Unknown_0xDCB8:
	call Unknown_0x0DA4
	ld bc,$5B84
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x19CB
	or a
	jr z,Unknown_0xDD1E
	bit 5,a
	jr nz,Unknown_0xDCED
	ld e,$4D
	ld a,[de]
	cp $04
	jr c,Unknown_0xDD09
	ld l,$45
	ld h,d
	bit 7,[hl]
	jr nz,Unknown_0xDCE9
	cp $04
	jr z,Unknown_0xDCED

Unknown_0xDCE1:
	ld e,$03
	ld bc,$5C49
	jp Unknown_0x0846

Unknown_0xDCE9:
	cp $04
	jr z,Unknown_0xDCE1

Unknown_0xDCED:
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	call Unknown_0x0DA4

Unknown_0xDD09:
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld e,$3F
	ld a,[de]
	inc a
	cp $03
	jr c,Unknown_0xDD17
	xor a

Unknown_0xDD17:
	ld [de],a
	ld hl,$5B98
	jp Unknown_0xDEBC

Unknown_0xDD1E:
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$03
	ld bc,$5C1E
	jp Unknown_0x0846
	ld bc,$5B84
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5B84
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0xDD58
	bit 5,a
	ret z
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0xDD58:
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xDC2A
	jp Unknown_0x0846
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xDD71
	dec a
	ld [de],a
	call Unknown_0x21C5

Unknown_0xDD71:
	call Unknown_0x0DA4
	ld bc,$5B84
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x19CB
	bit 7,a
	jr z,Unknown_0xDD9B
	ld e,$4D
	ld a,[de]
	cp $01
	ret nz
	ld e,$40
	xor a
	ld [de],a
	ld h,d
	ld l,$1F
	ld [hl],$43
	inc l
	ld [hl],$5D
	inc l
	ld [hl],$A3
	ret

Unknown_0xDD9B:
	ld e,$03
	ld bc,$5C97
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$5B84
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x19CB
	bit 7,a
	jr z,Unknown_0xDE06
	bit 5,a
	jr z,Unknown_0xDDC9

Unknown_0xDDBB:
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$03
	ld bc,$5BF7
	jp Unknown_0x0846

Unknown_0xDDC9:
	ld e,$45
	ld a,[de]
	rlca
	ld e,$4D
	ld a,[de]
	jr c,Unknown_0xDDE2
	cp $04
	jr z,Unknown_0xDDBB
	cp $05
	jr nz,Unknown_0xDDF2
	ld e,$03
	ld bc,$5C49
	jp Unknown_0x0846

Unknown_0xDDE2:
	cp $05
	jr z,Unknown_0xDDBB
	cp $04
	jr nz,Unknown_0xDDF2
	ld e,$03
	ld bc,$5C49
	jp Unknown_0x0846

Unknown_0xDDF2:
	ld e,$15
	ld a,[de]
	cp $02
	ret nz
	ld e,$3E
	ld a,[de]
	ld e,$11
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xDC90
	jp Unknown_0x0846

Unknown_0xDE06:
	ld e,$03
	ld bc,$5C97
	jp Unknown_0x0846

UnknownData_0xDE0E:
INCBIN "baserom.gb", $DE0E, $DE4B - $DE0E
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0xDE5A
	ld e,$03
	ld bc,Unknown_0xDBF7
	jp Unknown_0x0846

Unknown_0xDE5A:
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$5B84
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x19CB
	bit 7,a
	jr z,Unknown_0xDEAA
	bit 5,a
	jr z,Unknown_0xDE83

Unknown_0xDE75:
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$03
	ld bc,$5BF7
	jp Unknown_0x0846

Unknown_0xDE83:
	ld e,$45
	ld a,[de]
	rlca
	ld e,$4D
	ld a,[de]
	jr c,Unknown_0xDE9B
	cp $04
	jr z,Unknown_0xDE75
	cp $05
	ret nz
	ld e,$03
	ld bc,$5C49
	jp Unknown_0x0846

Unknown_0xDE9B:
	cp $05
	jr z,Unknown_0xDE75
	cp $04
	ret nz
	ld e,$03
	ld bc,$5C49
	jp Unknown_0x0846

Unknown_0xDEAA:
	ld e,$03
	ld bc,$5C97
	jp Unknown_0x0846
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$3F
	xor a
	ld [de],a

Unknown_0xDEBC:
	ld e,$5C
	ld a,[de]
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xDEC8
	inc h

Unknown_0xDEC8:
	call Unknown_0x2123
	call Unknown_0x20F9
	ld e,$3F
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0xDED6
	inc h

Unknown_0xDED6:
	ld e,$26
	ld a,[hl]
	ld [de],a
	ret
	ld e,$45
	ld a,[de]
	rlca
	ld e,$4D
	ld a,[de]
	jr c,Unknown_0xDEE9
	cp $04
	ret nz
	jr Unknown_0xDEEC

Unknown_0xDEE9:
	cp $05
	ret nz

Unknown_0xDEEC:
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xDF05
	inc h

Unknown_0xDF05:
	ld e,$26
	ld a,[hli]
	ld [de],a
	call Unknown_0x21A5
	ld e,$45
	ld a,[de]
	rlca
	ld e,$3E
	ld a,[hl]
	jr c,Unknown_0xDF17
	ld [de],a
	ret

Unknown_0xDF17:
	cpl
	inc a
	ld [de],a
	ret

UnknownData_0xDF1B:
INCBIN "baserom.gb", $DF1B, $DF88 - $DF1B

Unknown_0xDF88:
INCBIN "baserom.gb", $DF88, $DF9F - $DF88

Unknown_0xDF9F:
INCBIN "baserom.gb", $DF9F, $E031 - $DF9F
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5BAE
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xDF88
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$5BAE
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	jp z,Unknown_0xE0E4
	bit 5,a
	jr nz,Unknown_0xE07D
	bit 4,a
	jr nz,Unknown_0xE07D
	ld e,$4D
	ld a,[de]
	cp $04
	jr z,Unknown_0xE07D
	cp $05
	jr nz,Unknown_0xE099

Unknown_0xE07D:
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ld e,$3C
	ld a,[de]
	and $F0
	swap a
	dec e
	ld [de],a
	ld e,$40
	ld a,[de]
	xor $80
	ld [de],a

Unknown_0xE099:
	ld e,$26
	ld a,[de]
	or a
	ret z
	xor a
	ld [de],a
	ld h,d
	ld l,$3D
	dec [hl]
	jr nz,Unknown_0xE0C8
	ld e,$3E
	ld a,[de]
	ld [hl],a
	ld l,$40
	bit 0,[hl]
	jr nz,Unknown_0xE0BE
	call Unknown_0x0647
	ld l,$3F
	ld h,d
	cp [hl]
	inc l
	jr c,Unknown_0xE0BE
	set 0,[hl]
	jr Unknown_0xE0C8

Unknown_0xE0BE:
	res 0,[hl]
	ld e,$03
	ld bc,Unknown_0xDF9F
	jp Unknown_0x0846

Unknown_0xE0C8:
	ld l,$3B
	dec [hl]
	ret nz
	ld e,$3C
	ld a,[de]
	and $0F
	ld [hl],a
	call Unknown_0x1EC0
	ld l,$40
	ld h,d
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0xE0E1
	res 7,[hl]
	ret

Unknown_0xE0E1:
	set 7,[hl]
	ret

Unknown_0xE0E4:
	ld e,$03
	ld bc,$5F7C
	jp Unknown_0x0846
	ld bc,$5BAE
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19CB
	or a
	ret nz
	ld e,$03
	ld bc,$5F7C
	jp Unknown_0x0846
	call Unknown_0x1ED3
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0xE126
	call Unknown_0x0DA4
	ld bc,$5BAE
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 6,a
	ret z

Unknown_0xE126:
	ld e,$03
	ld bc,$5FD9
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5BAE
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$03
	ld bc,$5F28
	jp Unknown_0x0846
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0xE181
	dec a
	ld [de],a
	jr nz,Unknown_0xE19E
	ld e,$40
	ld a,[de]
	cp $02
	ld h,d
	jp z,Unknown_0x0BBA
	inc a
	ld [de],a
	ld hl,$5BDC
	ld b,a
	rlca
	add a,b
	add a,l
	ld l,a
	jr nc,Unknown_0xE17C
	inc h

Unknown_0xE17C:
	call Unknown_0x2164
	jr Unknown_0xE19E

Unknown_0xE181:
	call Unknown_0x1EE6
	ld e,$3B
	ld h,d
	ld l,$0D
	ld a,[de]
	cp [hl]
	jr nz,Unknown_0xE19E
	inc e
	inc l
	ld a,[de]
	cp [hl]
	jr nz,Unknown_0xE19E
	ld e,$40
	ld a,[de]
	ld e,$3D
	add a,e
	ld e,a
	ld a,[de]
	ld e,$26
	ld [de],a

Unknown_0xE19E:
	call Unknown_0x0DA4
	ld bc,$5BBC
	jp Unknown_0x255B
	call Unknown_0x1EE6
	ld e,$3B
	ld h,d
	ld l,$0D
	ld a,[de]
	cp [hl]
	jr nz,Unknown_0xE1BD
	inc e
	inc l
	ld a,[de]
	cp [hl]
	jr nz,Unknown_0xE1BD
	ld e,$11
	xor a
	ld [de],a

Unknown_0xE1BD:
	call Unknown_0x0DA4
	ld bc,$5BBC
	jp Unknown_0x255B
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld e,$5B
	ld a,[de]
	rlca
	ld e,a
	rlca
	add a,e
	ld b,a
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	add a,e
	add a,b
	add a,l
	ld l,a
	jr nc,Unknown_0xE1E1
	inc h

Unknown_0xE1E1:
	ld e,$3C
	ld a,[hli]
	ld [de],a
	dec e
	and $0F
	ld [de],a
	ld e,$3D
	ld a,[hli]
	ld [de],a
	inc e
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	inc e
	ld l,$45
	ld h,d
	ld a,[hl]
	and $80
	ld [de],a
	xor a
	ld e,$26
	ld [de],a
	pop bc
	ret
	ld h,d
	ld l,$26
	ld [hl],$01
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$40
	ld a,[de]
	rlca
	jr c,Unknown_0xE21A
	ld e,$0D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

Unknown_0xE21A:
	ld e,$0D
	ld a,l
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,h
	cpl
	adc a,$00
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	ld a,[hl]
	ld e,l
	ld [de],a
	ld l,$27
	ld a,[hl]
	ld h,d
	ld [hl],a
	ld l,$3D
	ld a,$20
	ld [hli],a
	ld a,$08
	ld [hli],a
	ld a,$26
	ld [hli],a
	xor a
	ld [hl],a
	ret

UnknownData_0xE244:
INCBIN "baserom.gb", $E244, $E26B - $E244

Unknown_0xE26B:
INCBIN "baserom.gb", $E26B, $E29E - $E26B

Unknown_0xE29E:
INCBIN "baserom.gb", $E29E, $E2A8 - $E29E

Unknown_0xE2A8:
INCBIN "baserom.gb", $E2A8, $E2D8 - $E2A8

Unknown_0xE2D8:
INCBIN "baserom.gb", $E2D8, $E366 - $E2D8

Unknown_0xE366:
INCBIN "baserom.gb", $E366, $E370 - $E366

Unknown_0xE370:
INCBIN "baserom.gb", $E370, $E3FB - $E370
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6244
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xE366
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6244
	call Unknown_0x255B
	ret c
	call Unknown_0xE485
	call Unknown_0x2375
	call Unknown_0x1A25
	ld h,d
	bit 5,a
	jr nz,Unknown_0xE453
	bit 6,a
	jr nz,Unknown_0xE442
	bit 7,a
	jr nz,Unknown_0xE456
	ret

Unknown_0xE442:
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ld h,d
	ld l,$1F
	ld [hl],$43
	inc l
	ld [hl],$63
	inc l
	ld [hl],$FB
	ret

Unknown_0xE453:
	jp Unknown_0x1EF9

Unknown_0xE456:
	ld h,d
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0xE473
	ld e,$3F
	ld a,[de]
	inc a
	ld [de],a
	cp $0C
	jr z,Unknown_0xE47D
	rra
	jr c,Unknown_0xE473
	rra
	jr c,Unknown_0xE473
	call Unknown_0x0647
	cp $80
	jr c,Unknown_0xE47D

Unknown_0xE473:
	ld e,$3D
	ld l,$0F
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hl],a
	ret

Unknown_0xE47D:
	ld e,$03
	ld bc,Unknown_0xE370
	jp Unknown_0x0846

Unknown_0xE485:
	ld e,$10
	ld a,[de]
	ld e,$15
	and $80
	jr nz,Unknown_0xE499
	ld e,$0F
	ld a,[de]
	sub $3C
	ret nc
	xor a
	ld e,$15
	ld [de],a
	ret

Unknown_0xE499:
	ld e,$0F
	ld a,[de]
	sub $C4
	ret nc
	ld a,$01
	ld e,$15
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6244
	call Unknown_0x255B
	ret c
	ld e,$10
	ld a,[de]
	and a
	ret nz
	ld e,$03
	ld bc,$6381
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$6244
	call Unknown_0x255B
	ret
	ld e,$3F
	ld a,[de]
	ld b,a
	ld e,$5C
	ld a,[de]
	ld hl,Unknown_0xE26B
	add a,l
	ld a,[hl]
	cp b
	jr nz,Unknown_0xE51F
	xor a
	ld e,$3F
	ld [de],a
	ld e,$40
	ld a,[de]
	res 0,a
	res 4,a
	ld b,a
	call Unknown_0x1EC0
	ld e,$45
	ld a,[de]
	bit 7,a
	jr z,Unknown_0xE4F8
	bit 3,b
	jr nz,Unknown_0xE4F4
	set 0,b

Unknown_0xE4F4:
	set 3,b
	jr Unknown_0xE500

Unknown_0xE4F8:
	bit 3,b
	jr z,Unknown_0xE4FE
	set 0,b

Unknown_0xE4FE:
	res 3,b

Unknown_0xE500:
	call Unknown_0x201D
	ld e,$27
	ld a,[de]
	and a
	jr z,Unknown_0xE513
	bit 7,b
	jr nz,Unknown_0xE50F
	set 4,b

Unknown_0xE50F:
	set 7,b
	jr Unknown_0xE51B

Unknown_0xE513:
	bit 7,b
	jr z,Unknown_0xE519
	set 4,b

Unknown_0xE519:
	res 7,b

Unknown_0xE51B:
	ld e,$40
	ld a,b
	ld [de],a

Unknown_0xE51F:
	ld e,$40
	ld a,[de]
	bit 3,a
	jr nz,Unknown_0xE53A
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0xE530
	ld e,$00

Unknown_0xE530:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CB4
	jr Unknown_0xE54C

Unknown_0xE53A:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0xE544
	ld e,$00

Unknown_0xE544:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CE5

Unknown_0xE54C:
	ld e,$40
	ld a,[de]
	bit 7,a
	jr z,Unknown_0xE567
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0xE55D
	ld e,$00

Unknown_0xE55D:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	jr Unknown_0xE579

Unknown_0xE567:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0xE571
	ld e,$00

Unknown_0xE571:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D66

Unknown_0xE579:
	call Unknown_0x0DA4
	ld bc,$6244
	call Unknown_0x255B
	ret c
	ld e,$3F
	ld a,[de]
	inc a
	ld [de],a
	ret

UnknownData_0xE589:
INCBIN "baserom.gb", $E589, $E643 - $E589

Unknown_0xE643:
INCBIN "baserom.gb", $E643, $E677 - $E643
	ld e,$11
	ld a,[de]
	call Unknown_0x0C83
	ld e,$12
	ld a,[de]
	call Unknown_0x0C94
	call Unknown_0x0DA4
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0xE7F6
	bit 7,a
	jr nz,Unknown_0xE6B3
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$4C
	ld a,[hl]
	and a
	jr z,Unknown_0xE6C5
	ld l,e
	ld a,[hl]
	cp $FF
	jr z,Unknown_0xE6C5
	ld l,$4C
	ld a,[hl]
	and a
	jr z,Unknown_0xE6C5
	ret

Unknown_0xE6B3:
	ld e,$25
	ld a,$01
	ld [de],a
	ld e,$40
	ld a,$01
	ld [de],a
	ld e,$03
	ld bc,$65F5
	jp Unknown_0x0846

Unknown_0xE6C5:
	ld e,$25
	xor a
	ld [de],a
	call Unknown_0xE7BE
	ret

UnknownData_0xE6CD:
INCBIN "baserom.gb", $E6CD, $E6E7 - $E6CD
	ld e,$11
	ld a,[de]
	call Unknown_0x0C83
	ld e,$12
	ld a,[de]
	call Unknown_0x0C94
	call Unknown_0x0DA4
	ld bc,$6244
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	ld bc,$5353
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	ld bc,$6244
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$4C
	ld a,[hl]
	and a
	jr z,Unknown_0xE756
	ld l,$40
	ld a,[hl]
	and a
	jr nz,Unknown_0xE74A
	ld l,$03
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	sub $10
	ld [de],a
	inc e
	ld a,[hl]
	sbc a,$00
	ld [de],a
	ld bc,$6244
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret

Unknown_0xE74A:
	ld e,$25
	xor a
	ld [de],a
	ld e,$03
	ld bc,$6630
	jp Unknown_0x0846

Unknown_0xE756:
	ld e,$25
	ld a,$00
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xE643
	jp Unknown_0x0846
	call Unknown_0xE7DD
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$5C
	ld e,l
	ld a,[hl]
	ld [de],a
	ret
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	ld e,$45
	ld a,[de]
	ld e,$27
	and $80
	jr z,Unknown_0xE784
	ld a,$01
	ld [de],a
	ret

Unknown_0xE784:
	xor a
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,e
	ld [hl],d
	ld l,$5B
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld [de],a
	ret
	ld e,$48
	ld a,d
	ld [de],a
	ret
	ld e,$5B
	ld a,[de]
	ld hl,$626D
	ld e,a
	add a,a
	add a,a
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xE7A9
	inc h

Unknown_0xE7A9:
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld e,$5C
	ld a,[hli]
	ld [de],a
	ld e,$5B
	ld a,[hli]
	ld [de],a
	ld a,[hl]
	push bc
	push de
	call Unknown_0x05DD
	pop de
	pop bc
	ret

Unknown_0xE7BE:
	ld e,$5B
	ld a,[de]
	ld hl,$626D
	ld e,a
	add a,a
	add a,a
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xE7CD
	inc h

Unknown_0xE7CD:
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld e,$5C
	ld a,[hli]
	ld [de],a
	ld e,$5B
	ld a,[hli]
	ld [de],a
	ld e,[hl]
	jp Unknown_0x0846

Unknown_0xE7DD:
	ld hl,$DB7F

Unknown_0xE7E0:
	ld a,[hli]
	cp $FF
	ret z
	cp $04
	jr nz,Unknown_0xE7ED
	ld e,$46
	ld a,[hl]
	ld [de],a
	ret

Unknown_0xE7ED:
	ld a,$04
	add a,l
	ld l,a
	jr nc,Unknown_0xE7E0
	inc h
	jr Unknown_0xE7E0

Unknown_0xE7F6:
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$11
	ld [de],a
	ret

UnknownData_0xE800:
INCBIN "baserom.gb", $E800, $E827 - $E800

Unknown_0xE827:
INCBIN "baserom.gb", $E827, $E82F - $E827

Unknown_0xE82F:
INCBIN "baserom.gb", $E82F, $E83A - $E82F

Unknown_0xE83A:
INCBIN "baserom.gb", $E83A, $E845 - $E83A

Unknown_0xE845:
INCBIN "baserom.gb", $E845, $E84D - $E845

Unknown_0xE84D:
INCBIN "baserom.gb", $E84D, $E8BF - $E84D

Unknown_0xE8BF:
INCBIN "baserom.gb", $E8BF, $E8D0 - $E8BF

Unknown_0xE8D0:
INCBIN "baserom.gb", $E8D0, $E900 - $E8D0
	ld bc,$6277
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1964
	bit 7,a
	jr z,Unknown_0xE940
	ld e,$3E
	ld a,[de]
	dec a
	ld [de],a
	ret nz
	ld hl,$6296
	ld e,$5C
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0xE922
	inc h

Unknown_0xE922:
	ld a,[hl]
	ld e,$3E
	ld [de],a
	call Unknown_0xEBD5
	ld b,a
	ld e,$45
	ld a,[de]
	cp b
	jr z,Unknown_0xE938
	ld e,$03
	ld bc,Unknown_0xE845
	jp Unknown_0x0846

Unknown_0xE938:
	ld e,$03
	ld bc,Unknown_0xE84D
	jp Unknown_0x0846

Unknown_0xE940:
	ld e,$03
	ld bc,Unknown_0xE82F
	jp Unknown_0x0846
	ld bc,$6277
	call Unknown_0x255B
	ret c
	call Unknown_0x1964
	bit 7,a
	jr z,Unknown_0xE95A
	call Unknown_0x2375
	ret

Unknown_0xE95A:
	ld e,$03
	ld bc,$682F
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6277
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xE827
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6277
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xE8D0
	jp Unknown_0x0846
	call Unknown_0x1964
	bit 7,a
	jr z,Unknown_0xE9BA
	ld bc,$6277
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret

Unknown_0xE9BA:
	ld e,$03
	ld bc,Unknown_0xE82F
	jp Unknown_0x0846
	call Unknown_0x1964
	bit 7,a
	jp z,Unknown_0xEA55
	ld bc,$6277
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld e,$3E
	ld a,[de]
	dec a
	ld [de],a
	ret nz
	ld a,$0C
	ld [de],a
	ld e,$45
	ld a,[de]
	ld b,a
	ld e,$40
	ld a,[de]
	cp b
	jr nz,Unknown_0xE9EF
	ld e,$03
	ld bc,Unknown_0xE84D
	jp Unknown_0x0846

Unknown_0xE9EF:
	ld c,a
	ld a,b
	cp $40
	jr z,Unknown_0xEA1C
	cp $20
	jr z,Unknown_0xEA15
	cp $00
	jr z,Unknown_0xEA0A
	cp $E0
	jr z,Unknown_0xEA03
	jr Unknown_0xEA29

Unknown_0xEA03:
	ld a,c
	cp $C0
	jr z,Unknown_0xEA34
	jr Unknown_0xEA1E

Unknown_0xEA0A:
	ld a,c
	cp $E0
	jr z,Unknown_0xEA29
	cp $C0
	jr z,Unknown_0xEA29
	jr Unknown_0xEA3F

Unknown_0xEA15:
	ld a,c
	cp $40
	jr z,Unknown_0xEA4A
	jr Unknown_0xEA1E

Unknown_0xEA1C:
	jr Unknown_0xEA3F

Unknown_0xEA1E:
	ld a,$00
	ld e,$45
	ld [de],a
	ld e,$15
	ld a,$00
	ld [de],a
	ret

Unknown_0xEA29:
	ld a,$E0
	ld e,$45
	ld [de],a
	ld e,$15
	ld a,$02
	ld [de],a
	ret

Unknown_0xEA34:
	ld a,$C0
	ld e,$45
	ld [de],a
	ld e,$15
	ld a,$04
	ld [de],a
	ret

Unknown_0xEA3F:
	ld a,$20
	ld e,$45
	ld [de],a
	ld e,$15
	ld a,$02
	ld [de],a
	ret

Unknown_0xEA4A:
	ld a,$40
	ld e,$45
	ld [de],a
	ld e,$15
	ld a,$04
	ld [de],a
	ret

Unknown_0xEA55:
	ld e,$03
	ld bc,$682F
	jp Unknown_0x0846
	call Unknown_0x1964
	bit 7,a
	jr z,Unknown_0xEA6F
	ld bc,$6277
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret

Unknown_0xEA6F:
	ld e,$03
	ld bc,Unknown_0xE83A
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$6285
	call Unknown_0x255B
	ret c
	call Unknown_0x197F
	ret nc
	ld e,$03
	ld bc,Unknown_0xE8BF
	jp Unknown_0x0846
	ld hl,$6296
	ld e,$5C
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0xEA98
	inc h

Unknown_0xEA98:
	ld e,$3E
	ld a,[hl]
	ld [de],a
	ret
	push bc
	ld bc,Unknown_0xE29E
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	ld a,[hl]
	cp $40
	jp z,Unknown_0xEB45
	cp $20
	jr z,Unknown_0xEB22
	cp $00
	jr z,Unknown_0xEAFF
	cp $E0
	jr z,Unknown_0xEADC
	ld a,$08
	add a,c
	ld c,a
	jr nc,Unknown_0xEAC0
	inc b

Unknown_0xEAC0:
	call Unknown_0xEC3E
	ld e,$0D
	ld hl,$62A8
	ld a,$10
	add a,l
	ld l,a
	jr nc,Unknown_0xEACF
	inc h

Unknown_0xEACF:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	pop bc
	ret

Unknown_0xEADC:
	ld a,$06
	add a,c
	ld c,a
	jr nc,Unknown_0xEAE3
	inc b

Unknown_0xEAE3:
	call Unknown_0xEC3E
	ld e,$0D
	ld hl,$62A8
	ld a,$0C
	add a,l
	ld l,a
	jr nc,Unknown_0xEAF2
	inc h

Unknown_0xEAF2:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	pop bc
	ret

Unknown_0xEAFF:
	ld a,$04
	add a,c
	ld c,a
	jr nc,Unknown_0xEB06
	inc b

Unknown_0xEB06:
	call Unknown_0xEC3E
	ld e,$0D
	ld hl,$62A8
	ld a,$08
	add a,l
	ld l,a
	jr nc,Unknown_0xEB15
	inc h

Unknown_0xEB15:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	pop bc
	ret

Unknown_0xEB22:
	ld a,$02
	add a,c
	ld c,a
	jr nc,Unknown_0xEB29
	inc b

Unknown_0xEB29:
	call Unknown_0xEC3E
	ld e,$0D
	ld hl,$62A8
	ld a,$04
	add a,l
	ld l,a
	jr nc,Unknown_0xEB38
	inc h

Unknown_0xEB38:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	pop bc
	ret

Unknown_0xEB45:
	call Unknown_0xEC3E
	ld e,$0D
	ld hl,Unknown_0xE2A8
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	pop bc
	ret
	push bc
	push de
	call Unknown_0x1AEA
	push bc
	ld a,c
	add a,$04
	ld c,a
	jr nc,Unknown_0xEB67
	inc b

Unknown_0xEB67:
	call Unknown_0x1646
	and $07
	and a
	pop bc
	jr nz,Unknown_0xEB86
	ld a,c
	sub $04
	ld c,a
	jr nc,Unknown_0xEB77
	dec b

Unknown_0xEB77:
	call Unknown_0x1646
	and $07
	and a
	jr nz,Unknown_0xEB86
	pop de
	pop bc
	ld e,$27
	xor a
	ld [de],a
	ret

Unknown_0xEB86:
	pop de
	pop bc
	ld e,$27
	ld a,$01
	ld [de],a
	ret
	ld e,$15
	ld a,[de]
	inc a
	ld [de],a
	ret
	ld e,$15
	ld a,[de]
	dec a
	ld [de],a
	ret
	ld hl,$6298
	ld e,$5C
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0xEBA5
	inc h

Unknown_0xEBA5:
	ld a,[hl]
	ld e,a
	call Unknown_0x0647
	cp e
	ld e,$27
	jr c,Unknown_0xEBB2
	xor a
	ld [de],a
	ret

Unknown_0xEBB2:
	ld a,$01
	ld [de],a
	ret
	call Unknown_0x0647
	ld e,$27
	cp $00
	jr c,Unknown_0xEBCB
	cp $A0
	jr c,Unknown_0xEBC7
	ld a,$03
	ld [de],a
	ret

Unknown_0xEBC7:
	ld a,$02
	ld [de],a
	ret

Unknown_0xEBCB:
	ld a,$01
	ld [de],a
	ret
	ld e,$27
	ld a,[de]
	dec a
	ld [de],a
	ret

Unknown_0xEBD5:
	ld h,$A0
	ld e,$0B
	ld l,e
	ld a,[de]
	sub [hl]
	bit 7,a
	jr z,Unknown_0xEBE2
	ld a,$01

Unknown_0xEBE2:
	ld c,a
	ld e,$09
	ld l,e
	ld a,[de]
	sub [hl]
	bit 7,a
	ld e,$01
	jr z,Unknown_0xEBF4
	ld b,$01
	ld e,$00
	cpl
	inc a

Unknown_0xEBF4:
	ld b,a
	ld l,c
	xor a
	sla l
	rla
	sla l
	rla
	ld h,a
	ld c,$00

Unknown_0xEC00:
	and a
	ld a,l
	sub b
	ld l,a
	jr nc,Unknown_0xEC0C
	ld a,h
	sub $01
	jr c,Unknown_0xEC14
	ld h,a

Unknown_0xEC0C:
	inc c
	ld a,c
	sub $0C
	jr nz,Unknown_0xEC00
	jr Unknown_0xEC2D

Unknown_0xEC14:
	ld a,c
	sub $02
	jr nc,Unknown_0xEC23
	ld a,e
	and a
	jr nz,Unknown_0xEC38
	ld e,$40
	ld a,$40
	ld [de],a
	ret

Unknown_0xEC23:
	ld a,e
	and a
	jr nz,Unknown_0xEC32
	ld e,$40
	ld a,$20
	ld [de],a
	ret

Unknown_0xEC2D:
	ld e,$40
	xor a
	ld [de],a
	ret

Unknown_0xEC32:
	ld e,$40
	ld a,$E0
	ld [de],a
	ret

Unknown_0xEC38:
	ld e,$40
	ld a,$C0
	ld [de],a
	ret

Unknown_0xEC3E:
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$03
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	bit 7,a
	jr nz,Unknown_0xEC59
	add a,[hl]
	ld [de],a
	inc e
	inc l
	ld a,[hli]
	adc a,$00
	ld [de],a
	inc e
	jr Unknown_0xEC68

Unknown_0xEC59:
	push bc
	cpl
	inc a
	ld b,a
	ld a,[hl]
	sub b
	ld [de],a
	inc e
	inc l
	ld a,[hli]
	sbc a,$00
	ld [de],a
	inc e
	pop bc

Unknown_0xEC68:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[bc]
	bit 7,a
	jr nz,Unknown_0xEC79
	add a,[hl]
	ld [de],a
	inc l
	inc e
	ld a,[hl]
	adc a,$00
	ld [de],a
	ret

Unknown_0xEC79:
	cpl
	inc a
	ld b,a
	ld a,[hl]
	sub b
	ld [de],a
	inc e
	inc l
	ld a,[hli]
	sbc a,$00
	ld [de],a
	ret

UnknownData_0xEC86:
INCBIN "baserom.gb", $EC86, $EC90 - $EC86

Unknown_0xEC90:
INCBIN "baserom.gb", $EC90, $EC99 - $EC90

Unknown_0xEC99:
INCBIN "baserom.gb", $EC99, $ECB9 - $EC99

Unknown_0xECB9:
INCBIN "baserom.gb", $ECB9, $ECD6 - $ECB9
	call Unknown_0xEDEA
	ret nc
	ld e,$03
	ld bc,Unknown_0xEC90
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$62BC
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xEC99
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$62BC
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,$6C99
	jp Unknown_0x0846

UnknownData_0xED25:
INCBIN "baserom.gb", $ED25, $ED26 - $ED25
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld hl,$62EC
	call Unknown_0x23CA
	call Unknown_0x0DA4
	ld bc,$62BC
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x19CB
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	jr z,Unknown_0xED57
	call Unknown_0xED84
	ret nc
	ld e,$03
	ld bc,$6CC6
	jp Unknown_0x0846

Unknown_0xED57:
	ld e,$03
	ld bc,Unknown_0xECB9
	jp Unknown_0x0846
	ld bc,$62BC
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0xED84
	jr c,Unknown_0xED76
	ld e,$03
	ld bc,$6C99
	jp Unknown_0x0846

Unknown_0xED76:
	call Unknown_0x19CB
	bit 7,a
	ret nz
	ld e,$03
	ld bc,$6CB9
	jp Unknown_0x0846

Unknown_0xED84:
	ld h,$A0
	ld e,$04
	ld l,e
	ld a,[de]
	sub [hl]
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	jr c,Unknown_0xEDA0
	ld e,$45
	ld a,[de]
	bit 7,a
	jr z,Unknown_0xEDAF
	ld l,e
	ld a,[hl]
	bit 7,a
	jr nz,Unknown_0xEDAF
	jr Unknown_0xEDB1

Unknown_0xEDA0:
	ld e,$45
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0xEDAF
	ld l,e
	ld a,[hl]
	bit 7,a
	jr z,Unknown_0xEDAF
	jr Unknown_0xEDB1

Unknown_0xEDAF:
	and a
	ret

Unknown_0xEDB1:
	scf
	ret

UnknownData_0xEDB3:
INCBIN "baserom.gb", $EDB3, $EDEA - $EDB3

Unknown_0xEDEA:
	ld e,$5B
	ld a,[de]
	and a
	ld h,$A0
	ld l,$45
	ld a,[hl]
	jr nz,Unknown_0xEDFB
	bit 7,a
	jr nz,Unknown_0xEE14
	jr Unknown_0xEDFF

Unknown_0xEDFB:
	bit 7,a
	jr z,Unknown_0xEE14

Unknown_0xEDFF:
	ld hl,$DB51
	ld a,[hli]
	sub $08
	ld e,a
	ld a,[hl]
	ld l,e
	jr nc,Unknown_0xEE0B
	dec a

Unknown_0xEE0B:
	ld h,a
	ld e,$04
	ld a,[de]
	sub l
	inc e
	ld a,[de]
	sbc a,h
	ret

Unknown_0xEE14:
	ld hl,$DB51
	ld a,[hli]
	add a,$A8
	ld e,a
	ld a,[hl]
	ld l,e
	jr nc,Unknown_0xEE20
	inc a

Unknown_0xEE20:
	ld h,a
	ld e,$04
	ld a,[de]
	sub l
	inc e
	ld a,[de]
	sbc a,h
	jr c,Unknown_0xEE2C
	scf
	ret

Unknown_0xEE2C:
	and a
	ret

UnknownData_0xEE2E:
INCBIN "baserom.gb", $EE2E, $EE38 - $EE2E

Unknown_0xEE38:
INCBIN "baserom.gb", $EE38, $EE42 - $EE38

Unknown_0xEE42:
INCBIN "baserom.gb", $EE42, $EE66 - $EE42

Unknown_0xEE66:
INCBIN "baserom.gb", $EE66, $EEAB - $EE66
	call Unknown_0xEDEA
	ret nc
	ld e,$03
	ld bc,Unknown_0xEE38
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$62CA
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0xE2D8
	call Unknown_0x24CD
	bit 6,a
	jr nz,Unknown_0xEEE1
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xEE42
	jp Unknown_0x0846

Unknown_0xEEE1:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x0DA4
	ld bc,$62CA
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0xE2D8
	call Unknown_0x24A5
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret nz
	ld e,$03
	ld bc,$6E9C
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$62CA
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0xE2D8
	call Unknown_0x24CD
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xEE66
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$62CA
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0xE2D8
	call Unknown_0x24CD
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xEE66
	jp Unknown_0x0846

UnknownData_0xEF57:
INCBIN "baserom.gb", $EF57, $F043 - $EF57
	ld e,$46
	ld a,[de]
	ld hl,$DD5C
	ld [hl],a
	ret

UnknownData_0xF04B:
INCBIN "baserom.gb", $F04B, $F072 - $F04B
	call Unknown_0x0DA4
	ld bc,$6F57
	call Unknown_0x255B
	call Unknown_0x1A25
	bit 7,a
	jp nz,Unknown_0x1FAF
	bit 6,a
	jp nz,Unknown_0x1FAF
	bit 5,a
	ret z
	jp Unknown_0x1FBD
	ld e,$26
	ld a,[de]
	or a
	jr nz,Unknown_0xF0B4
	ld e,$3E
	ld a,[de]
	inc a
	and $01
	ld [de],a
	jr nz,Unknown_0xF0A4
	ld e,$3B
	ld a,[de]
	ld e,$26
	jr Unknown_0xF0B4

Unknown_0xF0A4:
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	inc e
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$3C
	ld a,[de]
	ld e,$26

Unknown_0xF0B4:
	dec a
	ld [de],a
	ld e,$3E
	ld a,[de]
	or a
	jr z,Unknown_0xF0C2
	call Unknown_0x1EE6
	call Unknown_0x1ED3

Unknown_0xF0C2:
	call Unknown_0x0DA4
	ld bc,$6F57
	jp Unknown_0x255B
	ld bc,$6F57
	jp Unknown_0x255B
	ld e,$07
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ld e,$3F
	jr c,Unknown_0xF0E4
	ld a,$00
	ld [de],a
	ret

Unknown_0xF0E4:
	ld a,$80
	ld [de],a
	ret
	ld e,$5B
	ld a,[de]
	rlca
	rlca
	ld l,a
	ld e,$5C
	ld a,[de]
	rlca
	add a,l
	ld hl,$6F65
	add a,l
	ld l,a
	jr nc,Unknown_0xF0FB
	inc h

Unknown_0xF0FB:
	ld e,$5B
	ld a,[de]
	rrca
	jr c,Unknown_0xF11C
	ld e,$3F
	ld a,[de]
	cp $80
	ld e,$0F
	jr z,Unknown_0xF116
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hl]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0xF116:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

Unknown_0xF11C:
	ld e,$45
	ld a,[de]
	rlca
	ld e,$0D
	jr nc,Unknown_0xF130
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hl]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0xF130:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld e,$5B
	ld a,[de]
	sub $02
	swap a
	rrca
	ld l,a
	ld e,$5C
	ld a,[de]
	rlca
	rlca
	add a,l
	ld hl,$6F7D
	add a,l
	ld l,a
	jr nc,Unknown_0xF14D
	inc h

Unknown_0xF14D:
	ld a,[hli]
	ld e,$26
	ld [de],a
	ld e,$3C
	ld a,[hli]
	ld [de],a
	dec e
	ld a,[hli]
	ld [de],a
	ld e,$3E
	xor a
	ld [de],a
	ld e,$5B
	ld a,[de]
	rrca
	jr c,Unknown_0xF17B
	ld e,$3F
	ld a,[de]
	cp $80
	jr z,Unknown_0xF173
	ld e,$11
	xor a
	ld [de],a
	inc e
	ld a,[hl]
	cpl
	inc a
	ld [de],a
	ret

Unknown_0xF173:
	ld e,$11
	xor a
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

Unknown_0xF17B:
	ld e,$45
	ld a,[de]
	rlca
	ld e,$11
	jr c,Unknown_0xF189
	ld a,[hl]
	ld [de],a
	xor a
	inc e
	ld [de],a
	ret

Unknown_0xF189:
	ld a,[hl]
	cpl
	inc a
	ld [de],a
	xor a
	inc e
	ld [de],a
	ret

UnknownData_0xF191:
INCBIN "baserom.gb", $F191, $F1CD - $F191

Unknown_0xF1CD:
INCBIN "baserom.gb", $F1CD, $F1E1 - $F1CD

Unknown_0xF1E1:
INCBIN "baserom.gb", $F1E1, $F1E9 - $F1E1
	call Unknown_0x0DA4
	ld bc,$6F57
	call Unknown_0x255B
	call Unknown_0x197F
	ret nc
	ld a,[$FF00+$9E]
	cp $04
	jr c,Unknown_0xF20A
	jr z,Unknown_0xF221
	cp $05
	jr z,Unknown_0xF210
	cp $07
	jr z,Unknown_0xF221
	cp $06
	jr z,Unknown_0xF210

Unknown_0xF20A:
	call Unknown_0x1FBD
	jp Unknown_0x1FAF

Unknown_0xF210:
	ld e,$0D
	ld h,d
	ld l,$0F
	ld a,[de]
	ld b,[hl]
	ld [hli],a
	ld a,b
	ld [de],a
	inc e
	ld a,[de]
	ld b,[hl]
	ld [hl],a
	ld a,b
	ld [de],a
	ret

Unknown_0xF221:
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld c,a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld b,a
	dec e
	ld l,$0F
	ld h,d
	ld a,[hl]
	ld [hl],c
	cpl
	add a,$01
	ld [de],a
	inc l
	inc e
	ld a,[hl]
	ld [hl],b
	cpl
	adc a,$00
	ld [de],a
	ret
	ld bc,$6F57
	call Unknown_0x255B
	call Unknown_0x0DA4
	ld e,$40
	ld a,[de]
	rlca
	ld hl,$725A
	add a,l
	ld l,a
	jr nc,Unknown_0xF256
	inc h

Unknown_0xF256:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0xF25A:
INCBIN "baserom.gb", $F25A, $F262 - $F25A
	call Unknown_0xD026

Unknown_0xF265:
	or a
	jr z,Unknown_0xF281
	bit 5,a
	ld h,d
	ld l,$3D
	ld [hl],$03
	ret z
	call Unknown_0x1FAF

Unknown_0xF273:
	ld e,$0E
	ld a,[de]
	and $80
	xor $80
	rlca
	add a,$02
	ld e,$40
	ld [de],a
	ret

Unknown_0xF281:
	ld e,$3D
	ld a,[de]
	dec a
	ld [de],a
	cp $02
	jr z,Unknown_0xF294
	or a
	ret nz
	ld e,$03
	ld bc,Unknown_0xF1CD
	jp Unknown_0x0846

Unknown_0xF294:
	call Unknown_0x1FBD
	jr Unknown_0xF273
	call Unknown_0x19CB
	jr Unknown_0xF265
	call Unknown_0xD0D0

Unknown_0xF2A1:
	or a
	jr z,Unknown_0xF2BF
	bit 7,a
	jr nz,Unknown_0xF2B0
	bit 6,a
	ld h,d
	ld l,$3D
	ld [hl],$03
	ret z

Unknown_0xF2B0:
	call Unknown_0x1FBD

Unknown_0xF2B3:
	ld e,$10
	ld a,[de]
	and $80
	xor $80
	rlca
	ld e,$40
	ld [de],a
	ret

Unknown_0xF2BF:
	ld e,$3D
	ld a,[de]
	dec a
	ld [de],a
	cp $02
	jr z,Unknown_0xF2D2
	or a
	ret nz
	ld e,$03
	ld bc,$71CD
	jp Unknown_0x0846

Unknown_0xF2D2:
	call Unknown_0x1FAF
	jr Unknown_0xF2B3
	call Unknown_0xD0F8
	jr Unknown_0xF2A1
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6F57
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0xF31E
	ld e,$3E
	ld a,[de]
	or a
	ret nz
	call Unknown_0x1AB3
	ret nz
	ld e,$0F
	ld a,[de]
	inc e
	ld c,a
	ld a,[de]
	ld b,a
	ld hl,$6FA1
	ld e,$39
	ld a,[hli]
	ld [de],a
	inc e
	ld h,[hl]
	ld l,a
	ld a,h
	ld [de],a
	ld a,l
	sub c
	ld a,h
	sbc a,b
	ld hl,$6FA0
	ld e,$12
	ld a,[hl]
	jr c,Unknown_0xF31A
	ld [de],a
	ret

Unknown_0xF31A:
	cpl
	inc a
	ld [de],a
	ret

Unknown_0xF31E:
	ld e,$40
	ld a,$01
	ld [de],a
	ld e,$3E
	xor a
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xF1E1
	jp Unknown_0x0846
	ld e,$5C
	ld a,[de]
	rlca
	ld hl,$6FA3
	add a,l
	ld l,a
	jr nc,Unknown_0xF33B
	inc h

Unknown_0xF33B:
	ld e,$5B
	ld a,[de]
	cp $01
	jr c,Unknown_0xF366
	jr z,Unknown_0xF35E
	cp $02
	jr z,Unknown_0xF350
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

Unknown_0xF350:
	ld e,$0D
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hl]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0xF35E:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

Unknown_0xF366:
	ld e,$0F
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hl]
	cpl
	adc a,$00
	ld [de],a
	ret
	ld hl,$6FA7
	ld e,$5C
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0xF380
	inc h

Unknown_0xF380:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld e,$40
	ld a,[de]
	cp $01
	jr c,Unknown_0xF3CA
	jr z,Unknown_0xF3C1
	cp $02
	jr z,Unknown_0xF399
	ld e,$0D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	jr Unknown_0xF3A6

Unknown_0xF399:
	ld e,$0D
	ld a,l
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,h
	cpl
	adc a,$00
	ld [de],a

Unknown_0xF3A6:
	ld e,$3F
	ld a,[de]
	cp $00
	ld e,$0F
	jr z,Unknown_0xF3B5
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

Unknown_0xF3B5:
	ld a,l
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,h
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0xF3C1:
	ld e,$0F
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	jr Unknown_0xF3D7

Unknown_0xF3CA:
	ld e,$0F
	ld a,l
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,h
	cpl
	adc a,$00
	ld [de],a

Unknown_0xF3D7:
	ld e,$45
	ld a,[de]
	rlca
	ld e,$0D
	jr c,Unknown_0xF3E5
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

Unknown_0xF3E5:
	ld a,l
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,h
	cpl
	adc a,$00
	ld [de],a
	ret

UnknownData_0xF3F1:
INCBIN "baserom.gb", $F3F1, $F561 - $F3F1

Unknown_0xF561:
INCBIN "baserom.gb", $F561, $F569 - $F561
	call Unknown_0x21C5
	ld e,$0D
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jr nz,Unknown_0xF57C
	ld e,$39
	ld a,$01
	ld [de],a
	jr Unknown_0xF58C

Unknown_0xF57C:
	ld e,$39
	ld a,[de]
	or a
	jr z,Unknown_0xF58C
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$39
	xor a
	ld [de],a

Unknown_0xF58C:
	call Unknown_0x0DA4
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 4,a
	jr nz,Unknown_0xF5AE
	bit 5,a
	jr nz,Unknown_0xF5AE
	ld e,$4D
	ld a,[de]
	cp $04
	jr c,Unknown_0xF5C7

Unknown_0xF5AE:
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	call Unknown_0x0DA4
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ld e,$11
	ld [de],a

Unknown_0xF5C7:
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld e,$3D
	ld a,[de]
	ld e,$26
	ld [de],a
	ld e,$3B
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ld e,$3A
	ld a,[de]
	ld e,$11
	ld [de],a
	ld l,$40
	ld h,d
	dec [hl]
	ret nz
	call Unknown_0x0647
	ld l,$3F
	ld h,d
	cp [hl]
	jr c,Unknown_0xF5FA
	ld l,$3E
	ld a,[hl]
	ld l,$40
	ld [hl],a
	ret

Unknown_0xF5FA:
	ld e,$03
	ld bc,$745D
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$4D
	ld a,[de]
	cp $04
	jr nc,Unknown_0xF62A
	ld e,$03
	ld bc,$7455
	jp Unknown_0x0846

Unknown_0xF62A:
	ld e,$0D
	ld a,[de]
	inc e
	ld c,a
	ld a,[de]
	or c
	ret nz

Unknown_0xF632:
	ld hl,$0100
	ld e,$4D
	ld a,[de]
	cp $04
	jr z,Unknown_0xF644
	ld e,$0D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

Unknown_0xF644:
	ld e,$0D
	ld a,l
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,h
	cpl
	add a,$00
	ld [de],a
	ret
	ld e,$40
	ld a,[de]
	cp $01
	jr z,Unknown_0xF66D
	jr c,Unknown_0xF66A
	ld e,$0D
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jp z,Unknown_0xF704
	call Unknown_0x1EE6
	jr Unknown_0xF66D

Unknown_0xF66A:
	call Unknown_0x21C5

Unknown_0xF66D:
	call Unknown_0x0DA4
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	or a
	jp z,Unknown_0xF6FC
	bit 5,a
	jr nz,Unknown_0xF6AF
	ld e,$4D
	ld a,[de]
	cp $04
	jr c,Unknown_0xF6B8
	ld l,$0E
	ld h,d
	bit 7,[hl]
	jr nz,Unknown_0xF69C
	cp $04
	jr z,Unknown_0xF6AF
	jr Unknown_0xF6A0

Unknown_0xF69C:
	cp $04
	jr nz,Unknown_0xF6AF

Unknown_0xF6A0:
	call Unknown_0xF632
	ld h,d
	ld l,$1F
	ld [hl],$43
	inc l
	ld [hl],$77
	inc l
	ld [hl],$58
	ret

Unknown_0xF6AF:
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ld e,$11
	ld [de],a

Unknown_0xF6B8:
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ld e,$45
	ld a,[de]
	jr nc,Unknown_0xF6D3
	rlca
	jp c,Unknown_0xF704
	jr Unknown_0xF6D7

Unknown_0xF6D3:
	rlca
	jp nc,Unknown_0xF704

Unknown_0xF6D7:
	ld e,$40
	ld a,[de]
	inc a
	ld [de],a
	cp $02
	jr z,Unknown_0xF6EB
	ld e,$3D
	ld a,[de]
	ld e,$26
	ld [de],a
	xor a
	ld e,$11
	ld [de],a
	ret

Unknown_0xF6EB:
	ld e,$45
	ld a,[de]
	rlca
	ld e,$3A
	ld a,[de]
	ld e,$11
	jr nc,Unknown_0xF6F8
	ld [de],a
	ret

Unknown_0xF6F8:
	cpl
	inc a
	ld [de],a
	ret

Unknown_0xF6FC:
	ld e,$03
	ld bc,$748E
	jp Unknown_0x0846

Unknown_0xF704:
	call Unknown_0x0647
	ld l,$3F
	ld h,d
	cp [hl]
	jr nc,Unknown_0xF715
	ld e,$03
	ld bc,$746F
	jp Unknown_0x0846

Unknown_0xF715:
	ld e,$03
	ld bc,$7415
	jp Unknown_0x0846

UnknownData_0xF71D:
INCBIN "baserom.gb", $F71D, $F77D - $F71D
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret

UnknownData_0xF788:
INCBIN "baserom.gb", $F788, $F7FC - $F788
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	jr z,Unknown_0xF81F
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1FBD

Unknown_0xF81F:
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xF561
	jp Unknown_0x0846
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0xF83C
	inc h

Unknown_0xF83C:
	ld e,$11
	ld a,[hli]
	ld [de],a
	ld e,$3A
	ld [de],a
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0xF852
	ld e,$3B
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	jr Unknown_0xF85F

Unknown_0xF852:
	ld e,$3B
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a

Unknown_0xF85F:
	ld e,$26
	ld a,[hli]
	ld [de],a
	ld e,$3D
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$40
	ld [de],a
	dec e
	ld a,[hl]
	ld [de],a
	xor a
	ld e,$39
	ld [de],a
	ret
	ld e,$26
	ld a,[de]
	rrca
	ld [de],a
	ld e,$40
	ld a,[de]
	inc a
	ld [de],a
	ret

UnknownData_0xF87F:
INCBIN "baserom.gb", $F87F, $F92B - $F87F
	call Unknown_0x0647
	ld e,$00
	cp $40
	jr c,Unknown_0xF93A
	inc e
	cp $C0
	jr c,Unknown_0xF93A
	inc e

Unknown_0xF93A:
	ld a,e
	ld e,$27
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld e,$27
	ld a,[de]
	swap a
	ld c,a
	ld e,$5C
	ld a,[de]
	swap a
	rrca
	add a,c
	add a,l
	ld l,a
	jr nc,Unknown_0xF958
	inc h

Unknown_0xF958:
	pop bc
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	call Unknown_0x2053
	jp Unknown_0x20F9

UnknownData_0xF966:
INCBIN "baserom.gb", $F966, $F98A - $F966
	call Unknown_0x1ED3
	jp Unknown_0x0DA4

UnknownData_0xF990:
INCBIN "baserom.gb", $F990, $F9A7 - $F990
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc hl
	ld a,[de]
	sbc a,[hl]
	ret c
	ld a,c
	ld h,d
	ld l,$45
	bit 7,[hl]
	ld l,$27
	jr nz,Unknown_0xF9C2
	cp [hl]
	ret c
	jr Unknown_0xF9C4

Unknown_0xF9C2:
	cp [hl]
	ret nc

Unknown_0xF9C4:
	ld e,$03
	ld bc,Unknown_0xF9CC
	jp Unknown_0x0846

Unknown_0xF9CC:
INCBIN "baserom.gb", $F9CC, $FA14 - $F9CC
	ld hl,$21D8
	ld a,$00
	call Unknown_0x05CF
	call Unknown_0x0DA4
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0xFA3A
	jp Unknown_0x0846

Unknown_0xFA3A:
INCBIN "baserom.gb", $FA3A, $FA68 - $FA3A
	call Unknown_0x0DA4
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$6FAB
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0xFA96
	bit 5,a
	ret z
	jp Unknown_0x1EF9

Unknown_0xFA96:
	ld e,$03
	ld bc,Unknown_0xFA9E
	jp Unknown_0x0846

Unknown_0xFA9E:
INCBIN "baserom.gb", $FA9E, $FB08 - $FA9E

Unknown_0xFB08:
INCBIN "baserom.gb", $FB08, $FB3E - $FB08

Unknown_0xFB3E:
INCBIN "baserom.gb", $FB3E, $FB51 - $FB3E

Unknown_0xFB51:
INCBIN "baserom.gb", $FB51, $FB63 - $FB51
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0xFB70
	call Unknown_0x1964
	bit 7,a
	jr z,Unknown_0xFBAA

Unknown_0xFB70:
	ld bc,$7ACC
	call Unknown_0x255B
	ret c
	ld e,$5C
	ld a,[de]
	cp $02
	jr z,Unknown_0xFB82
	ld b,$0D
	jr Unknown_0xFB84

Unknown_0xFB82:
	ld b,$0B

Unknown_0xFB84:
	ld c,$0B
	call Unknown_0x1F14
	jr c,Unknown_0xFBD8
	call Unknown_0x1F0D
	jr nz,Unknown_0xFBBD
	ld e,$3E
	ld a,[de]
	and a
	ret z
	xor a
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xFB08
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0xFBAA:
	ld e,$03
	ld bc,$7B2F
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0xFBBD:
	ld e,$3E
	ld a,[de]
	and a
	ret nz
	ld a,$01
	ld [de],a
	ld e,$03
	ld bc,Unknown_0xFB3E
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0xFBD8:
	ld e,$03
	ld bc,Unknown_0xFB51
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld bc,$7ACC
	call Unknown_0x255B
	ret c
	ld e,$5C
	ld a,[de]
	cp $02
	jr z,Unknown_0xFC0C
	ld b,$0D
	jr Unknown_0xFC0E

Unknown_0xFC0C:
	ld b,$0B

Unknown_0xFC0E:
	ld c,$0B
	call Unknown_0x1F14
	jr c,Unknown_0xFC3B
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0xFC69
	call Unknown_0x1F0D
	jr nz,Unknown_0xFC4E
	ld e,$3E
	ld a,[de]
	and a
	ret z
	xor a
	ld [de],a
	ld e,$03
	ld bc,$7B2F
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0xFC3B:
	ld e,$03
	ld bc,$7B51
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0xFC4E:
	ld e,$3E
	ld a,[de]
	and a
	ret nz
	ld a,$01
	ld [de],a
	ld e,$03
	ld bc,$7B3E
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0xFC69:
	ld e,$03
	ld bc,Unknown_0xFB08
	call Unknown_0x0846
	ld e,$42
	ld a,[de]
	and a
	ret z
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0xFC7C:
	push bc
	push de
	ld hl,$A084
	ld a,[hl]
	cp $99
	jr nc,Unknown_0xFC89
	and a
	inc a
	daa

Unknown_0xFC89:
	ld [hl],a
	ld e,$21
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld hl,$DEDE
	set 2,[hl]
	pop de
	pop bc
	ret
	ld e,$5C
	ld a,[de]
	cp $03
	jr z,Unknown_0xFCD8
	ld hl,$DEDF
	bit 1,[hl]
	jr nz,Unknown_0xFCC1
	ld hl,$A04C
	ld e,$5C
	ld a,[de]
	cp $02
	jr z,Unknown_0xFCB8

Unknown_0xFCB4:
	ld a,$0C
	ld [hl],a
	ret

Unknown_0xFCB8:
	ld a,[hl]
	add a,$04
	cp $0C
	jr nc,Unknown_0xFCB4
	ld [hl],a
	ret

Unknown_0xFCC1:
	ld hl,$A072
	ld e,$5C
	ld a,[de]
	cp $02
	jr z,Unknown_0xFCCF

Unknown_0xFCCB:
	ld a,$06
	ld [hl],a
	ret

Unknown_0xFCCF:
	ld a,[hl]
	add a,$02
	cp $06
	jr nc,Unknown_0xFCCB
	ld [hl],a
	ret

Unknown_0xFCD8:
	ld hl,$DEE1
	ld a,[hl]
	inc a
	cp $07
	jr nz,Unknown_0xFCF5
	call Unknown_0xFC7C
	ld hl,$DEE6
	ld [hl],$57
	inc hl
	ld [hl],$5F
	inc hl
	ld [hl],$07
	ld hl,$DEDE
	set 7,[hl]
	xor a

Unknown_0xFCF5:
	ld hl,$DEE1
	ld [hl],a
	ld hl,$DEDE
	set 5,[hl]
	ret
	ld e,$49
	ld a,[de]
	inc a
	ret z
	ld a,[$DB57]
	inc a
	jr z,Unknown_0xFD27
	ld hl,$DCFD
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld e,$5C
	ld a,[de]
	inc a
	ld [hli],a
	ld a,[$DB57]
	ld [hli],a
	ld e,$49
	ld a,[de]
	ld [hli],a
	ld [hl],$00
	ld a,l
	ld [$DCFD],a
	ld a,h
	ld [$DCFE],a

Unknown_0xFD27:
	ld a,$FF
	ld [de],a
	ret

UnknownData_0xFD2B:
INCBIN "baserom.gb", $FD2B, $FD78 - $FD2B
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DD63
	and [hl]
	ld e,$27
	ld [de],a
	ret
	ld e,$3E
	ld a,[de]
	dec a
	ld [de],a
	jr nz,Unknown_0xFD9A
	ld a,$04
	ld [de],a
	ld e,$15
	ld a,[de]
	inc a
	cp $07
	jr c,Unknown_0xFD99
	xor a

Unknown_0xFD99:
	ld [de],a

Unknown_0xFD9A:
	ld e,$15
	ld bc,$0200
	call Unknown_0x0D35
	call Unknown_0x0DA4
	call Unknown_0x1A25
	ld bc,$7E03
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 3,a
	jr nz,Unknown_0xFDD0
	bit 2,a
	ld e,$3D
	ld a,[de]
	jr nz,Unknown_0xFDC6
	dec a
	ret nz
	ld e,$03
	ld bc,$7D53
	jp Unknown_0x0846

Unknown_0xFDC6:
	or a
	ret nz
	ld e,$03
	ld bc,$7D5F
	jp Unknown_0x0846

Unknown_0xFDD0:
	call Unknown_0x2809
	ret c
	ld a,[$A051]
	cp $0C
	ret z
	ld e,$08
	ld bc,$6195
	call Unknown_0x0C3A
	ld hl,$A003
	ld e,l
	ld b,$06

Unknown_0xFDE8:
	ld a,[de]
	ld [hli],a
	inc e
	dec b
	jr nz,Unknown_0xFDE8
	ld e,$46
	ld a,[de]
	ld l,$39
	ld [hl],a
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DD63
	or [hl]
	ld [hl],a
	ld h,d
	jp Unknown_0x0BBA

UnknownData_0xFE03:
INCBIN "baserom.gb", $FE03, $FE11 - $FE03
	ld h,d
	ld l,$04
	ld e,$39
	call Unknown_0xFE1A
	inc l

Unknown_0xFE1A:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ret

UnknownData_0xFE21:
INCBIN "baserom.gb", $FE21, $FE2C - $FE21
	ld h,d
	ld l,$39
	ld e,$04
	jr Unknown_0xFE1A

UnknownData_0xFE33:
INCBIN "baserom.gb", $FE33, $10000 - $FE33

SECTION "Bank04", ROMX, BANK[$04]

UnknownData_0x10000:
INCBIN "baserom.gb", $10000, $100DF - $10000

Unknown_0x100DF:
INCBIN "baserom.gb", $100DF, $101A9 - $100DF

Unknown_0x101A9:
INCBIN "baserom.gb", $101A9, $10206 - $101A9

Unknown_0x10206:
INCBIN "baserom.gb", $10206, $10268 - $10206
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x10272
	dec a
	ld [de],a
	jr Unknown_0x10275

Unknown_0x10272:
	call Unknown_0x21EB

Unknown_0x10275:
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0x10292
	bit 5,a
	ret z
	jp Unknown_0x1EF9

Unknown_0x10292:
	ld e,$04
	ld bc,Unknown_0x10206
	jp Unknown_0x0846
	ld e,$3F
	ld a,[de]
	cp $01
	jr nz,Unknown_0x102A4
	call Unknown_0x1EE6

Unknown_0x102A4:
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19CB
	or a
	jr nz,Unknown_0x102C2
	ld e,$04
	ld bc,$422D
	jp Unknown_0x0846

Unknown_0x102C2:
	bit 5,a
	jr z,Unknown_0x102CF
	call Unknown_0x1EF9
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a

Unknown_0x102CF:
	ld l,$26
	ld h,d
	dec [hl]
	ret nz
	ld e,$3F
	ld a,[de]
	cp $02
	jr z,Unknown_0x102E4
	inc a
	ld [de],a
	ld e,$3C
	add a,e
	ld e,a
	ld a,[de]
	ld [hl],a
	ret

Unknown_0x102E4:
	ld e,$04
	ld bc,Unknown_0x100DF
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$04
	ld bc,Unknown_0x101A9
	jp Unknown_0x0846
	ld bc,$4000
	jp Unknown_0x255B

UnknownData_0x10313:
INCBIN "baserom.gb", $10313, $10342 - $10313
	ld bc,$4000
	call Unknown_0x255B
	ret c
	call Unknown_0x19CB
	or a
	ret nz
	ld hl,$4074
	call Unknown_0x2048
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$43
	inc l
	ld [hl],$60
	ret

UnknownData_0x10360:
INCBIN "baserom.gb", $10360, $10385 - $10360
	call Unknown_0x0DA4
	ld bc,$400E
	jp Unknown_0x255B
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld e,$27
	ld a,[de]
	swap a
	rrca
	ld b,a
	ld e,$5C
	ld a,[de]
	or a
	jr z,Unknown_0x103A4
	ld a,$18

Unknown_0x103A4:
	add a,b
	add a,l
	ld l,a
	jr nc,Unknown_0x103AA
	inc h

Unknown_0x103AA:
	call Unknown_0x20F9
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$26
	ld a,[hli]
	ld [de],a
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld e,$39
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	xor a
	ld e,$11
	ld [de],a
	pop bc
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	rlca
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x103D9
	inc h

Unknown_0x103D9:
	ld e,$3D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld e,$27
	ld a,[de]
	rlca
	rlca
	ld b,a
	ld e,$5C
	ld a,[de]
	or a
	jr z,Unknown_0x103FC
	ld a,$0C

Unknown_0x103FC:
	add a,b
	add a,l
	ld l,a
	jr nc,Unknown_0x10402
	inc h

Unknown_0x10402:
	ld e,$45
	ld a,[de]
	rlca
	ld a,[hli]
	jr nc,Unknown_0x1040B
	cpl
	inc a

Unknown_0x1040B:
	ld e,$11
	ld [de],a
	ld e,$26
	ld a,[hli]
	ld [de],a
	ld e,$3D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	xor a
	inc e
	ld [de],a
	pop bc
	ret
	push bc
	ld e,$3D
	ld a,[de]
	ld b,a
	ld e,$04
	call Unknown_0x1F9C
	jr nc,Unknown_0x10437
	call Unknown_0x0647
	ld h,d
	ld l,$40
	cp [hl]
	jr nc,Unknown_0x10437
	ld a,$03
	jr Unknown_0x1044D

Unknown_0x10437:
	call Unknown_0x0647
	ld h,d
	ld l,$3E
	cp [hl]
	jr nc,Unknown_0x10443
	xor a
	jr Unknown_0x1044D

Unknown_0x10443:
	inc hl
	cp [hl]
	jr nc,Unknown_0x1044B
	ld a,$01
	jr Unknown_0x1044D

Unknown_0x1044B:
	ld a,$02

Unknown_0x1044D:
	ld e,$27
	ld [de],a
	pop bc
	ret
	push bc
	call Unknown_0x0647
	and $E0
	swap a
	ld hl,$407A
	add a,l
	ld l,a
	jr nc,Unknown_0x10462
	inc h

Unknown_0x10462:
	ld a,[hli]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$04
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ld a,[hl]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$07
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	call Unknown_0x0647
	and $07
	add a,$04
	ld h,d
	ld l,$40
	add a,[hl]
	and $0F
	ld [hl],a
	rlca
	rlca
	ld hl,$408A
	add a,l
	ld l,a
	jr nc,Unknown_0x10496
	inc h

Unknown_0x10496:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	pop bc
	ret
	ld e,$3B
	ld a,[de]
	dec a
	ld [de],a
	ld e,$27
	ld [de],a
	ret

UnknownData_0x104AE:
INCBIN "baserom.gb", $104AE, $105E1 - $104AE

Unknown_0x105E1:
INCBIN "baserom.gb", $105E1, $106B1 - $105E1

Unknown_0x106B1:
INCBIN "baserom.gb", $106B1, $10721 - $106B1

Unknown_0x10721:
INCBIN "baserom.gb", $10721, $1073A - $10721

Unknown_0x1073A:
INCBIN "baserom.gb", $1073A, $107C8 - $1073A

Unknown_0x107C8:
INCBIN "baserom.gb", $107C8, $107E3 - $107C8

Unknown_0x107E3:
INCBIN "baserom.gb", $107E3, $107FA - $107E3

Unknown_0x107FA:
INCBIN "baserom.gb", $107FA, $10816 - $107FA

Unknown_0x10816:
INCBIN "baserom.gb", $10816, $10900 - $10816

Unknown_0x10900:
INCBIN "baserom.gb", $10900, $10957 - $10900
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	ld bc,$4523
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	call Unknown_0x13DE3
	ret c
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld e,$5B
	ld a,[de]
	rlca
	ld hl,$49CC
	add a,l
	ld l,a
	jr nc,Unknown_0x10985
	inc h

Unknown_0x10985:
	ld a,[hli]
	ld b,[hl]
	ld c,a
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x109A3
	bit 5,a
	jr nz,Unknown_0x1099C
	bit 6,a
	ret z
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a

Unknown_0x1099C:
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x109A3:
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$40
	ld a,[de]
	cp $01
	jr z,Unknown_0x109C1
	jr c,Unknown_0x109C4
	ld e,$04
	ld bc,Unknown_0x107E3
	jp Unknown_0x0846

Unknown_0x109C1:
	call Unknown_0x1EC0

Unknown_0x109C4:
	ld e,$04
	ld bc,Unknown_0x13C7E
	jp Unknown_0x0846

UnknownData_0x109CC:
INCBIN "baserom.gb", $109CC, $109D0 - $109CC
	ld bc,$4523
	call Unknown_0x233C
	jr c,Unknown_0x109FB
	ld e,$0F
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jr z,Unknown_0x109F3
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 6,a
	ret z
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a

Unknown_0x109F3:
	ld e,$04
	ld bc,$466A
	jp Unknown_0x0846

Unknown_0x109FB:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4531
	call Unknown_0x233C
	jr c,Unknown_0x10A36
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 7,a
	jr z,Unknown_0x10A24
	ld e,$27
	ld a,$01
	call Unknown_0x2319
	ld e,$04
	ld bc,Unknown_0x106B1
	jp Unknown_0x0846

Unknown_0x10A24:
	bit 5,a
	ret z
	ld e,$27
	ld a,$05
	call Unknown_0x2319
	ld e,$04
	ld bc,$46B1
	jp Unknown_0x0846

Unknown_0x10A36:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4523
	call Unknown_0x233C
	jr c,Unknown_0x10A60
	call Unknown_0x0DA4
	ld b,$04
	ld e,$07
	call Unknown_0x1F9C
	jr c,Unknown_0x10A58
	call Unknown_0x1A25
	bit 7,a
	ret z

Unknown_0x10A58:
	ld e,$04
	ld bc,$46E0
	jp Unknown_0x0846

Unknown_0x10A60:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4531
	call Unknown_0x233C
	jr c,Unknown_0x10A88
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 5,a
	ret z
	ld e,$27
	ld a,$06
	call Unknown_0x2319
	ld e,$04
	ld bc,Unknown_0x10721
	jp Unknown_0x0846

Unknown_0x10A88:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$4523
	call Unknown_0x233C
	jr c,Unknown_0x10AB3
	call Unknown_0x21EB
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$27
	ld a,$05
	call Unknown_0x2319
	ld e,$04
	ld bc,Unknown_0x1073A
	jp Unknown_0x0846

Unknown_0x10AB3:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4523
	call Unknown_0x233C
	jr c,Unknown_0x10B02
	ld e,$0F
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jr nz,Unknown_0x10AD6
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x10AD6
	dec a
	ld [de],a
	jr Unknown_0x10ADC

Unknown_0x10AD6:
	call Unknown_0x1ED3
	call Unknown_0x0DA4

Unknown_0x10ADC:
	call Unknown_0x1A25
	bit 6,a
	jr z,Unknown_0x10AEA
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x10AEA:
	bit 7,a
	ret z
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$04
	ld bc,$4779
	jp Unknown_0x0846

Unknown_0x10B02:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4523
	call Unknown_0x233C
	jr c,Unknown_0x10B2A
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 5,a
	ret z
	ld e,$27
	ld a,$05
	call Unknown_0x2319
	ld e,$04
	ld bc,$46B1
	jp Unknown_0x0846

Unknown_0x10B2A:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4531
	call Unknown_0x233C
	jr c,Unknown_0x10B76
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x10B68
	dec a
	ld [de],a
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 6,a
	jr z,Unknown_0x10B56
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x10B56:
	bit 5,a
	ret z
	ld e,$27
	ld a,$05
	call Unknown_0x2319
	ld e,$04
	ld bc,$46B1
	jp Unknown_0x0846

Unknown_0x10B68:
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$04
	ld bc,Unknown_0x107C8
	jp Unknown_0x0846

Unknown_0x10B76:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	call Unknown_0x13DE3
	ret c
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld e,$5B
	ld a,[de]
	rlca
	ld hl,$4BC3
	add a,l
	ld l,a
	jr nc,Unknown_0x10B94
	inc h

Unknown_0x10B94:
	ld a,[hli]
	ld b,[hl]
	ld c,a
	call Unknown_0x24CD
	bit 6,a
	jr z,Unknown_0x10BA5
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x10BA5:
	bit 7,a
	ret z
	ld e,$0D
	call Unknown_0x0F7A
	ld l,$3F
	ld h,d
	dec [hl]
	jr z,Unknown_0x10BBB
	ld e,$04
	ld bc,Unknown_0x107FA
	jp Unknown_0x0846

Unknown_0x10BBB:
	ld e,$04
	ld bc,Unknown_0x10816
	jp Unknown_0x0846

UnknownData_0x10BC3:
INCBIN "baserom.gb", $10BC3, $10BC7 - $10BC3
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$44AE
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 5,a
	ret z
	ld e,$41
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$44AE
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	jr z,Unknown_0x10C0A
	ld e,$04
	ld bc,Unknown_0x10900
	jp Unknown_0x0846

Unknown_0x10C0A:
	bit 5,a
	ret z
	ld e,$41
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ret z
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$44AE
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	jr z,Unknown_0x10C37
	ld e,$04
	ld bc,$491D
	jp Unknown_0x0846

Unknown_0x10C37:
	bit 5,a
	ret z
	ld e,$41
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ret
	ld bc,$44AE
	jp Unknown_0x255B
	ld e,$5B
	ld a,[de]
	rlca
	rlca
	ld l,a
	ld e,$5C
	ld a,[de]
	rlca
	add a,l
	ld hl,$44CA
	add a,l
	ld l,a
	jr nc,Unknown_0x10C61
	inc h

Unknown_0x10C61:
	ld e,$3D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	cp $FF
	jr nz,Unknown_0x10C7F
	ld a,[hli]
	cpl
	inc a
	add a,l
	ld l,a
	ld a,$FF
	adc a,h
	ld h,a
	ld a,[hli]

Unknown_0x10C7F:
	ld e,$27
	ld [de],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc

Unknown_0x10C90:
	ld e,$27
	ld a,[de]

Unknown_0x10C93:
	push bc
	swap a
	ld c,a
	ld e,$5C
	ld a,[de]
	swap a
	rrca
	add a,c
	add a,l
	ld l,a
	jr nc,Unknown_0x10CA3
	inc h

Unknown_0x10CA3:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	call Unknown_0x2053
	call Unknown_0x20F9
	pop bc
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	or a
	jr z,Unknown_0x10CDC

Unknown_0x10CBD:
	ld e,a
	call Unknown_0x0647
	cp e
	jr c,Unknown_0x10CCC
	ld a,$01
	ld [$DD60],a
	xor a
	jr Unknown_0x10CD1

Unknown_0x10CCC:
	xor a
	ld [$DD60],a
	inc a

Unknown_0x10CD1:
	ld e,$27
	ld [de],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

Unknown_0x10CDC:
	ld a,[$DD60]
	or a
	jr nz,Unknown_0x10CE8
	ld a,[hli]
	or a
	jr z,Unknown_0x10CCC
	jr Unknown_0x10CBD

Unknown_0x10CE8:
	inc hl
	jr Unknown_0x10CCC
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	inc bc
	push bc
	ld c,l
	ld b,a
	call Unknown_0x0647
	and $02
	add a,c
	ld c,a
	jr nc,Unknown_0x10CFD
	inc b

Unknown_0x10CFD:
	call Unknown_0x1FD1
	pop bc
	ld hl,Unknown_0x105E1

Unknown_0x10D04:
	call Unknown_0x20BE
	call Unknown_0x20F9
	jp Unknown_0x2123

UnknownData_0x10D0D:
INCBIN "baserom.gb", $10D0D, $10D16 - $10D0D
	push bc
	ld h,$A8
	ld c,$0A

Unknown_0x10D1B:
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x10D39
	ld l,$48
	ld a,[hl]
	cp d
	jr nz,Unknown_0x10D39
	ld a,c
	ld [$FF00+$80],a
	ld e,$04
	ld bc,$48E4
	call Unknown_0x0849
	ld a,[$FF00+$9A]
	ld d,a
	ld a,[$FF00+$80]
	ld c,a

Unknown_0x10D39:
	dec c
	jr z,Unknown_0x10D3F
	inc h
	jr Unknown_0x10D1B

Unknown_0x10D3F:
	pop bc
	ret
	ld hl,$DD60
	inc [hl]
	ret
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	jr c,Unknown_0x10D5C
	cp $30
	jr c,Unknown_0x10D5C
	cp $70
	ret c
	ld a,$C0

Unknown_0x10D58:
	ld e,$45
	ld [de],a
	ret

Unknown_0x10D5C:
	ld a,$40
	jr Unknown_0x10D58

UnknownData_0x10D60:
INCBIN "baserom.gb", $10D60, $10D92 - $10D60

Unknown_0x10D92:
INCBIN "baserom.gb", $10D92, $10F5C - $10D92

Unknown_0x10F5C:
INCBIN "baserom.gb", $10F5C, $10F7B - $10F5C

Unknown_0x10F7B:
INCBIN "baserom.gb", $10F7B, $10FCA - $10F7B

Unknown_0x10FCA:
INCBIN "baserom.gb", $10FCA, $11054 - $10FCA

Unknown_0x11054:
INCBIN "baserom.gb", $11054, $110A8 - $11054
	ld e,$07
	ld a,[de]
	sub $01
	ld [de],a
	inc e
	ld a,[de]
	sbc a,$00
	ld [de],a
	ret

UnknownData_0x110B4:
INCBIN "baserom.gb", $110B4, $11216 - $110B4
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	ld bc,$4D68
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$4D76
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$4D68
	call Unknown_0x233C
	jr c,Unknown_0x11275
	ld e,$0D
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jr z,Unknown_0x11289
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,Unknown_0x10D92
	call Unknown_0x24B9
	or a
	jr nz,Unknown_0x1127D
	ld hl,$451E
	ld a,[hli]
	ld e,$12
	ld [de],a
	ld e,$39
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$52
	inc l
	ld [hl],$B4
	ret

Unknown_0x11275:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846

Unknown_0x1127D:
	bit 5,a
	ret z
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1EF9

Unknown_0x11289:
	ld e,$3F
	ld a,[de]
	or a
	jr nz,Unknown_0x112AC
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x1129C
	dec a
	ld [de],a
	ld e,$15
	xor a
	ld [de],a
	ret

Unknown_0x1129C:
	ld e,$3F
	ld a,$01
	ld [de],a
	ld a,$02
	ld e,$15
	ld [de],a
	ld hl,$4DDC
	jp Unknown_0x114E7

Unknown_0x112AC:
	ld e,$04
	ld bc,$4EA9
	jp Unknown_0x0846

UnknownData_0x112B4:
INCBIN "baserom.gb", $112B4, $112DB - $112B4
	ld bc,$4D68
	call Unknown_0x233C
	jr c,Unknown_0x1131D
	ld e,$0F
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jr nz,Unknown_0x112FB
	ld e,$04
	ld b,$10
	call Unknown_0x1F9C
	jr nc,Unknown_0x112FB
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a

Unknown_0x112FB:
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,Unknown_0x10D92
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x11315
	bit 5,a
	ret z
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x11315:
	ld e,$04
	ld bc,$4F11
	jp Unknown_0x0846

Unknown_0x1131D:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$4D68
	call Unknown_0x233C
	jr c,Unknown_0x11353
	ld e,$0F
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jr z,Unknown_0x1134B
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x10D92
	call Unknown_0x24CD
	bit 6,a
	ret z
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a

Unknown_0x1134B:
	ld e,$04
	ld bc,Unknown_0x10F7B
	jp Unknown_0x0846

Unknown_0x11353:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$4D68
	call Unknown_0x233C
	jr c,Unknown_0x11387
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x10D92
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$04
	ld bc,Unknown_0x10F5C
	jp Unknown_0x0846

Unknown_0x11387:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4D68
	call Unknown_0x233C
	jr c,Unknown_0x113B9
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x10D92
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x113B1
	bit 6,a
	ret z
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x113B1:
	ld e,$04
	ld bc,Unknown_0x10FCA
	jp Unknown_0x0846

Unknown_0x113B9:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4D68
	call Unknown_0x233C
	jr c,Unknown_0x113EF
	ld e,$0F
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	or c
	jr z,Unknown_0x113E7
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x10D92
	call Unknown_0x24CD
	bit 6,a
	ret z
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a

Unknown_0x113E7:
	ld e,$04
	ld bc,$5027
	jp Unknown_0x0846

Unknown_0x113EF:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$4D68
	call Unknown_0x233C
	jr c,Unknown_0x11416
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x10D92
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,Unknown_0x11054
	jp Unknown_0x0846

Unknown_0x11416:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4D96
	jp Unknown_0x255B
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4D96
	call Unknown_0x255B
	ret c
	call Unknown_0x19F3
	ld h,d
	or a
	jr z,Unknown_0x1144C
	bit 5,a
	jr nz,Unknown_0x1144C
	bit 4,a
	jr nz,Unknown_0x1144C
	ld l,$26
	dec [hl]
	ret nz
	ld e,$11
	xor a
	ld [de],a
	ret

Unknown_0x1144C:
	jp Unknown_0x0BBA
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$44AE
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 5,a
	jr z,Unknown_0x1146B
	ld e,$04
	ld bc,$516D
	jp Unknown_0x0846

Unknown_0x1146B:
	bit 7,a
	ret z
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x1148C
	ld hl,$4E46
	call Unknown_0x114E7
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$54
	inc l
	ld [hl],$96
	ret

Unknown_0x1148C:
	inc a
	ld [de],a
	ld hl,$4DE4
	ld a,$03
	jp Unknown_0x10C93

UnknownData_0x11496:
INCBIN "baserom.gb", $11496, $114B3 - $11496
	call Unknown_0x0DA4
	ld bc,$44AE
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0x114C7
	bit 5,a
	ret z

Unknown_0x114C7:
	ld e,$04
	ld bc,$5171
	jp Unknown_0x0846
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$4D96
	jp Unknown_0x255B
	ld bc,$44BC
	jp Unknown_0x255B
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc

Unknown_0x114E7:
	ld e,$5C
	ld a,[de]
	rlca
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x114F1
	inc h

Unknown_0x114F1:
	call Unknown_0x20F9
	call Unknown_0x2123
	ld e,$26
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x114FC:
INCBIN "baserom.gb", $114FC, $11505 - $114FC
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	bit 7,[hl]
	ld e,$15
	jr nz,Unknown_0x11515
	ld a,$08
	jr Unknown_0x11517

Unknown_0x11515:
	ld a,$02

Unknown_0x11517:
	ld [de],a
	ret
	ld e,$07

Unknown_0x1151B:
	ld a,[bc]
	inc bc
	push bc
	ld b,a
	call Unknown_0x1F9C
	pop bc
	ld e,$27
	jr c,Unknown_0x1152A
	xor a
	jr Unknown_0x1152C

Unknown_0x1152A:
	ld a,$01

Unknown_0x1152C:
	ld [de],a
	ret
	ld e,$04
	jp Unknown_0x1151B

UnknownData_0x11533:
INCBIN "baserom.gb", $11533, $1156B - $11533

Unknown_0x1156B:
INCBIN "baserom.gb", $1156B, $1169A - $1156B
	ld e,$26
	ld a,[de]
	dec a
	ld [de],a
	ld e,$27
	ld [de],a
	ret

UnknownData_0x116A3:
INCBIN "baserom.gb", $116A3, $1170F - $116A3

Unknown_0x1170F:
INCBIN "baserom.gb", $1170F, $11737 - $1170F

Unknown_0x11737:
INCBIN "baserom.gb", $11737, $1194B - $11737
	ld bc,$5533
	call Unknown_0x233C
	jr c,Unknown_0x11964
	ld bc,Unknown_0x1156B
	call Unknown_0x24A5
	bit 7,a
	ret nz
	ld e,$04
	ld bc,$7C4F
	jp Unknown_0x0846

Unknown_0x11964:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$5533
	call Unknown_0x233C
	jr c,Unknown_0x1199F
	call Unknown_0x0DA4
	ld bc,Unknown_0x1156B
	call Unknown_0x24B9
	bit 7,a
	jr z,Unknown_0x119A7
	bit 4,a
	jr nz,Unknown_0x1198F
	bit 5,a
	jr nz,Unknown_0x11997
	ld a,[$DD2C]
	bit 3,a
	ret z

Unknown_0x1198F:
	ld e,$04
	ld bc,Unknown_0x11737
	jp Unknown_0x0846

Unknown_0x11997:
	ld e,$04
	ld bc,Unknown_0x1170F
	jp Unknown_0x0846

Unknown_0x1199F:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846

Unknown_0x119A7:
	ld e,$04
	ld bc,$7C4F
	jp Unknown_0x0846
	ld bc,$5533
	call Unknown_0x233C
	jr c,Unknown_0x119CE
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,Unknown_0x1156B
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,$571F
	jp Unknown_0x0846

Unknown_0x119CE:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$5533
	call Unknown_0x233C
	jr c,Unknown_0x119FC
	ld l,$0D
	ld h,d
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x11A04
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,Unknown_0x1156B
	call Unknown_0x24A5
	bit 7,a
	ret nz
	ld e,$04
	ld bc,$7C4F
	jp Unknown_0x0846

Unknown_0x119FC:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846

Unknown_0x11A04:
	ld e,$04
	ld bc,Unknown_0x11737
	jp Unknown_0x0846
	ld bc,$5533
	call Unknown_0x233C
	jr c,Unknown_0x11A45
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x1156B
	call Unknown_0x24CD
	bit 7,a
	ret z
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ld e,$12
	ld [de],a
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$59
	inc l
	ld [hl],$4B
	ret

Unknown_0x11A45:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$554F
	jp Unknown_0x255B
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$554F
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$04
	ld bc,$593E
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$554F
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 5,a
	jr nz,Unknown_0x11AA8
	bit 7,a
	ret z
	ld l,$40
	ld h,d
	dec [hl]
	jr z,Unknown_0x11AA8
	ld l,$27
	inc [hl]
	ld hl,$55A3
	call Unknown_0x10C90
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x11AA8:
	ld e,$04
	ld bc,$593E
	jp Unknown_0x0846
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ld e,$45
	ld a,[de]
	jr c,Unknown_0x11AC7
	rlca
	jr c,Unknown_0x11ACA

Unknown_0x11AC3:
	ld a,$01
	jr Unknown_0x11ACB

Unknown_0x11AC7:
	rlca
	jr c,Unknown_0x11AC3

Unknown_0x11ACA:
	xor a

Unknown_0x11ACB:
	ld e,$27
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	inc bc
	push bc
	ld c,l
	ld b,a
	call Unknown_0x0647
	cp $56
	jr c,Unknown_0x11AE6
	cp $AB
	jr c,Unknown_0x11AE9
	ld a,$02
	jr Unknown_0x11AEB

Unknown_0x11AE6:
	xor a
	jr Unknown_0x11AEB

Unknown_0x11AE9:
	ld a,$01

Unknown_0x11AEB:
	rlca
	add a,c
	ld c,a
	jr nc,Unknown_0x11AF1
	inc b

Unknown_0x11AF1:
	call Unknown_0x1FD1
	pop bc
	ld hl,Unknown_0x105E1
	jp Unknown_0x10D04
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$00
	ld a,[hl]
	cp $FF
	ret z
	ld l,$5B
	ld a,[hl]
	cp $0E
	ret nz
	ld l,$3D
	ld a,[hl]
	or a
	ret z
	ld l,$4C
	ld a,[hl]
	or a
	ret z
	push bc
	ld e,$04
	ld bc,$5929
	call Unknown_0x0849
	pop bc
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$3F
	ld a,[bc]
	inc bc
	ld [hl],a
	ret

UnknownData_0x11B2A:
INCBIN "baserom.gb", $11B2A, $11B4D - $11B2A
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$555D
	jp Unknown_0x255B
	call Unknown_0x0647
	and $03
	ld hl,$5B76
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x11B6D
	inc h

Unknown_0x11B6D:
	call Unknown_0x20F9
	call Unknown_0x2123
	jp Unknown_0x20BE

UnknownData_0x11B76:
INCBIN "baserom.gb", $11B76, $11BAA - $11B76

Unknown_0x11BAA:
INCBIN "baserom.gb", $11BAA, $11BAE - $11BAA

Unknown_0x11BAE:
INCBIN "baserom.gb", $11BAE, $11C13 - $11BAE

Unknown_0x11C13:
INCBIN "baserom.gb", $11C13, $11C15 - $11C13

Unknown_0x11C15:
INCBIN "baserom.gb", $11C15, $11C17 - $11C15

Unknown_0x11C17:
INCBIN "baserom.gb", $11C17, $11D0A - $11C17

Unknown_0x11D0A:
INCBIN "baserom.gb", $11D0A, $11D4C - $11D0A

Unknown_0x11D4C:
INCBIN "baserom.gb", $11D4C, $11DF9 - $11D4C

Unknown_0x11DF9:
INCBIN "baserom.gb", $11DF9, $11E03 - $11DF9

Unknown_0x11E03:
INCBIN "baserom.gb", $11E03, $11E35 - $11E03

Unknown_0x11E35:
INCBIN "baserom.gb", $11E35, $11E4D - $11E35

Unknown_0x11E4D:
INCBIN "baserom.gb", $11E4D, $11F17 - $11E4D

Unknown_0x11F17:
INCBIN "baserom.gb", $11F17, $11F27 - $11F17
	ld bc,$5B8E
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$5B8E
	call Unknown_0x233C
	jr c,Unknown_0x11F6C
	call Unknown_0x0DA4
	ld bc,Unknown_0x11BAA
	call Unknown_0x24B9
	or a
	jr z,Unknown_0x11F5C
	bit 5,a
	jr nz,Unknown_0x11F64
	ld a,[$DD2C]
	bit 3,a
	ret z
	ld e,$04
	ld bc,Unknown_0x11D0A
	jp Unknown_0x0846

Unknown_0x11F5C:
	ld e,$04
	ld bc,$5D2A
	jp Unknown_0x0846

Unknown_0x11F64:
	ld e,$04
	ld bc,Unknown_0x11D4C
	jp Unknown_0x0846

Unknown_0x11F6C:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$5B8E
	call Unknown_0x233C
	jr c,Unknown_0x11FB4
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x11FAC
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x11BAA
	call Unknown_0x24CD
	bit 6,a
	jr nz,Unknown_0x11FA6
	bit 5,a
	ret z
	xor a
	ld l,$0D
	ld h,d
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld e,$04
	ld bc,$5DB9
	jp Unknown_0x0846

Unknown_0x11FA6:
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a

Unknown_0x11FAC:
	ld e,$04
	ld bc,$5D76
	jp Unknown_0x0846

Unknown_0x11FB4:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$5B8E
	call Unknown_0x233C
	jr c,Unknown_0x11FEF
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x11BAA
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x11FE7
	bit 5,a
	ret z
	xor a
	ld l,$0D
	ld h,d
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld e,$04
	ld bc,$5DB9
	jp Unknown_0x0846

Unknown_0x11FE7:
	ld e,$04
	ld bc,$5D8B
	jp Unknown_0x0846

Unknown_0x11FEF:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$5B8E
	call Unknown_0x233C
	jr c,Unknown_0x1202A
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x11BAA
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x12022
	bit 5,a
	ret z
	xor a
	ld l,$0D
	ld h,d
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld e,$04
	ld bc,$5DB9
	jp Unknown_0x0846

Unknown_0x12022:
	ld e,$04
	ld bc,$5D9C
	jp Unknown_0x0846

Unknown_0x1202A:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x1204E
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$5B8E
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846

Unknown_0x1204E:
	ld e,$04
	ld bc,$5DAD
	jp Unknown_0x0846

UnknownData_0x12056:
INCBIN "baserom.gb", $12056, $1207D - $12056
	ld bc,$5B8E
	call Unknown_0x233C
	jr c,Unknown_0x120BD
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x11BAA
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	ld l,$3F
	dec [hl]
	jr z,Unknown_0x120AF
	ld e,$04
	ld bc,Unknown_0x11DF9
	jp Unknown_0x0846

Unknown_0x120AF:
	ld l,$40
	dec [hl]
	dec l
	ld [hl],$01
	ld e,$04
	ld bc,Unknown_0x11E03
	jp Unknown_0x0846

Unknown_0x120BD:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$5B8E
	call Unknown_0x233C
	jr c,Unknown_0x120EB
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x120E3
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x11BAA
	call Unknown_0x24CD
	bit 5,a
	ret z

Unknown_0x120E3:
	ld e,$04
	ld bc,Unknown_0x11E35
	jp Unknown_0x0846

Unknown_0x120EB:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$5B8E
	call Unknown_0x233C
	jr c,Unknown_0x12112
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,Unknown_0x11BAA
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,Unknown_0x11E4D
	jp Unknown_0x0846

Unknown_0x12112:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$44AE
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x11BAE
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x1213F
	bit 5,a
	ret z
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ld e,$40
	inc a
	ld [de],a
	ret

Unknown_0x1213F:
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	ld l,$40
	dec [hl]
	jr z,Unknown_0x1215B
	ld l,$27
	inc [hl]
	ld hl,$5C22
	jp Unknown_0x12193

Unknown_0x1215B:
	ld e,$04
	ld bc,Unknown_0x11F17
	jp Unknown_0x0846
	ld bc,$44AE
	jp Unknown_0x255B
	push bc
	ld b,$20
	ld e,$04
	call Unknown_0x1F9C
	jr c,Unknown_0x12181
	ld b,$31
	ld e,$04
	call Unknown_0x1F9C
	jr c,Unknown_0x12186
	ld hl,Unknown_0x11C17
	jr Unknown_0x12189

Unknown_0x12181:
	ld hl,Unknown_0x11C13
	jr Unknown_0x12189

Unknown_0x12186:
	ld hl,Unknown_0x11C15

Unknown_0x12189:
	pop bc
	jp Unknown_0x20F9
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc

Unknown_0x12193:
	ld e,$27
	ld a,[de]
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x1219F
	inc h

Unknown_0x1219F:
	call Unknown_0x20F9
	jp Unknown_0x20BE

UnknownData_0x121A5:
INCBIN "baserom.gb", $121A5, $121EB - $121A5

Unknown_0x121EB:
INCBIN "baserom.gb", $121EB, $121EF - $121EB

Unknown_0x121EF:
INCBIN "baserom.gb", $121EF, $121F3 - $121EF

Unknown_0x121F3:
INCBIN "baserom.gb", $121F3, $12353 - $121F3

Unknown_0x12353:
INCBIN "baserom.gb", $12353, $12361 - $12353

Unknown_0x12361:
INCBIN "baserom.gb", $12361, $123B6 - $12361

Unknown_0x123B6:
INCBIN "baserom.gb", $123B6, $123E4 - $123B6

Unknown_0x123E4:
INCBIN "baserom.gb", $123E4, $12435 - $123E4

Unknown_0x12435:
INCBIN "baserom.gb", $12435, $1261A - $12435

Unknown_0x1261A:
INCBIN "baserom.gb", $1261A, $1275A - $1261A

Unknown_0x1275A:
INCBIN "baserom.gb", $1275A, $1276E - $1275A

Unknown_0x1276E:
INCBIN "baserom.gb", $1276E, $127EE - $1276E

Unknown_0x127EE:
INCBIN "baserom.gb", $127EE, $1282C - $127EE
	ld bc,$61A5
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x12850
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x12858
	call Unknown_0x1ED3
	jp Unknown_0x0DA4

Unknown_0x12850:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846

Unknown_0x12858:
	ld e,$04
	ld bc,Unknown_0x12353
	jp Unknown_0x0846
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x1288C
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x121EB
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$22
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$04
	ld bc,Unknown_0x12361
	jp Unknown_0x0846

Unknown_0x1288C:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x128A9
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x128B1
	call Unknown_0x1ED3
	jp Unknown_0x0DA4

Unknown_0x128A9:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846

Unknown_0x128B1:
	ld e,$04
	ld bc,Unknown_0x123B6
	jp Unknown_0x0846
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x128E5
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x121EB
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$22
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$04
	ld bc,Unknown_0x123E4
	jp Unknown_0x0846

Unknown_0x128E5:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x12919
	ld bc,Unknown_0x121EB
	call Unknown_0x24A5
	or a
	jr z,Unknown_0x12911
	ld b,$40
	ld e,$04
	call Unknown_0x1F9C
	ret nz
	ld e,$04
	ld bc,Unknown_0x12435
	jp Unknown_0x0846

Unknown_0x12911:
	ld e,$04
	ld bc,$647B
	jp Unknown_0x0846

Unknown_0x12919:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846

UnknownData_0x12921:
INCBIN "baserom.gb", $12921, $12955 - $12921
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x12973
	ld bc,Unknown_0x121EB
	call Unknown_0x24A5
	or a
	ret nz
	ld e,$04
	ld bc,$6487
	jp Unknown_0x0846

Unknown_0x12973:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846

UnknownData_0x1297B:
INCBIN "baserom.gb", $1297B, $129AF - $1297B
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x129DF
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x121EB
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$22
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$68
	inc l
	ld [hl],$2C
	ret

Unknown_0x129DF:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x12A05
	ld bc,Unknown_0x121EB
	call Unknown_0x24A5
	or a
	ret nz
	ld e,$04
	ld bc,$6561
	jp Unknown_0x0846

Unknown_0x12A05:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846

UnknownData_0x12A0D:
INCBIN "baserom.gb", $12A0D, $12A41 - $12A0D
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x12A68
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,Unknown_0x121EB
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$0D
	call Unknown_0x0F7A
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$04
	ld bc,Unknown_0x1261A
	jp Unknown_0x0846

Unknown_0x12A68:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$61A5
	call Unknown_0x233C
	jr c,Unknown_0x12A8F
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x121EB
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,$6696
	jp Unknown_0x0846

Unknown_0x12A8F:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$61C1
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x121EF
	call Unknown_0x24CD
	or a
	ret z
	ld e,$04
	ld bc,Unknown_0x1276E
	jp Unknown_0x0846
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$61C1
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x121EF
	call Unknown_0x24CD
	or a
	ret z
	ld e,$04
	ld bc,Unknown_0x1275A
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$61C1
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x121EF
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x12AF6
	bit 5,a
	ret z
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ld e,$27
	inc a
	ld [de],a
	ret

Unknown_0x12AF6:
	ld e,$27
	ld a,[de]
	inc a
	cp $02
	jr z,Unknown_0x12B05
	ld [de],a
	ld hl,$62A1
	jp Unknown_0x12193

Unknown_0x12B05:
	ld e,$04
	ld bc,Unknown_0x1276E
	jp Unknown_0x0846
	ld bc,$61C1
	call Unknown_0x255B
	ret c
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x12B1D
	dec a
	ld [de],a
	ret

Unknown_0x12B1D:
	ld e,$47
	ld a,[de]
	xor $10
	ld [de],a
	ld e,$40
	ld a,[de]
	ld e,$26
	ld [de],a
	ret
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$61CF
	jp Unknown_0x255B
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$61DD
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x121F3
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x12B5B
	bit 5,a
	ret z
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	inc a
	ld e,$40
	ld [de],a
	ret

Unknown_0x12B5B:
	ld e,$41
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld l,$40
	ld h,d
	dec [hl]
	jr nz,Unknown_0x12B76
	ld e,$04
	ld bc,Unknown_0x127EE
	jp Unknown_0x0846

Unknown_0x12B76:
	ld l,$0F
	ld h,d
	ld [hl],$00
	inc l
	ld [hl],$FE
	ret
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x12B92
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$61DD
	jp Unknown_0x255B

Unknown_0x12B92:
	ld h,d
	jp Unknown_0x0BBA
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0x12BA1
	ld hl,$6287
	jr Unknown_0x12BA4

Unknown_0x12BA1:
	ld hl,$6291

Unknown_0x12BA4:
	ld e,$3B
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	push bc
	ld e,$3B
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld b,h
	ld c,l
	ld hl,$DB51
	ld e,$04
	ld a,[bc]
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,[hl]
	adc a,$00
	ld [de],a
	inc bc
	ld hl,$DB53
	ld e,$07
	ld a,[bc]
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,[hl]
	adc a,$00
	ld [de],a
	inc bc
	ld e,$3B
	ld a,c
	ld [de],a
	inc e
	ld a,b
	ld [de],a
	pop bc
	ret
	push bc
	call Unknown_0x0647
	ld c,$00
	ld b,$34

Unknown_0x12BE5:
	sub b
	jr c,Unknown_0x12BEB
	inc c
	jr Unknown_0x12BE5

Unknown_0x12BEB:
	ld a,c

Unknown_0x12BEC:
	ld [$FF00+$80],a
	ld hl,$6282
	add a,l
	ld l,a
	jr nc,Unknown_0x12BF6
	inc h

Unknown_0x12BF6:
	ld b,$00
	ld d,b
	ld a,[hl]
	ld hl,$DB51
	add a,[hl]
	ld c,a
	inc hl
	ld a,b
	adc a,[hl]
	ld b,a
	ld a,$70
	ld hl,$DB53
	add a,[hl]
	ld e,a
	inc hl
	ld a,d
	adc a,[hl]
	ld d,a
	push bc
	call Unknown_0x1646
	pop bc
	cp $00
	jr nz,Unknown_0x12C22
	ld a,[$FF00+$80]
	inc a
	cp $05
	jr c,Unknown_0x12BEC
	sub $05
	jr Unknown_0x12BEC

Unknown_0x12C22:
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$04
	ld a,c
	ld [de],a
	pop bc
	ret

UnknownData_0x12C2B:
INCBIN "baserom.gb", $12C2B, $12C55 - $12C2B

Unknown_0x12C55:
INCBIN "baserom.gb", $12C55, $12C59 - $12C55

Unknown_0x12C59:
INCBIN "baserom.gb", $12C59, $12D1B - $12C59
	xor a
	ld [$DD5D],a
	ret
	xor a
	ld hl,$DD5E
	ld [hli],a
	ld [hl],a
	ret

UnknownData_0x12D27:
INCBIN "baserom.gb", $12D27, $1306F - $12D27
	ld bc,$6C2B
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$6C2B
	call Unknown_0x233C
	jr c,Unknown_0x130AE
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x12C55
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$22
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$70
	inc l
	ld [hl],$6F
	ret

Unknown_0x130AE:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$6C2B
	call Unknown_0x233C
	jr c,Unknown_0x130FD
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr nz,Unknown_0x130C9
	ld l,$15
	ld [hl],$00

Unknown_0x130C9:
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x12C55
	call Unknown_0x24CD
	bit 6,a
	jr z,Unknown_0x130E1
	ld h,d
	ld l,$0F
	ld [hl],$00
	inc l
	ld [hl],$00

Unknown_0x130E1:
	bit 7,a
	ret z
	ld e,$22
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	ld l,$27
	dec [hl]
	ld e,$04
	ld bc,$6D49
	jp Unknown_0x0846

Unknown_0x130FD:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$6C2B
	call Unknown_0x233C
	jr c,Unknown_0x13128
	call Unknown_0x1ED3
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,Unknown_0x12C55
	call Unknown_0x24CD
	bit 5,a
	ret z
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1EF9

Unknown_0x13128:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$6C2B
	call Unknown_0x233C
	jr c,Unknown_0x13150
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x12C55
	call Unknown_0x24CD
	bit 5,a
	ret z
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1EF9

Unknown_0x13150:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	ld bc,$6C2B
	call Unknown_0x233C
	jr nc,Unknown_0x13168
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846

Unknown_0x13168:
	call Unknown_0x21C5
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,Unknown_0x12C55
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x13187
	bit 5,a
	ret z
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1EF9

Unknown_0x13187:
	ld e,$22
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$40
	ld a,[de]
	cp $01
	jr c,Unknown_0x131AD
	jr z,Unknown_0x131A5
	ld e,$04
	ld bc,$6FEB
	jp Unknown_0x0846

Unknown_0x131A5:
	ld e,$04
	ld bc,$6F80
	jp Unknown_0x0846

Unknown_0x131AD:
	ld e,$04
	ld bc,$6E92
	jp Unknown_0x0846
	ld bc,$6C2B
	call Unknown_0x233C
	jr c,Unknown_0x131E3
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x131DB
	ld bc,Unknown_0x12C55
	call Unknown_0x24CD
	bit 6,a
	ret z
	ld h,d
	ld l,$0F
	ld [hl],$00
	inc l
	ld [hl],$00

Unknown_0x131DB:
	ld e,$04
	ld bc,$6EE8
	jp Unknown_0x0846

Unknown_0x131E3:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$6C2B
	call Unknown_0x233C
	jr nc,Unknown_0x131FB
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846

Unknown_0x131FB:
	call Unknown_0x21D8
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,Unknown_0x12C55
	call Unknown_0x24CD
	bit 5,a
	jr z,Unknown_0x13221
	ld e,$3B
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a

Unknown_0x13221:
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld [hl],$08
	call Unknown_0x203D
	ld e,$3C
	ld a,[de]
	jr nc,Unknown_0x13235
	rlca
	jr nc,Unknown_0x13261
	jr Unknown_0x13238

Unknown_0x13235:
	rlca
	jr c,Unknown_0x13261

Unknown_0x13238:
	ld h,d
	ld l,$3F
	bit 0,[hl]
	jr nz,Unknown_0x13247
	set 0,[hl]
	ld l,$11
	ld [hl],$00
	jr Unknown_0x13261

Unknown_0x13247:
	res 0,[hl]
	ld l,$11
	ld e,$41
	ld a,[de]
	ld [hl],a
	ld l,$3B
	ld a,[hl]
	cpl
	add a,$01
	ld [hli],a
	ld a,[hl]
	cpl
	adc a,$00
	ld [hl],a
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a

Unknown_0x13261:
	call Unknown_0x202B
	ld e,$3A
	ld a,[de]
	jr nc,Unknown_0x1326D
	rlca
	ret nc
	jr Unknown_0x1326F

Unknown_0x1326D:
	rlca
	ret c

Unknown_0x1326F:
	ld h,d
	ld l,$3F
	bit 1,[hl]
	jr nz,Unknown_0x1327D
	set 1,[hl]
	ld l,$12
	ld [hl],$00
	ret

Unknown_0x1327D:
	res 1,[hl]
	ld l,$12
	ld e,$41
	ld a,[de]
	ld [hl],a
	ld l,$39
	ld a,[hl]
	cpl
	add a,$01
	ld [hli],a
	ld a,[hl]
	cpl
	adc a,$00
	ld [hl],a
	ret
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$6C47
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x12C59
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x132B4
	bit 5,a
	ret z
	ld e,$11
	ld a,[de]
	cpl
	inc a
	jp Unknown_0x1EF9

Unknown_0x132B4:
	ld h,d
	ld l,$40
	dec [hl]
	jr z,Unknown_0x132C0
	ld l,$3F
	inc [hl]
	jp Unknown_0x132CE

Unknown_0x132C0:
	ld e,$04
	ld bc,$7062
	jp Unknown_0x0846

UnknownData_0x132C8:
INCBIN "baserom.gb", $132C8, $132CE - $132C8

Unknown_0x132CE:
	ld e,$3F
	ld a,[de]
	rlca
	ld e,a
	rlca
	rlca
	add a,e
	ld l,a
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld hl,$6CB0
	add a,l
	ld l,a
	jr nc,Unknown_0x132E7
	inc h

Unknown_0x132E7:
	call Unknown_0x20F9
	jp Unknown_0x20BE

UnknownData_0x132ED:
INCBIN "baserom.gb", $132ED, $13307 - $132ED
	ld hl,$DD5D
	ld a,[hl]
	inc a
	and $01
	ld [hl],a
	ret nz
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	call Unknown_0x0DA4
	ld bc,Unknown_0x1332B
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,Unknown_0x13335
	jp Unknown_0x0846

Unknown_0x1332B:
INCBIN "baserom.gb", $1332B, $13335 - $1332B

Unknown_0x13335:
INCBIN "baserom.gb", $13335, $1336A - $13335
	ld bc,Unknown_0x13376
	call Unknown_0x24E8
	ld bc,$6C47
	jp Unknown_0x255B

Unknown_0x13376:
INCBIN "baserom.gb", $13376, $13378 - $13376
	ld bc,Unknown_0x13384
	call Unknown_0x24E8
	ld bc,$6C47
	jp Unknown_0x255B

Unknown_0x13384:
INCBIN "baserom.gb", $13384, $13386 - $13384
	ld hl,$DD5E
	ld a,[hl]
	or a
	jr z,Unknown_0x1338E
	inc hl

Unknown_0x1338E:
	ld [hl],d
	ret

UnknownData_0x13390:
INCBIN "baserom.gb", $13390, $133A4 - $13390
	ld bc,Unknown_0x133B0
	call Unknown_0x24E8
	ld bc,$6C47
	jp Unknown_0x255B

Unknown_0x133B0:
INCBIN "baserom.gb", $133B0, $133B2 - $133B0
	push bc
	ld hl,$DD5E
	ld a,[hl]
	or a
	jr z,Unknown_0x133C7
	ld [hl],$00
	ld h,a
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x133C7
	call Unknown_0x0BBA

Unknown_0x133C7:
	ld hl,$DD5F
	ld a,[hl]
	or a
	jr z,Unknown_0x133DB
	ld [hl],$00
	ld h,a
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x133DB
	call Unknown_0x0BBA

Unknown_0x133DB:
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

UnknownData_0x133E0:
INCBIN "baserom.gb", $133E0, $1340A - $133E0

Unknown_0x1340A:
INCBIN "baserom.gb", $1340A, $1340E - $1340A

Unknown_0x1340E:
INCBIN "baserom.gb", $1340E, $13452 - $1340E

Unknown_0x13452:
INCBIN "baserom.gb", $13452, $1345C - $13452

Unknown_0x1345C:
INCBIN "baserom.gb", $1345C, $1357E - $1345C

Unknown_0x1357E:
INCBIN "baserom.gb", $1357E, $1368D - $1357E

Unknown_0x1368D:
INCBIN "baserom.gb", $1368D, $13753 - $1368D

Unknown_0x13753:
INCBIN "baserom.gb", $13753, $137D8 - $13753
	ld bc,$73E0
	jp Unknown_0x255B
	ld bc,$73E0
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ld bc,Unknown_0x1340A
	call Unknown_0x24A5
	bit 5,a
	ret z
	ld h,d
	ld l,$43
	set 7,[hl]
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	add a,[hl]
	cp $65
	jr nc,Unknown_0x1383C
	cp $1B
	jr c,Unknown_0x13818
	call Unknown_0x202B
	jr nc,Unknown_0x1383C

Unknown_0x13818:
	ld h,d
	ld l,$43
	ld e,$45
	ld a,[de]
	res 0,[hl]
	rlca
	jr c,Unknown_0x13847

Unknown_0x13823:
	ld e,$0F
	ld h,d
	ld l,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hld]
	ld [de],a

Unknown_0x1382D:
	xor a
	ld [hli],a
	ld [hl],a
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$78
	inc l
	ld [hl],$59
	ret

Unknown_0x1383C:
	ld h,d
	ld l,$43
	ld e,$45
	ld a,[de]
	set 0,[hl]
	rlca
	jr c,Unknown_0x13823

Unknown_0x13847:
	ld e,$0F
	ld h,d
	ld l,$0D
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hld]
	cpl
	adc a,$00
	ld [de],a
	jr Unknown_0x1382D
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ld bc,Unknown_0x1340A
	call Unknown_0x24CD
	bit 6,a
	jp nz,Unknown_0x1387F
	bit 7,a
	jr nz,Unknown_0x1387F
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	add a,[hl]
	cp $1B
	jr c,Unknown_0x1387F
	cp $65
	ret c

Unknown_0x1387F:
	ld h,d
	ld l,$43
	res 7,[hl]
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	add a,[hl]
	cp $1C
	jr c,Unknown_0x1389E
	cp $84
	jr nc,Unknown_0x138C2
	call Unknown_0x1EC0
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0x138C7
	jr Unknown_0x138A3

Unknown_0x1389E:
	ld e,$45
	ld a,$40
	ld [de],a

Unknown_0x138A3:
	ld e,$43
	ld a,[de]
	rrca
	jr c,Unknown_0x138CD

Unknown_0x138A9:
	ld e,$0D
	ld h,d
	ld l,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hld]
	ld [de],a

Unknown_0x138B3:
	xor a
	ld [hli],a
	ld [hl],a
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$77
	inc l
	ld [hl],$ED
	ret

Unknown_0x138C2:
	ld e,$45
	ld a,$C0
	ld [de],a

Unknown_0x138C7:
	ld e,$43
	ld a,[de]
	rrca
	jr c,Unknown_0x138A9

Unknown_0x138CD:
	ld e,$0D
	ld h,d
	ld l,$0F
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hld]
	cpl
	adc a,$00
	ld [de],a
	jr Unknown_0x138B3
	call Unknown_0x21D8
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ld bc,Unknown_0x1340A
	call Unknown_0x24CD
	ld l,$26
	ld h,d
	dec [hl]
	ret nz
	ld [hl],$10
	ld l,$40
	dec [hl]
	jr z,Unknown_0x1391B
	ld b,$08
	ld e,$07
	call Unknown_0x1F9C
	jr nc,Unknown_0x13923
	ld b,$40
	ld e,$04
	call Unknown_0x1F9C
	jr nc,Unknown_0x13923
	ld b,$30
	ld e,$04
	call Unknown_0x1F9C
	jr c,Unknown_0x13923

Unknown_0x1391B:
	ld e,$04
	ld bc,Unknown_0x1357E
	jp Unknown_0x0846

Unknown_0x13923:
	ld e,$45
	ld a,[de]
	ld [$FF00+$80],a
	ld e,$43
	ld a,[de]
	ld [$FF00+$81],a
	call Unknown_0x13B74
	ld e,$45
	ld a,[de]
	ld hl,$FF80
	cp [hl]
	jr z,Unknown_0x13961
	ld h,d
	ld l,$3F
	bit 0,[hl]
	jr nz,Unknown_0x1394D
	set 0,[hl]
	ld l,$11
	ld [hl],$00
	ld e,$45
	ld a,[$FF00+$80]
	ld [de],a
	jr Unknown_0x13961

Unknown_0x1394D:
	res 0,[hl]
	ld l,$11
	ld e,$41
	ld a,[de]
	ld [hl],a
	ld l,$3B
	ld a,[hl]
	cpl
	add a,$01
	ld [hli],a
	ld a,[hl]
	cpl
	adc a,$00
	ld [hl],a

Unknown_0x13961:
	call Unknown_0x202B
	ld e,$3A
	ld a,[de]
	jr nc,Unknown_0x1396D
	rlca
	ret nc
	jr Unknown_0x1396F

Unknown_0x1396D:
	rlca
	ret c

Unknown_0x1396F:
	ld h,d
	ld l,$3F
	bit 1,[hl]
	jr nz,Unknown_0x1397D
	set 1,[hl]
	ld l,$12
	ld [hl],$00
	ret

Unknown_0x1397D:
	res 1,[hl]
	ld l,$12
	ld e,$41
	ld a,[de]
	ld [hl],a
	ld l,$39
	ld a,[hl]
	cpl
	add a,$01
	ld [hli],a
	ld a,[hl]
	cpl
	adc a,$00
	ld [hl],a
	ret
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x1340A
	jp Unknown_0x24CD
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x233C
	jr c,Unknown_0x139B9
	ld bc,Unknown_0x1340A
	jp Unknown_0x24CD

Unknown_0x139B9:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	ld bc,$73E0
	call Unknown_0x233C
	jr c,Unknown_0x139EF
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,Unknown_0x1340A
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x139E3
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	add a,[hl]
	cp $65
	ret c

Unknown_0x139E3:
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$77
	inc l
	ld [hl],$DE
	ret

Unknown_0x139EF:
	ld e,$04
	ld bc,$7CD9
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ld bc,Unknown_0x1340A
	call Unknown_0x24CD
	bit 5,a
	ret z
	ld h,d
	ld l,$1F
	ld [hl],$44
	inc l
	ld [hl],$77
	inc l
	ld [hl],$D8
	ret
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ld bc,Unknown_0x1340A
	call Unknown_0x24CD
	bit 5,a
	ret z
	ld e,$04
	ld bc,$768D
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ld bc,Unknown_0x1340A
	call Unknown_0x24CD
	bit 5,a
	jr nz,Unknown_0x13A56
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	ret nz
	ld e,$04
	ld bc,$7678
	jp Unknown_0x0846

Unknown_0x13A56:
	ld e,$04
	ld bc,Unknown_0x1368D
	jp Unknown_0x0846
	ld bc,$73E0
	call Unknown_0x233C
	jr c,Unknown_0x13A8C
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x1340A
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld h,d
	ld l,$40
	dec [hl]
	jr z,Unknown_0x13A84
	ld hl,Unknown_0x13452
	call Unknown_0x20F9
	jp Unknown_0x20BE

Unknown_0x13A84:
	ld e,$04
	ld bc,$76BB
	jp Unknown_0x0846

Unknown_0x13A8C:
	ld e,$04
	ld bc,Unknown_0x13CD9
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$73E0
	call Unknown_0x255B
	ld bc,Unknown_0x1340A
	jp Unknown_0x24A5
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$73FC
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x1340E
	call Unknown_0x24CD
	bit 5,a
	ret z
	ld e,$04
	ld bc,Unknown_0x13753
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$73FC
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld l,$40
	ld h,d
	dec [hl]
	jr z,Unknown_0x13AE3
	ld hl,Unknown_0x1345C
	call Unknown_0x20F9
	jp Unknown_0x20BE

Unknown_0x13AE3:
	ld e,$04
	ld bc,$7774
	jp Unknown_0x0846
	ld bc,$73FC
	jp Unknown_0x255B
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$73FC
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x1340E
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,$77A5
	jp Unknown_0x0846

UnknownData_0x13B0F:
INCBIN "baserom.gb", $13B0F, $13B2A - $13B0F
	call Unknown_0x202B
	ld l,$43
	ld h,d
	jr nc,Unknown_0x13B35
	res 0,[hl]
	ret

Unknown_0x13B35:
	set 0,[hl]
	ret
	ld h,d
	ld l,$43
	set 7,[hl]
	ret
	ld h,d
	ld l,$43
	res 7,[hl]
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$43
	ld a,[de]
	rlca
	jp nc,Unknown_0x20F0
	ld e,$5C
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x13B5A
	inc h

Unknown_0x13B5A:
	ld e,$43
	ld a,[de]
	rrca
	ld e,$0F
	jr c,Unknown_0x13B68
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

Unknown_0x13B68:
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0x13B74:
	push bc
	ld h,$A0
	ld l,$04
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0x13BAD
	ld a,[hli]
	sub $30
	ld c,a
	ld a,[hl]
	sbc a,$00
	jr c,Unknown_0x13BCC
	ld b,a
	ld a,c
	ld hl,$DB51
	sub [hl]
	ld e,a
	inc hl
	ld a,b
	sbc a,[hl]
	jr c,Unknown_0x13BCC
	ld a,e
	cp $1C
	jr c,Unknown_0x13BCC

Unknown_0x13B99:
	ld e,$04
	ld a,[de]
	sub c
	inc e
	ld a,[de]
	sbc a,b
	jr nc,Unknown_0x13BA6
	ld a,$40
	jr Unknown_0x13BA8

Unknown_0x13BA6:
	ld a,$C0

Unknown_0x13BA8:
	ld e,$45
	ld [de],a
	pop bc
	ret

Unknown_0x13BAD:
	ld a,[hli]
	add a,$30
	ld c,a
	ld a,[hl]
	adc a,$00
	ld b,a
	ld a,c
	ld hl,$DB51
	sub [hl]
	cp $64
	jr c,Unknown_0x13B99
	ld h,$A0
	ld l,$04
	ld a,[hli]
	sub $30
	ld c,a
	ld a,[hl]
	sbc a,$00
	ld b,a
	jr Unknown_0x13B99

Unknown_0x13BCC:
	ld h,$A0
	ld l,$04
	ld a,[hli]
	add a,$30
	ld c,a
	ld a,[hl]
	adc a,$00
	ld b,a
	jr Unknown_0x13B99
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,[hli]
	ld e,$11
	ld [de],a
	inc e
	ld [de],a
	ld e,$41
	ld [de],a
	ld e,$45
	ld a,[de]
	rlca
	ld e,$3B
	jr c,Unknown_0x13BF8
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hld]
	ld [de],a
	jr Unknown_0x13C03

Unknown_0x13BF8:
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hld]
	cpl
	adc a,$00
	ld [de],a

Unknown_0x13C03:
	ld e,$43
	ld a,[de]
	rrca
	ld e,$39
	jr c,Unknown_0x13C12
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	jr Unknown_0x13C1D

Unknown_0x13C12:
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a

Unknown_0x13C1D:
	ld e,$5C
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0x13C25
	inc h

Unknown_0x13C25:
	ld e,$40
	ld a,[hl]
	ld [de],a
	xor a
	dec e
	ld [de],a
	ret

UnknownData_0x13C2D:
INCBIN "baserom.gb", $13C2D, $13C7E - $13C2D

Unknown_0x13C7E:
INCBIN "baserom.gb", $13C7E, $13C91 - $13C7E

Unknown_0x13C91:
INCBIN "baserom.gb", $13C91, $13CD9 - $13C91

Unknown_0x13CD9:
INCBIN "baserom.gb", $13CD9, $13DE3 - $13CD9

Unknown_0x13DE3:
	ld e,$5B
	ld a,[de]
	rlca
	ld hl,$7E00
	add a,l
	ld l,a
	jr nc,Unknown_0x13DEF
	inc h

Unknown_0x13DEF:
	ld a,[hli]
	ld c,a
	ld b,[hl]
	call Unknown_0x233C
	ret nc
	ld e,$04
	ld bc,Unknown_0x13CD9
	call Unknown_0x0846
	scf
	ret

UnknownData_0x13E00:
INCBIN "baserom.gb", $13E00, $13E0E - $13E00
	call Unknown_0x13DE3
	ret c
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld e,$5B
	ld a,[de]
	ld hl,$7E35
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x13E24
	inc h

Unknown_0x13E24:
	ld a,[hli]
	ld b,[hl]
	ld c,a
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,Unknown_0x13C91
	jp Unknown_0x0846

UnknownData_0x13E35:
INCBIN "baserom.gb", $13E35, $13E43 - $13E35
	call Unknown_0x13E78
	ret c
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld e,$5B
	ld a,[de]
	ld hl,$7E6A
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x13E59
	inc h

Unknown_0x13E59:
	ld a,[hli]
	ld b,[hl]
	ld c,a
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$04
	ld bc,$7D74
	jp Unknown_0x0846

UnknownData_0x13E6A:
INCBIN "baserom.gb", $13E6A, $13E78 - $13E6A

Unknown_0x13E78:
	ld e,$5B
	ld a,[de]
	rlca
	ld hl,$7E99
	add a,l
	ld l,a
	jr nc,Unknown_0x13E84
	inc h

Unknown_0x13E84:
	ld a,[hli]
	ld c,a
	ld b,[hl]
	call Unknown_0x255B
	ret c
	ld a,[$DD2C]
	bit 3,a
	ret z
	ld e,$03
	ld bc,$4E33
	jp Unknown_0x0846

UnknownData_0x13E99:
INCBIN "baserom.gb", $13E99, $13EA7 - $13E99
	ld a,d
	ld [$DD61],a
	ret
	push bc
	ld e,$5B
	ld a,[de]
	ld hl,$7EC6
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x13EB9
	inc h

Unknown_0x13EB9:
	ld a,[hli]
	ld b,[hl]
	ld c,a
	call Unknown_0x2491
	and $80
	ld e,$27
	ld [de],a
	pop bc
	ret

UnknownData_0x13EC6:
INCBIN "baserom.gb", $13EC6, $13ED4 - $13EC6
	ld e,$5B
	ld a,[de]
	rlca
	ld hl,$7EE8
	add a,l
	ld l,a
	jr nc,Unknown_0x13EE0
	inc h

Unknown_0x13EE0:
	ld e,$5E
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

UnknownData_0x13EE8:
INCBIN "baserom.gb", $13EE8, $13EF6 - $13EE8
	xor a
	ld [$DD60],a
	ret

UnknownData_0x13EFB:
INCBIN "baserom.gb", $13EFB, $14000 - $13EFB

SECTION "Bank05", ROMX, BANK[$05]

UnknownData_0x14000:
INCBIN "baserom.gb", $14000, $14038 - $14000

Unknown_0x14038:
INCBIN "baserom.gb", $14038, $1403C - $14038

Unknown_0x1403C:
INCBIN "baserom.gb", $1403C, $14066 - $1403C

Unknown_0x14066:
INCBIN "baserom.gb", $14066, $1411C - $14066

Unknown_0x1411C:
INCBIN "baserom.gb", $1411C, $1418B - $1411C

Unknown_0x1418B:
INCBIN "baserom.gb", $1418B, $141EF - $1418B

Unknown_0x141EF:
INCBIN "baserom.gb", $141EF, $14299 - $141EF

Unknown_0x14299:
INCBIN "baserom.gb", $14299, $1429A - $14299

Unknown_0x1429A:
INCBIN "baserom.gb", $1429A, $142B9 - $1429A
	ld hl,$4CE4
	ld a,$03
	call Unknown_0x05CF
	ret

UnknownData_0x142C2:
INCBIN "baserom.gb", $142C2, $14383 - $142C2
	ld bc,$402A
	jp Unknown_0x255B

UnknownData_0x14389:
INCBIN "baserom.gb", $14389, $1443E - $14389
	ld hl,$4458
	ld e,$27
	ld a,[de]
	cp $70
	jr c,Unknown_0x14453
	inc hl
	cp $A0
	jr c,Unknown_0x14453
	inc hl
	cp $D0
	jr c,Unknown_0x14453
	inc hl

Unknown_0x14453:
	ld a,[hl]
	ld e,$24
	ld [de],a
	ret

UnknownData_0x14458:
INCBIN "baserom.gb", $14458, $1445C - $14458
	call Unknown_0x0647
	and $03
	ld hl,$446E
	add a,l
	ld l,a
	jr nc,Unknown_0x14469
	inc h

Unknown_0x14469:
	ld a,[hl]
	ld e,$24
	ld [de],a
	ret

UnknownData_0x1446E:
INCBIN "baserom.gb", $1446E, $144AB - $1446E
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$400E
	jp Unknown_0x255B
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x144E5
	ld l,$26
	ld h,d
	dec [hl]
	ret nz
	ld h,d
	ld l,$1F
	ld [hl],$45
	inc l
	ld [hl],$44
	inc l
	ld [hl],$B7
	ret

Unknown_0x144E5:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x1451D
	ld e,$04
	ld a,[de]
	ld l,$3F
	ld h,d
	cp [hl]
	ret nz
	call Unknown_0x0647
	ld h,d
	ld l,$39
	cp [hl]
	jr c,Unknown_0x14515
	ld h,d
	ld l,$1F
	ld [hl],$45
	inc l
	ld [hl],$45
	inc l
	ld [hl],$25
	ret

Unknown_0x14515:
	ld e,$05
	ld bc,Unknown_0x1411C
	jp Unknown_0x0846

Unknown_0x1451D:
	ld e,$05
	ld bc,Unknown_0x1429A
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x14566
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x1455F
	ld a,[hld]
	ld b,a
	ld a,[hl]
	ld l,$3B
	cp [hl]
	ret nz
	inc l
	ld a,b
	cp [hl]
	ret nz
	ld e,$05
	ld bc,$4128
	jp Unknown_0x0846

Unknown_0x1455F:
	ld e,$45
	ld a,[de]
	xor $80
	ld [de],a
	ret

Unknown_0x14566:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x14589
	ld e,$04
	ld a,[de]
	ld l,$3F
	ld h,d
	cp [hl]
	ret nz
	ld e,$05
	ld bc,$415B
	jp Unknown_0x0846

Unknown_0x14589:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x145B1
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	ret nz
	ld h,d
	ld l,$1F
	ld [hl],$45
	inc l
	ld [hl],$44
	inc l
	ld [hl],$B7
	ret

Unknown_0x145B1:
	ld e,$05
	ld bc,Unknown_0x1429A
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x14609
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x14038
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$22
	ld hl,Unknown_0x14299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$27
	ld a,[de]
	or a
	jr z,Unknown_0x145ED
	xor a
	ld [de],a
	ld e,$05
	ld bc,Unknown_0x1418B
	jp Unknown_0x0846

Unknown_0x145ED:
	call Unknown_0x0647
	cp $40
	jr nc,Unknown_0x14601
	ld a,$02
	ld e,$27
	ld [de],a
	ld e,$05
	ld bc,$41B1
	jp Unknown_0x0846

Unknown_0x14601:
	ld e,$05
	ld bc,$41A2
	jp Unknown_0x0846

Unknown_0x14609:
	ld e,$05
	ld bc,Unknown_0x1429A
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x14643
	ld e,$3B
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,$45
	ld a,[de]
	rlca
	ld e,$0D
	ld a,[de]
	jr c,Unknown_0x1463C
	sub c
	inc e
	ld a,[de]
	sbc a,b
	ret c

Unknown_0x14634:
	ld e,$05
	ld bc,$4128
	jp Unknown_0x0846

Unknown_0x1463C:
	sub c
	inc e
	ld a,[de]
	sbc a,b
	ret nc
	jr Unknown_0x14634

Unknown_0x14643:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x1466F
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	ret nz
	ld l,$26
	ld [hl],$14
	ld h,d
	ld l,$1F
	ld [hl],$45
	inc l
	ld [hl],$46
	inc l
	ld [hl],$77
	ret

Unknown_0x1466F:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x146A9
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	sub [hl]
	cp $64
	jr nc,Unknown_0x146A1
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld h,d
	ld l,$1F
	ld [hl],$45
	inc l
	ld [hl],$46
	inc l
	ld [hl],$B1
	ret

Unknown_0x146A1:
	ld e,$05
	ld bc,$41A2
	jp Unknown_0x0846

Unknown_0x146A9:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x14702
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x14038
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$22
	ld hl,Unknown_0x14299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$27
	ld a,[de]
	sub $02
	jr z,Unknown_0x146E7
	ld a,$02
	ld [de],a
	ld e,$05
	ld bc,$41B1
	jp Unknown_0x0846

Unknown_0x146E7:
	call Unknown_0x0647
	cp $40
	jr nc,Unknown_0x146FA
	xor a
	ld e,$27
	ld [de],a
	ld e,$05
	ld bc,$418B
	jp Unknown_0x0846

Unknown_0x146FA:
	ld e,$05
	ld bc,$41A2
	jp Unknown_0x0846

Unknown_0x14702:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x14732
	ld l,$3A
	ld h,d
	ld e,$45
	ld a,[de]
	rlca
	ld e,$04
	ld a,[de]
	jr c,Unknown_0x1472E
	cp $B4
	ret nc
	cp [hl]
	ret c

Unknown_0x14726:
	ld e,$05
	ld bc,$41FF
	jp Unknown_0x0846

Unknown_0x1472E:
	cp [hl]
	ret nc
	jr Unknown_0x14726

Unknown_0x14732:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x14777
	ld l,$3F
	ld h,d
	ld e,$45
	ld a,[de]
	rlca
	ld e,$04
	ld a,[de]
	jr c,Unknown_0x14773
	cp $B4
	ret nc
	cp [hl]
	ret c

Unknown_0x1476B:
	ld e,$05
	ld bc,$4250
	jp Unknown_0x0846

Unknown_0x14773:
	cp [hl]
	ret nc
	jr Unknown_0x1476B

Unknown_0x14777:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x147AD
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld h,d
	ld l,$0D
	ld a,[hli]
	ld c,a
	or [hl]
	jr z,Unknown_0x147A6
	ld e,$3B
	ld a,[de]
	cp c
	ret nz
	inc e
	ld a,[de]
	cp [hl]
	ret nz
	ld e,$05
	ld bc,Unknown_0x141EF
	jp Unknown_0x0846

Unknown_0x147A6:
	ld e,$45
	ld a,[de]
	xor $80
	ld [de],a
	ret

Unknown_0x147AD:
	ld e,$05
	ld bc,$429A
	jp Unknown_0x0846
	ld e,$03
	ld c,$00
	ld hl,$DD04

Unknown_0x147BC:
	ld a,[hli]
	ld b,a
	ld a,[bc]
	cp $FF
	ret nz
	dec e
	jr nz,Unknown_0x147BC
	ld e,$05
	ld bc,$40EB
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$400E
	call Unknown_0x255B
	ret c
	ld l,$26
	ld h,d
	dec [hl]
	ret nz
	ld e,$05
	ld bc,$432F
	jp Unknown_0x0846
	ld bc,$400E
	jp Unknown_0x255B
	call Unknown_0x0DA4
	ld bc,$401C
	jp Unknown_0x255B
	call Unknown_0x0647
	ld hl,Unknown_0x1403C
	cp $80
	jr c,Unknown_0x1480F
	ld a,$C0
	inc hl
	inc hl
	jr Unknown_0x14811

Unknown_0x1480F:
	ld a,$40

Unknown_0x14811:
	ld e,$45
	ld [de],a

Unknown_0x14814:
	ld e,$04
	ld a,[$DB51]
	add a,[hl]
	inc hl
	ld [de],a
	inc e
	ld a,[$DB52]
	adc a,[hl]
	ld [de],a
	ret
	call Unknown_0x0647
	ld l,$00

Unknown_0x14828:
	sub $56
	jr c,Unknown_0x1482F
	inc l
	jr Unknown_0x14828

Unknown_0x1482F:
	ld a,l
	ld e,$40
	ld [de],a
	rlca
	ld hl,$4040
	add a,l
	ld l,a
	jr nc,Unknown_0x1483C
	inc h

Unknown_0x1483C:
	ld e,$07
	ld a,[$DB53]
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,[$DB54]
	adc a,[hl]
	ld [de],a
	ret
	call Unknown_0x0647
	and $03
	ld hl,$404C
	or a
	jr z,Unknown_0x14857
	inc hl

Unknown_0x14857:
	ld e,$45
	ld a,[de]
	rlca
	jr nc,Unknown_0x1485F
	inc hl
	inc hl

Unknown_0x1485F:
	ld e,$3F
	ld a,[$DB51]
	add a,[hl]
	ld [de],a
	ret
	call Unknown_0x0647
	and $01
	ld l,a
	ld e,$45
	ld a,[de]
	and $80
	rlca
	rlca
	add a,l
	ld hl,$4053
	add a,l
	ld l,a
	jr nc,Unknown_0x1487D
	inc h

Unknown_0x1487D:
	ld e,$3F
	ld a,[$DB51]
	add a,[hl]
	ld [de],a
	ret
	push bc
	ld e,$40
	ld a,[de]
	rlca
	ld c,a
	call Unknown_0x0647
	and $07
	ld b,a
	ld h,$A0
	ld l,$07
	ld a,[hl]
	ld hl,$DB53
	sub [hl]
	cp $44
	jr c,Unknown_0x148A6
	ld a,b
	cp $06
	jr nc,Unknown_0x148AC
	inc c
	jr Unknown_0x148AC

Unknown_0x148A6:
	ld a,b
	cp $06
	jr c,Unknown_0x148AC
	inc c

Unknown_0x148AC:
	ld hl,$4060
	ld b,$00
	add hl,bc
	ld a,[hl]
	ld e,$27
	ld [de],a
	pop bc
	ret
	ld h,$A0
	ld l,$04
	ld a,[hl]
	ld hl,$DB51
	sub [hl]
	cp $50
	ld e,$45
	ld hl,Unknown_0x1403C
	jr c,Unknown_0x148CE
	ld a,$40
	jr Unknown_0x148D2

Unknown_0x148CE:
	ld a,$C0
	inc hl
	inc hl

Unknown_0x148D2:
	ld [de],a
	jp Unknown_0x14814
	ld hl,Unknown_0x14066
	ld e,$45
	ld a,[de]
	rlca
	jr nc,Unknown_0x148E0
	inc hl

Unknown_0x148E0:
	ld e,$3A
	ld a,[$DB51]
	add a,[hl]
	ld [de],a
	ret
	ld hl,$4068
	ld e,$45
	ld a,[de]
	rlca
	jr nc,Unknown_0x148F3
	inc hl
	inc hl

Unknown_0x148F3:
	ld e,$3F
	ld a,[$DB51]
	add a,[hl]
	inc hl
	ld [de],a
	ld e,$3A
	ld a,[$DB51]
	add a,[hl]
	ld [de],a
	ret
	ld e,$5B
	ld a,[de]
	dec a
	rlca
	ld e,a
	rlca
	add a,e
	ld hl,$4081
	add a,l
	ld l,a
	jr nc,Unknown_0x14913
	inc h

Unknown_0x14913:
	call Unknown_0x20F9
	call Unknown_0x20BE
	ld e,$26
	ld a,[hl]
	ld [de],a
	ret
	call Unknown_0x0647
	and $01
	ld l,a
	ld e,$40
	ld a,[de]
	rlca
	ld e,a
	rlca
	add a,e
	ld e,a
	ld a,l
	rlca
	add a,l
	add a,e
	ld hl,$406C
	add a,l
	jr nc,Unknown_0x14937
	inc h

Unknown_0x14937:
	ld e,$3D
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	push bc
	ld e,$27
	ld a,[de]
	ld e,$33
	call Unknown_0x230F
	pop bc
	ret
	xor a
	ld hl,$DD02
	ld [hl],a
	ld hl,$DD04
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	ld a,[hl]
	cpl
	inc a
	ld e,l
	ld [de],a
	rlca
	ld hl,Unknown_0x1403C
	jp nc,Unknown_0x14814
	inc hl
	inc hl
	jp Unknown_0x14814
	push bc
	ld e,$48
	ld a,[de]
	ld b,a
	ld c,$40
	ld a,[bc]
	ld c,a
	call Unknown_0x0647
	and $01
	ld e,a
	ld hl,$DD02
	ld a,[hli]
	or a
	jr z,Unknown_0x149B5
	add a,e

Unknown_0x14996:
	inc a
	cp $03
	jr c,Unknown_0x1499D
	sub $03

Unknown_0x1499D:
	cp c
	jr z,Unknown_0x14996
	cp [hl]
	jr z,Unknown_0x14996

Unknown_0x149A3:
	ld [hld],a
	inc [hl]
	ld e,$40
	ld [de],a
	rlca
	ld hl,$4046
	add a,l
	ld l,a
	jr nc,Unknown_0x149B1
	inc h

Unknown_0x149B1:
	pop bc
	jp Unknown_0x1483C

Unknown_0x149B5:
	ld a,e
	cp c
	jr c,Unknown_0x149A3
	inc a
	cp $03
	jr c,Unknown_0x149A3
	sub $03
	jr Unknown_0x149A3
	ld hl,$DD02
	ld a,[hl]
	inc [hl]
	ld hl,$4046
	rlca
	add a,l
	ld l,a
	jp nc,Unknown_0x1483C
	inc h
	jp nc,Unknown_0x1483C
	ld hl,$DD04

Unknown_0x149D7:
	ld a,[hl]
	or a
	jr z,Unknown_0x149DE
	inc hl
	jr Unknown_0x149D7

Unknown_0x149DE:
	ld [hl],d
	ret

UnknownData_0x149E0:
INCBIN "baserom.gb", $149E0, $14B73 - $149E0

Unknown_0x14B73:
INCBIN "baserom.gb", $14B73, $14BCF - $14B73
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x14BFB
	ld bc,$4A07

Unknown_0x14BDE:
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x14B73
	jp Unknown_0x0846

Unknown_0x14BFB:
	ld bc,$4A15
	jr Unknown_0x14BDE
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A23
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 6,a
	jr nz,Unknown_0x14C2A
	bit 7,a
	ret z
	ld e,$05
	ld bc,$4B7C
	jp Unknown_0x0846

Unknown_0x14C2A:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A07
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	ld h,d
	bit 5,a
	jr nz,Unknown_0x14C66
	bit 6,a
	jr nz,Unknown_0x14C55
	bit 7,a
	jr nz,Unknown_0x14C69
	ret

Unknown_0x14C55:
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ld h,d
	ld l,$1F
	ld [hl],$45
	inc l
	ld [hl],$4B
	inc l
	ld [hl],$CF
	ret

Unknown_0x14C66:
	jp Unknown_0x1EF9

Unknown_0x14C69:
	ld e,$3D
	ld l,$0F
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hl],a
	ld e,$15
	ld a,[de]
	and a
	jr z,Unknown_0x14C7B
	dec a
	ld [de],a
	ret

Unknown_0x14C7B:
	inc a
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A15
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	ld h,d
	bit 5,a
	jr nz,Unknown_0x14CB3
	bit 6,a
	jr nz,Unknown_0x14CA2
	bit 7,a
	jr nz,Unknown_0x14CB6
	ret

Unknown_0x14CA2:
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ld h,d
	ld l,$1F
	ld [hl],$45
	inc l
	ld [hl],$4B
	inc l
	ld [hl],$CF
	ret

Unknown_0x14CB3:
	jp Unknown_0x1EF9

Unknown_0x14CB6:
	ld e,$3D
	ld l,$0F
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hl],a
	ld e,$15
	ld a,[de]
	cp $02
	jr z,Unknown_0x14CC9
	dec a
	ld [de],a
	ret

Unknown_0x14CC9:
	inc a
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	ld e,a
	add a,a
	add a,e
	add a,l
	jr nc,Unknown_0x14CDC
	inc h

Unknown_0x14CDC:
	ld l,a
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld e,$39
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	ld e,a
	add a,a
	add a,e
	add a,l
	jr nc,Unknown_0x14CF9
	inc h

Unknown_0x14CF9:
	ld l,a
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld e,$39
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	add a,a
	add a,l
	jr nc,Unknown_0x14D14
	inc h

Unknown_0x14D14:
	ld l,a
	ld e,$0F
	ld a,[hli]
	ld [de],a
	ld e,$3D
	ld [de],a
	ld a,[hl]
	inc e
	ld [de],a
	ld e,$10
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$5C
	ld e,l
	ld a,[hl]
	ld [de],a
	ld e,$4A
	ld a,$10
	ld [de],a
	xor a
	inc e
	ld [de],a
	ret

UnknownData_0x14D35:
INCBIN "baserom.gb", $14D35, $14D4D - $14D35

Unknown_0x14D4D:
INCBIN "baserom.gb", $14D4D, $14D65 - $14D4D

Unknown_0x14D65:
INCBIN "baserom.gb", $14D65, $14DE3 - $14D65

Unknown_0x14DE3:
INCBIN "baserom.gb", $14DE3, $14DE6 - $14DE3

Unknown_0x14DE6:
INCBIN "baserom.gb", $14DE6, $14DFE - $14DE6

Unknown_0x14DFE:
INCBIN "baserom.gb", $14DFE, $14E14 - $14DFE
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A44
	call Unknown_0x255B
	ret c
	call Unknown_0x15050
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0x1EF9
	bit 6,a
	jr nz,Unknown_0x14E3C
	bit 7,a
	jr nz,Unknown_0x14E43
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x14E5E
	ret

Unknown_0x14E3C:
	ld h,d
	ld l,$0F
	xor a
	ld [hli],a
	ld [hl],a
	ret

Unknown_0x14E43:
	ld h,d
	ld e,$3D
	ld l,$0F
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hl],a
	ld e,$3F
	ld a,[de]
	and a
	jr z,Unknown_0x14E56
	dec a
	ld [de],a
	ret

Unknown_0x14E56:
	ld e,$05
	ld bc,Unknown_0x14D65
	jp Unknown_0x0846

Unknown_0x14E5E:
	ld e,$05
	ld bc,$4DC9
	jp Unknown_0x0846
	ld bc,$4A44
	call Unknown_0x255B
	ret c
	ld e,$3F
	ld a,[de]
	and a
	jr nz,Unknown_0x14E74
	ret

Unknown_0x14E74:
	ld e,$05
	ld bc,Unknown_0x14D4D
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A44
	call Unknown_0x255B
	ret c
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x14EA3
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x14D4D
	jp Unknown_0x0846

Unknown_0x14EA3:
	ld e,$05
	ld bc,$4DC9
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A44
	call Unknown_0x255B
	ret c
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x14EC6
	ld b,$30
	ld c,b
	call Unknown_0x1F14
	jr c,Unknown_0x14F06

Unknown_0x14EC6:
	ld e,$5C
	ld a,[de]
	ld hl,$4A74
	add a,l
	jr nc,Unknown_0x14ED0
	inc h

Unknown_0x14ED0:
	ld l,a
	ld e,$40
	ld a,[de]
	inc a
	ld [de],a
	cp [hl]
	call z,Unknown_0x14EF9
	call Unknown_0x15061
	call Unknown_0x1AB3
	jr nz,Unknown_0x14EF2
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0x1EF9
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0x14EF2
	ret

Unknown_0x14EF2:
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x14EF9:
	xor a
	ld [de],a
	ld h,d
	ld e,$3D
	ld l,$0F
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hl],a
	ret

Unknown_0x14F06:
	call Unknown_0x1A25
	xor a
	ld h,d
	ld l,$0D
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld e,$05
	ld bc,Unknown_0x14DE6
	jp Unknown_0x0846
	ld e,$3F
	ld a,[de]
	inc a
	ld [de],a
	cp $09
	jr nz,Unknown_0x14F69
	xor a
	ld e,$3F
	ld [de],a
	ld e,$40
	ld a,[de]
	res 0,a
	res 4,a
	ld b,a
	call Unknown_0x1EC0
	ld e,$45
	ld a,[de]
	bit 7,a
	jr z,Unknown_0x14F42
	bit 3,b
	jr nz,Unknown_0x14F3E
	set 0,b

Unknown_0x14F3E:
	set 3,b
	jr Unknown_0x14F4A

Unknown_0x14F42:
	bit 3,b
	jr z,Unknown_0x14F48
	set 0,b

Unknown_0x14F48:
	res 3,b

Unknown_0x14F4A:
	call Unknown_0x201D
	ld e,$27
	ld a,[de]
	and a
	jr z,Unknown_0x14F5D
	bit 7,b
	jr nz,Unknown_0x14F59
	set 4,b

Unknown_0x14F59:
	set 7,b
	jr Unknown_0x14F65

Unknown_0x14F5D:
	bit 7,b
	jr z,Unknown_0x14F63
	set 4,b

Unknown_0x14F63:
	res 7,b

Unknown_0x14F65:
	ld e,$40
	ld a,b
	ld [de],a

Unknown_0x14F69:
	ld e,$40
	ld a,[de]
	bit 3,a
	jr nz,Unknown_0x14F84
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0x14F7A
	ld e,$00

Unknown_0x14F7A:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CB4
	jr Unknown_0x14F96

Unknown_0x14F84:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0x14F8E
	ld e,$00

Unknown_0x14F8E:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CE5

Unknown_0x14F96:
	ld e,$40
	ld a,[de]
	bit 7,a
	jr z,Unknown_0x14FB1
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0x14FA7
	ld e,$00

Unknown_0x14FA7:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	jr Unknown_0x14FC3

Unknown_0x14FB1:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0x14FBB
	ld e,$00

Unknown_0x14FBB:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D66

Unknown_0x14FC3:
	call Unknown_0x0DA4
	ld bc,$4A44
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 5,a
	call nz,Unknown_0x14FED
	bit 6,a
	call nz,Unknown_0x14FF6
	bit 7,a
	call nz,Unknown_0x14FF6
	call Unknown_0x1AB3
	jr nz,Unknown_0x14FE5
	ret

Unknown_0x14FE5:
	ld e,$05
	ld bc,Unknown_0x14DFE
	jp Unknown_0x0846

Unknown_0x14FED:
	ld b,a
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ld a,b
	ret

Unknown_0x14FF6:
	ld b,a
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ld a,b
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A44
	call Unknown_0x255B
	ret c
	call Unknown_0x15072
	call Unknown_0x1A62
	bit 6,a
	jr nz,Unknown_0x15027
	bit 7,a
	jr nz,Unknown_0x15036
	bit 5,a
	call nz,Unknown_0x1EF9
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x1502E
	ret

Unknown_0x15027:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x1502E:
	ld e,$05
	ld bc,Unknown_0x14DE3
	jp Unknown_0x0846

Unknown_0x15036:
	ld e,$05
	ld bc,$4D4D
	jp Unknown_0x0846
	ld e,$F8
	push bc
	call Unknown_0x1AC1
	pop bc
	jr z,Unknown_0x1504A
	xor a
	jr Unknown_0x1504C

Unknown_0x1504A:
	ld a,$01

Unknown_0x1504C:
	ld e,$27
	ld [de],a
	ret

Unknown_0x15050:
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	jr nz,Unknown_0x1505D
	ld a,$04
	ld [de],a
	ret

Unknown_0x1505D:
	ld a,$03
	ld [de],a
	ret

Unknown_0x15061:
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	jr nz,Unknown_0x1506E
	ld a,$00
	ld [de],a
	ret

Unknown_0x1506E:
	ld a,$01
	ld [de],a
	ret

Unknown_0x15072:
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	jr nz,Unknown_0x1507F
	ld a,$03
	ld [de],a
	ret

Unknown_0x1507F:
	ld a,$02
	ld [de],a
	ret

UnknownData_0x15083:
INCBIN "baserom.gb", $15083, $15094 - $15083

Unknown_0x15094:
INCBIN "baserom.gb", $15094, $150F5 - $15094

Unknown_0x150F5:
INCBIN "baserom.gb", $150F5, $15118 - $150F5

Unknown_0x15118:
INCBIN "baserom.gb", $15118, $15135 - $15118

Unknown_0x15135:
INCBIN "baserom.gb", $15135, $15154 - $15135
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A8A
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x152FC
	call Unknown_0x1A62
	bit 6,a
	jr nz,Unknown_0x1517F
	bit 7,a
	jr nz,Unknown_0x1518E
	bit 5,a
	jp nz,Unknown_0x1EF9
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x15186
	ret

Unknown_0x1517F:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x15186:
	ld e,$05
	ld bc,$510D
	jp Unknown_0x0846

Unknown_0x1518E:
	ld e,$05
	ld bc,Unknown_0x15094
	jp Unknown_0x0846
	ld bc,$4A8A
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	ld b,$38
	ld c,$30
	call Unknown_0x1F14
	jr c,Unknown_0x151B1
	call Unknown_0x1964
	bit 7,a
	jr z,Unknown_0x151B9
	ret

Unknown_0x151B1:
	ld e,$05
	ld bc,Unknown_0x150F5
	jp Unknown_0x0846

Unknown_0x151B9:
	ld e,$05
	ld bc,$50E9
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4A8A
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x151EB
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x15094
	jp Unknown_0x0846

Unknown_0x151EB:
	ld e,$05
	ld bc,$510D
	jp Unknown_0x0846

UnknownData_0x151F3:
INCBIN "baserom.gb", $151F3, $1521D - $151F3
	ld bc,$4A8A
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	ret
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$4A8A
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x1A62
	bit 5,a
	jr nz,Unknown_0x15269
	bit 7,a
	jr nz,Unknown_0x15269
	bit 6,a
	jr nz,Unknown_0x15269
	ld e,$0D
	ld a,[de]
	and a
	ret nz
	inc e
	ld a,[de]
	and a
	ret nz
	ld b,$38
	ld c,$30
	call Unknown_0x1F14
	jr c,Unknown_0x15261
	ld e,$05
	ld bc,Unknown_0x15118
	jp Unknown_0x0846

Unknown_0x15261:
	ld e,$05
	ld bc,Unknown_0x15135
	jp Unknown_0x0846

Unknown_0x15269:
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1EF9
	ld e,$11
	ld a,[de]
	call Unknown_0x0C83
	ld e,$12
	ld a,[de]
	call Unknown_0x0C94
	call Unknown_0x0DA4
	ld bc,$4A8A
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x1AB3
	jr nz,Unknown_0x152DE
	call Unknown_0x1A62
	push af
	bit 5,a
	call nz,Unknown_0x152C9
	pop af
	bit 7,a
	jr nz,Unknown_0x152D3

Unknown_0x1529E:
	ld e,$0D
	ld a,[de]
	and a
	ret nz
	inc e
	ld a,[de]
	and a
	ret nz
	ld e,$0F
	ld a,[de]
	and a
	ret nz
	inc e
	ld a,[de]
	and a
	ret nz
	ld b,$38
	ld c,$30
	call Unknown_0x1F14
	jr c,Unknown_0x152C1
	ld e,$05
	ld bc,Unknown_0x15118
	jp Unknown_0x0846

Unknown_0x152C1:
	ld e,$05
	ld bc,Unknown_0x15135
	jp Unknown_0x0846

Unknown_0x152C9:
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	call Unknown_0x1EF9
	ret

Unknown_0x152D3:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$12
	ld [de],a
	jr Unknown_0x1529E

Unknown_0x152DE:
	ld e,$0F
	ld a,[de]
	sub $80
	ld [de],a
	inc e
	ld a,[de]
	sbc a,$01
	ld [de],a
	ld e,$05
	ld bc,$514A
	jp Unknown_0x0846
	ld bc,$4A8A
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	ret

Unknown_0x152FC:
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	jr nz,Unknown_0x15309
	ld a,$02
	ld [de],a
	ret

Unknown_0x15309:
	ld a,$01
	ld [de],a
	ret
	call Unknown_0x0647
	ld e,$27
	cp $40
	jr c,Unknown_0x1531E
	cp $80
	jr c,Unknown_0x15321
	ld a,$02
	ld [de],a
	ret

Unknown_0x1531E:
	xor a
	ld [de],a
	ret

Unknown_0x15321:
	ld a,$01
	ld [de],a
	ret
	ld e,$45
	ld a,[de]
	xor $80
	ld [de],a
	ret
	push bc
	push de
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,[hl]
	inc l
	ld d,[hl]
	ld a,c
	sub e
	ld a,b
	sbc a,d
	jr c,Unknown_0x1534D
	ld a,c
	sub e
	cp $10
	jr c,Unknown_0x15359
	cp $24
	jr c,Unknown_0x15366
	jr Unknown_0x15373

Unknown_0x1534D:
	ld a,e
	sub c
	cp $10
	jr c,Unknown_0x15359
	cp $24
	jr c,Unknown_0x15366
	jr Unknown_0x15373

Unknown_0x15359:
	call Unknown_0x0647
	cp $A0
	jr c,Unknown_0x1538E
	cp $E0
	jr c,Unknown_0x15386
	jr Unknown_0x1537E

Unknown_0x15366:
	call Unknown_0x0647
	cp $40
	jr c,Unknown_0x1538E
	cp $C0
	jr c,Unknown_0x15386
	jr Unknown_0x1537E

Unknown_0x15373:
	call Unknown_0x0647
	cp $40
	jr c,Unknown_0x1538E
	cp $A0
	jr c,Unknown_0x15386

Unknown_0x1537E:
	pop de
	ld a,$02
	ld e,$27
	ld [de],a
	pop bc
	ret

Unknown_0x15386:
	pop de
	ld a,$01
	ld e,$27
	ld [de],a
	pop bc
	ret

Unknown_0x1538E:
	pop de
	xor a
	ld e,$27
	ld [de],a
	pop bc
	ret

UnknownData_0x15395:
INCBIN "baserom.gb", $15395, $1539C - $15395
	push bc
	call Unknown_0x153A2
	pop bc
	ret

Unknown_0x153A2:
	ld h,$A0
	ld e,$0B
	ld l,e
	ld a,[de]
	sub [hl]
	bit 7,a
	ld hl,$FF84
	ld [hl],$00
	jr z,Unknown_0x153B6
	ld [hl],$01
	cpl
	inc a

Unknown_0x153B6:
	ld c,a
	ld h,$A0
	ld e,$09
	ld l,e
	ld a,[de]
	sub [hl]
	bit 7,a
	ld hl,$FF84
	jr z,Unknown_0x153C9
	set 1,[hl]
	cpl
	inc a

Unknown_0x153C9:
	ld b,a
	ld l,c
	xor a
	sla l
	rla
	sla l
	rla
	ld h,a
	ld c,$00

Unknown_0x153D5:
	and a
	ld a,l
	sub b
	ld l,a
	jr nc,Unknown_0x153E1
	ld a,h
	sub $01
	jr c,Unknown_0x153E9
	ld h,a

Unknown_0x153E1:
	inc c
	ld a,c
	sub $0C
	jr nz,Unknown_0x153D5
	jr Unknown_0x15410

Unknown_0x153E9:
	ld a,c
	sub $02
	jr nc,Unknown_0x153F9
	ld hl,$FF84
	bit 1,[hl]
	jr z,Unknown_0x1541B
	ld a,$00
	jr Unknown_0x15429

Unknown_0x153F9:
	ld hl,$FF84
	bit 1,[hl]
	jr z,Unknown_0x15408
	bit 0,[hl]
	jr nz,Unknown_0x15427
	ld a,$01
	jr Unknown_0x15429

Unknown_0x15408:
	bit 0,[hl]
	jr nz,Unknown_0x1541F
	ld a,$03
	jr Unknown_0x15429

Unknown_0x15410:
	ld hl,$FF84
	bit 0,[hl]
	jr nz,Unknown_0x15423
	ld a,$02
	jr Unknown_0x15429

Unknown_0x1541B:
	ld a,$04
	jr Unknown_0x15429

Unknown_0x1541F:
	ld a,$05
	jr Unknown_0x15429

Unknown_0x15423:
	ld a,$06
	jr Unknown_0x15429

Unknown_0x15427:
	ld a,$07

Unknown_0x15429:
	add a,a
	ld e,a
	add a,a
	add a,e
	ld b,a
	ld e,$5C
	ld a,[de]
	and a
	ld a,b
	jr z,Unknown_0x15437
	add a,$30

Unknown_0x15437:
	ld hl,$4ACD
	add a,l
	jr nc,Unknown_0x1543E
	inc h

Unknown_0x1543E:
	ld l,a
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x15453:
INCBIN "baserom.gb", $15453, $155F3 - $15453

Unknown_0x155F3:
INCBIN "baserom.gb", $155F3, $15639 - $155F3

Unknown_0x15639:
INCBIN "baserom.gb", $15639, $158E7 - $15639
	call Unknown_0x0DA4
	ld bc,$5453
	call Unknown_0x255B
	ret c
	ld e,$40
	ld a,[de]
	dec a
	and a
	ld [de],a
	jr nz,Unknown_0x15903
	ld a,$60
	ld [de],a
	ld b,$10
	call Unknown_0x15B11
	jr nc,Unknown_0x1592B

Unknown_0x15903:
	call Unknown_0x19F3
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	jr z,Unknown_0x15923
	bit 4,a
	jr nz,Unknown_0x1592B
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x1591B
	ret

Unknown_0x1591B:
	ld e,$05
	ld bc,$57F1
	jp Unknown_0x0846

Unknown_0x15923:
	ld e,$05
	ld bc,$579F
	jp Unknown_0x0846

Unknown_0x1592B:
	ld e,$05
	ld bc,$57AB
	jp Unknown_0x0846

UnknownData_0x15933:
INCBIN "baserom.gb", $15933, $1597F - $15933
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld bc,$5453
	call Unknown_0x255B
	ret c
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x159AF
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,$5764
	jp Unknown_0x0846

Unknown_0x159AF:
	ld e,$05
	ld bc,$57F1
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5453
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x159DC
	bit 7,a
	jr nz,Unknown_0x159EB
	bit 5,a
	call nz,Unknown_0x1EF9
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x159E3
	ret

Unknown_0x159DC:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x159E3:
	ld e,$05
	ld bc,$57F1
	jp Unknown_0x0846

Unknown_0x159EB:
	ld e,$05
	ld bc,$57E0
	jp Unknown_0x0846

UnknownData_0x159F3:
INCBIN "baserom.gb", $159F3, $15A5D - $159F3
	ld e,$12
	ld a,[de]
	call Unknown_0x0C94
	call Unknown_0x0DA4
	ld bc,$5453
	call Unknown_0x255B
	ret c
	ld e,$00
	call Unknown_0x1AC1
	jr nz,Unknown_0x15A82
	call Unknown_0x1A25
	bit 6,a
	ret z
	ld e,$05
	ld bc,$583C
	jp Unknown_0x0846

Unknown_0x15A82:
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x15A90
	ld e,$05
	ld bc,$57AB
	jp Unknown_0x0846

Unknown_0x15A90:
	ld e,$05
	ld bc,$57C5
	jp Unknown_0x0846

UnknownData_0x15A98:
INCBIN "baserom.gb", $15A98, $15B11 - $15A98

Unknown_0x15B11:
	push de
	push bc
	ld e,$07
	ld l,e
	ld h,$A0
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,[hl]
	inc l
	ld d,[hl]
	ld a,c
	sub e
	ld a,b
	sbc a,d
	jr c,Unknown_0x15B36
	ld a,c
	sub e
	ld c,a
	ld a,b
	cp d
	jr z,Unknown_0x15B31
	ld a,$FF
	add a,c
	ld c,a

Unknown_0x15B31:
	ld a,c
	pop bc
	pop de
	cp b
	ret

Unknown_0x15B36:
	pop bc
	pop de
	ret

UnknownData_0x15B39:
INCBIN "baserom.gb", $15B39, $15B4C - $15B39

Unknown_0x15B4C:
	push de
	push bc
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,[hl]
	inc l
	ld d,[hl]
	ld a,c
	sub e
	ld a,b
	sbc a,d
	jr c,Unknown_0x15B71
	ld a,c
	sub e
	ld c,a
	ld a,b
	cp d
	jr z,Unknown_0x15B6C
	ld a,$FF
	add a,c
	ld c,a

Unknown_0x15B6C:
	ld a,c
	pop bc
	pop de
	cp b
	ret

Unknown_0x15B71:
	ld a,e
	sub c
	ld e,a
	ld a,b
	cp d
	jr z,Unknown_0x15B7C
	ld a,$FF
	add a,e
	ld e,a

Unknown_0x15B7C:
	ld a,e
	pop bc
	pop de
	cp b
	ret
	call Unknown_0x2235
	ld e,$27
	ld [de],a
	ret

UnknownData_0x15B88:
INCBIN "baserom.gb", $15B88, $15B9D - $15B88

Unknown_0x15B9D:
INCBIN "baserom.gb", $15B9D, $15BF5 - $15B9D

Unknown_0x15BF5:
INCBIN "baserom.gb", $15BF5, $15C14 - $15BF5

Unknown_0x15C14:
INCBIN "baserom.gb", $15C14, $15C36 - $15C14
	ld b,$48
	call Unknown_0x15B4C
	ret nc
	ld e,$05
	ld bc,Unknown_0x15B9D
	jp Unknown_0x0846
	ret
	call Unknown_0x15D2C
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$5493
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1F0D
	jr z,Unknown_0x15C65
	ld e,$05
	ld bc,$5C15
	jp Unknown_0x0846

Unknown_0x15C65:
	call Unknown_0x1A25
	bit 7,a
	jp nz,Unknown_0x15D4A
	ld e,$08
	call Unknown_0x1AC1
	jp z,Unknown_0x15D4A
	jp Unknown_0x15D5F
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$5493
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,$5C15
	jp Unknown_0x0846
	ld bc,$5493
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1F0D
	ret nz
	ld e,$5B
	ld a,[de]
	and a
	jr z,Unknown_0x15CB3
	ld e,$05
	ld bc,$5BF5
	jp Unknown_0x0846

Unknown_0x15CB3:
	ld e,$05
	ld bc,$5BBC
	jp Unknown_0x0846
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	ld e,a
	add a,a
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x15CCC
	inc h

Unknown_0x15CCC:
	push de
	push bc
	push hl
	call Unknown_0x202B
	pop hl
	push hl
	ld e,$0F
	jr nc,Unknown_0x15CE3
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$12
	ld a,[hl]
	ld [de],a
	jr Unknown_0x15CF4

Unknown_0x15CE3:
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a
	ld e,$12
	ld a,[hl]
	cpl
	inc a
	ld [de],a

Unknown_0x15CF4:
	call Unknown_0x203D
	ld e,$0D
	pop hl
	jr nc,Unknown_0x15D07
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hl]
	ld [de],a
	jr Unknown_0x15D18

Unknown_0x15D07:
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a
	ld e,$11
	ld a,[hl]
	cpl
	inc a
	ld [de],a

Unknown_0x15D18:
	pop bc
	pop de
	ret

Unknown_0x15D1B:
	ld e,$0E
	ld a,[de]
	ld e,$11
	bit 7,a
	jr nz,Unknown_0x15D28
	ld a,$FF
	ld [de],a
	ret

Unknown_0x15D28:
	ld a,$01
	ld [de],a
	ret

Unknown_0x15D2C:
	ld e,$5C
	ld a,[de]
	ld e,$40
	and a
	jr nz,Unknown_0x15D3F
	ld a,[de]
	inc a
	cp $60
	ld [de],a
	ret nz
	xor a
	ld [de],a
	jp Unknown_0x15D1B

Unknown_0x15D3F:
	ld a,[de]
	inc a
	cp $80
	ld [de],a
	ret nz
	xor a
	ld [de],a
	jp Unknown_0x15D1B

Unknown_0x15D4A:
	ld e,$0F
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ret

UnknownData_0x15D58:
INCBIN "baserom.gb", $15D58, $15D5F - $15D58

Unknown_0x15D5F:
	ld e,$5B
	ld a,[de]
	and a
	ret z
	ld b,$28
	call Unknown_0x15B4C
	jr nc,Unknown_0x15D73

Unknown_0x15D6B:
	ld e,$05
	ld bc,Unknown_0x15BF5
	jp Unknown_0x0846

Unknown_0x15D73:
	ld b,$38
	call Unknown_0x15B4C
	ret nc
	ld e,$5C
	ld a,[de]
	and a
	jr nz,Unknown_0x15D87
	call Unknown_0x0647
	cp $80
	ret nc
	jr Unknown_0x15D6B

Unknown_0x15D87:
	call Unknown_0x0647
	cp $C0
	ret nc
	jr Unknown_0x15D6B

UnknownData_0x15D8F:
INCBIN "baserom.gb", $15D8F, $15DA1 - $15D8F

Unknown_0x15DA1:
INCBIN "baserom.gb", $15DA1, $15DBC - $15DA1

Unknown_0x15DBC:
INCBIN "baserom.gb", $15DBC, $15E15 - $15DBC

Unknown_0x15E15:
INCBIN "baserom.gb", $15E15, $15E95 - $15E15
	ld bc,$54AB
	call Unknown_0x255B
	ret c
	call Unknown_0x16080
	call Unknown_0x2375
	call Unknown_0x19CB
	bit 7,a
	ret nz
	ld e,$05
	ld bc,$5DC8
	jp Unknown_0x0846
	ld e,$40
	ld a,[de]
	inc a
	ld [de],a
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	call Unknown_0x1A25
	ld e,$44
	ld [de],a
	ld bc,$54AB
	call Unknown_0x255B
	ret c
	call Unknown_0x16080
	call Unknown_0x2375
	ld e,$44
	ld a,[de]
	bit 6,a
	jr nz,Unknown_0x15EE8
	bit 7,a
	jr nz,Unknown_0x15EEF
	bit 5,a
	call nz,Unknown_0x1EF9
	ret

Unknown_0x15EE8:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x15EEF:
	ld e,$5C
	ld a,[de]
	and a
	ld e,$40
	ld a,[de]
	jr nz,Unknown_0x15EFE
	cp $21
	jr nc,Unknown_0x15F0A
	jr Unknown_0x15F02

Unknown_0x15EFE:
	cp $1B
	jr nc,Unknown_0x15F0A

Unknown_0x15F02:
	ld e,$05
	ld bc,Unknown_0x15DBC
	jp Unknown_0x0846

Unknown_0x15F0A:
	ld e,$05
	ld bc,$5E5C
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$54B9
	call Unknown_0x255B
	ret c
	call Unknown_0x16070
	jr z,Unknown_0x15F5F

Unknown_0x15F24:
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x15F46
	bit 7,a
	jr nz,Unknown_0x15F4D
	bit 5,a
	jr nz,Unknown_0x15F3A
	ret

Unknown_0x15F3A:
	ld e,$3F
	ld a,$01
	ld [de],a
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x15F46:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x15F4D:
	ld e,$3F
	ld a,[de]
	and a
	jr z,Unknown_0x15F57
	dec e
	ld a,$01
	ld [de],a

Unknown_0x15F57:
	ld e,$05
	ld bc,Unknown_0x15E15
	jp Unknown_0x0846

Unknown_0x15F5F:
	ld e,$15
	xor a
	ld [de],a
	ld e,$3F
	ld a,[de]
	and a
	jr z,Unknown_0x15F24
	xor a
	ld [de],a
	dec e
	ld a,[de]
	and a
	jr z,Unknown_0x15F24
	xor a
	ld [de],a
	ld e,$05
	ld bc,$5E72
	jp Unknown_0x0846
	call Unknown_0x21F7
	call Unknown_0x0DA4
	ld bc,$54B9
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x15F99
	bit 7,a
	jr nz,Unknown_0x15FA0
	ret

Unknown_0x15F99:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x15FA0:
	ld e,$05
	ld bc,$5E15
	jp Unknown_0x0846

UnknownData_0x15FA8:
INCBIN "baserom.gb", $15FA8, $15FE1 - $15FA8
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	jr nz,Unknown_0x15FEE
	ld a,$00
	jr Unknown_0x15FF0

Unknown_0x15FEE:
	ld a,$01

Unknown_0x15FF0:
	ld [de],a
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$54B9
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x15E15
	jp Unknown_0x0846
	ld e,$40
	ld a,[de]
	inc a
	ld [de],a
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld bc,$54AB
	call Unknown_0x255B
	ret c
	call Unknown_0x16080
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$40
	ld a,[de]
	cp $10
	jr nc,Unknown_0x1604A
	ld e,$05
	ld bc,Unknown_0x15DA1
	jp Unknown_0x0846

Unknown_0x1604A:
	ld e,$05
	ld bc,$5DD7
	jp Unknown_0x0846
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$54AB
	call Unknown_0x255B
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$5C
	ld e,l
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x16069:
INCBIN "baserom.gb", $16069, $16070 - $16069

Unknown_0x16070:
	ld e,$0F
	ld a,[de]
	and a
	ret nz
	inc e
	ld a,[de]
	and a
	ret

UnknownData_0x16079:
INCBIN "baserom.gb", $16079, $16080 - $16079

Unknown_0x16080:
	call Unknown_0x1A97
	ret nz
	ld e,$05
	ld bc,$5E5C
	call Unknown_0x0846
	pop hl
	ret

UnknownData_0x1608E:
INCBIN "baserom.gb", $1608E, $160B7 - $1608E

Unknown_0x160B7:
INCBIN "baserom.gb", $160B7, $160E5 - $160B7

Unknown_0x160E5:
INCBIN "baserom.gb", $160E5, $16122 - $160E5

Unknown_0x16122:
INCBIN "baserom.gb", $16122, $161E5 - $16122
	call Unknown_0x0DA4
	ld bc,$54FF
	call Unknown_0x255B
	ret c
	call Unknown_0x1F0D
	jr nz,Unknown_0x16212
	call Unknown_0x2375
	call Unknown_0x202B
	jr nc,Unknown_0x16204
	ld e,$10
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x1620A
	ret

Unknown_0x16204:
	ld e,$10
	ld a,[de]
	bit 7,a
	ret nz

Unknown_0x1620A:
	ld e,$05
	ld bc,Unknown_0x160B7
	jp Unknown_0x0846

Unknown_0x16212:
	ld e,$05
	ld bc,$6122
	jp Unknown_0x0846
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$54FF
	call Unknown_0x255B
	ret c
	call Unknown_0x1F0D
	jr nz,Unknown_0x16240
	call Unknown_0x2375
	ld e,$0F
	ld a,[de]
	and a
	ret nz
	inc e
	ld a,[de]
	and a
	ret nz
	ld e,$05
	ld bc,Unknown_0x160E5
	jp Unknown_0x0846

Unknown_0x16240:
	ld e,$05
	ld bc,$6122
	jp Unknown_0x0846
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$54FF
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,Unknown_0x16122
	jp Unknown_0x0846

UnknownData_0x16264:
INCBIN "baserom.gb", $16264, $1626C - $16264
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$54FF
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ret
	ld e,$3F
	ld a,[de]
	inc a
	ld [de],a
	cp $0C
	jr nz,Unknown_0x162D1
	xor a
	ld e,$3F
	ld [de],a
	dec e
	ld a,[de]
	inc a
	ld [de],a
	ld e,$40
	ld a,[de]
	res 0,a
	res 4,a
	ld b,a
	call Unknown_0x1EC0
	ld e,$45
	ld a,[de]
	bit 7,a
	jr z,Unknown_0x162AA
	bit 3,b
	jr nz,Unknown_0x162A6
	set 0,b

Unknown_0x162A6:
	set 3,b
	jr Unknown_0x162B2

Unknown_0x162AA:
	bit 3,b
	jr z,Unknown_0x162B0
	set 0,b

Unknown_0x162B0:
	res 3,b

Unknown_0x162B2:
	call Unknown_0x201D
	ld e,$27
	ld a,[de]
	and a
	jr z,Unknown_0x162C5
	bit 7,b
	jr nz,Unknown_0x162C1
	set 4,b

Unknown_0x162C1:
	set 7,b
	jr Unknown_0x162CD

Unknown_0x162C5:
	bit 7,b
	jr z,Unknown_0x162CB
	set 4,b

Unknown_0x162CB:
	res 7,b

Unknown_0x162CD:
	ld e,$40
	ld a,b
	ld [de],a

Unknown_0x162D1:
	ld e,$40
	ld a,[de]
	bit 3,a
	jr nz,Unknown_0x162EC
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0x162E2
	ld e,$00

Unknown_0x162E2:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CB4
	jr Unknown_0x162FE

Unknown_0x162EC:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0x162F6
	ld e,$00

Unknown_0x162F6:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CE5

Unknown_0x162FE:
	ld e,$40
	ld a,[de]
	bit 7,a
	jr z,Unknown_0x16319
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0x1630F
	ld e,$00

Unknown_0x1630F:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	jr Unknown_0x1632B

Unknown_0x16319:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0x16323
	ld e,$00

Unknown_0x16323:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D66

Unknown_0x1632B:
	call Unknown_0x0DA4
	ld bc,$54FF
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld e,$3E
	ld a,[de]
	cp $0C
	jr z,Unknown_0x16352
	ld e,$10
	ld a,[de]
	and $80
	ld b,a
	ld e,$12
	ld a,[de]
	and $80
	xor b
	ret nz
	ld e,$15
	ld a,$02
	ld [de],a
	ret

Unknown_0x16352:
	ld e,$05
	ld bc,$61AF
	jp Unknown_0x0846
	push bc
	ld hl,$DB53
	ld e,$07
	ld a,[hli]
	sub $08
	ld c,a
	ld a,[hl]
	sbc a,$00
	ld b,a
	ld a,[de]
	sub c
	inc e
	ld a,[de]
	sbc a,b
	jr c,Unknown_0x16383
	ld hl,$DB53
	ld e,$07
	ld a,[hli]
	add a,$88
	ld c,a
	ld a,[hl]
	adc a,$00
	ld b,a
	ld a,[de]
	sub c
	inc e
	ld a,[de]
	sbc a,b
	jr c,Unknown_0x1638A

Unknown_0x16383:
	ld e,$27
	ld a,$00
	ld [de],a
	pop bc
	ret

Unknown_0x1638A:
	ld e,$27
	ld a,$01
	ld [de],a
	pop bc
	ret
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$27
	jr nz,Unknown_0x163A1
	ld a,$01
	ld [de],a
	ld e,$40
	ld [de],a
	ret

Unknown_0x163A1:
	ld a,$00
	ld [de],a
	ld e,$40
	ld [de],a
	ret
	ld e,$12
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$15
	ld a,[de]
	and a
	jr z,Unknown_0x163B8
	ld a,$00
	ld [de],a
	ret

Unknown_0x163B8:
	ld a,$01
	ld [de],a
	ret

UnknownData_0x163BC:
INCBIN "baserom.gb", $163BC, $163D6 - $163BC

Unknown_0x163D6:
INCBIN "baserom.gb", $163D6, $16496 - $163D6
	ld bc,$552F
	call Unknown_0x255B
	ret c
	call Unknown_0x1EC0
	ld b,$30
	call Unknown_0x15B4C
	ret nc
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x164BA
	ld e,$05
	ld bc,Unknown_0x163D6
	call Unknown_0x0846
	ld e,$47
	ld a,$80
	ld [de],a
	ret

Unknown_0x164BA:
	ld e,$05
	ld bc,$642A
	call Unknown_0x0846
	ld e,$47
	ld a,$80
	ld [de],a
	ret
	call Unknown_0x1EC0
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$552F
	call Unknown_0x255B
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$552F
	call Unknown_0x255B
	ret c
	ld e,$10
	ld a,[de]
	bit 7,a
	ret nz
	ld e,$27
	ld a,$01
	ld [de],a
	ret
	ld e,$41
	ld h,d
	ld l,$06
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld l,$41
	ld h,d
	ld e,$06
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x1650D:
INCBIN "baserom.gb", $1650D, $16518 - $1650D

Unknown_0x16518:
INCBIN "baserom.gb", $16518, $1656D - $16518

Unknown_0x1656D:
INCBIN "baserom.gb", $1656D, $165A2 - $1656D
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$553D
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x2235
	and a
	jr z,Unknown_0x165C8
	call Unknown_0x16682
	jr nz,Unknown_0x165FD
	ld e,$05
	ld bc,Unknown_0x1656D
	jp Unknown_0x0846

Unknown_0x165C8:
	call Unknown_0x19F3
	bit 5,a
	jr nz,Unknown_0x165FD
	bit 7,a
	jr z,Unknown_0x16606
	ld e,$3F
	ld a,[de]
	and a
	ret nz
	call Unknown_0x19F3
	bit 4,a
	ret z
	call Unknown_0x16682
	jr nz,Unknown_0x165FD
	call Unknown_0x202B
	jr nc,Unknown_0x165FD
	call Unknown_0x0647
	cp $40
	jr c,Unknown_0x165F5
	ld e,$3F
	ld a,$01
	ld [de],a
	ret

Unknown_0x165F5:
	ld e,$05
	ld bc,$6559
	jp Unknown_0x0846

Unknown_0x165FD:
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1EF9

Unknown_0x16606:
	ld e,$05
	ld bc,$6590
	jp Unknown_0x0846
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$553D
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x2235
	and a
	jr nz,Unknown_0x1662F
	ld e,$05
	ld bc,Unknown_0x16518
	jp Unknown_0x0846

Unknown_0x1662F:
	call Unknown_0x19F3
	bit 5,a
	jr nz,Unknown_0x16637
	ret

Unknown_0x16637:
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	call Unknown_0x1EC0
	jp Unknown_0x1EF9
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$553D
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	ld b,a
	bit 5,a
	call nz,Unknown_0x1EF9
	ld a,b
	bit 7,a
	ret z
	call Unknown_0x1EC0
	ld e,$05
	ld bc,Unknown_0x16518
	jp Unknown_0x0846
	ld a,[bc]
	inc bc
	ld h,a
	push hl
	call Unknown_0x0647
	pop hl
	cp h
	ld e,$27
	jr c,Unknown_0x1667E
	xor a
	ld [de],a
	ret

Unknown_0x1667E:
	ld a,$01
	ld [de],a
	ret

Unknown_0x16682:
	call Unknown_0x203D
	ld e,$45
	ld a,[de]
	jr c,Unknown_0x1668B
	cpl

Unknown_0x1668B:
	bit 7,a
	ret

UnknownData_0x1668E:
INCBIN "baserom.gb", $1668E, $166ED - $1668E

Unknown_0x166ED:
INCBIN "baserom.gb", $166ED, $1683B - $166ED

Unknown_0x1683B:
INCBIN "baserom.gb", $1683B, $168A0 - $1683B
	ld e,$42
	ld a,[de]
	dec a
	ld [de],a
	ld e,$27
	jr z,Unknown_0x168AC
	xor a
	ld [de],a
	ret

Unknown_0x168AC:
	ld a,$01
	ld [de],a
	ret
	call Unknown_0x0DA4
	ret

UnknownData_0x168B4:
INCBIN "baserom.gb", $168B4, $168CA - $168B4
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld a,[$A071]
	and a
	jr nz,Unknown_0x168DF
	ld bc,$5583
	call Unknown_0x255B
	ret c
	jr Unknown_0x168EA

Unknown_0x168DF:
	ld e,$4A
	xor a
	ld [de],a
	ld bc,$5591
	call Unknown_0x255B
	ret c

Unknown_0x168EA:
	ld e,$3E
	ld a,[de]
	inc a
	ld [de],a
	cp $40
	jr nz,Unknown_0x168F8
	xor a
	ld [de],a
	call Unknown_0x16A9B

Unknown_0x168F8:
	ld b,$30
	call Unknown_0x15B4C
	jr c,Unknown_0x16900
	ret

Unknown_0x16900:
	ld a,[$A071]
	and a
	jr nz,Unknown_0x1690E
	ld e,$05
	ld bc,Unknown_0x166ED
	jp Unknown_0x0846

Unknown_0x1690E:
	ld e,$4A
	xor a
	ld [de],a
	ld e,$05
	ld bc,$679C
	jp Unknown_0x0846
	ld bc,$5583
	call Unknown_0x255B
	ret
	ld bc,$559F
	call Unknown_0x255B
	ret

UnknownData_0x16928:
INCBIN "baserom.gb", $16928, $16941 - $16928
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$5583
	call Unknown_0x255B
	ret c
	ld e,$0E
	ld a,[de]
	and a
	ret nz
	ld e,$11
	xor a
	ld [de],a
	ld e,$10
	ld a,[de]
	and a
	ret nz
	ld e,$05
	ld bc,$6698
	jp Unknown_0x0846
	ld e,$3F
	ld a,[de]
	inc a
	ld [de],a
	cp $10
	jr nz,Unknown_0x169C0
	xor a
	ld e,$3F
	ld [de],a
	dec e
	ld a,[de]
	inc a
	ld [de],a
	ld e,$3E
	ld a,[de]
	inc a
	ld [de],a
	ld e,$40
	ld a,[de]
	res 0,a
	res 4,a
	ld b,a
	call Unknown_0x1EC0
	ld e,$45
	ld a,[de]
	bit 7,a
	jr z,Unknown_0x16999
	bit 3,b
	jr nz,Unknown_0x16995
	set 0,b

Unknown_0x16995:
	set 3,b
	jr Unknown_0x169A1

Unknown_0x16999:
	bit 3,b
	jr z,Unknown_0x1699F
	set 0,b

Unknown_0x1699F:
	res 3,b

Unknown_0x169A1:
	call Unknown_0x201D
	ld e,$27
	ld a,[de]
	and a
	jr z,Unknown_0x169B4
	bit 7,b
	jr nz,Unknown_0x169B0
	set 4,b

Unknown_0x169B0:
	set 7,b
	jr Unknown_0x169BC

Unknown_0x169B4:
	bit 7,b
	jr z,Unknown_0x169BA
	set 4,b

Unknown_0x169BA:
	res 7,b

Unknown_0x169BC:
	ld e,$40
	ld a,b
	ld [de],a

Unknown_0x169C0:
	ld e,$40
	ld a,[de]
	bit 3,a
	jr nz,Unknown_0x169DB
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0x169D1
	ld e,$00

Unknown_0x169D1:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CB4
	jr Unknown_0x169ED

Unknown_0x169DB:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 0,a
	jr z,Unknown_0x169E5
	ld e,$00

Unknown_0x169E5:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CE5

Unknown_0x169ED:
	ld e,$40
	ld a,[de]
	bit 7,a
	jr z,Unknown_0x16A08
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0x169FE
	ld e,$00

Unknown_0x169FE:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	jr Unknown_0x16A1A

Unknown_0x16A08:
	ld h,d
	ld l,$12
	ld e,[hl]
	bit 4,a
	jr z,Unknown_0x16A12
	ld e,$00

Unknown_0x16A12:
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D66

Unknown_0x16A1A:
	ld e,$F8
	call Unknown_0x1AC1
	call z,Unknown_0x16A63
	call Unknown_0x0DA4
	ld a,[$A071]
	and a
	jr nz,Unknown_0x16A33
	ld e,$05
	ld bc,Unknown_0x1683B
	jp Unknown_0x0846

Unknown_0x16A33:
	ld bc,$559F
	call Unknown_0x255B
	ret c
	call Unknown_0x1F0D
	jr nz,Unknown_0x16A5B
	ld e,$12
	ld h,d
	ld l,$10
	ld a,[de]
	and $80
	ld b,a
	ld a,[hl]
	and $80
	xor b
	ret z
	ld e,$3E
	ld a,[de]
	cp $20
	ret c
	ld e,$05
	ld bc,$67EC
	jp Unknown_0x0846

Unknown_0x16A5B:
	ld e,$05
	ld bc,$6858
	jp Unknown_0x0846

Unknown_0x16A63:
	ld e,$0E
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x16A73
	xor a
	ld [de],a
	dec e
	ld a,[de]
	and $7F
	ld [de],a
	jr Unknown_0x16A7F

Unknown_0x16A73:
	ld a,$FF
	ld [de],a
	dec e
	ld a,[de]
	cpl
	inc a
	and $7F
	cpl
	inc a
	ld [de],a

Unknown_0x16A7F:
	ld e,$10
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x16A8E
	xor a
	ld [de],a
	dec e
	ld a,[de]
	and $7F
	ld [de],a
	ret

Unknown_0x16A8E:
	ld a,$FF
	ld [de],a
	dec e
	ld a,[de]
	cpl
	inc a
	and $7F
	cpl
	inc a
	ld [de],a
	ret

Unknown_0x16A9B:
	ld e,$12
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	ld a,[$A071]
	and a
	ld e,$27
	jr nz,Unknown_0x16AB9
	xor a
	ld [de],a
	ld e,$4A
	ld a,$75
	ld [de],a
	ret

Unknown_0x16AB9:
	ld a,$01
	ld [de],a
	ld e,$4A
	ld a,$00
	ld [de],a
	ret
	ld e,$0E
	ld a,[de]
	and a
	jr z,Unknown_0x16AD6
	bit 7,a
	ld e,$11
	jr nz,Unknown_0x16AD3
	ld a,$F8
	ld [de],a
	jr Unknown_0x16AD6

Unknown_0x16AD3:
	ld a,$08
	ld [de],a

Unknown_0x16AD6:
	ld e,$10
	ld a,[de]
	and a
	ret z
	bit 7,a
	ld e,$12
	jr nz,Unknown_0x16AE5
	ld a,$F8
	ld [de],a
	ret

Unknown_0x16AE5:
	ld a,$08
	ld [de],a
	ret

UnknownData_0x16AE9:
INCBIN "baserom.gb", $16AE9, $16AF3 - $16AE9

Unknown_0x16AF3:
INCBIN "baserom.gb", $16AF3, $16B16 - $16AF3

Unknown_0x16B16:
INCBIN "baserom.gb", $16B16, $16B3E - $16B16

Unknown_0x16B3E:
INCBIN "baserom.gb", $16B3E, $16B4E - $16B3E
	call Unknown_0x0DA4
	ld bc,$55C9
	call Unknown_0x255B
	ret c
	ld b,$30
	call Unknown_0x15B4C
	ret nc
	ld b,$24
	call Unknown_0x16BE4
	ret nc
	ld e,$05
	ld bc,Unknown_0x16AF3
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$55C9
	call Unknown_0x255B
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$55C9
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16B16
	jp Unknown_0x0846
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$55C9
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x16BBE
	ld e,$5C
	ld a,[de]
	and a
	jr z,Unknown_0x16BBE
	ld e,$05
	ld bc,$6B2D
	jp Unknown_0x0846

Unknown_0x16BBE:
	ld e,$05
	ld bc,Unknown_0x16B3E
	jp Unknown_0x0846

UnknownData_0x16BC6:
INCBIN "baserom.gb", $16BC6, $16BE4 - $16BC6

Unknown_0x16BE4:
	push de
	push bc
	ld e,$07
	ld l,e
	ld h,$A0
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,[hl]
	inc l
	ld d,[hl]
	ld a,c
	add a,$34
	ld c,a
	ld a,b
	adc a,$00
	ld b,a
	ld a,c
	sub e
	ld a,b
	sbc a,d
	jr c,Unknown_0x16C11
	ld a,c
	sub e
	ld c,a
	ld a,b
	cp d
	jr z,Unknown_0x16C0C
	ld a,$FF
	add a,c
	ld c,a

Unknown_0x16C0C:
	ld a,c
	pop bc
	pop de
	cp b
	ret

Unknown_0x16C11:
	ld a,e
	sub c
	ld e,a
	ld a,b
	cp d
	jr z,Unknown_0x16C1C
	ld a,$FF
	add a,e
	ld e,a

Unknown_0x16C1C:
	ld a,e
	pop bc
	pop de
	cp b
	ret

UnknownData_0x16C21:
INCBIN "baserom.gb", $16C21, $16C2E - $16C21

Unknown_0x16C2E:
INCBIN "baserom.gb", $16C2E, $16C64 - $16C2E

Unknown_0x16C64:
INCBIN "baserom.gb", $16C64, $16C91 - $16C64

Unknown_0x16C91:
INCBIN "baserom.gb", $16C91, $16CC9 - $16C91

Unknown_0x16CC9:
INCBIN "baserom.gb", $16CC9, $16CFB - $16CC9
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$55E5
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0x155F3
	call Unknown_0x24CD
	bit 6,a
	jr nz,Unknown_0x16D25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16C2E
	jp Unknown_0x0846

Unknown_0x16D25:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	ld bc,$55E5
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x155F3
	call Unknown_0x24A5
	bit 7,a
	ret nz
	ld e,$05
	ld bc,$6CF1
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$55E5
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0x155F3
	call Unknown_0x24CD
	bit 6,a
	jr nz,Unknown_0x16D6E
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16C64
	jp Unknown_0x0846

Unknown_0x16D6E:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$55E5
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0x155F3
	call Unknown_0x24CD
	bit 6,a
	jr nz,Unknown_0x16D9F
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16C91
	jp Unknown_0x0846

Unknown_0x16D9F:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$55E5
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0x155F3
	call Unknown_0x24CD
	bit 6,a
	jr nz,Unknown_0x16DD0
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16C2E
	jp Unknown_0x0846

Unknown_0x16DD0:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$55E5
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	ld bc,Unknown_0x155F3
	call Unknown_0x24CD
	bit 6,a
	jr nz,Unknown_0x16E12
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$40
	ld a,[de]
	inc a
	ld [de],a
	cp $03
	jr nc,Unknown_0x16E0A
	ld e,$05
	ld bc,Unknown_0x16CC9
	jp Unknown_0x0846

Unknown_0x16E0A:
	ld e,$05
	ld bc,Unknown_0x16C2E
	jp Unknown_0x0846

Unknown_0x16E12:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

UnknownData_0x16E19:
INCBIN "baserom.gb", $16E19, $16F41 - $16E19

Unknown_0x16F41:
INCBIN "baserom.gb", $16F41, $16F6D - $16F41

Unknown_0x16F6D:
INCBIN "baserom.gb", $16F6D, $16F7C - $16F6D

Unknown_0x16F7C:
INCBIN "baserom.gb", $16F7C, $16F97 - $16F7C

Unknown_0x16F97:
INCBIN "baserom.gb", $16F97, $16FA1 - $16F97

Unknown_0x16FA1:
INCBIN "baserom.gb", $16FA1, $16FB5 - $16FA1
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld e,$07
	ld a,[de]
	sub $03
	ld [de],a
	jr nc,Unknown_0x16FD0
	inc e
	ld a,[de]
	dec a
	ld [de],a

Unknown_0x16FD0:
	ld bc,$561D
	call Unknown_0x255B
	ret c
	ld e,$07
	ld a,[de]
	add a,$03
	ld [de],a
	jr nc,Unknown_0x16FE3
	inc e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x16FE3:
	ld a,[$DD2C]
	bit 2,a
	jr z,Unknown_0x16FF2
	ld e,$05
	ld bc,$6E9B
	jp Unknown_0x0846

Unknown_0x16FF2:
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x17014
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$3F
	ld a,$01
	ld [de],a
	ld e,$05
	ld bc,$6E3F
	jp Unknown_0x0846

Unknown_0x17014:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$561D
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x1A62
	bit 6,a
	jr nz,Unknown_0x17045
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,$6EE6
	jp Unknown_0x0846

Unknown_0x17045:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$561D
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x1A62
	bit 6,a
	jr nz,Unknown_0x17076
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,$6F1C
	jp Unknown_0x0846

Unknown_0x17076:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	ld bc,$561D
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x19CB
	bit 7,a
	ret nz
	ld e,$3F
	xor a
	ld [de],a
	ld e,$05
	ld bc,$6E6B
	jp Unknown_0x0846
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld hl,$5647
	call Unknown_0x23CA
	call Unknown_0x0DA4
	ld e,$07
	ld a,[de]
	sub $03
	ld [de],a
	jr nc,Unknown_0x170B7
	inc e
	ld a,[de]
	dec a
	ld [de],a

Unknown_0x170B7:
	ld bc,$561D
	call Unknown_0x255B
	ret c
	ld e,$07
	ld a,[de]
	add a,$03
	ld [de],a
	jr nc,Unknown_0x170CA
	inc e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x170CA:
	ld a,[$DD2C]
	bit 2,a
	jr z,Unknown_0x170D9
	ld e,$05
	ld bc,$6E9B
	jp Unknown_0x0846

Unknown_0x170D9:
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x172B5
	jr nz,Unknown_0x170EC
	ld e,$05
	ld bc,$6E9B
	jp Unknown_0x0846

Unknown_0x170EC:
	call Unknown_0x19CB
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	jr z,Unknown_0x170FF
	call Unknown_0x1710B
	jp c,Unknown_0x1EF9
	ret

Unknown_0x170FF:
	ld e,$3F
	xor a
	ld [de],a
	ld e,$05
	ld bc,$6E6B
	jp Unknown_0x0846

Unknown_0x1710B:
	push de
	call Unknown_0x1AEA
	push bc
	ld a,e
	sub $18
	ld e,a
	jr nc,Unknown_0x17117
	dec d

Unknown_0x17117:
	ld a,c
	add a,$09
	ld c,a
	jr nc,Unknown_0x1711E
	inc b

Unknown_0x1711E:
	push de
	call Unknown_0x1646
	pop de
	pop bc
	cp $FF
	jr z,Unknown_0x17132
	bit 2,a
	jr nz,Unknown_0x1714D
	and $03
	cp $01
	jr z,Unknown_0x1714D

Unknown_0x17132:
	ld a,c
	sub $09
	ld c,a
	jr nc,Unknown_0x17139
	dec b

Unknown_0x17139:
	call Unknown_0x1646
	cp $FF
	jr z,Unknown_0x1714A
	bit 2,a
	jr nz,Unknown_0x1714D
	and $03
	cp $01
	jr z,Unknown_0x1714D

Unknown_0x1714A:
	pop de
	and a
	ret

Unknown_0x1714D:
	pop de
	scf
	ret
	ld e,$07
	ld a,[de]
	add a,$0D
	ld [de],a
	jr nc,Unknown_0x1715C
	inc e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x1715C:
	ld bc,$562B
	call Unknown_0x255B
	ret c
	ld e,$07
	ld a,[de]
	sub $0D
	ld [de],a
	jr nc,Unknown_0x1716F
	dec e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x1716F:
	call Unknown_0x172B5
	jr nz,Unknown_0x1717C
	ld e,$05
	ld bc,Unknown_0x16F7C
	jp Unknown_0x0846

Unknown_0x1717C:
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x172BE
	and a
	ret z
	ld e,$05
	ld bc,$6F6D
	jp Unknown_0x0846

UnknownData_0x1718F:
INCBIN "baserom.gb", $1718F, $17190 - $1718F
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	ld a,$00
	jr z,Unknown_0x1719D
	ld a,$01

Unknown_0x1719D:
	ld [de],a
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld e,$07
	ld a,[de]
	add a,$0D
	ld [de],a
	jr nc,Unknown_0x171B9
	inc e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x171B9:
	ld bc,$562B
	call Unknown_0x255B
	ret c
	ld e,$07
	ld a,[de]
	sub $0D
	ld [de],a
	jr nc,Unknown_0x171CC
	inc e
	ld a,[de]
	dec a
	ld [de],a

Unknown_0x171CC:
	call Unknown_0x172B5
	jr nz,Unknown_0x171D9
	ld e,$05
	ld bc,Unknown_0x16F7C
	jp Unknown_0x0846

Unknown_0x171D9:
	call Unknown_0x2375
	call Unknown_0x2385
	ld bc,Unknown_0x15639
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x171F6
	call Unknown_0x172DE
	and a
	ret nz
	ld e,$05
	ld bc,Unknown_0x16F41
	jp Unknown_0x0846

Unknown_0x171F6:
	ld e,$05
	ld bc,Unknown_0x16F6D
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$561D
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x17228
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16F97
	jp Unknown_0x0846

Unknown_0x17228:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	ld a,$00
	jr z,Unknown_0x1723C
	ld a,$01

Unknown_0x1723C:
	ld [de],a
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld bc,$561D
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x1A25
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16FA1
	jp Unknown_0x0846
	ld e,$10
	ld a,[de]
	bit 7,a
	ld e,$15
	xor a
	jr z,Unknown_0x17277
	inc a

Unknown_0x17277:
	ld [de],a
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$562B
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x2385
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x16F97
	jp Unknown_0x0846
	ld hl,$DD2D
	ld [hl],$00
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,e
	ld [hl],d
	ld l,$5B
	ld e,l
	ld a,[hl]
	ld [de],a
	ld l,$5C
	ld e,l
	ld a,[hl]
	ld [de],a
	ld l,$45
	ld e,l
	ld a,[hl]
	ld [de],a
	ret

Unknown_0x172B5:
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$4C
	ld a,[hl]
	and a
	ret

Unknown_0x172BE:
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$03
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	sub $0F
	ld [de],a
	inc e
	ld a,[hl]
	sbc a,$00
	ld [de],a
	ld l,$3F
	ld a,[hl]
	ret

Unknown_0x172DE:
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$03
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ld e,$45
	ld l,e
	ld a,[hl]
	ld [de],a
	ld l,$3F
	ld a,[hl]
	ret

UnknownData_0x172F6:
INCBIN "baserom.gb", $172F6, $1730F - $172F6

Unknown_0x1730F:
INCBIN "baserom.gb", $1730F, $17339 - $1730F

Unknown_0x17339:
INCBIN "baserom.gb", $17339, $1736D - $17339

Unknown_0x1736D:
INCBIN "baserom.gb", $1736D, $1737D - $1736D

Unknown_0x1737D:
INCBIN "baserom.gb", $1737D, $173BC - $1737D

Unknown_0x173BC:
INCBIN "baserom.gb", $173BC, $17504 - $173BC

Unknown_0x17504:
INCBIN "baserom.gb", $17504, $179D8 - $17504

Unknown_0x179D8:
INCBIN "baserom.gb", $179D8, $17A12 - $179D8
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x17A46
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	jr z,Unknown_0x17A4D
	ld e,$05
	ld bc,Unknown_0x1730F
	jp Unknown_0x0846

Unknown_0x17A46:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x17A4D:
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,Unknown_0x179D8
	jp Unknown_0x0846
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x17A8D
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	jr z,Unknown_0x17A94
	ld e,$05
	ld bc,$7304
	jp Unknown_0x0846

Unknown_0x17A8D:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x17A94:
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,$79D8
	jp Unknown_0x0846
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld e,$3F
	ld a,[de]
	ld hl,$56AF
	add a,l
	jr nc,Unknown_0x17AB0
	inc h

Unknown_0x17AB0:
	ld l,a
	call Unknown_0x23CA
	call Unknown_0x0DA4
	ld bc,$567F
	call Unknown_0x255B
	ret c
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x17AE0
	call Unknown_0x17F6E
	jr nc,Unknown_0x17AE0
	ld l,$5A
	ld a,[hl]
	ld e,$44
	cp $01
	jr nz,Unknown_0x17AD6
	ld a,$01
	jr Unknown_0x17AD7

Unknown_0x17AD6:
	xor a

Unknown_0x17AD7:
	ld [de],a
	ld e,$05
	ld bc,$7517
	jp Unknown_0x0846

Unknown_0x17AE0:
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 4,a
	jr nz,Unknown_0x17AFD
	bit 5,a
	jr nz,Unknown_0x17AFD
	bit 7,a
	jr nz,Unknown_0x17B05
	ld e,$05
	ld bc,Unknown_0x1736D
	jp Unknown_0x0846

Unknown_0x17AFD:
	ld e,$05
	ld bc,Unknown_0x17339
	jp Unknown_0x0846

Unknown_0x17B05:
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,$79D1
	jp Unknown_0x0846
	ld bc,$567F
	call Unknown_0x255B
	ret c
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x17B3A
	call Unknown_0x17F6E
	jr nc,Unknown_0x17B3A
	ld l,$5A
	ld a,[hl]
	ld e,$44
	cp $01
	jr nz,Unknown_0x17B30
	ld a,$01
	jr Unknown_0x17B31

Unknown_0x17B30:
	xor a

Unknown_0x17B31:
	ld [de],a
	ld e,$05
	ld bc,$7517
	jp Unknown_0x0846

Unknown_0x17B3A:
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	jr nz,Unknown_0x17B4F
	ld e,$05
	ld bc,$736D
	jp Unknown_0x0846

Unknown_0x17B4F:
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,$79D1
	jp Unknown_0x0846
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	jr nz,Unknown_0x17B77
	ld e,$05
	ld bc,$736D
	jp Unknown_0x0846

Unknown_0x17B77:
	call Unknown_0x1F0D
	ret nz
	ld e,$05
	ld bc,$730F
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 6,a
	jr nz,Unknown_0x17BAE
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	jr z,Unknown_0x17BB5
	ld e,$05
	ld bc,$730F
	jp Unknown_0x0846

Unknown_0x17BAE:
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x17BB5:
	call Unknown_0x1F0D
	ret nz
	ld e,$05
	ld bc,$7376
	jp Unknown_0x0846
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	jr nz,Unknown_0x17BDD
	ld e,$05
	ld bc,$736D
	jp Unknown_0x0846

Unknown_0x17BDD:
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,$79D1
	jp Unknown_0x0846
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld e,$3F
	ld a,[de]
	ld hl,$56BF
	add a,l
	jr nc,Unknown_0x17BF9
	inc h

Unknown_0x17BF9:
	ld l,a
	call Unknown_0x23CA
	call Unknown_0x0DA4
	ld bc,$567F
	call Unknown_0x255B
	ret c
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x17C29
	call Unknown_0x17F6E
	jr nc,Unknown_0x17C29
	ld l,$5A
	ld a,[hl]
	ld e,$44
	cp $01
	jr nz,Unknown_0x17C1F
	ld a,$01
	jr Unknown_0x17C20

Unknown_0x17C1F:
	xor a

Unknown_0x17C20:
	ld [de],a
	ld e,$05
	ld bc,$7517
	jp Unknown_0x0846

Unknown_0x17C29:
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 4,a
	jr nz,Unknown_0x17C46
	bit 5,a
	jr nz,Unknown_0x17C46
	bit 7,a
	jr nz,Unknown_0x17C4E
	ld e,$05
	ld bc,$736D
	jp Unknown_0x0846

Unknown_0x17C46:
	ld e,$05
	ld bc,Unknown_0x173BC
	jp Unknown_0x0846

Unknown_0x17C4E:
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,$79D1
	jp Unknown_0x0846
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld e,$3F
	ld a,[de]
	ld hl,$56CF
	add a,l
	jr nc,Unknown_0x17C6A
	inc h

Unknown_0x17C6A:
	ld l,a
	call Unknown_0x23CA
	ld e,$3E
	ld a,[de]
	and a
	jr nz,Unknown_0x17C77
	call Unknown_0x0DA4

Unknown_0x17C77:
	ld bc,$567F
	call Unknown_0x255B
	ret c
	ld e,$5B
	ld a,[de]
	and a
	jr nz,Unknown_0x17CA0
	call Unknown_0x17F6E
	jr nc,Unknown_0x17CA0
	ld l,$5A
	ld a,[hl]
	ld e,$44
	cp $01
	jr nz,Unknown_0x17C96
	ld a,$01
	jr Unknown_0x17C97

Unknown_0x17C96:
	xor a

Unknown_0x17C97:
	ld [de],a
	ld e,$05
	ld bc,$7517
	jp Unknown_0x0846

Unknown_0x17CA0:
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 4,a
	jr nz,Unknown_0x17CBD
	bit 5,a
	jr nz,Unknown_0x17CBD
	bit 7,a
	jr nz,Unknown_0x17CC3
	ld e,$05
	ld bc,Unknown_0x1736D
	jp Unknown_0x0846

Unknown_0x17CBD:
	ld e,$3E
	ld a,$01
	ld [de],a
	ret

Unknown_0x17CC3:
	call Unknown_0x1F0D
	ret z
	ld e,$05
	ld bc,$79D1
	jp Unknown_0x0846
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	ret nz
	ld e,$44
	ld a,$01
	ld [de],a
	ld e,$05
	ld bc,Unknown_0x1737D
	jp Unknown_0x0846
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	ret nz
	ld e,$05
	ld bc,Unknown_0x1736D
	jp Unknown_0x0846
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$05
	ld bc,$7718
	jp Unknown_0x0846

UnknownData_0x17D2B:
INCBIN "baserom.gb", $17D2B, $17D32 - $17D2B
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 7,a
	ret nz
	ld e,$05
	ld bc,Unknown_0x1736D
	jp Unknown_0x0846
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$05
	ld bc,Unknown_0x17504
	jp Unknown_0x0846
	ld e,$3E
	ld a,[de]
	and a
	jr nz,Unknown_0x17D7A
	call Unknown_0x0C80
	call Unknown_0x0DA4

Unknown_0x17D7A:
	ld bc,$567F
	call Unknown_0x255B
	ret c
	call Unknown_0x2385
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 4,a
	jr nz,Unknown_0x17D9D
	bit 5,a
	jr nz,Unknown_0x17D9D
	bit 7,a
	ret nz
	ld e,$05
	ld bc,$736D
	jp Unknown_0x0846

Unknown_0x17D9D:
	ld e,$3E
	ld a,$01
	ld [de],a
	ret
	call Unknown_0x0C91
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$568D
	call Unknown_0x255B
	ret c
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$44
	ld a,[hl]
	and a
	jr nz,Unknown_0x17DC1
	call Unknown_0x172B5
	ret nz

Unknown_0x17DC1:
	ld e,$05
	ld bc,Unknown_0x15C14
	jp Unknown_0x0846
	call Unknown_0x17F6E
	ld l,$5A
	ld a,[hl]
	cp $00
	jr nz,Unknown_0x17DD8
	ld e,$60
	ld a,$3F
	ld [de],a

Unknown_0x17DD8:
	ld bc,$568D
	call Unknown_0x255B
	ret
	call Unknown_0x0C91
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$569B
	call Unknown_0x255B
	ret
	call Unknown_0x0C91
	call Unknown_0x0C80
	call Unknown_0x0DA4
	ld bc,$569B
	call Unknown_0x255B
	ret

UnknownData_0x17DFF:
INCBIN "baserom.gb", $17DFF, $17E22 - $17DFF
	push bc
	ld b,$40
	ld c,$48
	call Unknown_0x1F14
	pop bc
	ld e,$27
	jr c,Unknown_0x17E32
	xor a
	ld [de],a
	ret

Unknown_0x17E32:
	ld a,$01
	ld [de],a
	ret
	push bc
	ld b,$30
	call Unknown_0x1F14
	pop bc
	ld e,$27
	jr c,Unknown_0x17E44
	xor a
	ld [de],a
	ret

Unknown_0x17E44:
	ld a,$01
	ld [de],a
	ret
	push bc
	ld b,$40
	ld c,$28
	call Unknown_0x1F14
	pop bc
	ld e,$27
	jr nc,Unknown_0x17E58
	xor a
	ld [de],a
	ret

Unknown_0x17E58:
	ld a,$01
	ld [de],a
	ret
	push bc
	ld b,$34
	call Unknown_0x15B4C
	pop bc
	ld e,$27
	jr nc,Unknown_0x17E6B
	ld a,$01
	ld [de],a
	ret

Unknown_0x17E6B:
	ld a,$00
	ld [de],a
	ret
	push bc
	push de
	call Unknown_0x0647
	pop de
	cp $40
	jr c,Unknown_0x17E82
	ld b,$20
	call Unknown_0x15B11
	jr c,Unknown_0x17E90
	jr Unknown_0x17E89

Unknown_0x17E82:
	ld b,$20
	call Unknown_0x15B11
	jr nc,Unknown_0x17E90

Unknown_0x17E89:
	ld e,$27
	ld a,$01
	ld [de],a
	pop bc
	ret

Unknown_0x17E90:
	ld e,$27
	xor a
	ld [de],a
	pop bc
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$27
	ld e,l
	ld a,[hl]
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	ld e,l
	ld a,[hl]
	ld [de],a
	ret
	ld e,$07
	ld a,[de]
	sub $14
	ld [de],a
	jr nc,Unknown_0x17EB6
	inc e
	ld a,[de]
	dec a
	ld [de],a

Unknown_0x17EB6:
	ret
	push bc
	ld b,$20
	call Unknown_0x15B4C
	pop bc
	jr nc,Unknown_0x17EC6
	ld e,$27
	ld a,$01
	ld [de],a
	ret

Unknown_0x17EC6:
	ld e,$27
	xor a
	ld [de],a
	ret
	push bc
	push de
	ld e,$07
	ld l,e
	ld h,$A0
	ld a,[de]
	ld c,a
	inc e
	ld a,[de]
	ld b,a
	ld e,[hl]
	inc l
	ld d,[hl]
	ld a,c
	sub e
	ld c,a
	ld a,b
	sbc a,d
	pop de
	jr c,Unknown_0x17F04
	ld a,c
	cp $10
	jr c,Unknown_0x17F04
	ld e,$5C
	ld a,[de]
	and a
	jr nz,Unknown_0x17EF6
	call Unknown_0x0647
	cp $80
	jr nc,Unknown_0x17F04
	jr Unknown_0x17EFD

Unknown_0x17EF6:
	call Unknown_0x0647
	cp $C0
	jr nc,Unknown_0x17F04

Unknown_0x17EFD:
	ld e,$27
	ld a,$03
	ld [de],a
	pop bc
	ret

Unknown_0x17F04:
	call Unknown_0x0647
	cp $40
	jr c,Unknown_0x17F1D
	cp $A0
	jr c,Unknown_0x17F16
	ld e,$27
	ld a,$00
	ld [de],a
	pop bc
	ret

Unknown_0x17F16:
	ld e,$27
	ld a,$01
	ld [de],a
	pop bc
	ret

Unknown_0x17F1D:
	ld e,$27
	ld a,$02
	ld [de],a
	pop bc
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	ld a,[hl]
	bit 7,a
	jr nz,Unknown_0x17F3C
	ld e,$04
	ld a,[de]
	add a,$10
	ld [de],a
	jr nc,Unknown_0x17F3B
	inc e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x17F3B:
	ret

Unknown_0x17F3C:
	ld e,$04
	ld a,[de]
	sub $10
	ld [de],a
	jr nc,Unknown_0x17F48
	inc e
	ld a,[de]
	dec a
	ld [de],a

Unknown_0x17F48:
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$45
	ld a,[hl]
	bit 7,a
	jr nz,Unknown_0x17F61
	ld e,$04
	ld a,[de]
	add a,$10
	ld [de],a
	jr nc,Unknown_0x17F60
	inc e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x17F60:
	ret

Unknown_0x17F61:
	ld e,$04
	ld a,[de]
	sub $10
	ld [de],a
	jr nc,Unknown_0x17F6D
	inc e
	ld a,[de]
	dec a
	ld [de],a

Unknown_0x17F6D:
	ret

Unknown_0x17F6E:
	ld h,$A5
	ld c,$03

Unknown_0x17F72:
	push bc
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x17F95
	ld l,$4C
	ld a,[hl]
	or a
	jr z,Unknown_0x17F95
	ld e,$04
	ld b,$30
	call Unknown_0x1F9E
	jr nc,Unknown_0x17F95
	ld e,$07
	ld b,$20
	call Unknown_0x1F9E
	jr nc,Unknown_0x17F95
	pop bc
	scf
	ret

Unknown_0x17F95:
	pop bc
	dec c
	ret z
	inc h
	jr Unknown_0x17F72

UnknownData_0x17F9B:
INCBIN "baserom.gb", $17F9B, $18000 - $17F9B

SECTION "Bank06", ROMX, BANK[$06]

UnknownData_0x18000:
INCBIN "baserom.gb", $18000, $18299 - $18000

Unknown_0x18299:
INCBIN "baserom.gb", $18299, $1834E - $18299

Unknown_0x1834E:
INCBIN "baserom.gb", $1834E, $184B5 - $1834E
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	sub [hl]
	cp $19
	jr c,Unknown_0x184C3
	xor a
	jr Unknown_0x184C5

Unknown_0x184C3:
	ld a,$01

Unknown_0x184C5:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x184C9:
INCBIN "baserom.gb", $184C9, $185CE - $184C9

Unknown_0x185CE:
INCBIN "baserom.gb", $185CE, $185E6 - $185CE

Unknown_0x185E6:
INCBIN "baserom.gb", $185E6, $1861C - $185E6
	call Unknown_0x2323
	ret nz
	ld e,$4C
	ld a,[de]
	cp $15
	ret nc
	ld a,$01
	ld e,$5C
	ld [de],a
	ret

UnknownData_0x1862C:
INCBIN "baserom.gb", $1862C, $18668 - $1862C

Unknown_0x18668:
INCBIN "baserom.gb", $18668, $18686 - $18668

Unknown_0x18686:
INCBIN "baserom.gb", $18686, $18758 - $18686
	ld a,[bc]
	inc bc
	ld h,d
	ld l,$15
	add a,[hl]
	ld [hl],a
	ret

UnknownData_0x18760:
INCBIN "baserom.gb", $18760, $188E2 - $18760

Unknown_0x188E2:
INCBIN "baserom.gb", $188E2, $18966 - $188E2

Unknown_0x18966:
INCBIN "baserom.gb", $18966, $18B97 - $18966
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$06
	ld bc,Unknown_0x185CE
	jp Unknown_0x0846
	call Unknown_0x19017
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$06
	ld bc,$45E6
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $10
	jr c,Unknown_0x18BCD
	cp $91
	jr c,Unknown_0x18BD8

Unknown_0x18BCD:
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$4B
	inc l
	ld [hl],$D8

Unknown_0x18BD8:
	ld bc,$4000
	call Unknown_0x233C
	jr nc,Unknown_0x18BE8
	ld e,$06
	ld bc,$45CE
	jp Unknown_0x0846

Unknown_0x18BE8:
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x18BF1
	dec a
	ld [de],a
	ret

Unknown_0x18BF1:
	ld a,$06
	ld [de],a
	ld e,$27
	ld a,[de]
	ld e,$CB
	call Unknown_0x2319
	ld e,$40
	ld a,[de]
	cp $05
	jr z,Unknown_0x18C0D
	inc a
	ld [de],a
	cp $03
	ret nz
	ld h,d
	ld l,$27
	inc [hl]
	ret

Unknown_0x18C0D:
	ld e,$27
	ld a,[de]
	cp $05
	jr nz,Unknown_0x18C20
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$4C
	inc l
	ld [hl],$2C
	ret

Unknown_0x18C20:
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$4B
	inc l
	ld [hl],$97
	ret
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x18C47
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x18C3D
	dec a
	ld [de],a
	ret

Unknown_0x18C3D:
	ld a,$06
	ld [de],a
	ld a,$06
	ld e,$CB
	jp Unknown_0x2319

Unknown_0x18C47:
	ld e,$06
	ld bc,$45CE
	jp Unknown_0x0846
	call Unknown_0x19017
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$06
	ld bc,$45E6
	jp Unknown_0x0846
	call Unknown_0x19017
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x18CA8
	ld b,$00
	ld h,d
	ld e,$04
	ld l,$40
	ld a,[de]
	cp [hl]
	jr nz,Unknown_0x18C8A
	inc b
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a

Unknown_0x18C8A:
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	cp $18
	ret nc
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$12
	ld [de],a
	ld a,b
	or a
	ret z
	ld e,$06
	ld bc,Unknown_0x1834E
	jp Unknown_0x0846

Unknown_0x18CA8:
	ld e,$06
	ld bc,$45E6
	jp Unknown_0x0846
	call Unknown_0x19017
	call Unknown_0x1ED3
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$06
	ld bc,$45E6
	jp Unknown_0x0846
	call Unknown_0x19017
	call Unknown_0x1EE6
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x18CF1
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	sub [hl]
	cp $70
	ret c
	ld e,$06
	ld bc,$45BC
	jp Unknown_0x0846

Unknown_0x18CF1:
	ld e,$06
	ld bc,Unknown_0x185E6
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x255B
	call Unknown_0x1A25
	bit 7,a
	jr z,Unknown_0x18D14
	ld e,$06
	ld bc,Unknown_0x18668
	jp Unknown_0x0846

Unknown_0x18D14:
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x18D1C
	dec a
	ld [de],a

Unknown_0x18D1C:
	ld a,$08
	ld [de],a
	call Unknown_0x0647
	and $03
	add a,$15
	ld e,$CB
	jp Unknown_0x2319
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x255B
	call Unknown_0x1A25
	bit 7,a
	jr nz,Unknown_0x18D51
	call Unknown_0x18D14
	ld e,$04
	ld a,[de]
	ld h,d
	ld l,$40
	cp [hl]
	ret nz
	ld e,$06
	ld bc,$4686
	jp Unknown_0x0846

Unknown_0x18D51:
	ld h,d
	ld l,$3F
	dec [hl]
	jr nz,Unknown_0x18D69
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$4D
	inc l
	ld [hl],$7C
	ret

Unknown_0x18D69:
	ld a,[hl]
	ld hl,$40D4
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x18D76
	inc h

Unknown_0x18D76:
	call Unknown_0x20F9
	jp Unknown_0x20BE
	call Unknown_0x0DA4
	call Unknown_0x18D14
	ld bc,$4000
	call Unknown_0x255B
	ld e,$04
	ld a,[de]
	ld h,d
	ld l,$40
	cp [hl]
	ret nz
	ld e,$06
	ld bc,Unknown_0x18686
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	jp Unknown_0x255B
	call Unknown_0x0DA4
	ld bc,$40E3
	jp Unknown_0x255B
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$40FF
	jp Unknown_0x255B
	call Unknown_0x21D8
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$40FF
	call Unknown_0x255B
	ret c
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld [hl],$04
	ld l,$40
	dec [hl]
	jr nz,Unknown_0x18DDD
	ld e,$06
	ld bc,$47FB
	jp Unknown_0x0846

Unknown_0x18DDD:
	call Unknown_0x203D
	ld e,$3C
	ld a,[de]
	jr nc,Unknown_0x18DEA
	rlca
	jr nc,Unknown_0x18E00
	jr Unknown_0x18DED

Unknown_0x18DEA:
	rlca
	jr c,Unknown_0x18E00

Unknown_0x18DED:
	ld e,$3B
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a

Unknown_0x18E00:
	call Unknown_0x202B
	ld e,$3A
	ld a,[de]
	jr nc,Unknown_0x18E0C
	rlca
	ret nc
	jr Unknown_0x18E0E

Unknown_0x18E0C:
	rlca
	ret c

Unknown_0x18E0E:
	ld e,$39
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ret
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D70
	call Unknown_0x0DA4
	ld bc,$40FF
	jp Unknown_0x255B

Unknown_0x18E31:
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$04
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld l,$07
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld l,$47
	ld e,l
	ld a,[hl]
	ld [de],a
	ld bc,$40F1
	jp Unknown_0x255B
	call Unknown_0x18E31
	ld e,$27
	ld a,[de]
	cp $01
	ret nz
	ld e,$06
	ld bc,Unknown_0x188E2
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$410D
	jp Unknown_0x255B

UnknownData_0x18E6A:
INCBIN "baserom.gb", $18E6A, $18E88 - $18E6A
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$40FF
	call Unknown_0x255B
	ret c
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld [hl],$20
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	call Unknown_0x0647
	ld c,$00
	ld b,a

Unknown_0x18ECB:
	ld a,[hli]
	or a
	jr z,Unknown_0x18ED5
	cp b
	jr nc,Unknown_0x18ED5
	inc c
	jr Unknown_0x18ECB

Unknown_0x18ED5:
	ld a,c
	ld e,$27
	ld [de],a
	pop bc
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x18EEA
	inc h

Unknown_0x18EEA:
	ld e,$04
	ld a,[$DB51]
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,[$DB52]
	adc a,[hl]
	ld [de],a
	ret
	ld a,[bc]
	ld e,a
	inc bc
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0x18F08
	inc h

Unknown_0x18F08:
	ld a,[hl]
	ld e,$24
	ld [de],a
	ret
	push bc
	ld h,$A0
	ld e,$04
	ld l,e
	ld a,[de]
	sub [hl]
	ld b,a
	inc l
	inc e
	ld a,[de]
	sbc a,[hl]
	jr nc,Unknown_0x18F20
	ld a,b
	cpl
	inc a
	ld b,a

Unknown_0x18F20:
	ld e,$07
	ld l,e
	ld a,[de]
	sub $08
	sub [hl]
	ld c,a
	inc l
	inc e
	ld a,[de]
	sbc a,[hl]
	jr nc,Unknown_0x18F32
	ld a,c
	cpl
	inc a
	ld c,a

Unknown_0x18F32:
	ld a,b
	sra a
	cp c
	jr c,Unknown_0x18F3C
	ld a,$1B
	jr Unknown_0x18F4F

Unknown_0x18F3C:
	ld a,b
	or a
	jr z,Unknown_0x18F4D
	ld a,c
	call Unknown_0x18F79
	ld a,c
	cp $05
	jr nc,Unknown_0x18F4D
	ld a,$1C
	jr Unknown_0x18F4F

Unknown_0x18F4D:
	ld a,$1D

Unknown_0x18F4F:
	ld e,$15
	ld [de],a
	pop bc
	ret
	ld e,$15
	ld a,[de]
	cp $1F
	jr z,Unknown_0x18F5E
	inc a
	ld [de],a
	xor a

Unknown_0x18F5E:
	ld a,$01
	ld e,$27
	ld [de],a
	ret

UnknownData_0x18F64:
INCBIN "baserom.gb", $18F64, $18F66 - $18F64

Unknown_0x18F66:
	ld a,[bc]
	inc bc
	ld l,a
	rla
	sbc a,a
	ld h,a
	ld a,[de]
	add a,l
	ld [de],a
	inc e
	ld a,[de]
	adc a,h
	ld [de],a
	ret
	ld e,$07
	jp Unknown_0x18F66

Unknown_0x18F79:
	ld c,$00

Unknown_0x18F7B:
	sub b
	jr c,Unknown_0x18F81
	inc c
	jr Unknown_0x18F7B

Unknown_0x18F81:
	add a,b
	srl b
	sbc a,b
	ret c
	inc c
	ret
	ld e,$5B
	ld a,[de]

Unknown_0x18F8B:
	ld hl,$4129
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x18F97
	inc h

Unknown_0x18F97:
	call Unknown_0x20F9
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$15
	ld a,[hl]
	ld [de],a
	ret
	ld e,$04
	ld a,[de]
	ld e,$40
	ld hl,$DB51
	sub [hl]
	cp $50
	jr c,Unknown_0x18FBB
	ld a,$88
	add a,[hl]
	ld [de],a
	ld a,$40
	jr Unknown_0x18FC1

Unknown_0x18FBB:
	ld a,$18
	add a,[hl]
	ld [de],a
	ld a,$C0

Unknown_0x18FC1:
	ld e,$45
	ld [de],a
	ret
	ld hl,$404D
	ld e,$41
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x18FD1
	inc h

Unknown_0x18FD1:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	ld a,[hl]
	inc e
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5B
	ld a,[de]
	sub $0D
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x18FEA
	inc h

Unknown_0x18FEA:
	jp Unknown_0x20F9
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0x18FF8
	ld hl,$0100
	jr Unknown_0x18FFB

Unknown_0x18FF8:
	ld hl,$FF00

Unknown_0x18FFB:
	ld e,$3B
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	call Unknown_0x202B
	jr nc,Unknown_0x1900C
	ld hl,$0100
	jr Unknown_0x1900F

Unknown_0x1900C:
	ld hl,$FF00

Unknown_0x1900F:
	ld e,$39
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

Unknown_0x19017:
	call Unknown_0x1EC0
	call Unknown_0x202B
	jr nc,Unknown_0x19023
	ld a,$07
	jr Unknown_0x19025

Unknown_0x19023:
	ld a,$0A

Unknown_0x19025:
	ld e,$15
	ld [de],a
	ret
	call Unknown_0x0647
	ld hl,$4059
	and $07
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x19037
	inc h

Unknown_0x19037:
	ld a,[hli]
	ld h,[hl]
	ld e,$3D
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	cp $80
	jr nz,Unknown_0x19059
	ld e,a
	call Unknown_0x0647
	cp e
	jr c,Unknown_0x19057
	inc hl
	ld a,[hli]
	jr Unknown_0x19059

Unknown_0x19057:
	ld a,[hli]
	inc hl

Unknown_0x19059:
	ld e,$27
	ld [de],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld e,$42
	ld a,[de]
	rlca
	ld e,$0D
	jr c,Unknown_0x19074
	ld a,[bc]
	ld [de],a
	inc bc
	inc e
	ld a,[bc]
	ld [de],a
	inc bc
	ret

Unknown_0x19074:
	ld a,[bc]
	cpl
	add a,$01
	ld [de],a
	inc bc
	inc e
	ld a,[bc]
	cpl
	adc a,$00
	ld [de],a
	inc bc
	ret
	ld e,$42
	ld a,[de]
	rlca
	ld e,$11
	jr c,Unknown_0x1908E
	ld a,[bc]
	ld [de],a
	inc bc
	ret

Unknown_0x1908E:
	ld a,[bc]
	cpl
	inc a
	ld [de],a
	inc bc
	ret
	ld e,$04
	ld a,[de]
	ld e,$40
	ld hl,$DB51
	sub [hl]
	cp $50
	jr nc,Unknown_0x190A9
	ld a,$88
	add a,[hl]
	ld [de],a
	ld a,$40
	jr Unknown_0x190AF

Unknown_0x190A9:
	ld a,$18
	add a,[hl]
	ld [de],a
	ld a,$C0

Unknown_0x190AF:
	ld e,$45
	ld [de],a
	ld e,$42
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$27
	ld a,[bc]
	inc bc
	ld [hl],a
	ret
	call Unknown_0x0647
	and $07
	ld e,a
	rlca
	add a,e
	ld hl,$40B1
	add a,l
	ld l,a
	jr nc,Unknown_0x190D0
	inc h

Unknown_0x190D0:
	call Unknown_0x20F9
	ld e,$45
	ld a,[de]
	rlca
	ld e,$41
	jr c,Unknown_0x190DE
	ld a,[hl]
	ld [de],a
	ret

Unknown_0x190DE:
	ld a,[hl]
	cpl
	inc a
	ld [de],a
	ret
	push bc
	ld e,$48
	ld a,[de]
	cp $A8
	jr c,Unknown_0x190FD
	cp $B2
	jr nc,Unknown_0x190FD
	ld h,a
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x190FD
	call Unknown_0x0BBA
	ld a,[$FF00+$9A]
	ld d,a

Unknown_0x190FD:
	pop bc
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	call Unknown_0x20F9
	jp Unknown_0x20BE

UnknownData_0x1910B:
INCBIN "baserom.gb", $1910B, $1913C - $1910B
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	inc bc
	ld e,$3E
	ld [de],a
	dec e
	ld a,l
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	cp $FF
	jr nz,Unknown_0x19158
	ld hl,$416D
	ld a,[hli]

Unknown_0x19158:
	ld e,$27
	ld [de],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

UnknownData_0x19163:
INCBIN "baserom.gb", $19163, $192CA - $19163

Unknown_0x192CA:
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x196CD
	ld bc,$415F
	call Unknown_0x233C
	ret nc
	ld e,$06
	ld bc,Unknown_0x1960C
	jp Unknown_0x0846

UnknownData_0x192E2:
INCBIN "baserom.gb", $192E2, $19322 - $192E2

Unknown_0x19322:
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x1934F
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	cp $18
	jr c,Unknown_0x19340
	cp $88
	jr c,Unknown_0x1934F
	ld e,$0E
	ld a,[de]
	rlca
	jr c,Unknown_0x1934F
	jr Unknown_0x19346

Unknown_0x19340:
	ld e,$0E
	ld a,[de]
	rlca
	jr nc,Unknown_0x1934F

Unknown_0x19346:
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ld e,$11
	ld [de],a

Unknown_0x1934F:
	call Unknown_0x1EE6
	jp Unknown_0x192CA
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	cp $48
	jr c,Unknown_0x19368
	cp $58
	jr nc,Unknown_0x19368
	ld a,$01
	jr Unknown_0x19369

Unknown_0x19368:
	xor a

Unknown_0x19369:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x1936D:
INCBIN "baserom.gb", $1936D, $193DA - $1936D

Unknown_0x193DA:
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $20
	jr c,Unknown_0x193F9
	cp $80
	jr c,Unknown_0x193F2
	ld e,$45
	ld a,[de]
	rlca
	jr c,Unknown_0x193F2
	cpl
	inc a
	ld [de],a

Unknown_0x193F2:
	ld e,$45
	ld a,[de]
	ld e,$42
	ld [de],a
	ret

Unknown_0x193F9:
	ld e,$45
	ld a,[de]
	rlca
	jr nc,Unknown_0x193F2
	cpl
	inc a
	ld [de],a
	jr Unknown_0x193F2
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x193DA

UnknownData_0x1940D:
INCBIN "baserom.gb", $1940D, $1949C - $1940D
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	sub [hl]
	cp $2D
	ld a,$00
	jr nc,Unknown_0x194AA
	inc a

Unknown_0x194AA:
	ld e,$27
	ld [de],a
	ret
	ld e,$3F
	ld a,[de]
	or a
	jr z,Unknown_0x194B8
	dec a
	ld [de],a
	jr Unknown_0x194C1

Unknown_0x194B8:
	ld a,$02
	ld [de],a
	ld e,$47
	ld a,[de]
	xor $10
	ld [de],a

Unknown_0x194C1:
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x194CC
	dec a
	ld [de],a
	jp Unknown_0x19322

Unknown_0x194CC:
	ld a,$08
	ld [de],a
	ld a,$1B
	ld e,$CB
	call Unknown_0x2319
	jp Unknown_0x19322

UnknownData_0x194D9:
INCBIN "baserom.gb", $194D9, $1954C - $194D9
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	ld l,$01
	cp $40
	jr c,Unknown_0x19563
	cp $60
	jr nc,Unknown_0x19567
	ld e,$45
	ld a,[de]
	dec l
	jr Unknown_0x19569

Unknown_0x19563:
	ld a,$40
	jr Unknown_0x19569

Unknown_0x19567:
	ld a,$C0

Unknown_0x19569:
	ld e,$3A
	ld [de],a
	ld e,$41
	ld a,l
	ld [de],a
	call Unknown_0x202B
	jr c,Unknown_0x19578
	xor a
	jr Unknown_0x1957A

Unknown_0x19578:
	ld a,$01

Unknown_0x1957A:
	ld e,$43
	ld [de],a
	ret

UnknownData_0x1957E:
INCBIN "baserom.gb", $1957E, $195A5 - $1957E
	push bc
	ld e,$27
	ld a,[de]
	ld e,$CB
	call Unknown_0x2319
	pop bc
	ret
	ld h,d
	ld l,$27
	inc [hl]
	ret

UnknownData_0x195B5:
INCBIN "baserom.gb", $195B5, $195D7 - $195B5
	ld h,d
	ld l,$26
	dec [hl]
	jp nz,Unknown_0x192CA
	ld e,$27
	ld a,[de]
	or a
	jr z,Unknown_0x195E8
	ld [hl],$04
	jr Unknown_0x195EA

Unknown_0x195E8:
	ld [hl],$0C

Unknown_0x195EA:
	add a,$25
	ld l,$3F
	add a,[hl]
	ld e,$CB
	call Unknown_0x2319
	ld e,$3F
	ld a,[de]
	inc a
	ld [de],a
	cp $02
	jp c,Unknown_0x192CA
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$52
	inc l
	ld [hl],$CA
	jp Unknown_0x192CA

Unknown_0x1960C:
INCBIN "baserom.gb", $1960C, $19648 - $1960C
	ld bc,$415F
	call Unknown_0x255B
	ld e,$41
	ld a,[de]
	or a
	ret nz
	call Unknown_0x0C71
	ld h,d
	ld l,$60
	ld [hl],$3F
	ld l,$44
	ld [hl],$10
	xor a
	ret

UnknownData_0x19661:
INCBIN "baserom.gb", $19661, $1966F - $19661
	ld hl,$4CE4
	ld a,$03
	call Unknown_0x05CF
	ret

UnknownData_0x19678:
INCBIN "baserom.gb", $19678, $196CD - $19678

Unknown_0x196CD:
	call Unknown_0x1EC0
	call Unknown_0x202B
	jr nc,Unknown_0x196D9
	ld a,$03
	jr Unknown_0x196DB

Unknown_0x196D9:
	ld a,$06

Unknown_0x196DB:
	ld e,$15
	ld [de],a
	ret

UnknownData_0x196DF:
INCBIN "baserom.gb", $196DF, $19719 - $196DF
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$40FF
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$06
	ld bc,$5734
	jp Unknown_0x0846

UnknownData_0x19734:
INCBIN "baserom.gb", $19734, $1976E - $19734
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$40FF
	jp Unknown_0x255B

UnknownData_0x1977A:
INCBIN "baserom.gb", $1977A, $19795 - $1977A
	call Unknown_0x0DA4
	ld bc,$40E3
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$06
	ld bc,Unknown_0x197BA
	jp Unknown_0x0846
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$0D
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

Unknown_0x197BA:
INCBIN "baserom.gb", $197BA, $197DC - $197BA
	ld bc,$40E3
	jp Unknown_0x255B

UnknownData_0x197E2:
INCBIN "baserom.gb", $197E2, $1981A - $197E2
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$43
	ld e,l
	ld a,[hl]
	ld [de],a
	ld l,$41
	ld e,l
	ld a,[hl]
	ld [de],a
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$3A
	ld a,[hl]
	ld e,$45
	ld [de],a
	ret
	ld e,$41
	ld a,[de]
	rlca
	ld hl,$586A
	add a,l
	ld l,a
	jr nc,Unknown_0x19840
	inc h

Unknown_0x19840:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld e,$5B
	ld a,[de]
	sub $1C
	add a,l
	ld l,a
	jr nc,Unknown_0x1984D
	inc h

Unknown_0x1984D:
	ld a,[hl]
	call Unknown_0x18F8B
	ld e,$43
	ld a,[de]
	or a
	ret z
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ld e,$0F
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a
	ret

UnknownData_0x1986A:
INCBIN "baserom.gb", $1986A, $1987C - $1986A
	call Unknown_0x0DA4
	ld bc,$40E3
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x198A7
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x1989F
	bit 5,a
	jr nz,Unknown_0x19897
	bit 6,a
	ret z

Unknown_0x19897:
	ld h,d
	call Unknown_0x0BBA
	ld a,[$FF00+$9A]
	ld [de],a
	ret

Unknown_0x1989F:
	ld e,$06
	ld bc,Unknown_0x197BA
	jp Unknown_0x0846

Unknown_0x198A7:
INCBIN "baserom.gb", $198A7, $198DF - $198A7
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$40FF
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$06
	ld bc,$58FA
	jp Unknown_0x0846

UnknownData_0x198FA:
INCBIN "baserom.gb", $198FA, $19943 - $198FA
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D70
	call Unknown_0x0DA4
	ld bc,$40FF
	jp Unknown_0x255B

UnknownData_0x19958:
INCBIN "baserom.gb", $19958, $1999F - $19958
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$40FF
	call Unknown_0x255B
	ret c
	ld e,$3F
	ld a,[de]
	cp $01
	jr nz,Unknown_0x199B9
	call Unknown_0x202B
	ret c
	jr Unknown_0x199BD

Unknown_0x199B9:
	call Unknown_0x202B
	ret nc

Unknown_0x199BD:
	ld e,$06
	ld bc,$59C5
	jp Unknown_0x0846

UnknownData_0x199C5:
INCBIN "baserom.gb", $199C5, $19A2B - $199C5
	call Unknown_0x0647
	cp $80
	ret c
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x19A49:
INCBIN "baserom.gb", $19A49, $19A65 - $19A49

Unknown_0x19A65:
INCBIN "baserom.gb", $19A65, $19A69 - $19A65

Unknown_0x19A69:
INCBIN "baserom.gb", $19A69, $19AF1 - $19A69

Unknown_0x19AF1:
INCBIN "baserom.gb", $19AF1, $19C0C - $19AF1
	ld a,d
	ld [$DD0E],a
	ret

UnknownData_0x19C11:
INCBIN "baserom.gb", $19C11, $19C50 - $19C11
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x1B5C1
	ret nc
	ld e,$06
	ld bc,$700F
	jp Unknown_0x0846
	ld bc,$5A57
	call Unknown_0x1B5C1
	ret nc
	ld e,$06
	ld bc,Unknown_0x1B026
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x255B
	ld bc,Unknown_0x19A65
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$0E
	ld hl,Unknown_0x18299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$06
	ld bc,Unknown_0x19CD1
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5A57
	call Unknown_0x255B
	ld bc,Unknown_0x19A69
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$0E
	ld hl,Unknown_0x18299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$06
	ld bc,$5D02
	jp Unknown_0x0846
	ld a,[bc]
	inc bc
	ld [$CD00],a
	ld [$DB78],a
	ret

Unknown_0x19CD1:
INCBIN "baserom.gb", $19CD1, $19D1D - $19CD1
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$27
	ld [hl],$01
	ret
	call Unknown_0x0647
	and $01
	ld h,d
	ld l,$48
	ld h,[hl]
	ld l,$27
	ld [hl],a
	xor $01
	ld e,l
	ld [de],a
	ret
	call Unknown_0x19D69
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x255B
	ld e,$27
	ld a,[de]
	or a
	ret z
	ld e,$06
	ld bc,$5DC5
	jp Unknown_0x0846
	call Unknown_0x19D7F
	ld bc,$5A49
	call Unknown_0x255B
	ld e,$27
	ld a,[de]
	or a
	ret z
	ld e,$06
	ld bc,$5E33
	jp Unknown_0x0846

Unknown_0x19D69:
	ld a,[$DEE4]
	cp $0C
	ret c
	xor a
	ld [$DEE4],a
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$5D
	inc l
	ld [hl],$3A
	ret

Unknown_0x19D7F:
	ld a,[$DEE4]
	cp $0C
	ret c
	xor a
	ld [$DEE4],a
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$5D
	inc l
	ld [hl],$56
	ret

UnknownData_0x19D95:
INCBIN "baserom.gb", $19D95, $19DAF - $19D95
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$27
	ld [hl],$01
	ret
	xor a
	ld [$DD0A],a
	ret
	ld hl,$DD0A
	ld a,[hl]
	and $80
	ld [hl],a
	ret

UnknownData_0x19DC5:
INCBIN "baserom.gb", $19DC5, $19E70 - $19DC5
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	rlca
	rlca
	ld h,d
	ld l,$40
	add a,[hl]
	inc [hl]
	add a,l
	ld l,a
	jr nc,Unknown_0x19E85
	inc h

Unknown_0x19E85:
	ld a,[hl]
	or a
	jr nz,Unknown_0x19E8D
	ld a,$01
	jr Unknown_0x19E99

Unknown_0x19E8D:
	ld e,a
	call Unknown_0x0647
	cp e
	jr nc,Unknown_0x19E98
	ld a,$01
	jr Unknown_0x19E99

Unknown_0x19E98:
	xor a

Unknown_0x19E99:
	ld e,$27
	ld [de],a
	ret
	call Unknown_0x203D
	ld e,$45
	ld a,[de]
	jr c,Unknown_0x19EAC
	rlca
	jr c,Unknown_0x19EAF

Unknown_0x19EA8:
	ld a,$01
	jr Unknown_0x19EB0

Unknown_0x19EAC:
	rlca
	jr c,Unknown_0x19EA8

Unknown_0x19EAF:
	xor a

Unknown_0x19EB0:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x19EB4:
INCBIN "baserom.gb", $19EB4, $19F19 - $19EB4
	push bc
	ld e,$5C
	ld a,[de]
	ld e,a
	rlca
	rlca
	rlca
	add a,e
	ld l,a
	ld e,$43
	ld a,[de]
	ld h,a
	inc a
	cp $03
	jr c,Unknown_0x19F2E
	sub $03

Unknown_0x19F2E:
	ld [de],a
	ld a,h
	rlca
	add a,h
	add a,l
	ld hl,$5A7E
	add a,l
	ld l,a
	jr nc,Unknown_0x19F3B
	inc h

Unknown_0x19F3B:
	call Unknown_0x0647
	ld e,a
	ld b,$00
	ld c,$03

Unknown_0x19F43:
	ld a,[hl]
	or a
	jr z,Unknown_0x19F4F
	cp e
	jr nc,Unknown_0x19F4F
	inc hl
	inc b
	dec c
	jr nz,Unknown_0x19F43

Unknown_0x19F4F:
	ld a,b
	ld e,$27
	ld [de],a
	pop bc
	ret
	xor a
	ld hl,$DD0A
	bit 6,[hl]
	jr nz,Unknown_0x19F64
	bit 0,[hl]
	jr z,Unknown_0x19F64
	set 1,[hl]
	inc a

Unknown_0x19F64:
	ld e,$27
	ld [de],a
	ret
	ld hl,$DD0A
	ld e,$4C
	ld a,[de]
	cp $15
	jr nc,Unknown_0x19F78
	set 6,[hl]

Unknown_0x19F74:
	ld a,$01
	jr Unknown_0x19F7D

Unknown_0x19F78:
	bit 7,[hl]
	jr nz,Unknown_0x19F74
	xor a

Unknown_0x19F7D:
	ld e,$27
	ld [de],a
	ret
	ld hl,$DD0A
	bit 6,[hl]
	jr nz,Unknown_0x19F8B

Unknown_0x19F88:
	xor a
	jr Unknown_0x19F93

Unknown_0x19F8B:
	bit 0,[hl]
	jr z,Unknown_0x19F88
	res 1,[hl]
	ld a,$01

Unknown_0x19F93:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x19F97:
INCBIN "baserom.gb", $19F97, $1A196 - $19F97

Unknown_0x1A196:
	call Unknown_0x1A44B
	ret nc
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ret

UnknownData_0x1A1A1:
INCBIN "baserom.gb", $1A1A1, $1A216 - $1A1A1
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x1A196
	ld bc,$5A49
	call Unknown_0x1B5C1
	ret nc
	ld e,$06
	ld bc,$700F
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	call Unknown_0x1A196
	ld bc,$5A57
	call Unknown_0x1B5C1
	jr c,Unknown_0x1A251
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	ret nz
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$5C
	inc l
	ld [hl],$65
	ret

Unknown_0x1A251:
	ld e,$06
	ld bc,Unknown_0x1B026
	jp Unknown_0x0846

UnknownData_0x1A259:
INCBIN "baserom.gb", $1A259, $1A3A5 - $1A259

Unknown_0x1A3A5:
INCBIN "baserom.gb", $1A3A5, $1A3E1 - $1A3A5
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x1B5C1
	jr c,Unknown_0x1A3F8
	call Unknown_0x1A44B
	ret nc
	ld e,$06
	ld bc,$629F
	jp Unknown_0x0846

Unknown_0x1A3F8:
	ld e,$06
	ld bc,$700F
	jp Unknown_0x0846
	ld bc,$5A57
	call Unknown_0x1B5C1
	jr c,Unknown_0x1A421
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x19A69
	call Unknown_0x24CD
	bit 7,a
	ret z
	xor a
	ld e,$12
	ld [de],a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x1A421:
	ld e,$06
	ld bc,$7026
	jp Unknown_0x0846
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$5A57
	call Unknown_0x1B5C1
	jr c,Unknown_0x1A443
	call Unknown_0x1A44B
	ret nc
	ld e,$06
	ld bc,Unknown_0x1A3A5
	jp Unknown_0x0846

Unknown_0x1A443:
	ld e,$06
	ld bc,$7026
	jp Unknown_0x0846

Unknown_0x1A44B:
	ld e,$0E
	ld a,[de]
	rlca
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	jr c,Unknown_0x1A45C
	sub [hl]
	cp $97
	ccf
	ret

Unknown_0x1A45C:
	sub [hl]
	cp $09
	ret

UnknownData_0x1A460:
INCBIN "baserom.gb", $1A460, $1A4C7 - $1A460
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x1B5C1
	ret nc
	ld e,$06
	ld bc,$700F
	jp Unknown_0x0846

Unknown_0x1A4DC:
INCBIN "baserom.gb", $1A4DC, $1A53E - $1A4DC
	ld hl,$DD0A
	res 0,[hl]
	ret
	call Unknown_0x1A55F
	ld bc,$5A49
	call Unknown_0x255B
	call Unknown_0x1A56D
	call c,Unknown_0x1EC0
	call Unknown_0x1A5BC
	ret nc
	ld e,$06
	ld bc,$660A
	jp Unknown_0x0846

Unknown_0x1A55F:
	ld e,$41
	ld a,[de]
	or a
	ret z

Unknown_0x1A564:
	call Unknown_0x21D8
	call Unknown_0x21C5
	jp Unknown_0x0DA4

Unknown_0x1A56D:
	ld e,$41
	ld a,[de]
	or a
	jr z,Unknown_0x1A577
	dec a
	ld [de],a
	or a
	ret

Unknown_0x1A577:
	ld a,$08
	ld [de],a
	ld h,$A0
	ld l,$07
	ld a,[hl]
	ld hl,$DB53
	sub [hl]
	cp $20
	jr c,Unknown_0x1A594
	xor a
	ld h,d
	ld l,$0D
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld l,$41
	ld [hl],$00
	ret

Unknown_0x1A594:
	call Unknown_0x202B
	jr c,Unknown_0x1A59E
	ld bc,$FFA0
	jr Unknown_0x1A5A1

Unknown_0x1A59E:
	ld bc,$0060

Unknown_0x1A5A1:
	ld h,d
	ld l,$39
	ld [hl],c
	inc l
	ld [hl],b
	call Unknown_0x203D
	jr c,Unknown_0x1A5B1
	ld bc,$FFA0
	jr Unknown_0x1A5B4

Unknown_0x1A5B1:
	ld bc,$0060

Unknown_0x1A5B4:
	ld h,d
	ld l,$3B
	ld [hl],c
	inc l
	ld [hl],b
	scf
	ret

Unknown_0x1A5BC:
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x1A5C6
	dec a
	ld [de],a
	or a
	ret

Unknown_0x1A5C6:
	ld e,$40
	ld a,[de]
	cp $02
	jr nc,Unknown_0x1A5E6
	ld hl,$5A93
	ld b,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1A5D6
	inc h

Unknown_0x1A5D6:
	ld a,b
	inc a
	ld [de],a
	call Unknown_0x0647
	cp [hl]
	jr c,Unknown_0x1A5E6
	ld a,$3C
	ld e,$26
	ld [de],a
	or a
	ret

Unknown_0x1A5E6:
	xor a
	ld h,d
	ld l,$0D
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	scf
	ret
	call Unknown_0x1A55F
	ld bc,$5A57
	call Unknown_0x255B
	call Unknown_0x1A56D
	call Unknown_0x1A5BC
	ret nc
	ld e,$06
	ld bc,$66A2
	jp Unknown_0x0846

UnknownData_0x1A60A:
INCBIN "baserom.gb", $1A60A, $1A6CF - $1A60A
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x255B
	call Unknown_0x203D
	ld e,$45
	ld a,[de]
	jr c,Unknown_0x1A6EA
	rlca
	ret c

Unknown_0x1A6E2:
	ld e,$06
	ld bc,$663F
	jp Unknown_0x0846

Unknown_0x1A6EA:
	rlca
	ret nc
	jr Unknown_0x1A6E2
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x255B
	call Unknown_0x1A196
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x1A703
	dec a
	ld [de],a
	ret

Unknown_0x1A703:
	ld a,$08
	ld [de],a
	ld h,d
	ld l,$40
	inc [hl]
	ld a,$03
	ld e,$D3
	jp Unknown_0x2319
	ld bc,$5A57
	call Unknown_0x255B
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x1A720
	dec a
	ld [de],a
	ret

Unknown_0x1A720:
	ld a,$20
	ld [de],a
	ld a,$06
	ld e,$D3
	jp Unknown_0x2319

UnknownData_0x1A72A:
INCBIN "baserom.gb", $1A72A, $1A74A - $1A72A
	ld hl,$DD0A
	set 0,[hl]
	ret
	ld bc,$5A49
	call Unknown_0x255B
	ld a,[$DD0A]
	bit 6,a
	jr nz,Unknown_0x1A779
	bit 1,a
	ret z
	bit 7,a
	jr nz,Unknown_0x1A76C
	ld e,$06
	ld bc,$6891
	jp Unknown_0x0846

Unknown_0x1A76C:
	ld hl,$DD0A
	res 1,[hl]
	ld e,$06
	ld bc,$64DC
	jp Unknown_0x0846

Unknown_0x1A779:
	ld e,$06
	ld bc,$696F
	jp Unknown_0x0846
	ld bc,$5A57
	call Unknown_0x255B
	ld a,[$DD0A]
	bit 6,a
	jr nz,Unknown_0x1A7AA
	bit 1,a
	ret z
	bit 7,a
	jr nz,Unknown_0x1A79D
	ld e,$06
	ld bc,$68C1
	jp Unknown_0x0846

Unknown_0x1A79D:
	ld hl,$DD0A
	res 1,[hl]
	ld e,$06
	ld bc,$650F
	jp Unknown_0x0846

Unknown_0x1A7AA:
	ld e,$06
	ld bc,$6984
	jp Unknown_0x0846

UnknownData_0x1A7B2:
INCBIN "baserom.gb", $1A7B2, $1A83F - $1A7B2
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x255B
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	cp $08
	jr c,Unknown_0x1A85C
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	ret nz

Unknown_0x1A85C:
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$5C
	inc l
	ld [hl],$56
	ret
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A57
	call Unknown_0x255B
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	cp $08
	jr c,Unknown_0x1A885
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	ret nz

Unknown_0x1A885:
	ld h,d
	ld l,$1F
	ld [hl],$46
	inc l
	ld [hl],$5C
	inc l
	ld [hl],$65
	ret

UnknownData_0x1A891:
INCBIN "baserom.gb", $1A891, $1A903 - $1A891
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x255B
	ld bc,Unknown_0x19A65
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$06
	ld bc,$68F4
	jp Unknown_0x0846
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A57
	call Unknown_0x255B
	ld bc,Unknown_0x19A69
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$06
	ld bc,$68FA
	jp Unknown_0x0846

UnknownData_0x1A93D:
INCBIN "baserom.gb", $1A93D, $1A98A - $1A93D

Unknown_0x1A98A:
INCBIN "baserom.gb", $1A98A, $1A9AB - $1A98A
	call Unknown_0x1A564
	ld bc,$5A49
	call Unknown_0x255B
	ld e,$10
	ld a,[de]
	rlca
	jp c,Unknown_0x1A9DB
	ld e,$06
	ld bc,Unknown_0x1A4DC
	jp Unknown_0x0846

UnknownData_0x1A9C3:
INCBIN "baserom.gb", $1A9C3, $1A9DB - $1A9C3

Unknown_0x1A9DB:
	ld hl,$DB53
	ld e,$07
	ld a,[de]
	sub [hl]
	cp $30
	jr nc,Unknown_0x1A9F1
	ld e,$12
	ld a,$40
	ld [de],a
	xor a
	ld e,$39
	ld [de],a
	inc e
	ld [de],a

Unknown_0x1A9F1:
	ld h,d
	ld l,$26
	dec [hl]
	ret nz
	ld [hl],$08
	call Unknown_0x1EC0
	ld hl,$5A95
	jp Unknown_0x21A5
	ld hl,$DD0A
	bit 7,[hl]
	jr nz,Unknown_0x1AA0C
	ld a,$01
	jr Unknown_0x1AA0D

Unknown_0x1AA0C:
	xor a

Unknown_0x1AA0D:
	ld e,$27
	ld [de],a
	ret
	push bc
	call Unknown_0x0647
	ld b,a
	ld c,$05
	call Unknown_0x2885
	ld hl,$DD0B
	ld [hl],b
	pop bc
	ret
	ld hl,$DD0A
	set 1,[hl]
	ret

UnknownData_0x1AA27:
INCBIN "baserom.gb", $1AA27, $1AA59 - $1AA27
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x1B5C1
	jr c,Unknown_0x1AA80
	ld e,$10
	ld a,[de]
	rlca
	ret c
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	ld l,$40
	ld h,d
	cp [hl]
	ret c
	ld e,$06
	ld bc,$6A9F
	jp Unknown_0x0846

Unknown_0x1AA80:
	ld e,$06
	ld bc,$700F
	jp Unknown_0x0846
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,[$DD0B]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x1AA97
	inc h

Unknown_0x1AA97:
	ld e,$3F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

UnknownData_0x1AA9F:
INCBIN "baserom.gb", $1AA9F, $1AB05 - $1AA9F
	ld a,[bc]
	inc bc
	push bc
	ld hl,$DB51
	ld c,[hl]
	inc hl
	ld b,[hl]
	swap a
	add a,$80
	ld hl,$DB53
	add a,[hl]
	ld e,a
	inc hl
	ld a,$00
	adc a,[hl]
	ld d,a
	ld hl,$B300
	ld a,[$DD0B]
	inc a
	add a,h
	ld h,a
	ld a,e
	sub $80
	inc a
	add a,l
	ld l,a
	ld a,$0A
	call Unknown_0x1597
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$5A49
	call Unknown_0x1B5C1
	jr c,Unknown_0x1AB67
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	ld h,d
	ld l,$3F
	cp [hl]
	ld e,$3C
	ld a,[de]
	jr c,Unknown_0x1AB5D
	rlca
	ret c
	ld e,$06
	ld bc,$6B86
	jp Unknown_0x0846

Unknown_0x1AB5D:
	rlca
	ret nc
	ld e,$06
	ld bc,$6B86
	jp Unknown_0x0846

Unknown_0x1AB67:
	ld e,$06
	ld bc,$700F
	jp Unknown_0x0846
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	ld h,d
	ld l,$3F
	cp [hl]
	jr nc,Unknown_0x1AB80
	ld a,$40
	jr Unknown_0x1AB82

Unknown_0x1AB80:
	ld a,$C0

Unknown_0x1AB82:
	ld e,$45
	ld [de],a
	ret

UnknownData_0x1AB86:
INCBIN "baserom.gb", $1AB86, $1ABA4 - $1AB86
	ld bc,$5A49
	call Unknown_0x255B
	ld hl,$DD0A
	bit 0,[hl]
	ret z
	ld e,$06
	ld bc,$6BB8
	jp Unknown_0x0846

UnknownData_0x1ABB8:
INCBIN "baserom.gb", $1ABB8, $1ABC2 - $1ABB8
	ld a,[$DD0D]
	ld hl,$DA06
	add a,[hl]
	ld [hl],a
	ld bc,$5A49
	jp Unknown_0x255B

UnknownData_0x1ABD0:
INCBIN "baserom.gb", $1ABD0, $1AC43 - $1ABD0
	xor a
	ld [$DD0F],a
	ret

UnknownData_0x1AC48:
INCBIN "baserom.gb", $1AC48, $1AC54 - $1AC48
	ld bc,$5A49
	call Unknown_0x255B
	ld a,[$DD0D]
	ld hl,$DA06
	add a,[hl]
	ld [hl],a
	ld a,[$DD0B]
	ld hl,$5AF4
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x1AC6E
	inc h

Unknown_0x1AC6E:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	push hl
	ld b,$A0
	ld c,$04
	ld a,[bc]
	ld hl,$DB51
	sub [hl]
	and $FC
	rra
	rra
	rra
	jr nc,Unknown_0x1AC83
	inc a

Unknown_0x1AC83:
	ld e,a
	and $07
	ld hl,$6CBD
	add a,l
	ld l,a
	jr nc,Unknown_0x1AC8E
	inc h

Unknown_0x1AC8E:
	ld a,[hl]
	ld [$FF00+$80],a
	ld c,$07
	ld a,[bc]
	ld hl,$DB53
	sub [hl]
	and $FC
	rra
	rra
	rra
	jr nc,Unknown_0x1ACA0
	inc a

Unknown_0x1ACA0:
	ld c,a
	rlca
	add a,c
	ld c,a
	ld a,e
	and $F8
	swap a
	rlca
	add a,c
	pop hl
	add a,l
	ld l,a
	jr nc,Unknown_0x1ACB1
	inc h

Unknown_0x1ACB1:
	ld a,[$FF00+$80]
	and [hl]
	ret nz
	ld a,$12
	ld [$DD0C],a
	jp Unknown_0x1ACCC

UnknownData_0x1ACBD:
INCBIN "baserom.gb", $1ACBD, $1ACC5 - $1ACBD
	ld hl,$DD0D
	ld a,[bc]
	inc bc
	ld [hl],a
	ret

Unknown_0x1ACCC:
	call Unknown_0x2809
	jr c,Unknown_0x1ACFF
	ld a,[$A05D]
	cp $01
	jr z,Unknown_0x1ACFF
	cp $04
	jr z,Unknown_0x1ACFF
	ld a,[$A054]
	or a
	jp nz,Unknown_0x1ACFF
	ld a,[$DD0C]
	ld [$A044],a
	or a
	jr z,Unknown_0x1ACF2
	and $0F
	ld b,a
	call Unknown_0x3A8B

Unknown_0x1ACF2:
	ld e,$01
	ld bc,$4EC9
	call Unknown_0x0C48
	ld a,$01
	ld [$A054],a

Unknown_0x1ACFF:
	ret
	ld hl,$DD0A
	ld a,[hl]
	and $80
	ld [hl],a
	ret

UnknownData_0x1AD08:
INCBIN "baserom.gb", $1AD08, $1AE0F - $1AD08
	ld e,$3F
	ld hl,$DB51
	ld a,[de]
	add a,[hl]
	ld hl,$DA07
	sub [hl]
	ld e,$04
	ld [de],a
	ld e,$40
	ld hl,$DB53
	ld a,[de]
	add a,[hl]
	ld hl,$DA06
	sub [hl]
	ld l,a
	ld e,$4C
	ld a,[de]
	or a
	ld a,l
	jr nz,Unknown_0x1AE32
	add a,$02

Unknown_0x1AE32:
	ld e,$07
	ld [de],a
	ret

UnknownData_0x1AE36:
INCBIN "baserom.gb", $1AE36, $1AF02 - $1AE36
	ld hl,$DD0A
	bit 1,[hl]
	jr nz,Unknown_0x1AF0C
	xor a
	jr Unknown_0x1AF0E

Unknown_0x1AF0C:
	ld a,$01

Unknown_0x1AF0E:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x1AF12:
INCBIN "baserom.gb", $1AF12, $1AF41 - $1AF12
	ld hl,$DD0A
	set 0,[hl]
	ret

UnknownData_0x1AF47:
INCBIN "baserom.gb", $1AF47, $1AF63 - $1AF47
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$5A57
	call Unknown_0x255B
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	ld h,d
	ld l,$3F
	cp [hl]
	ld e,$45
	ld a,[de]
	jr c,Unknown_0x1AF89
	rlca
	ret c
	ld e,$06
	ld bc,$6F93
	jp Unknown_0x0846

Unknown_0x1AF89:
	rlca
	ret nc
	ld e,$06
	ld bc,$6F93
	jp Unknown_0x0846

UnknownData_0x1AF93:
INCBIN "baserom.gb", $1AF93, $1AFB9 - $1AF93
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5A57
	call Unknown_0x255B
	ld e,$10
	ld a,[de]
	rlca
	ret c
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	ld c,a
	inc e
	inc hl
	ld a,[de]
	sbc a,[hl]
	ret c
	ld a,c
	ld l,$40
	ld h,d
	cp [hl]
	ret c
	ld e,$06
	ld bc,$6FE5
	jp Unknown_0x0846

UnknownData_0x1AFE5:
INCBIN "baserom.gb", $1AFE5, $1AFFB - $1AFE5
	ld bc,$5A49
	call Unknown_0x255B
	ld hl,$DD0A
	bit 6,[hl]
	ret nz
	ld e,$06
	ld bc,Unknown_0x1A98A
	jp Unknown_0x0846

UnknownData_0x1B00F:
INCBIN "baserom.gb", $1B00F, $1B026 - $1B00F

Unknown_0x1B026:
INCBIN "baserom.gb", $1B026, $1B03D - $1B026
	ld hl,$DD0A
	bit 0,[hl]
	ret z
	set 6,[hl]
	ret

UnknownData_0x1B046:
INCBIN "baserom.gb", $1B046, $1B0FB - $1B046
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$19
	ld [hl],$80
	ld l,$1C
	ld [hl],$80
	ld l,$1F
	ld [hl],$80
	ret
	ld hl,$DD0A
	bit 7,[hl]
	ret nz
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$4A
	ld [hl],$50
	inc l
	ld [hl],$12
	ret

Unknown_0x1B11E:
INCBIN "baserom.gb", $1B11E, $1B129 - $1B11E
	ld hl,$DD0A
	bit 7,[hl]
	ret nz
	ld bc,$5A49
	jp Unknown_0x255B
	call Unknown_0x21D8
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld e,$48
	ld a,[de]
	ld h,a
	ld e,$04
	ld l,e
	ld a,[de]
	sub [hl]
	jr nc,Unknown_0x1B14B
	cpl
	inc a

Unknown_0x1B14B:
	cp $20
	jr nc,Unknown_0x1B164
	ld e,$07
	ld l,e
	ld a,[de]
	sub [hl]
	jr nc,Unknown_0x1B158
	cpl
	inc a

Unknown_0x1B158:
	cp $20
	jr nc,Unknown_0x1B164
	ld e,$06
	ld bc,Unknown_0x1B11E
	jp Unknown_0x0846

Unknown_0x1B164:
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	sub [hl]
	cp $50
	ld e,$3C
	ld a,[de]
	jr c,Unknown_0x1B180
	rlca
	jr c,Unknown_0x1B183

Unknown_0x1B175:
	xor a
	ld e,$11
	ld [de],a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	jr Unknown_0x1B183

Unknown_0x1B180:
	rlca
	jr c,Unknown_0x1B175

Unknown_0x1B183:
	ld hl,$DB53
	ld e,$07
	ld a,[de]
	sub [hl]
	cp $20
	ld e,$3A
	ld a,[de]
	jr c,Unknown_0x1B19D
	rlca
	ret c

Unknown_0x1B193:
	xor a
	ld e,$12
	ld [de],a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x1B19D:
	rlca
	ret nc
	jr Unknown_0x1B193
	ld hl,$DD0A
	set 7,[hl]
	ret
	ld hl,$DD0A
	bit 7,[hl]
	jr nz,Unknown_0x1B1B1
	xor a
	jr Unknown_0x1B1B3

Unknown_0x1B1B1:
	ld a,$01

Unknown_0x1B1B3:
	ld e,$27
	ld [de],a
	ret
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $50
	jr nc,Unknown_0x1B1C6
	ld a,$40
	jr Unknown_0x1B1C8

Unknown_0x1B1C6:
	ld a,$C0

Unknown_0x1B1C8:
	ld e,$45
	ld [de],a
	ld hl,Unknown_0x19AF1
	call Unknown_0x21A5
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	cp $20
	ld hl,Unknown_0x19AF1
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld e,$39
	jr c,Unknown_0x1B1F1
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hl]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0x1B1F1:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld hl,$DD0A
	bit 7,[hl]
	ret z
	push bc
	ld h,$A8
	ld c,$0A

Unknown_0x1B202:
	ld l,$00
	ld a,[hl]
	cp $FF
	jr z,Unknown_0x1B228
	ld a,d
	cp h
	jr z,Unknown_0x1B228
	ld e,$48
	ld a,[de]
	ld b,a
	cp h
	jr z,Unknown_0x1B228
	ld l,e
	ld a,[hl]
	cp d
	jr z,Unknown_0x1B21C
	cp b
	jr nz,Unknown_0x1B228

Unknown_0x1B21C:
	ld a,c
	ld [$FF00+$80],a
	call Unknown_0x0BBA
	ld a,[$FF00+$9A]
	ld d,a
	ld a,[$FF00+$80]
	ld c,a

Unknown_0x1B228:
	dec c
	jr z,Unknown_0x1B22E
	inc h
	jr Unknown_0x1B202

Unknown_0x1B22E:
	pop bc
	ret

UnknownData_0x1B230:
INCBIN "baserom.gb", $1B230, $1B294 - $1B230
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x1B29F
	dec a
	ld [de],a
	call Unknown_0x1EE6

Unknown_0x1B29F:
	call Unknown_0x0DA4
	ld bc,$5AB5
	jp Unknown_0x255B

UnknownData_0x1B2A8:
INCBIN "baserom.gb", $1B2A8, $1B2FC - $1B2A8

Unknown_0x1B2FC:
INCBIN "baserom.gb", $1B2FC, $1B317 - $1B2FC
	call Unknown_0x0DA4
	ld bc,$5AB5
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$06
	ld bc,Unknown_0x1B2FC
	jp Unknown_0x0846
	ld bc,$5AB5
	jp Unknown_0x255B
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$40
	ld a,[hl]
	cp $04
	jr z,Unknown_0x1B347
	cp $0C
	jr z,Unknown_0x1B347
	xor a
	jr Unknown_0x1B349

Unknown_0x1B347:
	ld a,$01

Unknown_0x1B349:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x1B34D:
INCBIN "baserom.gb", $1B34D, $1B39A - $1B34D
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,e
	ld a,[hl]
	ld [de],a
	ret
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$5AC3
	jp Unknown_0x255B

UnknownData_0x1B3B1:
INCBIN "baserom.gb", $1B3B1, $1B3DF - $1B3B1
	call Unknown_0x21EB
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$5AD1
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$03
	ld bc,Unknown_0x18966
	jp Unknown_0x0846
	push bc
	call Unknown_0x0647
	ld b,a
	ld c,$13
	call Unknown_0x2885
	ld a,b
	swap a
	rrca
	ld hl,$DB51
	ld e,$04
	add a,[hl]
	ld [de],a
	inc hl
	inc e
	ld a,[hl]
	adc a,$00
	ld [de],a
	call Unknown_0x0647
	ld b,a
	ld c,$05
	call Unknown_0x2885
	ld a,b
	swap a
	rrca
	ld hl,$DB53
	ld e,$07
	add a,[hl]
	ld [de],a
	inc hl
	inc e
	ld a,[hl]
	adc a,$00
	ld [de],a
	pop bc
	ret
	push bc
	ld h,$A0
	ld l,$07
	ld e,l
	ld a,[de]
	sub [hl]
	jr nc,Unknown_0x1B440
	cpl
	inc a

Unknown_0x1B440:
	ld c,a
	ld l,$04
	ld e,l
	ld a,[de]
	sub [hl]
	jr nc,Unknown_0x1B44A
	cpl
	inc a

Unknown_0x1B44A:
	ld b,a
	ld a,c
	sub b
	srl a
	srl a
	cp b
	jr c,Unknown_0x1B457
	xor a
	jr Unknown_0x1B461

Unknown_0x1B457:
	ld a,c
	cp b
	jr c,Unknown_0x1B45F
	ld a,$01
	jr Unknown_0x1B461

Unknown_0x1B45F:
	ld a,$02

Unknown_0x1B461:
	ld hl,$5ADF
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x1B46D
	inc h

Unknown_0x1B46D:
	call Unknown_0x21A5
	call Unknown_0x2053
	pop bc
	ret

UnknownData_0x1B475:
INCBIN "baserom.gb", $1B475, $1B47F - $1B475
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,e
	ld h,[hl]
	ld l,$46
	ld e,l
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x1B48B:
INCBIN "baserom.gb", $1B48B, $1B49B - $1B48B
	ld a,[$DD0E]
	ld h,a
	ld l,$04
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld l,$07
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret
	ld hl,$DD0F
	ld a,[hl]
	inc [hl]
	ld hl,$74CE
	rlca
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x1B4BF
	inc h

Unknown_0x1B4BF:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

UnknownData_0x1B4CE:
INCBIN "baserom.gb", $1B4CE, $1B506 - $1B4CE
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	push bc
	ld bc,$7538
	ld hl,$DD0F
	ld a,[hl]
	inc [hl]
	rlca
	rlca
	rlca
	add a,c
	ld c,a
	jr nc,Unknown_0x1B520
	inc b

Unknown_0x1B520:
	ld a,[$DD0E]
	ld h,a
	call Unknown_0x24EC
	ld h,b
	ld l,c
	pop bc
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hli]
	ld [de],a
	jp Unknown_0x20BE

UnknownData_0x1B538:
INCBIN "baserom.gb", $1B538, $1B5C1 - $1B538

Unknown_0x1B5C1:
	ld e,$44
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x1B5D2
	sub $01
	ld [de],a
	jr c,Unknown_0x1B5EA
	ld l,$60
	ld h,d
	ld [hl],$3F

Unknown_0x1B5D2:
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 1,a
	jr nz,Unknown_0x1B5E7
	bit 0,a
	jr nz,Unknown_0x1B5E2
	xor a
	ret

Unknown_0x1B5E2:
	call Unknown_0x0C61
	scf
	ret

Unknown_0x1B5E7:
	pop hl
	scf
	ret

Unknown_0x1B5EA:
	ld e,$42
	ld a,[de]
	or a
	jr z,Unknown_0x1B5D2
	ld l,$60
	ld h,d
	ld [hl],$2D
	jr Unknown_0x1B5D2

UnknownData_0x1B5F7:
INCBIN "baserom.gb", $1B5F7, $1C000 - $1B5F7

SECTION "Bank07", ROMX, BANK[$07]
	ld a,$01
	ld [$DA3B],a
	ld a,$02
	ld [$DA3A],a
	ld hl,$DA3C
	ld bc,$BC00
	ld [hl],c
	inc hl
	ld [hl],b
	xor a
	ld hl,$DA30
	ld [hli],a
	ld [hl],a
	ld [$DA0E],a
	ret
	ld hl,$D900

Unknown_0x1C020:
	ld b,$08

Unknown_0x1C022:
	rrc l
	rla
	dec b
	jr nz,Unknown_0x1C022
	ld [hli],a
	inc a
	jr nz,Unknown_0x1C020
	ret

UnknownData_0x1C02D:
INCBIN "baserom.gb", $1C02D, $1C0E2 - $1C02D
	ld hl,$CC00
	ld a,[$DB5F]
	inc a
	ld b,a
	jr Unknown_0x1C0F3

Unknown_0x1C0EC:
	ld a,[hli]
	sub $BD
	cp $10
	jr c,Unknown_0x1C0F9

Unknown_0x1C0F3:
	dec b
	jr nz,Unknown_0x1C0EC
	ld a,[$DB60]

Unknown_0x1C0F9:
	add a,$24
	ld e,a
	ld hl,$6002
	ld a,$1E
	call Unknown_0x05CF
	ret
	ld a,[$DB61]
	cp $08
	jr nz,Unknown_0x1C120
	ld a,[$DB60]
	ld hl,$4121
	add a,l
	ld l,a
	jr nc,Unknown_0x1C117
	inc h

Unknown_0x1C117:
	ld e,[hl]
	ld hl,$606D
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x1C120:
	ret

UnknownData_0x1C121:
INCBIN "baserom.gb", $1C121, $1C128 - $1C121
	ld a,[$DEFF]
	or a
	ret nz
	ld hl,$CC00
	ld a,[$DB5F]
	inc a
	ld b,a
	jr Unknown_0x1C13C

Unknown_0x1C137:
	ld a,[hli]
	cp $B2
	jr z,Unknown_0x1C141

Unknown_0x1C13C:
	dec b
	jr nz,Unknown_0x1C137
	jr Unknown_0x1C155

Unknown_0x1C141:
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DD63
	and [hl]
	jr nz,Unknown_0x1C155
	ld a,$12
	ld [$DB6F],a
	ld e,a
	jr Unknown_0x1C1AD

Unknown_0x1C155:
	ld a,[$DB73]
	or a
	ld a,$FF
	jr nz,Unknown_0x1C17B
	ld a,[$DB60]
	ld hl,$41B6
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1C169
	inc h

Unknown_0x1C169:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[$DB61]
	sub $08
	jr nc,Unknown_0x1C175
	ld a,$02

Unknown_0x1C175:
	add a,l
	ld l,a
	jr nc,Unknown_0x1C17A
	inc h

Unknown_0x1C17A:
	ld a,[hl]

Unknown_0x1C17B:
	ld [$DB6F],a
	ld a,[$DB38]
	or a
	jr z,Unknown_0x1C18A
	xor a
	ld [$DB38],a
	jr Unknown_0x1C1B5

Unknown_0x1C18A:
	ld a,[$DB6F]
	ld e,a
	ld a,[$DB61]
	cp $08
	jr nc,Unknown_0x1C1AD
	ld a,[$A071]
	or a
	jr nz,Unknown_0x1C1A4
	ld a,[$DDE4]
	inc a
	cp e
	jr z,Unknown_0x1C1B5
	jr Unknown_0x1C1AD

Unknown_0x1C1A4:
	ld hl,$41D8
	add a,l
	ld l,a
	jr nc,Unknown_0x1C1AC
	inc h

Unknown_0x1C1AC:
	ld e,[hl]

Unknown_0x1C1AD:
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF

Unknown_0x1C1B5:
	ret

UnknownData_0x1C1B6:
INCBIN "baserom.gb", $1C1B6, $1C1DC - $1C1B6

Unknown_0x1C1DC:
	ld hl,$DB51
	ld a,[hli]
	ld [$DA01],a
	sub $10
	ld c,a
	ld a,[hli]
	ld b,a
	jr nc,Unknown_0x1C1EB
	dec b

Unknown_0x1C1EB:
	ld a,[hli]
	ld [$DA00],a
	sub $10
	ld e,a
	ld d,[hl]
	jr nc,Unknown_0x1C1F6
	dec d

Unknown_0x1C1F6:
	call Unknown_0x15E3
	push hl
	call Unknown_0x15FC
	pop bc
	ld d,$0D
	ld e,$0B
	jr Unknown_0x1C21E

Unknown_0x1C204:
	ld a,c
	add a,$10
	ld c,a
	jr c,Unknown_0x1C213
	ld a,l
	add a,$40
	ld l,a
	jr nc,Unknown_0x1C21E
	inc h
	jr Unknown_0x1C21E

Unknown_0x1C213:
	ld a,[$DB3D]
	add a,b
	ld b,a
	ld h,$98
	ld a,l
	and $1F
	ld l,a

Unknown_0x1C21E:
	push bc
	push hl
	push de
	jr Unknown_0x1C236

Unknown_0x1C223:
	inc c
	ld a,c
	and $0F
	jr z,Unknown_0x1C22D
	inc l
	inc l
	jr Unknown_0x1C236

Unknown_0x1C22D:
	ld a,c
	sub $10
	ld c,a
	inc b
	ld a,l
	and $E0
	ld l,a

Unknown_0x1C236:
	ld a,[bc]
	push bc
	ld c,a
	ld b,$C5
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hl],a
	inc b
	ld a,l
	add a,$1F
	ld l,a
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hl],a
	ld a,l
	sub $21
	ld l,a
	pop bc
	dec d
	jr nz,Unknown_0x1C223
	pop de
	pop hl
	pop bc
	dec e
	jr nz,Unknown_0x1C204
	ret

Unknown_0x1C259:
	ld hl,$DB51
	ld a,[hli]
	ld [$DA01],a
	sub $10
	ld c,a
	ld a,[hli]
	ld b,a
	jr nc,Unknown_0x1C268
	dec b

Unknown_0x1C268:
	ld a,[hli]
	ld [$DA00],a
	sub $10
	ld e,a
	ld d,[hl]
	jr nc,Unknown_0x1C273
	dec d

Unknown_0x1C273:
	ld a,e
	and $F0
	ld h,a
	ld a,[$DB56]
	sub h
	jr z,Unknown_0x1C294
	push bc
	push de
	rla
	jr nc,Unknown_0x1C289
	ld a,e
	add a,$A0
	ld e,a
	jr nc,Unknown_0x1C289
	inc d

Unknown_0x1C289:
	ld a,h
	ld [$DB56],a
	ld a,$0D
	call Unknown_0x1C2BC
	pop de
	pop bc

Unknown_0x1C294:
	ld a,c
	and $F0
	ld h,a
	ld a,[$DB55]
	sub h
	jr z,Unknown_0x1C2BB
	rla
	jr nc,Unknown_0x1C2A8
	ld a,c
	add a,$B0
	ld c,a
	jr nc,Unknown_0x1C2A8
	inc b

Unknown_0x1C2A8:
	ld a,h
	ld [$DB55],a
	push bc
	ld bc,$0400

Unknown_0x1C2B0:
	dec bc
	ld a,b
	or c
	jr nz,Unknown_0x1C2B0
	pop bc
	ld a,$0B
	call Unknown_0x1C318

Unknown_0x1C2BB:
	ret

Unknown_0x1C2BC:
	ld [$FF00+$84],a
	ld [$FF00+$80],a
	call Unknown_0x15FC
	push hl
	call Unknown_0x15E3
	ld b,h
	ld c,l
	pop de
	ld a,[$DA22]
	ld l,a
	ld a,[$DA28]
	ld h,a
	jr Unknown_0x1C2E9

Unknown_0x1C2D4:
	ld [$FF00+$84],a
	inc c
	ld a,c
	and $0F
	jr z,Unknown_0x1C2E0
	inc e
	inc e
	jr Unknown_0x1C2E9

Unknown_0x1C2E0:
	ld a,c
	sub $10
	ld c,a
	inc b
	ld a,e
	and $E0
	ld e,a

Unknown_0x1C2E9:
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld a,[bc]
	push bc
	ld c,a
	ld b,$C5
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	pop bc
	ld a,[$FF00+$84]
	dec a
	jr nz,Unknown_0x1C2D4
	ld a,l
	ld [$DA22],a
	ld a,[$DA28]
	ld hl,$DA23
	rra
	jr nc,Unknown_0x1C313
	ld hl,$DA24

Unknown_0x1C313:
	ld a,[$FF00+$80]
	add a,[hl]
	ld [hl],a
	ret

Unknown_0x1C318:
	ld [$FF00+$84],a
	ld [$FF00+$80],a
	call Unknown_0x15FC
	push hl
	call Unknown_0x15E3
	ld b,h
	ld c,l
	pop de
	ld a,[$DA22]
	ld l,a
	ld a,[$DA28]
	ld h,a
	jr Unknown_0x1C34C

Unknown_0x1C330:
	ld [$FF00+$84],a
	ld a,c
	add a,$10
	ld c,a
	jr c,Unknown_0x1C341
	ld a,e
	add a,$40
	ld e,a
	jr nc,Unknown_0x1C34C
	inc d
	jr Unknown_0x1C34C

Unknown_0x1C341:
	ld a,[$DB3D]
	add a,b
	ld b,a
	ld d,$98
	ld a,e
	and $1F
	ld e,a

Unknown_0x1C34C:
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld a,[bc]
	push bc
	ld c,a
	ld b,$C5
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	inc b
	ld a,[bc]
	ld [hli],a
	pop bc
	ld a,[$FF00+$84]
	dec a
	jr nz,Unknown_0x1C330
	ld a,l
	ld [$DA22],a
	ld a,[$DA28]
	ld hl,$DA23
	rra
	jr nc,Unknown_0x1C376
	ld hl,$DA24

Unknown_0x1C376:
	ld a,[$FF00+$80]
	add a,[hl]
	ld [hl],a
	ret

Unknown_0x1C37B:
	push bc
	push de
	push hl
	call Unknown_0x15E3
	ld b,h
	ld c,l
	pop hl
	ld a,[$FF00+$80]
	ld e,a
	jr Unknown_0x1C394

Unknown_0x1C389:
	inc c
	ld a,c
	and $0F
	jr nz,Unknown_0x1C394
	ld a,c
	sub $10
	ld c,a
	inc b

Unknown_0x1C394:
	ld a,[hli]
	ld [bc],a
	dec e
	jr nz,Unknown_0x1C389
	ld a,[$FF00+$80]
	pop de
	pop bc
	jp Unknown_0x1C2BC
	ld hl,$DB51
	ld a,[hli]
	sub $10
	ld c,a
	ld a,[hli]
	ld b,a
	jr nc,Unknown_0x1C3AC
	dec b

Unknown_0x1C3AC:
	ld a,[hli]
	sub $10
	ld e,a
	ld d,[hl]
	jr nc,Unknown_0x1C3B4
	dec d

Unknown_0x1C3B4:
	ld a,$0B

Unknown_0x1C3B6:
	push af
	push bc
	push de
	ld a,$0D
	call Unknown_0x1C41E
	pop hl
	ld de,$0010
	add hl,de
	ld d,h
	ld e,l
	pop bc
	pop af
	dec a
	jr nz,Unknown_0x1C3B6
	ret

Unknown_0x1C3CB:
	ld hl,$DB51
	ld a,[hli]
	sub $10
	ld c,a
	ld a,[hli]
	ld b,a
	jr nc,Unknown_0x1C3D7
	dec b

Unknown_0x1C3D7:
	ld a,[hli]
	sub $10
	ld e,a
	ld d,[hl]
	jr nc,Unknown_0x1C3DF
	dec d

Unknown_0x1C3DF:
	ld a,e
	and $F0
	ld h,a
	ld a,[$DB7E]
	sub h
	jr z,Unknown_0x1C400
	push bc
	push de
	rla
	jr nc,Unknown_0x1C3F5
	ld a,e
	add a,$A0
	ld e,a
	jr nc,Unknown_0x1C3F5
	inc d

Unknown_0x1C3F5:
	ld a,h
	ld [$DB7E],a
	ld a,$0D
	call Unknown_0x1C41E
	pop de
	pop bc

Unknown_0x1C400:
	ld a,c
	and $F0
	ld h,a
	ld a,[$DB7D]
	sub h
	jr z,Unknown_0x1C41D
	rla
	jr nc,Unknown_0x1C414
	ld a,c
	add a,$C0
	ld c,a
	jr nc,Unknown_0x1C414
	inc b

Unknown_0x1C414:
	ld a,h
	ld [$DB7D],a
	ld a,$0B
	call Unknown_0x1C493

Unknown_0x1C41D:
	ret

Unknown_0x1C41E:
	swap a
	ld [$FF00+$80],a
	ld a,[$DB3E]
	dec a
	cp d
	ret c
	ld a,d
	ld [$FF00+$83],a
	ld a,e
	and $F0
	ld e,a
	ld a,c
	and $F0
	ld c,a

Unknown_0x1C433:
	ld a,[$DB3D]
	dec a
	cp b
	jr nc,Unknown_0x1C445
	ld a,[$FF00+$80]
	add a,c
	ret nc
	ld [$FF00+$80],a
	inc b
	ld c,$00
	jr Unknown_0x1C433

Unknown_0x1C445:
	ld a,b
	ld [$FF00+$82],a
	ld hl,$CD35
	ld a,d
	add a,l
	ld l,a
	ld a,b
	rlca
	add a,[hl]
	ld l,a
	ld h,$CD
	ld a,[hli]
	ld d,a
	ld l,[hl]
	ld a,[$FF00+$80]
	add a,c
	ld b,$FF
	jr c,Unknown_0x1C461
	ld b,a
	dec b
	xor a

Unknown_0x1C461:
	ld [$FF00+$80],a
	inc d
	jr Unknown_0x1C480

Unknown_0x1C466:
	ld h,$CB
	ld a,[hl]
	and $F0
	cp e
	jr nz,Unknown_0x1C47F
	ld h,$CA
	ld a,[hl]
	cp c
	jr c,Unknown_0x1C47F
	scf
	sbc a,b
	jr nc,Unknown_0x1C47F
	ld h,$BB
	ld a,[hl]
	or a
	call z,Unknown_0x1C508

Unknown_0x1C47F:
	inc l

Unknown_0x1C480:
	dec d
	jr nz,Unknown_0x1C466
	ld a,[$FF00+$80]
	or a
	ret z
	ld a,[$FF00+$83]
	ld d,a
	ld a,[$FF00+$82]
	ld b,a
	inc b
	ld c,$00
	jp Unknown_0x1C433

Unknown_0x1C493:
	swap a
	ld [$FF00+$80],a
	ld a,[$DB3D]
	dec a
	cp b
	ret c
	ld a,b
	ld [$FF00+$82],a
	ld a,c
	and $F0
	ld c,a
	ld a,e
	and $F0
	ld e,a

Unknown_0x1C4A8:
	ld a,[$DB3E]
	dec a
	cp d
	jr nc,Unknown_0x1C4BA
	ld a,[$FF00+$80]
	add a,e
	ret nc
	ld [$FF00+$80],a
	inc d
	ld e,$00
	jr Unknown_0x1C4A8

Unknown_0x1C4BA:
	ld a,d
	ld [$FF00+$83],a
	ld hl,$CD35
	ld a,d
	add a,l
	ld l,a
	ld a,b
	rlca
	add a,[hl]
	ld l,a
	ld h,$CD
	ld a,[hli]
	ld b,a
	ld l,[hl]
	ld a,[$FF00+$80]
	add a,e
	ld d,$FF
	jr c,Unknown_0x1C4D6
	ld d,a
	dec d
	xor a

Unknown_0x1C4D6:
	ld [$FF00+$80],a
	inc b
	jr Unknown_0x1C4F5

Unknown_0x1C4DB:
	ld h,$CA
	ld a,[hl]
	and $F0
	cp c
	jr nz,Unknown_0x1C4F4
	ld h,$CB
	ld a,[hl]
	cp e
	jr c,Unknown_0x1C4F4
	scf
	sbc a,d
	jr nc,Unknown_0x1C4F4
	ld h,$BB
	ld a,[hl]
	or a
	call z,Unknown_0x1C508

Unknown_0x1C4F4:
	inc l

Unknown_0x1C4F5:
	dec b
	jr nz,Unknown_0x1C4DB
	ld a,[$FF00+$80]
	or a
	ret z
	ld a,[$FF00+$82]
	ld b,a
	ld a,[$FF00+$83]
	ld d,a
	inc d
	ld e,$00
	jp Unknown_0x1C4A8

Unknown_0x1C508:
	push bc
	push de
	push hl
	ld h,$CA
	ld c,[hl]
	ld h,$CB
	ld e,[hl]
	ld a,[$FF00+$82]
	ld b,a
	ld a,[$FF00+$83]
	ld d,a
	ld h,$CC
	ld l,[hl]
	ld h,$7A
	push hl
	ld a,[hl]
	ld hl,$A8B2
	call Unknown_0x07C4
	ld d,h
	pop hl
	ld a,d
	or a
	jr z,Unknown_0x1C580
	inc h
	ld e,$5C
	ld a,[hl]
	swap a
	and $0F
	ld [de],a
	ld e,$5B
	ld a,[hl]
	and $0F
	ld [de],a
	inc h
	ld e,$4C
	ld a,[hl]
	ld [de],a
	inc h
	ld e,$4A
	ld a,[hl]
	ld [de],a
	inc h
	inc e
	ld a,[hl]
	ld [de],a
	ld e,$62
	ld a,$FF
	ld [de],a
	inc h
	ld a,[hl]
	ld bc,$0005
	ld hl,$DB7F
	jr Unknown_0x1C557

Unknown_0x1C556:
	add hl,bc

Unknown_0x1C557:
	cp [hl]
	jr nz,Unknown_0x1C556
	inc hl
	ld e,$46
	ld a,[hli]
	ld [de],a
	ld e,$18
	ld a,[hli]
	ld [de],a
	dec e
	ld a,[hli]
	ld [de],a
	dec e
	ld a,[hl]
	ld [de],a
	ld e,$5E
	ld a,$08
	ld [de],a
	inc e
	ld [de],a
	ld e,$60
	xor a
	ld [de],a
	inc e
	ld [de],a
	pop hl
	ld [hl],$01
	ld e,$49
	ld a,l
	ld [de],a
	pop de
	pop bc
	ret

Unknown_0x1C580:
	pop hl
	pop de
	pop bc
	ret
	ld a,[$DB57]
	ld b,a
	ld hl,$DBCF
	ld d,$BB

Unknown_0x1C58D:
	inc hl

Unknown_0x1C58E:
	ld a,[hli]
	or a
	ret z
	ld a,[hli]
	cp b
	jr nz,Unknown_0x1C58D
	ld a,[hli]
	ld e,a
	ld a,$01
	ld [de],a
	jr Unknown_0x1C58E
	inc e
	ld hl,$DBD0
	ld b,h
	ld c,l

Unknown_0x1C5A2:
	ld a,[hli]
	or a
	jr z,Unknown_0x1C5B7
	cp e
	jr nz,Unknown_0x1C5AD
	inc hl
	inc hl
	jr Unknown_0x1C5A2

Unknown_0x1C5AD:
	ld [bc],a
	inc bc
	ld a,[hli]
	ld [bc],a
	inc bc
	ld a,[hli]
	ld [bc],a
	inc bc
	jr Unknown_0x1C5A2

Unknown_0x1C5B7:
	xor a
	ld [bc],a
	ld a,c
	ld [$DCFD],a
	ld a,b
	ld [$DCFE],a
	ret

UnknownData_0x1C5C2:
INCBIN "baserom.gb", $1C5C2, $1C611 - $1C5C2
	call Unknown_0x0647
	ld e,$45
	ld [de],a
	and $E0
	swap a
	rra
	ld e,$3A
	ld [de],a
	ld hl,$4658
	add a,l
	ld l,a
	jr nc,Unknown_0x1C627
	inc h

Unknown_0x1C627:
	ld a,[hl]
	ld l,a
	rla
	sbc a,a
	ld h,a
	ld e,$07
	ld a,[de]
	add a,l
	ld [de],a
	inc e
	ld a,[de]
	adc a,h
	ld [de],a
	ld e,$3A
	ld a,[de]
	ld hl,$465A
	add a,l
	ld l,a
	jr nc,Unknown_0x1C640
	inc h

Unknown_0x1C640:
	ld a,[hl]
	ld l,a
	rla
	sbc a,a
	ld h,a
	ld e,$04
	ld a,[de]
	add a,l
	ld [de],a
	inc e
	ld a,[de]
	adc a,h
	ld [de],a
	call Unknown_0x1C662
	ld e,$3A
	ld a,[de]
	add a,$0A
	ld [de],a
	ret

UnknownData_0x1C658:
INCBIN "baserom.gb", $1C658, $1C662 - $1C658

Unknown_0x1C662:
	ld e,$3A
	ld a,[de]
	ld hl,$4689
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1C66E
	inc h

Unknown_0x1C66E:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ld e,$3A
	ld a,[de]
	ld hl,$468D
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1C681
	inc h

Unknown_0x1C681:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x1C689:
INCBIN "baserom.gb", $1C689, $1C6C7 - $1C689
	call Unknown_0x0647
	ld e,$45
	ld [de],a
	and $E0
	swap a
	rra
	ld hl,$46D8
	jp Unknown_0x1C6EC

UnknownData_0x1C6D8:
INCBIN "baserom.gb", $1C6D8, $1C6EC - $1C6D8

Unknown_0x1C6EC:
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1C6F2
	inc h

Unknown_0x1C6F2:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc hl
	inc hl
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

UnknownData_0x1C703:
INCBIN "baserom.gb", $1C703, $1C780 - $1C703
	call Unknown_0x0C91
	jp Unknown_0x0DA4

UnknownData_0x1C786:
INCBIN "baserom.gb", $1C786, $1C804 - $1C786
	ld e,$04
	call Unknown_0x0647
	and $0F
	sub $08
	ld l,a
	rla
	sbc a,a
	ld h,a
	ld a,[de]
	add a,l
	ld [de],a
	inc e
	ld a,[de]
	adc a,h
	ld [de],a
	ld e,$07
	ld a,[de]
	sub $04
	ld [de],a
	inc e
	ld a,[de]
	sbc a,$00
	ld [de],a
	ld e,$39
	call Unknown_0x0647
	and $03
	ld [de],a
	ld e,$3A
	ld a,$01
	ld [de],a
	ld a,[$A083]
	ld e,$46
	ld [de],a
	ret
	call Unknown_0x0DA4
	call Unknown_0x1AB3
	jr z,Unknown_0x1C843
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1C843:
	ld e,$3A
	ld a,[de]
	dec a
	ld [de],a
	ret nz
	ld a,$08
	ld [de],a
	ld e,$39
	ld a,[de]
	inc a
	and $03
	ld [de],a
	ld hl,$4867
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1C85C
	inc h

Unknown_0x1C85C:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld e,$0D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

UnknownData_0x1C867:
INCBIN "baserom.gb", $1C867, $1C88C - $1C867
	ld e,$07
	ld a,[de]
	and $F0
	ld [de],a
	ld a,[$A083]
	ld e,$46
	ld [de],a
	ret

UnknownData_0x1C899:
INCBIN "baserom.gb", $1C899, $1C8C9 - $1C899
	ld e,$3A
	ld a,[de]
	ld hl,$48E4
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1C8D5
	inc h

Unknown_0x1C8D5:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld e,$39
	ld a,[de]
	call Unknown_0x1C6EC
	ld e,$3A
	ld a,[de]
	inc a
	ld [de],a
	ret

UnknownData_0x1C8E4:
INCBIN "baserom.gb", $1C8E4, $1C9B5 - $1C8E4
	call Unknown_0x0C80
	call Unknown_0x0C91
	jp Unknown_0x0DA4

UnknownData_0x1C9BE:
INCBIN "baserom.gb", $1C9BE, $1C9D3 - $1C9BE
	push bc
	ld h,d
	call Unknown_0x0647
	and $1F
	ld e,a
	sub $10
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld l,$07
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	call Unknown_0x0647
	and $1F
	sub $10
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld l,$04
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	ld a,e
	rra
	rra
	rra
	and $03
	inc b
	ld b,$00
	jr nz,Unknown_0x1CA0B
	ld b,$04
	xor $03

Unknown_0x1CA0B:
	add a,b
	ld hl,$4A14
	call Unknown_0x1C6EC
	pop bc
	ret

UnknownData_0x1CA14:
INCBIN "baserom.gb", $1CA14, $1CA35 - $1CA14
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$39
	ld a,[hl]
	ld e,$15
	ld [de],a
	ld l,$45
	ld e,l
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x1CA45:
INCBIN "baserom.gb", $1CA45, $1CA52 - $1CA45
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$3A
	ld a,[hl]
	ld e,$15
	ld [de],a
	ld l,$45
	ld e,l
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x1CA62:
INCBIN "baserom.gb", $1CA62, $1CA93 - $1CA62
	push bc
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$3D
	ld c,[hl]
	dec l
	ld b,[hl]
	dec l
	push bc
	call Unknown_0x0647
	and $1F
	ld e,a
	ld a,[hl]
	sub $40
	sub $0F
	add a,e
	ld [$FF00+$84],a
	call Unknown_0x291C
	call Unknown_0x28E0
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$0D
	ld a,c
	ld [de],a
	inc e
	ld a,b
	ld [de],a
	pop bc
	ld a,[$FF00+$84]
	call Unknown_0x291E
	call Unknown_0x28E0
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$0F
	ld a,c
	ld [de],a
	inc e
	ld a,b
	ld [de],a
	call Unknown_0x0647
	and $03
	ld e,$27
	ld [de],a
	pop bc
	ret

UnknownData_0x1CADA:
INCBIN "baserom.gb", $1CADA, $1CB84 - $1CADA
	ld hl,$DA06
	ld e,$07
	ld a,[de]
	add a,[hl]
	ld [hli],a
	ld e,$04
	ld a,[de]
	add a,[hl]
	ld [hl],a
	ret

UnknownData_0x1CB92:
INCBIN "baserom.gb", $1CB92, $1CBC4 - $1CB92
	call Unknown_0x0C80
	call Unknown_0x0C91
	jp Unknown_0x0DA4

UnknownData_0x1CBCD:
INCBIN "baserom.gb", $1CBCD, $1CBD3 - $1CBCD
	ld e,$45
	ld a,[de]
	cpl
	ld [de],a
	ret

UnknownData_0x1CBD9:
INCBIN "baserom.gb", $1CBD9, $1CBE3 - $1CBD9

Unknown_0x1CBE3:
INCBIN "baserom.gb", $1CBE3, $1CC16 - $1CBE3
	ld a,[$A083]
	ld e,$46
	ld [de],a
	ret
	call Unknown_0x0DA4
	ld hl,$FFAF
	ld a,$03
	ld [hli],a
	ld a,$00
	ld [hli],a
	ld a,$00
	ld [hli],a
	call Unknown_0x1C88
	jr nc,Unknown_0x1CC39
	ld e,$07
	ld bc,Unknown_0x1CBE3
	jp Unknown_0x0846

Unknown_0x1CC39:
	ret

UnknownData_0x1CC3A:
INCBIN "baserom.gb", $1CC3A, $1CC83 - $1CC3A

Unknown_0x1CC83:
INCBIN "baserom.gb", $1CC83, $1CCDF - $1CC83

Unknown_0x1CCDF:
INCBIN "baserom.gb", $1CCDF, $1CD39 - $1CCDF
	call Unknown_0x0C80
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	call Unknown_0x197F
	jr nc,Unknown_0x1CD50
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$11
	ld [de],a

Unknown_0x1CD50:
	ret

UnknownData_0x1CD51:
INCBIN "baserom.gb", $1CD51, $1CD76 - $1CD51
	call Unknown_0x0DA4
	call Unknown_0x1CD90
	jr nc,Unknown_0x1CD82
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1CD82:
	call Unknown_0x197F
	jr nc,Unknown_0x1CD8F
	ld e,$07
	ld bc,$4C83
	jp Unknown_0x0846

Unknown_0x1CD8F:
	ret

Unknown_0x1CD90:
	call Unknown_0x1AEA
	ld a,$FF
	jr Unknown_0x1CD9D

Unknown_0x1CD97:
	call Unknown_0x1AEA

Unknown_0x1CD9A:
	ld a,[$A05B]

Unknown_0x1CD9D:
	ld [$DF15],a
	call Unknown_0x3B8F
	jr c,Unknown_0x1CDAA
	ld a,[$FF00+$9A]
	ld d,a
	and a
	ret

Unknown_0x1CDAA:
	ld a,[$FF00+$9A]
	ld d,a
	scf
	ret

UnknownData_0x1CDAF:
INCBIN "baserom.gb", $1CDAF, $1CDDE - $1CDAF
	call Unknown_0x0DA4
	call Unknown_0x1CD90
	jr nc,Unknown_0x1CDEA
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1CDEA:
	call Unknown_0x197F
	jr nc,Unknown_0x1CE04
	ld e,$2E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1CE04:
	ret

UnknownData_0x1CE05:
INCBIN "baserom.gb", $1CE05, $1CE1E - $1CE05
	ld e,$04
	ld bc,$0030
	call Unknown_0x0D35
	call Unknown_0x0DA4
	call Unknown_0x1CD90
	jr nc,Unknown_0x1CE32
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1CE32:
	call Unknown_0x197F
	jr nc,Unknown_0x1CE4C
	ld e,$2E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$07
	ld bc,$4C83
	jp Unknown_0x0846

Unknown_0x1CE4C:
	ret

UnknownData_0x1CE4D:
INCBIN "baserom.gb", $1CE4D, $1CE85 - $1CE4D
	call Unknown_0x0DA4
	call Unknown_0x1CD90
	call Unknown_0x197F
	jr nc,Unknown_0x1CEA5
	ld e,$26
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1CEA5:
	ret

UnknownData_0x1CEA6:
INCBIN "baserom.gb", $1CEA6, $1CF23 - $1CEA6
	push bc
	ld a,[$A070]
	or a
	ld c,$00
	jr z,Unknown_0x1CF2E
	ld c,$03

Unknown_0x1CF2E:
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$39
	ld a,[hl]
	add a,c
	ld hl,$4F66
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1CF3F
	inc h

Unknown_0x1CF3F:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld e,$45
	ld a,[de]
	rla
	jr nc,Unknown_0x1CF56
	ld a,c
	cpl
	add a,$01
	ld c,a
	ld a,b
	cpl
	adc a,$00
	ld b,a

Unknown_0x1CF56:
	ld e,$0D
	ld a,c
	ld [de],a
	inc e
	ld a,b
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	pop bc
	ret

UnknownData_0x1CF66:
INCBIN "baserom.gb", $1CF66, $1CF8A - $1CF66
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1CF96
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1CF96:
	call Unknown_0x197F
	jr nc,Unknown_0x1CFA3
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1CFA3:
	ret

UnknownData_0x1CFA4:
INCBIN "baserom.gb", $1CFA4, $1D007 - $1CFA4
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D013
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D013:
	call Unknown_0x197F
	jr nc,Unknown_0x1D020
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1D020:
	ret

UnknownData_0x1D021:
INCBIN "baserom.gb", $1D021, $1D08E - $1D021

Unknown_0x1D08E:
INCBIN "baserom.gb", $1D08E, $1D0B0 - $1D08E
	call Unknown_0x0DA4
	ld hl,$A009
	ld e,l
	ld a,[de]
	sub [hl]
	add a,$08
	cp $10
	jr nc,Unknown_0x1D0DE
	ld l,$0B
	ld e,l
	ld a,[de]
	sub [hl]
	add a,$08
	cp $10
	jr nc,Unknown_0x1D0DE
	ld e,$0E
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	jp Unknown_0x0BBA
	call Unknown_0x0DA4

Unknown_0x1D0DE:
	ld e,$3B
	ld a,[de]
	or a
	ld e,$15
	ld a,[$DA0E]
	jr nz,Unknown_0x1D0EE
	and $06
	rrca
	jr Unknown_0x1D0F2

Unknown_0x1D0EE:
	and $0C
	rrca
	rrca

Unknown_0x1D0F2:
	add a,$03
	ld [de],a
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D0FE
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D0FE:
	call Unknown_0x197F
	jr nc,Unknown_0x1D10B
	ld e,$07
	ld bc,Unknown_0x1D08E
	jp Unknown_0x0846

Unknown_0x1D10B:
	ret
	call Unknown_0x0C91
	call Unknown_0x0C94
	call Unknown_0x0DA4
	ld e,$15
	ld a,[$DA0E]
	and $0C
	rrca
	rrca
	add a,$03
	ld [de],a
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D12A
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D12A:
	ret

UnknownData_0x1D12B:
INCBIN "baserom.gb", $1D12B, $1D16B - $1D12B

Unknown_0x1D16B:
INCBIN "baserom.gb", $1D16B, $1D16C - $1D16B
	push bc
	ld h,d
	ld l,$45
	ld a,[hl]
	rla
	ld a,$E0
	ld bc,$000A
	jr nc,Unknown_0x1D17E
	ld a,$20
	ld bc,$FFF6

Unknown_0x1D17E:
	ld l,$11
	ld [hl],a
	ld l,$3B
	ld a,$80
	ld [hli],a
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld a,$80
	ld [hli],a
	ld a,$F8
	ld [hli],a
	ld [hl],$FF
	pop bc
	ret
	call Unknown_0x1D1C0
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	call Unknown_0x1D1CE
	call Unknown_0x1CD97
	ld hl,$A009
	ld e,l
	ld a,[de]
	sub [hl]
	add a,$08
	cp $10
	jr nc,Unknown_0x1D1BF
	ld a,$01
	ld [$A07C],a
	ld e,$07
	ld bc,Unknown_0x1D16B
	jp Unknown_0x0846

Unknown_0x1D1BF:
	ret

Unknown_0x1D1C0:
	ld e,$03
	ld h,d
	ld l,$3B
	ld c,$06

Unknown_0x1D1C7:
	ld a,[hli]
	ld [de],a
	inc e
	dec c
	jr nz,Unknown_0x1D1C7
	ret

Unknown_0x1D1CE:
	ld hl,$A003
	ld e,$3B
	ld b,d
	ld c,l
	ld a,[bc]
	ld [de],a
	add a,[hl]
	ld [bc],a
	inc e
	inc l
	inc c
	ld a,[bc]
	ld [de],a
	adc a,[hl]
	ld [bc],a
	inc e
	inc l
	inc c
	ld a,[bc]
	ld [de],a
	adc a,[hl]
	ld [bc],a
	inc e
	inc l
	inc c
	ld a,[bc]
	ld [de],a
	add a,[hl]
	ld [bc],a
	inc e
	inc l
	inc c
	ld a,[bc]
	ld [de],a
	adc a,[hl]
	ld [bc],a
	inc e
	inc l
	inc c
	ld a,[bc]
	ld [de],a
	adc a,[hl]
	ld [bc],a
	ret

UnknownData_0x1D1FD:
INCBIN "baserom.gb", $1D1FD, $1D23C - $1D1FD
	call Unknown_0x1D1C0
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	jp Unknown_0x1D1CE

UnknownData_0x1D24B:
INCBIN "baserom.gb", $1D24B, $1D272 - $1D24B
	call Unknown_0x0DA4
	ld e,$15
	ld a,[de]
	cp $07
	jr nc,Unknown_0x1D285
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D2A8

Unknown_0x1D281:
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D285:
	ld h,d
	ld bc,$0000
	ld de,$FFF9
	call Unknown_0x1AD9
	call Unknown_0x1CD9A
	push af
	ld h,d
	ld bc,$0000
	ld de,$0007
	call Unknown_0x1AD9
	call Unknown_0x1CD9A
	jr nc,Unknown_0x1D2A5
	pop af
	jr Unknown_0x1D281

Unknown_0x1D2A5:
	pop af
	jr c,Unknown_0x1D281

Unknown_0x1D2A8:
	ret

UnknownData_0x1D2A9:
INCBIN "baserom.gb", $1D2A9, $1D2F7 - $1D2A9
	call Unknown_0x0C91
	call Unknown_0x0C80
	call Unknown_0x0C83
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D30C
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D30C:
	call Unknown_0x197F
	jr nc,Unknown_0x1D319
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1D319:
	call Unknown_0x1AB3
	jr nz,Unknown_0x1D32B
	ld e,$3C
	ld a,[de]
	inc a
	ld [de],a
	cp $10
	jr c,Unknown_0x1D32B
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D32B:
	ret

UnknownData_0x1D32C:
INCBIN "baserom.gb", $1D32C, $1D351 - $1D32C
	ld a,[$A070]
	ld e,$27
	ld [de],a
	ret
	push bc
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$39
	ld b,[hl]
	ld e,$45
	ld a,[de]
	rla
	ld hl,$5387
	jr nc,Unknown_0x1D36C
	ld hl,$53A7

Unknown_0x1D36C:
	ld a,b
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1D373
	inc h

Unknown_0x1D373:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld bc,$000E
	add hl,bc
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	pop bc
	ret

UnknownData_0x1D387:
INCBIN "baserom.gb", $1D387, $1D3C7 - $1D387
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D3D3
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D3D3:
	ret

UnknownData_0x1D3D4:
INCBIN "baserom.gb", $1D3D4, $1D3E5 - $1D3D4
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D3F5

Unknown_0x1D3ED:
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1D3F5:
	call Unknown_0x197F
	jr nc,Unknown_0x1D402
	ld e,$07
	ld bc,Unknown_0x1CCDF
	jp Unknown_0x0846

Unknown_0x1D402:
	ld a,[$FF00+$A6]
	bit 1,a
	jr nz,Unknown_0x1D3ED
	ret

UnknownData_0x1D409:
INCBIN "baserom.gb", $1D409, $1D449 - $1D409

Unknown_0x1D449:
INCBIN "baserom.gb", $1D449, $1D45B - $1D449

Unknown_0x1D45B:
INCBIN "baserom.gb", $1D45B, $1D45C - $1D45B
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D468
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D468:
	call Unknown_0x197F
	jr nc,Unknown_0x1D475
	ld e,$07
	ld bc,Unknown_0x1D449
	jp Unknown_0x0846

Unknown_0x1D475:
	ld e,$3B
	ld a,[de]
	dec a
	jr nz,Unknown_0x1D47F
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D47F:
	ld [de],a
	call Unknown_0x1AB3
	jr nz,Unknown_0x1D48D
	ld e,$07
	ld bc,Unknown_0x1D45B
	jp Unknown_0x0846

Unknown_0x1D48D:
	ret
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D49A
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D49A:
	ret

UnknownData_0x1D49B:
INCBIN "baserom.gb", $1D49B, $1D4AC - $1D49B
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D4B8
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D4B8:
	call Unknown_0x197F
	jr nc,Unknown_0x1D4C5
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1D4C5:
	ret

UnknownData_0x1D4C6:
INCBIN "baserom.gb", $1D4C6, $1D4DF - $1D4C6
	push bc
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$15
	ld a,[hl]
	dec a
	ld l,$45
	bit 7,[hl]
	jr z,Unknown_0x1D4F2
	sub $05
	cpl
	inc a

Unknown_0x1D4F2:
	ld [$FF00+$84],a
	ld hl,$5541
	add a,l
	ld l,a
	jr nc,Unknown_0x1D4FC
	inc h

Unknown_0x1D4FC:
	ld a,[hl]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$04
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ld a,[$FF00+$84]
	ld hl,$5547
	add a,l
	ld l,a
	jr nc,Unknown_0x1D514
	inc h

Unknown_0x1D514:
	ld a,[hl]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$07
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ld a,[$FF00+$84]
	ld hl,$554D
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1D52D
	inc h

Unknown_0x1D52D:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld bc,$000A
	add hl,bc
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	pop bc
	ret

UnknownData_0x1D541:
INCBIN "baserom.gb", $1D541, $1D565 - $1D541
	call Unknown_0x0DA4
	call Unknown_0x1CD97
	jr nc,Unknown_0x1D571
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D571:
	call Unknown_0x197F
	jr nc,Unknown_0x1D57E
	ld e,$07
	ld bc,Unknown_0x1CC83
	jp Unknown_0x0846

Unknown_0x1D57E:
	call Unknown_0x1AB3
	jr nz,Unknown_0x1D58B
	ld e,$07
	ld bc,$54DE
	jp Unknown_0x0846

Unknown_0x1D58B:
	ret

UnknownData_0x1D58C:
INCBIN "baserom.gb", $1D58C, $1D5B4 - $1D58C
	ld e,$3B
	ld a,[de]
	inc a
	ld [de],a
	and $02
	jr z,Unknown_0x1D5BF
	ld a,$10

Unknown_0x1D5BF:
	ld e,$47
	ld [de],a
	call Unknown_0x0C80
	call Unknown_0x0DA4
	call Unknown_0x1CD90
	jr nc,Unknown_0x1D5D1
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x1D5D1:
	ret

UnknownData_0x1D5D2:
INCBIN "baserom.gb", $1D5D2, $1D623 - $1D5D2
	call Unknown_0x0C80
	jp Unknown_0x0DA4

UnknownData_0x1D629:
INCBIN "baserom.gb", $1D629, $1D7BC - $1D629
	ld de,$D700
	ld hl,$0000
	jr Unknown_0x1D7CF

Unknown_0x1D7C4:
	ld a,e
	add a,a
	ld c,a
	ld a,$00
	adc a,$00
	ld b,a
	inc bc
	add hl,bc
	inc e

Unknown_0x1D7CF:
	ld a,h
	ld [de],a
	inc d
	ld a,l
	ld [de],a
	dec d
	ld a,e
	inc a
	jr nz,Unknown_0x1D7C4
	ret

UnknownData_0x1D7DA:
INCBIN "baserom.gb", $1D7DA, $1D7DC - $1D7DA

Unknown_0x1D7DC:
INCBIN "baserom.gb", $1D7DC, $1DA1C - $1D7DC
	push de
	ld hl,$CD4D
	ld [hl],$00
	inc l
	ld a,[$DD30]
	ld [hli],a
	ld a,[$DD31]
	ld [hli],a
	ld [hl],$00
	inc l
	ld [hl],$CF
	ld a,[$DD2F]
	ld l,a
	ld h,$00
	ld d,h
	ld e,l
	add hl,hl
	add hl,de
	add hl,hl
	ld de,$5629
	add hl,de
	inc hl
	inc hl
	inc hl
	ld a,[hli]
	ld [$DD52],a
	ld a,[hli]
	ld [$DD53],a
	ld a,[hl]
	ld [$DD37],a
	ld a,$01
	ld [$DD58],a
	ld hl,$DD57
	ld a,$2B
	ld [hld],a
	ld [hl],$2C
	ld hl,$DD35
	ld a,$4E
	ld [hli],a
	ld [hl],$DD
	ld hl,$DA14
	ld a,$51
	ld [hli],a
	ld [hl],$2B
	ld hl,$DA16
	ld a,$51
	ld [hli],a
	ld [hl],$2B
	ld a,$50
	ld [$FF00+$45],a
	ld [$DA29],a
	pop de
	ret
	ld hl,$DEDB
	xor a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld hl,$DEE0
	ld [hl],a
	ld hl,$DEE1
	ld [hl],a
	ld hl,$DEE9
	ld [hl],a
	ld hl,$DEEA
	ld [hl],a
	ld hl,$DEE3
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld a,$05
	ld hl,$DEEB
	ld [hl],a
	ld hl,$DEEC
	ld [hl],a
	ret
	ld hl,$DA29
	ld a,b
	ld [hli],a
	ld [$FF00+$45],a
	ld a,c
	ld [hl],a
	ld hl,$DA16
	ld a,$E0
	ld [hli],a
	ld [hl],$02
	ld a,$01
	ld [$DA2B],a
	ld hl,$FF41
	set 6,[hl]
	ld hl,$8FF0
	ld bc,$0010
	ld a,$FF
	call Unknown_0x062F
	ld hl,$9C00
	ld bc,$0400
	ld a,$FF
	call Unknown_0x062F
	ld a,$47
	ld [$FF00+$40],a
	ret
	xor a
	ld [$DA2B],a
	ld hl,$DA16
	ld a,$AA
	ld [hli],a
	ld [hl],$02
	ld hl,$DA14
	ld a,$AA
	ld [hli],a
	ld [hl],$02
	ld a,$7F
	ld [$FF00+$45],a
	ld [$DA29],a
	xor a
	ld hl,$FF42
	ld [hli],a
	ld [hl],a
	ld [$DA01],a
	ld [$DA00],a
	ld a,$47
	ld [$FF00+$40],a
	ret
	ld hl,$DA29
	ld a,b
	ld [hl],a
	ld [$FF00+$45],a
	ld hl,$DA16
	ld a,$0C
	ld [hli],a
	ld [hl],$03
	ld hl,$FF41
	set 6,[hl]
	ret
	ld a,$67
	ld [$FF00+$40],a
	ld a,$58
	ld [$FF00+$4A],a
	ld a,$07
	ld [$FF00+$4B],a
	ret
	ld hl,$DA14
	ld a,$AA
	ld [hli],a
	ld [hl],$02
	ld hl,$DA16
	ld a,$AA
	ld [hli],a
	ld [hl],$02
	ld a,$7F
	ld [$FF00+$45],a
	ld [$DA29],a
	ld c,$14
	ld de,Unknown_0x1DB5D
	ld hl,$9C00

Unknown_0x1DB47:
	ld a,[de]
	inc de
	ld [hli],a
	dec c
	jr nz,Unknown_0x1DB47
	ld hl,$9C20

Unknown_0x1DB50:
	ld a,[de]
	inc de
	ld [hli],a
	dec c
	jr nz,Unknown_0x1DB50
	ld hl,$DEDE
	xor a
	ld [hli],a
	ld [hl],a
	ret

Unknown_0x1DB5D:
INCBIN "baserom.gb", $1DB5D, $1DB85 - $1DB5D

Unknown_0x1DB85:
	ld hl,$DEDE
	ld b,[hl]
	bit 7,b
	jp nz,Unknown_0x1DBBA
	bit 1,b
	call nz,Unknown_0x1DCC6
	bit 2,b
	call nz,Unknown_0x1DE92
	bit 3,b
	call nz,Unknown_0x1DEC8
	bit 5,b
	call nz,Unknown_0x1DE06
	bit 6,b
	call nz,Unknown_0x1DE6A
	ld hl,$DEDF
	bit 0,[hl]
	jr nz,Unknown_0x1DBB4
	bit 0,b
	call nz,Unknown_0x1DC6D
	ret

Unknown_0x1DBB4:
	bit 4,b
	call nz,Unknown_0x1DF13
	ret

Unknown_0x1DBBA:
	ld hl,$DEE9
	ld a,[hl]
	and a
	jr z,Unknown_0x1DBC4
	dec a
	ld [hl],a
	ret

Unknown_0x1DBC4:
	ld de,$DEE6
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	inc e
	ld a,[de]
	jp Unknown_0x05CF

UnknownData_0x1DBD1:
INCBIN "baserom.gb", $1DBD1, $1DBD2 - $1DBD1

Unknown_0x1DBD2:
	ld hl,$DEDF
	bit 0,[hl]
	call nz,Unknown_0x1DC12
	ld hl,$DEDF
	bit 1,[hl]
	jr nz,Unknown_0x1DBE9
	ld de,$A04C
	ld hl,$DEE3
	jr Unknown_0x1DBEF

Unknown_0x1DBE9:
	ld de,$A072
	ld hl,$DEE5

Unknown_0x1DBEF:
	ld a,[de]
	cp [hl]
	ret z
	jr nc,Unknown_0x1DC01
	ld a,[de]
	ld [hl],a
	ld hl,$DEEB
	xor a
	ld [hl],a
	ld hl,$DEDE
	set 1,[hl]
	ret

Unknown_0x1DC01:
	ld hl,$DEEB
	ld a,[hl]
	and a
	jr z,Unknown_0x1DC0B
	dec a
	ld [hl],a
	ret

Unknown_0x1DC0B:
	ld a,$05
	ld [hl],a
	call Unknown_0x1DD36
	ret

Unknown_0x1DC12:
	call Unknown_0x1DC39
	ld hl,$DEE4
	cp [hl]
	ret z
	jr nc,Unknown_0x1DC28
	ld [hl],a
	ld hl,$DEEC
	xor a
	ld [hl],a
	ld hl,$DEDE
	set 4,[hl]
	ret

Unknown_0x1DC28:
	ld hl,$DEEC
	ld a,[hl]
	and a
	jr z,Unknown_0x1DC32
	dec a
	ld [hl],a
	ret

Unknown_0x1DC32:
	ld a,$05
	ld [hl],a
	call Unknown_0x1DDBB
	ret

Unknown_0x1DC39:
	push bc
	push hl
	xor a
	ld b,a
	ld d,a
	ld hl,$A085
	ld a,[hl]
	add a,a
	jr nc,Unknown_0x1DC46
	inc b

Unknown_0x1DC46:
	add a,a
	rl b
	ld l,a
	ld h,b
	add a,a
	rl b
	add a,l
	ld c,a
	ld a,b
	adc a,h
	ld b,a
	ld hl,$A086
	ld e,[hl]
	ld a,c

Unknown_0x1DC58:
	ld c,a
	sub e
	jr nc,Unknown_0x1DC61
	dec b
	bit 7,b
	jr nz,Unknown_0x1DC64

Unknown_0x1DC61:
	inc d
	jr Unknown_0x1DC58

Unknown_0x1DC64:
	ld a,c
	and a
	ld a,d
	jr z,Unknown_0x1DC6A
	inc a

Unknown_0x1DC6A:
	pop hl
	pop bc
	ret

Unknown_0x1DC6D:
	ld a,$07
	call Unknown_0x0675
	ret c
	push bc
	ld de,$9C21
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld c,$70
	ld de,$DEDB
	ld a,[de]
	ld b,a
	inc de
	ld b,a
	swap a
	and $0F
	add a,c
	ld [hl],a
	inc l
	ld a,b
	and $0F
	add a,c
	ld [hl],a
	inc l
	ld a,[de]
	inc de
	ld b,a
	swap a
	and $0F
	add a,c
	ld [hl],a
	inc l
	ld a,b
	and $0F
	add a,c
	ld [hl],a
	inc l
	ld a,[de]
	ld b,a
	swap a
	and $0F
	add a,c
	ld [hl],a
	inc l
	ld a,b
	and $0F
	add a,c
	ld [hl],a
	inc l
	ld a,c
	ld [hl],a
	inc l
	ld a,l
	ld [$FF00+$92],a
	pop bc
	ld hl,$DEDE
	res 0,b
	ld [hl],b
	ret

Unknown_0x1DCC6:
	ld a,$07
	call Unknown_0x0675
	ret c
	ld de,$9C01
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld [hl],$7B
	inc l
	ld de,$DEDF
	ld a,[de]
	bit 1,a
	jr nz,Unknown_0x1DD13
	ld de,$A04C
	ld a,[de]
	ld d,$06

Unknown_0x1DCEC:
	and a
	jr z,Unknown_0x1DCFF
	sub $02
	jr c,Unknown_0x1DCFB
	ld [hl],$64
	inc l
	dec d
	jr nz,Unknown_0x1DCEC
	jr Unknown_0x1DD09

Unknown_0x1DCFB:
	dec d
	ld [hl],$6E
	inc l

Unknown_0x1DCFF:
	ld a,d
	and a
	jr z,Unknown_0x1DD09
	ld [hl],$63
	inc l
	dec d
	jr nz,Unknown_0x1DCFF

Unknown_0x1DD09:
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEDE
	res 1,b
	ld [hl],b
	ret

Unknown_0x1DD13:
	ld a,[$A072]
	ld d,$06
	and a
	jr z,Unknown_0x1DD22

Unknown_0x1DD1B:
	ld [hl],$64
	inc l
	dec d
	dec a
	jr nz,Unknown_0x1DD1B

Unknown_0x1DD22:
	ld a,d
	and a
	jr z,Unknown_0x1DD2C

Unknown_0x1DD26:
	ld [hl],$63
	inc l
	dec d
	jr nz,Unknown_0x1DD26

Unknown_0x1DD2C:
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEDE
	res 1,b
	ld [hl],b
	ret

Unknown_0x1DD36:
	ld a,$07
	call Unknown_0x0675
	jr nc,Unknown_0x1DD43
	ld hl,$DEEB
	ld [hl],$00
	ret

Unknown_0x1DD43:
	ld de,$9C01
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld [hl],$7B
	inc l
	ld de,$DEDF
	ld a,[de]
	bit 1,a
	jr nz,Unknown_0x1DD91
	ld de,$DEE3
	ld a,[de]
	inc a
	inc a
	ld [de],a
	ld d,$06

Unknown_0x1DD66:
	and a
	jr z,Unknown_0x1DD79
	sub $02
	jr c,Unknown_0x1DD75
	ld [hl],$64
	inc l
	dec d
	jr nz,Unknown_0x1DD66
	jr Unknown_0x1DD83

Unknown_0x1DD75:
	dec d
	ld [hl],$6E
	inc l

Unknown_0x1DD79:
	ld a,d
	and a
	jr z,Unknown_0x1DD83
	ld [hl],$63
	inc l
	dec d
	jr nz,Unknown_0x1DD79

Unknown_0x1DD83:
	ld a,l
	ld [$FF00+$92],a
	ld e,$12
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ret

Unknown_0x1DD91:
	ld de,$DEE5
	ld a,[de]
	inc a
	ld [de],a
	ld d,$06

Unknown_0x1DD99:
	and a
	jr z,Unknown_0x1DDA3
	ld [hl],$64
	inc l
	dec a
	dec d
	jr nz,Unknown_0x1DD99

Unknown_0x1DDA3:
	ld a,d
	and a
	jr z,Unknown_0x1DDAD
	ld [hl],$63
	inc l
	dec d
	jr nz,Unknown_0x1DDA3

Unknown_0x1DDAD:
	ld a,l
	ld [$FF00+$92],a
	ld e,$12
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ret

Unknown_0x1DDBB:
	ld a,$07
	call Unknown_0x0675
	ret c
	ld de,$9C21
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld [hl],$7A
	inc l
	ld de,$DEE4
	ld a,[de]
	inc a
	ld [de],a
	ld d,$06

Unknown_0x1DDDB:
	and a
	jr z,Unknown_0x1DDEE
	sub $02
	jr c,Unknown_0x1DDEA
	ld [hl],$6F
	inc l
	dec d
	jr nz,Unknown_0x1DDDB
	jr Unknown_0x1DDF8

Unknown_0x1DDEA:
	dec d
	ld [hl],$6E
	inc l

Unknown_0x1DDEE:
	ld a,d
	and a
	jr z,Unknown_0x1DDF8
	ld [hl],$6D
	inc l
	dec d
	jr nz,Unknown_0x1DDEE

Unknown_0x1DDF8:
	ld a,l
	ld [$FF00+$92],a
	ld e,$12
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ret

Unknown_0x1DE06:
	ld a,$07
	call Unknown_0x0675
	ret c
	ld de,$9C09
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld de,$DEE1
	ld a,[de]
	and a
	jr z,Unknown_0x1DE4B
	ld [hl],$68
	inc l
	dec a
	jr z,Unknown_0x1DE4E
	ld [hl],$68
	inc l
	dec a
	jr z,Unknown_0x1DE51
	ld [hl],$68
	inc l
	dec a
	jr z,Unknown_0x1DE54
	ld [hl],$68
	inc l
	dec a
	jr z,Unknown_0x1DE57
	ld [hl],$68
	inc l
	dec a
	jr z,Unknown_0x1DE5A
	ld [hl],$68
	inc l
	dec a
	jr z,Unknown_0x1DE5D
	ld [hl],$68
	inc l
	jr Unknown_0x1DE60

Unknown_0x1DE4B:
	ld [hl],$67
	inc l

Unknown_0x1DE4E:
	ld [hl],$67
	inc l

Unknown_0x1DE51:
	ld [hl],$67
	inc l

Unknown_0x1DE54:
	ld [hl],$67
	inc l

Unknown_0x1DE57:
	ld [hl],$67
	inc l

Unknown_0x1DE5A:
	ld [hl],$67
	inc l

Unknown_0x1DE5D:
	ld [hl],$67
	inc l

Unknown_0x1DE60:
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEDE
	res 5,b
	ld [hl],b
	ret

Unknown_0x1DE6A:
	ld a,$01
	call Unknown_0x0675
	ret c
	ld de,$9C2F
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$01
	inc l
	ld a,[$DB60]
	inc a
	ld e,$70
	add a,e
	ld [hl],a
	inc l
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEDE
	res 6,b
	ld [hl],b
	ret

Unknown_0x1DE92:
	ld a,$03
	call Unknown_0x0675
	ret c
	ld de,$9C29
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$03
	inc l
	ld [hl],$7C
	inc l
	ld de,$A084
	ld a,[de]
	ld d,$70
	ld e,a
	swap a
	and $0F
	add a,d
	ld [hl],a
	inc l
	ld a,e
	and $0F
	add a,d
	ld [hl],a
	inc l
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEDE
	res 2,b
	ld [hl],b
	ret

Unknown_0x1DEC8:
	ld a,$40
	call Unknown_0x0675
	ret c
	push bc
	ld de,$9690
	ld a,[$FF00+$92]
	ld c,a
	ld b,$C4
	ld a,e
	ld [bc],a
	inc c
	ld a,d
	ld [bc],a
	inc c
	ld a,$40
	ld [bc],a
	inc c
	ld de,$DEE0
	ld a,[de]
	swap a
	ld l,a
	and $0F
	ld h,a
	ld a,l
	and $F0
	ld l,a
	sla l
	rl h
	sla l
	rl h
	ld a,$07
	call Unknown_0x05DD
	ld de,$57DC
	add hl,de
	ld d,$40

Unknown_0x1DF02:
	ld a,[hli]
	ld [bc],a
	inc c
	dec d
	jr nz,Unknown_0x1DF02
	ld a,c
	ld [$FF00+$92],a
	pop bc
	ld hl,$DEDE
	res 3,b
	ld [hl],b
	ret

Unknown_0x1DF13:
	ld a,$07
	call Unknown_0x0675
	ret c
	ld de,$9C21
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld [hl],$7A
	inc l
	call Unknown_0x1DC39
	ld d,$06

Unknown_0x1DF30:
	and a
	jr z,Unknown_0x1DF43
	sub $02
	jr c,Unknown_0x1DF3F
	ld [hl],$6F
	inc l
	dec d
	jr nz,Unknown_0x1DF30
	jr Unknown_0x1DF4D

Unknown_0x1DF3F:
	dec d
	ld [hl],$6E
	inc l

Unknown_0x1DF43:
	ld a,d
	and a
	jr z,Unknown_0x1DF4D
	ld [hl],$6D
	inc l
	dec d
	jr nz,Unknown_0x1DF43

Unknown_0x1DF4D:
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEDE
	res 4,b
	ld [hl],b
	ret
	ld hl,$DEEA
	ld [hl],$04
	ld a,$07
	call Unknown_0x0675
	ret c
	ld de,$9C09
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld [hl],$68
	inc l
	ld [hl],$68
	inc l
	ld [hl],$68
	inc l
	ld [hl],$68
	inc l
	ld [hl],$68
	inc l
	ld [hl],$68
	inc l
	ld [hl],$68
	inc l
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEE9
	ld [hl],$14
	ld hl,$DEE6
	ld [hl],$9A
	inc hl
	ld [hl],$5F
	inc hl
	ld [hl],$07
	ret
	ld a,$07
	call Unknown_0x0675
	ret c
	ld de,$9C09
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$07
	inc l
	ld [hl],$67
	inc l
	ld [hl],$67
	inc l
	ld [hl],$67
	inc l
	ld [hl],$67
	inc l
	ld [hl],$67
	inc l
	ld [hl],$67
	inc l
	ld [hl],$67
	inc l
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DEEA
	ld a,[hl]
	and a
	jp z,Unknown_0x1DFE2
	dec a
	ld [hl],a
	ld hl,$DEE9
	ld [hl],$0A
	ld hl,$DEE6
	ld [hl],$5C
	inc hl
	ld [hl],$5F
	inc hl
	ld [hl],$07
	ret

Unknown_0x1DFE2:
	ld hl,$DEDE
	res 7,[hl]
	xor a
	ld hl,$DEE9
	ld [hli],a
	ld [hl],a
	ret
	ld hl,$DF00
	ld a,$3E
	ld [hli],a
	ld [hl],$06
	ld hl,Unknown_0x1E107
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,Unknown_0x1E97D
	ld de,$9800
	call Unknown_0x0708
	ld a,$0B
	ld hl,Unknown_0x1E8A0
	ld de,$8000
	call Unknown_0x060D
	ld a,$09
	ld hl,$4000
	ld de,$8100
	ld bc,$0280
	call Unknown_0x05BF
	ld a,$09
	ld hl,$4280
	ld de,$8380
	ld bc,$0220
	call Unknown_0x05BF
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	ld a,$F8
	ld hl,$A0B3
	call Unknown_0x07C4
	xor a
	ld [$DF02],a
	ld hl,$CD09
	ld a,$E4
	ld [hli],a
	ld a,$D0
	ld [hli],a
	ld a,$E4
	ld [hl],a
	ld e,$FF
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld e,$06
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	call Unknown_0x1584
	ld a,$47
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld e,$08
	ld hl,$6011
	ld a,$1E
	call Unknown_0x05CF
	ld de,$0004
	ld hl,$4246
	ld a,$1A
	call Unknown_0x05CF
	ld e,$06
	ld hl,$606D
	ld a,$1E
	call Unknown_0x05CF
	ld a,$20

Unknown_0x1E09A:
	push af
	call Unknown_0x0496
	ld hl,$086B
	ld a,$00
	call Unknown_0x05CF
	call Unknown_0x04AE
	call Unknown_0x0343
	call Unknown_0x0357
	pop af
	dec a
	jr nz,Unknown_0x1E09A

Unknown_0x1E0B3:
	call Unknown_0x0496
	ld hl,$086B
	ld a,$00
	call Unknown_0x05CF
	call Unknown_0x0647
	call Unknown_0x04AE
	call Unknown_0x0343
	call Unknown_0x0357
	ld a,[$DF02]
	or a
	jr nz,Unknown_0x1E0E8
	ld hl,$DF00
	ld a,[hl]
	sub $01
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hld],a
	or [hl]
	jr nz,Unknown_0x1E0B3
	ld hl,$5E92
	ld a,$08
	call Unknown_0x05CF
	jr Unknown_0x1E0EF

Unknown_0x1E0E8:
	xor a
	ld [$DEFF],a
	jp Unknown_0x0437

Unknown_0x1E0EF:
	ld e,$00
	ld hl,$606D
	ld a,$1E
	call Unknown_0x05CF
	ld de,$0004
	ld hl,$427B
	ld a,$1A
	call Unknown_0x05CF
	jp Unknown_0x0437

Unknown_0x1E107:
INCBIN "baserom.gb", $1E107, $1E8A0 - $1E107

Unknown_0x1E8A0:
INCBIN "baserom.gb", $1E8A0, $1E97D - $1E8A0

Unknown_0x1E97D:
INCBIN "baserom.gb", $1E97D, $1EB00 - $1E97D
	ld e,$39
	ld a,[de]
	inc a
	cp $03
	jr c,Unknown_0x1EB09
	xor a

Unknown_0x1EB09:
	ld [de],a
	ret
	ld hl,Unknown_0x1FEA8
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x1EB2D
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x1EB2D
	ld e,$07
	ld bc,$6AEF
	jp Unknown_0x37F4

Unknown_0x1EB2D:
	jp Unknown_0x37F7

UnknownData_0x1EB30:
INCBIN "baserom.gb", $1EB30, $1EB5D - $1EB30
	ld hl,Unknown_0x1FEA8
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$15
	ld a,[de]
	cp $01
	jr nz,Unknown_0x1EB7D
	ld a,$08
	ld hl,Unknown_0x1EB94
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x1EB7D:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x1EB91
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x1EB91
	ld e,$07
	ld bc,$6B4F
	jp Unknown_0x37F4

Unknown_0x1EB91:
	jp Unknown_0x37F7

Unknown_0x1EB94:
INCBIN "baserom.gb", $1EB94, $1EBC2 - $1EB94
	ld e,$39
	ld a,[de]
	inc a
	ld [de],a
	ret
	ld hl,Unknown_0x1FEA8
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

UnknownData_0x1EBD9:
INCBIN "baserom.gb", $1EBD9, $1EBFA - $1EBD9
	ld e,$39
	ld a,[de]
	inc a
	cp $0B
	jr c,Unknown_0x1EC04
	ld a,$02

Unknown_0x1EC04:
	ld [de],a
	ret

UnknownData_0x1EC06:
INCBIN "baserom.gb", $1EC06, $1EC14 - $1EC06
	ld hl,Unknown_0x1FEA8
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x378B
	call Unknown_0x37A8
	ld e,$15
	ld a,[de]
	cp $01
	jr nz,Unknown_0x1EC34
	ld a,$02
	ld hl,Unknown_0x1EC52
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x1EC34:
	ld e,$3A
	ld a,[de]
	dec a
	jr nz,Unknown_0x1EC4E
	ld a,[$A070]
	or a
	jr nz,Unknown_0x1EC46
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x1EC4F

Unknown_0x1EC46:
	ld e,$07
	ld bc,$6C06
	jp Unknown_0x37F4

Unknown_0x1EC4E:
	ld [de],a

Unknown_0x1EC4F:
	jp Unknown_0x37F7

Unknown_0x1EC52:
INCBIN "baserom.gb", $1EC52, $1EC77 - $1EC52
	ld hl,$7EE2
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x1EC88
	call Unknown_0x37A8
	jp Unknown_0x37F7

Unknown_0x1EC88:
	call Unknown_0x378B
	ret nc
	ld e,$3F
	xor a
	ld [de],a
	scf
	ret

UnknownData_0x1EC92:
INCBIN "baserom.gb", $1EC92, $1ECA6 - $1EC92
	ld hl,$7EE2
	ld a,$02
	call Unknown_0x05CF
	ld hl,$581E
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x3765
	jr nc,Unknown_0x1ECC3
	ld e,$02
	ld bc,$60A3
	jp Unknown_0x37F4

Unknown_0x1ECC3:
	call Unknown_0x377C
	jr nc,Unknown_0x1ECD0
	ld e,$02
	ld bc,$619E
	jp Unknown_0x37F4

Unknown_0x1ECD0:
	jp Unknown_0x37F7

UnknownData_0x1ECD3:
INCBIN "baserom.gb", $1ECD3, $1ED18 - $1ECD3

Unknown_0x1ED18:
INCBIN "baserom.gb", $1ED18, $1ED20 - $1ED18
	ld hl,$7EE2
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x1EC88
	call Unknown_0x37A8
	ld e,$15
	ld a,[de]
	cp $01
	jr nz,Unknown_0x1ED40
	ld a,$06
	ld hl,Unknown_0x1ED57
	call Unknown_0x3AAA
	call Unknown_0x3AE4

Unknown_0x1ED40:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x1ED54
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x1ED54
	ld e,$07
	ld bc,$6D12
	jp Unknown_0x37F4

Unknown_0x1ED54:
	jp Unknown_0x37F7

Unknown_0x1ED57:
INCBIN "baserom.gb", $1ED57, $1ED73 - $1ED57
	ld a,[$DB76]
	or a
	ret z
	ld a,[$DA36]
	or a
	ret nz
	ld hl,$DB78
	ld a,[hli]
	ld [$CD00],a
	ld a,[hli]
	ld [$CD01],a
	ld a,[hl]
	ld [$CD02],a
	ret
	ld hl,$7EE2
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x3765
	jr nc,Unknown_0x1EDA2
	ld e,$02
	ld bc,$60A3
	jp Unknown_0x37F4

Unknown_0x1EDA2:
	call Unknown_0x377C
	jr nc,Unknown_0x1EDAF
	ld e,$02
	ld bc,$619E
	jp Unknown_0x37F4

Unknown_0x1EDAF:
	jp Unknown_0x37F7

UnknownData_0x1EDB2:
INCBIN "baserom.gb", $1EDB2, $1EDDE - $1EDB2
	ld hl,Unknown_0x1FF1C
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

UnknownData_0x1EDEF:
INCBIN "baserom.gb", $1EDEF, $1EE13 - $1EDEF
	ld hl,Unknown_0x1FF1C
	ld a,$02
	call Unknown_0x05CF
	ld hl,Unknown_0x1ED18
	ld a,$02
	call Unknown_0x05CF
	call Unknown_0x378B
	call Unknown_0x37A8
	jp Unknown_0x37F7

UnknownData_0x1EE2C:
INCBIN "baserom.gb", $1EE2C, $1EE80 - $1EE2C
	ld hl,Unknown_0x1FF1C
	ld a,$02
	call Unknown_0x05CF
	ld a,$03
	ld hl,Unknown_0x1EEA9
	call Unknown_0x3AAA
	call Unknown_0x3AE4
	call Unknown_0x378B
	call Unknown_0x37A8
	call Unknown_0x1EEAE
	jr nc,Unknown_0x1EEA6
	ld e,$02
	ld bc,$6740
	jp Unknown_0x37F4

Unknown_0x1EEA6:
	jp Unknown_0x37F7

Unknown_0x1EEA9:
INCBIN "baserom.gb", $1EEA9, $1EEAE - $1EEA9

Unknown_0x1EEAE:
	ld e,$39
	ld a,[de]
	or a
	jr z,Unknown_0x1EEB8
	dec a
	ld [de],a

Unknown_0x1EEB6:
	and a
	ret

Unknown_0x1EEB8:
	ld a,[$FF00+$A5]
	and $02
	jr nz,Unknown_0x1EEB6
	scf
	ret

UnknownData_0x1EEC0:
INCBIN "baserom.gb", $1EEC0, $1F178 - $1EEC0
	ld e,$39
	ld a,[de]
	inc a
	ld [de],a
	ret

UnknownData_0x1F17E:
INCBIN "baserom.gb", $1F17E, $1F1A3 - $1F17E
	ld e,$39
	ld a,[de]
	inc a
	cp $0B
	jr c,Unknown_0x1F1AD
	ld a,$02

Unknown_0x1F1AD:
	ld [de],a
	ret

UnknownData_0x1F1AF:
INCBIN "baserom.gb", $1F1AF, $1F279 - $1F1AF
	ld hl,$5CCF
	ld a,$02
	call Unknown_0x05CF
	ret
	ld hl,$6D73
	ld a,$07
	call Unknown_0x05CF
	ret

UnknownData_0x1F28B:
INCBIN "baserom.gb", $1F28B, $1F2B4 - $1F28B
	ld e,$3A
	ld a,[de]
	inc a
	cp $0B
	jr c,Unknown_0x1F2BE
	ld a,$02

Unknown_0x1F2BE:
	ld [de],a
	ret

UnknownData_0x1F2C0:
INCBIN "baserom.gb", $1F2C0, $1F3F5 - $1F2C0
	ld e,$15
	ld a,[de]
	cp $04
	ret c
	ld e,$45
	ld a,[de]
	xor $80
	ld [de],a
	ret

UnknownData_0x1F402:
INCBIN "baserom.gb", $1F402, $1F40A - $1F402

Unknown_0x1F40A:
	ld h,d
	ld a,[$A076]
	or a
	jr nz,Unknown_0x1F420
	ld l,$19
	set 5,[hl]
	ld l,$1C
	set 5,[hl]
	ld l,$1F
	set 5,[hl]
	call Unknown_0x0E2C

Unknown_0x1F420:
	ld bc,$A076
	ld a,[bc]
	ld hl,$7402
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x1F42D
	inc h

Unknown_0x1F42D:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld e,$09
	ld a,[de]
	add a,h
	ld [de],a
	ld e,$0B
	ld a,[de]
	add a,l
	ld [de],a
	ld a,[bc]
	inc a
	ld [bc],a
	cp $04
	ret c
	ld h,d
	ld l,$19
	res 5,[hl]
	ld l,$1C
	res 5,[hl]
	ld l,$1F
	res 5,[hl]
	ld l,$6C
	res 0,[hl]
	ret
	call Unknown_0x1F458
	jp Unknown_0x1F48B

Unknown_0x1F458:
	ld a,[$A071]
	ld hl,$7468
	add a,l
	ld l,a
	jr nc,Unknown_0x1F463
	inc h

Unknown_0x1F463:
	ld a,[hl]
	ld [$DF11],a
	ret

UnknownData_0x1F468:
INCBIN "baserom.gb", $1F468, $1F46C - $1F468
	call Unknown_0x1F472
	jp Unknown_0x1F48B

Unknown_0x1F472:
	ld a,[$A071]
	ld hl,$7487
	add a,l
	ld l,a
	jr nc,Unknown_0x1F47D
	inc h

Unknown_0x1F47D:
	ld a,[hl]
	ld hl,$A05B
	add a,[hl]
	inc a
	ld [$DF11],a
	ret

UnknownData_0x1F487:
INCBIN "baserom.gb", $1F487, $1F48B - $1F487

Unknown_0x1F48B:
	ld a,[$DF11]
	push bc
	ld h,$00
	ld l,a
	ld b,h
	ld c,l
	add hl,hl
	add hl,bc
	add hl,hl
	add hl,bc
	ld bc,$74BB
	add hl,bc
	ld e,$65
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$67
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$6A
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ld a,$01
	ld e,$64
	ld [de],a
	pop bc
	ret

UnknownData_0x1F4BB:
INCBIN "baserom.gb", $1F4BB, $1FEA8 - $1F4BB

Unknown_0x1FEA8:
INCBIN "baserom.gb", $1FEA8, $1FF1C - $1FEA8

Unknown_0x1FF1C:
INCBIN "baserom.gb", $1FF1C, $20000 - $1FF1C

SECTION "Bank08", ROMX, BANK[$08]

Unknown_0x20000:
	ld a,$A0
	ld [$DA48],a
	xor a
	ld [$DA46],a
	ld [$DA47],a
	ld hl,$B201
	ld [hl],a
	dec h
	ld b,$12
	ld a,$B2

Unknown_0x20015:
	ld [hl],a
	dec h
	dec a
	dec b
	jr nz,Unknown_0x20015
	ld a,$FF
	ld b,$13
	ld hl,$A000

Unknown_0x20022:
	ld [hl],a
	inc h
	dec b
	jr nz,Unknown_0x20022
	ret
	ld hl,$A000
	ld de,$DAE6
	ld bc,$004D
	call Unknown_0x0621
	ld a,[$DA46]
	ld [$DB33],a
	ld a,$A0
	ld [$DA46],a
	xor a
	ld [$A001],a
	ret
	ld de,$A000
	ld hl,$DAE6
	ld bc,$004D
	call Unknown_0x0621
	ld a,[$DB33]
	ld [$DA46],a
	ret
	xor a
	ld b,$2F
	ld hl,$A050

Unknown_0x2005D:
	ld [hli],a
	dec b
	jr nz,Unknown_0x2005D
	ret

Unknown_0x20062:
	ld hl,Unknown_0x21FE1
	ld a,$1E
	call Unknown_0x05CF
	ld hl,Unknown_0x21F68
	ld a,$1E
	call Unknown_0x05CF
	xor a
	ld [$DEFF],a

Unknown_0x20076:
	ld hl,$7A2D
	ld a,$10
	call Unknown_0x05CF

Unknown_0x2007E:
	ld hl,$5FEE
	ld a,$07
	call Unknown_0x05CF
	ld a,[$DEFF]
	or a
	jp nz,Unknown_0x203F3
	ld hl,$68D2
	ld a,$0F
	call Unknown_0x05CF
	ld a,[$DF0A]
	cp $FF
	jr z,Unknown_0x2007E
	cp $03
	jr c,Unknown_0x200AB
	cp $04
	jp c,Unknown_0x203E8
	jp z,Unknown_0x2032C
	jp Unknown_0x2038C

Unknown_0x200AB:
	call Unknown_0x2049B
	ld hl,$DB39
	ld [hl],$00

Unknown_0x200B3:
	ld e,$07
	ld hl,Unknown_0x2206D
	ld a,$1E
	call Unknown_0x05CF
	ld hl,$32FF
	ld a,$00
	call Unknown_0x05CF
	ld e,$00
	ld hl,Unknown_0x2206D
	ld a,$1E
	call Unknown_0x05CF
	call Unknown_0x206EF
	cp $FF
	jr z,Unknown_0x200E8
	cp $07
	jr nc,Unknown_0x200E8
	ld e,a
	ld hl,$2A2B
	ld a,$00
	call Unknown_0x05CF
	ld a,$01
	ld [$DB38],a

Unknown_0x200E8:
	ld hl,$10E6
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	ld a,[$DB60]
	ld hl,$4278
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x20104
	inc h

Unknown_0x20104:
	ld a,[hli]
	ld h,[hl]
	ld l,a

Unknown_0x20107:
	call Unknown_0x204D0

Unknown_0x2010A:
	ld hl,$11BE
	ld a,$00
	call Unknown_0x05CF
	ld a,[$A082]
	dec a
	ld hl,$4123
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x2011F
	inc h

Unknown_0x2011F:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp hl

UnknownData_0x20123:
INCBIN "baserom.gb", $20123, $20128 - $20123

Unknown_0x20128:
INCBIN "baserom.gb", $20128, $20135 - $20128
	ld a,[$DB61]
	ld [$DB6D],a
	cp $08
	jr nz,Unknown_0x20149
	ld e,$00
	ld hl,Unknown_0x2206D
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x20149:
	ld hl,$1220
	ld a,$00
	call Unknown_0x05CF
	ld a,[hl]
	cp $20
	jp nc,Unknown_0x20107
	cp $01
	jp nz,Unknown_0x20107
	ld a,$FF
	ld [$DB57],a
	ld hl,$3212
	ld a,$00
	call Unknown_0x05CF
	ld hl,$10E6
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	ld a,[$DB61]
	ld e,a
	ld a,[$DB60]
	call Unknown_0x162A
	or a
	jr nz,Unknown_0x2018D
	ld a,$01
	ld [$DB3A],a
	jr Unknown_0x20195

Unknown_0x2018D:
	ld hl,$6D6C
	ld a,$0F
	call Unknown_0x05CF

Unknown_0x20195:
	xor a
	ld [$DB6E],a
	ld hl,$4851
	ld a,$08
	call Unknown_0x05CF
	jp Unknown_0x20107
	ld e,$04
	ld hl,Unknown_0x20280
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld a,[$DF0A]
	cp $04
	jp z,Unknown_0x2007E
	call Unknown_0x206CB
	ld a,[$A084]
	or a
	jr z,Unknown_0x201FB
	dec a
	daa
	ld [$A084],a
	ld hl,$6D6C
	ld a,$0F
	call Unknown_0x05CF
	ld hl,$DEDE
	set 2,[hl]
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	ld e,$01
	ld hl,$459C
	ld a,$07
	call Unknown_0x05CF
	ld e,$02
	ld hl,$459C
	ld a,$07
	call Unknown_0x05CF
	ld a,[$DB36]
	ld l,a
	ld a,[$DB37]
	ld h,a
	jp Unknown_0x20107

Unknown_0x201FB:
	ld a,$02
	ld [$A084],a
	ld hl,$5A7C
	ld a,$07
	call Unknown_0x05CF
	ld hl,$6D6C
	ld a,$0F
	call Unknown_0x05CF
	ld hl,$2A29
	ld a,$00
	call Unknown_0x05CF
	ld a,[$DA2C]
	cp $01
	jp z,Unknown_0x2007E
	ld hl,$10E6
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	ld hl,$4851
	ld a,$08
	call Unknown_0x05CF
	jp Unknown_0x20107
	ld e,$04
	ld hl,Unknown_0x20280
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld a,[$DB61]
	cp $08
	jr nz,Unknown_0x2025C
	ld e,$00
	ld hl,$606D
	ld a,$1E
	call Unknown_0x05CF
	jp Unknown_0x200B3

Unknown_0x2025C:
	ld a,[$DB60]
	cp $06
	jp nz,Unknown_0x200B3
	ld hl,$DEDF
	res 1,[hl]
	xor a
	ld [$DEE3],a
	ld a,$00
	ld [$A071],a
	ld hl,$50E4
	jp Unknown_0x20107

UnknownData_0x20278:
INCBIN "baserom.gb", $20278, $20280 - $20278

Unknown_0x20280:
INCBIN "baserom.gb", $20280, $20286 - $20280
	ld a,[$CD4D]
	or a
	jp nz,Unknown_0x2010A
	ld a,[$DEFF]
	or a
	jp nz,Unknown_0x20473
	ld hl,Unknown_0x22145
	ld a,$0F
	call Unknown_0x05CF
	ld a,[$DF04]
	rra
	jp nc,Unknown_0x2010A
	ld hl,$79F4
	ld a,$01
	call Unknown_0x05CF
	ld hl,$6D6C
	ld a,$0F
	call Unknown_0x05CF
	ld hl,$4851
	ld a,$08
	call Unknown_0x05CF
	jp Unknown_0x20107
	ld e,$04
	ld hl,$4280
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld hl,$1126
	ld a,$00
	call Unknown_0x05CF
	ld hl,$79F4
	ld a,$01
	call Unknown_0x05CF
	ld a,[$DF0A]
	cp $05
	jp z,Unknown_0x203BD
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DB6E
	or [hl]
	ld [hl],a
	ld a,$01
	ld [$DB3C],a
	ld hl,$6D6C
	ld a,$0F
	call Unknown_0x05CF
	ld hl,$4851
	ld a,$08
	call Unknown_0x05CF
	jp Unknown_0x20107
	ld e,$08
	ld hl,Unknown_0x20280
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld hl,$3C92
	ld a,$00
	call Unknown_0x05CF
	jp Unknown_0x2007E
	call Unknown_0x0437
	ld hl,$4000
	ld a,$19
	call Unknown_0x05CF
	jp Unknown_0x2007E

Unknown_0x2032C:
	call Unknown_0x2049B
	xor a
	ld [$DB6A],a
	ld [$DB6B],a
	ld [$A084],a
	ld [$A071],a
	ld [$A051],a
	ld hl,$DEDB
	ld [hli],a
	ld [hli],a
	ld [hl],a
	dec a
	ld [$A05B],a
	ld [$DB60],a
	ld a,$7F
	ld [$DD63],a
	ld hl,$10E6
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	jr Unknown_0x20370

UnknownData_0x20363:
INCBIN "baserom.gb", $20363, $20370 - $20363

Unknown_0x20370:
	ld hl,$DEDE
	set 6,[hl]
	ld a,[$DB60]
	inc a
	ld [$DB60],a
	inc a
	ld bc,$0005
	ld hl,$50E8
	jr Unknown_0x20386

Unknown_0x20385:
	add hl,bc

Unknown_0x20386:
	dec a
	jr nz,Unknown_0x20385
	jp Unknown_0x20107

Unknown_0x2038C:
	call Unknown_0x2049B
	xor a
	ld [$A084],a
	ld [$A071],a
	ld [$A051],a
	ld hl,$DEDB
	ld [hli],a
	ld [hli],a
	ld [hl],a
	dec a
	ld [$A05B],a
	ld [$DB60],a
	ld a,$7F
	ld [$DB6A],a
	ld hl,$10E6
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	jr Unknown_0x203BD

Unknown_0x203BD:
	ld hl,$DEDE
	set 6,[hl]
	ld a,[$DB60]
	inc a
	cp $06
	jr z,Unknown_0x203DD
	ld [$DB60],a
	inc a
	ld bc,$0005
	ld hl,$50E8
	jr Unknown_0x203D7

Unknown_0x203D6:
	add hl,bc

Unknown_0x203D7:
	dec a
	jr nz,Unknown_0x203D6
	jp Unknown_0x20107

Unknown_0x203DD:
	ld hl,$6C52
	ld a,$0E
	call Unknown_0x05CF
	jp Unknown_0x2007E

Unknown_0x203E8:
	ld hl,$655F
	ld a,$0E
	call Unknown_0x05CF
	jp Unknown_0x2007E

Unknown_0x203F3:
	ld a,$06
	ld [$DF0A],a
	ld e,$FF
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	call Unknown_0x2049B
	ld a,[$DEFF]
	dec a
	ld c,a
	add a,a
	add a,c
	ld c,a
	ld b,$00
	ld hl,Unknown_0x2046A
	add hl,bc
	ld a,[hli]
	ld [$A071],a
	ld a,[hli]
	ld [$A051],a
	ld a,[hl]
	ld [$A05B],a
	xor a
	ld [$DB6A],a
	ld hl,$DEDB
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld [$DD63],a
	ld a,$02
	ld [$A084],a
	ld a,$0C
	ld [$DEE3],a
	ld a,$06
	ld [$DEE5],a
	ld hl,$10E6
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	ld hl,$DEDE
	set 6,[hl]
	set 1,[hl]
	ld a,[$DEFF]
	ld hl,$4462
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x2045E
	inc h

Unknown_0x2045E:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	jp Unknown_0x20107

UnknownData_0x20464:
INCBIN "baserom.gb", $20464, $2046A - $20464

Unknown_0x2046A:
INCBIN "baserom.gb", $2046A, $20473 - $2046A

Unknown_0x20473:
	xor a
	ld [$DA3A],a
	ld e,$04
	ld hl,Unknown_0x20280
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	jp Unknown_0x20076

UnknownData_0x20487:
INCBIN "baserom.gb", $20487, $2049B - $20487

Unknown_0x2049B:
	ld hl,Unknown_0x21A7C
	ld a,$07
	call Unknown_0x05CF
	ld a,$86
	ld [$A083],a
	call Unknown_0x206CB
	xor a
	ld [$DB7B],a
	ld [$DB6E],a
	ld hl,$DBD0
	ld bc,$012C
	ld a,$00
	call Unknown_0x062F
	ld a,$D0
	ld [$DCFD],a
	ld a,$DB
	ld [$DCFE],a
	ld hl,$6D21
	ld a,$0F
	call Unknown_0x05CF
	ret

Unknown_0x204D0:
	push hl
	xor a
	ld [$A07E],a
	ld [$DB73],a
	ld [$DB74],a
	ld [$DB75],a
	ld [$DB76],a
	ld [$DB77],a
	ld hl,$A077
	ld [hli],a
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld hl,$DB78
	ld a,$E4
	ld [hli],a
	ld a,$D0
	ld [hli],a
	ld a,$E4
	ld [hli],a
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	pop hl
	ld a,l
	ld [$DB36],a
	ld a,h
	ld [$DB37],a

Unknown_0x20508:
	ld a,[hl]
	and $E0
	cp $20
	jp z,Unknown_0x20647
	cp $40
	jp z,Unknown_0x20650
	cp $80
	jp z,Unknown_0x20694
	cp $60
	jr nz,Unknown_0x20521
	inc hl
	jr Unknown_0x20508

Unknown_0x20521:
	ld a,[$DB3A]
	or a
	jr z,Unknown_0x20532
	xor a
	ld [$DB3A],a
	ld a,[hli]
	and $0F
	add a,$03
	jr Unknown_0x20565

Unknown_0x20532:
	ld a,[$DA2C]
	cp $02
	jr nz,Unknown_0x20542
	xor a
	ld [$DA2C],a
	inc hl
	ld a,$00
	jr Unknown_0x20565

Unknown_0x20542:
	ld a,[$DB60]
	cp $06
	jr nc,Unknown_0x20562
	ld a,[$DB61]
	cp $09
	jr nz,Unknown_0x20562
	push hl
	ld a,[$DB60]
	call Unknown_0x0663
	pop hl
	ld e,a
	ld a,[$DB6A]
	and e
	jr z,Unknown_0x20562
	ld [$DB73],a

Unknown_0x20562:
	ld a,[hli]
	and $1F

Unknown_0x20565:
	ld [$A07F],a
	ld a,[hli]
	ld [$DB57],a
	ld a,[hli]
	ld c,a
	rla
	sbc a,a
	scf
	rl c
	rla
	sla c
	rla
	sla c
	rla
	sla c
	rla
	ld b,a
	ld a,[hli]
	ld e,a
	rla
	sbc a,a
	scf
	rl e
	rla
	sla e
	rla
	sla e
	rla
	sla e
	rla
	ld d,a
	inc de
	ld a,$00
	ld hl,$A0A1
	call Unknown_0x07C4
	ld a,$08
	ld [$A00B],a
	ld [$A009],a
	ld hl,$1286
	ld a,$00
	call Unknown_0x05CF
	ld hl,$473A
	ld a,$08
	call Unknown_0x05CF
	ld hl,$41DC
	ld a,$07
	call Unknown_0x05CF
	ld hl,$4584
	ld a,$07
	call Unknown_0x05CF
	ld hl,$43A0
	ld a,$07
	call Unknown_0x05CF
	ld a,[$A07F]
	cp $02
	jr nz,Unknown_0x205E0
	ld a,$10
	ld hl,$6211
	ld de,$8100
	ld bc,$0360
	call Unknown_0x05BF
	jr Unknown_0x205F4

Unknown_0x205E0:
	cp $05
	jr nz,Unknown_0x205F4
	ld a,$0B
	ld hl,$6980
	ld de,$8000
	call Unknown_0x060D
	ld a,$01
	ld [$DB74],a

Unknown_0x205F4:
	ld hl,$4105
	ld a,$07
	call Unknown_0x05CF
	ld hl,Unknown_0x20128
	ld a,$07
	call Unknown_0x05CF
	ld hl,$40E2
	ld a,$07
	call Unknown_0x05CF
	ld hl,$DB78
	ld de,$CD09
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	call Unknown_0x3131
	ld a,$67
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld hl,$DEDF
	res 0,[hl]
	ld a,[$DB60]
	cp $02
	jr nz,Unknown_0x2063C
	ld a,[$DB61]
	cp $09
	jr nz,Unknown_0x2063C
	ld a,$01
	ld [$DB75],a

Unknown_0x2063C:
	ld e,$04
	ld hl,$424E
	ld a,$1A
	call Unknown_0x05CF
	ret

Unknown_0x20647:
	ld a,[hli]
	and $1F
	ld [$DB60],a
	jp Unknown_0x20508

Unknown_0x20650:
	ld a,[hli]
	and $1F
	ld [$DB61],a
	push hl
	cp $08
	jr nc,Unknown_0x20690
	ld e,$01
	ld hl,$459C
	ld a,$07
	call Unknown_0x05CF
	ld e,$02
	ld hl,$459C
	ld a,$07
	call Unknown_0x05CF
	ld a,[$DB3B]
	ld b,a
	ld a,[$DB60]
	cp b
	jr z,Unknown_0x20690
	ld [$DB3B],a
	ld e,$00
	ld hl,$459C
	ld a,$07
	call Unknown_0x05CF
	ld e,$03
	ld hl,$459C
	ld a,$07
	call Unknown_0x05CF

Unknown_0x20690:
	pop hl
	jp Unknown_0x20508

Unknown_0x20694:
	ld a,[hli]
	push hl
	and $1F
	cp $04
	jr z,Unknown_0x206B8
	ld bc,$0080
	ld hl,$A077
	cp $02
	jr c,Unknown_0x206AE
	ld bc,$FF80
	jr z,Unknown_0x206AE
	ld hl,$A079

Unknown_0x206AE:
	ld [hl],c
	inc hl
	ld [hl],b
	ld [$DB77],a
	pop hl
	jp Unknown_0x20508

Unknown_0x206B8:
	ld a,$01
	ld [$DB76],a
	ld a,$FA
	ld hl,$DB78
	ld [hli],a
	ld a,$F8
	ld [hli],a
	ld [hl],a
	pop hl
	jp Unknown_0x20508

Unknown_0x206CB:
	ld hl,$4057
	ld a,$08
	call Unknown_0x05CF
	ld hl,$DEDF
	res 1,[hl]
	ld a,$0C
	ld [$A04C],a
	ld a,$06
	ld [$A072],a
	xor a
	ld [$DEE3],a
	ld [$DEE5],a
	ld a,$FF
	ld [$A05B],a
	ret

Unknown_0x206EF:
	ld hl,$DB60
	ld a,[hl]
	ld b,$01
	and a

Unknown_0x206F6:
	jr z,Unknown_0x206FD
	sla b
	dec a
	jr Unknown_0x206F6

Unknown_0x206FD:
	ld hl,$DB39
	ld a,[hl]
	and b
	jr nz,Unknown_0x2070B
	ld a,[hl]
	or b
	ld [hl],a
	ld a,[$DB60]
	ret

Unknown_0x2070B:
	ld a,$FF
	ret
	push bc
	ld h,d
	ld l,$3B
	ld c,[hl]
	inc l
	ld b,[hl]
	inc l
	ld e,[hl]
	inc l
	ld d,[hl]
	call Unknown_0x2072B
	ld a,e
	sub $10
	ld e,a
	jr nc,Unknown_0x20723
	dec d

Unknown_0x20723:
	call Unknown_0x2072B
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x2072B:
	call Unknown_0x15E3
	inc [hl]
	ld a,[hl]
	ld [$FF00+$84],a
	push bc
	push de
	call Unknown_0x15B0
	pop de
	pop bc
	ret
	ld a,[$DB61]
	cp $08
	ret nz
	ld a,[$DB60]
	ld hl,$47C0
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x2074C
	inc h

Unknown_0x2074C:
	ld a,[hli]
	ld h,[hl]
	ld l,a

Unknown_0x2074F:
	ld a,[hli]
	cp $FF
	ret z
	ld c,a
	ld a,[hli]
	ld e,a
	push bc
	push de

Unknown_0x20758:
	ld a,[hl]
	and $E0
	cp $40
	jr z,Unknown_0x2076B
	inc hl
	jr Unknown_0x20758

Unknown_0x20762:
	pop hl
	pop de
	pop bc

Unknown_0x20765:
	inc hl
	inc hl
	inc hl
	inc hl
	jr Unknown_0x2074F

Unknown_0x2076B:
	ld a,[hli]
	push hl
	and $1F
	cp $09
	ld e,a
	ld a,[$DB60]
	jr z,Unknown_0x20784
	inc e
	dec e
	jr z,Unknown_0x20762
	dec e
	call Unknown_0x162A
	or a
	jr nz,Unknown_0x20762
	jr Unknown_0x2079C

Unknown_0x20784:
	call Unknown_0x1611
	or a
	jr nz,Unknown_0x2079C
	ld a,[$DB3C]
	or a
	jr nz,Unknown_0x20762
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DB6E
	and [hl]
	jr z,Unknown_0x20762

Unknown_0x2079C:
	pop hl
	pop de
	pop bc
	push hl
	swap c
	ld a,c
	and $0F
	ld b,a
	swap e
	ld a,e
	and $0F
	ld d,a
	call Unknown_0x15E3
	inc [hl]
	swap e
	dec e
	swap e
	ld a,e
	and $0F
	ld d,a
	call Unknown_0x15E3
	inc [hl]
	pop hl
	jr Unknown_0x20765

UnknownData_0x207C0:
INCBIN "baserom.gb", $207C0, $207CE - $207C0
	ld a,[$DB60]
	call Unknown_0x1611
	or a
	ld d,$49
	jr z,Unknown_0x207E0
	ld a,[$DB6D]
	inc a
	or $40
	ld d,a

Unknown_0x207E0:
	ld a,[$DB60]
	ld hl,$47C0
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x207EC
	inc h

Unknown_0x207EC:
	ld a,[hli]
	ld h,[hl]
	ld l,a

Unknown_0x207EF:
	ld a,[hli]
	cp $FF
	ret z
	ld c,a
	ld a,[hli]
	ld e,a
	push bc
	push de

Unknown_0x207F8:
	ld a,[hl]
	and $E0
	cp $40
	jr z,Unknown_0x2080A
	inc hl
	jr Unknown_0x207F8

Unknown_0x20802:
	pop de
	pop bc
	inc hl
	inc hl
	inc hl
	inc hl
	jr Unknown_0x207EF

Unknown_0x2080A:
	ld a,[hli]
	cp d
	jr nz,Unknown_0x20802
	pop de
	pop bc
	swap c
	ld a,c
	and $0F
	ld b,a
	swap e
	ld a,e
	and $0F
	ld d,a
	push bc
	push de
	call Unknown_0x2082C
	pop de
	pop bc
	swap e
	dec e
	swap e
	ld a,e
	and $0F
	ld d,a

Unknown_0x2082C:
	call Unknown_0x15E3
	ld a,[hl]
	dec a
	ld [hl],a
	ld [$FF00+$81],a
	push de
	ld d,$C9
	ld e,a
	ld a,[de]
	pop de
	cp $10
	jr z,Unknown_0x20846
	cp $18
	jr z,Unknown_0x20846
	cp $90
	jr nz,Unknown_0x20849

Unknown_0x20846:
	call Unknown_0x3BFB

Unknown_0x20849:
	ld a,[$FF00+$81]
	ld [$FF00+$84],a
	call Unknown_0x15B0
	ret
	ld a,[$DB60]
	ld hl,$4873
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x2085D
	inc h

Unknown_0x2085D:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[$DB61]
	inc a
	cp $09
	jr c,Unknown_0x20869
	xor a

Unknown_0x20869:
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x2086F
	inc h

Unknown_0x2086F:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ret

UnknownData_0x20873:
INCBIN "baserom.gb", $20873, $2133E - $20873
	ld a,[$DB70]
	ld e,$27
	ld [de],a
	or a
	jr nz,Unknown_0x21357
	ld a,$01
	ld [$DB70],a
	ld hl,$A17B

Unknown_0x2134F:
	ld [hl],$00
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x2134F

Unknown_0x21357:
	ld hl,$A17B

Unknown_0x2135A:
	ld a,[hl]
	or a
	jr z,Unknown_0x21365
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x2135A
	ret

Unknown_0x21365:
	ld e,$49
	ld a,[de]
	inc a
	ld [hl],a
	ld a,$FF
	ld [de],a
	ld e,$04
	ld l,$7F
	ld a,[de]
	ld [hl],a
	ld l,$88
	ld [hl],a
	inc e
	ld l,$80
	ld a,[de]
	ld [hl],a
	ld l,$89
	ld [hl],a
	inc e
	inc e
	ld l,$82
	ld a,[de]
	ld [hl],a
	ld l,$8A
	ld [hl],a
	inc e
	ld l,$83
	ld a,[de]
	ld [hl],a
	ld l,$8B
	ld [hl],a
	push bc
	push hl
	call Unknown_0x1AEA
	call Unknown_0x1646
	sub $A0
	rrca
	ld l,a
	ld h,$00
	ld bc,$53BB
	add hl,bc
	pop de
	ld e,$84
	ld c,$04

Unknown_0x213A6:
	ld a,[hli]
	ld [de],a
	inc e
	dec c
	jr nz,Unknown_0x213A6
	pop bc
	ld e,$7D
	ld a,$08
	ld [de],a
	ld e,$7C
	ld a,$13
	ld [de],a
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x213BB:
INCBIN "baserom.gb", $213BB, $213CB - $213BB

Unknown_0x213CB:
	ld hl,$FF93
	xor a
	ld [hli],a
	ld a,$86
	ld [hli],a
	xor a
	ld [hl],a
	ld de,$A17B

Unknown_0x213D8:
	push de
	ld a,[de]
	or a
	jr nz,Unknown_0x213E8

Unknown_0x213DD:
	pop de
	inc d
	ld a,d
	cp $B3
	jr nz,Unknown_0x213D8
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x213E8:
	xor a
	ld [$FF00+$84],a
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$19
	ld a,[hl]
	bit 5,a
	jr nz,Unknown_0x21428
	ld e,$7D
	ld a,[de]
	dec a
	ld [de],a
	jr nz,Unknown_0x21420
	ld a,$08
	ld [de],a
	ld e,$7C
	ld a,[de]
	inc a
	ld [de],a
	cp $16
	jr nz,Unknown_0x21420
	ld a,$13
	ld [de],a
	ld h,d
	ld l,$7F
	ld e,$88
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	inc e
	ld [hli],a
	inc l
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	ld [hl],a
	ld a,$01
	ld [$FF00+$84],a

Unknown_0x21420:
	ld e,$84
	ld h,d
	ld l,$7E
	call Unknown_0x0DA9

Unknown_0x21428:
	ld e,$7F
	ld hl,$DB51
	ld bc,$FF80
	call Unknown_0x0E34
	ld a,[$FF00+$84]
	or a
	jr z,Unknown_0x2146F
	ld a,[$FF00+$81]
	inc a
	cp $01
	ld a,[$FF00+$80]
	jr z,Unknown_0x21449
	jr nc,Unknown_0x21462
	cp $E0
	jr nc,Unknown_0x2144D
	jr Unknown_0x21462

Unknown_0x21449:
	cp $C0
	jr nc,Unknown_0x21462

Unknown_0x2144D:
	ld a,[$FF00+$83]
	inc a
	cp $01
	ld a,[$FF00+$82]
	jr z,Unknown_0x2145E
	jr nc,Unknown_0x21462
	cp $E0
	jr nc,Unknown_0x2146F
	jr Unknown_0x21462

Unknown_0x2145E:
	cp $A0
	jr c,Unknown_0x2146F

Unknown_0x21462:
	ld e,$7B
	ld a,[de]
	dec a
	ld l,a
	ld h,$BB
	xor a
	ld [hl],a
	ld [de],a
	jp Unknown_0x213DD

Unknown_0x2146F:
	ld e,$7C
	ld a,[de]
	add a,a
	ld c,a
	ld b,$00
	ld hl,Unknown_0x21486
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,$FF83
	call Unknown_0x051C
	jp Unknown_0x213DD

Unknown_0x21486:
INCBIN "baserom.gb", $21486, $2160E - $21486
	ld a,[$DB71]
	ld e,$27
	ld [de],a
	or a
	jr nz,Unknown_0x21627
	ld a,$01
	ld [$DB71],a
	ld hl,$A18C

Unknown_0x2161F:
	ld [hl],$00
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x2161F

Unknown_0x21627:
	ld hl,$A18C

Unknown_0x2162A:
	ld a,[hl]
	or a
	jr z,Unknown_0x21635
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x2162A
	ret

Unknown_0x21635:
	ld e,$49
	ld a,[de]
	inc a
	ld [hl],a
	ld a,$FF
	ld [de],a
	ld e,$04
	ld l,$90
	ld a,[de]
	ld [hl],a
	ld l,$99
	ld [hl],a
	inc e
	ld l,$91
	ld a,[de]
	ld [hl],a
	ld l,$9A
	ld [hl],a
	inc e
	inc e
	ld l,$93
	ld a,[de]
	ld [hl],a
	ld l,$9B
	ld [hl],a
	inc e
	ld l,$94
	ld a,[de]
	ld [hl],a
	ld l,$9C
	ld [hl],a
	push bc
	push hl
	call Unknown_0x1AEA
	call Unknown_0x1646
	cp $F0
	jr nz,Unknown_0x2166F
	ld a,$10
	jr Unknown_0x21672

Unknown_0x2166F:
	sub $20
	rrca

Unknown_0x21672:
	ld l,a
	ld h,$00
	ld bc,$5692
	add hl,bc
	pop de
	ld e,$95
	ld c,$04

Unknown_0x2167E:
	ld a,[hli]
	ld [de],a
	inc e
	dec c
	jr nz,Unknown_0x2167E
	pop bc
	ld e,$8E
	ld a,$10
	ld [de],a
	ld e,$8D
	xor a
	ld [de],a
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x21692:
INCBIN "baserom.gb", $21692, $216A6 - $21692

Unknown_0x216A6:
	ld hl,$FF93
	xor a
	ld [hli],a
	ld e,$46
	ld a,[de]
	ld [hli],a
	xor a
	ld [hl],a
	ld de,$A18C

Unknown_0x216B4:
	push de
	ld a,[de]
	or a
	jr nz,Unknown_0x216C4

Unknown_0x216B9:
	pop de
	inc d
	ld a,d
	cp $B3
	jr nz,Unknown_0x216B4
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x216C4:
	xor a
	ld [$FF00+$84],a
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$19
	ld a,[hl]
	bit 5,a
	jr nz,Unknown_0x21703
	ld e,$8E
	ld a,[de]
	dec a
	ld [de],a
	jr nz,Unknown_0x216FB
	ld a,$10
	ld [de],a
	ld e,$8D
	ld a,[de]
	inc a
	ld [de],a
	cp $03
	jr nz,Unknown_0x216FB
	xor a
	ld [de],a
	ld h,d
	ld l,$90
	ld e,$99
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	inc e
	ld [hli],a
	inc l
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	ld [hl],a
	ld a,$01
	ld [$FF00+$84],a

Unknown_0x216FB:
	ld e,$95
	ld h,d
	ld l,$8F
	call Unknown_0x0DA9

Unknown_0x21703:
	ld e,$90
	ld hl,$DB51
	ld bc,$FF80
	call Unknown_0x0E34
	ld a,[$FF00+$84]
	or a
	jr z,Unknown_0x2174A
	ld a,[$FF00+$81]
	inc a
	cp $01
	ld a,[$FF00+$80]
	jr z,Unknown_0x21724
	jr nc,Unknown_0x2173D
	cp $E0
	jr nc,Unknown_0x21728
	jr Unknown_0x2173D

Unknown_0x21724:
	cp $C0
	jr nc,Unknown_0x2173D

Unknown_0x21728:
	ld a,[$FF00+$83]
	inc a
	cp $01
	ld a,[$FF00+$82]
	jr z,Unknown_0x21739
	jr nc,Unknown_0x2173D
	cp $E0
	jr nc,Unknown_0x2174A
	jr Unknown_0x2173D

Unknown_0x21739:
	cp $A0
	jr c,Unknown_0x2174A

Unknown_0x2173D:
	ld e,$8C
	ld a,[de]
	dec a
	ld l,a
	ld h,$BB
	xor a
	ld [hl],a
	ld [de],a
	jp Unknown_0x216B9

Unknown_0x2174A:
	ld e,$8D
	ld a,[de]
	add a,a
	ld c,a
	ld b,$00
	ld hl,Unknown_0x21761
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,$FF83
	call Unknown_0x051C
	jp Unknown_0x216B9

Unknown_0x21761:
INCBIN "baserom.gb", $21761, $217AC - $21761

Unknown_0x217AC:
	ld e,$5B
	ld a,[de]
	ld [$FF00+$85],a
	ld hl,$FF93
	ld e,$45
	ld a,[de]
	ld [hli],a
	ld e,$46
	ld a,[de]
	ld [hli],a
	xor a
	ld [hl],a
	ld de,$A170

Unknown_0x217C1:
	push de
	ld a,[de]
	or a
	jp nz,Unknown_0x21866
	inc a
	ld [de],a
	ld a,[$FF00+$85]
	or a
	jr nz,Unknown_0x2182C
	call Unknown_0x0647
	ld [$FF00+$84],a
	bit 7,a
	jr z,Unknown_0x217FB
	and $3F
	rlca
	sub $08
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$75
	ld hl,$DB53
	call Unknown_0x218AE
	ld a,[$FF00+$84]
	bit 6,a
	ld bc,$FFF8
	jr z,Unknown_0x217F4
	ld bc,$00A8

Unknown_0x217F4:
	ld e,$72
	ld hl,$DB51
	jr Unknown_0x21827

Unknown_0x217FB:
	ld hl,$FF93
	bit 7,[hl]
	ld b,$F8
	jr z,Unknown_0x21806
	ld b,$28

Unknown_0x21806:
	and $3F
	rlca
	add a,b
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$72
	ld hl,$DB51
	call Unknown_0x218AE
	ld a,[$FF00+$84]
	bit 6,a
	ld bc,$FFF8
	jr z,Unknown_0x21822
	ld bc,$0088

Unknown_0x21822:
	ld e,$75
	ld hl,$DB53

Unknown_0x21827:
	call Unknown_0x218AE
	jr Unknown_0x21866

Unknown_0x2182C:
	call Unknown_0x0647
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld hl,$0050
	add hl,bc
	ld b,h
	ld c,l
	ld e,$72
	ld hl,$DB51
	call Unknown_0x218AE
	call Unknown_0x0647
	ld b,a
	and $1F
	bit 7,b
	jr nz,Unknown_0x21854
	cpl
	sub $07
	ld c,a
	rla
	sbc a,a
	ld b,a
	jr Unknown_0x2185E

Unknown_0x21854:
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld hl,$0088
	add hl,bc
	ld b,h
	ld c,l

Unknown_0x2185E:
	ld e,$75
	ld hl,$DB53
	call Unknown_0x218AE

Unknown_0x21866:
	ld a,[$FF00+$9A]
	ld h,a
	ld l,$19
	ld a,[hl]
	bit 5,a
	jr nz,Unknown_0x21878
	ld e,$77
	ld h,d
	ld l,$71
	call Unknown_0x0DA9

Unknown_0x21878:
	ld e,$72
	ld hl,$DB51
	ld bc,$FF80
	call Unknown_0x0E34
	ld a,[$FF00+$80]
	sub $CC
	cp $08
	jr c,Unknown_0x21893
	ld a,[$FF00+$82]
	sub $BC
	cp $08
	jr nc,Unknown_0x21899

Unknown_0x21893:
	ld e,$70
	xor a
	ld [de],a
	jr Unknown_0x218A2

Unknown_0x21899:
	ld de,$FF83
	ld hl,Unknown_0x218E2
	call Unknown_0x051C

Unknown_0x218A2:
	pop de
	inc d
	ld a,d
	cp $AA
	jp nz,Unknown_0x217C1
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x218AE:
	ld a,[hli]
	add a,c
	ld [de],a
	inc e
	ld a,[hl]
	adc a,b
	ld [de],a
	ret
	ld a,[$DB72]
	ld e,$27
	ld [de],a
	ret
	push bc
	ld a,$01
	ld [$DB72],a
	ld c,$09
	ld h,$A1

Unknown_0x218C7:
	ld l,$70
	ld [hl],$00
	ld e,$0D
	ld l,$77
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	inc e
	ld [hli],a
	ld a,[de]
	ld [hl],a
	inc h
	dec c
	jr nz,Unknown_0x218C7
	pop bc
	ret

UnknownData_0x218E0:
INCBIN "baserom.gb", $218E0, $218E2 - $218E0

Unknown_0x218E2:
INCBIN "baserom.gb", $218E2, $21A2C - $218E2
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x21A3E
	dec a
	ld [de],a
	ret

Unknown_0x21A3E:
	ld a,[$FF00+$A6]
	and $0B
	ret z
	ld e,$2D
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld e,$00
	ld hl,Unknown_0x2206D
	ld a,$1E
	call Unknown_0x05CF
	ld de,$0004
	ld hl,$42A4
	ld a,$1A
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$08
	ld bc,$5A6D
	jp Unknown_0x0846

UnknownData_0x21A6D:
INCBIN "baserom.gb", $21A6D, $21A73 - $21A6D
	ld a,$01
	ld [$DF02],a
	ret

UnknownData_0x21A79:
INCBIN "baserom.gb", $21A79, $21A7C - $21A79

Unknown_0x21A7C:
INCBIN "baserom.gb", $21A7C, $21E92 - $21A7C
	ld hl,$DEFF
	ld a,[hl]
	inc a
	cp $04
	jr c,Unknown_0x21E9D
	ld a,$01

Unknown_0x21E9D:
	ld [hl],a
	dec a
	add a,a
	add a,a
	ld hl,$5EBF
	add a,l
	ld l,a
	jr nc,Unknown_0x21EA9
	inc h

Unknown_0x21EA9:
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,$BC00
	call Unknown_0x0621
	ld hl,$4000
	ld a,$07
	call Unknown_0x05CF
	ret

UnknownData_0x21EBF:
INCBIN "baserom.gb", $21EBF, $21ED9 - $21EBF
	ld e,$27
	ld a,[$DB60]
	ld [de],a
	ret

UnknownData_0x21EE0:
INCBIN "baserom.gb", $21EE0, $21F18 - $21EE0
	ld a,[$A075]
	ld e,$27
	ld [de],a
	ret
	ld bc,$5ECB
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 3,a
	ret z
	ld a,[$A051]
	cp $0C
	ret z
	push de
	ld h,$A0
	call Unknown_0x0BBA
	pop de
	ld hl,$40DA
	ld a,$01
	call Unknown_0x05CF
	ld e,$08
	ld bc,Unknown_0x21FCD
	jp Unknown_0x0846

UnknownData_0x21F48:
INCBIN "baserom.gb", $21F48, $21F68 - $21F48

Unknown_0x21F68:
INCBIN "baserom.gb", $21F68, $21F6A - $21F68
	ld e,$07
	ld a,[de]
	add a,$30
	ld [de],a
	inc e
	ld a,[de]
	adc a,$00
	ld [de],a
	ret
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DB6A
	and [hl]
	ld e,$27
	ld [de],a
	ret

UnknownData_0x21F84:
INCBIN "baserom.gb", $21F84, $21FCD - $21F84

Unknown_0x21FCD:
INCBIN "baserom.gb", $21FCD, $21FE1 - $21FCD

Unknown_0x21FE1:
INCBIN "baserom.gb", $21FE1, $21FF3 - $21FE1
	ld hl,$CD4D
	ld [hl],$01
	inc l
	ld a,$00
	ld [hli],a
	ld a,$81
	ld [hli],a
	ld a,$11
	ld [hli],a
	ld a,$62
	ld [hli],a
	ld a,$60
	ld [hli],a
	ld [hl],$03
	ret
	call Unknown_0x2422
	ld a,[$CD4D]
	or a
	ret nz
	ld e,$08
	ld bc,$601B
	jp Unknown_0x0846

UnknownData_0x2201B:
INCBIN "baserom.gb", $2201B, $2206D - $2201B

Unknown_0x2206D:
INCBIN "baserom.gb", $2206D, $2207D - $2206D
	ld a,[$A071]
	inc a
	ld e,$15
	ld [de],a
	ret
	ld hl,$A082
	ld [hl],$03
	ret
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	jp Unknown_0x22097

Unknown_0x22097:
	ld e,$3A
	ld a,[de]
	or a
	ld e,$39
	jr nz,Unknown_0x220A2
	xor a
	ld [de],a
	ret

Unknown_0x220A2:
	ld b,a
	ld a,[de]
	or a
	jr z,Unknown_0x220AA
	dec a
	ld [de],a
	ret

Unknown_0x220AA:
	ld a,b
	ld [de],a
	ld bc,Unknown_0x220B2
	jp Unknown_0x0F50

Unknown_0x220B2:
INCBIN "baserom.gb", $220B2, $220C3 - $220B2
	ld e,$04
	ld hl,$DB51
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	jp Unknown_0x1513

UnknownData_0x220F1:
INCBIN "baserom.gb", $220F1, $22145 - $220F1

Unknown_0x22145:
INCBIN "baserom.gb", $22145, $2215B - $22145
	call Unknown_0x0DA4
	ld e,$05
	ld a,[de]
	rla
	jr c,Unknown_0x22172
	dec e
	ld a,[de]
	cp $10
	jr c,Unknown_0x22172
	ld hl,$7012
	ld a,$08
	call Unknown_0x05CF

Unknown_0x22172:
	ld e,$08
	ld a,[de]
	rla
	jr c,Unknown_0x22186
	dec e
	ld a,[de]
	cp $10
	jr c,Unknown_0x22186
	ld hl,$7067
	ld a,$08
	call Unknown_0x05CF

Unknown_0x22186:
	call Unknown_0x22097
	ld hl,$741F
	ld a,$08
	call Unknown_0x05CF
	ret
	jp Unknown_0x34FD

UnknownData_0x22195:
INCBIN "baserom.gb", $22195, $221FC - $22195
	ld hl,$77ED
	ld a,$01
	call Unknown_0x05CF
	ret

UnknownData_0x22205:
INCBIN "baserom.gb", $22205, $2226B - $22205
	push bc
	ld hl,Unknown_0x20128
	ld a,$07
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret
	ld hl,$70BC
	ld a,$08
	call Unknown_0x05CF
	ret

UnknownData_0x22282:
INCBIN "baserom.gb", $22282, $223E5 - $22282
	ld a,[$A071]
	ld hl,$63FA
	add a,l
	ld l,a
	jr nc,Unknown_0x223F0
	inc h

Unknown_0x223F0:
	ld a,[hl]
	ld e,a
	ld a,[$A051]
	sub e
	ld e,$27
	ld [de],a
	ret

UnknownData_0x223FA:
INCBIN "baserom.gb", $223FA, $223FE - $223FA
	ld a,[$A050]
	sub $0D
	ld e,$27
	ld [de],a
	ret
	ld a,[$A051]
	sub $04
	ld e,$27
	ld [de],a
	ret

UnknownData_0x22410:
INCBIN "baserom.gb", $22410, $2256F - $22410
	ld a,$24
	ld [$DF11],a
	ld hl,$748B
	ld a,$07
	call Unknown_0x05CF
	ret
	ld a,[$A071]
	or a
	ret z
	add a,$24
	ld e,a
	ld a,[$DB60]
	cp $02
	jr nz,Unknown_0x22590
	ld a,e
	add a,$03
	ld e,a

Unknown_0x22590:
	ld a,e
	ld [$DF11],a
	ld hl,$748B
	ld a,$07
	call Unknown_0x05CF
	ret
	ld hl,$40DA
	ld a,$01
	call Unknown_0x05CF
	ret
	ld a,[$DB60]
	sub $06
	ld e,$27
	ld [de],a
	ret
	ld a,[$DB74]
	ld e,$27
	ld [de],a
	ret

UnknownData_0x225B6:
INCBIN "baserom.gb", $225B6, $22C6B - $225B6
	ld e,$27
	ld a,[$DB60]
	ld [de],a
	ret
	call Unknown_0x0C80
	call Unknown_0x0C91
	jp Unknown_0x0DA4
	call Unknown_0x0C80
	call Unknown_0x22C84
	jp Unknown_0x0DA4

Unknown_0x22C84:
	ld e,$0F
	ld l,$12
	ld h,d
	ld a,[de]
	add a,[hl]
	ld [de],a
	inc e
	inc l
	inc l
	ld a,[de]
	adc a,[hl]
	ld [de],a
	ret

UnknownData_0x22C93:
INCBIN "baserom.gb", $22C93, $22D03 - $22C93
	xor a
	ld [$DB6E],a
	ld a,[$DB74]
	or a
	jr nz,Unknown_0x22D26
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DB6A
	or [hl]
	ld [hl],a

Unknown_0x22D18:
	push bc
	ld hl,$6D6C
	ld a,$0F
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x22D26:
	ld [$DB6B],a
	ld a,[$A05B]
	inc a
	ld hl,$6D3B
	add a,l
	ld l,a
	jr nc,Unknown_0x22D35
	inc h

Unknown_0x22D35:
	ld a,[hl]
	ld [$A051],a
	jr Unknown_0x22D18

UnknownData_0x22D3B:
INCBIN "baserom.gb", $22D3B, $22D62 - $22D3B
	ld a,[$A051]
	sub $0C
	ld e,$27
	ld [de],a
	ret
	ld a,[$DF0A]
	sub $04
	ld e,$27
	ld [de],a
	ret

UnknownData_0x22D74:
INCBIN "baserom.gb", $22D74, $22D7A - $22D74

Unknown_0x22D7A:
	ld e,$39
	ld a,[de]
	srl a
	srl a
	srl a
	ld hl,$6DA9
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x22D8C
	inc h

Unknown_0x22D8C:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld b,d
	ld c,$8D
	ld e,$0D
	ld a,[de]
	ld [bc],a
	add a,l
	ld [de],a
	inc c
	inc e
	ld a,[de]
	ld [bc],a
	adc a,h
	ld [de],a
	ld e,$39
	ld a,[de]
	inc a
	cp $60
	jr c,Unknown_0x22DA7
	xor a

Unknown_0x22DA7:
	ld [de],a
	ret

UnknownData_0x22DA9:
INCBIN "baserom.gb", $22DA9, $22DC1 - $22DA9

Unknown_0x22DC1:
	ld e,$3F
	ld a,[de]
	srl a
	srl a
	srl a
	ld hl,$6DF0
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x22DD3
	inc h

Unknown_0x22DD3:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld b,d
	ld c,$8F
	ld e,$0F
	ld a,[de]
	ld [bc],a
	add a,l
	ld [de],a
	inc c
	inc e
	ld a,[de]
	ld [bc],a
	adc a,h
	ld [de],a
	ld e,$3F
	ld a,[de]
	inc a
	cp $60
	jr c,Unknown_0x22DEE
	xor a

Unknown_0x22DEE:
	ld [de],a
	ret

UnknownData_0x22DF0:
INCBIN "baserom.gb", $22DF0, $22E08 - $22DF0
	ld a,$02
	jr Unknown_0x22E11
	ld a,$01
	jr Unknown_0x22E11
	xor a

Unknown_0x22E11:
	ld [$DF14],a
	ld e,$7D
	xor a
	ld [de],a
	push de
	call Unknown_0x1AEA
	call Unknown_0x1646
	pop de
	ld b,a
	cp $F0
	jr z,Unknown_0x22E2F
	and $78
	cp $20
	jr c,Unknown_0x22E32
	cp $40
	jr nc,Unknown_0x22E32

Unknown_0x22E2F:
	call Unknown_0x23171

Unknown_0x22E32:
	ld a,[$DF14]
	cp $01
	jr c,Unknown_0x22E43
	jr z,Unknown_0x22E40
	call Unknown_0x22DC1
	jr Unknown_0x22E43

Unknown_0x22E40:
	call Unknown_0x22D7A

Unknown_0x22E43:
	call Unknown_0x0DA4
	ld a,[$DB75]
	or a
	jp nz,Unknown_0x22F16
	ld a,[$DB74]
	or a
	jp nz,Unknown_0x22F9A
	ld a,[$DB77]
	or a
	jp nz,Unknown_0x22E9D
	call Unknown_0x22E64
	call Unknown_0x23012
	jp Unknown_0x23067

Unknown_0x22E64:
	ld hl,$DB3F
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld h,d
	ld l,$04
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x22E78
	ld a,b
	ld [hld],a
	ld [hl],c
	jr Unknown_0x22E78

Unknown_0x22E78:
	ld hl,$DB43
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld h,d
	ld l,$04
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x22E8A
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x22E8A:
	ld hl,$DB41
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld h,d
	ld l,$07
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x22E9C
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x22E9C:
	ret

Unknown_0x22E9D:
	call Unknown_0x22EE2
	call Unknown_0x22EFC
	ld a,[$DB77]
	cp $02
	jr z,Unknown_0x22EC4
	jr nc,Unknown_0x22EDC
	ld hl,$DB43
	ld bc,$DB51
	ld a,[bc]
	add a,$98
	ld [hli],a
	inc bc
	ld a,[bc]
	adc a,$00
	ld [hl],a
	call Unknown_0x22E64
	call Unknown_0x23067
	jp Unknown_0x22F4D

Unknown_0x22EC4:
	ld hl,$DB3F
	ld bc,$DB51
	ld a,[bc]
	add a,$08
	ld [hli],a
	inc bc
	ld a,[bc]
	adc a,$00
	ld [hl],a
	call Unknown_0x22E64
	call Unknown_0x23067
	jp Unknown_0x22F80

Unknown_0x22EDC:
	call Unknown_0x22E64
	jp Unknown_0x23012

Unknown_0x22EE2:
	ld hl,$DB4F
	ld e,$77
	ld a,[de]
	add a,[hl]
	ld [hl],a
	ld hl,$DB51
	inc e
	ld a,[de]
	bit 7,a
	ld b,$00
	jr z,Unknown_0x22EF6
	dec b

Unknown_0x22EF6:
	adc a,[hl]
	ld [hli],a
	ld a,b
	adc a,[hl]
	ld [hl],a
	ret

Unknown_0x22EFC:
	ld hl,$DB50
	ld e,$79
	ld a,[de]
	add a,[hl]
	ld [hl],a
	ld hl,$DB53
	inc e
	ld a,[de]
	bit 7,a
	ld b,$00
	jr z,Unknown_0x22F10
	dec b

Unknown_0x22F10:
	adc a,[hl]
	ld [hli],a
	ld a,b
	adc a,[hl]
	ld [hl],a
	ret

Unknown_0x22F16:
	call Unknown_0x22EE2
	ld a,[$DB3D]
	dec a
	ld c,a
	cp [hl]
	jr nz,Unknown_0x22F38
	dec hl
	ld a,[hli]
	cp $10
	jr c,Unknown_0x22F38
	ld [hl],$00
	ld hl,$A005

Unknown_0x22F2C:
	ld a,[hl]
	cp c
	jr nz,Unknown_0x22F32
	ld [hl],$00

Unknown_0x22F32:
	inc h
	ld a,h
	cp $B3
	jr nz,Unknown_0x22F2C

Unknown_0x22F38:
	ld hl,$DB43
	ld bc,$DB51
	ld a,[bc]
	add a,$98
	ld [hli],a
	inc bc
	ld a,[bc]
	adc a,$00
	ld [hl],a
	call Unknown_0x22E78
	jp Unknown_0x22F4D

Unknown_0x22F4D:
	xor a
	ld [$A07B],a
	ld hl,$DB51
	ld a,[hli]
	add a,$08
	ld c,a
	ld a,[hl]
	adc a,$00
	ld b,a
	ld h,d
	ld l,$04
	ld a,[hli]
	sub c
	ld c,a
	ld a,[hld]
	sbc a,b
	ret nc

Unknown_0x22F65:
	ld a,c
	ld [$A07B],a
	cpl
	inc a
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	ld l,$0E
	ld a,[hl]
	add a,c
	ld [hl],a
	ld l,$8E
	ld a,[hl]
	add a,c
	ld [hl],a
	ret

Unknown_0x22F80:
	xor a
	ld [$A07B],a
	ld hl,$DB51
	ld a,[hli]
	add a,$98
	ld c,a
	ld a,[hl]
	adc a,$00
	ld b,a
	ld h,d
	ld l,$04
	ld a,[hli]
	sub c
	ld c,a
	ld a,[hld]
	sbc a,b
	ret c
	jr Unknown_0x22F65

Unknown_0x22F9A:
	ld e,$39
	ld a,[$DB53]
	ld [de],a
	call Unknown_0x22FB9
	call Unknown_0x22E64
	ld hl,$DB4D
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld h,d
	ld l,$07
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x22FB8
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x22FB8:
	ret

Unknown_0x22FB9:
	call Unknown_0x22EFC
	ld hl,$DB47
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x22FCE
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x22FCE:
	ld hl,$DB4B
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x22FE0
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x22FE0:
	ld h,d
	ld l,$39
	ld a,[$DB53]
	sub [hl]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld l,$07
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	ld hl,$DB41
	ld bc,$DB53
	ld a,[bc]
	add a,$08
	ld [hli],a
	inc bc
	ld a,[bc]
	adc a,$00
	ld [hl],a
	ld hl,$DB4D
	ld bc,$DB53
	ld a,[bc]
	add a,$78
	ld [hli],a
	inc bc
	ld a,[bc]
	adc a,$00
	ld [hl],a
	ret

Unknown_0x23012:
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $48
	jr nc,Unknown_0x23047
	ld a,[de]
	inc e
	sub $48
	ld [hli],a
	ld a,[de]
	sbc a,$00
	ld [hl],a
	jr nc,Unknown_0x23033
	ld hl,$DB45
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB52
	jr Unknown_0x23042

Unknown_0x23033:
	ld hl,$DB45
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB51
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x23066

Unknown_0x23042:
	ld a,b
	ld [hld],a
	ld [hl],c
	jr Unknown_0x23066

Unknown_0x23047:
	cp $50
	jr c,Unknown_0x23066
	ld a,[de]
	inc e
	sub $50
	ld [hli],a
	ld a,[de]
	sbc a,$00
	ld [hl],a
	ld hl,$DB49
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB51
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x23066
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x23066:
	ret

Unknown_0x23067:
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	cp $38
	jr nc,Unknown_0x2309C
	ld a,[de]
	inc e
	sub $38
	ld [hli],a
	ld a,[de]
	sbc a,$00
	ld [hl],a
	jr nc,Unknown_0x23088
	ld hl,$DB47
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB54
	jr Unknown_0x23097

Unknown_0x23088:
	ld hl,$DB47
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x230BB

Unknown_0x23097:
	ld a,b
	ld [hld],a
	ld [hl],c
	jr Unknown_0x230BB

Unknown_0x2309C:
	cp $48
	jr c,Unknown_0x230BB
	ld a,[de]
	inc e
	sub $48
	ld [hli],a
	ld a,[de]
	sbc a,$00
	ld [hl],a
	ld hl,$DB4B
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x230BB
	ld a,b
	ld [hld],a
	ld [hl],c

Unknown_0x230BB:
	ret
	xor a
	ld [$FF00+$85],a
	ld [$FF00+$86],a
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $4F
	jr nc,Unknown_0x230EF
	ld a,[hl]
	sub $01
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hl],a
	ld a,$01
	ld [$FF00+$85],a
	ld hl,$DB45
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB51
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x23114
	ld a,b
	ld [hld],a
	ld [hl],c
	xor a
	ld [$FF00+$85],a
	jr Unknown_0x23114

Unknown_0x230EF:
	cp $51
	jr c,Unknown_0x23114
	ld a,[hl]
	add a,$01
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hl],a
	ld a,$01
	ld [$FF00+$85],a
	ld hl,$DB49
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB51
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x23114
	ld a,b
	ld [hld],a
	ld [hl],c
	xor a
	ld [$FF00+$85],a

Unknown_0x23114:
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	cp $3F
	jr nc,Unknown_0x23142
	ld a,[hl]
	sub $01
	ld [hli],a
	ld a,[hl]
	sbc a,$00
	ld [hl],a
	ld a,$01
	ld [$FF00+$86],a
	ld hl,$DB47
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr nc,Unknown_0x23167
	ld a,b
	ld [hld],a
	ld [hl],c
	xor a
	ld [$FF00+$86],a
	jr Unknown_0x23167

Unknown_0x23142:
	cp $41
	jr c,Unknown_0x23167
	ld a,[hl]
	add a,$01
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hl],a
	ld a,$01
	ld [$FF00+$86],a
	ld hl,$DB4B
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld hl,$DB53
	ld a,[hli]
	sub c
	ld a,[hl]
	sbc a,b
	jr c,Unknown_0x23167
	ld a,b
	ld [hld],a
	ld [hl],c
	xor a
	ld [$FF00+$86],a

Unknown_0x23167:
	ld a,[$FF00+$85]
	ld b,a
	ld a,[$FF00+$86]
	or b
	ld e,$3A
	ld [de],a
	ret

Unknown_0x23171:
	ld a,b
	cp $F0
	ld a,[$A071]
	jr nz,Unknown_0x231A7
	cp $03
	jr z,Unknown_0x2318A

Unknown_0x2317D:
	ld e,$7F
	ld bc,$FD40
	call Unknown_0x0D54
	call Unknown_0x232DC
	jr Unknown_0x231A1

Unknown_0x2318A:
	ld a,[$A050]
	cp $11
	jr z,Unknown_0x2317D
	ld e,$18
	ld bc,$FD40
	call Unknown_0x0D70
	ld e,$1C
	ld bc,$0040
	call Unknown_0x23331

Unknown_0x231A1:
	ld e,$7D
	ld a,$01
	ld [de],a
	ret

Unknown_0x231A7:
	bit 7,b
	jp nz,Unknown_0x23245
	cp $03
	jr z,Unknown_0x231ED
	bit 3,b
	jr nz,Unknown_0x231D1
	bit 4,b
	jr nz,Unknown_0x231C5

Unknown_0x231B8:
	ld e,$7F
	ld bc,$FE80
	call Unknown_0x0D54
	call Unknown_0x232DC
	jr Unknown_0x231A1

Unknown_0x231C5:
	ld e,$28
	ld bc,$0300
	call Unknown_0x0D23
	call Unknown_0x232EE
	ret

Unknown_0x231D1:
	bit 4,b
	jr nz,Unknown_0x231E1
	ld e,$30
	ld bc,$0180
	call Unknown_0x0CA2
	call Unknown_0x23312
	ret

Unknown_0x231E1:
	ld e,$30
	ld bc,$FE80
	call Unknown_0x0CD3
	call Unknown_0x23300
	ret

Unknown_0x231ED:
	bit 3,b
	jr nz,Unknown_0x2321F
	bit 4,b
	jr nz,Unknown_0x2320E
	ld a,[$A050]
	cp $11
	jr z,Unknown_0x231B8
	ld e,$18
	ld bc,$FE80
	call Unknown_0x0D70
	ld e,$1C
	ld bc,$0040
	call Unknown_0x23331
	jr Unknown_0x231A1

Unknown_0x2320E:
	ld e,$10
	ld bc,$0300
	call Unknown_0x0D35
	ld e,$1C
	ld bc,$FFC0
	call Unknown_0x23324
	ret

Unknown_0x2321F:
	bit 4,b
	jr nz,Unknown_0x23234
	ld e,$10
	ld bc,$0180
	call Unknown_0x0CB4
	ld e,$1C
	ld bc,$FFC0
	call Unknown_0x2333E
	ret

Unknown_0x23234:
	ld e,$10
	ld bc,$FE80
	call Unknown_0x0CEF
	ld e,$1C
	ld bc,$0040
	call Unknown_0x2334B
	ret

Unknown_0x23245:
	cp $02
	jr z,Unknown_0x23285
	bit 3,b
	jr nz,Unknown_0x23269
	bit 4,b
	jr nz,Unknown_0x2325D

Unknown_0x23251:
	ld e,$18
	ld bc,$FE80
	call Unknown_0x0D54
	call Unknown_0x232DC
	ret

Unknown_0x2325D:
	ld e,$18
	ld bc,$0180
	call Unknown_0x0D23
	call Unknown_0x232EE
	ret

Unknown_0x23269:
	bit 4,b
	jr nz,Unknown_0x23279
	ld e,$18
	ld bc,$0180
	call Unknown_0x0CA2
	call Unknown_0x23312
	ret

Unknown_0x23279:
	ld e,$18
	ld bc,$FE80
	call Unknown_0x0CD3
	call Unknown_0x23300
	ret

Unknown_0x23285:
	bit 3,b
	jr nz,Unknown_0x232B6
	bit 4,b
	jr nz,Unknown_0x232A5
	ld a,[$A050]
	cp $12
	jr z,Unknown_0x23251
	ld e,$0C
	ld bc,$FE80
	call Unknown_0x0D70
	ld e,$14
	ld bc,$0040
	call Unknown_0x23331
	ret

Unknown_0x232A5:
	ld e,$0C
	ld bc,$0180
	call Unknown_0x0D35
	ld e,$14
	ld bc,$FFC0
	call Unknown_0x23324
	ret

Unknown_0x232B6:
	bit 4,b
	jr nz,Unknown_0x232CB
	ld e,$0C
	ld bc,$0180
	call Unknown_0x0CB4
	ld e,$14
	ld bc,$FFC0
	call Unknown_0x2333E
	ret

Unknown_0x232CB:
	ld e,$0C
	ld bc,$FE80
	call Unknown_0x0CEF
	ld e,$14
	ld bc,$0040
	call Unknown_0x2334B
	ret

Unknown_0x232DC:
	ld bc,$FFD0
	ld l,$10
	ld a,[hld]
	rla
	jr nc,Unknown_0x232EA
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret c

Unknown_0x232EA:
	ld a,c
	ld [hli],a
	ld [hl],b
	ret

Unknown_0x232EE:
	ld bc,$0030
	ld l,$10
	ld a,[hld]
	rla
	jr c,Unknown_0x232FC
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret nc

Unknown_0x232FC:
	ld a,c
	ld [hli],a
	ld [hl],b
	ret

Unknown_0x23300:
	ld bc,$FFD0
	ld l,$0E
	ld a,[hld]
	rla
	jr nc,Unknown_0x2330E
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret c

Unknown_0x2330E:
	ld a,c
	ld [hli],a
	ld [hl],b
	ret

Unknown_0x23312:
	ld bc,$0030
	ld l,$0E
	ld a,[hld]
	rla
	jr c,Unknown_0x23320
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret nc

Unknown_0x23320:
	ld a,c
	ld [hli],a
	ld [hl],b
	ret

Unknown_0x23324:
	ld l,$10
	ld a,[hld]
	rla
	ret nc
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret nc
	jp Unknown_0x0D85

Unknown_0x23331:
	ld l,$10
	ld a,[hld]
	rla
	ret c
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret c
	jp Unknown_0x0D04

Unknown_0x2333E:
	ld l,$0E
	ld a,[hld]
	rla
	ret nc
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret nc
	jp Unknown_0x0D04

Unknown_0x2334B:
	ld l,$0E
	ld a,[hld]
	rla
	ret c
	ld a,[hli]
	sub c
	ld a,[hld]
	sbc a,b
	ret c
	jp Unknown_0x0D04

Unknown_0x23358:
	ld a,[$DB75]
	or a
	jr nz,Unknown_0x23368
	ld a,[$DB77]
	or a
	jr z,Unknown_0x23379
	cp $03
	jr nc,Unknown_0x23379

Unknown_0x23368:
	ld a,[$A07B]
	or a
	jr z,Unknown_0x23379
	ld b,a
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x23379
	ld a,b
	add a,[hl]
	ld [hl],a

Unknown_0x23379:
	ld e,$54
	ld a,[de]
	or a
	jr z,Unknown_0x23393
	bit 7,a
	jr nz,Unknown_0x23385
	dec a
	ld [de],a

Unknown_0x23385:
	and $04
	ld e,$47
	ld a,[de]
	jr nz,Unknown_0x23390
	res 4,a
	jr Unknown_0x23392

Unknown_0x23390:
	set 4,a

Unknown_0x23392:
	ld [de],a

Unknown_0x23393:
	call Unknown_0x23497
	call Unknown_0x2341F
	ld a,[$A064]
	or a
	jr nz,Unknown_0x233EA
	ld e,$0B
	ld a,[de]
	sub $90
	cp $30
	jr nc,Unknown_0x233B0

Unknown_0x233A8:
	ld e,$01
	ld bc,$5383
	jp Unknown_0x0846

Unknown_0x233B0:
	cp $68
	jr nc,Unknown_0x233BF
	ld e,$0F
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a

Unknown_0x233BF:
	ld e,$09
	ld a,[de]
	cp $9A
	jr nc,Unknown_0x233A8
	cp $06
	jr c,Unknown_0x233A8
	ld a,[$A071]
	or a
	ld e,$4C
	jr z,Unknown_0x233D4
	ld e,$72

Unknown_0x233D4:
	ld a,[de]
	or a
	jr nz,Unknown_0x233EA
	ld a,[$A051]
	cp $0C
	jr z,Unknown_0x233EA
	call Unknown_0x1067
	ld e,$01
	ld bc,$5396
	jp Unknown_0x0846

Unknown_0x233EA:
	call Unknown_0x2344F
	ld a,[$FF00+$A6]
	and $08
	jr z,Unknown_0x23417
	ld a,[$A082]
	or a
	jr nz,Unknown_0x23417
	ld a,[$CD4D]
	or a
	jr nz,Unknown_0x23417
	ld a,[$DA36]
	or a
	jr nz,Unknown_0x23417
	ld a,[$DB61]
	cp $08
	jr z,Unknown_0x23417
	ld a,[$A07E]
	or a
	jr nz,Unknown_0x23417
	ld a,$04
	ld [$A082],a

Unknown_0x23417:
	ld a,[$DF12]
	or a
	call nz,Unknown_0x234A7
	ret

Unknown_0x2341F:
	ld hl,$CD54
	ld a,[$A050]
	cp $06
	jr z,Unknown_0x23434
	ld e,$04
	cp $10
	jr nz,Unknown_0x2343B
	ld bc,$FFEF
	jr Unknown_0x2343E

Unknown_0x23434:
	ld bc,$0006
	ld e,$01
	jr Unknown_0x2343E

Unknown_0x2343B:
	ld bc,Unknown_0x0000

Unknown_0x2343E:
	ld a,e
	ld [$FF00+$A1],a
	ld e,$07
	ld a,[de]
	add a,c
	ld [hli],a
	inc e
	ld a,[de]
	adc a,b
	ld [hl],a
	ld a,$04
	ld [$FF00+$A0],a
	ret

Unknown_0x2344F:
	push de
	ld h,d
	ld bc,$0000
	ld a,[$A050]
	cp $10
	ld de,$0000
	jr nz,Unknown_0x23461
	ld de,$FFF4

Unknown_0x23461:
	call Unknown_0x1AD9
	call Unknown_0x1646
	pop de
	and $7F
	cp $08
	ret nz
	ld a,[$A05D]
	cp $01
	ret z
	cp $04
	ret z
	ld a,[$A054]
	or a
	ret nz
	call Unknown_0x2809
	ret c
	ld b,$02
	call Unknown_0x3A8B
	ld e,$44
	ld a,$02
	ld [de],a
	ld e,$45
	ld a,[de]
	ld [$A053],a
	ld e,$01
	ld bc,$4EC9
	jp Unknown_0x0846

Unknown_0x23497:
	ld a,[$A070]
	or a
	ret z
	ld a,[$DA0E]
	and $3F
	ret nz
	ld e,$06
	jp Unknown_0x0F7A

Unknown_0x234A7:
	ld e,$08
	ld hl,$CD56

Unknown_0x234AC:
	ld a,[hli]
	or a
	jr z,Unknown_0x234B6
	dec l
	dec a
	ld [hli],a
	call z,Unknown_0x234BC

Unknown_0x234B6:
	inc l
	inc l
	dec e
	jr nz,Unknown_0x234AC
	ret

Unknown_0x234BC:
	push hl
	push de
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[hl]
	inc a
	ld [hl],a
	ld [$FF00+$80],a
	ld e,l
	swap l
	ld c,l
	ld a,[$DB3D]
	ld b,a
	ld a,h
	ld d,$FF
	sub $B3

Unknown_0x234D3:
	inc d
	sub b
	jr nc,Unknown_0x234D3
	add a,b
	ld b,a
	call Unknown_0x3C02
	ld a,[$FF00+$80]
	ld [$FF00+$84],a
	call Unknown_0x15B0
	ld hl,$DF12
	dec [hl]
	ld e,$45
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	pop de
	pop hl
	ret

UnknownData_0x234F4:
INCBIN "baserom.gb", $234F4, $23596 - $234F4
	ld a,[$A051]
	sub $04
	ld e,$27
	ld [de],a
	ret
	call Unknown_0x235AE
	jr Unknown_0x235A7
	call Unknown_0x235B5

Unknown_0x235A7:
	ld a,$00
	rla
	ld e,$27
	ld [de],a
	ret

Unknown_0x235AE:
	ld e,$04
	ld hl,$A088
	jr Unknown_0x235BA

Unknown_0x235B5:
	ld e,$07
	ld hl,$A08B

Unknown_0x235BA:
	ld a,[de]
	sub [hl]
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ret

Unknown_0x235C1:
	ld e,$04
	ld hl,$A088
	jr Unknown_0x235CD

Unknown_0x235C8:
	ld e,$07
	ld hl,$A08B

Unknown_0x235CD:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld e,$11
	ld a,[de]
	ld e,a
	call Unknown_0x0D04
	ld h,d
	ld l,$39
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld l,$12
	ld e,[hl]
	call Unknown_0x0D35
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x235B5
	ret c
	call Unknown_0x235C8
	ld e,$3B
	ld a,$01
	ld [de],a
	ret

UnknownData_0x235FB:
INCBIN "baserom.gb", $235FB, $236AC - $235FB
	ld a,[$A071]
	cp $02
	jr nz,Unknown_0x236BA
	ld e,$16
	call Unknown_0x0D04
	jr Unknown_0x236D1

Unknown_0x236BA:
	ld h,d
	ld l,$39
	ld a,[hli]
	ld c,a
	ld b,[hl]
	ld l,$11
	ld e,[hl]
	ld l,$45
	bit 7,[hl]
	jr nz,Unknown_0x236CE
	call Unknown_0x0CB4
	jr Unknown_0x236D1

Unknown_0x236CE:
	call Unknown_0x0CE5

Unknown_0x236D1:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x235AE
	ld e,$45
	ld a,[de]
	jr nc,Unknown_0x236E5
	rla
	ret nc
	jr Unknown_0x236E7

Unknown_0x236E5:
	rla
	ret c

Unknown_0x236E7:
	call Unknown_0x235C1
	ld e,$3B
	ld a,$01
	ld [de],a
	ret

UnknownData_0x236F0:
INCBIN "baserom.gb", $236F0, $2378F - $236F0
	ld bc,$010C
	ld h,d
	ld l,$11
	ld e,[hl]
	ld l,$45
	bit 7,[hl]
	jr nz,Unknown_0x237A1
	call Unknown_0x0CB4
	jr Unknown_0x237A4

Unknown_0x237A1:
	call Unknown_0x0CE5

Unknown_0x237A4:
	ld bc,$00E0
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$3C
	bit 7,[hl]
	jr nz,Unknown_0x237B6
	call Unknown_0x0D35
	jr Unknown_0x237B9

Unknown_0x237B6:
	call Unknown_0x0D66

Unknown_0x237B9:
	ld hl,$6E10
	ld a,$08
	call Unknown_0x05CF
	ld e,$11
	ld a,[de]
	or a
	jr z,Unknown_0x237E8
	call Unknown_0x235AE
	ld e,$45
	ld a,[de]
	jr nc,Unknown_0x237D4
	rla
	jr nc,Unknown_0x237E8
	jr Unknown_0x237D7

Unknown_0x237D4:
	rla
	jr c,Unknown_0x237E8

Unknown_0x237D7:
	call Unknown_0x235C1
	ld e,$3B
	ld a,[de]
	inc a
	ld [de],a
	xor a
	ld e,$11
	ld [de],a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a

Unknown_0x237E8:
	ld e,$12
	ld a,[de]
	or a
	ret z
	call Unknown_0x235B5
	ld e,$3C
	ld a,[de]
	jr nc,Unknown_0x237F9
	rla
	ret nc
	jr Unknown_0x237FB

Unknown_0x237F9:
	rla
	ret c

Unknown_0x237FB:
	call Unknown_0x235C8
	ld e,$3B
	ld a,[de]
	inc a
	ld [de],a
	xor a
	ld e,$12
	ld [de],a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret

UnknownData_0x2380D:
INCBIN "baserom.gb", $2380D, $24000 - $2380D

SECTION "Bank09", ROMX, BANK[$09]

UnknownData_0x24000:
INCBIN "baserom.gb", $24000, $28000 - $24000

SECTION "Bank0A", ROMX, BANK[$0A]

UnknownData_0x28000:
INCBIN "baserom.gb", $28000, $2B81C - $28000

Unknown_0x2B81C:
INCBIN "baserom.gb", $2B81C, $2C000 - $2B81C

SECTION "Bank0B", ROMX, BANK[$0B]

UnknownData_0x2C000:
INCBIN "baserom.gb", $2C000, $2E8A0 - $2C000

Unknown_0x2E8A0:
INCBIN "baserom.gb", $2E8A0, $2ED87 - $2E8A0

Unknown_0x2ED87:
INCBIN "baserom.gb", $2ED87, $2EF8A - $2ED87

Unknown_0x2EF8A:
INCBIN "baserom.gb", $2EF8A, $2F122 - $2EF8A

Unknown_0x2F122:
INCBIN "baserom.gb", $2F122, $2F20F - $2F122

Unknown_0x2F20F:
INCBIN "baserom.gb", $2F20F, $2F85B - $2F20F

Unknown_0x2F85B:
	xor a
	ld [$FF00+$81],a
	ld [$FF00+$83],a
	ld hl,$FF93
	ld [hli],a
	ld [hli],a
	ld [hl],a
	ld hl,$A153

Unknown_0x2F869:
	push hl
	ld a,[hl]
	or a
	jr nz,Unknown_0x2F89B
	ld l,$56
	ld [hli],a
	ld [hl],a
	call Unknown_0x0647
	and $0F
	ld bc,$7914
	add a,c
	ld c,a
	jr nc,Unknown_0x2F87F
	inc b

Unknown_0x2F87F:
	ld a,[$A080]
	ld e,a
	ld a,[bc]
	add a,e
	ld l,$55
	ld [hl],a
	ld a,c
	add a,$10
	ld c,a
	jr nc,Unknown_0x2F88F
	inc b

Unknown_0x2F88F:
	ld a,[$A045]
	rla
	ld a,[bc]
	jr nc,Unknown_0x2F898
	cpl
	inc a

Unknown_0x2F898:
	ld l,$53
	ld [hl],a

Unknown_0x2F89B:
	ld a,[$A081]
	ld b,a
	add a,a
	inc a
	ld c,a
	ld l,$53
	ld a,[hl]
	add a,b
	cp c
	jr nc,Unknown_0x2F8AD
	ld [hl],$00
	jr Unknown_0x2F908

Unknown_0x2F8AD:
	ld a,[$A063]
	ld l,$56
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	ld l,$55
	ld a,[$A080]
	cpl
	inc a
	add a,[hl]
	cpl
	inc a
	ld b,a
	ld c,$00
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld l,$58
	ld [hl],c
	inc l
	ld [hl],b
	ld l,$56
	ld d,h
	ld e,$52
	ld a,[de]
	add a,[hl]
	ld [de],a
	inc l
	inc e
	ld a,[de]
	adc a,[hl]
	ld [de],a
	ld b,a
	ld a,[$A009]
	add a,b
	ld [$FF00+$80],a
	inc l
	inc e
	ld a,[de]
	add a,[hl]
	ld [de],a
	inc l
	inc e
	ld a,[de]
	adc a,[hl]
	ld [de],a
	ld b,a
	ld a,[$A00B]
	add a,b
	ld [$FF00+$82],a
	ld de,$FF83
	ld hl,Unknown_0x2EF8A
	call Unknown_0x051C

Unknown_0x2F908:
	pop hl
	inc h
	ld a,h
	cp $A4
	jp nz,Unknown_0x2F869
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x2F914:
INCBIN "baserom.gb", $2F914, $30000 - $2F914

SECTION "Bank0C", ROMX, BANK[$0C]

UnknownData_0x30000:
INCBIN "baserom.gb", $30000, $307D1 - $30000

Unknown_0x307D1:
INCBIN "baserom.gb", $307D1, $34000 - $307D1

SECTION "Bank0D", ROMX, BANK[$0D]

UnknownData_0x34000:
INCBIN "baserom.gb", $34000, $38000 - $34000

SECTION "Bank0E", ROMX, BANK[$0E]

UnknownData_0x38000:
INCBIN "baserom.gb", $38000, $3819A - $38000
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x381A9
	inc h

Unknown_0x381A9:
	ld a,[bc]
	ld e,a
	inc bc
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld a,[bc]
	ld e,a
	inc bc
	push bc
	ld a,[de]
	ld b,e
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	ld e,b
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	pop bc
	ret

UnknownData_0x381C8:
INCBIN "baserom.gb", $381C8, $381D1 - $381C8

Unknown_0x381D1:
	ld a,[$DB51]
	ld [$DD08],a
	ret
	call Unknown_0x381ED
	call Unknown_0x388F9
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$0E
	ld bc,$488B
	jp Unknown_0x0846

Unknown_0x381ED:
	ld hl,$DD08
	ld a,[$DB51]
	sub [hl]
	ld [$DD09],a
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$04
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	jp Unknown_0x381D1

Unknown_0x38207:
	ld a,[$DD09]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$04
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ret

UnknownData_0x38218:
INCBIN "baserom.gb", $38218, $38264 - $38218
	call Unknown_0x381ED
	call Unknown_0x388F9
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x382B0
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	sub [hl]
	ld c,a
	ld e,$27
	ld a,[de]
	cp $01
	jr c,Unknown_0x382A2
	jr z,Unknown_0x3829C
	cp $02
	jr z,Unknown_0x38296
	ld a,c
	cp $4C
	jr c,Unknown_0x382A6
	ret

Unknown_0x38296:
	ld a,c
	cp $70
	jr nc,Unknown_0x382A6
	ret

Unknown_0x3829C:
	ld a,c
	cp $4C
	jr nc,Unknown_0x382A6
	ret

Unknown_0x382A2:
	ld a,c
	cp $28
	ret nc

Unknown_0x382A6:
	xor a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ld e,$12
	ld [de],a
	ret

Unknown_0x382B0:
	ld e,$0E
	ld bc,$488B
	jp Unknown_0x0846
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x382CA
	inc h

Unknown_0x382CA:
	call Unknown_0x20F9
	call Unknown_0x2123
	jp Unknown_0x20BE
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0x382E1
	inc h

Unknown_0x382E1:
	ld e,$12
	ld a,[hli]
	ld [de],a
	ret

UnknownData_0x382E6:
INCBIN "baserom.gb", $382E6, $383F3 - $382E6
	call Unknown_0x381ED
	call Unknown_0x388F9
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x3841E
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	cp $7F
	ret c
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ld e,$11
	ld [de],a
	ret

Unknown_0x3841E:
	ld e,$0E
	ld bc,$488B
	jp Unknown_0x0846
	ld a,[bc]
	inc bc
	ld l,a
	ld e,$27
	ld a,[de]
	sub l
	ld [de],a
	ret

UnknownData_0x3842F:
INCBIN "baserom.gb", $3842F, $38844 - $3842F
	call Unknown_0x381ED
	call Unknown_0x388F9
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$0E
	ld bc,$488B
	jp Unknown_0x0846
	call Unknown_0x0647
	and $01
	ld e,$41
	ld [de],a
	ld l,a
	ld e,$27
	ld a,[de]
	rlca
	add a,l
	add a,$01
	ld [de],a
	ret
	push bc
	ld e,$27
	ld a,[de]
	ld e,$CD
	call Unknown_0x2319
	ld e,$27
	ld a,[de]
	ld h,d
	ld l,$41
	bit 0,[hl]
	jr nz,Unknown_0x38887
	inc a
	jr Unknown_0x38888

Unknown_0x38887:
	dec a

Unknown_0x38888:
	ld [de],a
	pop bc
	ret

UnknownData_0x3888B:
INCBIN "baserom.gb", $3888B, $388A8 - $3888B
	call Unknown_0x381ED
	ld bc,$4000
	call Unknown_0x255B
	ld e,$41
	ld a,[de]
	or a
	ret nz
	ld hl,$6B9D
	ld a,$1D
	call Unknown_0x05CF
	call Unknown_0x0C71
	ld hl,$6B86
	ld a,$1D
	call Unknown_0x05CF
	ld h,d
	ld l,$60
	ld [hl],$3F
	ld l,$44
	ld [hl],$18
	ld e,$4C
	ld a,[de]
	cp $0F
	jr c,Unknown_0x388EC
	cp $1E
	jr c,Unknown_0x388E8
	cp $2D
	jr c,Unknown_0x388E4
	xor a
	jr Unknown_0x388EE

Unknown_0x388E4:
	ld a,$01
	jr Unknown_0x388EE

Unknown_0x388E8:
	ld a,$02
	jr Unknown_0x388EE

Unknown_0x388EC:
	ld a,$03

Unknown_0x388EE:
	ld h,d
	ld l,$43
	cp [hl]
	ret z
	ld [hl],a
	ld l,$39
	ld [hl],$0C
	ret

Unknown_0x388F9:
	ld e,$39
	ld a,[de]
	or a
	ret z
	dec a
	ld [de],a
	ld h,$A0
	ld l,$77
	ld a,[hl]
	add a,$02
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hl],a
	ret

UnknownData_0x3890D:
INCBIN "baserom.gb", $3890D, $3891B - $3890D
	ld h,$A0
	ld l,$77
	xor a
	ld [hli],a
	ld [hl],a
	ret
	ld hl,$4CE4
	ld a,$03
	call Unknown_0x05CF
	ret

UnknownData_0x3892C:
INCBIN "baserom.gb", $3892C, $38966 - $3892C

Unknown_0x38966:
INCBIN "baserom.gb", $38966, $38976 - $38966
	call Unknown_0x38207
	ld h,d
	ld l,$11
	ld e,[hl]
	ld l,$3B
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0CEF
	call Unknown_0x0DA4
	ld bc,$40BF
	jp Unknown_0x255B

UnknownData_0x3898E:
INCBIN "baserom.gb", $3898E, $389C9 - $3898E
	call Unknown_0x38207
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$40BF
	jp Unknown_0x255B
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$27
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x389E7
	inc h

Unknown_0x389E7:
	ld a,[hli]
	push af
	ld a,[hl]
	ld hl,$DB53
	ld e,$07
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,[hl]
	adc a,$00
	ld [de],a
	pop af
	ld hl,$DB51
	ld e,$04
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,[hl]
	adc a,$00
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$26
	ld a,[de]
	inc a
	ld [de],a
	dec a
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x38A1B
	inc h

Unknown_0x38A1B:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hli]
	ld [de],a
	ld e,$27
	ld a,[de]
	or a
	ld e,$0F
	jr nz,Unknown_0x38A34
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

Unknown_0x38A34:
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hli]
	cpl
	adc a,$00
	ld [de],a
	ret

UnknownData_0x38A40:
INCBIN "baserom.gb", $38A40, $38B87 - $38A40
	call Unknown_0x38207
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$40CD
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 1,a
	ret z
	ld [$FF00+$80],a
	ld bc,$0005
	ld h,$02
	call Unknown_0x30E0
	ld a,[$FF00+$80]
	bit 3,a
	jr nz,Unknown_0x38BC5
	call Unknown_0x1EC0
	cpl
	ld [de],a
	ld bc,Unknown_0x38BCE
	call Unknown_0x0FAF
	jr z,Unknown_0x38BC5
	ld l,$46
	ld e,l
	ld a,[de]
	ld [hl],a
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x38BC5:
	ld h,d
	ld e,$03
	ld bc,Unknown_0x38966
	jp Unknown_0x0849

Unknown_0x38BCE:
INCBIN "baserom.gb", $38BCE, $38BD1 - $38BCE
	ld e,$40
	ld a,[de]
	or a
	ret z
	push bc
	ld h,$A0
	ld l,$04
	ld e,l
	ld a,[de]
	sub [hl]
	ld c,a
	ld l,$07
	ld e,l
	ld a,[de]
	sub [hl]
	ld b,a
	inc e
	inc l
	ld a,[de]
	ld e,$00
	sbc a,[hl]
	jr nc,Unknown_0x38BEF
	ld e,$01

Unknown_0x38BEF:
	ld a,c
	srl a
	cp b
	jr nc,Unknown_0x38C0E
	sla a
	cp b
	jr z,Unknown_0x38C06
	jr nc,Unknown_0x38C0A
	ld a,b
	sla a
	cp c
	jr c,Unknown_0x38C06
	ld a,$03
	jr Unknown_0x38C11

Unknown_0x38C06:
	ld a,$02
	jr Unknown_0x38C11

Unknown_0x38C0A:
	ld a,$01
	jr Unknown_0x38C11

Unknown_0x38C0E:
	xor a
	jr Unknown_0x38C14

Unknown_0x38C11:
	add a,e
	add a,e
	add a,e

Unknown_0x38C14:
	ld e,$27
	ld [de],a
	pop bc
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x38C36

Unknown_0x38C25:
	ld e,$27
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x38C2E
	inc h

Unknown_0x38C2E:
	ld e,$11
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

Unknown_0x38C36:
	inc a
	ld [de],a
	ld e,$11
	ld a,$FB
	ld [de],a
	ld e,$27
	ld a,[de]
	rrca
	ld e,$12
	jr c,Unknown_0x38C49
	ld a,$02
	ld [de],a
	ret

Unknown_0x38C49:
	ld a,$FE
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$40
	ld a,[de]
	or a
	jp nz,Unknown_0x38C25
	ld e,$11
	ld a,$03
	ld [de],a
	ld e,$27
	ld a,[de]
	rrca
	ld e,$12
	jr c,Unknown_0x38C6B
	ld a,$FF
	ld [de],a
	ret

Unknown_0x38C6B:
	ld a,$01
	ld [de],a
	ret

UnknownData_0x38C6F:
INCBIN "baserom.gb", $38C6F, $38C9C - $38C6F
	ld a,[$A083]
	ld e,$46
	ld [de],a
	ret

UnknownData_0x38CA3:
INCBIN "baserom.gb", $38CA3, $38CAB - $38CA3
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret
	call Unknown_0x1EE6
	call Unknown_0x21D8
	call Unknown_0x0DA4
	call Unknown_0x1AB3
	ret z
	ld h,d
	jp Unknown_0x0BBA

UnknownData_0x38CC3:
INCBIN "baserom.gb", $38CC3, $3A0B2 - $38CC3
	call Unknown_0x0357
	ld a,[$FF00+$9A]
	ld d,a
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld e,$43
	ld a,[de]
	and a
	jr z,Unknown_0x3A0CA
	dec a
	ld [de],a
	ret

Unknown_0x3A0CA:
	ld a,[$FF00+$A6]
	bit 0,a
	jr nz,Unknown_0x3A0D9
	bit 1,a
	jr nz,Unknown_0x3A0D9
	bit 3,a
	jr nz,Unknown_0x3A0D9
	ret

Unknown_0x3A0D9:
	ld hl,$DD2D
	ld [hl],$01
	ret
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ret

UnknownData_0x3A0E9:
INCBIN "baserom.gb", $3A0E9, $3A189 - $3A0E9

Unknown_0x3A189:
INCBIN "baserom.gb", $3A189, $3A1B8 - $3A189

Unknown_0x3A1B8:
INCBIN "baserom.gb", $3A1B8, $3A1CA - $3A1B8

Unknown_0x3A1CA:
INCBIN "baserom.gb", $3A1CA, $3A1FE - $3A1CA
	call Unknown_0x2235
	ld e,$40
	ld [de],a
	ld hl,$616C
	call Unknown_0x23CA
	call Unknown_0x0DA4
	ld bc,$613F
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x19F3
	bit 5,a
	jp nz,Unknown_0x1EF9
	bit 7,a
	jr z,Unknown_0x3A235
	bit 4,a
	call nz,Unknown_0x3A2CA
	ld e,$3F
	ld a,[de]
	and a
	ret z
	ld e,$0E
	ld bc,Unknown_0x3A1CA
	jp Unknown_0x0846

Unknown_0x3A235:
	ld e,$0E
	ld bc,$61B8
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$613F
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	ld b,a
	bit 5,a
	call nz,Unknown_0x1EF9
	ld a,b
	bit 7,a
	ret z
	ld e,$0E
	ld bc,Unknown_0x3A189
	jp Unknown_0x0846
	ld bc,$614D
	call Unknown_0x255B
	ret c
	call Unknown_0x2375
	call Unknown_0x1A25
	call Unknown_0x19CB
	bit 7,a
	jr z,Unknown_0x3A28F
	ld e,$3E
	ld a,[de]
	dec a
	ld [de],a
	ret nz
	ld a,$09
	ld [de],a
	call Unknown_0x3A29D
	ld e,$3F
	ld a,[de]
	and a
	ret nz
	ld e,$0E
	ld bc,Unknown_0x3A189
	jp Unknown_0x0846

Unknown_0x3A28F:
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$0E
	ld bc,Unknown_0x3A1B8
	jp Unknown_0x0846

Unknown_0x3A29D:
	ld e,$04
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	bit 7,a
	jr z,Unknown_0x3A2AA
	cpl
	inc a

Unknown_0x3A2AA:
	cp $2C
	jr nc,Unknown_0x3A2C5
	ld e,$07
	ld l,e
	ld h,$A0
	ld a,[de]
	sub [hl]
	bit 7,a
	jr z,Unknown_0x3A2BB
	cpl
	inc a

Unknown_0x3A2BB:
	cp $40
	jr nc,Unknown_0x3A2C5
	ld e,$3F
	ld a,$01
	ld [de],a
	ret

Unknown_0x3A2C5:
	ld e,$3F
	xor a
	ld [de],a
	ret

Unknown_0x3A2CA:
	ld e,$45
	ld a,[de]
	bit 7,a
	jr nz,Unknown_0x3A2E4
	ld h,d
	ld l,$0D
	ld e,$03
	ld a,[de]
	sub [hl]
	ld [de],a
	inc e
	inc l
	ld a,[de]
	sbc a,[hl]
	ld [de],a
	inc e
	ld a,[de]
	sbc a,$00
	ld [de],a
	ret

Unknown_0x3A2E4:
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld c,a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld b,a
	ld e,$03
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	inc e
	ld a,[de]
	adc a,$00
	ld [de],a
	ret

UnknownData_0x3A300:
INCBIN "baserom.gb", $3A300, $3A32F - $3A300

Unknown_0x3A32F:
INCBIN "baserom.gb", $3A32F, $3A497 - $3A32F
	ld bc,$6300
	call Unknown_0x255B
	ret c
	call Unknown_0x19CB
	bit 7,a
	ret nz
	ld e,$0E
	ld bc,$638B
	jp Unknown_0x0846

UnknownData_0x3A4AC:
INCBIN "baserom.gb", $3A4AC, $3A4AD - $3A4AC
	ld bc,$6300
	call Unknown_0x255B
	ret c
	ld e,$40
	ld a,[de]
	and a
	ret z
	ld e,$0E
	ld bc,$6471
	jp Unknown_0x0846

UnknownData_0x3A4C1:
INCBIN "baserom.gb", $3A4C1, $3A4C2 - $3A4C1
	ld e,$F8
	call Unknown_0x1AC1
	jr z,Unknown_0x3A4CE
	ld hl,$630E
	jr Unknown_0x3A4D1

Unknown_0x3A4CE:
	ld hl,$6312

Unknown_0x3A4D1:
	call Unknown_0x2096
	call Unknown_0x0DA4
	ld bc,$6300
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$0E
	ld bc,Unknown_0x3A32F
	jp Unknown_0x0846

UnknownData_0x3A4EC:
INCBIN "baserom.gb", $3A4EC, $3A4ED - $3A4EC
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$6300
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 6,a
	ret z
	ld e,$05
	ld bc,$5C14
	jp Unknown_0x0846

UnknownData_0x3A508:
INCBIN "baserom.gb", $3A508, $3A509 - $3A508
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$6300
	call Unknown_0x255B
	ret c
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$05
	ld bc,$5C14
	jp Unknown_0x0846

UnknownData_0x3A524:
INCBIN "baserom.gb", $3A524, $3A525 - $3A524
	ld e,$5B
	ld a,[de]
	and a
	ld e,$07
	ld a,[de]
	jr nz,Unknown_0x3A538
	sub $08
	ld [de],a
	jr nc,Unknown_0x3A537
	inc e
	ld a,[de]
	dec a
	ld [de],a

Unknown_0x3A537:
	ret

Unknown_0x3A538:
	add a,$08
	ld [de],a
	jr nc,Unknown_0x3A541
	inc e
	ld a,[de]
	inc a
	ld [de],a

Unknown_0x3A541:
	ret
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$5B
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x3A54F:
INCBIN "baserom.gb", $3A54F, $3C000 - $3A54F

SECTION "Bank0F", ROMX, BANK[$0F]

Unknown_0x3C000:
INCBIN "baserom.gb", $3C000, $3C028 - $3C000

Unknown_0x3C028:
INCBIN "baserom.gb", $3C028, $3C044 - $3C028

Unknown_0x3C044:
INCBIN "baserom.gb", $3C044, $3C0E2 - $3C044

Unknown_0x3C0E2:
INCBIN "baserom.gb", $3C0E2, $3C1DC - $3C0E2

Unknown_0x3C1DC:
INCBIN "baserom.gb", $3C1DC, $3C232 - $3C1DC

Unknown_0x3C232:
INCBIN "baserom.gb", $3C232, $3C246 - $3C232

Unknown_0x3C246:
INCBIN "baserom.gb", $3C246, $3C24E - $3C246

Unknown_0x3C24E:
INCBIN "baserom.gb", $3C24E, $3C27B - $3C24E

Unknown_0x3C27B:
INCBIN "baserom.gb", $3C27B, $3C280 - $3C27B

Unknown_0x3C280:
INCBIN "baserom.gb", $3C280, $3C299 - $3C280

Unknown_0x3C299:
INCBIN "baserom.gb", $3C299, $3C545 - $3C299
	ld a,$01
	ld [$DD5B],a
	ret
	xor a
	ld [$DD5B],a
	ret

Unknown_0x3C550:
INCBIN "baserom.gb", $3C550, $3C7F8 - $3C550

Unknown_0x3C7F8:
INCBIN "baserom.gb", $3C7F8, $3C818 - $3C7F8
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld e,$27
	ld a,[de]
	and a
	jr z,Unknown_0x3C82A
	dec a
	ld [de],a
	ret

Unknown_0x3C82A:
	ld a,$04
	ld [de],a
	ld bc,Unknown_0x3C834
	call Unknown_0x0F50
	ret

Unknown_0x3C834:
INCBIN "baserom.gb", $3C834, $3C837 - $3C834
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ret
	call Unknown_0x0357
	ld a,[$FF00+$9A]
	ld d,a
	ld a,[$DD5B]
	and a
	jr nz,Unknown_0x3C861
	ld e,$43
	ld a,[de]
	and a
	jr z,Unknown_0x3C857
	dec a
	ld [de],a
	jr Unknown_0x3C861

Unknown_0x3C857:
	ld a,[$FF00+$A6]
	bit 0,a
	jr nz,Unknown_0x3C8D4
	bit 3,a
	jr nz,Unknown_0x3C8D4

Unknown_0x3C861:
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld hl,$DB60
	ld a,[hl]
	add a,a
	ld c,a
	ld a,[$DB6A]
	ld hl,$DB7B
	cp [hl]
	ret nz
	ld a,[$DD5B]
	and a
	ret nz
	ld e,$40
	ld a,[de]
	cp $10
	jr c,Unknown_0x3C88F
	ld a,[$FF00+$A5]
	bit 4,a
	jr nz,Unknown_0x3C892
	bit 5,a
	jr nz,Unknown_0x3C8B0
	ret

Unknown_0x3C88F:
	inc a
	ld [de],a
	ret

Unknown_0x3C892:
	ld hl,$DB6A
	ld b,[hl]
	ld hl,$DB60
	ld a,[hl]
	cp $06
	ret z
	inc a

Unknown_0x3C89E:
	and a
	jr z,Unknown_0x3C8AA
	ld e,$00
	srl b
	rl e
	dec a
	jr Unknown_0x3C89E

Unknown_0x3C8AA:
	bit 0,e
	ret z
	inc [hl]
	jr Unknown_0x3C8B9

Unknown_0x3C8B0:
	ld hl,$DB60
	ld a,[hl]
	cp $00
	ret z
	dec [hl]
	dec c

Unknown_0x3C8B9:
	ld a,c
	cp $0C
	ret nc
	ld [$DD59],a
	push de
	ld e,$56
	ld hl,Unknown_0x3C299
	ld a,$1E
	call Unknown_0x05CF
	pop de
	ld e,$0F
	ld bc,Unknown_0x3C7F8
	jp Unknown_0x0846

Unknown_0x3C8D4:
	push de
	ld e,$2D
	ld hl,Unknown_0x3C299
	ld a,$1E
	call Unknown_0x05CF
	pop de
	ld e,$0F
	ld bc,Unknown_0x3C550
	jp Unknown_0x0846
	ld e,$27
	ld a,[$DD59]
	ld [de],a
	ret
	ld e,$15
	ld hl,$A071
	ld a,[hl]
	ld [de],a
	ld a,[$DB60]
	ld hl,$6111
	add a,a
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x3C903
	inc h

Unknown_0x3C903:
	ld e,$04
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$07
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld hl,$DB60
	ld a,[hl]
	cp $06
	jr z,Unknown_0x3C92F
	ld a,[$DB6A]
	ld hl,$DB7B
	cp [hl]
	jr nz,Unknown_0x3C929

Unknown_0x3C923:
	ld e,$27
	ld a,$01
	ld [de],a
	ret

Unknown_0x3C929:
	ld [hl],a
	ld e,$27
	xor a
	ld [de],a
	ret

Unknown_0x3C92F:
	ld a,[$DB6A]
	ld hl,$DB7B
	ld [hl],a
	jr Unknown_0x3C923
	ld a,[$DB6A]
	ld e,a
	xor a

Unknown_0x3C93D:
	srl e
	jr nc,Unknown_0x3C944
	inc a
	jr Unknown_0x3C93D

Unknown_0x3C944:
	ld hl,$6111
	add a,a
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x3C94E
	inc h

Unknown_0x3C94E:
	ld e,$04
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$07
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	push de
	push bc
	ld e,$07
	ld hl,$6035
	ld a,$1E
	call Unknown_0x05CF
	pop bc
	pop de
	ret
	push de
	push bc
	ld a,[$DA36]
	or a
	jr nz,Unknown_0x3C980
	ld hl,$DB60
	ld e,[hl]
	ld hl,$6035
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x3C980:
	pop bc
	pop de
	ret

Unknown_0x3C983:
INCBIN "baserom.gb", $3C983, $3DD82 - $3C983

Unknown_0x3DD82:
INCBIN "baserom.gb", $3DD82, $3DDDE - $3DD82

Unknown_0x3DDDE:
INCBIN "baserom.gb", $3DDDE, $3DDFF - $3DDDE

Unknown_0x3DDFF:
INCBIN "baserom.gb", $3DDFF, $3DE1D - $3DDFF
	ld e,$3E
	ld a,[de]
	cp $0F
	ld e,$27
	jr z,Unknown_0x3DE29
	xor a
	ld [de],a
	ret

Unknown_0x3DE29:
	ld a,$01
	ld [de],a
	ret

UnknownData_0x3DE2D:
INCBIN "baserom.gb", $3DE2D, $3DE3D - $3DE2D
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 7,a
	ret z
	ld e,$0F
	ld bc,Unknown_0x3DDFF
	jp Unknown_0x0846
	call Unknown_0x3E0BC
	ld h,d
	ld l,$12
	ld e,[hl]
	ld l,$39
	ld c,[hl]
	inc l
	ld b,[hl]
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld e,$08
	ld a,[de]
	cp $02
	ret nz
	dec e
	ld a,[de]
	cp $C0
	ret c
	ld e,$0F
	ld bc,$5D69
	jp Unknown_0x0846
	ld e,$27
	ld a,[de]
	and a
	jr nz,Unknown_0x3DEB1
	ld e,$3F
	ld a,[de]
	add a,a
	add a,a
	ld c,$00

Unknown_0x3DE8C:
	sub $18
	jr c,Unknown_0x3DE93
	inc c
	jr Unknown_0x3DE8C

Unknown_0x3DE93:
	ld a,$04
	sub c
	ld c,a
	ld e,$3C
	ld a,[de]
	and a
	ld e,$07
	jr nz,Unknown_0x3DEA8
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,$00
	ld [de],a
	ret

Unknown_0x3DEA8:
	ld a,[de]
	sub c
	ld [de],a
	inc e
	ld a,[de]
	sbc a,$00
	ld [de],a
	ret

Unknown_0x3DEB1:
	ld e,$0F
	ld bc,Unknown_0x3DD82
	jp Unknown_0x0846
	ld hl,$A008
	ld a,[hld]
	cp $02
	ret nz
	ld a,[hl]
	cp $C0
	ret c
	ld e,$0F
	ld bc,$5D5B
	jp Unknown_0x0846
	ld hl,$741F
	ld a,$08
	call Unknown_0x05CF
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld e,$10
	ld a,[de]
	bit 7,a
	ret nz
	ld e,$3C
	ld a,[de]
	and a
	jr nz,Unknown_0x3DEEE
	ld e,$0F
	ld bc,Unknown_0x3DDDE
	jp Unknown_0x0846

Unknown_0x3DEEE:
	ld e,$0F
	ld bc,$5DEA
	jp Unknown_0x0846
	ld e,$3A
	ld a,[de]
	and a
	jr nz,Unknown_0x3DF14
	ld hl,$A03F
	inc [hl]
	ld a,[hl]
	cp $18
	jr nz,Unknown_0x3DF2A
	ld e,$3A
	ld a,$01
	ld [de],a
	ld hl,$A042
	ld [hl],a
	ld hl,$A03C
	ld [hl],a
	jr Unknown_0x3DF2A

Unknown_0x3DF14:
	ld hl,$A03F
	ld a,[hl]
	dec a
	bit 7,a
	jr z,Unknown_0x3DF23
	ld e,$3B
	ld a,$01
	ld [de],a
	xor a

Unknown_0x3DF23:
	ld [hl],a
	ld e,$39
	ld a,[de]
	and a
	jr nz,Unknown_0x3DF58

Unknown_0x3DF2A:
	push de
	call Unknown_0x0357
	pop de
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x3DF39
	bit 1,a
	jr z,Unknown_0x3DF58

Unknown_0x3DF39:
	ld e,$39
	ld a,$01
	ld [de],a
	inc e
	ld [de],a
	ld hl,$A03F
	ld a,[hl]
	ld l,$3D
	ld [hl],a
	ld hl,$A03C
	ld [hl],$01
	push de
	ld e,$11
	ld hl,Unknown_0x3C299
	ld a,$1E
	call Unknown_0x05CF
	pop de

Unknown_0x3DF58:
	ld e,$3B
	ld a,[de]
	and a
	jr nz,Unknown_0x3DF93
	ld b,$08
	ld hl,$A03F
	ld a,[hl]
	cp $12
	jr nc,Unknown_0x3DF72
	cp $0C
	jr nc,Unknown_0x3DF73
	cp $06
	jr nc,Unknown_0x3DF74
	jr Unknown_0x3DF75

Unknown_0x3DF72:
	inc b

Unknown_0x3DF73:
	inc b

Unknown_0x3DF74:
	inc b

Unknown_0x3DF75:
	ld e,$15
	ld a,b
	ld [de],a
	sub $08
	add a,a
	ld b,a
	ld a,$10
	sub b
	ld b,a
	ld hl,$A007
	ld a,[hl]
	add a,b
	ld b,a
	inc l
	ld e,$08
	ld a,[hl]
	jr nc,Unknown_0x3DF8E
	inc a

Unknown_0x3DF8E:
	ld [de],a
	ld a,b
	dec e
	ld [de],a
	ret

Unknown_0x3DF93:
	ld hl,$A027
	ld [hl],$01
	push de
	ld e,$45
	ld hl,Unknown_0x3C299
	ld a,$1E
	call Unknown_0x05CF
	pop de
	ld e,$0F
	ld bc,$5D3D
	jp Unknown_0x0846
	ld h,d
	ld e,$3E
	ld a,[de]
	cp $0F
	jr z,Unknown_0x3DFEF
	ld e,$3D
	ld a,[de]
	cp $18
	jr z,Unknown_0x3DFEF
	cp $17
	jr nc,Unknown_0x3DFF7
	cp $16
	jr nc,Unknown_0x3E009
	cp $15
	jr nc,Unknown_0x3E011
	cp $14
	jr nc,Unknown_0x3E01D
	cp $13
	jr nc,Unknown_0x3E025
	cp $11
	jr nc,Unknown_0x3E031
	cp $10
	jr nc,Unknown_0x3E039
	cp $0E
	jr nc,Unknown_0x3E045
	cp $0C
	jr nc,Unknown_0x3E04D
	cp $09
	jr nc,Unknown_0x3E059
	cp $07
	jr nc,Unknown_0x3E061
	ld a,$01
	ld l,$27
	ld [hl],$06
	jr Unknown_0x3E06B

Unknown_0x3DFEF:
	ld a,$78
	ld l,$27
	ld [hl],$00
	jr Unknown_0x3E06B

Unknown_0x3DFF7:
	ld e,$42
	ld a,[de]
	and a
	jr nz,Unknown_0x3E009
	ld a,$6E
	ld l,$3C
	ld [hl],$01
	ld l,$27
	ld [hl],$00
	jr Unknown_0x3E06B

Unknown_0x3E009:
	ld a,$64
	ld l,$27
	ld [hl],$01
	jr Unknown_0x3E06B

Unknown_0x3E011:
	ld a,$5A
	ld l,$3C
	ld [hl],$01
	ld l,$27
	ld [hl],$01
	jr Unknown_0x3E06B

Unknown_0x3E01D:
	ld a,$50
	ld l,$27
	ld [hl],$02
	jr Unknown_0x3E06B

Unknown_0x3E025:
	ld a,$46
	ld l,$3C
	ld [hl],$01
	ld l,$27
	ld [hl],$02
	jr Unknown_0x3E06B

Unknown_0x3E031:
	ld a,$3C
	ld l,$27
	ld [hl],$03
	jr Unknown_0x3E06B

Unknown_0x3E039:
	ld a,$32
	ld l,$3C
	ld [hl],$01
	ld l,$27
	ld [hl],$03
	jr Unknown_0x3E06B

Unknown_0x3E045:
	ld a,$28
	ld l,$27
	ld [hl],$04
	jr Unknown_0x3E06B

Unknown_0x3E04D:
	ld a,$1E
	ld l,$3C
	ld [hl],$01
	ld l,$27
	ld [hl],$04
	jr Unknown_0x3E06B

Unknown_0x3E059:
	ld a,$14
	ld l,$27
	ld [hl],$05
	jr Unknown_0x3E06B

Unknown_0x3E061:
	ld a,$0A
	ld l,$3C
	ld [hl],$01
	ld l,$27
	ld [hl],$05

Unknown_0x3E06B:
	ld l,$24
	ld [hl],a
	ret
	ld a,$01
	ld [$A054],a
	ret
	ld a,[$A071]
	cp $03
	jr z,Unknown_0x3E0AE
	cp $02
	jr z,Unknown_0x3E0A0
	cp $01
	jr z,Unknown_0x3E092
	ld e,$16
	ld a,$0F
	ld [de],a
	inc e
	ld a,$4B
	ld [de],a
	inc e
	ld a,$99
	ld [de],a
	ret

Unknown_0x3E092:
	ld e,$16
	ld a,$0F
	ld [de],a
	inc e
	ld a,$4E
	ld [de],a
	inc e
	ld a,$ED
	ld [de],a
	ret

Unknown_0x3E0A0:
	ld e,$16
	ld a,$0F
	ld [de],a
	inc e
	ld a,$53
	ld [de],a
	inc e
	ld a,$AB
	ld [de],a
	ret

Unknown_0x3E0AE:
	ld e,$16
	ld a,$0F
	ld [de],a
	inc e
	ld a,$58
	ld [de],a
	inc e
	ld a,$E6
	ld [de],a
	ret

Unknown_0x3E0BC:
	push de
	call Unknown_0x0357
	pop de
	ld hl,$FFA5
	ld e,$3E
	ld a,[de]
	bit 0,a
	jr z,Unknown_0x3E0D8
	bit 1,a
	jr z,Unknown_0x3E0E2
	bit 2,a
	jr z,Unknown_0x3E0EC
	bit 3,a
	jr z,Unknown_0x3E0F6
	ret

Unknown_0x3E0D8:
	ld e,[hl]
	bit 6,e
	ret z
	set 0,a
	ld e,$3E
	ld [de],a
	ret

Unknown_0x3E0E2:
	ld e,[hl]
	bit 7,e
	ret z
	set 1,a
	ld e,$3E
	ld [de],a
	ret

Unknown_0x3E0EC:
	ld e,[hl]
	bit 6,e
	ret z
	set 2,a
	ld e,$3E
	ld [de],a
	ret

Unknown_0x3E0F6:
	ld e,[hl]
	bit 0,e
	ret z
	set 3,a
	ld e,$3E
	ld [de],a
	ld e,$15
	ld a,$04
	ld [de],a
	push de
	ld e,$2D
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	pop de
	ret

UnknownData_0x3E111:
INCBIN "baserom.gb", $3E111, $3E145 - $3E111
	call Unknown_0x3E2C4
	ld a,$14

Unknown_0x3E14A:
	push af
	xor a
	ld [$FF00+$A6],a
	call Unknown_0x3E169
	pop af
	dec a
	jr nz,Unknown_0x3E14A

Unknown_0x3E155:
	call Unknown_0x3E169
	ld hl,$DF04
	bit 7,[hl]
	jr z,Unknown_0x3E155
	res 7,[hl]
	ld a,[hl]
	or a
	jp z,Unknown_0x3E22C
	jp Unknown_0x3E1F1

Unknown_0x3E169:
	call Unknown_0x0496
	ld hl,$086B
	ld a,$00
	call Unknown_0x05CF
	call Unknown_0x3E180
	call Unknown_0x04AE
	call Unknown_0x0343
	jp Unknown_0x0357

Unknown_0x3E180:
	ld a,[$DA36]
	or a
	jr nz,Unknown_0x3E1B1
	ld a,[$FF00+$A6]
	ld b,a
	and $09
	jr nz,Unknown_0x3E1D1
	ld a,[$DF04]
	bit 6,b
	jr z,Unknown_0x3E19A
	or a
	jr z,Unknown_0x3E1B1
	dec a
	jr Unknown_0x3E1A9

Unknown_0x3E19A:
	bit 7,b
	jr z,Unknown_0x3E1B1
	dec a
	jr z,Unknown_0x3E1B1
	ld a,[$DF05]
	or a
	jr z,Unknown_0x3E1B1
	ld a,$01

Unknown_0x3E1A9:
	ld [$DF04],a
	ld e,$2C
	call Unknown_0x10AA

Unknown_0x3E1B1:
	ld a,[$DA0E]
	and $04
	or a
	ret z

Unknown_0x3E1B8:
	ld hl,$FF80
	ld [hl],$4E
	inc l
	ld [hl],$00
	inc l
	ld a,[$DF04]
	or a
	ld a,$70
	jr z,Unknown_0x3E1CB
	ld a,$7F

Unknown_0x3E1CB:
	ld [hli],a
	ld [hl],$00
	jp Unknown_0x3E1DF

Unknown_0x3E1D1:
	ld e,$2D
	call Unknown_0x10AA
	call Unknown_0x3E1B8
	ld hl,$DF04
	set 7,[hl]
	ret

Unknown_0x3E1DF:
	xor a
	ld hl,$FF93
	ld [hli],a
	ld [hl],$70
	inc l
	ld [hl],a
	ld hl,Unknown_0x3E746
	ld de,$FF83
	jp Unknown_0x051C

Unknown_0x3E1F1:
	ld de,$0B04
	ld hl,Unknown_0x3C27B
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld a,[$A051]
	cp $0D
	jr nz,Unknown_0x3E21B
	ld a,[$A05B]
	ld b,$00
	cp $FF
	jr z,Unknown_0x3E217
	cp $01
	ld b,$04
	jr z,Unknown_0x3E217
	ld b,$02

Unknown_0x3E217:
	ld a,b
	ld [$A051],a

Unknown_0x3E21B:
	ld hl,$10E6
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	ret

Unknown_0x3E22C:
	ld de,$0B04
	ld hl,Unknown_0x3C27B
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld e,$09
	ld hl,$602E
	ld a,$1E
	call Unknown_0x05CF
	ld hl,$1126
	ld a,$00
	call Unknown_0x05CF
	ld hl,$1134
	ld a,$00
	call Unknown_0x05CF
	ld a,$7F
	ld [$FF00+$45],a
	ld [$DA29],a
	ld a,$07
	ld [$FF00+$4B],a
	ld a,$80
	ld [$FF00+$4A],a
	ld a,[$A05B]
	push af
	ld hl,$1166
	ld a,$00
	call Unknown_0x05CF
	pop af
	ld [$A05B],a
	ld c,$04
	ld hl,$DF06
	ld de,$DB51

Unknown_0x3E27B:
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,Unknown_0x3E27B
	ld hl,$14EE
	ld a,$00
	call Unknown_0x05CF
	ld hl,Unknown_0x3C1DC
	ld a,$07
	call Unknown_0x05CF
	ld hl,Unknown_0x3C0E2
	ld a,$07
	call Unknown_0x05CF
	ld hl,$DB78
	ld de,$CD09
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	call Unknown_0x31CD
	ld a,$67
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld hl,Unknown_0x3C044
	ld a,$08
	call Unknown_0x05CF
	ld e,$04
	ld hl,Unknown_0x3C24E
	ld a,$1A
	call Unknown_0x05CF
	ret

Unknown_0x3E2C4:
	ld e,$2A
	ld hl,Unknown_0x3C299
	ld a,$1E
	call Unknown_0x05CF
	ld e,$04
	ld hl,Unknown_0x3C280
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld hl,$1126
	ld a,$00
	call Unknown_0x05CF
	ld hl,Unknown_0x3E399
	ld de,$8700
	call Unknown_0x0708
	ld a,[$A071]
	or a
	ld b,$24
	jr z,Unknown_0x3E2F7
	add a,$2A
	ld b,a

Unknown_0x3E2F7:
	ld a,b
	ld [$DF11],a
	ld hl,$115F
	ld a,$00
	call Unknown_0x05CF
	ld hl,Unknown_0x3E39E
	ld de,$9000
	call Unknown_0x0708
	ld hl,Unknown_0x3E67F
	ld de,$9800
	call Unknown_0x0708
	ld c,$04
	ld hl,$DB51
	ld de,$DF06

Unknown_0x3E31D:
	ld a,[hl]
	ld [hl],$00
	ld [de],a
	inc hl
	inc de
	dec c
	jr nz,Unknown_0x3E31D
	xor a
	ld [$DA01],a
	ld [$DA00],a
	ld a,$FF
	ld [$DA29],a
	ld [$FF00+$45],a
	ld hl,$CD09
	ld a,$E4
	ld [hli],a
	ld a,$D0
	ld [hli],a
	ld a,$E4
	ld [hl],a
	ld a,$47
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld e,$0F
	ld hl,$6011
	ld a,$1E
	call Unknown_0x05CF
	ld hl,Unknown_0x3C028
	ld a,$08
	call Unknown_0x05CF
	ld a,$A7
	ld h,$A0
	call Unknown_0x07FC
	xor a
	ld [$DF04],a
	ld a,[$DB61]
	cp $08
	jr nc,Unknown_0x3E374
	ld e,a
	ld a,[$DB60]
	call Unknown_0x162A
	jr Unknown_0x3E38A

Unknown_0x3E374:
	cp $09
	jr nz,Unknown_0x3E389
	ld a,[$DB73]
	or a
	jr nz,Unknown_0x3E389
	ld a,[$DF0A]
	cp $04
	jr nc,Unknown_0x3E389
	ld a,$01
	jr Unknown_0x3E38A

Unknown_0x3E389:
	xor a

Unknown_0x3E38A:
	ld [$DF05],a
	ld de,$0B04
	ld hl,Unknown_0x3C246
	ld a,$1A
	call Unknown_0x05CF
	ret

Unknown_0x3E399:
INCBIN "baserom.gb", $3E399, $3E39E - $3E399

Unknown_0x3E39E:
INCBIN "baserom.gb", $3E39E, $3E67F - $3E39E

Unknown_0x3E67F:
INCBIN "baserom.gb", $3E67F, $3E746 - $3E67F

Unknown_0x3E746:
INCBIN "baserom.gb", $3E746, $3E89B - $3E746
	call Unknown_0x0C80
	call Unknown_0x0C91
	jp Unknown_0x0DA4

Unknown_0x3E8A4:
INCBIN "baserom.gb", $3E8A4, $3E8D2 - $3E8A4
	call Unknown_0x3EE0B
	ld a,$20

Unknown_0x3E8D7:
	push af
	xor a
	ld [$FF00+$A6],a
	call Unknown_0x3E8FE
	pop af
	dec a
	jr nz,Unknown_0x3E8D7

Unknown_0x3E8E2:
	call Unknown_0x3E8FE
	call Unknown_0x0647
	ld a,[$DF0A]
	cp $06
	jr z,Unknown_0x3E8E2
	ld de,$0104
	ld hl,Unknown_0x3C27B
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ret

Unknown_0x3E8FE:
	call Unknown_0x0496
	ld hl,$086B
	ld a,$00
	call Unknown_0x05CF
	call Unknown_0x04AE
	call Unknown_0x0343
	jp Unknown_0x0357

UnknownData_0x3E912:
INCBIN "baserom.gb", $3E912, $3E9D2 - $3E912
	ld e,$39
	ld a,[de]
	ld [$DF0A],a
	ret
	ld e,$39
	ld a,[de]
	ld hl,$69F3
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x3E9E5
	inc h

Unknown_0x3E9E5:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld e,$27
	ld a,[hli]
	or a
	jr nz,Unknown_0x3E9F1
	ld a,[hl]
	sub $01

Unknown_0x3E9F1:
	ld [de],a
	ret

UnknownData_0x3E9F3:
INCBIN "baserom.gb", $3E9F3, $3EA1A - $3E9F3

Unknown_0x3EA1A:
	ld e,$39
	ld a,[de]
	ld hl,$6A2A
	add a,l
	ld l,a
	jr nc,Unknown_0x3EA25
	inc h

Unknown_0x3EA25:
	ld a,[hl]
	ld e,$07
	ld [de],a
	ret

UnknownData_0x3EA2A:
INCBIN "baserom.gb", $3EA2A, $3EA2E - $3EA2A
	ld a,[$FF00+$A6]
	ld e,$39
	bit 6,a
	jr nz,Unknown_0x3EA43
	bit 7,a
	jr nz,Unknown_0x3EA51
	bit 1,a
	jr nz,Unknown_0x3EA58
	and $09
	jr nz,Unknown_0x3EA71
	ret

Unknown_0x3EA43:
	ld a,[de]
	or a
	ret z
	dec a

Unknown_0x3EA47:
	ld [de],a
	call Unknown_0x3EA1A
	ld e,$2C
	call Unknown_0x10AA
	ret

Unknown_0x3EA51:
	ld a,[de]
	cp $03
	ret z
	inc a
	jr Unknown_0x3EA47

Unknown_0x3EA58:
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x3EA6B
	ld e,$39
	call Unknown_0x10AA
	ld e,$0F
	ld bc,$6939
	jp Unknown_0x0846

Unknown_0x3EA6B:
	ld a,$FF
	ld [$DF0A],a
	ret

Unknown_0x3EA71:
	ld a,[de]
	cp $03
	ld e,$3A
	jr z,Unknown_0x3EA91
	ld a,[de]
	or a
	jr nz,Unknown_0x3EA89
	ld e,$2D
	call Unknown_0x10AA
	ld e,$0F
	ld bc,$6974
	jp Unknown_0x0846

Unknown_0x3EA89:
	ld e,$0F
	ld bc,$695F
	jp Unknown_0x0846

Unknown_0x3EA91:
	ld a,[de]
	or a
	ret nz
	ld e,$2D
	call Unknown_0x10AA
	ld e,$0F
	ld bc,$694F
	jp Unknown_0x0846

UnknownData_0x3EAA1:
INCBIN "baserom.gb", $3EAA1, $3EC34 - $3EAA1
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$3A
	ld a,[hl]
	or a
	ld a,$FF
	jr nz,Unknown_0x3EC43
	ld e,$39
	ld a,[de]

Unknown_0x3EC43:
	ld e,$15
	ld [de],a
	ret

UnknownData_0x3EC47:
INCBIN "baserom.gb", $3EC47, $3EC6F - $3EC47
	push bc
	ld e,$39
	ld a,[de]
	ld e,a
	call Unknown_0x3EC7F
	call Unknown_0x3EC97
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

Unknown_0x3EC7F:
	ld a,e
	ld hl,$BF00
	cp $01
	jr c,Unknown_0x3EC8F
	ld hl,$BF1C
	jr z,Unknown_0x3EC8F
	ld hl,$BF38

Unknown_0x3EC8F:
	ld e,$1C
	xor a

Unknown_0x3EC92:
	ld [hli],a
	dec e
	jr nz,Unknown_0x3EC92
	ret

Unknown_0x3EC97:
	ld a,$0F
	call Unknown_0x0675
	ret c
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld de,$98CC
	ld bc,$BF02
	call Unknown_0x3ECC1
	ld de,$992C
	ld bc,$BF1E
	call Unknown_0x3ECC1
	ld de,$998C
	ld bc,$BF3A
	call Unknown_0x3ECC1
	ld a,l
	ld [$FF00+$92],a
	ret

Unknown_0x3ECC1:
	ld [hl],e
	inc l
	ld [hl],d
	inc l
	ld [hl],$05
	inc l
	ld a,[bc]
	inc a
	ld [hl],a
	inc l
	ld e,$0A
	ld [hl],e
	inc l
	dec bc
	ld a,[bc]
	and $0F
	call Unknown_0x3ECE5
	dec bc
	ld a,[bc]
	swap a
	and $0F
	call Unknown_0x3ECE5
	ld e,$00
	ld a,[bc]
	and $0F

Unknown_0x3ECE5:
	jr nz,Unknown_0x3ECEA
	ld a,e
	jr Unknown_0x3ECEC

Unknown_0x3ECEA:
	ld e,$00

Unknown_0x3ECEC:
	ld [hl],a
	inc l
	ret

Unknown_0x3ECEF:
	ld c,$03
	ld de,$001C
	ld hl,$BF02

Unknown_0x3ECF7:
	ld b,$17
	push hl
	ld a,[hli]

Unknown_0x3ECFB:
	xor [hl]
	inc hl
	dec b
	jr nz,Unknown_0x3ECFB
	cp [hl]
	jr nz,Unknown_0x3ED16
	pop hl
	ld b,$18
	push hl
	ld a,[hli]

Unknown_0x3ED08:
	add a,[hl]
	inc hl
	dec b
	jr nz,Unknown_0x3ED08
	cp [hl]
	jr nz,Unknown_0x3ED16

Unknown_0x3ED10:
	pop hl
	add hl,de
	dec c
	jr nz,Unknown_0x3ECF7
	ret

Unknown_0x3ED16:
	pop hl
	push hl
	ld b,$1A
	xor a

Unknown_0x3ED1B:
	ld [hli],a
	dec b
	jr nz,Unknown_0x3ED1B
	jr Unknown_0x3ED10
	ld a,[$DF0A]
	cp $03
	ret nc
	ld de,$BF02
	cp $01
	jr c,Unknown_0x3ED36
	ld de,$BF1E
	jr z,Unknown_0x3ED36
	ld de,$BF3A

Unknown_0x3ED36:
	ld hl,Unknown_0x3E8A4

Unknown_0x3ED39:
	ld a,[hli]
	or a
	jr z,Unknown_0x3ED50
	ld [$FF00+$84],a
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a

Unknown_0x3ED43:
	ld a,[de]
	inc de
	ld [bc],a
	inc bc
	ld a,[$FF00+$84]
	dec a
	ld [$FF00+$84],a
	jr nz,Unknown_0x3ED43
	jr Unknown_0x3ED39

Unknown_0x3ED50:
	ld hl,$FFE6
	add hl,de
	ld a,[hli]
	or [hl]
	ret nz
	ld a,$02
	ld [$A084],a
	ld a,$0C
	ld [$A04C],a
	ld a,$06
	ld [$A072],a
	ld a,$FF
	ld [$A05B],a
	ret
	ld a,[$DF0A]
	cp $03
	ret nc
	ld de,$BF02
	cp $01
	jr c,Unknown_0x3ED81
	ld de,$BF1E
	jr z,Unknown_0x3ED81
	ld de,$BF3A

Unknown_0x3ED81:
	ld hl,Unknown_0x3E8A4

Unknown_0x3ED84:
	ld a,[hli]
	or a
	jr z,Unknown_0x3ED9B
	ld [$FF00+$84],a
	ld a,[hli]
	ld c,a
	ld a,[hli]
	ld b,a

Unknown_0x3ED8E:
	ld a,[bc]
	inc bc
	ld [de],a
	inc de
	ld a,[$FF00+$84]
	dec a
	ld [$FF00+$84],a
	jr nz,Unknown_0x3ED8E
	jr Unknown_0x3ED84

Unknown_0x3ED9B:
	ld hl,$FFE8
	add hl,de
	ld b,$17
	push hl
	ld a,[hli]

Unknown_0x3EDA3:
	xor [hl]
	inc hl
	dec b
	jr nz,Unknown_0x3EDA3
	ld [hl],a
	pop hl
	ld b,$18
	ld a,[hli]

Unknown_0x3EDAD:
	add a,[hl]
	inc hl
	dec b
	jr nz,Unknown_0x3EDAD
	ld [hl],a
	ret

Unknown_0x3EDB4:
	ld a,$03
	ld [$FF00+$82],a
	ld hl,$BF00

Unknown_0x3EDBB:
	push hl
	xor a
	ld [$FF00+$80],a
	ld [$FF00+$81],a
	ld de,$0003
	add hl,de
	ld b,$0A
	ld c,$02
	call Unknown_0x3EDED
	ld b,$02
	ld c,$01
	call Unknown_0x3EDED
	ld b,$01
	ld c,$03
	call Unknown_0x3EDED
	pop hl
	ld a,[$FF00+$80]
	ld [hli],a
	ld a,[$FF00+$81]
	ld [hld],a
	ld de,$001C
	add hl,de
	ld a,[$FF00+$82]
	dec a
	ld [$FF00+$82],a
	jr nz,Unknown_0x3EDBB
	ret

Unknown_0x3EDED:
	ld e,[hl]
	inc hl
	ld d,$08

Unknown_0x3EDF1:
	srl e
	call c,Unknown_0x3EDFD
	dec d
	jr nz,Unknown_0x3EDF1
	dec b
	jr nz,Unknown_0x3EDED
	ret

Unknown_0x3EDFD:
	ld a,[$FF00+$80]
	add a,c
	daa
	ld [$FF00+$80],a
	ld a,[$FF00+$81]
	adc a,$00
	daa
	ld [$FF00+$81],a
	ret

Unknown_0x3EE0B:
	ld hl,Unknown_0x3C000
	ld a,$08
	call Unknown_0x05CF
	ld e,$10
	ld hl,$6011
	ld a,$1E
	call Unknown_0x05CF
	ld hl,Unknown_0x3EE8C
	ld de,$8000
	call Unknown_0x0708
	ld hl,$1150
	ld a,$00
	call Unknown_0x05CF
	ld hl,Unknown_0x3F05D
	ld de,$9000
	call Unknown_0x0708
	ld hl,Unknown_0x3F2A3
	ld de,$9800
	call Unknown_0x0708
	call Unknown_0x3ECEF
	call Unknown_0x3EDB4
	call Unknown_0x3EC97
	call Unknown_0x1584
	ld a,$FF
	ld [$DA29],a
	ld [$FF00+$45],a
	ld a,$A8
	ld hl,$A0B3
	call Unknown_0x07C4
	ld e,$2E
	ld hl,Unknown_0x3C232
	ld a,$1F
	call Unknown_0x05CF
	ld hl,$CD09
	ld a,$E4
	ld [hli],a
	ld a,$D0
	ld [hli],a
	ld a,$E4
	ld [hl],a
	ld a,$47
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld a,$06
	ld [$DF0A],a
	call Unknown_0x0357
	ld de,$0104
	ld hl,Unknown_0x3C246
	ld a,$1A
	call Unknown_0x05CF
	ret

Unknown_0x3EE8C:
INCBIN "baserom.gb", $3EE8C, $3F05D - $3EE8C

Unknown_0x3F05D:
INCBIN "baserom.gb", $3F05D, $3F2A3 - $3F05D

Unknown_0x3F2A3:
INCBIN "baserom.gb", $3F2A3, $40000 - $3F2A3

SECTION "Bank10", ROMX, BANK[$10]

UnknownData_0x40000:
INCBIN "baserom.gb", $40000, $40232 - $40000

Unknown_0x40232:
INCBIN "baserom.gb", $40232, $40246 - $40232

Unknown_0x40246:
INCBIN "baserom.gb", $40246, $4027B - $40246

Unknown_0x4027B:
INCBIN "baserom.gb", $4027B, $40299 - $4027B

Unknown_0x40299:
INCBIN "baserom.gb", $40299, $41ADA - $40299

Unknown_0x41ADA:
INCBIN "baserom.gb", $41ADA, $41B06 - $41ADA

Unknown_0x41B06:
INCBIN "baserom.gb", $41B06, $42011 - $41B06

Unknown_0x42011:
INCBIN "baserom.gb", $42011, $4206D - $42011

Unknown_0x4206D:
INCBIN "baserom.gb", $4206D, $432D1 - $4206D

Unknown_0x432D1:
INCBIN "baserom.gb", $432D1, $43944 - $432D1

Unknown_0x43944:
INCBIN "baserom.gb", $43944, $43A2D - $43944
	call Unknown_0x2AF8
	xor a
	ld [$DF32],a
	ld [$DA2D],a
	ld a,$E4
	ld [$CD09],a
	ld a,$D0
	ld [$CD0A],a
	ld a,$E4
	ld [$CD0B],a
	ld hl,$9800
	ld bc,$0400
	ld a,$00
	call Unknown_0x062F
	ld hl,$9C00
	ld bc,$0400
	ld a,$00
	call Unknown_0x062F
	ld e,$FF
	ld hl,Unknown_0x40232
	ld a,$1F
	call Unknown_0x05CF
	ld e,$00
	ld hl,Unknown_0x4206D
	ld a,$1E
	call Unknown_0x05CF
	ld hl,Unknown_0x432D1
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,$8FF0
	ld bc,$0010
	ld a,$FF
	call Unknown_0x062F
	ld hl,Unknown_0x43944
	ld de,$CF00
	call Unknown_0x0708
	call Unknown_0x43C90
	ld a,$45
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld e,$1F
	ld hl,Unknown_0x42011
	ld a,$1E
	call Unknown_0x05CF
	ld de,$0201
	ld hl,Unknown_0x40246
	ld a,$1A
	call Unknown_0x05CF
	ld b,$00
	ld hl,Unknown_0x41B06
	ld a,$07
	call Unknown_0x05CF
	ld a,$A8
	ld [$DA2D],a
	ld a,$14
	ld [$DF33],a
	ld e,$47
	ld hl,Unknown_0x40299
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x43AD6:
	call Unknown_0x43B84
	ld a,[$DA2D]
	sub $04
	ld [$DA2D],a
	call Unknown_0x0496
	call Unknown_0x04AE
	call Unknown_0x0343
	ld a,[$DA2D]
	and a
	jr nz,Unknown_0x43AD6
	ld hl,$DA29
	ld a,$2F
	ld [hl],a
	ld [$FF00+$45],a
	ld a,$58
	ld [$DA2D],a
	ld a,$FF
	ld [$DF33],a
	ld e,$47
	ld hl,Unknown_0x40299
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x43B0C:
	call Unknown_0x43BCC
	ld a,[$DA2D]
	add a,$04
	ld [$DA2D],a
	call Unknown_0x0496
	call Unknown_0x04AE
	call Unknown_0x0343
	ld a,[$DA2D]
	and a
	jr nz,Unknown_0x43B0C
	ld hl,$DA29
	ld a,$5F
	ld [hl],a
	ld [$FF00+$45],a
	ld a,$A8
	ld [$DA2D],a
	ld a,$14
	ld [$DF33],a
	ld e,$47
	ld hl,Unknown_0x40299
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x43B42:
	call Unknown_0x43C15
	ld a,[$DA2D]
	sub $04
	ld [$DA2D],a
	call Unknown_0x0496
	call Unknown_0x04AE
	call Unknown_0x0343
	ld a,[$DA2D]
	and a
	jr nz,Unknown_0x43B42
	ld a,$40

Unknown_0x43B5E:
	dec a
	push af
	call Unknown_0x0496
	call Unknown_0x04AE
	call Unknown_0x0343
	pop af
	and a
	jr nz,Unknown_0x43B5E
	ld de,$0204
	ld hl,Unknown_0x4027B
	ld a,$1A
	call Unknown_0x05CF
	call Unknown_0x0437
	ld hl,Unknown_0x41ADA
	ld a,$07
	call Unknown_0x05CF
	ret

Unknown_0x43B84:
	ld a,[$DA2D]
	and $07
	ret nz
	ld bc,$9800
	ld a,[$DF33]
	and a
	ret z
	dec a
	ld [$DF33],a
	add a,c
	ld c,a
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld a,$06
	ld [$FF00+$81],a
	ld de,$CF00
	ld a,[$DF33]
	add a,e
	ld e,a

Unknown_0x43BA9:
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld [hl],$01
	inc l
	ld a,[de]
	ld [hl],a
	inc l
	ld a,e
	add a,$20
	ld e,a
	jr nc,Unknown_0x43BBA
	inc d

Unknown_0x43BBA:
	ld a,c
	add a,$20
	ld c,a
	jr nc,Unknown_0x43BC1
	inc b

Unknown_0x43BC1:
	ld a,[$FF00+$81]
	dec a
	ld [$FF00+$81],a
	jr nz,Unknown_0x43BA9
	ld a,l
	ld [$FF00+$92],a
	ret

Unknown_0x43BCC:
	ld a,[$DA2D]
	and $07
	ret nz
	ld bc,$98C0
	ld a,[$DF33]
	cp $14
	ret z
	inc a
	ld [$DF33],a
	add a,c
	ld c,a
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld a,$06
	ld [$FF00+$81],a
	ld de,$CFC0
	ld a,[$DF33]
	add a,e
	ld e,a

Unknown_0x43BF2:
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld [hl],$01
	inc l
	ld a,[de]
	ld [hl],a
	inc l
	ld a,e
	add a,$20
	ld e,a
	jr nc,Unknown_0x43C03
	inc d

Unknown_0x43C03:
	ld a,c
	add a,$20
	ld c,a
	jr nc,Unknown_0x43C0A
	inc b

Unknown_0x43C0A:
	ld a,[$FF00+$81]
	dec a
	ld [$FF00+$81],a
	jr nz,Unknown_0x43BF2
	ld a,l
	ld [$FF00+$92],a
	ret

Unknown_0x43C15:
	ld a,[$DA2D]
	and $07
	ret nz
	ld bc,$9980
	ld a,[$DF33]
	and a
	ret z
	dec a
	ld [$DF33],a
	add a,c
	ld c,a
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld a,$06
	ld [$FF00+$81],a
	ld de,$D080
	ld a,[$DF33]
	add a,e
	ld e,a

Unknown_0x43C3A:
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld [hl],$01
	inc l
	ld a,[de]
	ld [hl],a
	inc l
	ld a,e
	add a,$20
	ld e,a
	jr nc,Unknown_0x43C4B
	inc d

Unknown_0x43C4B:
	ld a,c
	add a,$20
	ld c,a
	jr nc,Unknown_0x43C52
	inc b

Unknown_0x43C52:
	ld a,[$FF00+$81]
	dec a
	ld [$FF00+$81],a
	jr nz,Unknown_0x43C3A
	ld a,l
	ld [$FF00+$92],a
	ret

UnknownData_0x43C5D:
INCBIN "baserom.gb", $43C5D, $43C90 - $43C5D

Unknown_0x43C90:
	ld hl,$CFA0
	ld a,[hl]
	ld hl,$98A0
	ld b,$20

Unknown_0x43C99:
	ld [hli],a
	dec b
	jr nz,Unknown_0x43C99
	ld hl,$CFC0
	ld a,[hl]
	ld hl,$98C0
	ld b,$20

Unknown_0x43CA6:
	ld [hli],a
	dec b
	jr nz,Unknown_0x43CA6
	ld hl,$D060
	ld a,[hl]
	ld hl,$9960
	ld b,$20

Unknown_0x43CB3:
	ld [hli],a
	dec b
	jr nz,Unknown_0x43CB3
	ld hl,$D080
	ld a,[hl]
	ld hl,$9980
	ld b,$20

Unknown_0x43CC0:
	ld [hli],a
	dec b
	jr nz,Unknown_0x43CC0
	ret

UnknownData_0x43CC5:
INCBIN "baserom.gb", $43CC5, $44000 - $43CC5

SECTION "Bank11", ROMX, BANK[$11]

UnknownData_0x44000:
INCBIN "baserom.gb", $44000, $48000 - $44000

SECTION "Bank12", ROMX, BANK[$12]

UnknownData_0x48000:
INCBIN "baserom.gb", $48000, $4C000 - $48000

SECTION "Bank13", ROMX, BANK[$13]

UnknownData_0x4C000:
INCBIN "baserom.gb", $4C000, $50000 - $4C000

SECTION "Bank14", ROMX, BANK[$14]

UnknownData_0x50000:
INCBIN "baserom.gb", $50000, $54000 - $50000

SECTION "Bank15", ROMX, BANK[$15]

UnknownData_0x54000:
INCBIN "baserom.gb", $54000, $58000 - $54000

SECTION "Bank16", ROMX, BANK[$16]

UnknownData_0x58000:
INCBIN "baserom.gb", $58000, $5C000 - $58000

SECTION "Bank17", ROMX, BANK[$17]

UnknownData_0x5C000:
INCBIN "baserom.gb", $5C000, $60000 - $5C000

SECTION "Bank18", ROMX, BANK[$18]

UnknownData_0x60000:
INCBIN "baserom.gb", $60000, $6027B - $60000

Unknown_0x6027B:
INCBIN "baserom.gb", $6027B, $61A1C - $6027B

Unknown_0x61A1C:
INCBIN "baserom.gb", $61A1C, $61ADA - $61A1C

Unknown_0x61ADA:
INCBIN "baserom.gb", $61ADA, $61B1B - $61ADA

Unknown_0x61B1B:
INCBIN "baserom.gb", $61B1B, $62011 - $61B1B

Unknown_0x62011:
INCBIN "baserom.gb", $62011, $6249F - $62011

Unknown_0x6249F:
INCBIN "baserom.gb", $6249F, $62B11 - $6249F

Unknown_0x62B11:
INCBIN "baserom.gb", $62B11, $62D6B - $62B11

Unknown_0x62D6B:
INCBIN "baserom.gb", $62D6B, $6349E - $62D6B
	push de
	push bc
	call Unknown_0x3DB8
	pop bc
	pop de
	ret
	ld a,[$DD2F]
	inc a
	ld e,$27
	ld [de],a
	ret
	push de
	push bc
	call Unknown_0x3D65
	pop bc
	pop de
	ret
	push bc
	ld bc,$9C60
	jr Unknown_0x634C0
	push bc
	ld bc,$9CC0

Unknown_0x634C0:
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld a,$14
	ld [hl],a
	inc l
	ld b,a
	ld a,$1D

Unknown_0x634D0:
	ld [hl],a
	inc l
	dec b
	jr nz,Unknown_0x634D0
	ld a,l
	ld [$FF00+$92],a
	pop bc
	ret
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld a,$6E
	ld [hl],a
	inc l
	ld a,$9C
	ld [hl],a
	inc l
	ld [hl],$01
	inc l
	ld [hl],$28
	inc l
	ld a,l
	ld [$FF00+$92],a
	ret
	ld a,$01
	ld [$DF37],a
	ret

UnknownData_0x634F7:
INCBIN "baserom.gb", $634F7, $636E5 - $634F7
	call Unknown_0x2B13
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld e,$0E
	ld a,[de]
	and a
	ret nz
	ld e,$40
	ld a,[de]
	cp $04
	jr c,Unknown_0x63707
	xor a
	ld [de],a
	ld a,[$DA01]
	dec a
	ld [$DA01],a
	ret

Unknown_0x63707:
	inc a
	ld [de],a
	ret
	call Unknown_0x0357
	ld a,[$FF00+$9A]
	ld d,a
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x63726
	bit 1,a
	jr nz,Unknown_0x63726
	bit 3,a
	ret z

Unknown_0x63726:
	ld [$DD2D],a
	ret
	ld a,[$DF37]
	ld e,$27
	ld [de],a
	ret
	ld a,$01
	ld [$DF38],a
	ret
	ld a,[$DF38]
	ld e,$27
	ld [de],a
	ret

UnknownData_0x6373E:
INCBIN "baserom.gb", $6373E, $64000 - $6373E

SECTION "Bank19", ROMX, BANK[$19]
	ld bc,$1777
	ld hl,$5AA4
	ld a,$07
	call Unknown_0x05CF
	xor a
	ld [$DF17],a
	call Unknown_0x1584
	ld hl,$DF19
	ld [hli],a
	ld [hl],a
	ld [$DF1B],a
	ld [$DA2E],a
	ld [$DA2F],a
	ld e,$FF
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	ld a,$19
	call Unknown_0x640CD

Unknown_0x6402F:
	call Unknown_0x0496
	call Unknown_0x086B
	call Unknown_0x04AE
	call Unknown_0x0343
	ld a,[$DF18]
	ld h,a
	ld l,$00
	ld a,[hl]
	inc a
	jr nz,Unknown_0x6402F
	ld a,[$DF17]
	cp $03
	jr z,Unknown_0x64068
	cp $04
	jr z,Unknown_0x64068
	cp $06
	jr nc,Unknown_0x64083
	ld hl,$40BB
	add a,l
	ld l,a
	jr nc,Unknown_0x6405C
	inc h

Unknown_0x6405C:
	ld a,[hl]
	ld d,a
	ld e,$04
	ld hl,$4271
	ld a,$1A
	call Unknown_0x05CF

Unknown_0x64068:
	call Unknown_0x0437
	ld a,[$DF17]
	ld hl,$40C1
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x64077
	inc h

Unknown_0x64077:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	call Unknown_0x0620
	ld hl,$DF17
	inc [hl]
	jr Unknown_0x6402F

Unknown_0x64083:
	call Unknown_0x0496
	call Unknown_0x04AE
	call Unknown_0x0343
	call Unknown_0x0357
	ld a,[$FF00+$A5]
	bit 0,a
	jr nz,Unknown_0x64099
	bit 3,a
	jr z,Unknown_0x64083

Unknown_0x64099:
	ld e,$FF
	ld hl,$4232
	ld a,$1F
	call Unknown_0x05CF
	ld a,[$DF0A]
	cp $04
	ld de,$1505
	jr nz,Unknown_0x640B0
	ld de,$1705

Unknown_0x640B0:
	ld hl,$427B
	ld a,$1A
	call Unknown_0x05CF
	jp Unknown_0x0437

UnknownData_0x640BB:
INCBIN "baserom.gb", $640BB, $640CD - $640BB

Unknown_0x640CD:
	call Unknown_0x64233
	call Unknown_0x64218
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	ld a,$DA
	ld hl,$A0B3
	call Unknown_0x07C4
	ld a,h
	ld [$DF18],a
	ld a,$E4
	ld [$CD09],a
	ld a,$D0
	ld [$CD0A],a
	ld a,$E4
	ld [$CD0B],a
	ld a,$47
	ld [$FF00+$40],a
	call Unknown_0x046D
	ld de,$0D16
	push de
	ld a,e
	cp $FF
	jr z,Unknown_0x6410E
	ld hl,$6011
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x6410E:
	push af
	ld hl,$5DF3
	ld a,$1E
	call Unknown_0x05CF
	call Unknown_0x0357
	pop af
	dec a
	jr nz,Unknown_0x6410E
	pop de
	ld e,$04
	ld hl,$4246
	ld a,$1A
	call Unknown_0x05CF
	ret
	call Unknown_0x64251
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	ld a,$DB
	ld hl,$A0B3
	call Unknown_0x07C4
	ld a,h
	ld [$DF18],a
	ld a,$E4
	ld [$CD09],a
	ld de,$0F17
	jp Unknown_0x6434C
	call Unknown_0x6426F
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	ld a,$DB
	ld hl,$A0B3
	call Unknown_0x07C4
	ld a,h
	ld [$DF18],a
	ld a,$E4
	ld [$CD09],a
	ld de,$1018
	jp Unknown_0x6434C
	call Unknown_0x6428D
	call Unknown_0x6422A
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	ld a,$DC
	ld hl,$A0B3
	call Unknown_0x07C4
	ld a,h
	ld [$DF18],a
	ld a,$E4
	ld [$CD09],a
	ld de,$1119
	jp Unknown_0x6434C
	call Unknown_0x642AB
	call Unknown_0x64218
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	ld a,$DE
	ld hl,$A0B3
	call Unknown_0x07C4
	ld a,h
	ld [$DF18],a
	ld a,$D2
	ld [$CD09],a
	ld de,$121B
	jp Unknown_0x6434C
	call Unknown_0x642C9
	call Unknown_0x64221
	ld hl,$4000
	ld a,$08
	call Unknown_0x05CF
	ld a,$E2
	ld hl,$A0B3
	call Unknown_0x07C4
	ld a,h
	ld [$DF18],a
	ld a,$E8
	ld [$FF00+$42],a
	ld [$DA2E],a
	ld a,$E4
	ld [$CD09],a
	ld de,$141C
	jp Unknown_0x6434C
	call Unknown_0x64305
	xor a
	ld [$FF00+$42],a
	ld [$FF00+$43],a
	ld [$DA00],a
	ld [$DA01],a
	ld [$DA2E],a
	ld [$DA2F],a
	ld a,$E4
	ld [$CD09],a
	ld hl,$5ADA
	ld a,$07
	call Unknown_0x05CF
	ld a,[$DF0A]
	cp $04
	jr z,Unknown_0x64212
	ld de,$161E
	jp Unknown_0x6434C

Unknown_0x64212:
	ld de,$1823
	jp Unknown_0x6434C

Unknown_0x64218:
	ld hl,Unknown_0x64F74
	ld de,$8000
	jp Unknown_0x0708

Unknown_0x64221:
	ld hl,Unknown_0x65193
	ld de,$8000
	jp Unknown_0x0708

Unknown_0x6422A:
	ld hl,Unknown_0x65635
	ld de,$8000
	jp Unknown_0x0708

Unknown_0x64233:
	ld hl,Unknown_0x65B87
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,Unknown_0x6729C
	ld de,$9800
	jp Unknown_0x0708

Unknown_0x64251:
	ld hl,Unknown_0x65F00
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,Unknown_0x6731C
	ld de,$9800
	jp Unknown_0x0708

Unknown_0x6426F:
	ld hl,Unknown_0x662A4
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,Unknown_0x673C9
	ld de,$9800
	jp Unknown_0x0708

Unknown_0x6428D:
	ld hl,Unknown_0x6668B
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,$7478
	ld de,$9800
	jp Unknown_0x0708

Unknown_0x642AB:
	ld hl,Unknown_0x66BA8
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,Unknown_0x6752C
	ld de,$9800
	jp Unknown_0x0708

Unknown_0x642C9:
	ld hl,Unknown_0x66DFC
	ld de,$8000
	call Unknown_0x0708
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,Unknown_0x675BC
	ld de,$CF00
	call Unknown_0x0708
	ld hl,$CF00
	ld de,$9800
	ld bc,$0400
	call Unknown_0x0621
	ld a,l
	ld [$DF1C],a
	ld a,h
	ld [$DF1D],a
	ld hl,$DF1E
	ld bc,$9800
	ld a,c
	ld [hli],a
	ld [hl],b
	ret

Unknown_0x64305:
	ld a,[$DF0A]
	cp $04
	jr z,Unknown_0x6432C
	ld a,$1A
	ld hl,$543D
	ld de,$8000
	call Unknown_0x060D
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,Unknown_0x67732
	ld de,$9800
	jp Unknown_0x0708

Unknown_0x6432C:
	ld a,$1A
	ld hl,$58FF
	ld de,$8000
	call Unknown_0x060D
	ld hl,$8000
	ld de,$9000
	ld bc,$0800
	call Unknown_0x0621
	ld hl,$7815
	ld de,$9800
	jp Unknown_0x0708

Unknown_0x6434C:
	push de
	ld a,$D0
	ld [$CD0A],a
	ld a,$E4
	ld [$CD0B],a
	ld a,$47
	ld [$FF00+$40],a
	call Unknown_0x046D
	pop de
	push de
	ld a,e
	cp $FF
	jr z,Unknown_0x6436D
	ld hl,$6011
	ld a,$1E
	call Unknown_0x05CF

Unknown_0x6436D:
	pop de
	ld e,$04
	ld hl,$4246
	ld a,$1A
	call Unknown_0x05CF
	ret

UnknownData_0x64379:
INCBIN "baserom.gb", $64379, $643F9 - $64379
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	call Unknown_0x0357
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x64409:
INCBIN "baserom.gb", $64409, $64426 - $64409
	push bc
	ld de,$1104
	ld hl,$4292
	ld a,$1A
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x64437:
INCBIN "baserom.gb", $64437, $6446E - $64437
	push bc
	ld de,$1204
	ld hl,$4292
	ld a,$1A
	call Unknown_0x05CF
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x6447F:
INCBIN "baserom.gb", $6447F, $64BBD - $6447F
	call Unknown_0x0357
	ld a,[$FF00+$9A]
	ld d,a
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	call Unknown_0x64F02
	ld hl,$DF1B
	bit 1,[hl]
	ret nz
	ld hl,$DF1A
	ld bc,$002C
	ld a,c
	add a,[hl]
	ld [hl],a
	ld hl,$DA2E
	ld a,b
	adc a,[hl]
	ld [hl],a
	ld hl,$DF1B
	bit 0,[hl]
	jr nz,Unknown_0x64BFD
	ld a,[$DA2E]
	and $07
	jr nz,Unknown_0x64BFA
	bit 2,[hl]
	ret z
	res 2,[hl]
	jp Unknown_0x64C0F

Unknown_0x64BFA:
	set 2,[hl]
	ret

Unknown_0x64BFD:
	bit 2,[hl]
	jr nz,Unknown_0x64C0A
	ld a,[$DA2E]
	cp $80
	ret nz
	set 1,[hl]
	ret

Unknown_0x64C0A:
	res 2,[hl]
	jp Unknown_0x64C0F

Unknown_0x64C0F:
	ld h,$C4
	ld a,[$FF00+$92]
	ld l,a
	ld bc,$DF1E
	ld a,[bc]
	ld [hl],a
	inc l
	inc bc
	ld a,[bc]
	ld [hl],a
	inc l
	ld [hl],$20
	inc l
	ld bc,$DF1C
	ld a,[bc]
	inc bc
	ld e,a
	ld a,[bc]
	ld b,a
	ld c,e
	ld e,$20

Unknown_0x64C2C:
	ld a,[bc]
	ld [hl],a
	inc l
	inc bc
	dec e
	jr nz,Unknown_0x64C2C
	ld a,l
	ld [$FF00+$92],a
	ld hl,$DF1C
	ld a,c
	ld [hli],a
	ld [hl],b
	ld hl,$DF1E
	ld a,$20
	add a,[hl]
	ld [hli],a
	ld a,$00
	adc a,[hl]
	ld [hl],a
	cp $9C
	ret nz
	ld hl,$DF1B
	set 0,[hl]
	ret

UnknownData_0x64C50:
INCBIN "baserom.gb", $64C50, $64EE6 - $64C50
	ld a,$D0
	sub $18
	ld [$DF20],a
	ret
	push bc
	ld e,$1A
	ld hl,$6035
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld hl,$DA2F
	inc [hl]
	pop bc
	ret

Unknown_0x64F02:
	ld hl,$DF19
	ld bc,$FFC0
	ld a,c
	add a,[hl]
	ld [hl],a
	ld hl,$DA2F
	ld a,b
	adc a,[hl]
	ld [hl],a
	ret
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	call Unknown_0x64F02
	ld e,$15
	ld a,[de]
	cp $FF
	ret z
	ld e,$04
	ld a,[de]
	ld hl,$DA2F
	add a,[hl]
	add a,$18
	ld e,a
	and $F8
	cp e
	jr z,Unknown_0x64F35
	add a,$08

Unknown_0x64F35:
	ld e,a
	ld a,[$DF20]
	ld b,$26
	rlca
	rl b
	rlca
	rl b
	and $E0
	ld c,a
	ld a,e
	rra
	rra
	rra
	and $1F
	add a,c
	ld c,a
	ld h,$C4
	ld a,[$FF00+$92]
	ld l,a
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld [hl],$01
	inc l
	ld [hl],$28
	inc l
	ld a,$20
	add a,c
	ld [hl],a
	inc l
	ld a,b
	adc a,$00
	ld [hl],a
	inc l
	ld [hl],$01
	inc l
	ld [hl],$29
	inc l
	ld a,l
	ld [$FF00+$92],a
	ret
	ld a,d
	ld [$DF18],a
	ret

Unknown_0x64F74:
INCBIN "baserom.gb", $64F74, $65193 - $64F74

Unknown_0x65193:
INCBIN "baserom.gb", $65193, $65635 - $65193

Unknown_0x65635:
INCBIN "baserom.gb", $65635, $65B87 - $65635

Unknown_0x65B87:
INCBIN "baserom.gb", $65B87, $65F00 - $65B87

Unknown_0x65F00:
INCBIN "baserom.gb", $65F00, $662A4 - $65F00

Unknown_0x662A4:
INCBIN "baserom.gb", $662A4, $6668B - $662A4

Unknown_0x6668B:
INCBIN "baserom.gb", $6668B, $66BA8 - $6668B

Unknown_0x66BA8:
INCBIN "baserom.gb", $66BA8, $66DFC - $66BA8

Unknown_0x66DFC:
INCBIN "baserom.gb", $66DFC, $6729C - $66DFC

Unknown_0x6729C:
INCBIN "baserom.gb", $6729C, $6731C - $6729C

Unknown_0x6731C:
INCBIN "baserom.gb", $6731C, $673C9 - $6731C

Unknown_0x673C9:
INCBIN "baserom.gb", $673C9, $6752C - $673C9

Unknown_0x6752C:
INCBIN "baserom.gb", $6752C, $675BC - $6752C

Unknown_0x675BC:
INCBIN "baserom.gb", $675BC, $67732 - $675BC

Unknown_0x67732:
INCBIN "baserom.gb", $67732, $67B08 - $67732
	push bc
	ld bc,$9DE0
	jr Unknown_0x67B18

UnknownData_0x67B0E:
INCBIN "baserom.gb", $67B0E, $67B14 - $67B0E
	push bc
	ld bc,$9E20

Unknown_0x67B18:
	ld a,[$FF00+$92]
	ld l,a
	ld h,$C4
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld a,$14
	ld [hl],a
	inc l
	ld b,a
	ld a,$FF

Unknown_0x67B28:
	ld [hl],a
	inc l
	dec b
	jr nz,Unknown_0x67B28
	ld a,l
	ld [$FF00+$92],a
	pop bc
	ret
	push bc
	push de
	call Unknown_0x67B3E
	pop de
	pop bc
	ld a,[hl]
	ld e,$43
	ld [de],a
	ret

Unknown_0x67B3E:
	ld hl,$DF35
	ld a,[hli]
	ld c,a
	ld a,[hl]
	ld h,a
	ld l,c
	ld a,[hli]
	and a
	jr nz,Unknown_0x67B67
	inc hl
	ld bc,$9DE1
	ld a,[$FF00+$92]
	ld e,a
	ld d,$C4
	ld a,c
	ld [de],a
	inc e
	ld a,b
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld b,a

Unknown_0x67B5D:
	ld a,[hli]
	ld [de],a
	inc e
	dec b
	jr nz,Unknown_0x67B5D
	ld a,e
	ld [$FF00+$92],a
	inc hl

Unknown_0x67B67:
	ld a,[hli]
	ld bc,$9E20
	add a,c
	ld c,a
	jr nc,Unknown_0x67B70
	inc b

Unknown_0x67B70:
	ld a,[$FF00+$92]
	ld e,a
	ld d,$C4
	ld a,c
	ld [de],a
	inc e
	ld a,b
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld b,a

Unknown_0x67B7F:
	ld a,[hli]
	ld [de],a
	inc e
	dec b
	jr nz,Unknown_0x67B7F
	ld a,e
	ld [$FF00+$92],a
	ld bc,$DF35
	ld a,l
	ld [bc],a
	inc bc
	ld a,h
	ld [bc],a
	ret
	ld hl,$DF35
	ld a,$D1
	ld [hli],a
	ld a,$78
	ld [hl],a
	ret

UnknownData_0x67B9B:
INCBIN "baserom.gb", $67B9B, $68000 - $67B9B

SECTION "Bank1A", ROMX, BANK[$1A]

Unknown_0x68000:
	ld sp,$FFFF

Unknown_0x68003:
	ld a,[$FF00+$44]
	cp $91
	jr nz,Unknown_0x68003
	xor a
	ld [$FF00+$40],a
	ld a,$0A
	ld [$0000],a
	ld hl,$8000
	ld bc,$2000
	ld a,$00
	call Unknown_0x062F
	ld hl,$C000
	ld bc,$2000
	ld a,$00
	call Unknown_0x062F
	ld sp,$E000
	ld hl,$FE00
	ld bc,$0100
	ld a,$00
	call Unknown_0x062F
	ld hl,$FF80
	ld bc,$007F
	ld a,$00
	call Unknown_0x062F
	ld hl,$A000
	ld bc,$1C00
	ld a,$00
	call Unknown_0x062F
	xor a
	ld [$FF00+$0F],a
	ld a,$07
	ld [$FF00+$FF],a
	ld a,$FF
	ld [$FF00+$05],a
	ld a,$BC
	ld [$FF00+$06],a
	xor a
	ld [$FF00+$07],a
	ld a,$40
	ld [$FF00+$41],a
	ld a,$FF
	ld [$FF00+$45],a
	ld [$DA29],a
	ld a,$1A
	call Unknown_0x05F3
	ld hl,Unknown_0x680E8
	ld de,$FF88
	ld bc,$000A
	call Unknown_0x0621
	ld hl,$DA21
	ld a,$02
	ld [hld],a
	ld [hl],$2B
	xor a
	ld [$DA1C],a
	ld a,$1E
	ld hl,$4232
	call Unknown_0x05E5
	ld a,$07
	ld hl,Unknown_0x697BC
	call Unknown_0x05E5
	ld a,$07
	ld hl,$401D
	call Unknown_0x05E5
	xor a
	ld [$FF00+$47],a
	ld [$CD00],a
	ld [$FF00+$48],a
	ld [$CD01],a
	ld [$FF00+$49],a
	ld [$CD02],a
	ld [$FF00+$42],a
	ld [$FF00+$43],a
	ld [$FF00+$4A],a
	ld [$FF00+$4B],a
	ld [$DA2B],a
	ld a,$C0
	ld [$DA08],a
	ld a,$C2
	ld [$DA28],a
	ld a,$C3
	ld [$DA10],a
	ld hl,$0342
	call Unknown_0x0604
	ld hl,$DA13
	ld a,$C3
	ld [hli],a
	ld a,$42
	ld [hli],a
	ld [hl],$03
	ld hl,$DA16
	ld a,$42
	ld [hli],a
	ld [hl],$03
	ei
	ld a,$04
	ld [$FF00+$07],a
	jp Unknown_0x10DE

Unknown_0x680E8:
INCBIN "baserom.gb", $680E8, $681E0 - $680E8

Unknown_0x681E0:
	ld a,[$DEED]
	or a
	ret z
	pop hl
	ld a,d
	ld hl,$40F2
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x681F0
	inc h

Unknown_0x681F0:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[hl]
	ld c,a
	ld de,$CD0C
	ld [de],a
	inc e
	ld b,$00
	add hl,bc

Unknown_0x681FD:
	ld a,[hld]
	ld [de],a
	inc e
	dec c
	jr nz,Unknown_0x681FD
	jr Unknown_0x68235

Unknown_0x68205:
	ld a,[$DEED]
	or a
	ret z
	pop hl
	ld a,d
	ld hl,$40F2
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x68215
	inc h

Unknown_0x68215:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[hli]
	ld c,a
	ld de,$CD0C
	ld [de],a
	inc e
	inc hl

Unknown_0x68220:
	ld a,[hli]
	ld [de],a
	inc e
	dec c
	jr nz,Unknown_0x68220
	ld hl,$CD09
	ld de,$CD00
	ld b,$03

Unknown_0x6822E:
	ld a,[hli]
	ld [de],a
	ld [$FF00+c],a
	inc e
	dec b
	jr nz,Unknown_0x6822E

Unknown_0x68235:
	ld a,$0D
	ld [$DA34],a
	ld a,$01
	ld [$DA38],a
	ld a,$04
	ld [$FF00+$84],a
	jp Unknown_0x682CA
	ld a,$FF
	ld [$DA37],a
	call Unknown_0x68205
	ld a,e
	ld [$FF00+$84],a
	ld a,[$CD00]
	or a
	ld a,$00
	jr z,Unknown_0x6825B
	ld a,$01

Unknown_0x6825B:
	ld [$DA35],a
	ld hl,$CD08
	ld de,$CD0B
	ld c,$06

Unknown_0x68266:
	ld a,[de]
	dec e
	call Unknown_0x682DD
	ld [hld],a
	dec c
	jr nz,Unknown_0x68266
	jr Unknown_0x682C5
	call Unknown_0x68292
	jr Unknown_0x68283
	call Unknown_0x6829A
	jr Unknown_0x68283
	call Unknown_0x682A4
	jr Unknown_0x68283
	call Unknown_0x682AC

Unknown_0x68283:
	ld a,$01
	ld [$DA39],a
	call Unknown_0x0343
	ld a,[$DA36]
	or a
	jr nz,Unknown_0x68283
	ret

Unknown_0x68292:
	ld a,$01
	ld [$DA37],a
	call Unknown_0x681E0

Unknown_0x6829A:
	ld a,$01
	ld [$DA35],a
	ld a,e
	ld [$FF00+$84],a
	jr Unknown_0x682B4

Unknown_0x682A4:
	ld a,$00
	ld [$DA37],a
	call Unknown_0x681E0

Unknown_0x682AC:
	ld a,$00
	ld [$DA35],a
	ld a,e
	ld [$FF00+$84],a

Unknown_0x682B4:
	ld hl,$CD03
	ld de,$CD00
	ld c,$09

Unknown_0x682BC:
	ld a,[de]
	inc e
	call Unknown_0x682DD
	ld [hli],a
	dec c
	jr nz,Unknown_0x682BC

Unknown_0x682C5:
	ld a,$03
	ld [$DA34],a

Unknown_0x682CA:
	ld a,[$FF00+$84]
	ld [$DA32],a
	ld [$DA33],a
	ld a,$01
	ld [$DA36],a
	ld hl,$0684
	jp Unknown_0x05F9

Unknown_0x682DD:
	ld b,a
	ld a,[$DA35]
	cp $00
	ld a,b
	jr nz,Unknown_0x68305
	ld b,a
	and $C0
	ld a,b
	jr z,Unknown_0x682EF
	sub $40
	ld b,a

Unknown_0x682EF:
	and $30
	ld a,b
	jr z,Unknown_0x682F7
	sub $10
	ld b,a

Unknown_0x682F7:
	and $0C
	ld a,b
	jr z,Unknown_0x682FF
	sub $04
	ld b,a

Unknown_0x682FF:
	and $03
	ld a,b
	ret z
	dec a
	ret

Unknown_0x68305:
	ld b,a
	and $C0
	cp $C0
	ld a,b
	jr z,Unknown_0x68310
	add a,$40
	ld b,a

Unknown_0x68310:
	and $30
	cp $30
	ld a,b
	jr z,Unknown_0x6831A
	add a,$10
	ld b,a

Unknown_0x6831A:
	and $0C
	cp $0C
	ld a,b
	jr z,Unknown_0x68324
	add a,$04
	ld b,a

Unknown_0x68324:
	and $03
	cp $03
	ld a,b
	ret z
	inc a
	ret

UnknownData_0x6832C:
INCBIN "baserom.gb", $6832C, $6834E - $6832C
	ld bc,$437B
	call Unknown_0x255B
	call Unknown_0x68363
	call Unknown_0x68389
	ret nz
	ld e,$1A
	ld bc,Unknown_0x683A1
	jp Unknown_0x0846

Unknown_0x68363:
	ld a,[$DD2C]
	bit 0,a
	jr nz,Unknown_0x6836D
	bit 1,a
	ret z

Unknown_0x6836D:
	ld e,$39
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ret

UnknownData_0x6837B:
INCBIN "baserom.gb", $6837B, $68389 - $6837B

Unknown_0x68389:
	ld h,$A8

Unknown_0x6838B:
	ld a,h
	cp d
	jr z,Unknown_0x6839A
	ld l,$00
	ld a,[hl]
	inc a
	jr z,Unknown_0x6839A
	ld l,$4C
	ld a,[hl]
	or a
	ret nz

Unknown_0x6839A:
	inc h
	ld a,h
	cp $B2
	jr nz,Unknown_0x6838B
	ret

Unknown_0x683A1:
INCBIN "baserom.gb", $683A1, $683AE - $683A1
	ld bc,$437B
	call Unknown_0x255B
	jp Unknown_0x68363

UnknownData_0x683B7:
INCBIN "baserom.gb", $683B7, $683C2 - $683B7
	ld hl,Unknown_0x692CE
	ld a,$03
	call Unknown_0x05CF
	ret
	ld bc,$437B
	call Unknown_0x255B
	call Unknown_0x68363
	call Unknown_0x2422
	ld a,[$CD4D]
	or a
	ret nz
	ld e,$1A
	ld bc,Unknown_0x68454
	jp Unknown_0x0846
	push bc
	ld hl,$CD4D
	ld a,$01
	ld [hli],a
	ld a,$60
	ld [hli],a
	ld a,$88
	ld [hli],a
	ld a,[$A071]
	ld c,a
	ld e,$5B
	ld a,[de]
	cp $04
	jr z,Unknown_0x68417
	or a
	jr nz,Unknown_0x68414
	ld e,$09
	call Unknown_0x063B
	ld e,$01
	cp $04
	jr c,Unknown_0x68410
	inc e
	cp $06
	jr c,Unknown_0x68410
	inc e

Unknown_0x68410:
	ld a,e
	ld e,$5B
	ld [de],a

Unknown_0x68414:
	cp c
	jr nz,Unknown_0x68430

Unknown_0x68417:
	call Unknown_0x0647
	and $07
	ld a,$04
	jr nz,Unknown_0x68422
	ld a,$05

Unknown_0x68422:
	ld [de],a
	ld bc,$5D91
	ld de,$0240
	jr nz,Unknown_0x68448
	ld bc,$5FD1
	jr Unknown_0x68448

Unknown_0x68430:
	ld bc,$5891
	ld de,$0280
	cp $02
	jr z,Unknown_0x68448
	ld bc,$5631
	ld de,$0260
	jr c,Unknown_0x68448
	ld bc,$5B11
	ld de,$0280

Unknown_0x68448:
	ld [hl],c
	inc l
	ld [hl],b
	inc l
	ld [hl],e
	inc l
	ld [hl],d
	pop bc
	ld a,[$FF00+$9A]
	ld d,a
	ret

Unknown_0x68454:
INCBIN "baserom.gb", $68454, $68463 - $68454
	ld e,$15
	ld bc,$0200
	call Unknown_0x0D35
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 7,a
	jr z,Unknown_0x6847D
	ld e,$1A
	ld bc,Unknown_0x68486
	jp Unknown_0x0846

Unknown_0x6847D:
	ld bc,$437B
	call Unknown_0x255B
	jp Unknown_0x68363

Unknown_0x68486:
INCBIN "baserom.gb", $68486, $68514 - $68486

Unknown_0x68514:
INCBIN "baserom.gb", $68514, $68522 - $68514
	ld e,$15
	ld bc,$0200
	call Unknown_0x0D35
	call Unknown_0x0DA4
	call Unknown_0x1A25
	bit 7,a
	jr z,Unknown_0x6853C
	ld e,$1A
	ld bc,Unknown_0x68514
	jp Unknown_0x0846

Unknown_0x6853C:
	ld bc,$437B
	call Unknown_0x255B
	call Unknown_0x68363
	ld a,[$DD2C]
	bit 3,a
	ret z
	call Unknown_0x2809
	ret c
	ld e,$5B
	ld a,[de]
	cp $04
	jr nc,Unknown_0x6857A
	ld a,[$A051]
	cp $0C
	ret z
	ld e,$5B
	ld a,[de]
	ld [$A043],a
	ld e,$02
	ld bc,Unknown_0x6B340
	call Unknown_0x0C48
	ld hl,$A003
	ld e,l
	ld b,$06

Unknown_0x68570:
	ld a,[de]
	ld [hli],a
	inc e
	dec b
	jr nz,Unknown_0x68570

Unknown_0x68576:
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x6857A:
	jr nz,Unknown_0x6859D
	ld a,[$A071]
	or a
	ld hl,$A04C
	ld e,$0C
	ld b,$02
	jr z,Unknown_0x68590
	ld hl,$A072
	ld e,$06
	ld b,$01

Unknown_0x68590:
	ld a,[hl]
	cp e
	jr nc,Unknown_0x68596
	add a,b
	ld [hl],a

Unknown_0x68596:
	ld e,$10
	call Unknown_0x10AA
	jr Unknown_0x68576

Unknown_0x6859D:
	ld hl,$7C7C
	ld a,$03
	call Unknown_0x05CF
	ld a,$01
	ld [$DD62],a
	jr Unknown_0x68576

UnknownData_0x685AC:
INCBIN "baserom.gb", $685AC, $685E3 - $685AC
	push bc
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$5B
	ld a,[hl]
	ld hl,$45FE
	add a,l
	ld l,a
	jr nc,Unknown_0x685F3
	inc h

Unknown_0x685F3:
	ld a,[hl]
	ld h,d
	ld l,$07
	add a,[hl]
	ld [hli],a
	ld a,[hl]
	adc a,$FF
	ld [hl],a
	pop bc
	ret

UnknownData_0x685FF:
INCBIN "baserom.gb", $685FF, $6860D - $685FF

Unknown_0x6860D:
INCBIN "baserom.gb", $6860D, $68613 - $6860D
	call Unknown_0x68389
	ret nz
	ld e,$1A
	ld bc,Unknown_0x6860D
	jp Unknown_0x0846

UnknownData_0x6861F:
INCBIN "baserom.gb", $6861F, $6867D - $6861F
	ld e,$3E
	ld a,[de]
	or a
	ld a,$08
	jr z,Unknown_0x68687
	ld a,$03

Unknown_0x68687:
	ld e,$24
	ld [de],a
	ret
	push bc
	call Unknown_0x1964
	pop bc
	ret
	ld e,$0E
	ld a,[de]
	rla
	ld e,$15
	ld a,[de]
	jr nc,Unknown_0x686A3
	dec a
	cp $06
	jr nz,Unknown_0x686AA
	ld a,$0A
	jr Unknown_0x686AA

Unknown_0x686A3:
	inc a
	cp $0B
	jr nz,Unknown_0x686AA
	ld a,$07

Unknown_0x686AA:
	ld [de],a
	ret
	ld e,$3E
	ld a,[de]
	or a
	ld e,$15
	ld bc,$0200
	jr z,Unknown_0x686BC
	ld e,$04
	ld bc,$0030

Unknown_0x686BC:
	call Unknown_0x0D35
	call Unknown_0x0DA4
	ld e,$3E
	ld a,[de]
	or a
	jr nz,Unknown_0x686E1
	call Unknown_0x1AB3
	jr nz,Unknown_0x686E1
	ld a,$01
	ld e,$3E
	ld [de],a
	ld e,$0D
	xor a
	ld [de],a
	inc e
	ld [de],a
	ld e,$3A
	ld a,$78
	ld [de],a
	inc e
	ld a,$00
	ld [de],a

Unknown_0x686E1:
	call Unknown_0x1A25
	ld b,a
	bit 7,b
	jr z,Unknown_0x686FC
	ld e,$3E
	ld a,[de]
	or a
	ld hl,$FD80
	jr z,Unknown_0x686F5
	ld hl,$0000

Unknown_0x686F5:
	ld e,$0F
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a

Unknown_0x686FC:
	bit 5,b
	jr z,Unknown_0x6870D
	ld e,$0D
	ld a,[de]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[de]
	cpl
	adc a,$00
	ld [de],a

Unknown_0x6870D:
	ld a,b
	and $A0
	jr z,Unknown_0x6871F
	ld e,$41
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a

Unknown_0x6871F:
	ld e,$3D
	ld a,[de]
	or a
	jr z,Unknown_0x68729
	dec a
	ld [de],a
	jr Unknown_0x68736

Unknown_0x68729:
	ld bc,$4766
	call Unknown_0x255B
	ret c
	ld a,[$A05B]
	inc a
	jr nz,Unknown_0x68745

Unknown_0x68736:
	ld h,d
	ld l,$3A
	ld a,[hl]
	sub $01
	ld [hli],a
	jr nc,Unknown_0x6874D
	ld a,[hl]
	sub $01
	ld [hl],a
	jr nc,Unknown_0x6874D

Unknown_0x68745:
	ld e,$03
	ld bc,Unknown_0x68E33
	jp Unknown_0x0846

Unknown_0x6874D:
	ld e,$40
	ld a,[de]
	or a
	jr z,Unknown_0x68757
	dec a
	ld [de],a
	jr Unknown_0x68765

Unknown_0x68757:
	push de
	call Unknown_0x1AEA
	call Unknown_0x1646
	pop de
	and $7F
	cp $08
	jr z,Unknown_0x68745

Unknown_0x68765:
	ret

UnknownData_0x68766:
INCBIN "baserom.gb", $68766, $687F6 - $68766
	ld e,$5B
	ld a,[de]
	ld e,a
	ld hl,$DB60
	ld a,[hl]
	call Unknown_0x162A
	and a
	ret z
	ld e,$27
	ld [de],a
	ret

UnknownData_0x68807:
INCBIN "baserom.gb", $68807, $68829 - $68807
	ld a,[$DB60]
	ld e,a
	inc e
	ld a,[$DB6A]

Unknown_0x68831:
	rra
	dec e
	jr nz,Unknown_0x68831
	ld a,$00
	rla
	ld e,$27
	ld [de],a
	ret

UnknownData_0x6883C:
INCBIN "baserom.gb", $6883C, $6887A - $6883C
	push bc
	push de
	ld e,$0C
	ld hl,$42AC
	ld a,$1A
	call Unknown_0x05CF
	pop de
	pop bc
	ret
	ld a,$07
	ld [$A082],a
	ret

UnknownData_0x6888F:
INCBIN "baserom.gb", $6888F, $68A81 - $6888F
	ld a,$06
	ld [$A082],a
	ret
	ld a,[$DD63]
	or $80
	inc a
	ld e,$27
	ld [de],a
	ret
	ld a,$01
	ld [$DF16],a
	ret

UnknownData_0x68A97:
INCBIN "baserom.gb", $68A97, $68E33 - $68A97

Unknown_0x68E33:
INCBIN "baserom.gb", $68E33, $68EA6 - $68E33
	ld hl,$A082
	ld [hl],$03
	ret
	ld e,$39
	jp Unknown_0x101A
	ld a,[$A845]
	ld e,$45
	ld [de],a
	cpl
	jr Unknown_0x68EC0
	ld a,[$A045]
	ld e,$39
	ld [de],a

Unknown_0x68EC0:
	ld e,$04
	ld hl,$DB51
	rla
	jr nc,Unknown_0x68EE3
	push bc
	ld a,[hli]
	add a,$A0
	ld c,a
	ld a,[hl]
	adc a,$00
	ld b,a
	pop hl
	ld a,c
	sub [hl]
	inc hl
	ld [de],a
	inc e
	ld a,b
	sbc a,[hl]
	inc hl
	ld [de],a
	ld b,h
	ld c,l
	ret
	ld e,$07
	ld hl,$DB53

Unknown_0x68EE3:
	ld a,[bc]
	inc bc
	add a,[hl]
	inc hl
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	adc a,[hl]
	ld [de],a
	ret

UnknownData_0x68EEE:
INCBIN "baserom.gb", $68EEE, $68FAD - $68EEE
	ld a,[$A045]
	ld e,$45
	ld [de],a
	ret

UnknownData_0x68FB4:
INCBIN "baserom.gb", $68FB4, $692CE - $68FB4

Unknown_0x692CE:
INCBIN "baserom.gb", $692CE, $69434 - $692CE
	call Unknown_0x0C80
	call Unknown_0x0C91
	jp Unknown_0x0DA4

UnknownData_0x6943D:
INCBIN "baserom.gb", $6943D, $697BC - $6943D

Unknown_0x697BC:
INCBIN "baserom.gb", $697BC, $6A0A5 - $697BC
	xor a
	ld hl,$A077
	ld [hli],a
	ld [hl],a
	ret
	ld e,$11
	ld a,[de]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld hl,$A077
	ld a,[hl]
	add a,c
	ld [hli],a
	ld a,[hl]
	adc a,b
	ld [hl],a
	ld a,[$DB3D]
	dec a
	ld hl,$DB52
	cp [hl]
	jr nz,Unknown_0x6A0CB
	ld a,$01
	ld [$DF24],a

Unknown_0x6A0CB:
	ret

UnknownData_0x6A0CC:
INCBIN "baserom.gb", $6A0CC, $6A128 - $6A0CC
	ld hl,$7C7C
	ld a,$03
	call Unknown_0x05CF
	ret
	ld a,[$DB60]
	call Unknown_0x0663
	ld hl,$DB6C
	or [hl]
	ld [hl],a
	ret
	ld hl,$A019
	set 5,[hl]
	ld l,$1C
	set 5,[hl]
	ld l,$1F
	set 5,[hl]
	ret
	ld a,$01
	ld [$DF24],a
	ret
	ld a,[$DF22]
	jr Unknown_0x6A163
	ld a,[$DF24]
	jr Unknown_0x6A163
	ld a,[$DF23]
	jr Unknown_0x6A163
	ld a,[$DB60]

Unknown_0x6A163:
	ld e,$27
	ld [de],a
	ret
	ld a,$05
	ld [$A082],a
	ret
	ld a,[$DB60]
	or a
	ld e,$0A
	jr nz,Unknown_0x6A177
	ld e,$10

Unknown_0x6A177:
	xor a
	ld hl,$DF22

Unknown_0x6A17B:
	ld [hli],a
	dec e
	jr nz,Unknown_0x6A17B
	ret
	push bc
	ld e,$1A
	ld bc,$618B
	call Unknown_0x0C3A
	pop bc
	ret

UnknownData_0x6A18B:
INCBIN "baserom.gb", $6A18B, $6A204 - $6A18B
	ld a,$01
	ld [$DF22],a
	ret
	push bc
	ld a,[$DB60]
	ld hl,$6221
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x6A217
	inc h

Unknown_0x6A217:
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld b,h
	ld c,l
	call Unknown_0x35BB
	pop bc
	ret

UnknownData_0x6A221:
INCBIN "baserom.gb", $6A221, $6A260 - $6A221
	ld e,$46
	ld a,[de]
	ld [$DF21],a
	ret

UnknownData_0x6A267:
INCBIN "baserom.gb", $6A267, $6A2D8 - $6A267
	ld a,[$DF27]
	ld h,$14
	cp $08
	jr c,Unknown_0x6A2EF
	ld h,$10
	cp $0F
	jr c,Unknown_0x6A2EF
	ld h,$0C
	cp $15
	jr c,Unknown_0x6A2EF
	ld h,$08

Unknown_0x6A2EF:
	ld a,h
	ld e,$24
	ld [de],a
	ret
	ld a,[$DF27]
	sub $1C
	ld e,$27
	ld [de],a
	ret
	ld e,$3C
	ld a,[de]
	ld h,a
	dec a
	ld [de],a
	ld a,h
	ld e,$27
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	inc a
	cp $10
	jr c,Unknown_0x6A311
	xor a

Unknown_0x6A311:
	ld [de],a
	add a,a
	add a,a
	ld h,a
	call Unknown_0x0647
	and $03
	add a,h
	ld hl,$6331
	add a,l
	ld l,a
	jr nc,Unknown_0x6A323
	inc h

Unknown_0x6A323:
	ld a,[hl]
	ld e,$27
	ld [de],a
	cp $04
	jr c,Unknown_0x6A32D
	sub $04

Unknown_0x6A32D:
	ld e,$3C
	ld [de],a
	ret

UnknownData_0x6A331:
INCBIN "baserom.gb", $6A331, $6A37A - $6A331
	ld e,$03
	call Unknown_0x063B
	or a
	jr z,Unknown_0x6A384
	ld a,$01

Unknown_0x6A384:
	ld [$DF2A],a
	cp $01
	jr nz,Unknown_0x6A39C
	ld hl,$DF29
	ld a,[hl]
	cp $0E
	jr nc,Unknown_0x6A396

Unknown_0x6A393:
	inc [hl]
	jr Unknown_0x6A3A8

Unknown_0x6A396:
	xor a

Unknown_0x6A397:
	ld [$DF2A],a
	jr Unknown_0x6A3A8

Unknown_0x6A39C:
	ld hl,$DF28
	ld a,[hl]
	cp $07
	jr c,Unknown_0x6A393
	ld a,$01
	jr Unknown_0x6A397

Unknown_0x6A3A8:
	ld e,$27
	ld a,[$DF2A]
	ld [de],a
	ret

UnknownData_0x6A3AF:
INCBIN "baserom.gb", $6A3AF, $6A4BF - $6A3AF
	ld e,$39
	ld a,[de]
	inc a
	ld [de],a
	ld hl,$64D1
	add a,l
	ld l,a
	jr nc,Unknown_0x6A4CC
	inc h

Unknown_0x6A4CC:
	ld a,[hl]
	ld e,$25
	ld [de],a
	ret

UnknownData_0x6A4D1:
INCBIN "baserom.gb", $6A4D1, $6A8AE - $6A4D1
	ld e,$3A
	ld a,[de]
	or a
	jr z,Unknown_0x6A8BE
	xor a
	ld [de],a
	ld a,$E9
	ld [$DB78],a
	ld [$CD00],a

Unknown_0x6A8BE:
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$68DA
	call Unknown_0x255B
	ld a,[$DF24]
	or a
	ret z
	ld e,$03
	ld bc,Unknown_0x68E33
	jp Unknown_0x0846

UnknownData_0x6A8DA:
INCBIN "baserom.gb", $6A8DA, $6A921 - $6A8DA
	ld e,$03
	call Unknown_0x6ACFB
	ld hl,$692C
	jp Unknown_0x6AD77

UnknownData_0x6A92C:
INCBIN "baserom.gb", $6A92C, $6A97A - $6A92C
	ld e,$04
	ld hl,$DB51
	jr Unknown_0x6A986
	ld e,$07
	ld hl,$DB53

Unknown_0x6A986:
	ld a,[bc]
	inc bc
	add a,[hl]
	inc hl
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	adc a,[hl]
	ld [de],a
	ret

UnknownData_0x6A991:
INCBIN "baserom.gb", $6A991, $6A9A5 - $6A991
	ld hl,$DF27
	inc [hl]
	ld hl,$DF2B
	ld a,[hl]
	or a
	jr z,Unknown_0x6A9BB
	ld [hl],$00
	ld hl,$DF2A
	ld a,[hl]
	xor $01
	ld [hl],a
	jr Unknown_0x6A9CE

Unknown_0x6A9BB:
	call Unknown_0x0647
	and $01
	ld hl,$DF2A
	ld e,[hl]
	ld [hl],a
	cp e
	jr nz,Unknown_0x6A9CE
	ld a,$01
	ld [$DF2B],a
	ld a,e

Unknown_0x6A9CE:
	cp $01
	jr nz,Unknown_0x6A9E3
	ld hl,$DF29
	ld a,[hl]
	cp $0E
	jr nc,Unknown_0x6A9DD

Unknown_0x6A9DA:
	inc [hl]
	jr Unknown_0x6A9EF

Unknown_0x6A9DD:
	xor a

Unknown_0x6A9DE:
	ld [$DF2A],a
	jr Unknown_0x6A9EF

Unknown_0x6A9E3:
	ld hl,$DF28
	ld a,[hl]
	cp $0E
	jr c,Unknown_0x6A9DA
	ld a,$01
	jr Unknown_0x6A9DE

Unknown_0x6A9EF:
	ld e,$27
	ld a,[$DF2A]
	ld [de],a
	ret

UnknownData_0x6A9F6:
INCBIN "baserom.gb", $6A9F6, $6ACE3 - $6A9F6
	ld e,$03
	call Unknown_0x6ACEC
	ld e,$27
	ld [de],a
	ret

Unknown_0x6ACEC:
	ld hl,$DF26
	call Unknown_0x063B
	inc a
	add a,[hl]
	inc e
	cp e
	jr c,Unknown_0x6ACF9
	sub e

Unknown_0x6ACF9:
	ld [hl],a
	ret

Unknown_0x6ACFB:
	ld hl,$DF26
	call Unknown_0x063B
	inc a
	add a,[hl]
	inc e
	inc e

Unknown_0x6AD05:
	cp e
	jr c,Unknown_0x6AD09
	sub e

Unknown_0x6AD09:
	ld hl,$DF25
	cp [hl]
	jr nz,Unknown_0x6AD16
	ld a,[$DF26]
	add a,e
	dec a
	jr Unknown_0x6AD05

Unknown_0x6AD16:
	push af
	ld a,[$DF26]
	ld [hl],a
	pop af
	ld [$DF26],a
	ret
	ld e,$39
	ld a,[de]
	ld e,a
	push bc
	call Unknown_0x10AA
	pop bc
	ret

UnknownData_0x6AD2A:
INCBIN "baserom.gb", $6AD2A, $6AD44 - $6AD2A
	ld e,$05
	call Unknown_0x6ACEC
	ld [$FF00+$84],a
	ld hl,$6D5F
	call Unknown_0x6AD77
	ld a,[$FF00+$84]
	cp $03
	ld a,$40
	jr c,Unknown_0x6AD5B
	ld a,$C0

Unknown_0x6AD5B:
	ld e,$45
	ld [de],a
	ret

UnknownData_0x6AD5F:
INCBIN "baserom.gb", $6AD5F, $6AD77 - $6AD5F

Unknown_0x6AD77:
	push bc
	add a,a
	add a,a
	add a,l
	ld l,a
	jr nc,Unknown_0x6AD7F
	inc h

Unknown_0x6AD7F:
	ld e,$04
	ld bc,$DB51
	ld a,[bc]
	inc bc
	add a,[hl]
	inc hl
	ld [de],a
	inc e
	ld a,[bc]
	inc bc
	adc a,[hl]
	inc hl
	ld [de],a
	inc e
	inc e
	ld a,[bc]
	inc bc
	add a,[hl]
	inc hl
	ld [de],a
	inc e
	ld a,[bc]
	adc a,[hl]
	ld [de],a
	pop bc
	ret

UnknownData_0x6AD9C:
INCBIN "baserom.gb", $6AD9C, $6AE2F - $6AD9C
	ld e,$03
	call Unknown_0x6ACFB
	ld hl,$6E3A
	jp Unknown_0x6AD77

UnknownData_0x6AE3A:
INCBIN "baserom.gb", $6AE3A, $6AE4E - $6AE3A
	ld e,$03
	call Unknown_0x063B
	ld e,$27
	ld [de],a
	ret

UnknownData_0x6AE57:
INCBIN "baserom.gb", $6AE57, $6AEAB - $6AE57
	ld a,[$DF21]
	ld e,$46
	ld [de],a
	ret
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld a,[$DB60]
	cp $02
	ld bc,$6EDD
	jr z,Unknown_0x6AECC
	cp $04
	jr z,Unknown_0x6AECC
	ld bc,$6ECF

Unknown_0x6AECC:
	jp Unknown_0x255B

UnknownData_0x6AECF:
INCBIN "baserom.gb", $6AECF, $6AFCA - $6AECF
	ld a,[$DB51]
	add a,$50
	ld h,a
	ld e,$04
	ld a,[de]
	sub h
	ld a,$40
	jr c,Unknown_0x6AFDA
	ld a,$C0

Unknown_0x6AFDA:
	ld e,$45
	ld [de],a
	ret

UnknownData_0x6AFDE:
INCBIN "baserom.gb", $6AFDE, $6AFE1 - $6AFDE
	xor a
	ld e,$15
	ld [de],a
	call Unknown_0x0C80
	call Unknown_0x0C91
	call Unknown_0x0DA4
	ld bc,$701A
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 3,a
	ret z
	ld e,$10
	call Unknown_0x10AA
	ld hl,$7CD8
	ld a,$03
	call Unknown_0x05CF
	ld hl,$DF23
	inc [hl]
	ld a,[$DB60]
	ld c,a
	ld b,$00
	ld hl,$DF2C
	add hl,bc
	inc [hl]
	ld h,d
	jp Unknown_0x0BBA

UnknownData_0x6B01A:
INCBIN "baserom.gb", $6B01A, $6B340 - $6B01A

Unknown_0x6B340:
INCBIN "baserom.gb", $6B340, $6B48B - $6B340

Unknown_0x6B48B:
INCBIN "baserom.gb", $6B48B, $6C000 - $6B48B

SECTION "Bank1B", ROMX, BANK[$1B]

UnknownData_0x6C000:
INCBIN "baserom.gb", $6C000, $6C27B - $6C000

Unknown_0x6C27B:
INCBIN "baserom.gb", $6C27B, $6DADA - $6C27B

Unknown_0x6DADA:
INCBIN "baserom.gb", $6DADA, $70000 - $6DADA

SECTION "Bank1C", ROMX, BANK[$1C]

UnknownData_0x70000:
INCBIN "baserom.gb", $70000, $74000 - $70000

SECTION "Bank1D", ROMX, BANK[$1D]

UnknownData_0x74000:
INCBIN "baserom.gb", $74000, $7400E - $74000

Unknown_0x7400E:
INCBIN "baserom.gb", $7400E, $7408E - $7400E

Unknown_0x7408E:
INCBIN "baserom.gb", $7408E, $74092 - $7408E

Unknown_0x74092:
INCBIN "baserom.gb", $74092, $740FD - $74092
	ld bc,$4000
	call Unknown_0x233C
	ret nc
	ld e,$1D
	ld bc,Unknown_0x748E5
	jp Unknown_0x0846
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x255B
	ld bc,Unknown_0x7400E
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$0D
	call Unknown_0x0F7A
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$1D
	ld bc,Unknown_0x74131
	jp Unknown_0x0846

Unknown_0x74131:
INCBIN "baserom.gb", $74131, $74162 - $74131

Unknown_0x74162:
INCBIN "baserom.gb", $74162, $74180 - $74162
	call Unknown_0x0647
	and $01
	ld h,d
	ld l,$43
	add a,[hl]
	ld hl,$4015
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x74192
	inc h

Unknown_0x74192:
	ld e,$3D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ld e,$43
	ld a,[de]
	inc a
	cp $03
	jr c,Unknown_0x741A2
	xor a

Unknown_0x741A2:
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	cp $FF
	ret z
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld e,$27
	ld a,[de]
	rlca
	ld hl,$4035
	add a,l
	ld l,a
	jr nc,Unknown_0x741C6
	inc h

Unknown_0x741C6:
	ld e,$3F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld e,$3F
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	cp $FF
	ret z
	ld e,$3F
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

UnknownData_0x741E4:
INCBIN "baserom.gb", $741E4, $74259 - $741E4
	ld hl,$5E9D
	ld a,$06
	call Unknown_0x05CF
	ret
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret

UnknownData_0x74269:
INCBIN "baserom.gb", $74269, $7428B - $74269

Unknown_0x7428B:
INCBIN "baserom.gb", $7428B, $74299 - $7428B

Unknown_0x74299:
INCBIN "baserom.gb", $74299, $742A6 - $74299

Unknown_0x742A6:
INCBIN "baserom.gb", $742A6, $742D9 - $742A6
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x74345
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	jr z,Unknown_0x742EB
	call Unknown_0x1EE6

Unknown_0x742EB:
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x7400E
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x74310
	ld e,$41
	ld a,[de]
	or a
	ret z
	call Unknown_0x7434D
	ret nc
	xor a
	ld e,$41
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	jp Unknown_0x1EF9

Unknown_0x74310:
	ld e,$D5
	ld a,$0E
	call Unknown_0x2319
	ld e,$41
	ld a,[de]
	or a
	jr z,Unknown_0x7433D
	dec a
	jr z,Unknown_0x74335
	ld [de],a
	cp $04
	jr z,Unknown_0x7432D
	ld e,$1D
	ld bc,Unknown_0x7428B
	jp Unknown_0x0846

Unknown_0x7432D:
	ld e,$1D
	ld bc,Unknown_0x742A6
	jp Unknown_0x0846

Unknown_0x74335:
	ld e,$1D
	ld bc,Unknown_0x74162
	jp Unknown_0x0846

Unknown_0x7433D:
	ld e,$1D
	ld bc,$42CC
	jp Unknown_0x0846

Unknown_0x74345:
	ld e,$1D
	ld bc,$48E5
	jp Unknown_0x0846

Unknown_0x7434D:
	ld e,$0E
	ld a,[de]
	rlca
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	jr c,Unknown_0x7435E
	sub [hl]
	cp $93
	ccf
	ret

Unknown_0x7435E:
	sub [hl]
	cp $0D
	ret

UnknownData_0x74362:
INCBIN "baserom.gb", $74362, $74425 - $74362
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x74446
	call Unknown_0x7434D
	ret nc
	xor a
	call Unknown_0x74EFD
	ld e,$1D
	ld bc,$441C
	jp Unknown_0x0846

Unknown_0x74446:
	ld e,$1D
	ld bc,$48E5
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x7448B
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x7400E
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x7446D
	call Unknown_0x7434D
	ret nc
	jp Unknown_0x74EFD

Unknown_0x7446D:
	ld e,$0D
	call Unknown_0x0F7A
	ld e,$D5
	ld a,$0C
	call Unknown_0x2319
	ld e,$D5
	ld a,$0D
	call Unknown_0x2319
	ld a,[$FF00+$9A]
	ld a,d
	ld e,$1D
	ld bc,Unknown_0x74162
	jp Unknown_0x0846

Unknown_0x7448B:
	ld e,$1D
	ld bc,$48E5
	jp Unknown_0x0846
	ld hl,$DB51
	ld e,$45
	ld a,[de]
	rlca
	ld e,$04
	ld a,[de]
	jr c,Unknown_0x744B4
	add a,$38
	sub [hl]
	cp $98
	jr nc,Unknown_0x744B1
	ld h,$A0
	ld l,$04
	cp [hl]
	jr nc,Unknown_0x744B1
	ld a,$01
	jr Unknown_0x744C8

Unknown_0x744B1:
	xor a
	jr Unknown_0x744C8

Unknown_0x744B4:
	sub $38
	jr c,Unknown_0x744B1
	sub [hl]
	jr c,Unknown_0x744B1
	cp $08
	jr c,Unknown_0x744B1
	ld h,$A0
	ld l,$04
	cp [hl]
	jr c,Unknown_0x744B1
	ld a,$01

Unknown_0x744C8:
	ld e,$27
	ld [de],a
	ret
	push bc
	ld hl,Unknown_0x75AB0
	ld a,$04
	call Unknown_0x05CF
	ld l,$41
	ld h,d
	dec [hl]
	jr nz,Unknown_0x744DF
	ld l,$27
	ld [hl],$01

Unknown_0x744DF:
	pop bc
	ret

UnknownData_0x744E1:
INCBIN "baserom.gb", $744E1, $744F8 - $744E1
	ld a,[bc]
	ld e,a
	inc bc
	ld h,$A0
	ld l,$07
	ld a,[hl]
	ld hl,$DB53
	sub [hl]
	cp e
	jr c,Unknown_0x7450B
	ld a,$01
	jr Unknown_0x7450C

Unknown_0x7450B:
	xor a

Unknown_0x7450C:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x74510:
INCBIN "baserom.gb", $74510, $745F0 - $74510

Unknown_0x745F0:
INCBIN "baserom.gb", $745F0, $74604 - $745F0
	call Unknown_0x74622
	ret c
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$458A
	jp Unknown_0x0846
	call Unknown_0x74622
	ret c
	bit 7,a
	ret z
	ld e,$1D
	ld bc,Unknown_0x745F0
	jp Unknown_0x0846

Unknown_0x74622:
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x74640
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x7434D
	jr nc,Unknown_0x74638
	call Unknown_0x74EFD

Unknown_0x74638:
	ld bc,Unknown_0x7400E
	call Unknown_0x24CD
	or a
	ret

Unknown_0x74640:
	ld e,$1D
	ld bc,$48E5
	call Unknown_0x0846
	scf
	ret

UnknownData_0x7464A:
INCBIN "baserom.gb", $7464A, $74674 - $7464A
	call Unknown_0x74622
	ret c
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$4683
	jp Unknown_0x0846

UnknownData_0x74683:
INCBIN "baserom.gb", $74683, $746B1 - $74683
	call Unknown_0x74622
	ret c
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$4162
	jp Unknown_0x0846

UnknownData_0x746C0:
INCBIN "baserom.gb", $746C0, $7472E - $746C0
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x7474F
	call Unknown_0x7434D
	ret nc
	call Unknown_0x74F04
	ld h,d
	ld l,$1F
	ld [hl],$5D
	inc l
	ld [hl],$47
	inc l
	ld [hl],$31
	ret

Unknown_0x7474F:
	ld e,$1D
	ld bc,$48E5
	jp Unknown_0x0846
	ld hl,$409C
	ld e,$41
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	push bc
	ld e,$41
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld b,a
	ld a,h
	ld [de],a
	dec e
	ld a,l
	ld [de],a
	ld a,b
	add a,$06
	ld e,$D5
	call Unknown_0x2319
	pop bc
	ret

UnknownData_0x7477B:
INCBIN "baserom.gb", $7477B, $74863 - $7477B
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x74887
	call Unknown_0x7434D
	ret nc
	call Unknown_0x74F04
	ld h,d
	ld l,$1F
	ld [hl],$5D
	inc l
	ld [hl],$48
	inc l
	ld [hl],$66
	ret

Unknown_0x74887:
	ld e,$1D
	ld bc,$48E5
	jp Unknown_0x0846
	call Unknown_0x0DA4
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x748B6
	call Unknown_0x203D
	ld e,$0E
	ld a,[de]
	jr c,Unknown_0x748B1
	rlca
	jr nc,Unknown_0x748A9

Unknown_0x748A5:
	call Unknown_0x7434D
	ret nc

Unknown_0x748A9:
	ld e,$1D
	ld bc,$4854
	jp Unknown_0x0846

Unknown_0x748B1:
	rlca
	jr c,Unknown_0x748A9
	jr Unknown_0x748A5

Unknown_0x748B6:
	ld e,$1D
	ld bc,$48E5
	jp Unknown_0x0846
	ld bc,$4000
	call Unknown_0x233C
	jr c,Unknown_0x748DD
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,Unknown_0x7400E
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$458A
	jp Unknown_0x0846

Unknown_0x748DD:
	ld e,$1D
	ld bc,$48E5
	jp Unknown_0x0846

Unknown_0x748E5:
INCBIN "baserom.gb", $748E5, $748FD - $748E5
	call Unknown_0x2323
	ret nz
	ld e,$4C
	ld a,[de]
	cp $1F
	ret nc
	ld a,$01
	ld e,$5C
	ld [de],a
	ret

UnknownData_0x7490D:
INCBIN "baserom.gb", $7490D, $74918 - $7490D
	ld hl,Unknown_0x74CE4
	ld a,$03
	call Unknown_0x05CF
	ret

UnknownData_0x74921:
INCBIN "baserom.gb", $74921, $74966 - $74921

Unknown_0x74966:
INCBIN "baserom.gb", $74966, $749B5 - $74966
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4072
	jp Unknown_0x255B
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4072
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x7408E
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld a,$03
	ld e,$D5
	call Unknown_0x2319
	ld a,$04
	ld e,$D5
	call Unknown_0x2319
	ld e,$2E
	ld hl,Unknown_0x74299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld h,a
	jp Unknown_0x0BBA
	ld h,$A0
	ld l,$04
	ld e,l
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ld a,[bc]
	inc bc
	push bc
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$07
	ld hl,$DB53
	ld a,c
	add a,[hl]
	ld [de],a
	inc e
	inc hl
	ld a,b
	adc a,[hl]
	ld [de],a
	pop bc
	ret
	ld hl,$4096
	ld e,$5B
	ld a,[de]
	add a,l
	ld l,a
	jr nc,Unknown_0x74A20
	inc h

Unknown_0x74A20:
	ld e,$24
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x74A25:
INCBIN "baserom.gb", $74A25, $74A2E - $74A25
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,e
	ld a,[hl]
	ld [de],a
	ret
	call Unknown_0x0647
	and $08
	add a,$18
	ld [$FF00+$80],a
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	cp $20
	ld a,[$FF00+$80]
	ld e,$04
	jr c,Unknown_0x74A53
	ld l,a
	ld a,[de]
	sub l
	ld [de],a
	ret

Unknown_0x74A53:
	add a,$20
	ld l,a
	ld a,[de]
	add a,l
	ld [de],a
	ret

UnknownData_0x74A5A:
INCBIN "baserom.gb", $74A5A, $74A63 - $74A5A
	call Unknown_0x0647
	and $08
	add a,$18
	ld [$FF00+$80],a
	ld e,$04
	ld a,[de]
	ld hl,$DB51
	sub [hl]
	cp $80
	ld a,[$FF00+$80]
	ld e,$04
	jr nc,Unknown_0x74A80
	ld l,a
	ld a,[de]
	add a,l
	ld [de],a
	ret

Unknown_0x74A80:
	add a,$20
	ld l,a
	ld a,[de]
	sub l
	ld [de],a
	ret

UnknownData_0x74A87:
INCBIN "baserom.gb", $74A87, $74AA8 - $74A87
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4072
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x74092
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$1D
	ld bc,Unknown_0x74AC6
	jp Unknown_0x0846

Unknown_0x74AC6:
INCBIN "baserom.gb", $74AC6, $74AD7 - $74AC6
	call Unknown_0x0DA4
	ld bc,$4072
	jp Unknown_0x255B

UnknownData_0x74AE0:
INCBIN "baserom.gb", $74AE0, $74B26 - $74AE0
	ld bc,$4072
	jp Unknown_0x255B
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x74B37
	dec a
	ld [de],a
	call Unknown_0x1EE6

Unknown_0x74B37:
	call Unknown_0x0DA4
	ld bc,$4072
	jp Unknown_0x255B

UnknownData_0x74B40:
INCBIN "baserom.gb", $74B40, $74B67 - $74B40
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4080
	jp Unknown_0x255B
	ld hl,$40B0
	ld e,$5B
	ld a,[de]
	sub $06
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x74B87
	inc h

Unknown_0x74B87:
	call Unknown_0x20F9
	call Unknown_0x2123
	jp Unknown_0x20BE

UnknownData_0x74B90:
INCBIN "baserom.gb", $74B90, $74BAA - $74B90
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4

UnknownData_0x74BB3:
INCBIN "baserom.gb", $74BB3, $74C36 - $74BB3

Unknown_0x74C36:
INCBIN "baserom.gb", $74C36, $74CD8 - $74C36

Unknown_0x74CD8:
INCBIN "baserom.gb", $74CD8, $74CE4 - $74CD8

Unknown_0x74CE4:
INCBIN "baserom.gb", $74CE4, $74CF5 - $74CE4

Unknown_0x74CF5:
INCBIN "baserom.gb", $74CF5, $74D34 - $74CF5

Unknown_0x74D34:
INCBIN "baserom.gb", $74D34, $74D37 - $74D34

Unknown_0x74D37:
INCBIN "baserom.gb", $74D37, $74D98 - $74D37
	ld bc,$4C28
	call Unknown_0x251B
	ret nc
	ld e,$1D
	ld bc,Unknown_0x75ADA
	jp Unknown_0x0846
	xor a
	ld [$DD12],a
	ld e,$4C
	ld a,[de]
	ld [$DD13],a
	ret
	ld hl,$4C3A
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	cp $04
	jr nz,Unknown_0x74DD2
	ld a,[$DD12]
	set 0,a
	ld [$DD12],a
	ld a,[hli]

Unknown_0x74DD2:
	cp $FF
	jr nz,Unknown_0x74DE0
	ld a,[hli]
	cpl
	inc a
	add a,l
	ld l,a
	ld a,$FF
	adc a,h
	ld h,a
	ld a,[hli]

Unknown_0x74DE0:
	ld [$FF00+$80],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ld a,[$FF00+$80]
	rlca
	ld hl,$4C47
	add a,l
	ld l,a
	jr nc,Unknown_0x74DF4
	inc h

Unknown_0x74DF4:
	ld e,$3F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld e,$3F
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	cp $FF
	ret z
	ld e,$3F
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret
	ld hl,$DD12
	bit 0,[hl]
	jr z,Unknown_0x74E21
	bit 1,[hl]
	jr z,Unknown_0x74E21
	ld a,$01
	jr Unknown_0x74E22

Unknown_0x74E21:
	xor a

Unknown_0x74E22:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x74E26:
INCBIN "baserom.gb", $74E26, $74EB6 - $74E26
	call Unknown_0x1EE6
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x74EF5
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x74C36
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x74EE9
	call Unknown_0x74F0B
	ret nc
	call Unknown_0x74EFD
	ld e,$41
	ld a,$01
	ld [de],a
	ld h,d
	ld l,$1F
	ld [hl],$5D
	inc l
	ld [hl],$4E
	inc l
	ld [hl],$B9
	ret

Unknown_0x74EE9:
	ld h,d
	ld l,$1F
	ld [hl],$5D
	inc l
	ld [hl],$4D
	inc l
	ld [hl],$98
	ret

Unknown_0x74EF5:
	ld e,$1D
	ld bc,Unknown_0x75ADA
	jp Unknown_0x0846

Unknown_0x74EFD:
	xor a
	ld e,$0D
	ld [de],a
	inc e
	ld [de],a
	ret

Unknown_0x74F04:
	call Unknown_0x74EFD
	ld e,$11
	ld [de],a
	ret

Unknown_0x74F0B:
	ld e,$0E
	ld a,[de]
	rlca
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	jr c,Unknown_0x74F1C
	sub [hl]
	cp $97
	ccf
	ret

Unknown_0x74F1C:
	sub [hl]
	cp $09
	ret
	ld e,$41
	ld a,[de]
	dec a
	jr z,Unknown_0x74F3F
	ld [de],a
	cp $03
	jr nc,Unknown_0x74F3A
	ld hl,$4C6E
	dec a
	add a,l
	ld l,a
	jr nc,Unknown_0x74F34
	inc h

Unknown_0x74F34:
	call Unknown_0x0647
	cp [hl]
	jr c,Unknown_0x74F3F

Unknown_0x74F3A:
	xor a

Unknown_0x74F3B:
	ld e,$27
	ld [de],a
	ret

Unknown_0x74F3F:
	ld a,$01
	jr Unknown_0x74F3B

UnknownData_0x74F43:
INCBIN "baserom.gb", $74F43, $74F6D - $74F43
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x74FB0
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x74F0B
	jr nc,Unknown_0x74F83
	call Unknown_0x74EFD

Unknown_0x74F83:
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	ret nz
	call Unknown_0x203D
	ld e,$45
	ld a,[de]
	jr nc,Unknown_0x74FA5
	rlca
	jr c,Unknown_0x74FA8

Unknown_0x74F94:
	ld e,$04
	ld b,$10
	call Unknown_0x1F9C
	jr c,Unknown_0x74FA8
	ld e,$1D
	ld bc,$4FD6
	jp Unknown_0x0846

Unknown_0x74FA5:
	rlca
	jr c,Unknown_0x74F94

Unknown_0x74FA8:
	ld e,$1D
	ld bc,Unknown_0x74FCD
	jp Unknown_0x0846

Unknown_0x74FB0:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846
	ld a,[bc]
	inc bc
	push bc
	ld e,$04
	ld b,a
	call Unknown_0x1F9C
	jr c,Unknown_0x74FC9
	xor a

Unknown_0x74FC4:
	ld e,$27
	ld [de],a
	pop bc
	ret

Unknown_0x74FC9:
	ld a,$01
	jr Unknown_0x74FC4

Unknown_0x74FCD:
INCBIN "baserom.gb", $74FCD, $74FE0 - $74FCD
	call Unknown_0x74FEF
	ret c
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$5017
	jp Unknown_0x0846

Unknown_0x74FEF:
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x7500D
	call Unknown_0x21EB
	call Unknown_0x0DA4
	call Unknown_0x74F0B
	jr nc,Unknown_0x75005
	call Unknown_0x74EFD

Unknown_0x75005:
	ld bc,Unknown_0x74C36
	call Unknown_0x24CD
	or a
	ret

Unknown_0x7500D:
	ld e,$1D
	ld bc,$5ADA
	call Unknown_0x0846
	pop hl
	ret

UnknownData_0x75017:
INCBIN "baserom.gb", $75017, $7504B - $75017
	call Unknown_0x75057
	ret c
	ld e,$1D
	ld bc,$50A7
	jp Unknown_0x0846

Unknown_0x75057:
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x7509D
	ld e,$41
	ld a,[de]
	or a
	jr nz,Unknown_0x75068
	call Unknown_0x1EE6

Unknown_0x75068:
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x74C36
	call Unknown_0x24CD
	bit 7,a
	jr nz,Unknown_0x75086
	call Unknown_0x74F0B
	jr nc,Unknown_0x7509B
	call Unknown_0x74F04
	ld h,d
	ld l,$41
	inc [hl]
	scf
	ret

Unknown_0x75086:
	ld e,$41
	ld a,[de]
	or a
	jr nz,Unknown_0x75099
	ld h,d
	ld l,$1F
	ld [hl],$5D
	inc l
	ld [hl],$4D
	inc l
	ld [hl],$98
	scf
	ret

Unknown_0x75099:
	or a
	ret

Unknown_0x7509B:
	ccf
	ret

Unknown_0x7509D:
	ld e,$1D
	ld bc,Unknown_0x75ADA
	call Unknown_0x0846
	pop hl
	ret

UnknownData_0x750A7:
INCBIN "baserom.gb", $750A7, $750E4 - $750A7
	call Unknown_0x1EE6
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x7510E
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x74F0B
	jr nc,Unknown_0x75108
	call Unknown_0x74EFD
	ld h,d
	ld l,$1F
	ld [hl],$5D
	inc l
	ld [hl],$50
	inc l
	ld [hl],$E7

Unknown_0x75108:
	ld bc,Unknown_0x74C36
	jp Unknown_0x24CD

Unknown_0x7510E:
	ld e,$1D
	ld bc,Unknown_0x75ADA
	jp Unknown_0x0846

UnknownData_0x75116:
INCBIN "baserom.gb", $75116, $7512B - $75116
	call Unknown_0x75057
	ret c
	ld e,$1D
	ld bc,$5137
	jp Unknown_0x0846

UnknownData_0x75137:
INCBIN "baserom.gb", $75137, $75177 - $75137
	ld bc,$4C28
	call Unknown_0x251B
	ret nc
	ld e,$1D
	ld bc,Unknown_0x75ADA
	jp Unknown_0x0846
	ld hl,$DD12
	bit 2,[hl]
	jr nz,Unknown_0x75190
	xor a
	jr Unknown_0x75192

Unknown_0x75190:
	ld a,$01

Unknown_0x75192:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x75196:
INCBIN "baserom.gb", $75196, $751E3 - $75196
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	call z,Unknown_0x74F04
	call Unknown_0x74F0B
	ret nc
	jp Unknown_0x74F04
	push bc
	ld e,$01
	ld bc,$5544
	call Unknown_0x0C3A
	ld a,$80
	ld [$A054],a
	ld l,$04
	ld e,l
	ld a,[de]
	add a,$04
	ld [hli],a
	inc e
	ld a,[de]
	adc a,$00
	ld [hl],a
	ld l,$07
	ld e,l
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hl],a
	pop bc
	ret
	ld hl,$DD12
	res 2,[hl]
	ret
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $50
	jr c,Unknown_0x75231
	ld a,$C0
	jr Unknown_0x75233

Unknown_0x75231:
	ld a,$40

Unknown_0x75233:
	ld e,$45
	ld [de],a
	ret

UnknownData_0x75237:
INCBIN "baserom.gb", $75237, $75278 - $75237
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x75286
	call Unknown_0x1ED3
	jp Unknown_0x0DA4

Unknown_0x75286:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846

UnknownData_0x7528E:
INCBIN "baserom.gb", $7528E, $752CA - $7528E
	call Unknown_0x75057
	ret c
	ld e,$1D
	ld bc,$52DB
	jp Unknown_0x0846
	ld h,d
	ld l,$26
	dec [hl]
	ret

UnknownData_0x752DB:
INCBIN "baserom.gb", $752DB, $75340 - $752DB
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x75354
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x74C36
	jp Unknown_0x24CD

Unknown_0x75354:
	ld e,$1D
	ld bc,Unknown_0x75ADA
	jp Unknown_0x0846

UnknownData_0x7535C:
INCBIN "baserom.gb", $7535C, $7541E - $7535C
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4C28
	call Unknown_0x251B
	ret nc
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846

UnknownData_0x75433:
INCBIN "baserom.gb", $75433, $75463 - $75433
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x75482
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x74C36
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$548A
	jp Unknown_0x0846

Unknown_0x75482:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846

UnknownData_0x7548A:
INCBIN "baserom.gb", $7548A, $75490 - $7548A

Unknown_0x75490:
INCBIN "baserom.gb", $75490, $754CE - $75490
	push bc
	ld e,$48
	ld a,[de]
	ld h,a
	call Unknown_0x0BBA
	ld a,[$FF00+$9A]
	ld d,a
	pop bc
	ret

UnknownData_0x754DB:
INCBIN "baserom.gb", $754DB, $755E7 - $754DB
	call Unknown_0x0647
	and $01
	ld l,a
	ld e,$5C
	ld a,[de]
	dec a
	rlca
	add a,l
	rlca
	ld hl,$4C86
	add a,l
	ld l,a
	jr nc,Unknown_0x755FC
	inc h

Unknown_0x755FC:
	ld a,[hli]
	ld e,[hl]
	ld hl,$DD14
	ld [hli],a
	ld [hl],e
	ret
	ld hl,$DD14
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	cp $FF
	ret z
	ld a,l
	ld e,h
	ld hl,$DD14
	ld [hli],a
	ld [hl],e
	ret
	ld hl,$DD12
	res 1,[hl]
	ret

UnknownData_0x7561F:
INCBIN "baserom.gb", $7561F, $7563B - $7561F
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x7565E
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x74C36
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld h,d
	ld l,$1F
	ld [hl],$5D
	inc l
	ld [hl],$4D
	inc l
	ld [hl],$98
	ret

Unknown_0x7565E:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846

UnknownData_0x75666:
INCBIN "baserom.gb", $75666, $7571B - $75666
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x7575E
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x74F0B
	jr nc,Unknown_0x75731
	call Unknown_0x74F04

Unknown_0x75731:
	ld h,d
	ld l,$0F
	ld a,[hli]
	or [hl]
	ret nz
	call Unknown_0x203D
	ld e,$45
	ld a,[de]
	jr nc,Unknown_0x75753
	rlca
	jr c,Unknown_0x75756

Unknown_0x75742:
	ld e,$04
	ld b,$20
	call Unknown_0x1F9C
	jr c,Unknown_0x75756
	ld e,$1D
	ld bc,Unknown_0x75776
	jp Unknown_0x0846

Unknown_0x75753:
	rlca
	jr c,Unknown_0x75742

Unknown_0x75756:
	ld e,$1D
	ld bc,Unknown_0x75766
	jp Unknown_0x0846

Unknown_0x7575E:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846

Unknown_0x75766:
INCBIN "baserom.gb", $75766, $75776 - $75766

Unknown_0x75776:
INCBIN "baserom.gb", $75776, $7578C - $75776
	call Unknown_0x74FEF
	ret c
	bit 7,a
	ret z
	ld hl,$DD12
	set 7,[hl]
	ld e,$1D
	ld bc,Unknown_0x757A0
	jp Unknown_0x0846

Unknown_0x757A0:
INCBIN "baserom.gb", $757A0, $757A9 - $757A0

Unknown_0x757A9:
INCBIN "baserom.gb", $757A9, $757BC - $757A9
	call Unknown_0x74FEF
	ret c
	bit 7,a
	ret z
	ld hl,$DD12
	set 7,[hl]
	ld e,$22
	ld hl,Unknown_0x74299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$1D
	ld bc,Unknown_0x757A9
	jp Unknown_0x0846
	ld hl,$4C76
	ld e,$27
	ld a,[de]
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x757EB
	inc h

Unknown_0x757EB:
	jp Unknown_0x20BE
	ld h,d
	ld l,$27
	ld a,[hl]
	inc [hl]
	rlca
	ld hl,$4C7C
	add a,l
	ld l,a
	jr nc,Unknown_0x757FC
	inc h

Unknown_0x757FC:
	jp Unknown_0x20F9

UnknownData_0x757FF:
INCBIN "baserom.gb", $757FF, $75827 - $757FF
	ld e,$41
	ld a,[de]
	ld e,a
	rlca
	add a,e
	ld hl,$4C80
	add a,l
	ld l,a
	jr nc,Unknown_0x75835
	inc h

Unknown_0x75835:
	call Unknown_0x20F9
	jp Unknown_0x2123

UnknownData_0x7583B:
INCBIN "baserom.gb", $7583B, $75850 - $7583B
	call Unknown_0x75057
	ret c
	ld e,$1D
	ld bc,$585C
	jp Unknown_0x0846

UnknownData_0x7585C:
INCBIN "baserom.gb", $7585C, $758C7 - $7585C
	call Unknown_0x0DA4
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x758DE
	call Unknown_0x74F0B
	ret nc
	ld e,$1D
	ld bc,$5892
	jp Unknown_0x0846

Unknown_0x758DE:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x758FB
	call Unknown_0x74F0B
	ret nc
	jp Unknown_0x74F04

Unknown_0x758FB:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846

UnknownData_0x75903:
INCBIN "baserom.gb", $75903, $7594B - $75903
	call Unknown_0x75057
	ret c
	ld e,$1D
	ld bc,$5973
	jp Unknown_0x0846

UnknownData_0x75957:
INCBIN "baserom.gb", $75957, $75A56 - $75957
	ld bc,$4C28
	call Unknown_0x251B
	jr c,Unknown_0x75A75
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,Unknown_0x74C36
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$5A7D
	jp Unknown_0x0846

Unknown_0x75A75:
	ld e,$1D
	ld bc,$5ADA
	jp Unknown_0x0846

UnknownData_0x75A7D:
INCBIN "baserom.gb", $75A7D, $75AB0 - $75A7D

Unknown_0x75AB0:
INCBIN "baserom.gb", $75AB0, $75ADA - $75AB0

Unknown_0x75ADA:
INCBIN "baserom.gb", $75ADA, $75AF5 - $75ADA
	ld hl,$DD12
	res 3,[hl]
	ret
	call Unknown_0x2323
	ret nz
	ld b,$00
	ld e,$4C
	ld a,[de]
	cp $5B
	ret nc
	inc b
	cp $2E
	jr nc,Unknown_0x75B0D
	inc b

Unknown_0x75B0D:
	ld e,$5C
	ld a,b
	ld [de],a
	ld hl,$DD12
	bit 1,[hl]
	ret nz
	ld e,$4C
	ld a,[de]
	add a,$14
	ld hl,$DD13
	cp [hl]
	jr c,Unknown_0x75B23
	ret nz

Unknown_0x75B23:
	ld a,[de]
	ld [hl],a
	ld hl,$DD12
	set 1,[hl]
	ret

UnknownData_0x75B2B:
INCBIN "baserom.gb", $75B2B, $75B87 - $75B2B
	call Unknown_0x0DA4
	ld bc,$5B79
	call Unknown_0x255B
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $50
	ret nz
	ld e,$1D
	ld bc,$5BF1
	jp Unknown_0x0846
	ld hl,$DB53
	ld e,$07
	ld a,[de]
	sub [hl]
	cp $60
	jr c,Unknown_0x75BB1
	ld a,$01
	jr Unknown_0x75BB2

Unknown_0x75BB1:
	xor a

Unknown_0x75BB2:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x75BB6:
INCBIN "baserom.gb", $75BB6, $75BC6 - $75BB6
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$5B79
	call Unknown_0x255B
	ld hl,$DB53
	ld e,$07
	ld a,[de]
	sub [hl]
	cp $60
	ret c
	ld e,$22
	ld hl,Unknown_0x74299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld e,$1D
	ld bc,$5B47
	jp Unknown_0x0846

UnknownData_0x75BF1:
INCBIN "baserom.gb", $75BF1, $75C2A - $75BF1
	ld bc,$5B79
	jp Unknown_0x255B
	xor a
	ld [$DF16],a
	ret
	ld a,[$DF16]
	ld e,$27
	ld [de],a
	ret
	ld hl,Unknown_0x74CE4
	ld a,$03
	call Unknown_0x05CF
	ret

UnknownData_0x75C45:
INCBIN "baserom.gb", $75C45, $75CC0 - $75C45
	ld e,$11
	ld a,[de]
	cpl
	inc a
	ld [de],a
	ret

UnknownData_0x75CC7:
INCBIN "baserom.gb", $75CC7, $75D35 - $75CC7
	call Unknown_0x1ED3
	call Unknown_0x1EE6
	jp Unknown_0x0DA4

UnknownData_0x75D3E:
INCBIN "baserom.gb", $75D3E, $75D54 - $75D3E
	push bc
	call Unknown_0x0647
	ld b,a
	ld c,$05
	call Unknown_0x2885
	ld hl,$4CDC
	ld a,b
	rlca
	rlca
	add a,b
	add a,l
	ld l,a
	jr nc,Unknown_0x75D6A
	inc h

Unknown_0x75D6A:
	ld b,h
	ld c,l
	call Unknown_0x1FD1
	ld h,b
	ld l,c
	call Unknown_0x2123
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	pop bc
	ret

UnknownData_0x75D7D:
INCBIN "baserom.gb", $75D7D, $75D88 - $75D7D
	ld bc,Unknown_0x74CF5
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$15
	ld a,[hl]
	sub $08
	ret c
	rlca
	rlca
	add a,c
	ld c,a
	jr nc,Unknown_0x75D9C
	inc b

Unknown_0x75D9C:
	call Unknown_0x24E8
	call Unknown_0x75DA8
	ld bc,$4CAE
	jp Unknown_0x255B

Unknown_0x75DA8:
	ld e,$5E
	ld a,[bc]
	ld [de],a
	inc bc
	inc e
	ld a,[bc]
	ld [de],a
	ret

UnknownData_0x75DB1:
INCBIN "baserom.gb", $75DB1, $75DE7 - $75DB1
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4CAE
	jp Unknown_0x255B

UnknownData_0x75DF6:
INCBIN "baserom.gb", $75DF6, $75E7B - $75DF6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4CAE
	jp Unknown_0x255B

UnknownData_0x75E87:
INCBIN "baserom.gb", $75E87, $75F48 - $75E87
	call Unknown_0x21EB
	call Unknown_0x0DA4
	ld bc,$4CBC
	call Unknown_0x255B
	ret c
	ld bc,Unknown_0x74CD8
	call Unknown_0x24CD
	bit 7,a
	ret z
	ld h,d
	ld l,$26
	dec [hl]
	jr z,Unknown_0x75F77
	ld e,$0D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	sra a
	ld [de],a
	dec e
	ld a,l
	rra
	ld [de],a
	ld hl,Unknown_0x74D34
	jp Unknown_0x20BE

Unknown_0x75F77:
	ld h,d
	jp Unknown_0x0BBA

UnknownData_0x75F7B:
INCBIN "baserom.gb", $75F7B, $75FB4 - $75F7B
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	ld hl,$DD12
	bit 7,[hl]
	jr nz,Unknown_0x75FC4
	xor a
	jr Unknown_0x75FC8

Unknown_0x75FC4:
	res 7,[hl]
	ld a,$01

Unknown_0x75FC8:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x75FCC:
INCBIN "baserom.gb", $75FCC, $76065 - $75FCC
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$4CCA
	jp Unknown_0x255B
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4CCA
	jp Unknown_0x255B

UnknownData_0x7607D:
INCBIN "baserom.gb", $7607D, $760A3 - $7607D
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4CCA
	call Unknown_0x255B
	ret c
	ld h,d
	ld l,$0D
	ld a,[hli]
	or [hl]
	ret nz
	ld e,$1D
	ld bc,Unknown_0x760C1
	jp Unknown_0x0846

Unknown_0x760C1:
INCBIN "baserom.gb", $760C1, $76125 - $760C1
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$4C
	ld a,[hl]
	or a
	jr nz,Unknown_0x76133
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x76133:
	ld hl,$DD12
	bit 3,[hl]
	ret nz
	call Unknown_0x2809
	ret c
	ld bc,Unknown_0x74D37
	call Unknown_0x24E8
	ld e,$04
	ld b,$18
	call Unknown_0x1F9C
	ret nc
	ld e,$07
	ld b,$18
	call Unknown_0x1F9C
	ret nc
	ld hl,$DD12
	set 2,[hl]
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$60
	ld [hl],$BF
	ld l,$61
	ld [hl],$C0
	ld e,$01
	ld bc,Unknown_0x75490
	call Unknown_0x0C3A
	ld a,$80
	ld [$A054],a
	ld e,$48
	ld a,[de]
	ld [$A048],a
	ld h,d
	jp Unknown_0x0BBA

UnknownData_0x7617B:
INCBIN "baserom.gb", $7617B, $761AA - $7617B
	call Unknown_0x0DA4
	ld bc,$4CAE
	call Unknown_0x255B
	ret c
	call Unknown_0x74F0B
	ret nc
	ld e,$1D
	ld bc,Unknown_0x761C0
	jp Unknown_0x0846

Unknown_0x761C0:
INCBIN "baserom.gb", $761C0, $761E6 - $761C0
	call Unknown_0x761F4
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$6207
	jp Unknown_0x0846

Unknown_0x761F4:
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$4CAE
	call Unknown_0x255B
	jr c,Unknown_0x76205
	jp Unknown_0x1A25

Unknown_0x76205:
	pop hl
	ret

UnknownData_0x76207:
INCBIN "baserom.gb", $76207, $7621C - $76207
	call Unknown_0x761F4
	bit 7,a
	ret z
	ld e,$1D
	ld bc,Unknown_0x7622A
	jp Unknown_0x0846

Unknown_0x7622A:
INCBIN "baserom.gb", $7622A, $7623E - $7622A
	ld bc,$4CAE
	jp Unknown_0x255B

UnknownData_0x76244:
INCBIN "baserom.gb", $76244, $762DB - $76244
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	push bc
	ld b,h
	ld c,l
	call Unknown_0x0647
	and $03
	rlca
	add a,c
	ld c,a
	jr nc,Unknown_0x762EF
	inc b

Unknown_0x762EF:
	call Unknown_0x24E8
	pop bc
	ret

UnknownData_0x762F4:
INCBIN "baserom.gb", $762F4, $7631E - $762F4
	call Unknown_0x761F4
	bit 7,a
	ret z
	ld e,$1D
	ld bc,$632C
	jp Unknown_0x0846

UnknownData_0x7632C:
INCBIN "baserom.gb", $7632C, $7640F - $7632C
	call Unknown_0x764B0
	call Unknown_0x0DA4
	ld e,$07
	ld a,[de]
	ld hl,$DB53
	sub [hl]
	ld b,a
	inc e
	ld a,[de]
	inc hl
	sbc a,[hl]
	ret nc
	ld a,b
	cp $E8
	ret nc
	ld e,$1D
	ld bc,Unknown_0x7642E
	jp Unknown_0x0846

Unknown_0x7642E:
INCBIN "baserom.gb", $7642E, $76443 - $7642E
	call Unknown_0x764B0
	call Unknown_0x0DA4
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	ld b,a
	inc e
	inc hl
	ld a,[de]
	sbc a,[hl]
	ret c
	ld a,b
	cp $18
	ret c
	ld e,$1D
	ld bc,$6462
	jp Unknown_0x0846

UnknownData_0x76462:
INCBIN "baserom.gb", $76462, $7649E - $76462
	call Unknown_0x764B0
	ld bc,$6363
	call Unknown_0x233C
	ret nc
	ld e,$1D
	ld bc,Unknown_0x76B2A
	jp Unknown_0x0846

Unknown_0x764B0:
	ld hl,$A07A
	bit 7,[hl]
	jr z,Unknown_0x764CB
	ld hl,$DD19
	ld a,[hl]
	add a,$90
	ld [hl],a
	jr nc,Unknown_0x764CB
	ld hl,$A079
	ld a,[hl]
	add a,$01
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hl],a

Unknown_0x764CB:
	ld hl,$DD17
	ld a,[$DB53]
	sub [hl]
	ld [$DD18],a
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$07
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ld a,[$DB53]
	ld [$DD17],a
	ret

Unknown_0x764E9:
	ld hl,$DD19
	ld a,[hl]
	add a,$08
	ld [hl],a
	jp nc,Unknown_0x764CB
	ld hl,$A079
	ld a,[hl]
	add a,$01
	ld [hli],a
	ld a,[hl]
	adc a,$00
	ld [hl],a
	jp Unknown_0x764CB

Unknown_0x76501:
	ld a,[$DD18]
	ld c,a
	rla
	sbc a,a
	ld b,a
	ld e,$07
	ld a,[de]
	add a,c
	ld [de],a
	inc e
	ld a,[de]
	adc a,b
	ld [de],a
	ret
	ld a,d
	ld [$DD27],a
	ret
	ld hl,$A079
	ld a,[bc]
	ld [hli],a
	inc bc
	ld a,[bc]
	ld [hl],a
	inc bc
	ret
	xor a
	ld [$DD16],a
	ret
	ld e,$3D
	ld a,[bc]
	ld [de],a
	inc bc
	inc e
	ld a,[bc]
	ld [de],a
	inc bc
	ret
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	ld e,$27
	ld [de],a
	cp $FF
	ret z
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

UnknownData_0x76546:
INCBIN "baserom.gb", $76546, $76561 - $76546
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$5C
	ld a,[de]
	cp $02
	jr nc,Unknown_0x76589
	push hl
	rlca
	ld h,d
	ld l,$41
	add a,[hl]
	inc [hl]
	pop hl
	add a,l
	ld l,a
	jr nc,Unknown_0x7657B
	inc h

Unknown_0x7657B:
	ld a,[hl]
	or a
	jr z,Unknown_0x76589
	ld e,a
	call Unknown_0x0647
	cp e
	jr c,Unknown_0x76589
	xor a
	jr Unknown_0x7658B

Unknown_0x76589:
	ld a,$01

Unknown_0x7658B:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x7658F:
INCBIN "baserom.gb", $7658F, $765BD - $7658F

Unknown_0x765BD:
	call Unknown_0x764B0
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$6363
	call Unknown_0x233C
	ret nc
	ld e,$1D
	ld bc,$6B2A
	call Unknown_0x0846
	scf
	ret

Unknown_0x765D7:
	ld hl,$DD16
	bit 0,[hl]
	ret z
	ld e,$15
	ld a,[de]
	ld hl,$65EB
	add a,l
	ld l,a
	jr nc,Unknown_0x765E8
	inc h

Unknown_0x765E8:
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x765EB:
INCBIN "baserom.gb", $765EB, $765F7 - $765EB

Unknown_0x765F7:
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	sub [hl]
	cp $50
	jr c,Unknown_0x76606
	ld a,$C0
	jr Unknown_0x76608

Unknown_0x76606:
	ld a,$40

Unknown_0x76608:
	ld e,$45
	ld [de],a
	ret
	call Unknown_0x76763
	jr c,Unknown_0x76614
	xor a
	jr Unknown_0x76616

Unknown_0x76614:
	ld a,$01

Unknown_0x76616:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x7661A:
INCBIN "baserom.gb", $7661A, $7663E - $7661A
	call Unknown_0x764B0
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$6363
	call Unknown_0x233C
	jr c,Unknown_0x76660
	call Unknown_0x765D7
	call Unknown_0x7674E
	ret nc
	call Unknown_0x74F04
	call Unknown_0x76763
	ret nc
	jp Unknown_0x76668

Unknown_0x76660:
	ld e,$1D
	ld bc,Unknown_0x76B2A
	jp Unknown_0x0846

Unknown_0x76668:
	xor a
	ld e,$12
	ld [de],a
	ld e,$0F
	ld [de],a
	inc e
	ld [de],a
	ret
	push bc
	ld hl,$DD17
	ld e,$07
	ld a,[de]
	sub [hl]
	ld b,a
	ld e,$41
	sub $18
	jr nc,Unknown_0x76683
	cpl
	inc a

Unknown_0x76683:
	cp $08
	jr c,Unknown_0x7668B
	ld a,$18
	ld [de],a
	inc e

Unknown_0x7668B:
	ld a,b
	sub $40
	jr nc,Unknown_0x76692
	cpl
	inc a

Unknown_0x76692:
	cp $08
	jr c,Unknown_0x7669F
	ld a,$40
	ld [de],a
	ld a,e
	cp $42
	jr z,Unknown_0x766A2
	inc e

Unknown_0x7669F:
	ld a,$68
	ld [de],a

Unknown_0x766A2:
	pop bc
	ret
	call Unknown_0x0647
	cp $80
	jr c,Unknown_0x766B9
	call Unknown_0x0647
	and $01
	ld e,$41
	add a,e
	ld e,a
	ld a,[de]
	ld e,$41
	ld [de],a
	ret

Unknown_0x766B9:
	push bc
	ld b,$A0
	ld c,$07
	ld hl,$DB53
	ld a,[bc]
	sub [hl]
	ld b,a
	ld e,$41
	ld a,[de]
	sub b
	jr nc,Unknown_0x766CC
	cpl
	inc a

Unknown_0x766CC:
	ld c,a
	inc e
	ld a,[de]
	sub b
	jr nc,Unknown_0x766D4
	cpl
	inc a

Unknown_0x766D4:
	cp c
	jr c,Unknown_0x766D8
	dec e

Unknown_0x766D8:
	ld a,[de]
	ld e,$41
	ld [de],a
	pop bc
	ret
	ld e,$07
	ld a,[de]
	ld hl,$DD17
	sub [hl]
	ld h,d
	ld l,$41
	sub [hl]
	jr c,Unknown_0x766F0
	ld hl,$FF00
	jr Unknown_0x766F5

Unknown_0x766F0:
	ld hl,$0100
	cpl
	inc a

Unknown_0x766F5:
	cp $3C
	jr c,Unknown_0x766FB
	sla h

Unknown_0x766FB:
	ld e,$0F
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

UnknownData_0x76703:
INCBIN "baserom.gb", $76703, $76731 - $76703
	call Unknown_0x764B0
	call Unknown_0x0DA4
	ld bc,$6363
	call Unknown_0x233C
	jr c,Unknown_0x76746
	call Unknown_0x7674E
	ret nc
	jp Unknown_0x74EFD

Unknown_0x76746:
	ld e,$1D
	ld bc,Unknown_0x76B2A
	jp Unknown_0x0846

Unknown_0x7674E:
	ld e,$0E
	ld a,[de]
	rlca
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	jr c,Unknown_0x7675F
	sub [hl]
	cp $8B
	ccf
	ret

Unknown_0x7675F:
	sub [hl]
	cp $15
	ret

Unknown_0x76763:
	ld e,$10
	ld a,[de]
	rlca
	ld hl,$DB53
	ld e,$07
	ld a,[de]
	jr c,Unknown_0x76776
	sub [hl]
	ld h,d
	ld l,$3F
	cp [hl]
	ccf
	ret

Unknown_0x76776:
	sub [hl]
	ld h,d
	ld l,$3F
	cp [hl]
	ret
	ld hl,$DD16
	bit 0,[hl]
	jr nz,Unknown_0x76786
	xor a
	jr Unknown_0x76788

Unknown_0x76786:
	ld a,$01

Unknown_0x76788:
	ld e,$27
	ld [de],a
	ret
	ld hl,$DD16
	set 0,[hl]
	ret
	ld hl,$DD16
	res 0,[hl]
	ret

UnknownData_0x76798:
INCBIN "baserom.gb", $76798, $767ED - $76798
	call Unknown_0x765BD
	ret c
	call Unknown_0x228D
	ret nc
	ld e,$1D
	ld bc,$67FD
	jp Unknown_0x0846

UnknownData_0x767FD:
INCBIN "baserom.gb", $767FD, $768BD - $767FD
	call Unknown_0x765BD
	ret c
	call Unknown_0x228D
	ret nc
	ld e,$1D
	ld bc,$6915
	jp Unknown_0x0846
	ld e,$07
	ld hl,$DD17
	ld a,[de]
	sub [hl]
	cp $2C
	jr c,Unknown_0x768F9
	cp $54
	jr nc,Unknown_0x76900
	ld a,$01
	ld e,$42
	ld [de],a
	call Unknown_0x0647
	cp $40
	jr c,Unknown_0x76900
	cp $80
	jr c,Unknown_0x768F9
	ld a,$01
	ld e,$27
	ld [de],a
	ld a,$FF
	ld e,$42
	ld [de],a
	jp Unknown_0x76668

Unknown_0x768F9:
	ld hl,Unknown_0x7690F
	ld a,$01
	jr Unknown_0x76904

Unknown_0x76900:
	ld hl,Unknown_0x76912
	xor a

Unknown_0x76904:
	ld e,$41
	ld [de],a
	call Unknown_0x20BE
	xor a
	ld e,$27
	ld [de],a
	ret

Unknown_0x7690F:
INCBIN "baserom.gb", $7690F, $76912 - $7690F

Unknown_0x76912:
INCBIN "baserom.gb", $76912, $7699D - $76912
	ld e,$42
	ld a,[de]
	cp $FF
	jp z,Unknown_0x76668
	ld hl,$69B9
	ld e,$41
	ld a,[de]
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x769B1
	inc h

Unknown_0x769B1:
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

UnknownData_0x769B9:
INCBIN "baserom.gb", $769B9, $769BD - $769B9
	push bc
	ld e,$42
	ld a,[de]
	cp $FF
	jr nz,Unknown_0x769C9
	ld a,$06
	jr Unknown_0x769D1

Unknown_0x769C9:
	rlca
	ld b,a
	ld e,$41
	ld a,[de]
	add a,b
	add a,$07

Unknown_0x769D1:
	ld e,$D9
	call Unknown_0x2319
	pop bc
	ret

UnknownData_0x769D8:
INCBIN "baserom.gb", $769D8, $76A19 - $769D8
	call Unknown_0x764B0
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$6363
	call Unknown_0x233C
	jr c,Unknown_0x76A38
	call Unknown_0x7674E
	ret nc
	call Unknown_0x74F04
	call Unknown_0x76763
	ret nc
	jp Unknown_0x76668

Unknown_0x76A38:
	ld e,$1D
	ld bc,Unknown_0x76B2A
	jp Unknown_0x0846

UnknownData_0x76A40:
INCBIN "baserom.gb", $76A40, $76A99 - $76A40
	call Unknown_0x764B0
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$6363
	call Unknown_0x233C
	ret nc
	ld e,$1D
	ld bc,$6B2A
	jp Unknown_0x0846
	ld e,$07
	ld hl,$DD17
	ld a,[de]
	sub [hl]
	cp $2C
	jr c,Unknown_0x76ACC
	cp $54
	jr nc,Unknown_0x76AC8
	call Unknown_0x202B
	jr c,Unknown_0x76ACC

Unknown_0x76AC8:
	ld a,$01
	jr Unknown_0x76ACD

Unknown_0x76ACC:
	xor a

Unknown_0x76ACD:
	ld e,$41
	ld [de],a
	ret
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld e,$41
	ld a,[de]
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jp nc,Unknown_0x20BE
	inc h
	jp Unknown_0x20BE

UnknownData_0x76AE6:
INCBIN "baserom.gb", $76AE6, $76B2A - $76AE6

Unknown_0x76B2A:
INCBIN "baserom.gb", $76B2A, $76B45 - $76B2A
	call Unknown_0x764B0
	call Unknown_0x765D7
	call Unknown_0x76B67
	ret nz
	ld hl,$DD16
	res 4,[hl]
	ld b,$00
	ld e,$4C
	ld a,[de]
	cp $5B
	ret nc
	inc b
	cp $3D
	jr nc,Unknown_0x76B62
	inc b

Unknown_0x76B62:
	ld e,$5C
	ld a,b
	ld [de],a
	ret

Unknown_0x76B67:
	ld bc,$6363
	call Unknown_0x255B
	ld e,$41
	ld a,[de]
	or a
	ret nz
	call Unknown_0x76B9D
	call Unknown_0x0C71
	call Unknown_0x76B86
	ld h,d
	ld l,$60
	ld [hl],$3F
	ld l,$44
	ld [hl],$18
	xor a
	ret

Unknown_0x76B86:
	ld hl,$DD21
	ld e,$03
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

Unknown_0x76B9D:
	ld hl,$DD21
	ld e,$03
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	inc e
	ld a,[de]
	ld [hli],a
	ret
	ld hl,$DD16
	set 4,[hl]
	ret

UnknownData_0x76BBA:
INCBIN "baserom.gb", $76BBA, $76C22 - $76BBA
	call Unknown_0x764B0
	ld bc,$6363
	call Unknown_0x255B
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x76C34
	dec a
	ld [de],a
	ret

Unknown_0x76C34:
	ld a,$08
	ld [de],a
	ld e,$40
	ld a,[de]
	add a,$14
	ld e,$D9
	call Unknown_0x2319
	ld e,$40
	ld a,[de]
	inc a
	cp $04
	jr c,Unknown_0x76C4A
	xor a

Unknown_0x76C4A:
	ld [de],a
	ret
	call Unknown_0x764B0
	call Unknown_0x21D8
	call Unknown_0x21C5
	call Unknown_0x0DA4
	ld bc,$6363
	call Unknown_0x255B
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	sub [hl]
	cp $50
	ld e,$3C
	ld a,[de]
	jr c,Unknown_0x76C79
	rlca
	jr c,Unknown_0x76C7C

Unknown_0x76C6F:
	ld hl,$DD16
	set 2,[hl]
	call Unknown_0x74F04
	jr Unknown_0x76C7C

Unknown_0x76C79:
	rlca
	jr c,Unknown_0x76C6F

Unknown_0x76C7C:
	ld hl,$DB53
	ld e,$07
	ld a,[de]
	sub [hl]
	cp $40
	ld e,$3A
	ld a,[de]
	jr c,Unknown_0x76C94
	rlca
	ret c

Unknown_0x76C8C:
	ld hl,$DD16
	set 3,[hl]
	jp Unknown_0x76668

Unknown_0x76C94:
	rlca
	ret nc
	jr Unknown_0x76C8C
	ld e,$04
	ld hl,$DB51
	ld a,[de]
	sub [hl]
	cp $50
	jr nc,Unknown_0x76CA7
	ld a,$40
	jr Unknown_0x76CA9

Unknown_0x76CA7:
	ld a,$C0

Unknown_0x76CA9:
	ld e,$45
	ld [de],a
	ld hl,Unknown_0x76CD8
	call Unknown_0x21A5
	ld e,$07
	ld hl,$DB53
	ld a,[de]
	sub [hl]
	cp $40
	ld hl,Unknown_0x76CD8
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld e,$39
	jr c,Unknown_0x76CD2
	ld a,[hli]
	cpl
	add a,$01
	ld [de],a
	inc e
	ld a,[hl]
	cpl
	adc a,$00
	ld [de],a
	ret

Unknown_0x76CD2:
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret

Unknown_0x76CD8:
INCBIN "baserom.gb", $76CD8, $76CDB - $76CD8
	ld hl,$DD16
	bit 2,[hl]
	jr z,Unknown_0x76CEA
	bit 3,[hl]
	jr z,Unknown_0x76CEA
	ld a,$01
	jr Unknown_0x76CEB

Unknown_0x76CEA:
	xor a

Unknown_0x76CEB:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x76CEF:
INCBIN "baserom.gb", $76CEF, $76CF7 - $76CEF
	push bc
	call Unknown_0x0647
	and $07
	add a,$0C
	ld e,$D9
	call Unknown_0x2319
	pop bc
	ret

UnknownData_0x76D06:
INCBIN "baserom.gb", $76D06, $76D17 - $76D06
	call Unknown_0x764B0
	ld bc,$6363
	call Unknown_0x255B
	call Unknown_0x2422
	ld a,[$CD4D]
	or a
	ret nz
	ld e,$1D
	ld bc,$6DDE
	jp Unknown_0x0846
	push bc
	ld hl,$CD4D
	ld [hl],$01
	inc l
	ld a,$60
	ld [hli],a
	ld a,$88
	ld [hli],a
	ld a,$00
	ld [hli],a
	ld a,$40
	ld [hli],a
	ld [hl],$80
	inc l
	ld [hl],$06
	pop bc
	ret

UnknownData_0x76D4A:
INCBIN "baserom.gb", $76D4A, $76E58 - $76D4A

Unknown_0x76E58:
	call Unknown_0x764E9
	ld bc,$6D4A
	call Unknown_0x233C
	ret nc
	ld e,$1D
	ld bc,Unknown_0x77434
	jp Unknown_0x0846
	ld a,$11
	ld [$DD1A],a
	ret
	push bc
	ld e,$3D
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a

Unknown_0x76E78:
	ld a,[hli]
	cp $FF
	jr nz,Unknown_0x76E82
	ld e,$27
	ld [de],a
	pop bc
	ret

Unknown_0x76E82:
	cp $0B
	jr nz,Unknown_0x76E90
	call Unknown_0x0647
	and $01
	ld e,$43
	ld [de],a
	jr Unknown_0x76E78

Unknown_0x76E90:
	cp $05
	jr nc,Unknown_0x76EB9
	or a
	jr z,Unknown_0x76EAD
	sub $01
	rlca
	ld c,a
	ld e,$5C
	ld a,[de]
	or a
	jr nz,Unknown_0x76EA7
	ld e,$43
	ld a,[de]
	add a,c
	jr Unknown_0x76EAD

Unknown_0x76EA7:
	call Unknown_0x0647
	and $01
	add a,c

Unknown_0x76EAD:
	ld e,$27
	ld [de],a
	ld e,$3D
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	pop bc
	ret

Unknown_0x76EB9:
	ld [$DD1B],a
	jp Unknown_0x76E78
	ld e,$27
	ld a,[de]
	rlca
	ld hl,$6D58
	add a,l
	ld l,a
	jr nc,Unknown_0x76ECB
	inc h

Unknown_0x76ECB:
	ld a,[hli]
	ld e,$3F
	ld [de],a
	inc e
	ld a,[hl]
	ld [de],a
	ret
	ld e,$3F
	ld a,[de]
	ld l,a
	inc e
	ld a,[de]
	ld h,a
	ld a,[hli]
	cp $0E
	jr nz,Unknown_0x76EEC
	ld a,[hli]
	ld [$DD1C],a
	ld a,[hli]
	ld [$DD1D],a
	ld a,[hli]
	ld [$DD1E],a
	ld a,[hli]

Unknown_0x76EEC:
	ld e,$27
	ld [de],a
	ld e,$3F
	ld a,l
	ld [de],a
	inc e
	ld a,h
	ld [de],a
	ret

UnknownData_0x76EF7:
INCBIN "baserom.gb", $76EF7, $76F37 - $76EF7
	call Unknown_0x764E9
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	call Unknown_0x76F9C
	ld bc,$6D4A
	call Unknown_0x233C
	ret nc
	ld e,$1D
	ld bc,Unknown_0x77434
	jp Unknown_0x0846
	ld hl,$DD16
	res 0,[hl]
	ret
	ld hl,$DD16
	set 0,[hl]
	ret
	ld a,[$DD16]
	bit 0,a
	jr z,Unknown_0x76F96
	ld hl,$DD1B
	ld a,[hli]
	cp $05
	jr z,Unknown_0x76F96
	cp $09
	jr c,Unknown_0x76F8C
	jr z,Unknown_0x76F85
	call Unknown_0x0647
	ld e,$00

Unknown_0x76F7B:
	sub $56
	jr c,Unknown_0x76F82
	inc e
	jr Unknown_0x76F7B

Unknown_0x76F82:
	ld a,e
	jr Unknown_0x76F8E

Unknown_0x76F85:
	call Unknown_0x0647
	and $01
	jr Unknown_0x76F8E

Unknown_0x76F8C:
	sub $06

Unknown_0x76F8E:
	add a,l
	ld l,a
	jr nc,Unknown_0x76F93
	inc h

Unknown_0x76F93:
	ld a,[hl]
	jr Unknown_0x76F98

Unknown_0x76F96:
	ld a,$FF

Unknown_0x76F98:
	ld e,$27
	ld [de],a
	ret

Unknown_0x76F9C:
	ld a,[$DD1A]
	cp $11
	ret nz
	ld hl,$DB51
	ld e,$04
	ld a,[de]
	sub [hl]
	cp $50
	ld e,$0E
	ld a,[de]
	jr c,Unknown_0x76FB8
	rlca
	jr c,Unknown_0x76FBB

Unknown_0x76FB3:
	call Unknown_0x74F04
	jr Unknown_0x76FBB

Unknown_0x76FB8:
	rlca
	jr c,Unknown_0x76FB3

Unknown_0x76FBB:
	ld hl,$DB53
	ld e,$07
	ld a,[de]
	sub [hl]
	cp $40
	ld e,$10
	ld a,[de]
	jr c,Unknown_0x76FCE
	rlca
	ret c
	jp Unknown_0x76668

Unknown_0x76FCE:
	rlca
	ret nc
	jp Unknown_0x76668
	ld a,[bc]
	inc bc
	ld [$DD1A],a
	ret
	ld a,[$DD1A]
	ld h,a
	and $0F
	dec a
	rlca
	ld l,a
	rlca
	add a,l
	ld l,a
	ld a,h
	swap a
	and $0F
	sub $02
	swap a
	ld h,a
	rrca
	add a,h
	add a,l
	ld hl,$7008
	add a,l
	ld l,a
	jr nc,Unknown_0x76FFA
	inc h

Unknown_0x76FFA:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hli]
	ld [de],a
	jp Unknown_0x20BE

UnknownData_0x77008:
INCBIN "baserom.gb", $77008, $77062 - $77008
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,[$DD1A]
	cp $11
	jr z,Unknown_0x77076
	ld a,$06
	add a,l
	ld l,a
	jr nc,Unknown_0x77076
	inc h

Unknown_0x77076:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hli]
	ld [de],a
	jp Unknown_0x20BE

UnknownData_0x77084:
INCBIN "baserom.gb", $77084, $7716E - $77084
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,[$DD1A]
	dec a
	and $01
	rlca
	ld e,a
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x77183
	inc h

Unknown_0x77183:
	ld e,$0D
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld e,$11
	ld a,[hli]
	ld [de],a
	jp Unknown_0x20BE

UnknownData_0x77191:
INCBIN "baserom.gb", $77191, $77212 - $77191
	call Unknown_0x76E58
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x7721E
	dec a
	ld [de],a
	ret

Unknown_0x7721E:
	ld a,$08
	ld [de],a
	ld e,$41
	ld a,[de]
	cp $10
	ret nc
	inc a
	ld [de],a
	ld a,$1A
	ld e,$D9
	jp Unknown_0x2319

UnknownData_0x77230:
INCBIN "baserom.gb", $77230, $77255 - $77230
	ld a,[$DD1A]
	swap a
	and $0F
	cp $03
	jp c,Unknown_0x1EC0
	jp Unknown_0x765F7
	push bc
	ld a,$1B

Unknown_0x77267:
	push af
	ld e,$D9
	call Unknown_0x2319
	pop af
	inc a
	cp $1F
	jr c,Unknown_0x77267
	pop bc
	ret

UnknownData_0x77275:
INCBIN "baserom.gb", $77275, $77297 - $77275
	push bc
	ld a,[$DD1A]
	ld e,a
	swap a
	and $0F
	sub $03
	ld l,a
	cp $02
	jr z,Unknown_0x772C5
	ld a,e
	and $0F
	dec a
	and $01
	rlca
	ld e,a
	ld a,l
	rlca
	rlca
	add a,e
	ld bc,$72DB
	add a,c
	ld c,a
	jr nc,Unknown_0x772BB
	inc b

Unknown_0x772BB:
	ld hl,$DD1F
	ld a,[bc]
	ld [hli],a
	inc bc
	ld a,[bc]
	ld [hl],a
	pop bc
	ret

Unknown_0x772C5:
	ld e,$10
	ld a,[de]
	rlca
	jr c,Unknown_0x772D0
	ld bc,Unknown_0x772F6
	jr Unknown_0x772D3

Unknown_0x772D0:
	ld bc,$72F3

Unknown_0x772D3:
	ld hl,$DD1F
	ld a,c
	ld [hli],a
	ld [hl],b
	pop bc
	ret

UnknownData_0x772DB:
INCBIN "baserom.gb", $772DB, $772F6 - $772DB

Unknown_0x772F6:
INCBIN "baserom.gb", $772F6, $772F9 - $772F6
	ld hl,$DD1F
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[hli]
	cp $FF
	jr nz,Unknown_0x7730A
	ld a,$01
	ld e,$27
	ld [de],a
	ret

Unknown_0x7730A:
	push bc
	ld b,h
	ld c,l
	ld hl,$DD1F
	ld [hl],c
	inc hl
	ld [hl],b
	add a,$1F
	ld e,$D9
	call Unknown_0x2319
	xor a
	ld e,$27
	ld [de],a
	pop bc
	ret

UnknownData_0x77320:
INCBIN "baserom.gb", $77320, $77329 - $77320
	ld hl,$DD16
	bit 4,[hl]
	jr nz,Unknown_0x77335
	set 4,[hl]
	xor a
	jr Unknown_0x77337

Unknown_0x77335:
	ld a,$01

Unknown_0x77337:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x7733B:
INCBIN "baserom.gb", $7733B, $773DC - $7733B
	xor a
	ld [$DD28],a
	ret

UnknownData_0x773E1:
INCBIN "baserom.gb", $773E1, $773F3 - $773E1
	call Unknown_0x764E9
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$6D4A
	call Unknown_0x233C
	ret nc
	ld e,$1D
	ld bc,Unknown_0x77434
	jp Unknown_0x0846
	ld a,[$DD1A]
	swap a
	and $0F
	cp $05
	jr z,Unknown_0x77426
	ld e,$07
	ld hl,$DD17
	ld a,[de]
	sub [hl]
	cp $40
	jr c,Unknown_0x7742F
	jr Unknown_0x7742B

Unknown_0x77426:
	call Unknown_0x202B
	jr c,Unknown_0x7742F

Unknown_0x7742B:
	ld a,$01
	jr Unknown_0x77430

Unknown_0x7742F:
	xor a

Unknown_0x77430:
	ld e,$41
	ld [de],a
	ret

Unknown_0x77434:
INCBIN "baserom.gb", $77434, $77452 - $77434
	call Unknown_0x764E9
	call Unknown_0x77468
	ret nz
	ld b,$00
	ld e,$4C
	ld a,[de]
	cp $3D
	jr nc,Unknown_0x77463
	inc b

Unknown_0x77463:
	ld e,$5C
	ld a,b
	ld [de],a
	ret

Unknown_0x77468:
	ld bc,$6D4A
	call Unknown_0x255B
	ld e,$41
	ld a,[de]
	or a
	ret nz
	call Unknown_0x76B9D
	call Unknown_0x0C71
	call Unknown_0x76B86
	ld h,d
	ld l,$60
	ld [hl],$3F
	ld l,$44
	ld [hl],$16
	xor a
	ret

UnknownData_0x77487:
INCBIN "baserom.gb", $77487, $7749D - $77487
	push bc
	ld bc,$5000
	ld h,$04
	call Unknown_0x30E0
	pop bc
	ret
	ld hl,$4CE4
	ld a,$03
	call Unknown_0x05CF
	ret

UnknownData_0x774B1:
INCBIN "baserom.gb", $774B1, $77542 - $774B1
	call Unknown_0x76501
	ld bc,Unknown_0x77551
	call Unknown_0x24E8
	ld bc,$74B1
	jp Unknown_0x255B

Unknown_0x77551:
INCBIN "baserom.gb", $77551, $77595 - $77551
	call Unknown_0x76501
	ld bc,$74B1
	call Unknown_0x255B
	ld e,$26
	ld a,[de]
	or a
	jr z,Unknown_0x775A7
	dec a
	ld [de],a
	ret

Unknown_0x775A7:
	ld a,$04
	ld [de],a
	ld e,$40
	ld a,[de]
	add a,$02
	ld e,$D9
	call Unknown_0x2319
	ld e,$40
	ld a,[de]
	inc a
	cp $04
	jr c,Unknown_0x775BD
	xor a

Unknown_0x775BD:
	ld [de],a
	ret
	ld hl,$DD16
	bit 4,[hl]
	jr nz,Unknown_0x775C9
	xor a
	jr Unknown_0x775CB

Unknown_0x775C9:
	ld a,$01

Unknown_0x775CB:
	ld e,$27
	ld [de],a
	ret

UnknownData_0x775CF:
INCBIN "baserom.gb", $775CF, $775F7 - $775CF
	call Unknown_0x76501
	jp Unknown_0x0DA4
	ld a,[bc]
	ld l,a
	inc bc
	ld a,[bc]
	ld h,a
	inc bc
	ld a,[bc]
	inc bc
	push bc
	ld c,a
	ld e,$5B
	ld a,[de]
	sub c
	rlca
	ld b,a
	rlca
	add a,b
	add a,l
	ld l,a
	jr nc,Unknown_0x77614
	inc h

Unknown_0x77614:
	call Unknown_0x20F9
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ld b,h
	ld c,l
	call Unknown_0x1FD1
	pop bc
	ret

UnknownData_0x77625:
INCBIN "baserom.gb", $77625, $7767E - $77625
	call Unknown_0x76501
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$7625
	call Unknown_0x255B
	jp Unknown_0x77765

UnknownData_0x77693:
INCBIN "baserom.gb", $77693, $77759 - $77693
	call Unknown_0x76501
	call Unknown_0x0DA4
	ld bc,$7625
	call Unknown_0x255B

Unknown_0x77765:
	ld a,[$DD2C]
	bit 1,a
	ret z
	ld [$FF00+$80],a
	ld bc,$0010
	ld h,$02
	call Unknown_0x30E0
	ld a,[$FF00+$80]
	bit 3,a
	jr nz,Unknown_0x777B8
	call Unknown_0x1EC0
	cpl
	ld [de],a
	ld e,$26
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld bc,Unknown_0x777C1
	call Unknown_0x0FAF
	jr z,Unknown_0x777B8
	ld l,$46
	ld e,l
	ld a,[de]
	ld [hl],a
	ld bc,Unknown_0x777C4
	call Unknown_0x0FAF
	jr z,Unknown_0x777B8
	ld l,$46
	ld e,l
	ld a,[de]
	ld [hl],a
	ld bc,Unknown_0x777C7
	call Unknown_0x0FAF
	jr z,Unknown_0x777B8
	ld l,$46
	ld e,l
	ld a,[de]
	ld [hl],a
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x777B8:
	ld h,d
	ld e,$03
	ld bc,$4966
	jp Unknown_0x0849

Unknown_0x777C1:
INCBIN "baserom.gb", $777C1, $777C4 - $777C1

Unknown_0x777C4:
INCBIN "baserom.gb", $777C4, $777C7 - $777C4

Unknown_0x777C7:
INCBIN "baserom.gb", $777C7, $777EC - $777C7
	call Unknown_0x76501
	call Unknown_0x1EE6
	call Unknown_0x0DA4
	ld bc,$74B1
	jp Unknown_0x255B

UnknownData_0x777FB:
INCBIN "baserom.gb", $777FB, $77863 - $777FB
	call Unknown_0x76501
	call Unknown_0x1EE6
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	push bc
	ld e,$5B
	ld a,[de]
	sub $14
	rlca
	rlca
	ld hl,$788D
	add a,l
	ld l,a
	jr nc,Unknown_0x7787F
	inc h

Unknown_0x7787F:
	call Unknown_0x2123
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld b,h
	ld c,l
	call Unknown_0x1FD1
	pop bc
	ret

UnknownData_0x7788D:
INCBIN "baserom.gb", $7788D, $778B0 - $7788D
	call Unknown_0x76501
	call Unknown_0x0DA4
	ld bc,$74B1
	jp Unknown_0x255B
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$42
	ld a,[hl]
	ld e,$45
	ld [de],a
	ld l,$41
	ld a,[hl]
	dec a
	cp $05
	jr c,Unknown_0x778D8
	cp $0D
	jr nc,Unknown_0x778D8
	ld e,$45
	ld a,[de]
	cpl
	inc a
	ld [de],a

Unknown_0x778D8:
	ld a,[hl]
	dec a
	ld hl,$78E7
	add a,l
	ld l,a
	jr nc,Unknown_0x778E2
	inc h

Unknown_0x778E2:
	ld a,[hl]
	ld e,$15
	ld [de],a
	ret

UnknownData_0x778E7:
INCBIN "baserom.gb", $778E7, $778F7 - $778E7
	ld e,$48
	ld a,[de]
	ld h,a
	ld l,$41
	ld a,[hl]
	dec a
	ld hl,$7914
	rlca
	rlca
	add a,l
	ld l,a
	jr nc,Unknown_0x77909
	inc h

Unknown_0x77909:
	call Unknown_0x20F9
	ld e,$0F
	ld a,[hli]
	ld [de],a
	inc e
	ld a,[hli]
	ld [de],a
	ret

UnknownData_0x77914:
INCBIN "baserom.gb", $77914, $779AE - $77914
	call Unknown_0x76501
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$7625
	call Unknown_0x255B
	ld a,[$DD2C]
	bit 1,a
	ret z
	ld [$FF00+$80],a
	ld bc,$0020
	ld h,$02
	call Unknown_0x30E0
	ld a,[$FF00+$80]
	bit 3,a
	jr nz,Unknown_0x779F7
	call Unknown_0x1EC0
	cpl
	inc a
	ld [de],a
	ld bc,Unknown_0x77A00
	call Unknown_0x0FAF
	jr z,Unknown_0x779F7
	ld l,$46
	ld e,l
	ld a,[de]
	ld [hl],a
	ld e,$50
	ld hl,$4299
	ld a,$1E
	call Unknown_0x05CF
	ld a,[$FF00+$9A]
	ld d,a
	ld h,d
	jp Unknown_0x0BBA

Unknown_0x779F7:
	ld h,d
	ld e,$03
	ld bc,Unknown_0x74966
	jp Unknown_0x0849

Unknown_0x77A00:
INCBIN "baserom.gb", $77A00, $77B01 - $77A00
	call Unknown_0x76501
	call Unknown_0x1ED3
	call Unknown_0x0DA4
	ld bc,$7625
	jp Unknown_0x255B

UnknownData_0x77B10:
INCBIN "baserom.gb", $77B10, $77B4D - $77B10
	call Unknown_0x76501
	ld e,$3F
	ld a,[de]
	srl a
	cp $01
	jr z,Unknown_0x77B5F
	jp c,Unknown_0x77B65
	jp Unknown_0x77BB4

Unknown_0x77B5F:
	call Unknown_0x77B65
	jp Unknown_0x77BB4

Unknown_0x77B65:
	ld bc,$7B8C

Unknown_0x77B68:
	ld e,$5B
	ld a,[de]
	sub $1F
	rlca
	ld e,a
	rlca
	rlca
	add a,e
	add a,c
	ld c,a
	jr nc,Unknown_0x77B77
	inc b

Unknown_0x77B77:
	ld a,$05

Unknown_0x77B79:
	push af
	call Unknown_0x24E8
	push bc
	ld bc,$74B1
	call Unknown_0x255B
	pop bc
	pop af
	dec a
	jr nz,Unknown_0x77B79
	jp Unknown_0x77BFA

UnknownData_0x77B8C:
INCBIN "baserom.gb", $77B8C, $77BB4 - $77B8C

Unknown_0x77BB4:
	ld bc,$7BBA
	jp Unknown_0x77B68

UnknownData_0x77BBA:
INCBIN "baserom.gb", $77BBA, $77BE2 - $77BBA
	ld e,$5B
	ld a,[de]
	sub $1F
	rlca
	ld l,a
	rlca
	add a,l
	ld l,a
	ld a,[bc]
	inc bc
	ld h,a
	add a,l
	ld e,$15
	ld [de],a
	ld a,h
	sub $0E
	ld e,$3F
	ld [de],a
	ret

Unknown_0x77BFA:
	ld e,$5B
	ld a,[de]
	sub $1F
	rlca
	ld bc,$7C0E
	add a,c
	ld c,a
	jp nc,Unknown_0x24E8
	jr nc,Unknown_0x77C0B
	inc b

Unknown_0x77C0B:
	jp Unknown_0x24E8

UnknownData_0x77C0E:
INCBIN "baserom.gb", $77C0E, $77C4B - $77C0E
	call Unknown_0x76501
	call Unknown_0x1ED3
	jp Unknown_0x0DA4
	push bc
	ld e,$48
	ld a,$FF
	ld [de],a
	call Unknown_0x0647
	and $03
	ld l,a
	cp $02
	jr c,Unknown_0x77C72
	ld a,[$DD27]
	ld b,a
	ld c,$4C
	ld a,[bc]
	or a
	jr nz,Unknown_0x77C74
	ld a,l
	sub $02
	ld l,a

Unknown_0x77C72:
	ld b,$A0

Unknown_0x77C74:
	ld e,$45
	ld c,e
	ld a,[bc]
	ld [de],a
	ld a,l
	ld hl,$7C96
	ld e,a
	rlca
	rlca
	add a,e
	add a,l
	ld l,a
	jr nc,Unknown_0x77C86
	inc h

Unknown_0x77C86:
	call Unknown_0x20F9
	ld e,$12
	ld a,[hli]
	ld [de],a
	ld a,b
	ld b,h
	ld c,l
	ld h,a
	call Unknown_0x24EC
	pop bc
	ret

UnknownData_0x77C96:
INCBIN "baserom.gb", $77C96, $77D2A - $77C96
	push bc
	ld hl,$DD28
	ld a,[hl]
	cp $06
	jr nc,Unknown_0x77D3F
	inc [hl]
	ld hl,$7D52
	add a,l
	ld l,a
	jr nc,Unknown_0x77D3C
	inc h

Unknown_0x77D3C:
	ld a,[hl]
	jr Unknown_0x77D44

Unknown_0x77D3F:
	call Unknown_0x0647
	and $03

Unknown_0x77D44:
	ld bc,$7D58
	rlca
	add a,c
	ld c,a
	jr nc,Unknown_0x77D4D
	inc b

Unknown_0x77D4D:
	call Unknown_0x24E8
	pop bc
	ret

UnknownData_0x77D52:
INCBIN "baserom.gb", $77D52, $77D60 - $77D52
	call Unknown_0x76501
	jp Unknown_0x0DA4

UnknownData_0x77D66:
INCBIN "baserom.gb", $77D66, $77D74 - $77D66
	ld hl,$DD28
	ld a,[hl]
	inc [hl]
	ld e,$27
	ld [de],a
	ret

UnknownData_0x77D7D:
INCBIN "baserom.gb", $77D7D, $77E27 - $77D7D
	push bc
	call Unknown_0x0647
	and $07
	rlca
	rlca
	rlca
	ld hl,$7E48
	add a,l
	ld l,a
	jr nc,Unknown_0x77E38
	inc h

Unknown_0x77E38:
	call Unknown_0x20F9
	call Unknown_0x2123
	call Unknown_0x20BE
	ld b,h
	ld c,l
	call Unknown_0x24E8
	pop bc
	ret

UnknownData_0x77E48:
INCBIN "baserom.gb", $77E48, $78000 - $77E48

SECTION "Bank1E", ROMX, BANK[$1E]

UnknownData_0x78000:
INCBIN "baserom.gb", $78000, $78232 - $78000
	ld hl,Unknown_0x7846E
	ld de,$DDE5
	ld bc,$0030
	call Unknown_0x0621
	ld hl,Unknown_0x79B6F
	ld de,$DE15
	ld bc,$00C6
	call Unknown_0x0621
	ld a,$80
	ld [$FF00+$26],a
	ld a,$77
	ld [$FF00+$24],a
	ld a,$FF
	ld [$FF00+$25],a
	ld a,$FF
	ld [$CE01],a
	ld [$CE02],a
	ld [$CED2],a
	ld hl,$CE06
	ld b,$14
	ld a,$AA

Unknown_0x78268:
	ld [hli],a
	dec b
	jr nz,Unknown_0x78268
	ld hl,Unknown_0x30E0
	call Unknown_0x3001
	ld e,$FF
	ld a,$1F
	ld hl,$4232
	call Unknown_0x05E5
	ld e,$FF
	call Unknown_0x78299
	call Unknown_0x78387
	ld hl,$FF14
	set 7,[hl]
	ld hl,$FF19
	set 7,[hl]
	ld hl,$FF1E
	set 7,[hl]
	ld hl,$FF23
	set 7,[hl]
	ret

Unknown_0x78299:
	ld a,e
	cp $FF
	jp z,Unknown_0x7831C
	ld d,$00
	ld a,[$CE03]
	and a
	jr z,Unknown_0x782D5
	ld hl,$5CF9
	add hl,de
	and [hl]
	jr z,Unknown_0x782D5
	ld bc,$0003

Unknown_0x782B1:
	ld hl,$5CF9
	add hl,de
	ld a,[hl]
	ld hl,$CECA
	add hl,bc
	and [hl]
	jr z,Unknown_0x782D0
	ld hl,$CECE
	add hl,bc
	ld a,[hl]
	ld hl,$5D5B
	add hl,de
	cp [hl]
	jp c,Unknown_0x7831B
	ld hl,$CE52
	add hl,bc
	ld [hl],$00

Unknown_0x782D0:
	dec c
	bit 7,c
	jr z,Unknown_0x782B1

Unknown_0x782D5:
	ld hl,$5CF9
	add hl,de
	ld a,[hl]
	ld [$CE04],a
	ld hl,$5D5B
	add hl,de
	ld a,[hl]
	ld c,a
	ld hl,$5C35
	add hl,de
	add hl,de
	ld a,[hli]
	ld e,a
	ld d,[hl]
	ld a,[de]
	ld h,a
	ld l,c
	push hl
	ld bc,$0003

Unknown_0x782F2:
	ld hl,$CE52
	add hl,bc
	ld a,[hl]
	and a
	jr nz,Unknown_0x78312
	call Unknown_0x2B97
	ld hl,sp+$00
	ld a,[hl]
	ld hl,$CECE
	add hl,bc
	ld [hl],a
	ld a,[$CE04]
	ld hl,$CECA
	add hl,bc
	ld [hl],a
	pop hl
	dec h
	push hl
	jr z,Unknown_0x78317

Unknown_0x78312:
	dec c
	bit 7,c
	jr z,Unknown_0x782F2

Unknown_0x78317:
	pop hl
	jp Unknown_0x78357

Unknown_0x7831B:
	ret

Unknown_0x7831C:
	ld bc,$0003

Unknown_0x7831F:
	ld hl,$CE52
	add hl,bc
	ld [hl],b
	ld hl,$CECA
	add hl,bc
	ld [hl],b
	ld hl,$CECE
	add hl,bc
	ld [hl],$FF
	dec c
	bit 7,c
	jr z,Unknown_0x7831F
	ld hl,Unknown_0x78343
	ld de,$CE1A
	ld c,$14

Unknown_0x7833C:
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,Unknown_0x7833C
	ret

Unknown_0x78343:
INCBIN "baserom.gb", $78343, $78357 - $78343

Unknown_0x78357:
	ld a,[$CECA]
	ld hl,$CECB
	ld c,$03

Unknown_0x7835F:
	or [hl]
	inc hl
	dec c
	jr nz,Unknown_0x7835F
	ld [$CE03],a
	ret

Unknown_0x78368:
	ld b,$03

Unknown_0x7836A:
	ld h,$CE
	ld a,$52
	add a,b
	ld l,a
	ld a,[hl]
	and a
	jr nz,Unknown_0x7837F
	ld a,$CE
	add a,b
	ld l,a
	ld [hl],$FF
	add a,$FC
	ld l,a
	ld [hl],$00

Unknown_0x7837F:
	dec b
	bit 7,b
	jr z,Unknown_0x7836A
	call Unknown_0x78357

Unknown_0x78387:
	ld de,$CE2E
	ld a,[$CE03]
	bit 0,a
	jr z,Unknown_0x78393
	ld e,$1A

Unknown_0x78393:
	ld b,$00
	ld hl,$CE06
	ld c,$10

Unknown_0x7839A:
	ld a,[de]
	cp [hl]
	jr z,Unknown_0x783A6
	ld [hl],a
	ld [$FF00+c],a
	ld a,c
	cp $12
	jr nz,Unknown_0x783A6
	inc b

Unknown_0x783A6:
	inc l
	inc e
	inc c
	ld a,c
	cp $15
	jr nz,Unknown_0x7839A
	dec b
	jr nz,Unknown_0x783B8
	ld a,[$CE0A]
	set 7,a
	ld [$FF00+$14],a

Unknown_0x783B8:
	ld de,$CE34
	ld a,[$CE03]
	bit 1,a
	jr z,Unknown_0x783C4
	ld e,$20

Unknown_0x783C4:
	ld b,$00
	ld hl,$CE0C
	ld c,$16

Unknown_0x783CB:
	ld a,[de]
	cp [hl]
	jr z,Unknown_0x783D7
	ld [hl],a
	ld [$FF00+c],a
	ld a,c
	cp $17
	jr nz,Unknown_0x783D7
	inc b

Unknown_0x783D7:
	inc l
	inc e
	inc c
	ld a,c
	cp $1A
	jr nz,Unknown_0x783CB
	dec b
	jr nz,Unknown_0x783E9
	ld a,[$CE0F]
	set 7,a
	ld [$FF00+$19],a

Unknown_0x783E9:
	ld de,$CE38
	ld a,[$CE03]
	bit 4,a
	jr z,Unknown_0x783F5
	ld e,$24

Unknown_0x783F5:
	ld hl,$CE10
	ld c,$1A

Unknown_0x783FA:
	ld a,[de]
	cp [hl]
	jr z,Unknown_0x78400
	ld [hl],a
	ld [$FF00+c],a

Unknown_0x78400:
	inc l
	inc e
	inc c
	ld a,c
	cp $1F
	jr nz,Unknown_0x783FA
	ld de,$CE3E
	ld a,[$CE03]
	bit 3,a
	jr z,Unknown_0x78414
	ld e,$2A

Unknown_0x78414:
	ld b,$00
	ld hl,$CE16
	ld c,$20

Unknown_0x7841B:
	ld a,[de]
	cp [hl]
	jr z,Unknown_0x78427
	ld [hl],a
	ld [$FF00+c],a
	ld a,c
	cp $21
	jr nz,Unknown_0x78427
	inc b

Unknown_0x78427:
	inc l
	inc e
	inc c
	ld a,c
	cp $24
	jr nz,Unknown_0x7841B
	dec b
	jr nz,Unknown_0x78439
	ld a,[$CE19]
	set 7,a
	ld [$FF00+$23],a

Unknown_0x78439:
	ld a,[$CE03]
	ld c,a
	ld a,[$CE46]
	bit 0,c
	jr z,Unknown_0x78447
	ld a,[$CE42]

Unknown_0x78447:
	ld b,a
	ld a,[$CE47]
	bit 1,c
	jr z,Unknown_0x78452
	ld a,[$CE43]

Unknown_0x78452:
	or b
	ld b,a
	ld a,[$CE48]
	bit 4,c
	jr z,Unknown_0x7845E
	ld a,[$CE44]

Unknown_0x7845E:
	or b
	ld b,a
	ld a,[$CE49]
	bit 3,c
	jr z,Unknown_0x7846A
	ld a,[$CE45]

Unknown_0x7846A:
	or b
	ld [$FF00+$25],a
	ret

Unknown_0x7846E:
INCBIN "baserom.gb", $7846E, $79B6F - $7846E

Unknown_0x79B6F:
INCBIN "baserom.gb", $79B6F, $79DBD - $79B6F

Unknown_0x79DBD:
	ld a,[hl]
	and $07
	ret z
	ld b,a
	ld c,$00

Unknown_0x79DC4:
	push bc
	ld a,$00
	ld [$FF00+c],a
	ld a,$30
	ld [$FF00+c],a
	ld b,$10

Unknown_0x79DCD:
	ld e,$08
	ld a,[hli]
	ld d,a

Unknown_0x79DD1:
	bit 0,d
	ld a,$10
	jr nz,Unknown_0x79DD9
	ld a,$20

Unknown_0x79DD9:
	ld [$FF00+c],a
	ld a,$30
	ld [$FF00+c],a
	rr d
	dec e
	jr nz,Unknown_0x79DD1
	dec b
	jr nz,Unknown_0x79DCD
	ld a,$20
	ld [$FF00+c],a
	ld a,$30
	ld [$FF00+c],a
	pop bc
	dec b
	ret z
	call Unknown_0x79DF3
	jr Unknown_0x79DC4

Unknown_0x79DF3:
	ld de,$1B58

Unknown_0x79DF6:
	nop
	nop
	nop
	dec de
	ld a,d
	or e
	jr nz,Unknown_0x79DF6
	ret
	ld de,$06D6

Unknown_0x79E02:
	nop
	nop
	nop
	dec de
	ld a,d
	or e
	jr nz,Unknown_0x79E02
	ret

Unknown_0x79E0B:
	ld hl,Unknown_0x79E7C
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	ld a,[$FF00+$00]
	and $03
	cp $03
	jr nz,Unknown_0x79E61
	ld a,$20
	ld [$FF00+$00],a
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	call Unknown_0x79DF3
	ld a,$30
	ld [$FF00+$00],a
	call Unknown_0x79DF3
	ld a,$10
	ld [$FF00+$00],a
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	call Unknown_0x79DF3
	ld a,$30
	ld [$FF00+$00],a
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	ld a,[$FF00+$00]
	call Unknown_0x79DF3
	ld a,[$FF00+$00]
	and $03
	cp $03
	jr nz,Unknown_0x79E61
	ld hl,Unknown_0x79E6C
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	sub a
	ret

Unknown_0x79E61:
	ld hl,Unknown_0x79E6C
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	scf
	ret

Unknown_0x79E6C:
INCBIN "baserom.gb", $79E6C, $79E7C - $79E6C

Unknown_0x79E7C:
INCBIN "baserom.gb", $79E7C, $79E8C - $79E7C

Unknown_0x79E8C:
	ld a,[$CD00]
	push af
	ld a,$E4
	ld [$CD00],a
	ld [$FF00+$47],a
	push de
	ld de,$8800
	call Unknown_0x0708
	ld hl,$9800
	ld de,$000C
	ld a,$80
	ld c,$0D

Unknown_0x79EA8:
	ld b,$14

Unknown_0x79EAA:
	ld [hli],a
	inc a
	dec b
	jr nz,Unknown_0x79EAA
	add hl,de
	dec c
	jr nz,Unknown_0x79EA8
	ld a,$01
	ld [$FF00+$40],a
	call Unknown_0x0483
	call Unknown_0x79DF3
	pop hl
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	call Unknown_0x0452
	pop af
	ld [$CD00],a
	ld [$FF00+$47],a
	ret

Unknown_0x79ECE:
	ld hl,Unknown_0x79EE8
	ld bc,$0010
	ld e,$08

Unknown_0x79ED6:
	push hl
	push bc
	push de
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	pop de
	pop bc
	pop hl
	add hl,bc
	dec e
	jr nz,Unknown_0x79ED6
	ret

UnknownData_0x79EE7:
INCBIN "baserom.gb", $79EE7, $79EE8 - $79EE7

Unknown_0x79EE8:
INCBIN "baserom.gb", $79EE8, $79F68 - $79EE8
	ld a,[$DEED]
	or a
	ret z
	xor a
	ld hl,$DEEE
	ld bc,$0010
	call Unknown_0x062F
	call Unknown_0x79DF3
	ld d,$03
	call Unknown_0x79FEB
	call Unknown_0x79ECE
	ld hl,Unknown_0x7A087
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	ld hl,Unknown_0x7B274
	ld de,$60A7
	call Unknown_0x79E8C
	ld hl,Unknown_0x7AF8A
	ld de,$60C7
	call Unknown_0x79E8C
	ld hl,$DEEE
	ld a,$98
	inc a
	ld [hli],a
	ld [hl],$00
	inc hl
	xor a
	ld bc,$000E
	call Unknown_0x062F
	ld hl,Unknown_0x7A0D7
	ld de,$DEEE
	call Unknown_0x79E8C
	ld hl,$DEEE
	ld a,$98
	inc a
	ld [hli],a
	ld [hl],$01
	inc hl
	xor a
	ld bc,$000E
	call Unknown_0x062F
	ld hl,Unknown_0x7AB24
	ld de,$DEEE
	call Unknown_0x79E8C
	ld hl,Unknown_0x7ACC1
	ld de,$60B7
	call Unknown_0x79E8C
	ld hl,Unknown_0x7A097
	call Unknown_0x79DBD
	ret
	call Unknown_0x79E0B
	ld a,$00
	rla
	ld [$DEED],a
	ret

Unknown_0x79FEB:
	ld a,[$DEED]
	or a
	ret z
	ld hl,$DEEE
	ld a,$B8
	inc a
	ld [hli],a
	ld [hl],d
	ld hl,$DEEE
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	ret
	xor a
	ld [$FF00+$84],a
	call Unknown_0x7A039
	ret z
	jp Unknown_0x79DF3

Unknown_0x7A00C:
	xor a
	ld [$FF00+$84],a
	jr Unknown_0x7A039
	ld a,[$DEED]
	or a
	ret z
	ld a,$80
	ld [$FF00+$84],a
	ld a,e
	ld [$DEFE],a
	ld a,[$CD00]
	or a
	ld a,$34
	jr z,Unknown_0x7A028
	ld a,$35

Unknown_0x7A028:
	call Unknown_0x7A042
	jp Unknown_0x79DF3
	call Unknown_0x7A035
	ret z
	jp Unknown_0x79DF3

Unknown_0x7A035:
	ld a,$80
	ld [$FF00+$84],a

Unknown_0x7A039:
	ld a,[$DEED]
	or a
	ret z
	ld a,e
	ld [$DEFE],a

Unknown_0x7A042:
	ld l,a
	ld h,$00
	add hl,hl
	add hl,hl
	ld c,l
	ld b,h
	ld hl,$DEEE
	ld [hl],$51
	inc hl
	ld a,$04

Unknown_0x7A051:
	ld [hl],c
	inc hl
	ld [hl],b
	inc hl
	inc bc
	dec a
	jr nz,Unknown_0x7A051
	ld a,[$FF00+$84]
	or e
	ld [hli],a
	xor a
	ld bc,$0006
	call Unknown_0x062F
	ld hl,$DEEE
	call Unknown_0x79DBD
	xor a
	inc a
	ret
	ld a,[$DEED]
	or a
	ret z
	ld hl,Unknown_0x7BADF
	swap e
	ld a,e
	and $F0
	ld c,a
	ld a,e
	and $0F
	ld b,a
	add hl,bc
	call Unknown_0x79DBD
	call Unknown_0x79DF3
	ret

Unknown_0x7A087:
INCBIN "baserom.gb", $7A087, $7A097 - $7A087

Unknown_0x7A097:
INCBIN "baserom.gb", $7A097, $7A0D7 - $7A097

Unknown_0x7A0D7:
INCBIN "baserom.gb", $7A0D7, $7AB24 - $7A0D7

Unknown_0x7AB24:
INCBIN "baserom.gb", $7AB24, $7ACC1 - $7AB24

Unknown_0x7ACC1:
INCBIN "baserom.gb", $7ACC1, $7AF8A - $7ACC1

Unknown_0x7AF8A:
INCBIN "baserom.gb", $7AF8A, $7B274 - $7AF8A

Unknown_0x7B274:
INCBIN "baserom.gb", $7B274, $7BADF - $7B274

Unknown_0x7BADF:
INCBIN "baserom.gb", $7BADF, $7C000 - $7BADF

SECTION "Bank1F", ROMX, BANK[$1F]

UnknownData_0x7C000:
INCBIN "baserom.gb", $7C000, $7C232 - $7C000
	ld a,[$DDE4]
	cp e
	ret z
	ld a,e
	ld [$DDE4],a
	ld b,e
	ld hl,$CE56
	ld c,$04
	xor a

Unknown_0x7C242:
	ld [hli],a
	dec c
	jr nz,Unknown_0x7C242
	ld hl,Unknown_0x7C281
	ld de,$CE2E
	ld c,$14

Unknown_0x7C24E:
	ld a,[hli]
	ld [de],a
	inc de
	dec c
	jr nz,Unknown_0x7C24E
	ld a,$FF
	cp b
	ret z
	ld e,b
	ld d,$00
	ld hl,Unknown_0x7FE0E
	add hl,de
	add hl,de
	ld a,[hli]
	ld e,a
	ld d,[hl]
	ld a,[de]
	ld h,a
	push hl
	ld bc,$0007

Unknown_0x7C269:
	ld hl,$CE52
	add hl,bc
	ld a,[hl]
	and a
	jr nz,Unknown_0x7C279
	call Unknown_0x2B97
	pop hl
	dec h
	push hl
	jr z,Unknown_0x7C27F

Unknown_0x7C279:
	dec c
	ld a,$03
	cp c
	jr nz,Unknown_0x7C269

Unknown_0x7C27F:
	pop hl
	ret

Unknown_0x7C281:
INCBIN "baserom.gb", $7C281, $7FE0E - $7C281

Unknown_0x7FE0E:
INCBIN "baserom.gb", $7FE0E, $80000 - $7FE0E
