;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank00", ROM0[$0000]

add_hl_a:
    push BC                                            ;; 00:0000 $c5
    ld   B, $00                                        ;; 00:0001 $06 $00
    ld   C, A                                          ;; 00:0003 $4f
    add  HL, BC                                        ;; 00:0004 $09
    pop  BC                                            ;; 00:0005 $c1
    ret                                                ;; 00:0006 $c9
    db   $00                                           ;; 00:0007 ?

rst_00_0008:
    jp   jp_00_08be                                    ;; 00:0008 $c3 $be $08

swapHL_DE:
    push DE                                            ;; 00:000b $d5
    push HL                                            ;; 00:000c $e5
    pop  DE                                            ;; 00:000d $d1
    pop  HL                                            ;; 00:000e $e1
    ret                                                ;; 00:000f $c9

rst_00_0010:
    jp   jp_00_00c7                                    ;; 00:0010 $c3 $c7 $00

popAll:
    pop  HL                                            ;; 00:0013 $e1
    pop  DE                                            ;; 00:0014 $d1
    pop  BC                                            ;; 00:0015 $c1
    pop  AF                                            ;; 00:0016 $f1
    ret                                                ;; 00:0017 $c9

rst_00_0018:
    push AF                                            ;; 00:0018 $f5
    ld   A, $c0                                        ;; 00:0019 $3e $c0
    call hFF80                                         ;; 00:001b $cd $80 $ff
    pop  AF                                            ;; 00:001e $f1
    ret                                                ;; 00:001f $c9
    db   $c9, $00, $00, $00, $00, $00, $00, $00        ;; 00:0020 ????????

; Switch active bank to A, return old bank in A
switchBank:
    di                                                 ;; 00:0028 $f3
    push BC                                            ;; 00:0029 $c5
    ld   C, A                                          ;; 00:002a $4f
    ldh  A, [hCurrentBank]                             ;; 00:002b $f0 $8b
    jp   _switchBankSub                                ;; 00:002d $c3 $d1 $00
    db   $c3, $e3, $d3, $00, $00, $00, $00, $00        ;; 00:0030 ????????

rst_00_0038:
    jp   wD3E0                                         ;; 00:0038 $c3 $e0 $d3
    db   $71, $23, $70, $23, $c9                       ;; 00:003b ?????

SECTION "isrVBlank", ROM0[$0040]

isrVBlank:
    jp   wVBlankHandler                                ;; 00:0040 $c3 $9a $c3

storeDEatHL:
    ld   [HL], E                                       ;; 00:0043 $73
    inc  HL                                            ;; 00:0044 $23
    ld   [HL], D                                       ;; 00:0045 $72
    inc  HL                                            ;; 00:0046 $23
    ret                                                ;; 00:0047 $c9

SECTION "isrLCDC", ROM0[$0048]

isrLCDC:
    jp   wLCDCHandler                                  ;; 00:0048 $c3 $9d $c3

call_00_004b:
    push AF                                            ;; 00:004b $f5
    ld   A, L                                          ;; 00:004c $7d
    ld   [DE], A                                       ;; 00:004d $12
    inc  DE                                            ;; 00:004e $13
    ld   A, H                                          ;; 00:004f $7c

isrTimer:
    ld   [DE], A                                       ;; 00:0050 $12
    inc  DE                                            ;; 00:0051 $13
    pop  AF                                            ;; 00:0052 $f1
    ret                                                ;; 00:0053 $c9

call_00_0054:
    add  A, A                                          ;; 00:0054 $87
    add  A, A                                          ;; 00:0055 $87
    add  A, A                                          ;; 00:0056 $87
    add  A, A                                          ;; 00:0057 $87

isrSerial:
    add  A, A                                          ;; 00:0058 $87
    add  A, A                                          ;; 00:0059 $87
    ret                                                ;; 00:005a $c9
    db   $29, $29, $29                                 ;; 00:005b ???

call_00_005e:
    add  HL, HL                                        ;; 00:005e $29
    add  HL, HL                                        ;; 00:005f $29

isrJoypad:
    add  HL, HL                                        ;; 00:0060 $29
    add  HL, HL                                        ;; 00:0061 $29
    ret                                                ;; 00:0062 $c9
    db   $29, $29, $29, $29                            ;; 00:0063 ????

call_00_0067:
    add  HL, HL                                        ;; 00:0067 $29
    add  HL, HL                                        ;; 00:0068 $29
    add  HL, HL                                        ;; 00:0069 $29
    add  HL, BC                                        ;; 00:006a $09
    ret                                                ;; 00:006b $c9
    db   $29, $29                                      ;; 00:006c ??

jp_00_006e:
    add  HL, HL                                        ;; 00:006e $29
    add  HL, HL                                        ;; 00:006f $29
    add  HL, HL                                        ;; 00:0070 $29
    add  HL, HL                                        ;; 00:0071 $29
    add  HL, HL                                        ;; 00:0072 $29
    add  HL, DE                                        ;; 00:0073 $19
    ret                                                ;; 00:0074 $c9

call_00_0075:
    ld   [HL], A                                       ;; 00:0075 $77
    inc  HL                                            ;; 00:0076 $23
    inc  HL                                            ;; 00:0077 $23
    inc  HL                                            ;; 00:0078 $23
    inc  HL                                            ;; 00:0079 $23
    ret                                                ;; 00:007a $c9

call_00_007b:
    xor  A, A                                          ;; 00:007b $af

call_00_007c:
    ld   [HL+], A                                      ;; 00:007c $22
    dec  B                                             ;; 00:007d $05
    jr   NZ, call_00_007c                              ;; 00:007e $20 $fc
    ret                                                ;; 00:0080 $c9
    db   $af                                           ;; 00:0081 ?

call_00_0082:
    push AF                                            ;; 00:0082 $f5
    push DE                                            ;; 00:0083 $d5
    ld   E, A                                          ;; 00:0084 $5f
.jr_00_0085:
    ld   [HL], E                                       ;; 00:0085 $73
    inc  HL                                            ;; 00:0086 $23
    dec  BC                                            ;; 00:0087 $0b
    ld   A, C                                          ;; 00:0088 $79
    or   A, B                                          ;; 00:0089 $b0
    jr   NZ, .jr_00_0085                               ;; 00:008a $20 $f9
    pop  DE                                            ;; 00:008c $d1
    pop  AF                                            ;; 00:008d $f1
    ret                                                ;; 00:008e $c9

call_00_008f:
    push AF                                            ;; 00:008f $f5
.jr_00_0090:
    ld   A, [HL+]                                      ;; 00:0090 $2a
    ld   [DE], A                                       ;; 00:0091 $12
    inc  DE                                            ;; 00:0092 $13
    dec  B                                             ;; 00:0093 $05
    jr   NZ, .jr_00_0090                               ;; 00:0094 $20 $fa
    pop  AF                                            ;; 00:0096 $f1
    ret                                                ;; 00:0097 $c9

call_00_0098:
    push AF                                            ;; 00:0098 $f5
.jr_00_0099:
    ld   A, [HL+]                                      ;; 00:0099 $2a
    ld   [DE], A                                       ;; 00:009a $12
    inc  DE                                            ;; 00:009b $13
    dec  BC                                            ;; 00:009c $0b
    ld   A, C                                          ;; 00:009d $79
    or   A, B                                          ;; 00:009e $b0
    jr   NZ, .jr_00_0099                               ;; 00:009f $20 $f8
    pop  AF                                            ;; 00:00a1 $f1
    ret                                                ;; 00:00a2 $c9

call_00_00a3:
    call call_00_043d                                  ;; 00:00a3 $cd $3d $04
    call call_00_007c                                  ;; 00:00a6 $cd $7c $00
    jp   call_00_044e                                  ;; 00:00a9 $c3 $4e $04

call_00_00ac:
    call call_00_043d                                  ;; 00:00ac $cd $3d $04
    call call_00_0082                                  ;; 00:00af $cd $82 $00
    jp   call_00_044e                                  ;; 00:00b2 $c3 $4e $04

call_00_00b5:
    call call_00_043d                                  ;; 00:00b5 $cd $3d $04
    call call_00_008f                                  ;; 00:00b8 $cd $8f $00
    jp   call_00_044e                                  ;; 00:00bb $c3 $4e $04

call_00_00be:
    call call_00_043d                                  ;; 00:00be $cd $3d $04
    call call_00_0098                                  ;; 00:00c1 $cd $98 $00
    jp   call_00_044e                                  ;; 00:00c4 $c3 $4e $04

jp_00_00c7:
    push AF                                            ;; 00:00c7 $f5
.jr_00_00c8:
    short_halt                                         ;; 00:00c8 $76
    ldh  A, [rLY]                                      ;; 00:00c9 $f0 $44
    cp   A, $90                                        ;; 00:00cb $fe $90
    jr   C, .jr_00_00c8                                ;; 00:00cd $38 $f9
    pop  AF                                            ;; 00:00cf $f1
    ret                                                ;; 00:00d0 $c9

_switchBankSub:
    ld   B, A                                          ;; 00:00d1 $47
    ld   A, C                                          ;; 00:00d2 $79
    ldh  [hCurrentBank], A                             ;; 00:00d3 $e0 $8b
    ld   [$2100], A                                    ;; 00:00d5 $ea $00 $21
    ld   A, B                                          ;; 00:00d8 $78
    pop  BC                                            ;; 00:00d9 $c1
    reti                                               ;; 00:00da $d9
    db   $ff, $f2, $31, $00, $00, $c9, $21, $00        ;; 00:00db ????????
    db   $00, $c3, $a4, $07, $cd, $00, $00, $f5        ;; 00:00e3 ????????
    db   $3e, $00, $ef, $f1, $c9, $e0, $46, $3e        ;; 00:00eb ????????
    db   $28, $3d, $20, $fd, $c9                       ;; 00:00f3 ?????

SECTION "entry", ROM0[$0100]

entry:
    nop                                                ;; 00:0100 $00

jp_00_0101:
    jp   jp_00_0224                                    ;; 00:0101 $c3 $24 $02
    ds   $30                                           ;; 00:0104
    db   "SAGA", $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00 ;; 00:0134
    db   CART_COMPATIBLE_DMG                           ;; 00:0143
    db   $00, $00                                      ;; 00:0144 ??
    db   CART_INDICATOR_GB                             ;; 00:0146
    db   CART_ROM_MBC2_BAT, CART_ROM_128KB, CART_SRAM_NONE ;; 00:0147
    db   CART_DEST_NON_JAPANESE, $c3, $00              ;; 00:014a $01 $c3 $00
    ds   3                                             ;; 00:014d

SECTION "bank00_0150", ROM0[$0150]

call_00_0150:
    jp   jp_00_0eba                                    ;; 00:0150 $c3 $ba $0e
    db   $c3, $2e, $0e                                 ;; 00:0153 ???

call_00_0156:
    jp   jp_00_0e4d                                    ;; 00:0156 $c3 $4d $0e
    db   $c3, $8e, $0f                                 ;; 00:0159 ???

call_00_015c:
    jp   call_00_07b5                                  ;; 00:015c $c3 $b5 $07

call_00_015f:
    jp   call_00_0736                                  ;; 00:015f $c3 $36 $07
    db   $c3, $4d, $07                                 ;; 00:0162 ???

call_00_0165:
    jp   call_00_0773                                  ;; 00:0165 $c3 $73 $07

call_00_0168:
    jp   call_00_07cd                                  ;; 00:0168 $c3 $cd $07

call_00_016b:
    jp   jp_00_07d3                                    ;; 00:016b $c3 $d3 $07

call_00_016e:
    jp   call_00_07ec                                  ;; 00:016e $c3 $ec $07
    db   $c3, $db, $06                                 ;; 00:0171 ???

call_00_0174:
    jp   call_00_034f                                  ;; 00:0174 $c3 $4f $03

call_00_0177:
    jp   jp_00_0382                                    ;; 00:0177 $c3 $82 $03

call_00_017a:
    jp   call_00_043d                                  ;; 00:017a $c3 $3d $04

call_00_017d:
    jp   call_00_044e                                  ;; 00:017d $c3 $4e $04

call_00_0180:
    jp   jp_00_0483                                    ;; 00:0180 $c3 $83 $04

call_00_0183:
    jp   jp_00_0461                                    ;; 00:0183 $c3 $61 $04

call_00_0186:
    jp   jp_00_046e                                    ;; 00:0186 $c3 $6e $04

call_00_0189:
    jp   jp_00_05b5                                    ;; 00:0189 $c3 $b5 $05

call_00_018c:
    jp   jp_00_0408                                    ;; 00:018c $c3 $08 $04

call_00_018f:
    jp   jp_00_03d9                                    ;; 00:018f $c3 $d9 $03
    db   $c3, $ed, $03, $c3, $fa, $03, $c3, $a4        ;; 00:0192 ????????
    db   $03                                           ;; 00:019a ?

call_00_019b:
    jp   jp_00_037a                                    ;; 00:019b $c3 $7a $03

call_00_019e:
    jp   jp_00_03cf                                    ;; 00:019e $c3 $cf $03

call_00_01a1:
    jp   jp_00_03c9                                    ;; 00:01a1 $c3 $c9 $03

call_00_01a4:
    jp   jp_00_0398                                    ;; 00:01a4 $c3 $98 $03

call_00_01a7:
    jp   jp_00_0410                                    ;; 00:01a7 $c3 $10 $04

call_00_01aa:
    jp   jp_00_04a6                                    ;; 00:01aa $c3 $a6 $04

call_00_01ad:
    jp   jp_00_050d                                    ;; 00:01ad $c3 $0d $05

call_00_01b0:
    jp   jp_00_04c8                                    ;; 00:01b0 $c3 $c8 $04

call_00_01b3:
    jp   jp_00_061b                                    ;; 00:01b3 $c3 $1b $06

call_00_01b6:
    jp   call_00_0551                                  ;; 00:01b6 $c3 $51 $05

call_00_01b9:
    jp   jp_00_0554                                    ;; 00:01b9 $c3 $54 $05

call_00_01bc:
    jp   jp_00_0d80                                    ;; 00:01bc $c3 $80 $0d

call_00_01bf:
    jp   jp_00_0d5c                                    ;; 00:01bf $c3 $5c $0d

call_00_01c2:
    jp   jp_00_088a                                    ;; 00:01c2 $c3 $8a $08

call_00_01c5:
    jp   call_00_08d4                                  ;; 00:01c5 $c3 $d4 $08

call_00_01c8:
    jp   jp_00_0d9c                                    ;; 00:01c8 $c3 $9c $0d
    db   $c3, $db, $05                                 ;; 00:01cb ???

call_00_01ce:
    jp   jp_00_055d                                    ;; 00:01ce $c3 $5d $05

call_00_01d1:
    jp   call_00_05a4                                  ;; 00:01d1 $c3 $a4 $05

call_00_01d4:
    jp   call_00_05b0                                  ;; 00:01d4 $c3 $b0 $05
    db   $c3, $24, $04, $c3, $32, $04, $c3, $1b        ;; 00:01d7 ????????
    db   $04                                           ;; 00:01df ?

call_00_01e0:
    jp   jp_00_0862                                    ;; 00:01e0 $c3 $62 $08
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 00:01e3 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 00:01eb ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 00:01f3 ????????
    db   $00, $00, $00, $00, $00                       ;; 00:01fb ?????

call_00_0200:
    rst  switchBank                                    ;; 00:0200 $ef
    push AF                                            ;; 00:0201 $f5
    call call_00_008f                                  ;; 00:0202 $cd $8f $00
    jr   jr_00_021a                                    ;; 00:0205 $18 $13

call_00_0207:
    rst  switchBank                                    ;; 00:0207 $ef
    push AF                                            ;; 00:0208 $f5
    call call_00_0098                                  ;; 00:0209 $cd $98 $00
    jr   jr_00_021a                                    ;; 00:020c $18 $0c

call_00_020e:
    rst  switchBank                                    ;; 00:020e $ef
    push AF                                            ;; 00:020f $f5
    call call_00_00b5                                  ;; 00:0210 $cd $b5 $00
    jr   jr_00_021a                                    ;; 00:0213 $18 $05

jp_00_0215:
    rst  switchBank                                    ;; 00:0215 $ef
    push AF                                            ;; 00:0216 $f5
    call call_00_00be                                  ;; 00:0217 $cd $be $00

jr_00_021a:
    pop  AF                                            ;; 00:021a $f1
    rst  switchBank                                    ;; 00:021b $ef
    ret                                                ;; 00:021c $c9

call_00_021d:
    push BC                                            ;; 00:021d $c5
    rst  switchBank                                    ;; 00:021e $ef
    ld   C, [HL]                                       ;; 00:021f $4e
    rst  switchBank                                    ;; 00:0220 $ef
    ld   A, C                                          ;; 00:0221 $79
    pop  BC                                            ;; 00:0222 $c1
    ret                                                ;; 00:0223 $c9

jp_00_0224:
    di                                                 ;; 00:0224 $f3
    ld   SP, wD000                                     ;; 00:0225 $31 $00 $d0
    ld   A, $80                                        ;; 00:0228 $3e $80
    ldh  [rLCDC], A                                    ;; 00:022a $e0 $40
    xor  A, A                                          ;; 00:022c $af
    ldh  [rIF], A                                      ;; 00:022d $e0 $0f
    ldh  [rIE], A                                      ;; 00:022f $e0 $ff
    ldh  [rSTAT], A                                    ;; 00:0231 $e0 $41
    ld   L, $24                                        ;; 00:0233 $2e $24
    ld   [HL+], A                                      ;; 00:0235 $22
    ld   [HL+], A                                      ;; 00:0236 $22
    ld   [HL+], A                                      ;; 00:0237 $22
    ldh  [rBGP], A                                     ;; 00:0238 $e0 $47
    ldh  [rOBP0], A                                    ;; 00:023a $e0 $48
    ldh  [rOBP1], A                                    ;; 00:023c $e0 $49
    ldh  [rSCX], A                                     ;; 00:023e $e0 $43
    ldh  [rSCY], A                                     ;; 00:0240 $e0 $42
    ld   B, $01                                        ;; 00:0242 $06 $01
    ld   A, $1b                                        ;; 00:0244 $3e $1b
    ld   HL, wC425                                     ;; 00:0246 $21 $25 $c4
    push HL                                            ;; 00:0249 $e5
    cp   A, [HL]                                       ;; 00:024a $be
    inc  HL                                            ;; 00:024b $23
    jr   NZ, .jr_00_0254                               ;; 00:024c $20 $06
    cpl                                                ;; 00:024e $2f
    cp   A, [HL]                                       ;; 00:024f $be
    jr   NZ, .jr_00_0254                               ;; 00:0250 $20 $02
    ld   B, $00                                        ;; 00:0252 $06 $00
.jr_00_0254:
    push BC                                            ;; 00:0254 $c5
    xor  A, A                                          ;; 00:0255 $af
    ld   HL, wC000                                     ;; 00:0256 $21 $00 $c0
    ld   BC, $f00                                      ;; 00:0259 $01 $00 $0f
    call call_00_0082                                  ;; 00:025c $cd $82 $00
    ld   H, $d0                                        ;; 00:025f $26 $d0
    ld   B, $10                                        ;; 00:0261 $06 $10
    call call_00_0082                                  ;; 00:0263 $cd $82 $00
    ld   HL, hFF80                                     ;; 00:0266 $21 $80 $ff
    ld   B, $7f                                        ;; 00:0269 $06 $7f
    call call_00_007c                                  ;; 00:026b $cd $7c $00
    pop  BC                                            ;; 00:026e $c1
    pop  HL                                            ;; 00:026f $e1
    ld   A, $1b                                        ;; 00:0270 $3e $1b
    ld   [HL+], A                                      ;; 00:0272 $22
    cpl                                                ;; 00:0273 $2f
    ld   [HL+], A                                      ;; 00:0274 $22
    ld   [HL], B                                       ;; 00:0275 $70
    ld   HL, $f0                                       ;; 00:0276 $21 $f0 $00
    ld   DE, hFF80                                     ;; 00:0279 $11 $80 $ff
    ld   B, $08                                        ;; 00:027c $06 $08
    call call_00_008f                                  ;; 00:027e $cd $8f $00
    ld   HL, $dd                                       ;; 00:0281 $21 $dd $00
    ld   DE, wC380                                     ;; 00:0284 $11 $80 $c3
    ld   B, $13                                        ;; 00:0287 $06 $13
    call call_00_008f                                  ;; 00:0289 $cd $8f $00
    ld   HL, wC300                                     ;; 00:028c $21 $00 $c3
    ld   B, $80                                        ;; 00:028f $06 $80
.jr_00_0291:
    ldh  A, [rDIV]                                     ;; 00:0291 $f0 $04
    ld   [HL+], A                                      ;; 00:0293 $22
    dec  B                                             ;; 00:0294 $05
    jr   NZ, .jr_00_0291                               ;; 00:0295 $20 $fa
    xor  A, A                                          ;; 00:0297 $af
    ld   HL, hFF88                                     ;; 00:0298 $21 $88 $ff
    ld   [HL], $01                                     ;; 00:029b $36 $01
    inc  HL                                            ;; 00:029d $23
    ld   [HL-], A                                      ;; 00:029e $32
    ld   C, A                                          ;; 00:029f $4f
.jr_00_02a0:
    push HL                                            ;; 00:02a0 $e5
    ld   A, [HL+]                                      ;; 00:02a1 $2a
    ld   H, [HL]                                       ;; 00:02a2 $66
    ld   L, A                                          ;; 00:02a3 $6f
    ld   DE, $0b                                       ;; 00:02a4 $11 $0b $00
    call call_00_074d                                  ;; 00:02a7 $cd $4d $07
    ld   HL, $400                                      ;; 00:02aa $21 $00 $04
    call call_00_0773                                  ;; 00:02ad $cd $73 $07
    push HL                                            ;; 00:02b0 $e5
    pop  DE                                            ;; 00:02b1 $d1
    ld   A, D                                          ;; 00:02b2 $7a
    cp   A, $02                                        ;; 00:02b3 $fe $02
    jr   C, .jr_00_02c2                                ;; 00:02b5 $38 $0b
    inc  E                                             ;; 00:02b7 $1c
    dec  E                                             ;; 00:02b8 $1d
    jr   Z, .jr_00_02c2                                ;; 00:02b9 $28 $07
    xor  A, A                                          ;; 00:02bb $af
    sub  A, E                                          ;; 00:02bc $93
    ld   E, A                                          ;; 00:02bd $5f
    ld   A, $04                                        ;; 00:02be $3e $04
    sbc  A, D                                          ;; 00:02c0 $9a
    ld   D, A                                          ;; 00:02c1 $57
.jr_00_02c2:
    pop  HL                                            ;; 00:02c2 $e1
    ld   [HL], E                                       ;; 00:02c3 $73
    inc  HL                                            ;; 00:02c4 $23
    ld   [HL], D                                       ;; 00:02c5 $72
    dec  HL                                            ;; 00:02c6 $2b
    srl  D                                             ;; 00:02c7 $cb $3a
    rr   E                                             ;; 00:02c9 $cb $1b
    ld   A, E                                          ;; 00:02cb $7b
    ld   B, $cb                                        ;; 00:02cc $06 $cb
    ld   [BC], A                                       ;; 00:02ce $02
    inc  C                                             ;; 00:02cf $0c
    jr   NZ, .jr_00_02a0                               ;; 00:02d0 $20 $ce
    ld   A, $07                                        ;; 00:02d2 $3e $07
    rst  switchBank                                    ;; 00:02d4 $ef
    call call_07_4000 ;@bank 7                         ;; 00:02d5 $cd $00 $40
    ld   A, $05                                        ;; 00:02d8 $3e $05
    ld   HL, $4e40                                     ;; 00:02da $21 $40 $4e
    ld   DE, wC800                                     ;; 00:02dd $11 $00 $c8
    ld   B, $00                                        ;; 00:02e0 $06 $00
    call call_00_0200                                  ;; 00:02e2 $cd $00 $02
    di                                                 ;; 00:02e5 $f3
    xor  A, A                                          ;; 00:02e6 $af
    ldh  [rLYC], A                                     ;; 00:02e7 $e0 $45
    ldh  [rIF], A                                      ;; 00:02e9 $e0 $0f
    ld   A, $03                                        ;; 00:02eb $3e $03
    ldh  [rIE], A                                      ;; 00:02ed $e0 $ff
    ld   A, $40                                        ;; 00:02ef $3e $40
    ldh  [rSTAT], A                                    ;; 00:02f1 $e0 $41
    ld   HL, wVBlankHandler                            ;; 00:02f3 $21 $9a $c3
    ld   A, $c3                                        ;; 00:02f6 $3e $c3
    ld   [HL+], A                                      ;; 00:02f8 $22
    ld   A, LOW(VBlankHandler) ;@=low VBlankHandler    ;; 00:02f9 $3e $d3
    ld   [HL+], A                                      ;; 00:02fb $22
    ld   A, HIGH(VBlankHandler) ;@=high VBlankHandler  ;; 00:02fc $3e $06
    ld   [HL+], A                                      ;; 00:02fe $22
    call call_00_044f                                  ;; 00:02ff $cd $4f $04
    ld   A, $03                                        ;; 00:0302 $3e $03
    rst  switchBank                                    ;; 00:0304 $ef
    ld   DE, $7100                                     ;; 00:0305 $11 $00 $71
    ld   HL, $9000                                     ;; 00:0308 $21 $00 $90
    ld   BC, $3b8                                      ;; 00:030b $01 $b8 $03
    call call_00_043d                                  ;; 00:030e $cd $3d $04
.jr_00_0311:
    ld   A, [DE]                                       ;; 00:0311 $1a
    inc  DE                                            ;; 00:0312 $13
    ld   [HL+], A                                      ;; 00:0313 $22
    ld   [HL+], A                                      ;; 00:0314 $22
    dec  BC                                            ;; 00:0315 $0b
    ld   A, C                                          ;; 00:0316 $79
    or   A, B                                          ;; 00:0317 $b0
    jr   NZ, .jr_00_0311                               ;; 00:0318 $20 $f7
    ld   B, $90                                        ;; 00:031a $06 $90
    call swapHL_DE                                     ;; 00:031c $cd $0b $00
    call call_00_008f                                  ;; 00:031f $cd $8f $00
    ld   HL, $7a00                                     ;; 00:0322 $21 $00 $7a
    ld   DE, $8800                                     ;; 00:0325 $11 $00 $88
    ld   B, $04                                        ;; 00:0328 $06 $04
    ld   A, $02                                        ;; 00:032a $3e $02
    call call_00_0207                                  ;; 00:032c $cd $07 $02
    ld   HL, $7f00                                     ;; 00:032f $21 $00 $7f
    ld   D, $8f                                        ;; 00:0332 $16 $8f
    ld   A, $02                                        ;; 00:0334 $3e $02
    call call_00_0200                                  ;; 00:0336 $cd $00 $02
    call call_00_044e                                  ;; 00:0339 $cd $4e $04
    ld   A, $05                                        ;; 00:033c $3e $05
    ld   B, $00                                        ;; 00:033e $06 $00
    ld   HL, $4e40                                     ;; 00:0340 $21 $40 $4e
    ld   DE, wC800                                     ;; 00:0343 $11 $00 $c8
    call call_00_0200                                  ;; 00:0346 $cd $00 $02
    ld   A, $03                                        ;; 00:0349 $3e $03
    rst  switchBank                                    ;; 00:034b $ef
    jp   jp_03_7d50 ;@bank 3                           ;; 00:034c $c3 $50 $7d

call_00_034f:
    ldh  A, [hFF8D]                                    ;; 00:034f $f0 $8d
    ld   C, A                                          ;; 00:0351 $4f
    ld   A, [wC3A5]                                    ;; 00:0352 $fa $a5 $c3
    cp   A, C                                          ;; 00:0355 $b9
    jr   NZ, .jr_00_036e                               ;; 00:0356 $20 $16
    ld   A, [wC3A4]                                    ;; 00:0358 $fa $a4 $c3
    dec  A                                             ;; 00:035b $3d
    jr   Z, .jr_00_0365                                ;; 00:035c $28 $07
    ld   [wC3A4], A                                    ;; 00:035e $ea $a4 $c3
    xor  A, A                                          ;; 00:0361 $af
    ldh  [hFF8E], A                                    ;; 00:0362 $e0 $8e
    ret                                                ;; 00:0364 $c9
.jr_00_0365:
    ld   A, $05                                        ;; 00:0365 $3e $05
    ld   [wC3A4], A                                    ;; 00:0367 $ea $a4 $c3
    ld   A, C                                          ;; 00:036a $79
    ldh  [hFF8E], A                                    ;; 00:036b $e0 $8e
    ret                                                ;; 00:036d $c9
.jr_00_036e:
    ld   A, $1e                                        ;; 00:036e $3e $1e
    ld   [wC3A4], A                                    ;; 00:0370 $ea $a4 $c3
    ld   A, C                                          ;; 00:0373 $79
    ldh  [hFF8E], A                                    ;; 00:0374 $e0 $8e
    ld   [wC3A5], A                                    ;; 00:0376 $ea $a5 $c3
    ret                                                ;; 00:0379 $c9

jp_00_037a:
    rst  rst_00_0010                                   ;; 00:037a $d7
    rst  rst_00_0018                                   ;; 00:037b $df
    call call_00_034f                                  ;; 00:037c $cd $4f $03
    ldh  A, [hFF8E]                                    ;; 00:037f $f0 $8e
    ret                                                ;; 00:0381 $c9

jp_00_0382:
    push AF                                            ;; 00:0382 $f5
.jr_00_0383:
    rst  rst_00_0010                                   ;; 00:0383 $d7
    ldh  A, [hFF8D]                                    ;; 00:0384 $f0 $8d
    and  A, A                                          ;; 00:0386 $a7
    jr   NZ, .jr_00_0383                               ;; 00:0387 $20 $fa
    pop  AF                                            ;; 00:0389 $f1
    ret                                                ;; 00:038a $c9

call_00_038b:
    push AF                                            ;; 00:038b $f5
    ld   A, D                                          ;; 00:038c $7a
    add  A, A                                          ;; 00:038d $87
    add  A, A                                          ;; 00:038e $87
    add  A, A                                          ;; 00:038f $87
    ld   D, A                                          ;; 00:0390 $57
    ld   A, E                                          ;; 00:0391 $7b
    add  A, A                                          ;; 00:0392 $87
    add  A, A                                          ;; 00:0393 $87
    add  A, A                                          ;; 00:0394 $87
    ld   E, A                                          ;; 00:0395 $5f
    pop  AF                                            ;; 00:0396 $f1
    ret                                                ;; 00:0397 $c9

jp_00_0398:
    ldh  A, [hFF92]                                    ;; 00:0398 $f0 $92
    ld   D, A                                          ;; 00:039a $57
    ldh  A, [hFF93]                                    ;; 00:039b $f0 $93
    ld   E, A                                          ;; 00:039d $5f
    call call_00_038b                                  ;; 00:039e $cd $8b $03
    ld   HL, wC090                                     ;; 00:03a1 $21 $90 $c0

call_00_03a4:
    push AF                                            ;; 00:03a4 $f5
    push BC                                            ;; 00:03a5 $c5
    push DE                                            ;; 00:03a6 $d5
    push HL                                            ;; 00:03a7 $e5
    ld   BC, $04                                       ;; 00:03a8 $01 $04 $00
.jr_00_03ab:
    push BC                                            ;; 00:03ab $c5
    push HL                                            ;; 00:03ac $e5
    ld   L, C                                          ;; 00:03ad $69
    ld   H, B                                          ;; 00:03ae $60
    ld   BC, $72e                                      ;; 00:03af $01 $2e $07
    dec  HL                                            ;; 00:03b2 $2b
    add  HL, HL                                        ;; 00:03b3 $29
    add  HL, BC                                        ;; 00:03b4 $09
    ld   A, [HL+]                                      ;; 00:03b5 $2a
    add  A, D                                          ;; 00:03b6 $82
    ld   D, A                                          ;; 00:03b7 $57
    ld   A, [HL]                                       ;; 00:03b8 $7e
    add  A, E                                          ;; 00:03b9 $83
    ld   E, A                                          ;; 00:03ba $5f
    pop  HL                                            ;; 00:03bb $e1
    pop  BC                                            ;; 00:03bc $c1
    ld   [HL], D                                       ;; 00:03bd $72
    inc  HL                                            ;; 00:03be $23
    ld   [HL], E                                       ;; 00:03bf $73
    inc  HL                                            ;; 00:03c0 $23
    inc  HL                                            ;; 00:03c1 $23
    inc  HL                                            ;; 00:03c2 $23
    dec  C                                             ;; 00:03c3 $0d
    jr   NZ, .jr_00_03ab                               ;; 00:03c4 $20 $e5
    jp   popAll                                        ;; 00:03c6 $c3 $13 $00

jp_00_03c9:
    ld   HL, hFF92                                     ;; 00:03c9 $21 $92 $ff
    ld   [HL], D                                       ;; 00:03cc $72
    inc  HL                                            ;; 00:03cd $23
    ld   [HL], E                                       ;; 00:03ce $73

jp_00_03cf:
    ld   HL, wC090                                     ;; 00:03cf $21 $90 $c0
    ld   A, $7c                                        ;; 00:03d2 $3e $7c
    ld   C, $00                                        ;; 00:03d4 $0e $00
    call call_00_038b                                  ;; 00:03d6 $cd $8b $03

jp_00_03d9:
    push AF                                            ;; 00:03d9 $f5
    push DE                                            ;; 00:03da $d5
    push HL                                            ;; 00:03db $e5
    call call_00_03a4                                  ;; 00:03dc $cd $a4 $03
    inc  HL                                            ;; 00:03df $23
    inc  HL                                            ;; 00:03e0 $23
    call call_00_03fa                                  ;; 00:03e1 $cd $fa $03
    inc  HL                                            ;; 00:03e4 $23
    ld   A, C                                          ;; 00:03e5 $79
    call call_00_03ed                                  ;; 00:03e6 $cd $ed $03
    pop  HL                                            ;; 00:03e9 $e1
    pop  DE                                            ;; 00:03ea $d1
    pop  AF                                            ;; 00:03eb $f1
    ret                                                ;; 00:03ec $c9

call_00_03ed:
    push BC                                            ;; 00:03ed $c5
    push HL                                            ;; 00:03ee $e5
    ld   B, $04                                        ;; 00:03ef $06 $04
.jr_00_03f1:
    call call_00_0075                                  ;; 00:03f1 $cd $75 $00
    dec  B                                             ;; 00:03f4 $05
    jr   NZ, .jr_00_03f1                               ;; 00:03f5 $20 $fa
    pop  HL                                            ;; 00:03f7 $e1
    pop  BC                                            ;; 00:03f8 $c1
    ret                                                ;; 00:03f9 $c9

call_00_03fa:
    push BC                                            ;; 00:03fa $c5
    push HL                                            ;; 00:03fb $e5
    ld   B, $04                                        ;; 00:03fc $06 $04
.jr_00_03fe:
    call call_00_0075                                  ;; 00:03fe $cd $75 $00
    inc  A                                             ;; 00:0401 $3c
    dec  B                                             ;; 00:0402 $05
    jr   NZ, .jr_00_03fe                               ;; 00:0403 $20 $f9
    pop  HL                                            ;; 00:0405 $e1
    pop  BC                                            ;; 00:0406 $c1
    ret                                                ;; 00:0407 $c9

jp_00_0408:
    ld   HL, wC000                                     ;; 00:0408 $21 $00 $c0
    ld   B, $a0                                        ;; 00:040b $06 $a0
    jp   call_00_007b                                  ;; 00:040d $c3 $7b $00

jp_00_0410:
    ld   A, $7f                                        ;; 00:0410 $3e $7f
    ld   HL, wC600                                     ;; 00:0412 $21 $00 $c6
    ld   BC, $168                                      ;; 00:0415 $01 $68 $01
    jp   call_00_0082                                  ;; 00:0418 $c3 $82 $00
    db   $f5, $f0, $44, $fe, $90, $20, $fa, $f1        ;; 00:041b ????????
    db   $c9, $d7, $f3, $f5, $f0, $ff, $e0, $8f        ;; 00:0423 ????????
    db   $af, $e0, $0f, $e0, $ff, $f1, $c9, $f3        ;; 00:042b ????????
    db   $f5, $af, $e0, $0f, $f0, $8f, $e0, $ff        ;; 00:0433 ????????
    db   $f1, $d9                                      ;; 00:043b ??

call_00_043d:
    rst  rst_00_0010                                   ;; 00:043d $d7
    di                                                 ;; 00:043e $f3
    push AF                                            ;; 00:043f $f5
    push HL                                            ;; 00:0440 $e5
    ld   HL, wLCDCHandler                              ;; 00:0441 $21 $9d $c3
    ld   A, $c3                                        ;; 00:0444 $3e $c3
    ld   [HL+], A                                      ;; 00:0446 $22
    ld   A, LOW(LCDCInterruptHandler) ;@=low LCDCInterruptHandler ;; 00:0447 $3e $9f
    ld   [HL+], A                                      ;; 00:0449 $22
    ld   A, HIGH(LCDCInterruptHandler) ;@=high LCDCInterruptHandler ;; 00:044a $3e $06
    jr   jr_00_045d                                    ;; 00:044c $18 $0f

call_00_044e:
    rst  rst_00_0010                                   ;; 00:044e $d7

call_00_044f:
    di                                                 ;; 00:044f $f3
    push AF                                            ;; 00:0450 $f5
    push HL                                            ;; 00:0451 $e5
    ld   HL, wLCDCHandler                              ;; 00:0452 $21 $9d $c3
    ld   A, $c3                                        ;; 00:0455 $3e $c3
    ld   [HL+], A                                      ;; 00:0457 $22
    ld   A, LOW(LCDCInterruptHandler2) ;@=low LCDCInterruptHandler2 ;; 00:0458 $3e $d0
    ld   [HL+], A                                      ;; 00:045a $22
    ld   A, HIGH(LCDCInterruptHandler2) ;@=high LCDCInterruptHandler2 ;; 00:045b $3e $06

jr_00_045d:
    ld   [HL], A                                       ;; 00:045d $77
    pop  HL                                            ;; 00:045e $e1
    pop  AF                                            ;; 00:045f $f1
    reti                                               ;; 00:0460 $d9

jp_00_0461:
    ld   HL, $7fc0                                     ;; 00:0461 $21 $c0 $7f
    ld   DE, $87c0                                     ;; 00:0464 $11 $c0 $87
    ld   B, $40                                        ;; 00:0467 $06 $40
    ld   A, $01                                        ;; 00:0469 $3e $01
    jp   call_00_020e                                  ;; 00:046b $c3 $0e $02

jp_00_046e:
    call call_00_043d                                  ;; 00:046e $cd $3d $04
.jr_00_0471:
    push BC                                            ;; 00:0471 $c5
    call call_00_008f                                  ;; 00:0472 $cd $8f $00
    pop  BC                                            ;; 00:0475 $c1
    ld   A, $20                                        ;; 00:0476 $3e $20
    sub  A, B                                          ;; 00:0478 $90
    add  A, E                                          ;; 00:0479 $83
    ld   E, A                                          ;; 00:047a $5f
    jr   NC, .jr_00_047e                               ;; 00:047b $30 $01
    inc  D                                             ;; 00:047d $14
.jr_00_047e:
    dec  C                                             ;; 00:047e $0d
    jr   NZ, .jr_00_0471                               ;; 00:047f $20 $f0
    jr   call_00_044e                                  ;; 00:0481 $18 $cb

jp_00_0483:
    push AF                                            ;; 00:0483 $f5
    push HL                                            ;; 00:0484 $e5
    push DE                                            ;; 00:0485 $d5
    ld   HL, SP+6                                      ;; 00:0486 $f8 $06
    ld   A, [HL]                                       ;; 00:0488 $7e
    ld   E, A                                          ;; 00:0489 $5f
    add  A, $03                                        ;; 00:048a $c6 $03
    ld   [HL+], A                                      ;; 00:048c $22
    ld   D, [HL]                                       ;; 00:048d $56
    jr   NC, .jr_00_0491                               ;; 00:048e $30 $01
    inc  [HL]                                          ;; 00:0490 $34
.jr_00_0491:
    ld   L, E                                          ;; 00:0491 $6b
    ld   H, D                                          ;; 00:0492 $62
    ld   A, [HL+]                                      ;; 00:0493 $2a
    ld   [wC38B], A                                    ;; 00:0494 $ea $8b $c3
    ld   A, [HL+]                                      ;; 00:0497 $2a
    ld   [wC38C], A                                    ;; 00:0498 $ea $8c $c3
    ld   A, [HL]                                       ;; 00:049b $7e
    pop  DE                                            ;; 00:049c $d1
    pop  HL                                            ;; 00:049d $e1
    rst  switchBank                                    ;; 00:049e $ef
    ld   [wC38F], A                                    ;; 00:049f $ea $8f $c3
    pop  AF                                            ;; 00:04a2 $f1
    jp   $c38a                                         ;; 00:04a3 $c3 $8a $c3

jp_00_04a6:
    call call_00_04f6                                  ;; 00:04a6 $cd $f6 $04
    ld   HL, wCCFC                                     ;; 00:04a9 $21 $fc $cc
    ld   A, [HL+]                                      ;; 00:04ac $2a
    cp   A, $1b                                        ;; 00:04ad $fe $1b
    jr   NZ, jp_00_04c8                                ;; 00:04af $20 $17
    ld   A, [HL]                                       ;; 00:04b1 $7e
    cp   A, $e4                                        ;; 00:04b2 $fe $e4
    jr   NZ, jp_00_04c8                                ;; 00:04b4 $20 $12
    call call_00_0542                                  ;; 00:04b6 $cd $42 $05
    push HL                                            ;; 00:04b9 $e5
    ld   HL, wCCFE                                     ;; 00:04ba $21 $fe $cc
    ld   A, [HL+]                                      ;; 00:04bd $2a
    ld   H, [HL]                                       ;; 00:04be $66
    ld   L, A                                          ;; 00:04bf $6f
    pop  DE                                            ;; 00:04c0 $d1
    call call_00_07cd                                  ;; 00:04c1 $cd $cd $07
    jr   NZ, jp_00_04c8                                ;; 00:04c4 $20 $02
    scf                                                ;; 00:04c6 $37
    ret                                                ;; 00:04c7 $c9

jp_00_04c8:
    ld   HL, wCC00                                     ;; 00:04c8 $21 $00 $cc
    ld   B, $fc                                        ;; 00:04cb $06 $fc
    call call_00_007b                                  ;; 00:04cd $cd $7b $00
    dec  A                                             ;; 00:04d0 $3d
    ld   [wCC1F], A                                    ;; 00:04d1 $ea $1f $cc
    ld   [wCC3E], A                                    ;; 00:04d4 $ea $3e $cc
    ld   [wCC5D], A                                    ;; 00:04d7 $ea $5d $cc
    ld   HL, wCC7C                                     ;; 00:04da $21 $7c $cc
    ld   B, $10                                        ;; 00:04dd $06 $10
    call call_00_007c                                  ;; 00:04df $cd $7c $00
    ld   A, $04                                        ;; 00:04e2 $3e $04
    ld   [wCCCA], A                                    ;; 00:04e4 $ea $ca $cc
    ld   HL, $6fc7                                     ;; 00:04e7 $21 $c7 $6f
    ld   DE, wCC99                                     ;; 00:04ea $11 $99 $cc
    ld   B, $0c                                        ;; 00:04ed $06 $0c
    ld   A, $02                                        ;; 00:04ef $3e $02
    call call_00_0200                                  ;; 00:04f1 $cd $00 $02
    and  A, A                                          ;; 00:04f4 $a7
    ret                                                ;; 00:04f5 $c9

call_00_04f6:
    call call_00_0533                                  ;; 00:04f6 $cd $33 $05
.jr_00_04f9:
    ld   A, [HL+]                                      ;; 00:04f9 $2a
    and  A, $0f                                        ;; 00:04fa $e6 $0f
    ld   C, A                                          ;; 00:04fc $4f
    ld   A, [HL+]                                      ;; 00:04fd $2a
    and  A, $0f                                        ;; 00:04fe $e6 $0f
    swap A                                             ;; 00:0500 $cb $37
    or   A, C                                          ;; 00:0502 $b1
    ld   [DE], A                                       ;; 00:0503 $12
    inc  DE                                            ;; 00:0504 $13
    dec  B                                             ;; 00:0505 $05
    jr   NZ, .jr_00_04f9                               ;; 00:0506 $20 $f1

call_00_0508:
    xor  A, A                                          ;; 00:0508 $af
    ld   [$0000], A                                    ;; 00:0509 $ea $00 $00
    reti                                               ;; 00:050c $d9

jp_00_050d:
    push AF                                            ;; 00:050d $f5
    push BC                                            ;; 00:050e $c5
    push DE                                            ;; 00:050f $d5
    push HL                                            ;; 00:0510 $e5
    ld   HL, wCCFC                                     ;; 00:0511 $21 $fc $cc
    ld   A, $1b                                        ;; 00:0514 $3e $1b
    ld   [HL+], A                                      ;; 00:0516 $22
    cpl                                                ;; 00:0517 $2f
    ld   [HL+], A                                      ;; 00:0518 $22
    push HL                                            ;; 00:0519 $e5
    call call_00_0542                                  ;; 00:051a $cd $42 $05
    pop  DE                                            ;; 00:051d $d1
    call call_00_004b                                  ;; 00:051e $cd $4b $00
    call call_00_0533                                  ;; 00:0521 $cd $33 $05
.jr_00_0524:
    ld   A, [DE]                                       ;; 00:0524 $1a
    ld   [HL+], A                                      ;; 00:0525 $22
    swap A                                             ;; 00:0526 $cb $37
    ld   [HL+], A                                      ;; 00:0528 $22
    inc  DE                                            ;; 00:0529 $13
    dec  B                                             ;; 00:052a $05
    jr   NZ, .jr_00_0524                               ;; 00:052b $20 $f7
    call call_00_0508                                  ;; 00:052d $cd $08 $05
    jp   popAll                                        ;; 00:0530 $c3 $13 $00

call_00_0533:
    ld   HL, sA000                                     ;; 00:0533 $21 $00 $a0
    ld   DE, wCC00                                     ;; 00:0536 $11 $00 $cc
    ld   B, $00                                        ;; 00:0539 $06 $00
    ld   A, $0a                                        ;; 00:053b $3e $0a
    di                                                 ;; 00:053d $f3
    ld   [$0000], A                                    ;; 00:053e $ea $00 $00
    ret                                                ;; 00:0541 $c9

call_00_0542:
    ld   DE, wCC00                                     ;; 00:0542 $11 $00 $cc
    ld   HL, $00                                       ;; 00:0545 $21 $00 $00
    ld   B, $fe                                        ;; 00:0548 $06 $fe
.jr_00_054a:
    ld   A, [DE]                                       ;; 00:054a $1a
    inc  DE                                            ;; 00:054b $13
    rst  add_hl_a                                      ;; 00:054c $c7
    dec  B                                             ;; 00:054d $05
    jr   NZ, .jr_00_054a                               ;; 00:054e $20 $fa
    ret                                                ;; 00:0550 $c9

call_00_0551:
    ld   A, [wC3AC]                                    ;; 00:0551 $fa $ac $c3

jp_00_0554:
    ld   L, A                                          ;; 00:0554 $6f
    ld   H, $1f                                        ;; 00:0555 $26 $1f
    call call_00_0736                                  ;; 00:0557 $cd $36 $07
    ld   H, $cc                                        ;; 00:055a $26 $cc
    ret                                                ;; 00:055c $c9

jp_00_055d:
    ld   DE, wD00E                                     ;; 00:055d $11 $0e $d0
    call call_00_05b0                                  ;; 00:0560 $cd $b0 $05
    ld   DE, wC3D0                                     ;; 00:0563 $11 $d0 $c3
    ld   B, $08                                        ;; 00:0566 $06 $08
    call call_00_008f                                  ;; 00:0568 $cd $8f $00
    inc  DE                                            ;; 00:056b $13
    inc  DE                                            ;; 00:056c $13
    ld   B, $08                                        ;; 00:056d $06 $08
    call call_00_008f                                  ;; 00:056f $cd $8f $00
    ld   HL, wC3D0                                     ;; 00:0572 $21 $d0 $c3
    ld   DE, wC3DA                                     ;; 00:0575 $11 $da $c3
    ld   BC, $8ff                                      ;; 00:0578 $01 $ff $08
.jr_00_057b:
    ld   A, [HL]                                       ;; 00:057b $7e
    call call_00_0594                                  ;; 00:057c $cd $94 $05
    jr   C, .jr_00_0584                                ;; 00:057f $38 $03
    ld   A, C                                          ;; 00:0581 $79
    ld   [HL], A                                       ;; 00:0582 $77
    ld   [DE], A                                       ;; 00:0583 $12
.jr_00_0584:
    ld   A, [DE]                                       ;; 00:0584 $1a
    and  A, A                                          ;; 00:0585 $a7
    jr   Z, .jr_00_058b                                ;; 00:0586 $28 $03
    inc  A                                             ;; 00:0588 $3c
    jr   NZ, .jr_00_058e                               ;; 00:0589 $20 $03
.jr_00_058b:
    ld   A, C                                          ;; 00:058b $79
    ld   [HL], A                                       ;; 00:058c $77
    ld   [DE], A                                       ;; 00:058d $12
.jr_00_058e:
    inc  HL                                            ;; 00:058e $23
    inc  DE                                            ;; 00:058f $13
    dec  B                                             ;; 00:0590 $05
    jr   NZ, .jr_00_057b                               ;; 00:0591 $20 $e8
    ret                                                ;; 00:0593 $c9

call_00_0594:
    push HL                                            ;; 00:0594 $e5
    push DE                                            ;; 00:0595 $d5
    ld   E, A                                          ;; 00:0596 $5f
    call call_00_05a4                                  ;; 00:0597 $cd $a4 $05
    ld   A, $06                                        ;; 00:059a $3e $06
    call call_00_021d                                  ;; 00:059c $cd $1d $02
    rrca                                               ;; 00:059f $0f
    ld   A, E                                          ;; 00:05a0 $7b
    pop  DE                                            ;; 00:05a1 $d1
    pop  HL                                            ;; 00:05a2 $e1
    ret                                                ;; 00:05a3 $c9

call_00_05a4:
    push BC                                            ;; 00:05a4 $c5
    ld   BC, $7700                                     ;; 00:05a5 $01 $00 $77
    ld   L, A                                          ;; 00:05a8 $6f
    ld   H, $00                                        ;; 00:05a9 $26 $00
    call call_00_0067                                  ;; 00:05ab $cd $67 $00
    pop  BC                                            ;; 00:05ae $c1
    ret                                                ;; 00:05af $c9

call_00_05b0:
    ld   H, $00                                        ;; 00:05b0 $26 $00
    jp   jp_00_006e                                    ;; 00:05b2 $c3 $6e $00

jp_00_05b5:
    push BC                                            ;; 00:05b5 $c5
    push HL                                            ;; 00:05b6 $e5
    ld   B, A                                          ;; 00:05b7 $47
    ld   A, $02                                        ;; 00:05b8 $3e $02
    rst  switchBank                                    ;; 00:05ba $ef
    push AF                                            ;; 00:05bb $f5
    ld   A, B                                          ;; 00:05bc $78
    ld   HL, $7438                                     ;; 00:05bd $21 $38 $74
    rst  add_hl_a                                      ;; 00:05c0 $c7
    ld   A, [HL]                                       ;; 00:05c1 $7e
    swap A                                             ;; 00:05c2 $cb $37
    and  A, $0f                                        ;; 00:05c4 $e6 $0f
    ld   H, $60                                        ;; 00:05c6 $26 $60
    add  A, H                                          ;; 00:05c8 $84
    ld   H, A                                          ;; 00:05c9 $67
    ld   A, C                                          ;; 00:05ca $79
    call call_00_0054                                  ;; 00:05cb $cd $54 $00
    ld   L, A                                          ;; 00:05ce $6f
    ld   A, $01                                        ;; 00:05cf $3e $01
    ld   B, $40                                        ;; 00:05d1 $06 $40
    call call_00_020e                                  ;; 00:05d3 $cd $0e $02
    pop  AF                                            ;; 00:05d6 $f1
    rst  switchBank                                    ;; 00:05d7 $ef
    pop  HL                                            ;; 00:05d8 $e1
    pop  BC                                            ;; 00:05d9 $c1
    ret                                                ;; 00:05da $c9

call_00_05db:
    push HL                                            ;; 00:05db $e5
    ld   HL, $7900                                     ;; 00:05dc $21 $00 $79
    rst  add_hl_a                                      ;; 00:05df $c7
    ld   A, $02                                        ;; 00:05e0 $3e $02
    rst  switchBank                                    ;; 00:05e2 $ef
    push AF                                            ;; 00:05e3 $f5
    ld   A, [HL]                                       ;; 00:05e4 $7e
    ldh  [hFF88], A                                    ;; 00:05e5 $e0 $88
    and  A, $0f                                        ;; 00:05e7 $e6 $0f
    ld   C, A                                          ;; 00:05e9 $4f
    ld   A, [HL]                                       ;; 00:05ea $7e
    swap A                                             ;; 00:05eb $cb $37
    and  A, $07                                        ;; 00:05ed $e6 $07
    ld   B, A                                          ;; 00:05ef $47
    pop  AF                                            ;; 00:05f0 $f1
    rst  switchBank                                    ;; 00:05f1 $ef
    ldh  A, [hFF88]                                    ;; 00:05f2 $f0 $88
    cp   A, $27                                        ;; 00:05f4 $fe $27
    jr   Z, .jr_00_0617                                ;; 00:05f6 $28 $1f
    cp   A, $28                                        ;; 00:05f8 $fe $28
    jr   Z, .jr_00_0617                                ;; 00:05fa $28 $1b
    cp   A, $29                                        ;; 00:05fc $fe $29
    jr   Z, .jr_00_0617                                ;; 00:05fe $28 $17
    cp   A, $30                                        ;; 00:0600 $fe $30
    jr   Z, .jr_00_0617                                ;; 00:0602 $28 $13
    cp   A, $31                                        ;; 00:0604 $fe $31
    jr   Z, .jr_00_0617                                ;; 00:0606 $28 $0f
    cp   A, $32                                        ;; 00:0608 $fe $32
    jr   Z, .jr_00_0613                                ;; 00:060a $28 $07
    cp   A, $40                                        ;; 00:060c $fe $40
    jr   Z, .jr_00_0617                                ;; 00:060e $28 $07
    xor  A, A                                          ;; 00:0610 $af
    jr   .jr_00_0619                                   ;; 00:0611 $18 $06
.jr_00_0613:
    ld   A, $02                                        ;; 00:0613 $3e $02
    jr   .jr_00_0619                                   ;; 00:0615 $18 $02
.jr_00_0617:
    ld   A, $01                                        ;; 00:0617 $3e $01
.jr_00_0619:
    pop  HL                                            ;; 00:0619 $e1
    ret                                                ;; 00:061a $c9

jp_00_061b:
    ld   A, $03                                        ;; 00:061b $3e $03
    ldh  [hFF8A], A                                    ;; 00:061d $e0 $8a

call_00_061f:
    ld   A, $06                                        ;; 00:061f $3e $06
    rst  switchBank                                    ;; 00:0621 $ef
    push AF                                            ;; 00:0622 $f5
    call call_00_0551                                  ;; 00:0623 $cd $51 $05
    ld   [HL], $00                                     ;; 00:0626 $36 $00
    ld   A, $05                                        ;; 00:0628 $3e $05
    rst  add_hl_a                                      ;; 00:062a $c7
    ld   A, [wC3C8]                                    ;; 00:062b $fa $c8 $c3
    ld   [HL+], A                                      ;; 00:062e $22
    ld   E, L                                          ;; 00:062f $5d
    ld   D, H                                          ;; 00:0630 $54
    ld   BC, $6ae9                                     ;; 00:0631 $01 $e9 $6a
    ld   L, A                                          ;; 00:0634 $6f
    ld   H, $09                                        ;; 00:0635 $26 $09
    call call_00_0736                                  ;; 00:0637 $cd $36 $07
    add  HL, BC                                        ;; 00:063a $09
    ld   A, [HL-]                                      ;; 00:063b $3a
    push HL                                            ;; 00:063c $e5
    add  A, A                                          ;; 00:063d $87
    ld   HL, $7254                                     ;; 00:063e $21 $54 $72
    rst  add_hl_a                                      ;; 00:0641 $c7
    push HL                                            ;; 00:0642 $e5
    ld   B, $02                                        ;; 00:0643 $06 $02
    call call_00_008f                                  ;; 00:0645 $cd $8f $00
    pop  HL                                            ;; 00:0648 $e1
    ld   B, $02                                        ;; 00:0649 $06 $02
    call call_00_008f                                  ;; 00:064b $cd $8f $00
    pop  HL                                            ;; 00:064e $e1
    ld   A, [HL+]                                      ;; 00:064f $2a
    ldh  [hFF89], A                                    ;; 00:0650 $e0 $89
    push HL                                            ;; 00:0652 $e5
    and  A, $c0                                        ;; 00:0653 $e6 $c0
    rlca                                               ;; 00:0655 $07
    rlca                                               ;; 00:0656 $07
    ld   HL, $72b                                      ;; 00:0657 $21 $2b $07
    rst  add_hl_a                                      ;; 00:065a $c7
    ld   L, [HL]                                       ;; 00:065b $6e
    ldh  A, [hFF8A]                                    ;; 00:065c $f0 $8a
    or   A, L                                          ;; 00:065e $b5
    ld   [DE], A                                       ;; 00:065f $12
    inc  DE                                            ;; 00:0660 $13
    pop  HL                                            ;; 00:0661 $e1
    inc  HL                                            ;; 00:0662 $23
    ld   B, $04                                        ;; 00:0663 $06 $04
    call call_00_008f                                  ;; 00:0665 $cd $8f $00
    inc  HL                                            ;; 00:0668 $23
    push DE                                            ;; 00:0669 $d5
    push HL                                            ;; 00:066a $e5
    ld   L, E                                          ;; 00:066b $6b
    ld   H, D                                          ;; 00:066c $62
    ld   B, $10                                        ;; 00:066d $06 $10
    ld   A, $ff                                        ;; 00:066f $3e $ff
    call call_00_007c                                  ;; 00:0671 $cd $7c $00
    pop  HL                                            ;; 00:0674 $e1
    pop  DE                                            ;; 00:0675 $d1
    ld   A, [HL+]                                      ;; 00:0676 $2a
    ld   H, [HL]                                       ;; 00:0677 $66
    ld   L, A                                          ;; 00:0678 $6f
    ldh  A, [hFF89]                                    ;; 00:0679 $f0 $89
    rrca                                               ;; 00:067b $0f
    rrca                                               ;; 00:067c $0f
    rrca                                               ;; 00:067d $0f
    and  A, $07                                        ;; 00:067e $e6 $07
    inc  A                                             ;; 00:0680 $3c
    ld   B, A                                          ;; 00:0681 $47
.jr_00_0682:
    push BC                                            ;; 00:0682 $c5
    ld   A, [HL+]                                      ;; 00:0683 $2a
    ld   [DE], A                                       ;; 00:0684 $12
    inc  DE                                            ;; 00:0685 $13
    push HL                                            ;; 00:0686 $e5
    ld   L, A                                          ;; 00:0687 $6f
    ld   H, $00                                        ;; 00:0688 $26 $00
    ld   BC, $4647                                     ;; 00:068a $01 $47 $46
    call call_00_0067                                  ;; 00:068d $cd $67 $00
    ld   A, $05                                        ;; 00:0690 $3e $05
    call call_00_021d                                  ;; 00:0692 $cd $1d $02
    pop  HL                                            ;; 00:0695 $e1
    ld   [DE], A                                       ;; 00:0696 $12
    inc  DE                                            ;; 00:0697 $13
    pop  BC                                            ;; 00:0698 $c1
    dec  B                                             ;; 00:0699 $05
    jr   NZ, .jr_00_0682                               ;; 00:069a $20 $e6
    pop  AF                                            ;; 00:069c $f1
    rst  switchBank                                    ;; 00:069d $ef
    ret                                                ;; 00:069e $c9

;@code
LCDCInterruptHandler:
    push AF                                            ;; 00:069f $f5
    ldh  A, [rLY]                                      ;; 00:06a0 $f0 $44
    and  A, A                                          ;; 00:06a2 $a7
    call Z, call_00_06b5                               ;; 00:06a3 $cc $b5 $06
    inc  A                                             ;; 00:06a6 $3c
    ldh  [rLYC], A                                     ;; 00:06a7 $e0 $45
    ldh  A, [rSTAT]                                    ;; 00:06a9 $f0 $41
    ldh  [rSTAT], A                                    ;; 00:06ab $e0 $41
.jr_00_06ad:
    ldh  A, [rSTAT]                                    ;; 00:06ad $f0 $41
    and  A, $03                                        ;; 00:06af $e6 $03
    jr   NZ, .jr_00_06ad                               ;; 00:06b1 $20 $fa
    pop  AF                                            ;; 00:06b3 $f1
    reti                                               ;; 00:06b4 $d9

call_00_06b5:
    call call_00_06db                                  ;; 00:06b5 $cd $db $06
    call call_00_06c7                                  ;; 00:06b8 $cd $c7 $06
.jr_00_06bb:
    ldh  A, [rSTAT]                                    ;; 00:06bb $f0 $41
    and  A, $03                                        ;; 00:06bd $e6 $03
    jr   NZ, .jr_00_06bb                               ;; 00:06bf $20 $fa
    call call_00_06c7                                  ;; 00:06c1 $cd $c7 $06
    ldh  A, [rLY]                                      ;; 00:06c4 $f0 $44
    ret                                                ;; 00:06c6 $c9

call_00_06c7:
    ldh  A, [rSTAT]                                    ;; 00:06c7 $f0 $41
    and  A, $03                                        ;; 00:06c9 $e6 $03
    cp   A, $03                                        ;; 00:06cb $fe $03
    jr   NZ, call_00_06c7                              ;; 00:06cd $20 $f8
    ret                                                ;; 00:06cf $c9

;@code
LCDCInterruptHandler2:
    call call_00_06db                                  ;; 00:06d0 $cd $db $06

;@code
VBlankHandler:
    push AF                                            ;; 00:06d3 $f5
    xor  A, A                                          ;; 00:06d4 $af
    ldh  [rLYC], A                                     ;; 00:06d5 $e0 $45
    ldh  [rIF], A                                      ;; 00:06d7 $e0 $0f
    pop  AF                                            ;; 00:06d9 $f1
    reti                                               ;; 00:06da $d9

call_00_06db:
    push AF                                            ;; 00:06db $f5
    ld   A, $07                                        ;; 00:06dc $3e $07
    rst  switchBank                                    ;; 00:06de $ef
    push AF                                            ;; 00:06df $f5
    call call_07_4003 ;@bank 7                         ;; 00:06e0 $cd $03 $40
    pop  AF                                            ;; 00:06e3 $f1
    rst  switchBank                                    ;; 00:06e4 $ef
    push BC                                            ;; 00:06e5 $c5
    push DE                                            ;; 00:06e6 $d5
    push HL                                            ;; 00:06e7 $e5
    ld   HL, wC3A0                                     ;; 00:06e8 $21 $a0 $c3
    ld   DE, wC3A1                                     ;; 00:06eb $11 $a1 $c3
    ld   B, $03                                        ;; 00:06ee $06 $03
    push HL                                            ;; 00:06f0 $e5
    call call_00_008f                                  ;; 00:06f1 $cd $8f $00
    pop  HL                                            ;; 00:06f4 $e1
    ld   C, $00                                        ;; 00:06f5 $0e $00
    ld   A, $20                                        ;; 00:06f7 $3e $20
    ldh  [C], A                                        ;; 00:06f9 $e2
    call call_00_0726                                  ;; 00:06fa $cd $26 $07
    swap A                                             ;; 00:06fd $cb $37
    ld   B, A                                          ;; 00:06ff $47
    ld   A, $10                                        ;; 00:0700 $3e $10
    ldh  [C], A                                        ;; 00:0702 $e2
    call call_00_0722                                  ;; 00:0703 $cd $22 $07
    and  A, B                                          ;; 00:0706 $a0
    cpl                                                ;; 00:0707 $2f
    ld   [HL+], A                                      ;; 00:0708 $22
    inc  HL                                            ;; 00:0709 $23
    inc  HL                                            ;; 00:070a $23
    ld   A, [HL-]                                      ;; 00:070b $3a
    or   A, [HL]                                       ;; 00:070c $b6
    dec  HL                                            ;; 00:070d $2b
    and  A, [HL]                                       ;; 00:070e $a6
    dec  HL                                            ;; 00:070f $2b
    and  A, [HL]                                       ;; 00:0710 $a6
    ldh  [hFF8D], A                                    ;; 00:0711 $e0 $8d
    ld   A, $30                                        ;; 00:0713 $3e $30
    ldh  [C], A                                        ;; 00:0715 $e2
    ldh  A, [hFF8D]                                    ;; 00:0716 $f0 $8d
    and  A, $0f                                        ;; 00:0718 $e6 $0f
    cp   A, $0f                                        ;; 00:071a $fe $0f
    jp   Z, jp_00_0224                                 ;; 00:071c $ca $24 $02
    jp   popAll                                        ;; 00:071f $c3 $13 $00

call_00_0722:
    ldh  A, [C]                                        ;; 00:0722 $f2
    ldh  A, [C]                                        ;; 00:0723 $f2
    ldh  A, [C]                                        ;; 00:0724 $f2
    ldh  A, [C]                                        ;; 00:0725 $f2

call_00_0726:
    ldh  A, [C]                                        ;; 00:0726 $f2
    ldh  A, [C]                                        ;; 00:0727 $f2
    or   A, $f0                                        ;; 00:0728 $f6 $f0
    ret                                                ;; 00:072a $c9
    db   $80, $20, $40, $00, $08, $08, $f8, $00        ;; 00:072b ????????
    db   $08, $10, $08                                 ;; 00:0733 ???

call_00_0736:
    push AF                                            ;; 00:0736 $f5
    push BC                                            ;; 00:0737 $c5
    ld   B, $08                                        ;; 00:0738 $06 $08
    xor  A, A                                          ;; 00:073a $af
    ld   C, A                                          ;; 00:073b $4f
.jr_00_073c:
    rr   H                                             ;; 00:073c $cb $1c
    jr   NC, .jr_00_0741                               ;; 00:073e $30 $01
    add  A, L                                          ;; 00:0740 $85
.jr_00_0741:
    srl  A                                             ;; 00:0741 $cb $3f
    rr   C                                             ;; 00:0743 $cb $19
    dec  B                                             ;; 00:0745 $05
    jr   NZ, .jr_00_073c                               ;; 00:0746 $20 $f4
    ld   H, A                                          ;; 00:0748 $67
    ld   L, C                                          ;; 00:0749 $69
    pop  BC                                            ;; 00:074a $c1
    pop  AF                                            ;; 00:074b $f1
    ret                                                ;; 00:074c $c9

call_00_074d:
    di                                                 ;; 00:074d $f3
    push AF                                            ;; 00:074e $f5
    push BC                                            ;; 00:074f $c5
    ld   BC, $7b2                                      ;; 00:0750 $01 $b2 $07
    push BC                                            ;; 00:0753 $c5
    ld   [wC381], SP                                   ;; 00:0754 $08 $81 $c3
    ld   SP, HL                                        ;; 00:0757 $f9
    xor  A, A                                          ;; 00:0758 $af
    ld   C, A                                          ;; 00:0759 $4f
    ld   B, A                                          ;; 00:075a $47
    ld   L, A                                          ;; 00:075b $6f
    ld   H, A                                          ;; 00:075c $67
    ld   A, $10                                        ;; 00:075d $3e $10
.jr_00_075f:
    rr   D                                             ;; 00:075f $cb $1a
    rr   E                                             ;; 00:0761 $cb $1b
    jr   NC, .jr_00_0766                               ;; 00:0763 $30 $01
    add  HL, SP                                        ;; 00:0765 $39
.jr_00_0766:
    rr   H                                             ;; 00:0766 $cb $1c
    rr   L                                             ;; 00:0768 $cb $1d
    rr   B                                             ;; 00:076a $cb $18
    rr   C                                             ;; 00:076c $cb $19
    dec  A                                             ;; 00:076e $3d
    jr   NZ, .jr_00_075f                               ;; 00:076f $20 $ee
    jr   jr_00_07ad                                    ;; 00:0771 $18 $3a

call_00_0773:
    di                                                 ;; 00:0773 $f3
    push AF                                            ;; 00:0774 $f5
    push BC                                            ;; 00:0775 $c5
    ld   BC, $7b2                                      ;; 00:0776 $01 $b2 $07
    push BC                                            ;; 00:0779 $c5
    ld   [wC381], SP                                   ;; 00:077a $08 $81 $c3
    ld   A, H                                          ;; 00:077d $7c
    cpl                                                ;; 00:077e $2f
    ld   H, A                                          ;; 00:077f $67
    ld   A, L                                          ;; 00:0780 $7d
    cpl                                                ;; 00:0781 $2f
    ld   L, A                                          ;; 00:0782 $6f
    inc  HL                                            ;; 00:0783 $23
    ld   SP, HL                                        ;; 00:0784 $f9
    xor  A, A                                          ;; 00:0785 $af
    ld   L, A                                          ;; 00:0786 $6f
    ld   H, A                                          ;; 00:0787 $67
    ld   C, A                                          ;; 00:0788 $4f
    ld   B, A                                          ;; 00:0789 $47
    ld   A, $10                                        ;; 00:078a $3e $10
.jr_00_078c:
    ldh  [hFF88], A                                    ;; 00:078c $e0 $88
    sla  E                                             ;; 00:078e $cb $23
    rl   D                                             ;; 00:0790 $cb $12
    rl   L                                             ;; 00:0792 $cb $15
    rl   H                                             ;; 00:0794 $cb $14
    ld   A, L                                          ;; 00:0796 $7d
    ld   [wC385], A                                    ;; 00:0797 $ea $85 $c3
    ld   A, H                                          ;; 00:079a $7c
    ld   [wC386], A                                    ;; 00:079b $ea $86 $c3
    add  HL, SP                                        ;; 00:079e $39
    jr   C, .jr_00_07a4                                ;; 00:079f $38 $03
    jp   $c384                                         ;; 00:07a1 $c3 $84 $c3
.jr_00_07a4:
    rl   C                                             ;; 00:07a4 $cb $11
    rl   B                                             ;; 00:07a6 $cb $10
    ldh  A, [hFF88]                                    ;; 00:07a8 $f0 $88
    dec  A                                             ;; 00:07aa $3d
    jr   NZ, .jr_00_078c                               ;; 00:07ab $20 $df

jr_00_07ad:
    ld   E, C                                          ;; 00:07ad $59
    ld   D, B                                          ;; 00:07ae $50
    jp   wC380                                         ;; 00:07af $c3 $80 $c3
    db   $c1, $f1, $d9                                 ;; 00:07b2 ???

call_00_07b5:
    ldh  [hFF88], A                                    ;; 00:07b5 $e0 $88
    push DE                                            ;; 00:07b7 $d5
    ld   A, E                                          ;; 00:07b8 $7b
    cpl                                                ;; 00:07b9 $2f
    ld   E, A                                          ;; 00:07ba $5f
    ld   A, D                                          ;; 00:07bb $7a
    cpl                                                ;; 00:07bc $2f
    ld   D, A                                          ;; 00:07bd $57
    inc  DE                                            ;; 00:07be $13
    add  HL, DE                                        ;; 00:07bf $19
    jr   NC, .jr_00_07c6                               ;; 00:07c0 $30 $04
    ld   A, L                                          ;; 00:07c2 $7d
    or   A, H                                          ;; 00:07c3 $b4
    jr   .jr_00_07c9                                   ;; 00:07c4 $18 $03
.jr_00_07c6:
    ld   A, L                                          ;; 00:07c6 $7d
    or   A, H                                          ;; 00:07c7 $b4
    scf                                                ;; 00:07c8 $37
.jr_00_07c9:
    pop  DE                                            ;; 00:07c9 $d1
    ldh  A, [hFF88]                                    ;; 00:07ca $f0 $88
    ret                                                ;; 00:07cc $c9

call_00_07cd:
    push HL                                            ;; 00:07cd $e5
    call call_00_07b5                                  ;; 00:07ce $cd $b5 $07
    pop  HL                                            ;; 00:07d1 $e1
    ret                                                ;; 00:07d2 $c9

jp_00_07d3:
    push BC                                            ;; 00:07d3 $c5
    push DE                                            ;; 00:07d4 $d5
    push HL                                            ;; 00:07d5 $e5
    push AF                                            ;; 00:07d6 $f5
    ld   HL, SP+8                                      ;; 00:07d7 $f8 $08
    ld   A, [HL+]                                      ;; 00:07d9 $2a
    add  A, [HL]                                       ;; 00:07da $86
    and  A, $7f                                        ;; 00:07db $e6 $7f
    ld   L, A                                          ;; 00:07dd $6f
    ld   H, $c3                                        ;; 00:07de $26 $c3
    inc  [HL]                                          ;; 00:07e0 $34
    ld   L, [HL]                                       ;; 00:07e1 $6e
    ld   H, $cb                                        ;; 00:07e2 $26 $cb
    pop  AF                                            ;; 00:07e4 $f1
    call call_00_07ec                                  ;; 00:07e5 $cd $ec $07
    pop  HL                                            ;; 00:07e8 $e1
    pop  DE                                            ;; 00:07e9 $d1
    pop  BC                                            ;; 00:07ea $c1
    ret                                                ;; 00:07eb $c9

call_00_07ec:
    ld   B, A                                          ;; 00:07ec $47
    cp   A, $ff                                        ;; 00:07ed $fe $ff
    jr   Z, .jr_00_0809                                ;; 00:07ef $28 $18
    ld   A, E                                          ;; 00:07f1 $7b
    and  A, A                                          ;; 00:07f2 $a7
    jr   Z, .jr_00_0809                                ;; 00:07f3 $28 $14
    cp   A, B                                          ;; 00:07f5 $b8
    jr   Z, .jr_00_0809                                ;; 00:07f6 $28 $11
    sub  A, B                                          ;; 00:07f8 $90
    ld   E, A                                          ;; 00:07f9 $5f
    ld   D, $00                                        ;; 00:07fa $16 $00
    ld   H, [HL]                                       ;; 00:07fc $66
    ld   L, $80                                        ;; 00:07fd $2e $80
    call call_00_074d                                  ;; 00:07ff $cd $4d $07
    bit  7, D                                          ;; 00:0802 $cb $7a
    jr   Z, .jr_00_0807                                ;; 00:0804 $28 $01
    inc  L                                             ;; 00:0806 $2c
.jr_00_0807:
    ld   A, L                                          ;; 00:0807 $7d
    add  A, B                                          ;; 00:0808 $80
.jr_00_0809:
    ret                                                ;; 00:0809 $c9
    db   $f5, $c5, $d5, $cd, $35, $08, $cd, $16        ;; 00:080a ????????
    db   $08, $c3, $14, $00, $21, $c0, $c3, $01        ;; 00:0812 ????????
    db   $00, $06, $7e, $a7, $20, $0d, $0c, $0d        ;; 00:081a ????????
    db   $20, $09, $05, $20, $02, $3e, $81, $04        ;; 00:0822 ????????
    db   $3d, $18, $03, $0c, $c6, $80, $22, $05        ;; 00:082a ????????
    db   $20, $e8, $c9, $01, $c0, $c3, $af, $02        ;; 00:0832 ????????
    db   $03, $11, $10, $27, $cd, $56, $08, $11        ;; 00:083a ????????
    db   $e8, $03, $cd, $56, $08, $11, $64, $00        ;; 00:0842 ????????
    db   $cd, $56, $08, $11, $0a, $00, $cd, $56        ;; 00:084a ????????
    db   $08, $7d, $02, $c9, $af, $cd, $b5, $07        ;; 00:0852 ????????
    db   $3c, $30, $fa, $3d, $19, $02, $03, $c9        ;; 00:085a ????????

jp_00_0862:
    ld   A, $05                                        ;; 00:0862 $3e $05
    ld   E, $f6                                        ;; 00:0864 $1e $f6
    ld   BC, $7b10                                     ;; 00:0866 $01 $10 $7b
    call call_00_0c82                                  ;; 00:0869 $cd $82 $0c
    ld   HL, hFF99                                     ;; 00:086c $21 $99 $ff
    call storeDEatHL                                   ;; 00:086f $cd $43 $00
    ld   DE, $9800                                     ;; 00:0872 $11 $00 $98
    call storeDEatHL                                   ;; 00:0875 $cd $43 $00
    call storeDEatHL                                   ;; 00:0878 $cd $43 $00
    ld   A, $20                                        ;; 00:087b $3e $20
    ldh  [hFF95], A                                    ;; 00:087d $e0 $95
    ldh  [hFFDE], A                                    ;; 00:087f $e0 $de
.jr_00_0881:
    call call_00_0911                                  ;; 00:0881 $cd $11 $09
    jr   .jr_00_0881                                   ;; 00:0884 $18 $fb
    db   $f0, $94, $ef, $c9                            ;; 00:0886 ????

jp_00_088a:
    ld   A, $02                                        ;; 00:088a $3e $02
    ld   BC, $7860                                     ;; 00:088c $01 $60 $78
    call call_00_0c82                                  ;; 00:088f $cd $82 $0c
    ld   HL, hFF99                                     ;; 00:0892 $21 $99 $ff
    ld   [HL], E                                       ;; 00:0895 $73
    inc  HL                                            ;; 00:0896 $23
    ld   [HL], D                                       ;; 00:0897 $72
    inc  HL                                            ;; 00:0898 $23
    ld   BC, $4d8                                      ;; 00:0899 $01 $d8 $04
    push BC                                            ;; 00:089c $c5
    push HL                                            ;; 00:089d $e5
.jr_00_089e:
    ldh  A, [C]                                        ;; 00:089e $f2
    inc  C                                             ;; 00:089f $0c
    ld   [HL+], A                                      ;; 00:08a0 $22
    dec  B                                             ;; 00:08a1 $05
    jr   NZ, .jr_00_089e                               ;; 00:08a2 $20 $fa
    ld   A, $20                                        ;; 00:08a4 $3e $20
    ldh  [hFFDE], A                                    ;; 00:08a6 $e0 $de
    ldh  [hFF95], A                                    ;; 00:08a8 $e0 $95
.jr_00_08aa:
    call call_00_0911                                  ;; 00:08aa $cd $11 $09
    jr   .jr_00_08aa                                   ;; 00:08ad $18 $fb
    db   $e1, $c1, $2a, $e2, $0c, $05, $20, $fa        ;; 00:08af ????????
    db   $af, $e0, $de, $f0, $94, $ef, $c9             ;; 00:08b7 ???????

jp_00_08be:
    push AF                                            ;; 00:08be $f5
    push BC                                            ;; 00:08bf $c5
    xor  A, A                                          ;; 00:08c0 $af
    ldh  [hFFDE], A                                    ;; 00:08c1 $e0 $de
    ld   A, $03                                        ;; 00:08c3 $3e $03
    ld   BC, $7080                                     ;; 00:08c5 $01 $80 $70
    call call_00_0c82                                  ;; 00:08c8 $cd $82 $0c
    pop  BC                                            ;; 00:08cb $c1
    pop  AF                                            ;; 00:08cc $f1
    call call_00_08d4                                  ;; 00:08cd $cd $d4 $08
    ldh  A, [hFF94]                                    ;; 00:08d0 $f0 $94
    rst  switchBank                                    ;; 00:08d2 $ef
    ret                                                ;; 00:08d3 $c9

call_00_08d4:
    push AF                                            ;; 00:08d4 $f5
    push BC                                            ;; 00:08d5 $c5
    push DE                                            ;; 00:08d6 $d5
    push HL                                            ;; 00:08d7 $e5
    push HL                                            ;; 00:08d8 $e5
    ld   HL, hFF95                                     ;; 00:08d9 $21 $95 $ff
    ld   [HL+], A                                      ;; 00:08dc $22
    ld   [HL], B                                       ;; 00:08dd $70
    inc  HL                                            ;; 00:08de $23
    ld   [HL], C                                       ;; 00:08df $71
    inc  HL                                            ;; 00:08e0 $23
    ld   [HL], C                                       ;; 00:08e1 $71
    inc  HL                                            ;; 00:08e2 $23
    call storeDEatHL                                   ;; 00:08e3 $cd $43 $00
    pop  DE                                            ;; 00:08e6 $d1
    call storeDEatHL                                   ;; 00:08e7 $cd $43 $00
    call storeDEatHL                                   ;; 00:08ea $cd $43 $00
    ld   L, $dc                                        ;; 00:08ed $2e $dc
    ld   DE, wC000                                     ;; 00:08ef $11 $00 $c0
    call storeDEatHL                                   ;; 00:08f2 $cd $43 $00
.jr_00_08f5:
    call call_00_0911                                  ;; 00:08f5 $cd $11 $09
    jr   .jr_00_08f5                                   ;; 00:08f8 $18 $fb
    db   $c3, $13, $00, $e1, $23, $23, $e9             ;; 00:08fa ???????

call_00_0901:
    push DE                                            ;; 00:0901 $d5
    push HL                                            ;; 00:0902 $e5
    ld   HL, hFF99                                     ;; 00:0903 $21 $99 $ff
    ld   E, [HL]                                       ;; 00:0906 $5e
    inc  HL                                            ;; 00:0907 $23
    ld   D, [HL]                                       ;; 00:0908 $56
    ld   A, [DE]                                       ;; 00:0909 $1a
    inc  DE                                            ;; 00:090a $13
    ld   [HL], D                                       ;; 00:090b $72
    dec  HL                                            ;; 00:090c $2b
    ld   [HL], E                                       ;; 00:090d $73
    pop  HL                                            ;; 00:090e $e1
    pop  DE                                            ;; 00:090f $d1
    ret                                                ;; 00:0910 $c9

call_00_0911:
    call call_00_0901                                  ;; 00:0911 $cd $01 $09
    cp   A, $e8                                        ;; 00:0914 $fe $e8
    jr   NC, call_00_094c                              ;; 00:0916 $30 $34
    cp   A, $c0                                        ;; 00:0918 $fe $c0
    jr   NC, .jr_00_093e                               ;; 00:091a $30 $22
    cp   A, $80                                        ;; 00:091c $fe $80
    jr   NC, call_00_094c                              ;; 00:091e $30 $2c
    cp   A, $50                                        ;; 00:0920 $fe $50
    jr   NC, .jr_00_0937                               ;; 00:0922 $30 $13
    cp   A, $40                                        ;; 00:0924 $fe $40
    jr   NC, .jr_00_0933                               ;; 00:0926 $30 $0b
    ld   HL, $ce2                                      ;; 00:0928 $21 $e2 $0c
    add  A, A                                          ;; 00:092b $87
    rst  add_hl_a                                      ;; 00:092c $c7
    ld   E, [HL]                                       ;; 00:092d $5e
    inc  HL                                            ;; 00:092e $23
    ld   D, [HL]                                       ;; 00:092f $56
    push DE                                            ;; 00:0930 $d5
    pop  HL                                            ;; 00:0931 $e1
    jp   HL                                            ;; 00:0932 $e9
.jr_00_0933:
    add  A, $30                                        ;; 00:0933 $c6 $30
    jr   call_00_094c                                  ;; 00:0935 $18 $15
.jr_00_0937:
    ld   HL, wC800                                     ;; 00:0937 $21 $00 $c8
    sub  A, $50                                        ;; 00:093a $d6 $50
    jr   .jr_00_0943                                   ;; 00:093c $18 $05
.jr_00_093e:
    ld   HL, wC860                                     ;; 00:093e $21 $60 $c8
    sub  A, $c0                                        ;; 00:0941 $d6 $c0
.jr_00_0943:
    add  A, A                                          ;; 00:0943 $87
    rst  add_hl_a                                      ;; 00:0944 $c7
    ld   A, [HL+]                                      ;; 00:0945 $2a
    push HL                                            ;; 00:0946 $e5
    call call_00_094c                                  ;; 00:0947 $cd $4c $09
    pop  HL                                            ;; 00:094a $e1
    ld   A, [HL]                                       ;; 00:094b $7e

call_00_094c:
    call call_00_0ca7                                  ;; 00:094c $cd $a7 $0c
    call call_00_095c                                  ;; 00:094f $cd $5c $09
    call call_00_099a                                  ;; 00:0952 $cd $9a $09
    ldh  A, [hFFDE]                                    ;; 00:0955 $f0 $de
    and  A, A                                          ;; 00:0957 $a7
    ret  Z                                             ;; 00:0958 $c8
    jp   jp_00_0ccb                                    ;; 00:0959 $c3 $cb $0c

call_00_095c:
    ld   HL, hFF97                                     ;; 00:095c $21 $97 $ff
    inc  [HL]                                          ;; 00:095f $34
    call call_00_0c97                                  ;; 00:0960 $cd $97 $0c
    sub  A, $80                                        ;; 00:0963 $d6 $80
    ld   [HL+], A                                      ;; 00:0965 $22
    ret                                                ;; 00:0966 $c9
    db   $cd, $01, $09, $c6, $80, $18, $de, $cd        ;; 00:0967 ????????
    db   $4a, $0c, $20, $f4, $cd, $01, $09, $06        ;; 00:096f ????????
    db   $01, $c3, $ee, $0b, $cd, $01, $09, $21        ;; 00:0977 ????????
    db   $e4, $c3, $c7, $7e, $a7, $20, $e1, $18        ;; 00:097f ????????
    db   $eb, $21, $97, $ff, $34, $cd, $97, $0c        ;; 00:0987 ????????
    db   $23, $18, $08, $21, $97, $ff, $35, $cd        ;; 00:098f ????????
    db   $97, $0c, $2b                                 ;; 00:0997 ???

call_00_099a:
    push AF                                            ;; 00:099a $f5
    ld   A, L                                          ;; 00:099b $7d
    ldh  [hFF9B], A                                    ;; 00:099c $e0 $9b
    ld   A, H                                          ;; 00:099e $7c
    ldh  [hFF9C], A                                    ;; 00:099f $e0 $9c
    pop  AF                                            ;; 00:09a1 $f1
    ret                                                ;; 00:09a2 $c9
    db   $cd, $01, $09, $87, $87, $f5, $21, $96        ;; 00:09a3 ????????
    db   $ff, $56, $23, $5e, $34, $34, $cd, $8b        ;; 00:09ab ????????
    db   $03, $f0, $dc, $6f, $f0, $dd, $67, $cd        ;; 00:09b3 ????????
    db   $a4, $03, $f1, $23, $23, $cd, $fa, $03        ;; 00:09bb ????????
    db   $af, $23, $cd, $ed, $03, $11, $0d, $00        ;; 00:09c3 ????????
    db   $19, $7d, $e0, $dc, $7c, $e0, $dd, $cd        ;; 00:09cb ????????
    db   $97, $0c, $23, $23, $18, $c1, $fa, $ac        ;; 00:09d3 ????????
    db   $c3, $18, $c8, $21, $96, $ff, $35, $f0        ;; 00:09db ????????
    db   $95, $2f, $3c, $06, $ff, $18, $08, $21        ;; 00:09e3 ????????
    db   $96, $ff, $34, $f0, $95, $06, $00, $4f        ;; 00:09eb ????????
    db   $cd, $97, $0c, $09, $cd, $9a, $09, $cd        ;; 00:09f3 ????????
    db   $90, $0c, $09, $7d, $e0, $9d, $7c, $e0        ;; 00:09fb ????????
    db   $9e, $c9, $cd, $08, $0a, $cd, $0b, $0a        ;; 00:0a03 ????????
    db   $cd, $90, $0c, $f0, $de, $a7, $28, $0e        ;; 00:0a0b ????????
    db   $11, $01, $9a, $cd, $cd, $07, $38, $06        ;; 00:0a13 ????????
    db   $cd, $9a, $09, $c3, $b0, $0c, $f0, $95        ;; 00:0a1b ????????
    db   $c7, $cd, $9a, $09, $cd, $fe, $09, $21        ;; 00:0a23 ????????
    db   $96, $ff, $34, $23, $23, $3a, $77, $c9        ;; 00:0a2b ????????
    db   $cd, $4e, $0a, $c3, $e6, $0a, $cd, $4e        ;; 00:0a33 ????????
    db   $0a, $11, $b0, $c3, $2a, $fe, $ff, $28        ;; 00:0a3b ????????
    db   $02, $12, $13, $05, $20, $f6, $af, $12        ;; 00:0a43 ????????
    db   $c3, $f8, $0b, $cd, $01, $09, $6f, $26        ;; 00:0a4b ????????
    db   $03, $cd, $36, $07, $11, $00, $c4, $19        ;; 00:0a53 ????????
    db   $11, $c0, $c3, $06, $03, $7e, $cb, $37        ;; 00:0a5b ????????
    db   $e6, $0f, $12, $13, $2a, $e6, $0f, $12        ;; 00:0a63 ????????
    db   $13, $05, $20, $f1, $cd, $16, $08, $06        ;; 00:0a6b ????????
    db   $07, $21, $c0, $c3, $c9, $21, $b4, $ff        ;; 00:0a73 ????????
    db   $cd, $1d, $0b, $06, $03, $21, $c3, $c3        ;; 00:0a7b ????????
    db   $18, $b7, $cd, $69, $0c, $28, $0c, $21        ;; 00:0a83 ????????
    db   $d0, $c3, $c7, $cd, $79, $0c, $0e, $07        ;; 00:0a8b ????????
    db   $c3, $16, $0c, $06, $07, $c3, $ee, $0b        ;; 00:0a93 ????????
    db   $cd, $69, $0c, $28, $1e, $3e, $fe, $bd        ;; 00:0a9b ????????
    db   $20, $05, $21, $db, $00, $18, $0f, $3e        ;; 00:0aa3 ????????
    db   $63, $bd, $30, $02, $2e, $63, $26, $00        ;; 00:0aab ????????
    db   $cd, $0a, $08, $21, $c4, $c3, $0e, $02        ;; 00:0ab3 ????????
    db   $c3, $16, $0c, $06, $02, $c3, $ee, $0b        ;; 00:0abb ????????
    db   $cd, $69, $0c, $18, $e2, $0e, $06, $18        ;; 00:0ac3 ????????
    db   $0c, $0e, $06, $fa, $ac, $c3, $cd, $4d        ;; 00:0acb ????????
    db   $0c, $18, $05, $0e, $08, $cd, $4a, $0c        ;; 00:0ad3 ????????
    db   $28, $13, $79, $cd, $1b, $0b, $21, $c3        ;; 00:0adb ????????
    db   $c3, $06, $04, $11, $b0, $c3, $cd, $8f        ;; 00:0ae3 ????????
    db   $00, $af, $12, $18, $6d, $06, $03, $18        ;; 00:0aeb ????????
    db   $58, $cd, $4a, $0c, $28, $16, $cd, $54        ;; 00:0af3 ????????
    db   $0c, $28, $05, $0e, $04, $c3, $16, $0c        ;; 00:0afb ????????
    db   $3e, $08, $cd, $1b, $0b, $06, $04, $21        ;; 00:0b03 ????????
    db   $c2, $c3, $18, $d7, $06, $04, $18, $39        ;; 00:0b0b ????????
    db   $fa, $ac, $c3, $cd, $4d, $0c, $18, $dc        ;; 00:0b13 ????????
    db   $85, $6f, $2a, $66, $6f, $11, $e7, $03        ;; 00:0b1b ????????
    db   $cd, $cd, $07, $38, $05, $28, $03, $21        ;; 00:0b23 ????????
    db   $e7, $03, $c3, $0a, $08, $fa, $ac, $c3        ;; 00:0b2b ????????
    db   $cd, $4d, $0c, $18, $03, $cd, $4a, $0c        ;; 00:0b33 ????????
    db   $28, $0d, $23, $06, $04, $11, $b0, $c3        ;; 00:0b3b ????????
    db   $cd, $8f, $00, $af, $12, $18, $13, $06        ;; 00:0b43 ????????
    db   $04, $18, $66, $cd, $01, $09, $cd, $54        ;; 00:0b4b ????????
    db   $05, $3e, $01, $85, $6f, $06, $04, $cd        ;; 00:0b53 ????????
    db   $2f, $0c, $c3, $f8, $0b, $fa, $ac, $c3        ;; 00:0b5b ????????
    db   $18, $ec, $21, $b0, $ff, $18, $03, $21        ;; 00:0b63 ????????
    db   $b1, $ff, $7e, $fe, $04, $38, $df, $6f        ;; 00:0b6b ????????
    db   $26, $00, $cd, $5d, $00, $11, $1f, $d0        ;; 00:0b73 ????????
    db   $19, $6e, $cd, $42, $0c, $06, $08, $18        ;; 00:0b7b ????????
    db   $0d, $21, $b2, $ff, $18, $03, $21, $b3        ;; 00:0b83 ????????
    db   $ff, $cd, $79, $0c, $06, $07, $c3, $24        ;; 00:0b8b ????????
    db   $0c, $cd, $01, $09, $21, $ad, $c3, $c7        ;; 00:0b93 ????????
    db   $3e, $ff, $6e, $bd, $28, $11, $26, $00        ;; 00:0b9b ????????
    db   $cd, $0a, $08, $21, $b0, $c3, $fa, $c5        ;; 00:0ba3 ????????
    db   $c3, $22, $af, $77, $c3, $f8, $0b, $06        ;; 00:0bab ????????
    db   $01, $18, $38, $cd, $cc, $0b, $7d, $3c        ;; 00:0bb3 ????????
    db   $20, $54, $06, $08, $18, $2d, $cd, $cc        ;; 00:0bbb ????????
    db   $0b, $cd, $42, $0c, $06, $08, $c3, $24        ;; 00:0bc3 ????????
    db   $0c, $cd, $01, $09, $21, $c8, $c3, $c7        ;; 00:0bcb ????????
    db   $6e, $c9, $cd, $4a, $0c, $28, $10, $cd        ;; 00:0bd3 ????????
    db   $54, $0c, $28, $04, $0e, $08, $18, $33        ;; 00:0bdb ????????
    db   $3e, $05, $85, $6f, $6e, $18, $27, $06        ;; 00:0be3 ????????
    db   $08, $18, $00, $3e, $ff, $21, $b0, $c3        ;; 00:0beb ????????
    db   $cd, $7c, $00, $af, $77, $21, $99, $ff        ;; 00:0bf3 ????????
    db   $5e, $23, $56, $d5, $11, $b0, $c3, $72        ;; 00:0bfb ????????
    db   $2b, $73, $e5, $cd, $11, $09, $18, $fb        ;; 00:0c03 ????????
    db   $e1, $d1, $73, $23, $72, $c9, $cd, $42        ;; 00:0c0b ????????
    db   $0c, $0e, $08, $06, $00, $11, $b0, $c3        ;; 00:0c13 ????????
    db   $3e, $05, $cd, $07, $02, $af, $12, $18        ;; 00:0c1b ????????
    db   $d4, $3e, $05, $ef, $f5, $cd, $2f, $0c        ;; 00:0c23 ????????
    db   $f1, $ef, $18, $c9, $11, $b0, $c3, $4b        ;; 00:0c2b ????????
    db   $2a, $12, $13, $fe, $ff, $28, $01, $4b        ;; 00:0c33 ????????
    db   $05, $20, $f5, $59, $af, $12, $c9, $01        ;; 00:0c3b ????????
    db   $00, $40, $26, $00, $c3, $67, $00, $cd        ;; 00:0c43 ????????
    db   $01, $09, $cd, $54, $05, $7e, $fe, $ff        ;; 00:0c4b ????????
    db   $c9, $4e, $0c, $0d, $c8, $3e, $08, $cb        ;; 00:0c53 ????????
    db   $09, $3d, $30, $fb, $87, $87, $87, $21        ;; 00:0c5b ????????
    db   $c0, $7f, $c7, $24, $25, $c9, $cd, $01        ;; 00:0c63 ????????
    db   $09, $c5, $4f, $21, $da, $c3, $c7, $3e        ;; 00:0c6b ????????
    db   $ff, $6e, $bd, $79, $c1, $c9, $6e, $26        ;; 00:0c73 ????????
    db   $00, $01, $40, $46, $c3, $67, $00             ;; 00:0c7b ???????

call_00_0c82:
    push HL                                            ;; 00:0c82 $e5
    ld   L, E                                          ;; 00:0c83 $6b
    ld   H, $00                                        ;; 00:0c84 $26 $00
    add  HL, HL                                        ;; 00:0c86 $29
    add  HL, BC                                        ;; 00:0c87 $09
    rst  switchBank                                    ;; 00:0c88 $ef
    ldh  [hFF94], A                                    ;; 00:0c89 $e0 $94
    ld   E, [HL]                                       ;; 00:0c8b $5e
    inc  HL                                            ;; 00:0c8c $23
    ld   D, [HL]                                       ;; 00:0c8d $56
    pop  HL                                            ;; 00:0c8e $e1
    ret                                                ;; 00:0c8f $c9
    db   $f0, $9d, $6f, $f0, $9e, $67, $c9             ;; 00:0c90 ???????

call_00_0c97:
    push AF                                            ;; 00:0c97 $f5
    ldh  A, [hFF9B]                                    ;; 00:0c98 $f0 $9b
    ld   L, A                                          ;; 00:0c9a $6f
    ldh  A, [hFF9C]                                    ;; 00:0c9b $f0 $9c
    ld   H, A                                          ;; 00:0c9d $67
    pop  AF                                            ;; 00:0c9e $f1
    ret                                                ;; 00:0c9f $c9
    db   $cd, $7a, $03, $a7, $c0, $18, $f9             ;; 00:0ca0 ???????

call_00_0ca7:
    push AF                                            ;; 00:0ca7 $f5
    ldh  A, [hFFDE]                                    ;; 00:0ca8 $f0 $de
    and  A, A                                          ;; 00:0caa $a7
    jr   Z, .jr_00_0cae                                ;; 00:0cab $28 $01
    rst  rst_00_0010                                   ;; 00:0cad $d7
.jr_00_0cae:
    pop  AF                                            ;; 00:0cae $f1
    ret                                                ;; 00:0caf $c9
    db   $cd, $3d, $04, $21, $40, $99, $11, $20        ;; 00:0cb0 ????????
    db   $99, $06, $e0, $cd, $8f, $00, $21, $01        ;; 00:0cb8 ????????
    db   $9a, $3e, $7f, $06, $12, $cd, $7c, $00        ;; 00:0cc0 ????????
    db   $cd, $4e, $04                                 ;; 00:0cc8 ???

jp_00_0ccb:
    ld   C, $8d                                        ;; 00:0ccb $0e $8d
    ldh  A, [C]                                        ;; 00:0ccd $f2
    rrca                                               ;; 00:0cce $0f
    ret  C                                             ;; 00:0ccf $d8
    ld   A, [wCCCA]                                    ;; 00:0cd0 $fa $ca $cc
    add  A, A                                          ;; 00:0cd3 $87
    inc  A                                             ;; 00:0cd4 $3c
    ld   B, A                                          ;; 00:0cd5 $47
.jr_00_0cd6:
    rst  rst_00_0010                                   ;; 00:0cd6 $d7
    ldh  A, [C]                                        ;; 00:0cd7 $f2
    rrca                                               ;; 00:0cd8 $0f
    ret  C                                             ;; 00:0cd9 $d8
    rrca                                               ;; 00:0cda $0f
    jr   NC, .jr_00_0cde                               ;; 00:0cdb $30 $01
    inc  B                                             ;; 00:0cdd $04
.jr_00_0cde:
    dec  B                                             ;; 00:0cde $05
    jr   NZ, .jr_00_0cd6                               ;; 00:0cdf $20 $f5
    ret                                                ;; 00:0ce1 $c9
    db   $fd, $08, $fd, $08, $fd, $08, $fd, $08        ;; 00:0ce2 ????????
    db   $fd, $08, $fd, $08, $fd, $08, $fd, $08        ;; 00:0cea ????????
    db   $fd, $08, $fd, $08, $0b, $0a, $fd, $08        ;; 00:0cf2 ????????
    db   $fd, $08, $08, $0a, $fd, $08, $fd, $08        ;; 00:0cfa ????????
    db   $fd, $08, $fd, $08, $fd, $08, $a0, $0c        ;; 00:0d02 ????????
    db   $fd, $08, $fd, $08, $fd, $08, $fd, $08        ;; 00:0d0a ????????
    db   $fd, $08, $fd, $08, $fd, $08, $fd, $08        ;; 00:0d12 ????????
    db   $88, $09, $92, $09, $de, $09, $ea, $09        ;; 00:0d1a ????????
    db   $67, $09, $6e, $09, $a3, $09, $38, $0b        ;; 00:0d22 ????????
    db   $30, $0b, $4e, $0b, $b6, $0b, $d5, $0b        ;; 00:0d2a ????????
    db   $85, $0a, $9b, $0a, $c8, $0a, $d6, $0a        ;; 00:0d32 ????????
    db   $f4, $0a, $65, $0b, $6a, $0b, $84, $0b        ;; 00:0d3a ????????
    db   $89, $0b, $78, $0a, $94, $0b, $13, $0b        ;; 00:0d42 ????????
    db   $cc, $0a, $7b, $09, $33, $0a, $d9, $09        ;; 00:0d4a ????????
    db   $c1, $0b, $60, $0b, $39, $0a, $05, $0a        ;; 00:0d52 ????????
    db   $c3, $0a                                      ;; 00:0d5a ??

jp_00_0d5c:
    push AF                                            ;; 00:0d5c $f5
    push DE                                            ;; 00:0d5d $d5
    ld   D, $00                                        ;; 00:0d5e $16 $00
    ld   E, B                                          ;; 00:0d60 $58
    ld   A, $77                                        ;; 00:0d61 $3e $77
    call call_00_0d76                                  ;; 00:0d63 $cd $76 $0d
.jr_00_0d66:
    ld   [HL+], A                                      ;; 00:0d66 $22
    add  HL, DE                                        ;; 00:0d67 $19
    inc  A                                             ;; 00:0d68 $3c
    ld   [HL+], A                                      ;; 00:0d69 $22
    dec  A                                             ;; 00:0d6a $3d
    dec  C                                             ;; 00:0d6b $0d
    jr   NZ, .jr_00_0d66                               ;; 00:0d6c $20 $f8
    inc  A                                             ;; 00:0d6e $3c
    inc  A                                             ;; 00:0d6f $3c
    call call_00_0d76                                  ;; 00:0d70 $cd $76 $0d
    pop  DE                                            ;; 00:0d73 $d1
    pop  AF                                            ;; 00:0d74 $f1
    ret                                                ;; 00:0d75 $c9

call_00_0d76:
    ld   [HL+], A                                      ;; 00:0d76 $22
    ld   B, E                                          ;; 00:0d77 $43
    inc  A                                             ;; 00:0d78 $3c
    call call_00_007c                                  ;; 00:0d79 $cd $7c $00
    inc  A                                             ;; 00:0d7c $3c
    ld   [HL+], A                                      ;; 00:0d7d $22
    inc  A                                             ;; 00:0d7e $3c
    ret                                                ;; 00:0d7f $c9

jp_00_0d80:
    ld   A, E                                          ;; 00:0d80 $7b
    ld   [wC3AC], A                                    ;; 00:0d81 $ea $ac $c3
    ld   A, D                                          ;; 00:0d84 $7a
    ldh  [hFF8A], A                                    ;; 00:0d85 $e0 $8a
    ld   A, $03                                        ;; 00:0d87 $3e $03
    rst  switchBank                                    ;; 00:0d89 $ef
    push AF                                            ;; 00:0d8a $f5
.jr_00_0d8b:
    call call_03_7a50 ;@bank 3                         ;; 00:0d8b $cd $50 $7a
    jr   C, .jr_00_0d95                                ;; 00:0d8e $38 $05
    call call_03_7a53 ;@bank 3                         ;; 00:0d90 $cd $53 $7a
    jr   C, .jr_00_0d8b                                ;; 00:0d93 $38 $f6
.jr_00_0d95:
    rr   E                                             ;; 00:0d95 $cb $1b
    pop  AF                                            ;; 00:0d97 $f1
    rst  switchBank                                    ;; 00:0d98 $ef
    rl   E                                             ;; 00:0d99 $cb $13
    ret                                                ;; 00:0d9b $c9

jp_00_0d9c:
    call call_00_0551                                  ;; 00:0d9c $cd $51 $05
    ld   A, $0a                                        ;; 00:0d9f $3e $0a
    add  A, L                                          ;; 00:0da1 $85
    ld   L, A                                          ;; 00:0da2 $6f
    ld   A, [HL]                                       ;; 00:0da3 $7e
    bit  6, A                                          ;; 00:0da4 $cb $77
    jr   Z, .jr_00_0e00                                ;; 00:0da6 $28 $58
    and  A, $0f                                        ;; 00:0da8 $e6 $0f
    ldh  [hFF8A], A                                    ;; 00:0daa $e0 $8a
    ld   A, $02                                        ;; 00:0dac $3e $02
    rst  switchBank                                    ;; 00:0dae $ef
    push AF                                            ;; 00:0daf $f5
    ld   A, [wC3C8]                                    ;; 00:0db0 $fa $c8 $c3
    call call_00_0e02                                  ;; 00:0db3 $cd $02 $0e
    ld   E, A                                          ;; 00:0db6 $5f
    ld   D, $00                                        ;; 00:0db7 $16 $00
    call call_00_0e0d                                  ;; 00:0db9 $cd $0d $0e
    call call_00_0e02                                  ;; 00:0dbc $cd $02 $0e
    ld   L, A                                          ;; 00:0dbf $6f
    ld   H, $1d                                        ;; 00:0dc0 $26 $1d
    call call_00_0736                                  ;; 00:0dc2 $cd $36 $07
    add  HL, DE                                        ;; 00:0dc5 $19
    ld   BC, $6fd3                                     ;; 00:0dc6 $01 $d3 $6f
    add  HL, BC                                        ;; 00:0dc9 $09
    ld   A, [HL]                                       ;; 00:0dca $7e
    cp   A, $ff                                        ;; 00:0dcb $fe $ff
    jr   Z, .jr_00_0dfe                                ;; 00:0dcd $28 $2f
    ld   C, A                                          ;; 00:0dcf $4f
    call call_00_0e0d                                  ;; 00:0dd0 $cd $0d $0e
    ld   HL, $7438                                     ;; 00:0dd3 $21 $38 $74
    push HL                                            ;; 00:0dd6 $e5
    rst  add_hl_a                                      ;; 00:0dd7 $c7
    ld   A, [HL]                                       ;; 00:0dd8 $7e
    and  A, $0f                                        ;; 00:0dd9 $e6 $0f
    ld   B, A                                          ;; 00:0ddb $47
    ld   A, [wC3C8]                                    ;; 00:0ddc $fa $c8 $c3
    pop  HL                                            ;; 00:0ddf $e1
    rst  add_hl_a                                      ;; 00:0de0 $c7
    ld   A, [HL]                                       ;; 00:0de1 $7e
    and  A, $0f                                        ;; 00:0de2 $e6 $0f
    cp   A, B                                          ;; 00:0de4 $b8
    jr   NC, .jr_00_0de8                               ;; 00:0de5 $30 $01
    ld   A, B                                          ;; 00:0de7 $78
.jr_00_0de8:
    ld   L, C                                          ;; 00:0de8 $69
    ld   H, $00                                        ;; 00:0de9 $26 $00
    call call_00_005e                                  ;; 00:0deb $cd $5e $00
    rst  add_hl_a                                      ;; 00:0dee $c7
    ld   BC, $72a8                                     ;; 00:0def $01 $a8 $72
    add  HL, BC                                        ;; 00:0df2 $09
    ld   A, [HL]                                       ;; 00:0df3 $7e
    ld   [wC3C8], A                                    ;; 00:0df4 $ea $c8 $c3
    call call_00_061f                                  ;; 00:0df7 $cd $1f $06
    pop  AF                                            ;; 00:0dfa $f1
    rst  switchBank                                    ;; 00:0dfb $ef
    scf                                                ;; 00:0dfc $37
    ret                                                ;; 00:0dfd $c9
.jr_00_0dfe:
    pop  AF                                            ;; 00:0dfe $f1
    rst  switchBank                                    ;; 00:0dff $ef
.jr_00_0e00:
    and  A, A                                          ;; 00:0e00 $a7
    ret                                                ;; 00:0e01 $c9

call_00_0e02:
    call call_00_05db                                  ;; 00:0e02 $cd $db $05
    ld   HL, $e16                                      ;; 00:0e05 $21 $16 $0e
    ld   A, B                                          ;; 00:0e08 $78
    rst  add_hl_a                                      ;; 00:0e09 $c7
    ld   A, [HL]                                       ;; 00:0e0a $7e
    add  A, C                                          ;; 00:0e0b $81
    ret                                                ;; 00:0e0c $c9

call_00_0e0d:
    call call_00_0551                                  ;; 00:0e0d $cd $51 $05
    ld   A, $05                                        ;; 00:0e10 $3e $05
    add  A, L                                          ;; 00:0e12 $85
    ld   L, A                                          ;; 00:0e13 $6f
    ld   A, [HL]                                       ;; 00:0e14 $7e
    ret                                                ;; 00:0e15 $c9
    db   $00, $07, $12, $1b                            ;; 00:0e16 ????

call_00_0e1a:
    push AF                                            ;; 00:0e1a $f5
    push BC                                            ;; 00:0e1b $c5
    ld   A, [wC900]                                    ;; 00:0e1c $fa $00 $c9
    cp   A, $00                                        ;; 00:0e1f $fe $00
    jr   Z, .jr_00_0e24                                ;; 00:0e21 $28 $01
    dec  A                                             ;; 00:0e23 $3d
.jr_00_0e24:
    add  A, A                                          ;; 00:0e24 $87
    add  A, A                                          ;; 00:0e25 $87
    add  A, A                                          ;; 00:0e26 $87
    ld   B, $00                                        ;; 00:0e27 $06 $00
    ld   C, A                                          ;; 00:0e29 $4f
    add  HL, BC                                        ;; 00:0e2a $09
    pop  BC                                            ;; 00:0e2b $c1
    pop  AF                                            ;; 00:0e2c $f1
    ret                                                ;; 00:0e2d $c9
    db   $f5, $c5, $d5, $e5, $fa, $00, $c9, $3c        ;; 00:0e2e ????????
    db   $ea, $00, $c9, $cd, $41, $0e, $3e, $05        ;; 00:0e36 ????????
    db   $77, $18, $24, $21, $01, $c9, $cd, $1a        ;; 00:0e3e ????????
    db   $0e, $1a, $22, $13, $1a, $22, $c9             ;; 00:0e46 ???????

jp_00_0e4d:
    push AF                                            ;; 00:0e4d $f5
    push BC                                            ;; 00:0e4e $c5
    push DE                                            ;; 00:0e4f $d5
    push HL                                            ;; 00:0e50 $e5
    ld   A, [wC900]                                    ;; 00:0e51 $fa $00 $c9
    inc  A                                             ;; 00:0e54 $3c
    ld   [wC900], A                                    ;; 00:0e55 $ea $00 $c9
    ld   HL, wC901                                     ;; 00:0e58 $21 $01 $c9
    call call_00_0e1a                                  ;; 00:0e5b $cd $1a $0e
    ld   A, E                                          ;; 00:0e5e $7b
    ld   [HL+], A                                      ;; 00:0e5f $22
    ld   A, D                                          ;; 00:0e60 $7a
    ld   [HL+], A                                      ;; 00:0e61 $22
    ld   A, $0f                                        ;; 00:0e62 $3e $0f
    ld   [HL+], A                                      ;; 00:0e64 $22
    sub  A, A                                          ;; 00:0e65 $97
    ld   [HL], A                                       ;; 00:0e66 $77
    pop  HL                                            ;; 00:0e67 $e1
    pop  DE                                            ;; 00:0e68 $d1
    pop  BC                                            ;; 00:0e69 $c1
    pop  AF                                            ;; 00:0e6a $f1
    ret                                                ;; 00:0e6b $c9
    db   $d2, $0e, $06, $11, $64, $11, $e5, $c5        ;; 00:0e6c ????????
    db   $d5, $21, $03, $c9, $cd, $1a, $0e, $7e        ;; 00:0e74 ????????
    db   $fe, $0f, $28, $01, $ef, $21, $01, $c9        ;; 00:0e7c ????????
    db   $cd, $1a, $0e, $e5, $d1, $1a, $13, $6f        ;; 00:0e84 ????????
    db   $1a, $67, $4e, $23, $7d, $1b, $12, $7c        ;; 00:0e8c ????????
    db   $13, $12, $79, $d1, $c1, $e1, $c9, $21        ;; 00:0e94 ????????
    db   $03, $c9, $cd, $1a, $0e, $7e, $fe, $0f        ;; 00:0e9c ????????
    db   $c8, $ef, $21, $06, $c9, $cd, $1a, $0e        ;; 00:0ea4 ????????
    db   $77, $c9, $21, $03, $c9, $cd, $1a, $0e        ;; 00:0eac ????????
    db   $7e, $fe, $0f, $c8, $ef, $c9                  ;; 00:0eb4 ??????

jp_00_0eba:
    push AF                                            ;; 00:0eba $f5
    push BC                                            ;; 00:0ebb $c5
    push HL                                            ;; 00:0ebc $e5
    ld   HL, wC904                                     ;; 00:0ebd $21 $04 $c9
    call call_00_0e1a                                  ;; 00:0ec0 $cd $1a $0e
    ld   A, [HL]                                       ;; 00:0ec3 $7e
    add  A, A                                          ;; 00:0ec4 $87
    ld   L, A                                          ;; 00:0ec5 $6f
    ld   H, $00                                        ;; 00:0ec6 $26 $00
    ld   DE, $e6c                                      ;; 00:0ec8 $11 $6c $0e
    add  HL, DE                                        ;; 00:0ecb $19
    ld   E, [HL]                                       ;; 00:0ecc $5e
    inc  HL                                            ;; 00:0ecd $23
    ld   D, [HL]                                       ;; 00:0ece $56
    push DE                                            ;; 00:0ecf $d5
    pop  HL                                            ;; 00:0ed0 $e1
    jp   HL                                            ;; 00:0ed1 $e9
    db   $cd, $9b, $0e, $cd, $72, $0e, $fe, $00        ;; 00:0ed2 ????????
    db   $ca, $6a, $0f, $fe, $13, $20, $03, $c3        ;; 00:0eda ????????
    db   $80, $0f, $fe, $03, $30, $21, $5f, $d5        ;; 00:0ee2 ????????
    db   $cd, $72, $0e, $ea, $a9, $c3, $cd, $72        ;; 00:0eea ????????
    db   $0e, $ea, $aa, $c3, $3e, $01, $ea, $ab        ;; 00:0ef2 ????????
    db   $c3, $cd, $00, $12, $d1, $7b, $fe, $01        ;; 00:0efa ????????
    db   $ca, $d5, $0e, $97, $c3, $6a, $0f, $fe        ;; 00:0f02 ????????
    db   $04, $ca, $6d, $0f, $fe, $11, $ca, $9e        ;; 00:0f0a ????????
    db   $0f, $fe, $12, $ca, $4c, $11, $fe, $19        ;; 00:0f12 ????????
    db   $ca, $ee, $10, $fe, $14, $ca, $2f, $11        ;; 00:0f1a ????????
    db   $fe, $15, $ca, $36, $11, $fe, $16, $ca        ;; 00:0f22 ????????
    db   $3a, $11, $fe, $1a, $ca, $46, $11, $fe        ;; 00:0f2a ????????
    db   $50, $da, $79, $0f, $fe, $c0, $38, $04        ;; 00:0f32 ????????
    db   $fe, $e8, $38, $06, $fe, $80, $30, $1a        ;; 00:0f3a ????????
    db   $18, $02, $d6, $40, $d6, $50, $87, $21        ;; 00:0f42 ????????
    db   $00, $c8, $5f, $16, $00, $19, $2a, $46        ;; 00:0f4a ????????
    db   $21, $04, $c9, $cd, $1a, $0e, $36, $02        ;; 00:0f52 ????????
    db   $23, $70, $e6, $7f, $57, $1e, $7f, $cd        ;; 00:0f5a ????????
    db   $ae, $0e, $e1, $c1, $f1, $cb, $63, $c9        ;; 00:0f62 ????????
    db   $cd, $ae, $0e, $cd, $8e, $0f, $e1, $c1        ;; 00:0f6a ????????
    db   $f1, $11, $7f, $00, $cb, $42, $c9, $f6        ;; 00:0f72 ????????
    db   $80, $57, $1e, $7f, $18, $e1, $d7, $cd        ;; 00:0f7a ????????
    db   $74, $01, $fa, $8e, $ff, $e6, $01, $28        ;; 00:0f82 ????????
    db   $f5, $c3, $d5, $0e, $f5, $fa, $00, $c9        ;; 00:0f8a ????????
    db   $3d, $fe, $ff, $20, $02, $3e, $00, $ea        ;; 00:0f92 ????????
    db   $00, $c9, $f1, $c9, $cd, $72, $0e, $5f        ;; 00:0f9a ????????
    db   $e6, $f0, $cb, $37, $87, $4f, $06, $00        ;; 00:0fa2 ????????
    db   $21, $bd, $0f, $09, $4e, $23, $46, $c5        ;; 00:0faa ????????
    db   $e1, $cd, $b9, $0f, $c3, $d5, $0e, $7b        ;; 00:0fb2 ????????
    db   $e6, $0f, $e9, $ff, $0f, $20, $10, $8b        ;; 00:0fba ????????
    db   $10, $c6, $10, $d5, $e6, $0f, $4f, $cb        ;; 00:0fc2 ????????
    db   $3f, $6f, $26, $00, $11, $91, $cc, $19        ;; 00:0fca ????????
    db   $7e, $d1, $c9, $e5, $d5, $c5, $cd, $c5        ;; 00:0fd2 ????????
    db   $0f, $cb, $41, $20, $02, $cb, $37, $e6        ;; 00:0fda ????????
    db   $0f, $c1, $d1, $e1, $c9, $e5, $d5, $c5        ;; 00:0fe2 ????????
    db   $cd, $c5, $0f, $cb, $41, $20, $06, $cb        ;; 00:0fea ????????
    db   $32, $e6, $0f, $18, $02, $e6, $f0, $b2        ;; 00:0ff2 ????????
    db   $77, $c1, $d1, $e1, $c9, $cd, $d5, $0f        ;; 00:0ffa ????????
    db   $5f, $cd, $72, $0e, $57, $cb, $37, $e6        ;; 00:1002 ????????
    db   $0f, $bb, $28, $02, $30, $07, $7a, $e6        ;; 00:100a ????????
    db   $0f, $bb, $38, $01, $c9, $cd, $72, $0e        ;; 00:1012 ????????
    db   $cd, $72, $0e, $c3, $72, $0e, $5f, $cd        ;; 00:101a ????????
    db   $72, $0e, $01, $06, $cc, $cb, $43, $c4        ;; 00:1022 ????????
    db   $4c, $10, $cd, $45, $10, $cb, $4b, $c4        ;; 00:102a ????????
    db   $4c, $10, $cd, $45, $10, $cb, $53, $c4        ;; 00:1032 ????????
    db   $4c, $10, $cd, $45, $10, $cb, $5b, $c4        ;; 00:103a ????????
    db   $4c, $10, $c9, $21, $1f, $00, $09, $e5        ;; 00:1042 ????????
    db   $c1, $c9, $f5, $d5, $c5, $21, $fa, $ff        ;; 00:104a ????????
    db   $09, $cb, $46, $20, $30, $6f, $26, $00        ;; 00:1052 ????????
    db   $cb, $7f, $28, $02, $26, $ff, $0a, $03        ;; 00:105a ????????
    db   $5f, $0a, $57, $19, $cb, $7c, $20, $04        ;; 00:1062 ????????
    db   $7d, $b4, $20, $03, $21, $01, $00, $e5        ;; 00:106a ????????
    db   $d1, $c5, $c5, $e1, $23, $4e, $23, $46        ;; 00:1072 ????????
    db   $c5, $e1, $cd, $68, $01, $30, $02, $e5        ;; 00:107a ????????
    db   $d1, $e1, $72, $2b, $73, $c1, $d1, $f1        ;; 00:1082 ????????
    db   $c9, $cd, $72, $0e, $57, $cd, $96, $10        ;; 00:108a ????????
    db   $c4, $17, $10, $c9, $21, $7c, $cc, $cd        ;; 00:1092 ????????
    db   $b9, $10, $c8, $21, $0f, $cc, $cd, $b9        ;; 00:109a ????????
    db   $10, $c8, $21, $2e, $cc, $cd, $b9, $10        ;; 00:10a2 ????????
    db   $c8, $21, $4d, $cc, $cd, $b9, $10, $c8        ;; 00:10aa ????????
    db   $21, $6c, $cc, $cd, $b9, $10, $c9, $0e        ;; 00:10b2 ????????
    db   $08, $7a, $be, $c8, $23, $23, $0d, $20        ;; 00:10ba ????????
    db   $f9, $f6, $01, $c9, $4f, $cd, $72, $0e        ;; 00:10c2 ????????
    db   $f5, $e6, $0f, $5f, $f1, $cb, $37, $e6        ;; 00:10ca ????????
    db   $0f, $57, $cd, $d5, $0f, $47, $79, $fe        ;; 00:10d2 ????????
    db   $00, $28, $0a, $78, $83, $fe, $10, $38        ;; 00:10da ????????
    db   $05, $3e, $0f, $18, $01, $7b, $5f, $7a        ;; 00:10e2 ????????
    db   $53, $c3, $e7, $0f, $21, $04, $c9, $cd        ;; 00:10ea ????????
    db   $1a, $0e, $3e, $01, $22, $3e, $00, $22        ;; 00:10f2 ????????
    db   $23, $cd, $72, $0e, $fe, $ff, $20, $03        ;; 00:10fa ????????
    db   $fa, $8c, $cc, $77, $21, $07, $c9, $cd        ;; 00:1102 ????????
    db   $1a, $0e, $3a, $e5, $6f, $26, $1f, $cd        ;; 00:110a ????????
    db   $5f, $01, $01, $00, $cc, $09, $e5, $d1        ;; 00:1112 ????????
    db   $e1, $2b, $7e, $3c, $32, $fe, $05, $20        ;; 00:111a ????????
    db   $04, $35, $c3, $d2, $0e, $6f, $26, $00        ;; 00:1122 ????????
    db   $19, $7e, $c3, $5c, $0f, $97, $cd, $09        ;; 00:112a ????????
    db   $12, $c3, $d5, $0e, $3e, $01, $18, $f6        ;; 00:1132 ????????
    db   $cd, $72, $0e, $f5, $d7, $f1, $3d, $20        ;; 00:113a ????????
    db   $fa, $c3, $d5, $0e, $cd, $06, $12, $c3        ;; 00:1142 ????????
    db   $d5, $0e, $cd, $72, $0e, $57, $cd, $72        ;; 00:114a ????????
    db   $0e, $5f, $cb, $23, $cb, $12, $21, $10        ;; 00:1152 ????????
    db   $7b, $19, $e5, $d1, $cd, $41, $0e, $c3        ;; 00:115a ????????
    db   $d5, $0e, $21, $05, $c9, $cd, $1a, $0e        ;; 00:1162 ????????
    db   $3a, $36, $00, $c3, $5c, $0f, $00, $00        ;; 00:116a ????????
    db   $08, $00, $00, $00, $00, $00, $00, $08        ;; 00:1172 ????????
    db   $00, $00, $00, $00, $0a, $00, $00, $00        ;; 00:117a ????????
    db   $00, $00, $08, $00, $00, $00, $00, $00        ;; 00:1182 ????????
    db   $08, $00, $00, $20, $00, $00, $00, $00        ;; 00:118a ????????
    db   $02, $00, $00, $00, $00, $01, $00, $00        ;; 00:1192 ????????
    db   $88, $00, $00, $00, $00, $00, $00, $00        ;; 00:119a ????????
    db   $00, $04, $00, $00, $00, $00, $00, $80        ;; 00:11a2 ????????
    db   $00, $00, $00, $04, $00, $00, $00, $00        ;; 00:11aa ????????
    db   $00, $00, $08, $00, $00, $00, $00, $00        ;; 00:11b2 ????????
    db   $00, $80, $00, $40, $00, $80, $00, $00        ;; 00:11ba ????????
    db   $00, $00, $00, $00, $00, $00, $08, $00        ;; 00:11c2 ????????
    db   $00, $80, $82, $80, $08, $02, $80, $00        ;; 00:11ca ????????
    db   $00, $00, $00, $01, $10, $06, $00, $00        ;; 00:11d2 ????????
    db   $02, $00, $00, $00, $00, $10, $00, $00        ;; 00:11da ????????
    db   $00, $01, $00, $00, $00, $00, $08, $00        ;; 00:11e2 ????????
    db   $00, $40, $00, $00, $00, $00, $00, $00        ;; 00:11ea ????????
    db   $00, $01, $00, $00, $00, $00, $00, $00        ;; 00:11f2 ????????
    db   $00, $05, $00, $20, $00, $08, $c3, $e0        ;; 00:11fa ????????
    db   $16, $c9, $00, $00, $c3, $dd, $24, $c3        ;; 00:1202 ????????
    db   $50, $35                                      ;; 00:120a ??

jp_00_120c:
    jp   jp_00_1224                                    ;; 00:120c $c3 $24 $12
    db   $c9, $00, $00                                 ;; 00:120f ???

jp_00_1212:
    ld   A, $d0                                        ;; 00:1212 $3e $d0
    ld   [wC5BF], A                                    ;; 00:1214 $ea $bf $c5
    ld   A, $52                                        ;; 00:1217 $3e $52
    ld   [wC5C0], A                                    ;; 00:1219 $ea $c0 $c5
    call call_00_125a                                  ;; 00:121c $cd $5a $12
    call call_00_22cc                                  ;; 00:121f $cd $cc $22
    jr   jr_00_1243                                    ;; 00:1222 $18 $1f

jp_00_1224:
    call call_00_125a                                  ;; 00:1224 $cd $5a $12
    ld   A, [wCCC7]                                    ;; 00:1227 $fa $c7 $cc
    call call_00_22bc                                  ;; 00:122a $cd $bc $22
    jr   jr_00_1243                                    ;; 00:122d $18 $14
    db   $04, $08, $0a, $0c, $0c, $0e, $0c, $0a        ;; 00:122f ????????
    db   $08, $04, $fc, $f8, $f4, $f2, $f0, $f2        ;; 00:1237 ????????
    db   $f4, $f6, $fa, $80                            ;; 00:123f ????

jr_00_1243:
    call call_00_127d                                  ;; 00:1243 $cd $7d $12
    call call_00_1e26                                  ;; 00:1246 $cd $26 $1e
    call call_00_209d                                  ;; 00:1249 $cd $9d $20
    call call_00_2173                                  ;; 00:124c $cd $73 $21
    call call_00_2466                                  ;; 00:124f $cd $66 $24
    call call_00_16e0                                  ;; 00:1252 $cd $e0 $16
    call call_00_22cc                                  ;; 00:1255 $cd $cc $22
    jr   jr_00_1243                                    ;; 00:1258 $18 $e9

call_00_125a:
    xor  A, A                                          ;; 00:125a $af
    ld   [wC5B7], A                                    ;; 00:125b $ea $b7 $c5
    ld   [wC5CB], A                                    ;; 00:125e $ea $cb $c5
    ld   [wC5BA], A                                    ;; 00:1261 $ea $ba $c5
    ret                                                ;; 00:1264 $c9

call_00_1265:
    call call_00_1f33                                  ;; 00:1265 $cd $33 $1f
    rst  rst_00_0010                                   ;; 00:1268 $d7
    ld   HL, wC5B6                                     ;; 00:1269 $21 $b6 $c5
    inc  [HL]                                          ;; 00:126c $34
    ld   A, $10                                        ;; 00:126d $3e $10
    and  A, [HL]                                       ;; 00:126f $a6
    swap A                                             ;; 00:1270 $cb $37
    or   A, $c0                                        ;; 00:1272 $f6 $c0
    jp   hFF80                                         ;; 00:1274 $c3 $80 $ff

jr_00_1277:
    call call_00_1265                                  ;; 00:1277 $cd $65 $12
    jp   call_00_1466                                  ;; 00:127a $c3 $66 $14

call_00_127d:
    ld   A, [wC5B1]                                    ;; 00:127d $fa $b1 $c5
    and  A, $f0                                        ;; 00:1280 $e6 $f0
    jr   Z, jr_00_1277                                 ;; 00:1282 $28 $f3
    call call_00_12f8                                  ;; 00:1284 $cd $f8 $12
    call call_00_1c80                                  ;; 00:1287 $cd $80 $1c
    xor  A, A                                          ;; 00:128a $af
    ld   [wC5BA], A                                    ;; 00:128b $ea $ba $c5
    ldh  A, [hFFFE]                                    ;; 00:128e $f0 $fe
    dec  A                                             ;; 00:1290 $3d
    cp   A, $ff                                        ;; 00:1291 $fe $ff
    jr   Z, .jr_00_129d                                ;; 00:1293 $28 $08
    ldh  [hFFFE], A                                    ;; 00:1295 $e0 $fe
    xor  A, A                                          ;; 00:1297 $af
    ldh  [hFFFD], A                                    ;; 00:1298 $e0 $fd
    ld   [wC5CC], A                                    ;; 00:129a $ea $cc $c5
.jr_00_129d:
    call call_00_141d                                  ;; 00:129d $cd $1d $14
    jr   .jr_00_12a5                                   ;; 00:12a0 $18 $03
.jr_00_12a2:
    call call_00_1265                                  ;; 00:12a2 $cd $65 $12
.jr_00_12a5:
    call call_00_1466                                  ;; 00:12a5 $cd $66 $14
    call call_00_12b4                                  ;; 00:12a8 $cd $b4 $12
    ld   A, [wC5B1]                                    ;; 00:12ab $fa $b1 $c5
    or   A, A                                          ;; 00:12ae $b7
    jr   NZ, .jr_00_12a2                               ;; 00:12af $20 $f1
    jp   call_00_1d26                                  ;; 00:12b1 $c3 $26 $1d

call_00_12b4:
    ld   A, [wC5B2]                                    ;; 00:12b4 $fa $b2 $c5
    ld   B, A                                          ;; 00:12b7 $47
    ld   DE, wC010                                     ;; 00:12b8 $11 $10 $c0
    ld   L, $20                                        ;; 00:12bb $2e $20
    ld   A, [wC5B1]                                    ;; 00:12bd $fa $b1 $c5
    ld   C, $42                                        ;; 00:12c0 $0e $42
    rla                                                ;; 00:12c2 $17
    jr   C, .jr_00_12d7                                ;; 00:12c3 $38 $12
    rla                                                ;; 00:12c5 $17
    jr   C, .jr_00_12de                                ;; 00:12c6 $38 $16
    inc  E                                             ;; 00:12c8 $1c
    rla                                                ;; 00:12c9 $17
    jr   C, .jr_00_12e5                                ;; 00:12ca $38 $19
    call call_00_1c48                                  ;; 00:12cc $cd $48 $1c
    inc  C                                             ;; 00:12cf $0c
    ldh  A, [C]                                        ;; 00:12d0 $f2
    add  A, B                                          ;; 00:12d1 $80
    ldh  [C], A                                        ;; 00:12d2 $e2
    add  A, $08                                        ;; 00:12d3 $c6 $08
    jr   .jr_00_12f1                                   ;; 00:12d5 $18 $1a
.jr_00_12d7:
    call call_00_1c58                                  ;; 00:12d7 $cd $58 $1c
    ldh  A, [C]                                        ;; 00:12da $f2
    add  A, B                                          ;; 00:12db $80
    jr   .jr_00_12f0                                   ;; 00:12dc $18 $12
.jr_00_12de:
    call call_00_1c6c                                  ;; 00:12de $cd $6c $1c
    ldh  A, [C]                                        ;; 00:12e1 $f2
    sub  A, B                                          ;; 00:12e2 $90
    jr   .jr_00_12f0                                   ;; 00:12e3 $18 $0b
.jr_00_12e5:
    call call_00_1c38                                  ;; 00:12e5 $cd $38 $1c
    inc  C                                             ;; 00:12e8 $0c
    ldh  A, [C]                                        ;; 00:12e9 $f2
    sub  A, B                                          ;; 00:12ea $90
    ldh  [C], A                                        ;; 00:12eb $e2
    add  A, $08                                        ;; 00:12ec $c6 $08
    jr   .jr_00_12f1                                   ;; 00:12ee $18 $01
.jr_00_12f0:
    ldh  [C], A                                        ;; 00:12f0 $e2
.jr_00_12f1:
    and  A, $0f                                        ;; 00:12f1 $e6 $0f
    ret  NZ                                            ;; 00:12f3 $c0
    ld   [wC5B1], A                                    ;; 00:12f4 $ea $b1 $c5
    ret                                                ;; 00:12f7 $c9

call_00_12f8:
    rla                                                ;; 00:12f8 $17
    jr   C, .jr_00_131e                                ;; 00:12f9 $38 $23
    rla                                                ;; 00:12fb $17
    jr   C, .jr_00_1304                                ;; 00:12fc $38 $06
    rla                                                ;; 00:12fe $17
    jr   C, .jr_00_1338                                ;; 00:12ff $38 $37
    jp   .jp_00_1350                                   ;; 00:1301 $c3 $50 $13
.jr_00_1304:
    ldh  A, [rSCX]                                     ;; 00:1304 $f0 $43
    sub  A, $08                                        ;; 00:1306 $d6 $08
    ld   D, A                                          ;; 00:1308 $57
    ldh  A, [rSCY]                                     ;; 00:1309 $f0 $42
    sub  A, $10                                        ;; 00:130b $d6 $10
    call call_00_13ce                                  ;; 00:130d $cd $ce $13
    ld   A, [wCCC8]                                    ;; 00:1310 $fa $c8 $cc
    add  A, $fb                                        ;; 00:1313 $c6 $fb
    ld   E, A                                          ;; 00:1315 $5f
    call call_00_1368                                  ;; 00:1316 $cd $68 $13
    ld   HL, wCCC8                                     ;; 00:1319 $21 $c8 $cc
    dec  [HL]                                          ;; 00:131c $35
    ret                                                ;; 00:131d $c9
.jr_00_131e:
    ldh  A, [rSCX]                                     ;; 00:131e $f0 $43
    sub  A, $08                                        ;; 00:1320 $d6 $08
    ld   D, A                                          ;; 00:1322 $57
    ldh  A, [rSCY]                                     ;; 00:1323 $f0 $42
    add  A, $90                                        ;; 00:1325 $c6 $90
    call call_00_13ce                                  ;; 00:1327 $cd $ce $13
    ld   A, [wCCC8]                                    ;; 00:132a $fa $c8 $cc
    add  A, $05                                        ;; 00:132d $c6 $05
    ld   E, A                                          ;; 00:132f $5f
    call call_00_1368                                  ;; 00:1330 $cd $68 $13
    ld   HL, wCCC8                                     ;; 00:1333 $21 $c8 $cc
    inc  [HL]                                          ;; 00:1336 $34
    ret                                                ;; 00:1337 $c9
.jr_00_1338:
    ldh  A, [rSCX]                                     ;; 00:1338 $f0 $43
    sub  A, $18                                        ;; 00:133a $d6 $18
    ld   D, A                                          ;; 00:133c $57
    ldh  A, [rSCY]                                     ;; 00:133d $f0 $42
    call call_00_13ce                                  ;; 00:133f $cd $ce $13
    ld   A, [wCCC9]                                    ;; 00:1342 $fa $c9 $cc
    add  A, $fa                                        ;; 00:1345 $c6 $fa
    ld   D, A                                          ;; 00:1347 $57
    call call_00_1390                                  ;; 00:1348 $cd $90 $13
    ld   HL, wCCC9                                     ;; 00:134b $21 $c9 $cc
    dec  [HL]                                          ;; 00:134e $35
    ret                                                ;; 00:134f $c9
.jp_00_1350:
    ldh  A, [rSCX]                                     ;; 00:1350 $f0 $43
    add  A, $a8                                        ;; 00:1352 $c6 $a8
    ld   D, A                                          ;; 00:1354 $57
    ldh  A, [rSCY]                                     ;; 00:1355 $f0 $42
    call call_00_13ce                                  ;; 00:1357 $cd $ce $13
    ld   A, [wCCC9]                                    ;; 00:135a $fa $c9 $cc
    add  A, $06                                        ;; 00:135d $c6 $06
    ld   D, A                                          ;; 00:135f $57
    call call_00_1390                                  ;; 00:1360 $cd $90 $13
    ld   HL, wCCC9                                     ;; 00:1363 $21 $c9 $cc
    inc  [HL]                                          ;; 00:1366 $34
    ret                                                ;; 00:1367 $c9

call_00_1368:
    ld   A, [wCCC9]                                    ;; 00:1368 $fa $c9 $cc
    add  A, $fb                                        ;; 00:136b $c6 $fb
    ld   D, A                                          ;; 00:136d $57
    ld   HL, wC500                                     ;; 00:136e $21 $00 $c5
    ld   B, $0b                                        ;; 00:1371 $06 $0b
.jr_00_1373:
    push DE                                            ;; 00:1373 $d5
    call call_00_13b0                                  ;; 00:1374 $cd $b0 $13
    add  A, A                                          ;; 00:1377 $87
    add  A, A                                          ;; 00:1378 $87
    add  A, $80                                        ;; 00:1379 $c6 $80
    ld   [HL+], A                                      ;; 00:137b $22
    inc  A                                             ;; 00:137c $3c
    ld   [HL+], A                                      ;; 00:137d $22
    inc  A                                             ;; 00:137e $3c
    ld   C, A                                          ;; 00:137f $4f
    push HL                                            ;; 00:1380 $e5
    ld   A, L                                          ;; 00:1381 $7d
    add  A, $14                                        ;; 00:1382 $c6 $14
    ld   L, A                                          ;; 00:1384 $6f
    ld   A, C                                          ;; 00:1385 $79
    ld   [HL+], A                                      ;; 00:1386 $22
    inc  A                                             ;; 00:1387 $3c
    ld   [HL], A                                       ;; 00:1388 $77
    pop  HL                                            ;; 00:1389 $e1
    pop  DE                                            ;; 00:138a $d1
    inc  D                                             ;; 00:138b $14
    dec  B                                             ;; 00:138c $05
    jr   NZ, .jr_00_1373                               ;; 00:138d $20 $e4
    ret                                                ;; 00:138f $c9

call_00_1390:
    ld   A, [wCCC8]                                    ;; 00:1390 $fa $c8 $cc
    add  A, $fc                                        ;; 00:1393 $c6 $fc
    ld   E, A                                          ;; 00:1395 $5f
    ld   HL, wC500                                     ;; 00:1396 $21 $00 $c5
    ld   B, $09                                        ;; 00:1399 $06 $09
.jr_00_139b:
    push DE                                            ;; 00:139b $d5
    call call_00_13b0                                  ;; 00:139c $cd $b0 $13
    add  A, A                                          ;; 00:139f $87
    add  A, A                                          ;; 00:13a0 $87
    add  A, $80                                        ;; 00:13a1 $c6 $80
    ld   [HL+], A                                      ;; 00:13a3 $22
    inc  A                                             ;; 00:13a4 $3c
    ld   [HL+], A                                      ;; 00:13a5 $22
    inc  A                                             ;; 00:13a6 $3c
    ld   [HL+], A                                      ;; 00:13a7 $22
    inc  A                                             ;; 00:13a8 $3c
    ld   [HL+], A                                      ;; 00:13a9 $22
    pop  DE                                            ;; 00:13aa $d1
    inc  E                                             ;; 00:13ab $1c
    dec  B                                             ;; 00:13ac $05
    jr   NZ, .jr_00_139b                               ;; 00:13ad $20 $ec
    ret                                                ;; 00:13af $c9

call_00_13b0:
    ld   A, E                                          ;; 00:13b0 $7b
    cp   A, $3e                                        ;; 00:13b1 $fe $3e
    jr   NC, .jr_00_13cb                               ;; 00:13b3 $30 $16
    ld   A, D                                          ;; 00:13b5 $7a
    cp   A, $40                                        ;; 00:13b6 $fe $40
    jr   NC, .jr_00_13cb                               ;; 00:13b8 $30 $11
    xor  A, A                                          ;; 00:13ba $af
    srl  E                                             ;; 00:13bb $cb $3b
    rra                                                ;; 00:13bd $1f
    srl  E                                             ;; 00:13be $cb $3b
    rra                                                ;; 00:13c0 $1f
    or   A, D                                          ;; 00:13c1 $b2
    ld   D, E                                          ;; 00:13c2 $53
    ld   E, A                                          ;; 00:13c3 $5f
    ld   A, D                                          ;; 00:13c4 $7a
    add  A, $d0                                        ;; 00:13c5 $c6 $d0
    ld   D, A                                          ;; 00:13c7 $57
    ld   A, [DE]                                       ;; 00:13c8 $1a
    scf                                                ;; 00:13c9 $37
    ret                                                ;; 00:13ca $c9
.jr_00_13cb:
    ld   A, $1e                                        ;; 00:13cb $3e $1e
    ret                                                ;; 00:13cd $c9

call_00_13ce:
    ld   L, A                                          ;; 00:13ce $6f
    ld   H, $00                                        ;; 00:13cf $26 $00
    add  HL, HL                                        ;; 00:13d1 $29
    add  HL, HL                                        ;; 00:13d2 $29
    ld   A, D                                          ;; 00:13d3 $7a
    srl  A                                             ;; 00:13d4 $cb $3f
    srl  A                                             ;; 00:13d6 $cb $3f
    srl  A                                             ;; 00:13d8 $cb $3f
    ld   E, A                                          ;; 00:13da $5f
    ld   D, $98                                        ;; 00:13db $16 $98
    add  HL, DE                                        ;; 00:13dd $19
    ld   A, H                                          ;; 00:13de $7c
    ld   [wC5B5], A                                    ;; 00:13df $ea $b5 $c5
    ld   A, L                                          ;; 00:13e2 $7d
    ld   [wC5B4], A                                    ;; 00:13e3 $ea $b4 $c5
    ret                                                ;; 00:13e6 $c9

call_00_13e7:
    ld   HL, wCCC8                                     ;; 00:13e7 $21 $c8 $cc
    ld   E, [HL]                                       ;; 00:13ea $5e
    inc  L                                             ;; 00:13eb $2c
    ld   D, [HL]                                       ;; 00:13ec $56

call_00_13ed:
    call call_00_13b0                                  ;; 00:13ed $cd $b0 $13

call_00_13f0:
    add  A, A                                          ;; 00:13f0 $87
    or   A, $80                                        ;; 00:13f1 $f6 $80
    ld   L, A                                          ;; 00:13f3 $6f
    ld   H, $df                                        ;; 00:13f4 $26 $df
    ld   E, [HL]                                       ;; 00:13f6 $5e
    inc  L                                             ;; 00:13f7 $2c
    ld   D, [HL]                                       ;; 00:13f8 $56
    ret                                                ;; 00:13f9 $c9

call_00_13fa:
    push HL                                            ;; 00:13fa $e5
    call call_00_13ed                                  ;; 00:13fb $cd $ed $13
    bit  6, E                                          ;; 00:13fe $cb $73
    jr   NZ, .jr_00_1414                               ;; 00:1400 $20 $12
    ld   A, E                                          ;; 00:1402 $7b
    and  A, $b0                                        ;; 00:1403 $e6 $b0
    jr   NZ, .jr_00_1419                               ;; 00:1405 $20 $12
    ld   A, [wCCC1]                                    ;; 00:1407 $fa $c1 $cc
    push DE                                            ;; 00:140a $d5
    ld   HL, $1538                                     ;; 00:140b $21 $38 $15
    rst  add_hl_a                                      ;; 00:140e $c7
    ld   A, [HL]                                       ;; 00:140f $7e
    pop  DE                                            ;; 00:1410 $d1
    pop  HL                                            ;; 00:1411 $e1
    and  A, D                                          ;; 00:1412 $a2
    ret                                                ;; 00:1413 $c9
.jr_00_1414:
    pop  HL                                            ;; 00:1414 $e1
    ld   A, $01                                        ;; 00:1415 $3e $01
    or   A, A                                          ;; 00:1417 $b7
    ret                                                ;; 00:1418 $c9
.jr_00_1419:
    pop  HL                                            ;; 00:1419 $e1
    xor  A, A                                          ;; 00:141a $af
    or   A, A                                          ;; 00:141b $b7
    ret                                                ;; 00:141c $c9

call_00_141d:
    ld   A, [wC5B4]                                    ;; 00:141d $fa $b4 $c5
    ld   L, A                                          ;; 00:1420 $6f
    ld   A, [wC5B5]                                    ;; 00:1421 $fa $b5 $c5
    ld   H, A                                          ;; 00:1424 $67
    rst  rst_00_0010                                   ;; 00:1425 $d7
    ld   A, [wC5B1]                                    ;; 00:1426 $fa $b1 $c5
    and  A, $c0                                        ;; 00:1429 $e6 $c0
    jr   NZ, .jr_00_1441                               ;; 00:142b $20 $14
    ld   DE, wC500                                     ;; 00:142d $11 $00 $c5
    ld   B, $12                                        ;; 00:1430 $06 $12
.jr_00_1432:
    ld   A, [DE]                                       ;; 00:1432 $1a
    ld   [HL+], A                                      ;; 00:1433 $22
    inc  E                                             ;; 00:1434 $1c
    ld   A, [DE]                                       ;; 00:1435 $1a
    ld   [HL], A                                       ;; 00:1436 $77
    inc  E                                             ;; 00:1437 $1c
    ld   A, $1f                                        ;; 00:1438 $3e $1f
    rst  add_hl_a                                      ;; 00:143a $c7
    res  2, H                                          ;; 00:143b $cb $94
    dec  B                                             ;; 00:143d $05
    jr   NZ, .jr_00_1432                               ;; 00:143e $20 $f2
    ret                                                ;; 00:1440 $c9
.jr_00_1441:
    ld   DE, wC500                                     ;; 00:1441 $11 $00 $c5
    push HL                                            ;; 00:1444 $e5
    ld   B, $0b                                        ;; 00:1445 $06 $0b
.jr_00_1447:
    ld   A, [DE]                                       ;; 00:1447 $1a
    ld   [HL+], A                                      ;; 00:1448 $22
    inc  E                                             ;; 00:1449 $1c
    ld   A, [DE]                                       ;; 00:144a $1a
    ld   [HL+], A                                      ;; 00:144b $22
    res  5, L                                          ;; 00:144c $cb $ad
    inc  E                                             ;; 00:144e $1c
    dec  B                                             ;; 00:144f $05
    jr   NZ, .jr_00_1447                               ;; 00:1450 $20 $f5
    pop  HL                                            ;; 00:1452 $e1
    set  5, L                                          ;; 00:1453 $cb $ed
    ld   B, $0b                                        ;; 00:1455 $06 $0b
.jr_00_1457:
    ld   A, [DE]                                       ;; 00:1457 $1a
    ld   [HL+], A                                      ;; 00:1458 $22
    inc  E                                             ;; 00:1459 $1c
    ld   A, [DE]                                       ;; 00:145a $1a
    ld   [HL], A                                       ;; 00:145b $77
    res  5, L                                          ;; 00:145c $cb $ad
    inc  L                                             ;; 00:145e $2c
    set  5, L                                          ;; 00:145f $cb $ed
    inc  E                                             ;; 00:1461 $1c
    dec  B                                             ;; 00:1462 $05
    jr   NZ, .jr_00_1457                               ;; 00:1463 $20 $f2
    ret                                                ;; 00:1465 $c9

call_00_1466:
    ld   A, [wC5BB]                                    ;; 00:1466 $fa $bb $c5
    or   A, A                                          ;; 00:1469 $b7
    ret  Z                                             ;; 00:146a $c8
    ld   E, A                                          ;; 00:146b $5f
    ld   D, A                                          ;; 00:146c $57
    ld   A, [wC5BC]                                    ;; 00:146d $fa $bc $c5
    ld   L, A                                          ;; 00:1470 $6f
    ld   H, $88                                        ;; 00:1471 $26 $88
    ld   C, [HL]                                       ;; 00:1473 $4e
    set  4, L                                          ;; 00:1474 $cb $e5
    ld   B, [HL]                                       ;; 00:1476 $46
    ld   A, B                                          ;; 00:1477 $78
.jr_00_1478:
    rra                                                ;; 00:1478 $1f
    rr   C                                             ;; 00:1479 $cb $19
    rr   B                                             ;; 00:147b $cb $18
    dec  D                                             ;; 00:147d $15
    jr   NZ, .jr_00_1478                               ;; 00:147e $20 $f8
    ld   [HL], B                                       ;; 00:1480 $70
    res  4, L                                          ;; 00:1481 $cb $a5
    ld   [HL], C                                       ;; 00:1483 $71
    inc  L                                             ;; 00:1484 $2c
    ld   C, [HL]                                       ;; 00:1485 $4e
    set  4, L                                          ;; 00:1486 $cb $e5
    ld   B, [HL]                                       ;; 00:1488 $46
    ld   A, B                                          ;; 00:1489 $78
.jr_00_148a:
    rra                                                ;; 00:148a $1f
    rr   C                                             ;; 00:148b $cb $19
    rr   B                                             ;; 00:148d $cb $18
    dec  E                                             ;; 00:148f $1d
    jr   NZ, .jr_00_148a                               ;; 00:1490 $20 $f8
    ld   [HL], B                                       ;; 00:1492 $70
    res  4, L                                          ;; 00:1493 $cb $a5
    ld   [HL], C                                       ;; 00:1495 $71
    ld   A, [wC5BC]                                    ;; 00:1496 $fa $bc $c5
    inc  A                                             ;; 00:1499 $3c
    inc  A                                             ;; 00:149a $3c
    ld   [wC5BC], A                                    ;; 00:149b $ea $bc $c5
    cp   A, $10                                        ;; 00:149e $fe $10
    jr   Z, .jr_00_14aa                                ;; 00:14a0 $28 $08
    cp   A, $30                                        ;; 00:14a2 $fe $30
    ret  NZ                                            ;; 00:14a4 $c0
    xor  A, A                                          ;; 00:14a5 $af
    ld   [wC5BC], A                                    ;; 00:14a6 $ea $bc $c5
    ret                                                ;; 00:14a9 $c9
.jr_00_14aa:
    ld   A, $20                                        ;; 00:14aa $3e $20
    ld   [wC5BC], A                                    ;; 00:14ac $ea $bc $c5
    ret                                                ;; 00:14af $c9

call_00_14b0:
    xor  A, A                                          ;; 00:14b0 $af
    ldh  [rSCY], A                                     ;; 00:14b1 $e0 $42
    ld   A, $08                                        ;; 00:14b3 $3e $08
    ldh  [rSCX], A                                     ;; 00:14b5 $e0 $43
    ld   HL, wC000                                     ;; 00:14b7 $21 $00 $c0
    ld   B, $28                                        ;; 00:14ba $06 $28
.jr_00_14bc:
    ld   [HL], $b0                                     ;; 00:14bc $36 $b0
    set  0, H                                          ;; 00:14be $cb $c4
    ld   [HL], $b0                                     ;; 00:14c0 $36 $b0
    inc  L                                             ;; 00:14c2 $2c
    inc  L                                             ;; 00:14c3 $2c
    inc  L                                             ;; 00:14c4 $2c
    ld   [HL], $00                                     ;; 00:14c5 $36 $00
    res  0, H                                          ;; 00:14c7 $cb $84
    ld   [HL], $00                                     ;; 00:14c9 $36 $00
    inc  L                                             ;; 00:14cb $2c
    dec  B                                             ;; 00:14cc $05
    jr   NZ, .jr_00_14bc                               ;; 00:14cd $20 $ed
    call call_00_14f0                                  ;; 00:14cf $cd $f0 $14
    call call_00_1c80                                  ;; 00:14d2 $cd $80 $1c
    call call_00_1d26                                  ;; 00:14d5 $cd $26 $1d
    call call_00_1f81                                  ;; 00:14d8 $cd $81 $1f

call_00_14db:
    ld   A, $90                                        ;; 00:14db $3e $90
    ldh  [rWY], A                                      ;; 00:14dd $e0 $4a
    ld   A, $07                                        ;; 00:14df $3e $07
    ldh  [rWX], A                                      ;; 00:14e1 $e0 $4b
    ret                                                ;; 00:14e3 $c9

call_00_14e4:
    ld   A, $50                                        ;; 00:14e4 $3e $50
    jr   jr_00_14e9                                    ;; 00:14e6 $18 $01

call_00_14e8:
    xor  A, A                                          ;; 00:14e8 $af

jr_00_14e9:
    ldh  [rWY], A                                      ;; 00:14e9 $e0 $4a
    ld   A, $07                                        ;; 00:14eb $3e $07
    ldh  [rWX], A                                      ;; 00:14ed $e0 $4b
    ret                                                ;; 00:14ef $c9

call_00_14f0:
    ldh  A, [rSCX]                                     ;; 00:14f0 $f0 $43
    sub  A, $08                                        ;; 00:14f2 $d6 $08
    ld   D, A                                          ;; 00:14f4 $57
    ldh  A, [rSCY]                                     ;; 00:14f5 $f0 $42
    call call_00_13ce                                  ;; 00:14f7 $cd $ce $13
    ld   A, [wCCC8]                                    ;; 00:14fa $fa $c8 $cc
    sub  A, $04                                        ;; 00:14fd $d6 $04
    ld   E, A                                          ;; 00:14ff $5f
    ld   A, [wCCC9]                                    ;; 00:1500 $fa $c9 $cc
    sub  A, $05                                        ;; 00:1503 $d6 $05
    ld   D, A                                          ;; 00:1505 $57
    ld   C, $09                                        ;; 00:1506 $0e $09
    call call_00_017a                                  ;; 00:1508 $cd $7a $01
.jr_00_150b:
    push DE                                            ;; 00:150b $d5
    push HL                                            ;; 00:150c $e5
    ld   B, $0b                                        ;; 00:150d $06 $0b
.jr_00_150f:
    push DE                                            ;; 00:150f $d5
    call call_00_13b0                                  ;; 00:1510 $cd $b0 $13
    add  A, A                                          ;; 00:1513 $87
    add  A, A                                          ;; 00:1514 $87
    add  A, $80                                        ;; 00:1515 $c6 $80
    ld   [HL+], A                                      ;; 00:1517 $22
    inc  A                                             ;; 00:1518 $3c
    ld   [HL-], A                                      ;; 00:1519 $32
    set  5, L                                          ;; 00:151a $cb $ed
    inc  A                                             ;; 00:151c $3c
    ld   [HL+], A                                      ;; 00:151d $22
    inc  A                                             ;; 00:151e $3c
    ld   [HL], A                                       ;; 00:151f $77
    res  5, L                                          ;; 00:1520 $cb $ad
    inc  L                                             ;; 00:1522 $2c
    res  5, L                                          ;; 00:1523 $cb $ad
    pop  DE                                            ;; 00:1525 $d1
    inc  D                                             ;; 00:1526 $14
    dec  B                                             ;; 00:1527 $05
    jr   NZ, .jr_00_150f                               ;; 00:1528 $20 $e5
    pop  HL                                            ;; 00:152a $e1
    ld   A, $40                                        ;; 00:152b $3e $40
    rst  add_hl_a                                      ;; 00:152d $c7
    res  2, H                                          ;; 00:152e $cb $94
    pop  DE                                            ;; 00:1530 $d1
    inc  E                                             ;; 00:1531 $1c
    dec  C                                             ;; 00:1532 $0d
    jr   NZ, .jr_00_150b                               ;; 00:1533 $20 $d6
    jp   call_00_017d                                  ;; 00:1535 $c3 $7d $01
    db   $01, $02, $04, $08                            ;; 00:1538 ????

call_00_153c:
    ld   A, $03                                        ;; 00:153c $3e $03
    rst  switchBank                                    ;; 00:153e $ef
    push HL                                            ;; 00:153f $e5
    ld   HL, wD000                                     ;; 00:1540 $21 $00 $d0
    ld   DE, $f80                                      ;; 00:1543 $11 $80 $0f
.jr_00_1546:
    ld   A, $1e                                        ;; 00:1546 $3e $1e
    ld   [HL+], A                                      ;; 00:1548 $22
    dec  DE                                            ;; 00:1549 $1b
    ld   A, E                                          ;; 00:154a $7b
    or   A, D                                          ;; 00:154b $b2
    jr   NZ, .jr_00_1546                               ;; 00:154c $20 $f8
    pop  HL                                            ;; 00:154e $e1
.jp_00_154f:
    ld   A, $c0                                        ;; 00:154f $3e $c0
    and  A, [HL]                                       ;; 00:1551 $a6
    or   A, A                                          ;; 00:1552 $b7
    jr   Z, .jr_00_1571                                ;; 00:1553 $28 $1c
    cp   A, $40                                        ;; 00:1555 $fe $40
    jp   Z, .jp_00_157e                                ;; 00:1557 $ca $7e $15
    cp   A, $80                                        ;; 00:155a $fe $80
    jp   Z, .jp_00_1560                                ;; 00:155c $ca $60 $15
    ret                                                ;; 00:155f $c9
.jp_00_1560:
    ld   A, $3f                                        ;; 00:1560 $3e $3f
    and  A, [HL]                                       ;; 00:1562 $a6
    ldh  [hFFC0], A                                    ;; 00:1563 $e0 $c0
    inc  HL                                            ;; 00:1565 $23
    call call_00_16ca                                  ;; 00:1566 $cd $ca $16
    call call_00_16b1                                  ;; 00:1569 $cd $b1 $16
    call call_00_169a                                  ;; 00:156c $cd $9a $16
    jr   .jp_00_154f                                   ;; 00:156f $18 $de
.jr_00_1571:
    ld   A, $3f                                        ;; 00:1571 $3e $3f
    and  A, [HL]                                       ;; 00:1573 $a6
    ld   E, A                                          ;; 00:1574 $5f
    inc  HL                                            ;; 00:1575 $23
    call call_00_16ca                                  ;; 00:1576 $cd $ca $16
    ld   A, E                                          ;; 00:1579 $7b
    ld   [BC], A                                       ;; 00:157a $02
    inc  HL                                            ;; 00:157b $23
    jr   .jp_00_154f                                   ;; 00:157c $18 $d1
.jp_00_157e:
    ld   A, $3f                                        ;; 00:157e $3e $3f
    and  A, [HL]                                       ;; 00:1580 $a6
    ldh  [hFFC0], A                                    ;; 00:1581 $e0 $c0
    inc  HL                                            ;; 00:1583 $23
    call call_00_16ca                                  ;; 00:1584 $cd $ca $16
    ld   A, C                                          ;; 00:1587 $79
    ldh  [hFFC2], A                                    ;; 00:1588 $e0 $c2
    ld   A, B                                          ;; 00:158a $78
    ldh  [hFFC3], A                                    ;; 00:158b $e0 $c3
    call call_00_16b1                                  ;; 00:158d $cd $b1 $16
    ld   A, E                                          ;; 00:1590 $7b
    ldh  [hFFC4], A                                    ;; 00:1591 $e0 $c4
    ld   A, D                                          ;; 00:1593 $7a
    ldh  [hFFC5], A                                    ;; 00:1594 $e0 $c5
    ld   A, $c0                                        ;; 00:1596 $3e $c0
    and  A, [HL]                                       ;; 00:1598 $a6
    or   A, A                                          ;; 00:1599 $b7
    jr   Z, .jr_00_15cf                                ;; 00:159a $28 $33
    cp   A, $40                                        ;; 00:159c $fe $40
    jp   Z, .jp_00_15c0                                ;; 00:159e $ca $c0 $15
    cp   A, $80                                        ;; 00:15a1 $fe $80
    jr   Z, .jr_00_15b4                                ;; 00:15a3 $28 $0f
    ld   A, $3f                                        ;; 00:15a5 $3e $3f
    and  A, [HL]                                       ;; 00:15a7 $a6
    ldh  [hFFC1], A                                    ;; 00:15a8 $e0 $c1
    inc  HL                                            ;; 00:15aa $23
    call call_00_167f                                  ;; 00:15ab $cd $7f $16
    call call_00_163b                                  ;; 00:15ae $cd $3b $16
    jp   .jp_00_154f                                   ;; 00:15b1 $c3 $4f $15
.jr_00_15b4:
    ld   A, $3f                                        ;; 00:15b4 $3e $3f
    and  A, [HL]                                       ;; 00:15b6 $a6
    ldh  [hFFC1], A                                    ;; 00:15b7 $e0 $c1
    inc  HL                                            ;; 00:15b9 $23
    call call_00_167f                                  ;; 00:15ba $cd $7f $16
    jp   .jp_00_154f                                   ;; 00:15bd $c3 $4f $15
.jp_00_15c0:
    ld   A, $3f                                        ;; 00:15c0 $3e $3f
    and  A, [HL]                                       ;; 00:15c2 $a6
    ldh  [hFFC1], A                                    ;; 00:15c3 $e0 $c1
    inc  HL                                            ;; 00:15c5 $23
    call call_00_15db                                  ;; 00:15c6 $cd $db $15
    call call_00_163b                                  ;; 00:15c9 $cd $3b $16
    jp   .jp_00_154f                                   ;; 00:15cc $c3 $4f $15
.jr_00_15cf:
    ld   A, $3f                                        ;; 00:15cf $3e $3f
    and  A, [HL]                                       ;; 00:15d1 $a6
    ldh  [hFFC1], A                                    ;; 00:15d2 $e0 $c1
    inc  HL                                            ;; 00:15d4 $23
    call call_00_15db                                  ;; 00:15d5 $cd $db $15
    jp   .jp_00_154f                                   ;; 00:15d8 $c3 $4f $15

call_00_15db:
    push HL                                            ;; 00:15db $e5
    ld   L, C                                          ;; 00:15dc $69
    ld   H, B                                          ;; 00:15dd $60
    ld   C, $c1                                        ;; 00:15de $0e $c1
    push DE                                            ;; 00:15e0 $d5
    push HL                                            ;; 00:15e1 $e5
    call call_00_1631                                  ;; 00:15e2 $cd $31 $16
    pop  HL                                            ;; 00:15e5 $e1
    pop  DE                                            ;; 00:15e6 $d1
    push HL                                            ;; 00:15e7 $e5
    push DE                                            ;; 00:15e8 $d5
    ld   D, E                                          ;; 00:15e9 $53
    dec  D                                             ;; 00:15ea $15
    ld   E, $00                                        ;; 00:15eb $1e $00
    srl  D                                             ;; 00:15ed $cb $3a
    rr   E                                             ;; 00:15ef $cb $1b
    srl  D                                             ;; 00:15f1 $cb $3a
    rr   E                                             ;; 00:15f3 $cb $1b
    add  HL, DE                                        ;; 00:15f5 $19
    pop  DE                                            ;; 00:15f6 $d1
    push DE                                            ;; 00:15f7 $d5
    ld   A, $01                                        ;; 00:15f8 $3e $01
    xor  A, E                                          ;; 00:15fa $ab
    xor  A, $01                                        ;; 00:15fb $ee $01
    and  A, $01                                        ;; 00:15fd $e6 $01
    or   A, $c0                                        ;; 00:15ff $f6 $c0
    ld   C, A                                          ;; 00:1601 $4f
    call call_00_1631                                  ;; 00:1602 $cd $31 $16
    pop  DE                                            ;; 00:1605 $d1
    pop  HL                                            ;; 00:1606 $e1
    ld   C, $c1                                        ;; 00:1607 $0e $c1
    push DE                                            ;; 00:1609 $d5
    push HL                                            ;; 00:160a $e5
    call call_00_1623                                  ;; 00:160b $cd $23 $16
    ld   A, $01                                        ;; 00:160e $3e $01
    xor  A, D                                          ;; 00:1610 $aa
    xor  A, $01                                        ;; 00:1611 $ee $01
    and  A, $01                                        ;; 00:1613 $e6 $01
    or   A, $c0                                        ;; 00:1615 $f6 $c0
    ld   C, A                                          ;; 00:1617 $4f
    pop  HL                                            ;; 00:1618 $e1
    ld   A, D                                          ;; 00:1619 $7a
    dec  A                                             ;; 00:161a $3d
    add  A, L                                          ;; 00:161b $85
    ld   L, A                                          ;; 00:161c $6f
    pop  DE                                            ;; 00:161d $d1
    call call_00_1623                                  ;; 00:161e $cd $23 $16
    pop  HL                                            ;; 00:1621 $e1
    ret                                                ;; 00:1622 $c9

call_00_1623:
    ldh  A, [C]                                        ;; 00:1623 $f2
    ld   [HL], A                                       ;; 00:1624 $77
    ld   A, C                                          ;; 00:1625 $79
    ld   BC, $40                                       ;; 00:1626 $01 $40 $00
    add  HL, BC                                        ;; 00:1629 $09
    xor  A, $01                                        ;; 00:162a $ee $01
    ld   C, A                                          ;; 00:162c $4f
    dec  E                                             ;; 00:162d $1d
    jr   NZ, call_00_1623                              ;; 00:162e $20 $f3
    ret                                                ;; 00:1630 $c9

call_00_1631:
    ldh  A, [C]                                        ;; 00:1631 $f2
    ld   [HL+], A                                      ;; 00:1632 $22
    ld   A, C                                          ;; 00:1633 $79
    xor  A, $01                                        ;; 00:1634 $ee $01
    ld   C, A                                          ;; 00:1636 $4f
    dec  D                                             ;; 00:1637 $15
    jr   NZ, call_00_1631                              ;; 00:1638 $20 $f7
    ret                                                ;; 00:163a $c9

call_00_163b:
    push HL                                            ;; 00:163b $e5
    ldh  A, [hFFC2]                                    ;; 00:163c $f0 $c2
    ld   L, A                                          ;; 00:163e $6f
    ldh  A, [hFFC3]                                    ;; 00:163f $f0 $c3
    ld   H, A                                          ;; 00:1641 $67
    ldh  A, [hFFC0]                                    ;; 00:1642 $f0 $c0
    ld   D, A                                          ;; 00:1644 $57
    inc  D                                             ;; 00:1645 $14
    ld   [HL], D                                       ;; 00:1646 $72
    ldh  A, [hFFC5]                                    ;; 00:1647 $f0 $c5
    dec  A                                             ;; 00:1649 $3d
    jr   Z, .jr_00_1668                                ;; 00:164a $28 $1c
    add  A, L                                          ;; 00:164c $85
    ld   L, A                                          ;; 00:164d $6f
    inc  D                                             ;; 00:164e $14
    ld   [HL], D                                       ;; 00:164f $72
    ldh  A, [hFFC4]                                    ;; 00:1650 $f0 $c4
    dec  A                                             ;; 00:1652 $3d
    jr   NZ, .jr_00_1657                               ;; 00:1653 $20 $02
    pop  HL                                            ;; 00:1655 $e1
    ret                                                ;; 00:1656 $c9
.jr_00_1657:
    call call_00_166f                                  ;; 00:1657 $cd $6f $16
    inc  D                                             ;; 00:165a $14
    inc  D                                             ;; 00:165b $14
    ld   [HL], D                                       ;; 00:165c $72
    ldh  A, [hFFC5]                                    ;; 00:165d $f0 $c5
    dec  A                                             ;; 00:165f $3d
    ld   E, A                                          ;; 00:1660 $5f
    ld   A, L                                          ;; 00:1661 $7d
    sub  A, E                                          ;; 00:1662 $93
    ld   L, A                                          ;; 00:1663 $6f
    dec  D                                             ;; 00:1664 $15
    ld   [HL], D                                       ;; 00:1665 $72
    pop  HL                                            ;; 00:1666 $e1
    ret                                                ;; 00:1667 $c9
.jr_00_1668:
    call call_00_166f                                  ;; 00:1668 $cd $6f $16
    inc  D                                             ;; 00:166b $14
    ld   [HL], D                                       ;; 00:166c $72
    pop  HL                                            ;; 00:166d $e1
    ret                                                ;; 00:166e $c9

call_00_166f:
    ld   C, $00                                        ;; 00:166f $0e $00
    ldh  A, [hFFC4]                                    ;; 00:1671 $f0 $c4
    dec  A                                             ;; 00:1673 $3d
    rr   A                                             ;; 00:1674 $cb $1f
    rr   C                                             ;; 00:1676 $cb $19
    rr   A                                             ;; 00:1678 $cb $1f
    rr   C                                             ;; 00:167a $cb $19
    ld   B, A                                          ;; 00:167c $47
    add  HL, BC                                        ;; 00:167d $09
    ret                                                ;; 00:167e $c9

call_00_167f:
    push HL                                            ;; 00:167f $e5
    ld   L, C                                          ;; 00:1680 $69
    ld   H, B                                          ;; 00:1681 $60
    ld   C, $c0                                        ;; 00:1682 $0e $c0
.jr_00_1684:
    push DE                                            ;; 00:1684 $d5
    push BC                                            ;; 00:1685 $c5
    push HL                                            ;; 00:1686 $e5
    call call_00_1631                                  ;; 00:1687 $cd $31 $16
    pop  HL                                            ;; 00:168a $e1
    pop  BC                                            ;; 00:168b $c1
    ld   A, C                                          ;; 00:168c $79
    ld   BC, $40                                       ;; 00:168d $01 $40 $00
    add  HL, BC                                        ;; 00:1690 $09
    xor  A, $01                                        ;; 00:1691 $ee $01
    ld   C, A                                          ;; 00:1693 $4f
    pop  DE                                            ;; 00:1694 $d1
    dec  E                                             ;; 00:1695 $1d
    jr   NZ, .jr_00_1684                               ;; 00:1696 $20 $ec
    pop  HL                                            ;; 00:1698 $e1
    ret                                                ;; 00:1699 $c9

call_00_169a:
    push HL                                            ;; 00:169a $e5
    ld   L, C                                          ;; 00:169b $69
    ld   H, B                                          ;; 00:169c $60
    ldh  A, [hFFC0]                                    ;; 00:169d $f0 $c0
.jr_00_169f:
    push DE                                            ;; 00:169f $d5
    push HL                                            ;; 00:16a0 $e5
.jr_00_16a1:
    ld   [HL+], A                                      ;; 00:16a1 $22
    inc  A                                             ;; 00:16a2 $3c
    dec  D                                             ;; 00:16a3 $15
    jr   NZ, .jr_00_16a1                               ;; 00:16a4 $20 $fb
    pop  HL                                            ;; 00:16a6 $e1
    ld   DE, $40                                       ;; 00:16a7 $11 $40 $00
    add  HL, DE                                        ;; 00:16aa $19
    pop  DE                                            ;; 00:16ab $d1
    dec  E                                             ;; 00:16ac $1d
    jr   NZ, .jr_00_169f                               ;; 00:16ad $20 $f0
    pop  HL                                            ;; 00:16af $e1
    ret                                                ;; 00:16b0 $c9

call_00_16b1:
    ld   A, [HL+]                                      ;; 00:16b1 $2a
    and  A, $0f                                        ;; 00:16b2 $e6 $0f
    ld   E, A                                          ;; 00:16b4 $5f
    ld   A, [HL+]                                      ;; 00:16b5 $2a
    ld   D, A                                          ;; 00:16b6 $57
    rl   D                                             ;; 00:16b7 $cb $12
    rl   E                                             ;; 00:16b9 $cb $13
    rl   D                                             ;; 00:16bb $cb $12
    rl   E                                             ;; 00:16bd $cb $13
    and  A, $3f                                        ;; 00:16bf $e6 $3f
    jr   NZ, .jr_00_16c4                               ;; 00:16c1 $20 $01
    inc  A                                             ;; 00:16c3 $3c
.jr_00_16c4:
    ld   D, A                                          ;; 00:16c4 $57
    ld   A, E                                          ;; 00:16c5 $7b
    or   A, A                                          ;; 00:16c6 $b7
    ret  NZ                                            ;; 00:16c7 $c0
    inc  E                                             ;; 00:16c8 $1c
    ret                                                ;; 00:16c9 $c9

call_00_16ca:
    ld   A, [HL+]                                      ;; 00:16ca $2a
    ld   C, [HL]                                       ;; 00:16cb $4e
    srl  A                                             ;; 00:16cc $cb $3f
    rr   C                                             ;; 00:16ce $cb $19
    srl  A                                             ;; 00:16d0 $cb $3f
    rr   C                                             ;; 00:16d2 $cb $19
    srl  A                                             ;; 00:16d4 $cb $3f
    rr   C                                             ;; 00:16d6 $cb $19
    srl  A                                             ;; 00:16d8 $cb $3f
    rr   C                                             ;; 00:16da $cb $19
    add  A, $d0                                        ;; 00:16dc $c6 $d0
    ld   B, A                                          ;; 00:16de $47
    ret                                                ;; 00:16df $c9

call_00_16e0:
    ld   A, [wC3AB]                                    ;; 00:16e0 $fa $ab $c3
    or   A, A                                          ;; 00:16e3 $b7
    ret  Z                                             ;; 00:16e4 $c8
    ldh  A, [hCurrentBank]                             ;; 00:16e5 $f0 $8b
    ld   [wC5D0], A                                    ;; 00:16e7 $ea $d0 $c5
    xor  A, A                                          ;; 00:16ea $af
    ld   [wC5B1], A                                    ;; 00:16eb $ea $b1 $c5
    ld   A, [wC3A9]                                    ;; 00:16ee $fa $a9 $c3
    and  A, $0f                                        ;; 00:16f1 $e6 $0f
    sub  A, $03                                        ;; 00:16f3 $d6 $03
    jp   C, jp_00_1b35                                 ;; 00:16f5 $da $35 $1b
    jp   Z, jp_00_1996                                 ;; 00:16f8 $ca $96 $19
    dec  A                                             ;; 00:16fb $3d
    jp   Z, jp_00_1992                                 ;; 00:16fc $ca $92 $19
    sub  A, $03                                        ;; 00:16ff $d6 $03
    jp   C, jp_00_1af8                                 ;; 00:1701 $da $f8 $1a
    jp   Z, jp_00_1ac7                                 ;; 00:1704 $ca $c7 $1a
    dec  A                                             ;; 00:1707 $3d
    jp   Z, jp_00_1bbe                                 ;; 00:1708 $ca $be $1b
    dec  A                                             ;; 00:170b $3d
    jr   Z, .jr_00_1752                                ;; 00:170c $28 $44
    dec  A                                             ;; 00:170e $3d
    jp   Z, jp_00_1a2e                                 ;; 00:170f $ca $2e $1a
    dec  A                                             ;; 00:1712 $3d
    jp   Z, jp_00_1b7c                                 ;; 00:1713 $ca $7c $1b
    dec  A                                             ;; 00:1716 $3d
    jp   Z, jp_00_17f0                                 ;; 00:1717 $ca $f0 $17
    dec  A                                             ;; 00:171a $3d
    jp   Z, jp_00_1ae6                                 ;; 00:171b $ca $e6 $1a
    dec  A                                             ;; 00:171e $3d
    jp   Z, jp_00_18ae                                 ;; 00:171f $ca $ae $18
    dec  A                                             ;; 00:1722 $3d
    jp   NZ, jp_00_1ab8                                ;; 00:1723 $c2 $b8 $1a
    ld   A, [wC3AA]                                    ;; 00:1726 $fa $aa $c3
    or   A, A                                          ;; 00:1729 $b7
    jr   Z, call_00_1779                               ;; 00:172a $28 $4d
    dec  A                                             ;; 00:172c $3d
    jr   Z, call_00_1793                               ;; 00:172d $28 $64
    dec  A                                             ;; 00:172f $3d
    jp   Z, jp_00_1ab8                                 ;; 00:1730 $ca $b8 $1a
    dec  A                                             ;; 00:1733 $3d
    jr   Z, .jr_00_176b                                ;; 00:1734 $28 $35
    dec  A                                             ;; 00:1736 $3d
    jr   Z, .jr_00_174b                                ;; 00:1737 $28 $12
    dec  A                                             ;; 00:1739 $3d
    jr   Z, .jr_00_1743                                ;; 00:173a $28 $07
    dec  A                                             ;; 00:173c $3d
    jp   NZ, jp_00_1ab8                                ;; 00:173d $c2 $b8 $1a
.jr_00_1740:
    rst  rst_00_0010                                   ;; 00:1740 $d7
    jr   .jr_00_1740                                   ;; 00:1741 $18 $fd
.jr_00_1743:
    ld   A, $0a                                        ;; 00:1743 $3e $0a
    ld   [wCCCA], A                                    ;; 00:1745 $ea $ca $cc
    jp   jp_00_1ab8                                    ;; 00:1748 $c3 $b8 $1a
.jr_00_174b:
    xor  A, A                                          ;; 00:174b $af
    ld   [wC5BA], A                                    ;; 00:174c $ea $ba $c5
    jp   jp_00_1ab8                                    ;; 00:174f $c3 $b8 $1a
.jr_00_1752:
    call call_00_1b4f                                  ;; 00:1752 $cd $4f $1b
    or   A, A                                          ;; 00:1755 $b7
    jr   Z, .jr_00_175f                                ;; 00:1756 $28 $07
    ld   A, [wC5CA]                                    ;; 00:1758 $fa $ca $c5
    or   A, A                                          ;; 00:175b $b7
    call NZ, call_00_3584                              ;; 00:175c $c4 $84 $35
.jr_00_175f:
    ld   A, [wC3AA]                                    ;; 00:175f $fa $aa $c3
    ld   L, A                                          ;; 00:1762 $6f
    ld   H, $00                                        ;; 00:1763 $26 $00
    call call_00_346f                                  ;; 00:1765 $cd $6f $34
    jp   jp_00_1ab8                                    ;; 00:1768 $c3 $b8 $1a
.jr_00_176b:
    ld   A, $1d                                        ;; 00:176b $3e $1d
    ld   [wD947], A                                    ;; 00:176d $ea $47 $d9
    ld   [wD987], A                                    ;; 00:1770 $ea $87 $d9
    call call_00_14f0                                  ;; 00:1773 $cd $f0 $14
    jp   jp_00_1ab8                                    ;; 00:1776 $c3 $b8 $1a

call_00_1779:
    ld   A, $04                                        ;; 00:1779 $3e $04
.jr_00_177b:
    push AF                                            ;; 00:177b $f5
    call call_00_3dcf                                  ;; 00:177c $cd $cf $3d
    ld   B, $05                                        ;; 00:177f $06 $05
    call call_00_31ba                                  ;; 00:1781 $cd $ba $31
    call call_00_3de0                                  ;; 00:1784 $cd $e0 $3d
    ld   B, $02                                        ;; 00:1787 $06 $02
    call call_00_31ba                                  ;; 00:1789 $cd $ba $31
    pop  AF                                            ;; 00:178c $f1
    dec  A                                             ;; 00:178d $3d
    jr   NZ, .jr_00_177b                               ;; 00:178e $20 $eb
    jp   jp_00_1ab8                                    ;; 00:1790 $c3 $b8 $1a

call_00_1793:
    ldh  A, [rSCX]                                     ;; 00:1793 $f0 $43
    ldh  [hFFCE], A                                    ;; 00:1795 $e0 $ce
    ldh  A, [rSCY]                                     ;; 00:1797 $f0 $42
    ldh  [hFFCF], A                                    ;; 00:1799 $e0 $cf
    ld   HL, $17e7                                     ;; 00:179b $21 $e7 $17
.jr_00_179e:
    ld   A, [HL+]                                      ;; 00:179e $2a
    or   A, A                                          ;; 00:179f $b7
    jp   Z, .jp_00_17d0                                ;; 00:17a0 $ca $d0 $17
    push HL                                            ;; 00:17a3 $e5
    push AF                                            ;; 00:17a4 $f5
    xor  A, A                                          ;; 00:17a5 $af
    ld   E, $01                                        ;; 00:17a6 $1e $01
    call call_00_016b                                  ;; 00:17a8 $cd $6b $01
    ld   E, A                                          ;; 00:17ab $5f
    pop  AF                                            ;; 00:17ac $f1
    dec  E                                             ;; 00:17ad $1d
    jr   Z, .jr_00_17b2                                ;; 00:17ae $28 $02
    cpl                                                ;; 00:17b0 $2f
    inc  L                                             ;; 00:17b1 $2c
.jr_00_17b2:
    ld   C, A                                          ;; 00:17b2 $4f
    push AF                                            ;; 00:17b3 $f5
    xor  A, A                                          ;; 00:17b4 $af
    ld   E, $01                                        ;; 00:17b5 $1e $01
    call call_00_016b                                  ;; 00:17b7 $cd $6b $01
    ld   E, A                                          ;; 00:17ba $5f
    pop  AF                                            ;; 00:17bb $f1
    dec  E                                             ;; 00:17bc $1d
    jr   Z, .jr_00_17c1                                ;; 00:17bd $28 $02
    cpl                                                ;; 00:17bf $2f
    inc  L                                             ;; 00:17c0 $2c
.jr_00_17c1:
    ld   B, A                                          ;; 00:17c1 $47
    call call_00_17db                                  ;; 00:17c2 $cd $db $17
    call call_00_17e1                                  ;; 00:17c5 $cd $e1 $17
    ld   B, $03                                        ;; 00:17c8 $06 $03
    call call_00_31ba                                  ;; 00:17ca $cd $ba $31
    pop  HL                                            ;; 00:17cd $e1
    jr   .jr_00_179e                                   ;; 00:17ce $18 $ce
.jp_00_17d0:
    ldh  A, [hFFCE]                                    ;; 00:17d0 $f0 $ce
    ldh  [rSCX], A                                     ;; 00:17d2 $e0 $43
    ldh  A, [hFFCF]                                    ;; 00:17d4 $f0 $cf
    ldh  [rSCY], A                                     ;; 00:17d6 $e0 $42
    jp   jp_00_1ab8                                    ;; 00:17d8 $c3 $b8 $1a

call_00_17db:
    ldh  A, [hFFCF]                                    ;; 00:17db $f0 $cf
    add  A, C                                          ;; 00:17dd $81
    ldh  [rSCY], A                                     ;; 00:17de $e0 $42
    ret                                                ;; 00:17e0 $c9

call_00_17e1:
    ldh  A, [hFFCE]                                    ;; 00:17e1 $f0 $ce
    add  A, B                                          ;; 00:17e3 $80
    ldh  [rSCX], A                                     ;; 00:17e4 $e0 $43
    ret                                                ;; 00:17e6 $c9
    db   $02, $04, $08, $0c, $04, $0c, $06, $04        ;; 00:17e7 ????????
    db   $00                                           ;; 00:17ef ?

jp_00_17f0:
    ld   A, [wC3AA]                                    ;; 00:17f0 $fa $aa $c3
    and  A, $c0                                        ;; 00:17f3 $e6 $c0
    jr   Z, .jr_00_1820                                ;; 00:17f5 $28 $29
    ld   A, [wCCC8]                                    ;; 00:17f7 $fa $c8 $cc
    ld   E, A                                          ;; 00:17fa $5f
    ld   A, [wCCC9]                                    ;; 00:17fb $fa $c9 $cc
    ld   D, A                                          ;; 00:17fe $57
    call call_00_13b0                                  ;; 00:17ff $cd $b0 $13
    ld   A, [wC3AA]                                    ;; 00:1802 $fa $aa $c3
    ld   C, A                                          ;; 00:1805 $4f
    and  A, $1f                                        ;; 00:1806 $e6 $1f
    ld   [DE], A                                       ;; 00:1808 $12
    ld   A, C                                          ;; 00:1809 $79
    rlca                                               ;; 00:180a $07
    rlca                                               ;; 00:180b $07
    and  A, $03                                        ;; 00:180c $e6 $03
    ld   [wCCC1], A                                    ;; 00:180e $ea $c1 $cc
    call call_00_23ef                                  ;; 00:1811 $cd $ef $23
    call call_00_14f0                                  ;; 00:1814 $cd $f0 $14
    call call_00_2554                                  ;; 00:1817 $cd $54 $25
    call call_00_1f81                                  ;; 00:181a $cd $81 $1f
    jp   jp_00_1ab8                                    ;; 00:181d $c3 $b8 $1a
.jr_00_1820:
    call call_00_3b68                                  ;; 00:1820 $cd $68 $3b
    push DE                                            ;; 00:1823 $d5
    call call_00_1f67                                  ;; 00:1824 $cd $67 $1f
    pop  DE                                            ;; 00:1827 $d1
    jp   NZ, jp_00_1ab8                                ;; 00:1828 $c2 $b8 $1a
    ld   A, E                                          ;; 00:182b $7b
    cp   A, $3e                                        ;; 00:182c $fe $3e
    jp   NC, jp_00_1ab8                                ;; 00:182e $d2 $b8 $1a
    ld   A, D                                          ;; 00:1831 $7a
    cp   A, $40                                        ;; 00:1832 $fe $40
    jp   NC, jp_00_1ab8                                ;; 00:1834 $d2 $b8 $1a
    call call_00_13b0                                  ;; 00:1837 $cd $b0 $13
    call call_00_13f0                                  ;; 00:183a $cd $f0 $13
    ld   A, E                                          ;; 00:183d $7b
    and  A, $e0                                        ;; 00:183e $e6 $e0
    jp   NZ, jp_00_1ab8                                ;; 00:1840 $c2 $b8 $1a
    ld   A, D                                          ;; 00:1843 $7a
    and  A, $01                                        ;; 00:1844 $e6 $01
    jp   NZ, jp_00_1ab8                                ;; 00:1846 $c2 $b8 $1a
    ld   A, [wCCC1]                                    ;; 00:1849 $fa $c1 $cc
    dec  A                                             ;; 00:184c $3d
    add  A, A                                          ;; 00:184d $87
    add  A, A                                          ;; 00:184e $87
    add  A, $99                                        ;; 00:184f $c6 $99
    ld   L, A                                          ;; 00:1851 $6f
    ld   H, $cc                                        ;; 00:1852 $26 $cc
    ld   DE, wCCC7                                     ;; 00:1854 $11 $c7 $cc
    ld   A, [DE]                                       ;; 00:1857 $1a
    ld   [HL+], A                                      ;; 00:1858 $22
    inc  E                                             ;; 00:1859 $1c
    ld   A, [DE]                                       ;; 00:185a $1a
    ld   [HL+], A                                      ;; 00:185b $22
    inc  E                                             ;; 00:185c $1c
    ld   A, [DE]                                       ;; 00:185d $1a
    ld   [HL+], A                                      ;; 00:185e $22
    push HL                                            ;; 00:185f $e5
    ld   HL, wCCC8                                     ;; 00:1860 $21 $c8 $cc
    ld   E, [HL]                                       ;; 00:1863 $5e
    inc  L                                             ;; 00:1864 $2c
    ld   D, [HL]                                       ;; 00:1865 $56
    call call_00_13b0                                  ;; 00:1866 $cd $b0 $13
    pop  HL                                            ;; 00:1869 $e1
    ld   [HL], A                                       ;; 00:186a $77
    ld   A, [wCCC1]                                    ;; 00:186b $fa $c1 $cc
    rrca                                               ;; 00:186e $0f
    rrca                                               ;; 00:186f $0f
    ld   B, A                                          ;; 00:1870 $47
    ld   A, [DE]                                       ;; 00:1871 $1a
    or   A, B                                          ;; 00:1872 $b0
    ld   [wDFBF], A                                    ;; 00:1873 $ea $bf $df
    ld   A, $8c                                        ;; 00:1876 $3e $8c
    ld   [wDFBE], A                                    ;; 00:1878 $ea $be $df
    ld   A, $1f                                        ;; 00:187b $3e $1f
    ld   [DE], A                                       ;; 00:187d $12
    xor  A, A                                          ;; 00:187e $af
    ld   [wCCC1], A                                    ;; 00:187f $ea $c1 $cc
    call call_00_23ef                                  ;; 00:1882 $cd $ef $23
    ld   A, [wC5B7]                                    ;; 00:1885 $fa $b7 $c5
    push AF                                            ;; 00:1888 $f5
    call call_00_14f0                                  ;; 00:1889 $cd $f0 $14
    call call_00_2554                                  ;; 00:188c $cd $54 $25
    call call_00_1f81                                  ;; 00:188f $cd $81 $1f
    pop  AF                                            ;; 00:1892 $f1
    ld   B, $04                                        ;; 00:1893 $06 $04
    ld   HL, $245e                                     ;; 00:1895 $21 $5e $24
    ld   C, $80                                        ;; 00:1898 $0e $80
.jr_00_189a:
    or   A, A                                          ;; 00:189a $b7
    jr   Z, .jr_00_18a5                                ;; 00:189b $28 $08
    inc  HL                                            ;; 00:189d $23
    inc  HL                                            ;; 00:189e $23
    dec  B                                             ;; 00:189f $05
    srl  C                                             ;; 00:18a0 $cb $39
    dec  A                                             ;; 00:18a2 $3d
    jr   .jr_00_189a                                   ;; 00:18a3 $18 $f5
.jr_00_18a5:
    call call_00_20b1                                  ;; 00:18a5 $cd $b1 $20
    call call_00_127d                                  ;; 00:18a8 $cd $7d $12
    jp   jp_00_1ab8                                    ;; 00:18ab $c3 $b8 $1a

jp_00_18ae:
    ld   A, [wC3A9]                                    ;; 00:18ae $fa $a9 $c3
    swap A                                             ;; 00:18b1 $cb $37
    and  A, $0f                                        ;; 00:18b3 $e6 $0f
    ld   C, A                                          ;; 00:18b5 $4f
    cp   A, $0f                                        ;; 00:18b6 $fe $0f
    jp   Z, .jp_00_1938                                ;; 00:18b8 $ca $38 $19
    push BC                                            ;; 00:18bb $c5
    ld   A, [wC5B0]                                    ;; 00:18bc $fa $b0 $c5
    or   A, A                                          ;; 00:18bf $b7
    call NZ, call_00_1988                              ;; 00:18c0 $c4 $88 $19
    pop  BC                                            ;; 00:18c3 $c1
    ld   HL, wC52C                                     ;; 00:18c4 $21 $2c $c5
    ld   B, $08                                        ;; 00:18c7 $06 $08
.jr_00_18c9:
    ld   A, [HL]                                       ;; 00:18c9 $7e
    cp   A, C                                          ;; 00:18ca $b9
    jr   Z, .jr_00_18d5                                ;; 00:18cb $28 $08
    ld   A, L                                          ;; 00:18cd $7d
    add  A, $06                                        ;; 00:18ce $c6 $06
    ld   L, A                                          ;; 00:18d0 $6f
    dec  B                                             ;; 00:18d1 $05
    jr   NZ, .jr_00_18c9                               ;; 00:18d2 $20 $f5
    ret                                                ;; 00:18d4 $c9
.jr_00_18d5:
    ld   A, L                                          ;; 00:18d5 $7d
    ld   [wC5AC], A                                    ;; 00:18d6 $ea $ac $c5
    push HL                                            ;; 00:18d9 $e5
    ld   A, [wC3AA]                                    ;; 00:18da $fa $aa $c3
    rlca                                               ;; 00:18dd $07
    rlca                                               ;; 00:18de $07
    and  A, $03                                        ;; 00:18df $e6 $03
    ld   HL, $1c34                                     ;; 00:18e1 $21 $34 $1c
    rst  add_hl_a                                      ;; 00:18e4 $c7
    ld   C, [HL]                                       ;; 00:18e5 $4e
    pop  HL                                            ;; 00:18e6 $e1
    ld   A, [wC3AA]                                    ;; 00:18e7 $fa $aa $c3
    and  A, $0f                                        ;; 00:18ea $e6 $0f
    jr   Z, .jr_00_190d                                ;; 00:18ec $28 $1f
.jr_00_18ee:
    push AF                                            ;; 00:18ee $f5
    push HL                                            ;; 00:18ef $e5
    push BC                                            ;; 00:18f0 $c5
    ld   A, [HL]                                       ;; 00:18f1 $7e
    ld   E, A                                          ;; 00:18f2 $5f
    add  A, A                                          ;; 00:18f3 $87
    add  A, A                                          ;; 00:18f4 $87
    add  A, E                                          ;; 00:18f5 $83
    ld   HL, wC55C                                     ;; 00:18f6 $21 $5c $c5
    rst  add_hl_a                                      ;; 00:18f9 $c7
    ld   E, [HL]                                       ;; 00:18fa $5e
    inc  L                                             ;; 00:18fb $2c
    ld   D, [HL]                                       ;; 00:18fc $56
    ld   A, C                                          ;; 00:18fd $79
    call call_00_1e72                                  ;; 00:18fe $cd $72 $1e
    call call_00_1988                                  ;; 00:1901 $cd $88 $19
    pop  BC                                            ;; 00:1904 $c1
    pop  HL                                            ;; 00:1905 $e1
    pop  AF                                            ;; 00:1906 $f1
    dec  A                                             ;; 00:1907 $3d
    jr   NZ, .jr_00_18ee                               ;; 00:1908 $20 $e4
    jp   jp_00_1ab8                                    ;; 00:190a $c3 $b8 $1a
.jr_00_190d:
    ld   A, [wC3AA]                                    ;; 00:190d $fa $aa $c3
    rlca                                               ;; 00:1910 $07
    rlca                                               ;; 00:1911 $07
    and  A, $03                                        ;; 00:1912 $e6 $03
    push HL                                            ;; 00:1914 $e5
    ld   HL, $1c34                                     ;; 00:1915 $21 $34 $1c
    rst  add_hl_a                                      ;; 00:1918 $c7
    ld   E, [HL]                                       ;; 00:1919 $5e
    pop  HL                                            ;; 00:191a $e1
    ld   A, [HL]                                       ;; 00:191b $7e
    ld   C, A                                          ;; 00:191c $4f
    add  A, A                                          ;; 00:191d $87
    add  A, A                                          ;; 00:191e $87
    add  A, C                                          ;; 00:191f $81
    ld   HL, wC560                                     ;; 00:1920 $21 $60 $c5
    rst  add_hl_a                                      ;; 00:1923 $c7
    ld   A, [HL]                                       ;; 00:1924 $7e
    swap A                                             ;; 00:1925 $cb $37
    and  A, $fc                                        ;; 00:1927 $e6 $fc
    or   A, E                                          ;; 00:1929 $b3
    swap A                                             ;; 00:192a $cb $37
    ld   [HL], A                                       ;; 00:192c $77
    call call_00_1c80                                  ;; 00:192d $cd $80 $1c
    call call_00_1d26                                  ;; 00:1930 $cd $26 $1d
    rst  rst_00_0010                                   ;; 00:1933 $d7
    rst  rst_00_0018                                   ;; 00:1934 $df
    jp   jp_00_1ab8                                    ;; 00:1935 $c3 $b8 $1a
.jp_00_1938:
    ld   A, [wC3AA]                                    ;; 00:1938 $fa $aa $c3
    ld   B, A                                          ;; 00:193b $47
    and  A, $0f                                        ;; 00:193c $e6 $0f
    jr   Z, .jr_00_1963                                ;; 00:193e $28 $23
    ld   C, A                                          ;; 00:1940 $4f
    ld   A, B                                          ;; 00:1941 $78
    rlca                                               ;; 00:1942 $07
    rlca                                               ;; 00:1943 $07
    and  A, $03                                        ;; 00:1944 $e6 $03
    add  A, A                                          ;; 00:1946 $87
    add  A, A                                          ;; 00:1947 $87
    ld   HL, $1978                                     ;; 00:1948 $21 $78 $19
    rst  add_hl_a                                      ;; 00:194b $c7
.jr_00_194c:
    push BC                                            ;; 00:194c $c5
    push HL                                            ;; 00:194d $e5
    ld   C, [HL]                                       ;; 00:194e $4e
    inc  HL                                            ;; 00:194f $23
    ld   B, [HL]                                       ;; 00:1950 $46
    inc  HL                                            ;; 00:1951 $23
    ld   A, [HL+]                                      ;; 00:1952 $2a
    ld   H, [HL]                                       ;; 00:1953 $66
    ld   L, A                                          ;; 00:1954 $6f
    call call_00_20b1                                  ;; 00:1955 $cd $b1 $20
    call call_00_127d                                  ;; 00:1958 $cd $7d $12
    pop  HL                                            ;; 00:195b $e1
    pop  BC                                            ;; 00:195c $c1
    dec  C                                             ;; 00:195d $0d
    jr   NZ, .jr_00_194c                               ;; 00:195e $20 $ec
    jp   jp_00_1ab8                                    ;; 00:1960 $c3 $b8 $1a
.jr_00_1963:
    ld   A, B                                          ;; 00:1963 $78
    rlca                                               ;; 00:1964 $07
    rlca                                               ;; 00:1965 $07
    and  A, $03                                        ;; 00:1966 $e6 $03
    ld   HL, $1c34                                     ;; 00:1968 $21 $34 $1c
    rst  add_hl_a                                      ;; 00:196b $c7
    ld   A, [HL]                                       ;; 00:196c $7e
    ld   [wC5B7], A                                    ;; 00:196d $ea $b7 $c5
    call call_00_1fc2                                  ;; 00:1970 $cd $c2 $1f
    rst  rst_00_0010                                   ;; 00:1973 $d7
    rst  rst_00_0018                                   ;; 00:1974 $df
    jp   jp_00_1ab8                                    ;; 00:1975 $c3 $b8 $1a
    db   $10, $01, $64, $24, $20, $02, $62, $24        ;; 00:1978 ????????
    db   $80, $04, $5e, $24, $40, $03, $60, $24        ;; 00:1980 ????????

call_00_1988:
    call call_00_1265                                  ;; 00:1988 $cd $65 $12
    ld   A, [wC5B0]                                    ;; 00:198b $fa $b0 $c5
    or   A, A                                          ;; 00:198e $b7
    jr   NZ, call_00_1988                              ;; 00:198f $20 $f7
    ret                                                ;; 00:1991 $c9

jp_00_1992:
    call call_00_300e                                  ;; 00:1992 $cd $0e $30
    ret                                                ;; 00:1995 $c9

jp_00_1996:
    ld   A, [wC3AB]                                    ;; 00:1996 $fa $ab $c3
    call call_00_264b                                  ;; 00:1999 $cd $4b $26
    jp   NZ, jp_00_1ab8                                ;; 00:199c $c2 $b8 $1a
    call call_00_345d                                  ;; 00:199f $cd $5d $34
    ld   BC, wCC7D                                     ;; 00:19a2 $01 $7d $cc
    ld   E, $08                                        ;; 00:19a5 $1e $08
.jr_00_19a7:
    ld   A, [BC]                                       ;; 00:19a7 $0a
    inc  A                                             ;; 00:19a8 $3c
    jr   Z, .jr_00_19bc                                ;; 00:19a9 $28 $11
    inc  C                                             ;; 00:19ab $0c
    inc  C                                             ;; 00:19ac $0c
    dec  E                                             ;; 00:19ad $1d
    jr   NZ, .jr_00_19a7                               ;; 00:19ae $20 $f7
    ld   DE, $1c22                                     ;; 00:19b0 $11 $22 $1c
    call call_00_3485                                  ;; 00:19b3 $cd $85 $34
    call call_00_355a                                  ;; 00:19b6 $cd $5a $35
    jp   jp_00_1ab8                                    ;; 00:19b9 $c3 $b8 $1a
.jr_00_19bc:
    push BC                                            ;; 00:19bc $c5
    ld   A, $17                                        ;; 00:19bd $3e $17
    ld_long_store hFFE4, A                             ;; 00:19bf $ea $e4 $ff
    ld   A, [wC5BD]                                    ;; 00:19c2 $fa $bd $c5
    add  A, $04                                        ;; 00:19c5 $c6 $04
    ld   L, A                                          ;; 00:19c7 $6f
    ld   A, [wC5BE]                                    ;; 00:19c8 $fa $be $c5
    ld   H, A                                          ;; 00:19cb $67
    ld   A, [HL]                                       ;; 00:19cc $7e
    swap A                                             ;; 00:19cd $cb $37
    and  A, $fc                                        ;; 00:19cf $e6 $fc
    or   A, $01                                        ;; 00:19d1 $f6 $01
    swap A                                             ;; 00:19d3 $cb $37
    ld   [HL], A                                       ;; 00:19d5 $77
    call call_00_1c80                                  ;; 00:19d6 $cd $80 $1c
    call call_00_1d26                                  ;; 00:19d9 $cd $26 $1d
    call call_00_3584                                  ;; 00:19dc $cd $84 $35
    rst  rst_00_0010                                   ;; 00:19df $d7
    rst  rst_00_0018                                   ;; 00:19e0 $df
    pop  BC                                            ;; 00:19e1 $c1
    dec  C                                             ;; 00:19e2 $0d
    ld   A, [wC3AA]                                    ;; 00:19e3 $fa $aa $c3
    ld   [BC], A                                       ;; 00:19e6 $02
    inc  C                                             ;; 00:19e7 $0c
    push AF                                            ;; 00:19e8 $f5
    call call_00_2ade                                  ;; 00:19e9 $cd $de $2a
    ld   HL, $07                                       ;; 00:19ec $21 $07 $00
    add  HL, DE                                        ;; 00:19ef $19
    ld   A, [HL]                                       ;; 00:19f0 $7e
    ld   [BC], A                                       ;; 00:19f1 $02
    ld   DE, $1c11                                     ;; 00:19f2 $11 $11 $1c
    call call_00_348b                                  ;; 00:19f5 $cd $8b $34
    pop  AF                                            ;; 00:19f8 $f1
    ld   L, A                                          ;; 00:19f9 $6f
    ld   H, $00                                        ;; 00:19fa $26 $00
    add  HL, HL                                        ;; 00:19fc $29
    add  HL, HL                                        ;; 00:19fd $29
    add  HL, HL                                        ;; 00:19fe $29
    ld   A, $05                                        ;; 00:19ff $3e $05
    rst  switchBank                                    ;; 00:1a01 $ef
    ld   DE, $4640 ;@bank 5                            ;; 00:1a02 $11 $40 $46
    add  HL, DE                                        ;; 00:1a05 $19
    ld   DE, wC700                                     ;; 00:1a06 $11 $00 $c7
    ld   A, $0c                                        ;; 00:1a09 $3e $0c
    ld   [DE], A                                       ;; 00:1a0b $12
    inc  E                                             ;; 00:1a0c $1c
    ld   B, $07                                        ;; 00:1a0d $06 $07
.jr_00_1a0f:
    ld   A, [HL+]                                      ;; 00:1a0f $2a
    ld   [DE], A                                       ;; 00:1a10 $12
    or   A, A                                          ;; 00:1a11 $b7
    jr   Z, .jr_00_1a1a                                ;; 00:1a12 $28 $06
    inc  E                                             ;; 00:1a14 $1c
    dec  B                                             ;; 00:1a15 $05
    jr   NZ, .jr_00_1a0f                               ;; 00:1a16 $20 $f7
    xor  A, A                                          ;; 00:1a18 $af
    ld   [DE], A                                       ;; 00:1a19 $12
.jr_00_1a1a:
    ld   DE, wC700                                     ;; 00:1a1a $11 $00 $c7
    call call_00_3485                                  ;; 00:1a1d $cd $85 $34
    call call_00_355a                                  ;; 00:1a20 $cd $5a $35
    ld   A, [wC3AB]                                    ;; 00:1a23 $fa $ab $c3
    ld   E, $01                                        ;; 00:1a26 $1e $01
    call call_00_2629                                  ;; 00:1a28 $cd $29 $26
    jp   jp_00_1ab8                                    ;; 00:1a2b $c3 $b8 $1a

jp_00_1a2e:
    ld   BC, wCC7D                                     ;; 00:1a2e $01 $7d $cc
    ld   E, $08                                        ;; 00:1a31 $1e $08
.jr_00_1a33:
    ld   A, [BC]                                       ;; 00:1a33 $0a
    inc  A                                             ;; 00:1a34 $3c
    jr   Z, .jr_00_1aa2                                ;; 00:1a35 $28 $6b
    inc  C                                             ;; 00:1a37 $0c
    inc  C                                             ;; 00:1a38 $0c
    dec  E                                             ;; 00:1a39 $1d
    jr   NZ, .jr_00_1a33                               ;; 00:1a3a $20 $f7
    call call_00_345d                                  ;; 00:1a3c $cd $5d $34
    ld   DE, $1c22                                     ;; 00:1a3f $11 $22 $1c
    call call_00_348b                                  ;; 00:1a42 $cd $8b $34
    ld   DE, $1c17                                     ;; 00:1a45 $11 $17 $1c
    call call_00_3485                                  ;; 00:1a48 $cd $85 $34
    call call_00_01a7                                  ;; 00:1a4b $cd $a7 $01
    ld   HL, wC600                                     ;; 00:1a4e $21 $00 $c6
    ld   BC, $a06                                      ;; 00:1a51 $01 $06 $0a
    call call_00_01bf                                  ;; 00:1a54 $cd $bf $01
    ld   HL, wC600                                     ;; 00:1a57 $21 $00 $c6
    ld   DE, $9c08                                     ;; 00:1a5a $11 $08 $9c
    ld   BC, $c08                                      ;; 00:1a5d $01 $08 $0c
    call call_00_0186                                  ;; 00:1a60 $cd $86 $01
    call call_00_01a7                                  ;; 00:1a63 $cd $a7 $01
    ld   HL, wCC7C                                     ;; 00:1a66 $21 $7c $cc
    call call_00_29e7                                  ;; 00:1a69 $cd $e7 $29
.jr_00_1a6c:
    ld   HL, wC600                                     ;; 00:1a6c $21 $00 $c6
    ld   DE, $9c2a                                     ;; 00:1a6f $11 $2a $9c
    ld   BC, $906                                      ;; 00:1a72 $01 $06 $09
    call call_00_0186                                  ;; 00:1a75 $cd $86 $01
    ld   A, $01                                        ;; 00:1a78 $3e $01
    ld   [wC5CB], A                                    ;; 00:1a7a $ea $cb $c5
    ld   HL, $3f8b                                     ;; 00:1a7d $21 $8b $3f
    ld   DE, $9c2a                                     ;; 00:1a80 $11 $2a $9c
    ld   BC, $906                                      ;; 00:1a83 $01 $06 $09
    ld   A, $06                                        ;; 00:1a86 $3e $06
    call call_00_2b2e                                  ;; 00:1a88 $cd $2e $2b
    cp   A, $ff                                        ;; 00:1a8b $fe $ff
    jr   Z, .jr_00_1a6c                                ;; 00:1a8d $28 $dd
    add  A, A                                          ;; 00:1a8f $87
    ld   HL, wCC7D                                     ;; 00:1a90 $21 $7d $cc
    rst  add_hl_a                                      ;; 00:1a93 $c7
    ld   [HL], $ff                                     ;; 00:1a94 $36 $ff
    call call_00_2cb1                                  ;; 00:1a96 $cd $b1 $2c
    call call_00_345d                                  ;; 00:1a99 $cd $5d $34
    xor  A, A                                          ;; 00:1a9c $af
    ld   [wC5CB], A                                    ;; 00:1a9d $ea $cb $c5
    jr   jp_00_1a2e                                    ;; 00:1aa0 $18 $8c
.jr_00_1aa2:
    dec  C                                             ;; 00:1aa2 $0d
    ld   A, [wC3AA]                                    ;; 00:1aa3 $fa $aa $c3
    ld   [BC], A                                       ;; 00:1aa6 $02
    inc  C                                             ;; 00:1aa7 $0c
    push AF                                            ;; 00:1aa8 $f5
    call call_00_2ade                                  ;; 00:1aa9 $cd $de $2a
    ld   HL, $07                                       ;; 00:1aac $21 $07 $00
    add  HL, DE                                        ;; 00:1aaf $19
    ld   A, [HL]                                       ;; 00:1ab0 $7e
    ld   [BC], A                                       ;; 00:1ab1 $02
    pop  AF                                            ;; 00:1ab2 $f1
    call call_00_355a                                  ;; 00:1ab3 $cd $5a $35
    jr   jp_00_1ab8                                    ;; 00:1ab6 $18 $00

jp_00_1ab8:
    xor  A, A                                          ;; 00:1ab8 $af
    ld   [wC5BD], A                                    ;; 00:1ab9 $ea $bd $c5
    ld   [wC5BE], A                                    ;; 00:1abc $ea $be $c5
    ld   [wC3AB], A                                    ;; 00:1abf $ea $ab $c3
    ld   A, [wC5D0]                                    ;; 00:1ac2 $fa $d0 $c5
    rst  switchBank                                    ;; 00:1ac5 $ef
    ret                                                ;; 00:1ac6 $c9

jp_00_1ac7:
    ld   A, [wC3AA]                                    ;; 00:1ac7 $fa $aa $c3
    ld   C, A                                          ;; 00:1aca $4f
    bit  7, A                                          ;; 00:1acb $cb $7f
    jr   NZ, .jr_00_1adf                               ;; 00:1acd $20 $10
    bit  6, A                                          ;; 00:1acf $cb $77
    jr   NZ, .jr_00_1ad8                               ;; 00:1ad1 $20 $05
    ldh  [hFFE0], A                                    ;; 00:1ad3 $e0 $e0
    jp   jp_00_1ab8                                    ;; 00:1ad5 $c3 $b8 $1a
.jr_00_1ad8:
    sub  A, $40                                        ;; 00:1ad8 $d6 $40
    ldh  [hFFE2], A                                    ;; 00:1ada $e0 $e2
    jp   jp_00_1ab8                                    ;; 00:1adc $c3 $b8 $1a
.jr_00_1adf:
    sub  A, $80                                        ;; 00:1adf $d6 $80
    ldh  [hFFE4], A                                    ;; 00:1ae1 $e0 $e4
    jp   jp_00_1ab8                                    ;; 00:1ae3 $c3 $b8 $1a

jp_00_1ae6:
    ldh  A, [hFFF8]                                    ;; 00:1ae6 $f0 $f8
    ld   E, A                                          ;; 00:1ae8 $5f
    ldh  A, [hFFF9]                                    ;; 00:1ae9 $f0 $f9
    ld   D, A                                          ;; 00:1aeb $57
    ld   A, [wC3AA]                                    ;; 00:1aec $fa $aa $c3
    ld   L, A                                          ;; 00:1aef $6f
    ld   H, $00                                        ;; 00:1af0 $26 $00
    add  HL, DE                                        ;; 00:1af2 $19
    ld   E, H                                          ;; 00:1af3 $5c
    ld   D, L                                          ;; 00:1af4 $55
    jp   jp_00_1b0f                                    ;; 00:1af5 $c3 $0f $1b

jp_00_1af8:
    ld   A, [wC5BA]                                    ;; 00:1af8 $fa $ba $c5
    or   A, A                                          ;; 00:1afb $b7
    jp   NZ, jp_00_1ab8                                ;; 00:1afc $c2 $b8 $1a
    ld   A, [wC3A9]                                    ;; 00:1aff $fa $a9 $c3
    and  A, $01                                        ;; 00:1b02 $e6 $01
    xor  A, $01                                        ;; 00:1b04 $ee $01
    ld   E, A                                          ;; 00:1b06 $5f
    ld   A, [wC3AA]                                    ;; 00:1b07 $fa $aa $c3
    ld   D, A                                          ;; 00:1b0a $57
    cp   A, $ff                                        ;; 00:1b0b $fe $ff
    jr   Z, jr_00_1b18                                 ;; 00:1b0d $28 $09

jp_00_1b0f:
    call call_00_224a                                  ;; 00:1b0f $cd $4a $22
    call call_00_22cc                                  ;; 00:1b12 $cd $cc $22
    jp   jp_00_1ab8                                    ;; 00:1b15 $c3 $b8 $1a

jr_00_1b18:
    ld   A, E                                          ;; 00:1b18 $7b
    cp   A, $01                                        ;; 00:1b19 $fe $01
    jr   NZ, jp_00_1b0f                                ;; 00:1b1b $20 $f2
    xor  A, A                                          ;; 00:1b1d $af
    ld   [wC5B7], A                                    ;; 00:1b1e $ea $b7 $c5
    ld   HL, wCCC4                                     ;; 00:1b21 $21 $c4 $cc
    ld   DE, wCCC9                                     ;; 00:1b24 $11 $c9 $cc
    ld   A, [HL-]                                      ;; 00:1b27 $3a
    ld   [DE], A                                       ;; 00:1b28 $12
    dec  E                                             ;; 00:1b29 $1d
    ld   A, [HL-]                                      ;; 00:1b2a $3a
    ld   [DE], A                                       ;; 00:1b2b $12
    dec  E                                             ;; 00:1b2c $1d
    ld   A, [HL]                                       ;; 00:1b2d $7e
    ld   [DE], A                                       ;; 00:1b2e $12
    call call_00_22bc                                  ;; 00:1b2f $cd $bc $22
    jp   jp_00_1ab8                                    ;; 00:1b32 $c3 $b8 $1a

jp_00_1b35:
    call call_00_1b4f                                  ;; 00:1b35 $cd $4f $1b
    call call_00_345d                                  ;; 00:1b38 $cd $5d $34
    ld   A, [wC3AA]                                    ;; 00:1b3b $fa $aa $c3
    ld   L, A                                          ;; 00:1b3e $6f
    ld   A, [wC3A9]                                    ;; 00:1b3f $fa $a9 $c3
    ld   H, A                                          ;; 00:1b42 $67
    call call_00_346f                                  ;; 00:1b43 $cd $6f $34
    call call_00_3cf7                                  ;; 00:1b46 $cd $f7 $3c
    call call_00_355a                                  ;; 00:1b49 $cd $5a $35
    jp   jp_00_1ab8                                    ;; 00:1b4c $c3 $b8 $1a

call_00_1b4f:
    ld   A, [wC5B7]                                    ;; 00:1b4f $fa $b7 $c5
    ld   HL, $1c30                                     ;; 00:1b52 $21 $30 $1c
    rst  add_hl_a                                      ;; 00:1b55 $c7
    ld   E, [HL]                                       ;; 00:1b56 $5e
    ld   A, [wC5BD]                                    ;; 00:1b57 $fa $bd $c5
    add  A, $04                                        ;; 00:1b5a $c6 $04
    ld   L, A                                          ;; 00:1b5c $6f
    ld   A, [wC5BE]                                    ;; 00:1b5d $fa $be $c5
    ld   H, A                                          ;; 00:1b60 $67
    or   A, L                                          ;; 00:1b61 $b5
    jr   Z, .jr_00_1b7a                                ;; 00:1b62 $28 $16
    ld   A, [HL]                                       ;; 00:1b64 $7e
    bit  3, A                                          ;; 00:1b65 $cb $5f
    jr   NZ, .jr_00_1b7a                               ;; 00:1b67 $20 $11
    swap A                                             ;; 00:1b69 $cb $37
    and  A, $fc                                        ;; 00:1b6b $e6 $fc
    or   A, E                                          ;; 00:1b6d $b3
    swap A                                             ;; 00:1b6e $cb $37
    ld   [HL], A                                       ;; 00:1b70 $77
    call call_00_1c80                                  ;; 00:1b71 $cd $80 $1c
    call call_00_1d26                                  ;; 00:1b74 $cd $26 $1d
    ld   A, $01                                        ;; 00:1b77 $3e $01
    ret                                                ;; 00:1b79 $c9
.jr_00_1b7a:
    xor  A, A                                          ;; 00:1b7a $af
    ret                                                ;; 00:1b7b $c9

jp_00_1b7c:
    ld   A, [wC3AA]                                    ;; 00:1b7c $fa $aa $c3
    rlca                                               ;; 00:1b7f $07
    rlca                                               ;; 00:1b80 $07
    and  A, $03                                        ;; 00:1b81 $e6 $03
    dec  A                                             ;; 00:1b83 $3d
    add  A, A                                          ;; 00:1b84 $87
    add  A, A                                          ;; 00:1b85 $87
    add  A, $99                                        ;; 00:1b86 $c6 $99
    ld   E, A                                          ;; 00:1b88 $5f
    ld   D, $cc                                        ;; 00:1b89 $16 $cc
    ld   A, [wC3A9]                                    ;; 00:1b8b $fa $a9 $c3
    swap A                                             ;; 00:1b8e $cb $37
    and  A, $0f                                        ;; 00:1b90 $e6 $0f
    add  A, $50                                        ;; 00:1b92 $c6 $50
    ld   C, A                                          ;; 00:1b94 $4f
    ld   B, $00                                        ;; 00:1b95 $06 $00
    ld   L, C                                          ;; 00:1b97 $69
    ld   H, B                                          ;; 00:1b98 $60
    add  HL, HL                                        ;; 00:1b99 $29
    add  HL, BC                                        ;; 00:1b9a $09
    ld   BC, $52d0                                     ;; 00:1b9b $01 $d0 $52
    add  HL, BC                                        ;; 00:1b9e $09
    ld   A, $02                                        ;; 00:1b9f $3e $02
    rst  switchBank                                    ;; 00:1ba1 $ef
    ld   A, [HL+]                                      ;; 00:1ba2 $2a
    ld   [DE], A                                       ;; 00:1ba3 $12
    inc  HL                                            ;; 00:1ba4 $23
    inc  E                                             ;; 00:1ba5 $1c
    ld   A, [HL-]                                      ;; 00:1ba6 $3a
    ld   [DE], A                                       ;; 00:1ba7 $12
    inc  E                                             ;; 00:1ba8 $1c
    ld   A, [HL]                                       ;; 00:1ba9 $7e
    ld   [DE], A                                       ;; 00:1baa $12
    inc  E                                             ;; 00:1bab $1c
    ld   A, [wC3AA]                                    ;; 00:1bac $fa $aa $c3
    and  A, $1f                                        ;; 00:1baf $e6 $1f
    ld   [DE], A                                       ;; 00:1bb1 $12
    ld   A, [wC5C9]                                    ;; 00:1bb2 $fa $c9 $c5
    call call_00_2403                                  ;; 00:1bb5 $cd $03 $24
    call call_00_14f0                                  ;; 00:1bb8 $cd $f0 $14
    jp   jp_00_1ab8                                    ;; 00:1bbb $c3 $b8 $1a

jp_00_1bbe:
    ld   A, [wC3AA]                                    ;; 00:1bbe $fa $aa $c3
    ld_long_store hFFBD, A                             ;; 00:1bc1 $ea $bd $ff
    call call_00_017a                                  ;; 00:1bc4 $cd $7a $01
    ld   D, $3f                                        ;; 00:1bc7 $16 $3f
    ld   E, $05                                        ;; 00:1bc9 $1e $05
.jr_00_1bcb:
    ld   HL, $8800                                     ;; 00:1bcb $21 $00 $88
    ld   B, $04                                        ;; 00:1bce $06 $04
.jr_00_1bd0:
    ld   C, $00                                        ;; 00:1bd0 $0e $00
.jr_00_1bd2:
    ld   A, [HL]                                       ;; 00:1bd2 $7e
    and  A, D                                          ;; 00:1bd3 $a2
    ld   [HL+], A                                      ;; 00:1bd4 $22
    ld   A, [HL]                                       ;; 00:1bd5 $7e
    and  A, D                                          ;; 00:1bd6 $a2
    ld   [HL+], A                                      ;; 00:1bd7 $22
    rrc  D                                             ;; 00:1bd8 $cb $0a
    rrc  D                                             ;; 00:1bda $cb $0a
    dec  C                                             ;; 00:1bdc $0d
    jr   NZ, .jr_00_1bd2                               ;; 00:1bdd $20 $f3
    dec  B                                             ;; 00:1bdf $05
    jr   NZ, .jr_00_1bd0                               ;; 00:1be0 $20 $ee
    rrc  D                                             ;; 00:1be2 $cb $0a
    rrc  D                                             ;; 00:1be4 $cb $0a
    rrc  D                                             ;; 00:1be6 $cb $0a
    dec  E                                             ;; 00:1be8 $1d
    jr   NZ, .jr_00_1bcb                               ;; 00:1be9 $20 $e0
    call call_00_017d                                  ;; 00:1beb $cd $7d $01
    ld   A, $06                                        ;; 00:1bee $3e $06
    rst  switchBank                                    ;; 00:1bf0 $ef
    call call_06_4000 ;@bank 6                         ;; 00:1bf1 $cd $00 $40
    ld   A, [wCCC7]                                    ;; 00:1bf4 $fa $c7 $cc
    call call_00_22bc                                  ;; 00:1bf7 $cd $bc $22
    ld   A, $01                                        ;; 00:1bfa $3e $01
    ldh  [hFFFE], A                                    ;; 00:1bfc $e0 $fe
    xor  A, A                                          ;; 00:1bfe $af
    ld   [wC5CA], A                                    ;; 00:1bff $ea $ca $c5
    ld   [wC5B1], A                                    ;; 00:1c02 $ea $b1 $c5
    ld   [wC5BA], A                                    ;; 00:1c05 $ea $ba $c5
    ld   HL, $9c21                                     ;; 00:1c08 $21 $21 $9c
    call call_00_34bb                                  ;; 00:1c0b $cd $bb $34
    jp   jp_00_1ab8                                    ;; 00:1c0e $c3 $b8 $1a
    db   $ce, $72, $aa, $da, $ff, $00, $0c, $8d        ;; 00:1c11 ????????
    db   $b5, $b2, $b3, $ff, $76, $a8, $b0, $0d        ;; 00:1c19 ????????
    db   $00, $ce, $b8, $be, $5b, $65, $71, $b5        ;; 00:1c21 ????????
    db   $af, $b2, $a4, $cc, $a7, $0d, $00, $01        ;; 00:1c29 ????????
    db   $00, $03, $02, $03, $02, $00, $01             ;; 00:1c31 ???????

call_00_1c38:
    ld   A, [DE]                                       ;; 00:1c38 $1a
    add  A, B                                          ;; 00:1c39 $80
    ld   [DE], A                                       ;; 00:1c3a $12
    set  0, D                                          ;; 00:1c3b $cb $c2
    ld   [DE], A                                       ;; 00:1c3d $12
    res  0, D                                          ;; 00:1c3e $cb $82
    inc  E                                             ;; 00:1c40 $1c
    inc  E                                             ;; 00:1c41 $1c
    inc  E                                             ;; 00:1c42 $1c
    inc  E                                             ;; 00:1c43 $1c
    dec  L                                             ;; 00:1c44 $2d
    jr   NZ, call_00_1c38                              ;; 00:1c45 $20 $f1
    ret                                                ;; 00:1c47 $c9

call_00_1c48:
    ld   A, [DE]                                       ;; 00:1c48 $1a
    sub  A, B                                          ;; 00:1c49 $90
    ld   [DE], A                                       ;; 00:1c4a $12
    set  0, D                                          ;; 00:1c4b $cb $c2
    ld   [DE], A                                       ;; 00:1c4d $12
    res  0, D                                          ;; 00:1c4e $cb $82
    inc  E                                             ;; 00:1c50 $1c
    inc  E                                             ;; 00:1c51 $1c
    inc  E                                             ;; 00:1c52 $1c
    inc  E                                             ;; 00:1c53 $1c
    dec  L                                             ;; 00:1c54 $2d
    jr   NZ, call_00_1c48                              ;; 00:1c55 $20 $f1
    ret                                                ;; 00:1c57 $c9

call_00_1c58:
    ld   A, [DE]                                       ;; 00:1c58 $1a
    cp   A, $b0                                        ;; 00:1c59 $fe $b0
    jr   NC, .jr_00_1c64                               ;; 00:1c5b $30 $07
    sub  A, B                                          ;; 00:1c5d $90
    ld   [DE], A                                       ;; 00:1c5e $12
    set  0, D                                          ;; 00:1c5f $cb $c2
    ld   [DE], A                                       ;; 00:1c61 $12
    res  0, D                                          ;; 00:1c62 $cb $82
.jr_00_1c64:
    inc  E                                             ;; 00:1c64 $1c
    inc  E                                             ;; 00:1c65 $1c
    inc  E                                             ;; 00:1c66 $1c
    inc  E                                             ;; 00:1c67 $1c
    dec  L                                             ;; 00:1c68 $2d
    jr   NZ, call_00_1c58                              ;; 00:1c69 $20 $ed
    ret                                                ;; 00:1c6b $c9

call_00_1c6c:
    ld   A, [DE]                                       ;; 00:1c6c $1a
    cp   A, $b0                                        ;; 00:1c6d $fe $b0
    jr   NC, .jr_00_1c78                               ;; 00:1c6f $30 $07
    add  A, B                                          ;; 00:1c71 $80
    ld   [DE], A                                       ;; 00:1c72 $12
    set  0, D                                          ;; 00:1c73 $cb $c2
    ld   [DE], A                                       ;; 00:1c75 $12
    res  0, D                                          ;; 00:1c76 $cb $82
.jr_00_1c78:
    inc  E                                             ;; 00:1c78 $1c
    inc  E                                             ;; 00:1c79 $1c
    inc  E                                             ;; 00:1c7a $1c
    inc  E                                             ;; 00:1c7b $1c
    dec  L                                             ;; 00:1c7c $2d
    jr   NZ, call_00_1c6c                              ;; 00:1c7d $20 $ed
    ret                                                ;; 00:1c7f $c9

call_00_1c80:
    ld   HL, wC52C                                     ;; 00:1c80 $21 $2c $c5
    ld   B, $08                                        ;; 00:1c83 $06 $08
    ld   C, $ff                                        ;; 00:1c85 $0e $ff
.jr_00_1c87:
    ld   [HL], C                                       ;; 00:1c87 $71
    ld   A, L                                          ;; 00:1c88 $7d
    add  A, $06                                        ;; 00:1c89 $c6 $06
    ld   L, A                                          ;; 00:1c8b $6f
    dec  B                                             ;; 00:1c8c $05
    jr   NZ, .jr_00_1c87                               ;; 00:1c8d $20 $f8
    ld   HL, wCCC8                                     ;; 00:1c8f $21 $c8 $cc
    ld   A, [HL+]                                      ;; 00:1c92 $2a
    sub  A, $05                                        ;; 00:1c93 $d6 $05
    ld   E, A                                          ;; 00:1c95 $5f
    ld   A, [HL]                                       ;; 00:1c96 $7e
    sub  A, $05                                        ;; 00:1c97 $d6 $05
    ld   D, A                                          ;; 00:1c99 $57
    ld   A, $d2                                        ;; 00:1c9a $3e $d2
    ld   [wC5D1], A                                    ;; 00:1c9c $ea $d1 $c5
    ld   HL, wC55C                                     ;; 00:1c9f $21 $5c $c5
    ld   BC, wC52C                                     ;; 00:1ca2 $01 $2c $c5
    ld   A, $10                                        ;; 00:1ca5 $3e $10
.jr_00_1ca7:
    push AF                                            ;; 00:1ca7 $f5
    cpl                                                ;; 00:1ca8 $2f
    add  A, $11                                        ;; 00:1ca9 $c6 $11
    ld   [BC], A                                       ;; 00:1cab $02
    inc  C                                             ;; 00:1cac $0c
    ld   A, [HL+]                                      ;; 00:1cad $2a
    cp   A, $40                                        ;; 00:1cae $fe $40
    jr   NC, .jr_00_1d19                               ;; 00:1cb0 $30 $67
    sub  A, E                                          ;; 00:1cb2 $93
    cp   A, $0b                                        ;; 00:1cb3 $fe $0b
    jr   NC, .jr_00_1d19                               ;; 00:1cb5 $30 $62
    swap A                                             ;; 00:1cb7 $cb $37
    ld   [BC], A                                       ;; 00:1cb9 $02
    inc  C                                             ;; 00:1cba $0c
    ld   A, [HL]                                       ;; 00:1cbb $7e
    sub  A, D                                          ;; 00:1cbc $92
    cp   A, $0b                                        ;; 00:1cbd $fe $0b
    jr   NC, .jr_00_1d18                               ;; 00:1cbf $30 $57
    swap A                                             ;; 00:1cc1 $cb $37
    ld   [BC], A                                       ;; 00:1cc3 $02
    push DE                                            ;; 00:1cc4 $d5
    push BC                                            ;; 00:1cc5 $c5
    push HL                                            ;; 00:1cc6 $e5
    ld   D, [HL]                                       ;; 00:1cc7 $56
    dec  L                                             ;; 00:1cc8 $2d
    ld   E, [HL]                                       ;; 00:1cc9 $5e
    call call_00_13ed                                  ;; 00:1cca $cd $ed $13
    ld   A, E                                          ;; 00:1ccd $7b
    and  A, $f0                                        ;; 00:1cce $e6 $f0
    jr   Z, .jr_00_1cd4                                ;; 00:1cd0 $28 $02
    ld   D, $00                                        ;; 00:1cd2 $16 $00
.jr_00_1cd4:
    ld   A, [wC5D1]                                    ;; 00:1cd4 $fa $d1 $c5
    ld   L, A                                          ;; 00:1cd7 $6f
    ld   H, $c5                                        ;; 00:1cd8 $26 $c5
    sla  D                                             ;; 00:1cda $cb $22
    sla  D                                             ;; 00:1cdc $cb $22
    ld   A, $c0                                        ;; 00:1cde $3e $c0
    and  A, D                                          ;; 00:1ce0 $a2
    ld   [HL+], A                                      ;; 00:1ce1 $22
    ld   A, L                                          ;; 00:1ce2 $7d
    ld   [wC5D1], A                                    ;; 00:1ce3 $ea $d1 $c5
    pop  HL                                            ;; 00:1ce6 $e1
    pop  BC                                            ;; 00:1ce7 $c1
    pop  DE                                            ;; 00:1ce8 $d1
    inc  C                                             ;; 00:1ce9 $0c
    inc  L                                             ;; 00:1cea $2c
    inc  L                                             ;; 00:1ceb $2c
    inc  L                                             ;; 00:1cec $2c
    ld   A, [HL]                                       ;; 00:1ced $7e
    and  A, $07                                        ;; 00:1cee $e6 $07
    swap A                                             ;; 00:1cf0 $cb $37
    ld   [BC], A                                       ;; 00:1cf2 $02
    inc  C                                             ;; 00:1cf3 $0c
    ld   A, [HL+]                                      ;; 00:1cf4 $2a
    push HL                                            ;; 00:1cf5 $e5
    push DE                                            ;; 00:1cf6 $d5
    ld   DE, $204d                                     ;; 00:1cf7 $11 $4d $20
    bit  3, A                                          ;; 00:1cfa $cb $5f
    jr   Z, .jr_00_1d01                                ;; 00:1cfc $28 $03
    ld   DE, $2075                                     ;; 00:1cfe $11 $75 $20
.jr_00_1d01:
    swap A                                             ;; 00:1d01 $cb $37
    and  A, $03                                        ;; 00:1d03 $e6 $03
    add  A, A                                          ;; 00:1d05 $87
    ld   L, A                                          ;; 00:1d06 $6f
    add  A, A                                          ;; 00:1d07 $87
    add  A, A                                          ;; 00:1d08 $87
    add  A, L                                          ;; 00:1d09 $85
    ld   L, A                                          ;; 00:1d0a $6f
    ld   H, $00                                        ;; 00:1d0b $26 $00
    add  HL, DE                                        ;; 00:1d0d $19
    ld   A, L                                          ;; 00:1d0e $7d
    ld   [BC], A                                       ;; 00:1d0f $02
    inc  C                                             ;; 00:1d10 $0c
    ld   A, H                                          ;; 00:1d11 $7c
    ld   [BC], A                                       ;; 00:1d12 $02
    inc  C                                             ;; 00:1d13 $0c
    pop  DE                                            ;; 00:1d14 $d1
    pop  HL                                            ;; 00:1d15 $e1
    jr   .jr_00_1d21                                   ;; 00:1d16 $18 $09
.jr_00_1d18:
    dec  C                                             ;; 00:1d18 $0d
.jr_00_1d19:
    dec  C                                             ;; 00:1d19 $0d
    ld   A, $ff                                        ;; 00:1d1a $3e $ff
    ld   [BC], A                                       ;; 00:1d1c $02
    inc  L                                             ;; 00:1d1d $2c
    inc  L                                             ;; 00:1d1e $2c
    inc  L                                             ;; 00:1d1f $2c
    inc  L                                             ;; 00:1d20 $2c
.jr_00_1d21:
    pop  AF                                            ;; 00:1d21 $f1
    dec  A                                             ;; 00:1d22 $3d
    jr   NZ, .jr_00_1ca7                               ;; 00:1d23 $20 $82
    ret                                                ;; 00:1d25 $c9

call_00_1d26:
    xor  A, A                                          ;; 00:1d26 $af
    ld   [wC5B0], A                                    ;; 00:1d27 $ea $b0 $c5
    ld   DE, wC52C                                     ;; 00:1d2a $11 $2c $c5
    ld   HL, wC010                                     ;; 00:1d2d $21 $10 $c0
    ld   A, $08                                        ;; 00:1d30 $3e $08
.jr_00_1d32:
    push AF                                            ;; 00:1d32 $f5
    ld   A, [DE]                                       ;; 00:1d33 $1a
    inc  A                                             ;; 00:1d34 $3c
    jr   Z, .jr_00_1d94                                ;; 00:1d35 $28 $5d
    inc  E                                             ;; 00:1d37 $1c
    ld   A, [DE]                                       ;; 00:1d38 $1a
    ld   C, A                                          ;; 00:1d39 $4f
    inc  E                                             ;; 00:1d3a $1c
    ld   A, [DE]                                       ;; 00:1d3b $1a
    ld   B, A                                          ;; 00:1d3c $47
    ld   [HL], C                                       ;; 00:1d3d $71
    set  0, H                                          ;; 00:1d3e $cb $c4
    ld   [HL], C                                       ;; 00:1d40 $71
    inc  L                                             ;; 00:1d41 $2c
    ld   [HL], A                                       ;; 00:1d42 $77
    res  0, H                                          ;; 00:1d43 $cb $84
    ld   [HL+], A                                      ;; 00:1d45 $22
    inc  L                                             ;; 00:1d46 $2c
    ld   [HL], $00                                     ;; 00:1d47 $36 $00
    set  0, H                                          ;; 00:1d49 $cb $c4
    ld   [HL], $00                                     ;; 00:1d4b $36 $00
    res  0, H                                          ;; 00:1d4d $cb $84
    inc  L                                             ;; 00:1d4f $2c
    ld   [HL], C                                       ;; 00:1d50 $71
    set  0, H                                          ;; 00:1d51 $cb $c4
    ld   [HL], C                                       ;; 00:1d53 $71
    inc  L                                             ;; 00:1d54 $2c
    ld   A, B                                          ;; 00:1d55 $78
    add  A, $08                                        ;; 00:1d56 $c6 $08
    ld   [HL], A                                       ;; 00:1d58 $77
    res  0, H                                          ;; 00:1d59 $cb $84
    ld   [HL+], A                                      ;; 00:1d5b $22
    inc  L                                             ;; 00:1d5c $2c
    ld   [HL], $00                                     ;; 00:1d5d $36 $00
    set  0, H                                          ;; 00:1d5f $cb $c4
    ld   [HL], $00                                     ;; 00:1d61 $36 $00
    res  0, H                                          ;; 00:1d63 $cb $84
    inc  L                                             ;; 00:1d65 $2c
    ld   A, C                                          ;; 00:1d66 $79
    add  A, $08                                        ;; 00:1d67 $c6 $08
    ld   C, A                                          ;; 00:1d69 $4f
    ld   [HL], A                                       ;; 00:1d6a $77
    set  0, H                                          ;; 00:1d6b $cb $c4
    ld   [HL+], A                                      ;; 00:1d6d $22
    ld   [HL], B                                       ;; 00:1d6e $70
    res  0, H                                          ;; 00:1d6f $cb $84
    ld   [HL], B                                       ;; 00:1d71 $70
    inc  L                                             ;; 00:1d72 $2c
    inc  L                                             ;; 00:1d73 $2c
    ld   [HL], $00                                     ;; 00:1d74 $36 $00
    set  0, H                                          ;; 00:1d76 $cb $c4
    ld   [HL], $00                                     ;; 00:1d78 $36 $00
    res  0, H                                          ;; 00:1d7a $cb $84
    inc  L                                             ;; 00:1d7c $2c
    ld   [HL], A                                       ;; 00:1d7d $77
    set  0, H                                          ;; 00:1d7e $cb $c4
    ld   [HL+], A                                      ;; 00:1d80 $22
    ld   A, B                                          ;; 00:1d81 $78
    add  A, $08                                        ;; 00:1d82 $c6 $08
    ld   [HL], A                                       ;; 00:1d84 $77
    res  0, H                                          ;; 00:1d85 $cb $84
    ld   [HL+], A                                      ;; 00:1d87 $22
    inc  L                                             ;; 00:1d88 $2c
    ld   [HL], $00                                     ;; 00:1d89 $36 $00
    set  0, H                                          ;; 00:1d8b $cb $c4
    ld   [HL], $00                                     ;; 00:1d8d $36 $00
    res  0, H                                          ;; 00:1d8f $cb $84
    inc  L                                             ;; 00:1d91 $2c
    dec  E                                             ;; 00:1d92 $1d
    dec  E                                             ;; 00:1d93 $1d
.jr_00_1d94:
    ld   A, E                                          ;; 00:1d94 $7b
    add  A, $06                                        ;; 00:1d95 $c6 $06
    ld   E, A                                          ;; 00:1d97 $5f
    pop  AF                                            ;; 00:1d98 $f1
    dec  A                                             ;; 00:1d99 $3d
    jr   NZ, .jr_00_1d32                               ;; 00:1d9a $20 $96
.jr_00_1d9c:
    ld   A, L                                          ;; 00:1d9c $7d
    cp   A, $90                                        ;; 00:1d9d $fe $90
    jr   NC, .jr_00_1db3                               ;; 00:1d9f $30 $12
    ld   [HL], $b0                                     ;; 00:1da1 $36 $b0
    set  0, H                                          ;; 00:1da3 $cb $c4
    ld   [HL], $b0                                     ;; 00:1da5 $36 $b0
    inc  L                                             ;; 00:1da7 $2c
    inc  L                                             ;; 00:1da8 $2c
    inc  L                                             ;; 00:1da9 $2c
    ld   [HL], $00                                     ;; 00:1daa $36 $00
    res  0, H                                          ;; 00:1dac $cb $84
    ld   [HL], $00                                     ;; 00:1dae $36 $00
    inc  L                                             ;; 00:1db0 $2c
    jr   .jr_00_1d9c                                   ;; 00:1db1 $18 $e9
.jr_00_1db3:
    ld   DE, wC52C                                     ;; 00:1db3 $11 $2c $c5
    ld   L, $12                                        ;; 00:1db6 $2e $12
    ld   A, $08                                        ;; 00:1db8 $3e $08
.jr_00_1dba:
    push AF                                            ;; 00:1dba $f5
    ld   A, [DE]                                       ;; 00:1dbb $1a
    inc  A                                             ;; 00:1dbc $3c
    jr   Z, .jr_00_1dd9                                ;; 00:1dbd $28 $1a
    push DE                                            ;; 00:1dbf $d5
    inc  E                                             ;; 00:1dc0 $1c
    inc  E                                             ;; 00:1dc1 $1c
    inc  E                                             ;; 00:1dc2 $1c
    ld   A, [DE]                                       ;; 00:1dc3 $1a
    ld   C, A                                          ;; 00:1dc4 $4f
    inc  E                                             ;; 00:1dc5 $1c
    ld   A, [DE]                                       ;; 00:1dc6 $1a
    ld   B, A                                          ;; 00:1dc7 $47
    inc  E                                             ;; 00:1dc8 $1c
    ld   A, [DE]                                       ;; 00:1dc9 $1a
    ld   D, A                                          ;; 00:1dca $57
    ld   E, B                                          ;; 00:1dcb $58
    push HL                                            ;; 00:1dcc $e5
    call call_00_1e10                                  ;; 00:1dcd $cd $10 $1e
    pop  HL                                            ;; 00:1dd0 $e1
    set  0, H                                          ;; 00:1dd1 $cb $c4
    call call_00_1e10                                  ;; 00:1dd3 $cd $10 $1e
    res  0, H                                          ;; 00:1dd6 $cb $84
    pop  DE                                            ;; 00:1dd8 $d1
.jr_00_1dd9:
    ld   A, E                                          ;; 00:1dd9 $7b
    add  A, $06                                        ;; 00:1dda $c6 $06
    ld   E, A                                          ;; 00:1ddc $5f
    pop  AF                                            ;; 00:1ddd $f1
    dec  A                                             ;; 00:1dde $3d
    jr   NZ, .jr_00_1dba                               ;; 00:1ddf $20 $d9
    ld   DE, wC5D2                                     ;; 00:1de1 $11 $d2 $c5
    ld   HL, wC013                                     ;; 00:1de4 $21 $13 $c0
    ld   B, $08                                        ;; 00:1de7 $06 $08
.jr_00_1de9:
    ld   A, [DE]                                       ;; 00:1de9 $1a
    and  A, $80                                        ;; 00:1dea $e6 $80
    ld   C, A                                          ;; 00:1dec $4f
    call call_00_1e02                                  ;; 00:1ded $cd $02 $1e
    call call_00_1e02                                  ;; 00:1df0 $cd $02 $1e
    ld   A, [DE]                                       ;; 00:1df3 $1a
    sla  A                                             ;; 00:1df4 $cb $27
    ld   C, A                                          ;; 00:1df6 $4f
    call call_00_1e02                                  ;; 00:1df7 $cd $02 $1e
    call call_00_1e02                                  ;; 00:1dfa $cd $02 $1e
    inc  E                                             ;; 00:1dfd $1c
    dec  B                                             ;; 00:1dfe $05
    jr   NZ, .jr_00_1de9                               ;; 00:1dff $20 $e8
    ret                                                ;; 00:1e01 $c9

call_00_1e02:
    ld   A, [HL]                                       ;; 00:1e02 $7e
    or   A, C                                          ;; 00:1e03 $b1
    ld   [HL], A                                       ;; 00:1e04 $77
    set  0, H                                          ;; 00:1e05 $cb $c4
    ld   A, [HL]                                       ;; 00:1e07 $7e
    or   A, C                                          ;; 00:1e08 $b1
    ld   [HL+], A                                      ;; 00:1e09 $22
    res  0, H                                          ;; 00:1e0a $cb $84
    inc  L                                             ;; 00:1e0c $2c
    inc  L                                             ;; 00:1e0d $2c
    inc  L                                             ;; 00:1e0e $2c
    ret                                                ;; 00:1e0f $c9

call_00_1e10:
    ld   A, [DE]                                       ;; 00:1e10 $1a
    ld   B, A                                          ;; 00:1e11 $47
    inc  DE                                            ;; 00:1e12 $13
    ld   A, $04                                        ;; 00:1e13 $3e $04
.jr_00_1e15:
    push AF                                            ;; 00:1e15 $f5
    ld   A, [DE]                                       ;; 00:1e16 $1a
    add  A, C                                          ;; 00:1e17 $81
    ld   [HL+], A                                      ;; 00:1e18 $22
    inc  DE                                            ;; 00:1e19 $13
    ld   A, [HL]                                       ;; 00:1e1a $7e
    and  A, $df                                        ;; 00:1e1b $e6 $df
    or   A, B                                          ;; 00:1e1d $b0
    ld   [HL+], A                                      ;; 00:1e1e $22
    inc  L                                             ;; 00:1e1f $2c
    inc  L                                             ;; 00:1e20 $2c
    pop  AF                                            ;; 00:1e21 $f1
    dec  A                                             ;; 00:1e22 $3d
    jr   NZ, .jr_00_1e15                               ;; 00:1e23 $20 $f0
    ret                                                ;; 00:1e25 $c9

call_00_1e26:
    ld   A, [wC5B0]                                    ;; 00:1e26 $fa $b0 $c5
    or   A, A                                          ;; 00:1e29 $b7
    ret  NZ                                            ;; 00:1e2a $c0
    ld   E, $07                                        ;; 00:1e2b $1e $07
    xor  A, A                                          ;; 00:1e2d $af
    call call_00_016b                                  ;; 00:1e2e $cd $6b $01
    ld   L, A                                          ;; 00:1e31 $6f
    ld   A, $08                                        ;; 00:1e32 $3e $08
    sub  A, L                                          ;; 00:1e34 $95
    ld   B, A                                          ;; 00:1e35 $47
    ld   A, L                                          ;; 00:1e36 $7d
    add  A, A                                          ;; 00:1e37 $87
    ld   L, A                                          ;; 00:1e38 $6f
    add  A, A                                          ;; 00:1e39 $87
    add  A, L                                          ;; 00:1e3a $85
    add  A, $2c                                        ;; 00:1e3b $c6 $2c
    ld   L, A                                          ;; 00:1e3d $6f
    ld   H, $c5                                        ;; 00:1e3e $26 $c5
    ld   A, [HL]                                       ;; 00:1e40 $7e
    inc  A                                             ;; 00:1e41 $3c
    ret  Z                                             ;; 00:1e42 $c8
    ld   A, [wC5CC]                                    ;; 00:1e43 $fa $cc $c5
    ld   E, A                                          ;; 00:1e46 $5f
    xor  A, A                                          ;; 00:1e47 $af
    call call_00_016b                                  ;; 00:1e48 $cd $6b $01
    or   A, A                                          ;; 00:1e4b $b7
    ret  NZ                                            ;; 00:1e4c $c0
    ld   A, $07                                        ;; 00:1e4d $3e $07
    ld   [wC5CC], A                                    ;; 00:1e4f $ea $cc $c5
    ld   A, L                                          ;; 00:1e52 $7d
    ld   [wC5AC], A                                    ;; 00:1e53 $ea $ac $c5
    ld   A, [HL]                                       ;; 00:1e56 $7e
    ld   E, A                                          ;; 00:1e57 $5f
    add  A, A                                          ;; 00:1e58 $87
    add  A, A                                          ;; 00:1e59 $87
    add  A, E                                          ;; 00:1e5a $83
    ld   HL, wC55C                                     ;; 00:1e5b $21 $5c $c5
    rst  add_hl_a                                      ;; 00:1e5e $c7
    ld   E, L                                          ;; 00:1e5f $5d
    ld   D, H                                          ;; 00:1e60 $54
    inc  E                                             ;; 00:1e61 $1c
    inc  E                                             ;; 00:1e62 $1c
    inc  E                                             ;; 00:1e63 $1c
    inc  E                                             ;; 00:1e64 $1c
    ld   A, [DE]                                       ;; 00:1e65 $1a
    and  A, $80                                        ;; 00:1e66 $e6 $80
    ret  NZ                                            ;; 00:1e68 $c0
    xor  A, A                                          ;; 00:1e69 $af
    ld   E, $03                                        ;; 00:1e6a $1e $03
    call call_00_016b                                  ;; 00:1e6c $cd $6b $01
    ld   E, [HL]                                       ;; 00:1e6f $5e
    inc  L                                             ;; 00:1e70 $2c
    ld   D, [HL]                                       ;; 00:1e71 $56

call_00_1e72:
    ld   C, A                                          ;; 00:1e72 $4f
    or   A, A                                          ;; 00:1e73 $b7
    jr   Z, .jr_00_1e7f                                ;; 00:1e74 $28 $09
    dec  A                                             ;; 00:1e76 $3d
    jr   Z, .jr_00_1e82                                ;; 00:1e77 $28 $09
    dec  A                                             ;; 00:1e79 $3d
    jr   Z, .jr_00_1e85                                ;; 00:1e7a $28 $09
    inc  D                                             ;; 00:1e7c $14
    jr   .jr_00_1e86                                   ;; 00:1e7d $18 $07
.jr_00_1e7f:
    inc  E                                             ;; 00:1e7f $1c
    jr   .jr_00_1e86                                   ;; 00:1e80 $18 $04
.jr_00_1e82:
    dec  E                                             ;; 00:1e82 $1d
    jr   .jr_00_1e86                                   ;; 00:1e83 $18 $01
.jr_00_1e85:
    dec  D                                             ;; 00:1e85 $15
.jr_00_1e86:
    ld   A, D                                          ;; 00:1e86 $7a
    cp   A, $40                                        ;; 00:1e87 $fe $40
    ret  NC                                            ;; 00:1e89 $d0
    ld   A, E                                          ;; 00:1e8a $7b
    cp   A, $3e                                        ;; 00:1e8b $fe $3e
    ret  NC                                            ;; 00:1e8d $d0
    ld   A, [wCCC8]                                    ;; 00:1e8e $fa $c8 $cc
    sub  A, E                                          ;; 00:1e91 $93
    jr   Z, .jr_00_1e9d                                ;; 00:1e92 $28 $09
    sub  A, $05                                        ;; 00:1e94 $d6 $05
    cpl                                                ;; 00:1e96 $2f
    inc  A                                             ;; 00:1e97 $3c
    cp   A, $0b                                        ;; 00:1e98 $fe $0b
    ret  NC                                            ;; 00:1e9a $d0
    jr   .jr_00_1ea2                                   ;; 00:1e9b $18 $05
.jr_00_1e9d:
    ld   A, [wCCC9]                                    ;; 00:1e9d $fa $c9 $cc
    cp   A, D                                          ;; 00:1ea0 $ba
    ret  Z                                             ;; 00:1ea1 $c8
.jr_00_1ea2:
    ld   A, [wCCC9]                                    ;; 00:1ea2 $fa $c9 $cc
    sub  A, $05                                        ;; 00:1ea5 $d6 $05
    sub  A, D                                          ;; 00:1ea7 $92
    cpl                                                ;; 00:1ea8 $2f
    inc  A                                             ;; 00:1ea9 $3c
    cp   A, $0b                                        ;; 00:1eaa $fe $0b
    ret  NC                                            ;; 00:1eac $d0
    push HL                                            ;; 00:1ead $e5
    push DE                                            ;; 00:1eae $d5
    push BC                                            ;; 00:1eaf $c5
    call call_00_1f67                                  ;; 00:1eb0 $cd $67 $1f
    pop  BC                                            ;; 00:1eb3 $c1
    jr   NZ, .jr_00_1ec9                               ;; 00:1eb4 $20 $13
    call call_00_13ed                                  ;; 00:1eb6 $cd $ed $13
    bit  6, E                                          ;; 00:1eb9 $cb $73
    jr   NZ, .jr_00_1ec9                               ;; 00:1ebb $20 $0c
    ld   A, E                                          ;; 00:1ebd $7b
    and  A, $b0                                        ;; 00:1ebe $e6 $b0
    jr   Z, .jr_00_1ec6                                ;; 00:1ec0 $28 $04
    xor  A, A                                          ;; 00:1ec2 $af
    or   A, A                                          ;; 00:1ec3 $b7
    jr   .jr_00_1ec9                                   ;; 00:1ec4 $18 $03
.jr_00_1ec6:
    ld   A, $01                                        ;; 00:1ec6 $3e $01
    and  A, D                                          ;; 00:1ec8 $a2
.jr_00_1ec9:
    pop  DE                                            ;; 00:1ec9 $d1
    pop  HL                                            ;; 00:1eca $e1
    ret  NZ                                            ;; 00:1ecb $c0
    ld   [HL], D                                       ;; 00:1ecc $72
    dec  L                                             ;; 00:1ecd $2d
    ld   [HL], E                                       ;; 00:1ece $73
    ld   A, C                                          ;; 00:1ecf $79
    ld   [wC5AD], A                                    ;; 00:1ed0 $ea $ad $c5
    swap A                                             ;; 00:1ed3 $cb $37
    ld   C, A                                          ;; 00:1ed5 $4f
    ld   A, L                                          ;; 00:1ed6 $7d
    add  A, $04                                        ;; 00:1ed7 $c6 $04
    ld   L, A                                          ;; 00:1ed9 $6f
    ld   A, [HL]                                       ;; 00:1eda $7e
    and  A, $cf                                        ;; 00:1edb $e6 $cf
    or   A, C                                          ;; 00:1edd $b1
    ld   [HL], A                                       ;; 00:1ede $77
    ld   A, [wC5AD]                                    ;; 00:1edf $fa $ad $c5
    add  A, A                                          ;; 00:1ee2 $87
    ld   L, A                                          ;; 00:1ee3 $6f
    add  A, A                                          ;; 00:1ee4 $87
    add  A, A                                          ;; 00:1ee5 $87
    add  A, L                                          ;; 00:1ee6 $85
    ld   L, A                                          ;; 00:1ee7 $6f
    ld   H, $00                                        ;; 00:1ee8 $26 $00
    ld   DE, $204d                                     ;; 00:1eea $11 $4d $20
    add  HL, DE                                        ;; 00:1eed $19
    ld   E, L                                          ;; 00:1eee $5d
    ld   D, H                                          ;; 00:1eef $54
    ld   A, [wC5AC]                                    ;; 00:1ef0 $fa $ac $c5
    add  A, $03                                        ;; 00:1ef3 $c6 $03
    ld   L, A                                          ;; 00:1ef5 $6f
    ld   H, $c5                                        ;; 00:1ef6 $26 $c5
    ld   C, [HL]                                       ;; 00:1ef8 $4e
    inc  L                                             ;; 00:1ef9 $2c
    ld   [HL], E                                       ;; 00:1efa $73
    inc  L                                             ;; 00:1efb $2c
    ld   [HL], D                                       ;; 00:1efc $72
    ld   A, $09                                        ;; 00:1efd $3e $09
    sub  A, B                                          ;; 00:1eff $90
    add  A, A                                          ;; 00:1f00 $87
    add  A, A                                          ;; 00:1f01 $87
    add  A, A                                          ;; 00:1f02 $87
    add  A, A                                          ;; 00:1f03 $87
    ld   L, A                                          ;; 00:1f04 $6f
    ld   H, $c0                                        ;; 00:1f05 $26 $c0
    push HL                                            ;; 00:1f07 $e5
    inc  L                                             ;; 00:1f08 $2c
    inc  L                                             ;; 00:1f09 $2c
    push HL                                            ;; 00:1f0a $e5
    call call_00_1e10                                  ;; 00:1f0b $cd $10 $1e
    pop  HL                                            ;; 00:1f0e $e1
    set  0, H                                          ;; 00:1f0f $cb $c4
    call call_00_1e10                                  ;; 00:1f11 $cd $10 $1e
    pop  HL                                            ;; 00:1f14 $e1
    ld   A, [wC5AD]                                    ;; 00:1f15 $fa $ad $c5
    cp   A, $02                                        ;; 00:1f18 $fe $02
    jr   C, .jr_00_1f1d                                ;; 00:1f1a $38 $01
    inc  L                                             ;; 00:1f1c $2c
.jr_00_1f1d:
    dec  A                                             ;; 00:1f1d $3d
    cp   A, $02                                        ;; 00:1f1e $fe $02
    ld   A, $ff                                        ;; 00:1f20 $3e $ff
    jr   C, .jr_00_1f26                                ;; 00:1f22 $38 $02
    ld   A, $01                                        ;; 00:1f24 $3e $01
.jr_00_1f26:
    ld   [wC5AE], A                                    ;; 00:1f26 $ea $ae $c5
    ld   A, L                                          ;; 00:1f29 $7d
    ld   [wC5AF], A                                    ;; 00:1f2a $ea $af $c5
    ld   A, $10                                        ;; 00:1f2d $3e $10
    ld   [wC5B0], A                                    ;; 00:1f2f $ea $b0 $c5
    ret                                                ;; 00:1f32 $c9

call_00_1f33:
    ld   A, [wC5B0]                                    ;; 00:1f33 $fa $b0 $c5
    or   A, A                                          ;; 00:1f36 $b7
    ret  Z                                             ;; 00:1f37 $c8
    ld   A, [wC5AE]                                    ;; 00:1f38 $fa $ae $c5
    ld   C, A                                          ;; 00:1f3b $4f
    ld   A, [wC5AF]                                    ;; 00:1f3c $fa $af $c5
    ld   L, A                                          ;; 00:1f3f $6f
    ld   H, $c0                                        ;; 00:1f40 $26 $c0
    push HL                                            ;; 00:1f42 $e5
    ld   B, $04                                        ;; 00:1f43 $06 $04
.jr_00_1f45:
    ld   A, [HL]                                       ;; 00:1f45 $7e
    add  A, C                                          ;; 00:1f46 $81
    ld   [HL], A                                       ;; 00:1f47 $77
    set  0, H                                          ;; 00:1f48 $cb $c4
    ld   [HL+], A                                      ;; 00:1f4a $22
    res  0, H                                          ;; 00:1f4b $cb $84
    inc  L                                             ;; 00:1f4d $2c
    inc  L                                             ;; 00:1f4e $2c
    inc  L                                             ;; 00:1f4f $2c
    dec  B                                             ;; 00:1f50 $05
    jr   NZ, .jr_00_1f45                               ;; 00:1f51 $20 $f2
    pop  HL                                            ;; 00:1f53 $e1
    ld   A, [wC5B0]                                    ;; 00:1f54 $fa $b0 $c5
    dec  A                                             ;; 00:1f57 $3d
    ld   [wC5B0], A                                    ;; 00:1f58 $ea $b0 $c5
    ret  NZ                                            ;; 00:1f5b $c0
    ld   A, [wC5B1]                                    ;; 00:1f5c $fa $b1 $c5
    or   A, A                                          ;; 00:1f5f $b7
    ret  NZ                                            ;; 00:1f60 $c0
    call call_00_1c80                                  ;; 00:1f61 $cd $80 $1c
    jp   call_00_1d26                                  ;; 00:1f64 $c3 $26 $1d

call_00_1f67:
    ld   HL, wC55C                                     ;; 00:1f67 $21 $5c $c5
    ld   B, $10                                        ;; 00:1f6a $06 $10
.jr_00_1f6c:
    ld   A, [HL]                                       ;; 00:1f6c $7e
    cp   A, E                                          ;; 00:1f6d $bb
    jr   NZ, .jr_00_1f79                               ;; 00:1f6e $20 $09
    inc  L                                             ;; 00:1f70 $2c
    ld   A, [HL-]                                      ;; 00:1f71 $3a
    cp   A, D                                          ;; 00:1f72 $ba
    jr   NZ, .jr_00_1f79                               ;; 00:1f73 $20 $04
    ld   A, $01                                        ;; 00:1f75 $3e $01
    or   A, A                                          ;; 00:1f77 $b7
    ret                                                ;; 00:1f78 $c9
.jr_00_1f79:
    ld   A, L                                          ;; 00:1f79 $7d
    add  A, $05                                        ;; 00:1f7a $c6 $05
    ld   L, A                                          ;; 00:1f7c $6f
    dec  B                                             ;; 00:1f7d $05
    jr   NZ, .jr_00_1f6c                               ;; 00:1f7e $20 $ec
    ret                                                ;; 00:1f80 $c9

call_00_1f81:
    ld   HL, wC000                                     ;; 00:1f81 $21 $00 $c0
    ld   DE, $5050                                     ;; 00:1f84 $11 $50 $50
    ld   C, $02                                        ;; 00:1f87 $0e $02
.jr_00_1f89:
    ld   B, $02                                        ;; 00:1f89 $06 $02
.jr_00_1f8b:
    ld   [HL], E                                       ;; 00:1f8b $73
    set  0, H                                          ;; 00:1f8c $cb $c4
    ld   [HL], E                                       ;; 00:1f8e $73
    inc  L                                             ;; 00:1f8f $2c
    ld   [HL], D                                       ;; 00:1f90 $72
    res  0, H                                          ;; 00:1f91 $cb $84
    ld   [HL], D                                       ;; 00:1f93 $72
    inc  L                                             ;; 00:1f94 $2c
    inc  L                                             ;; 00:1f95 $2c
    res  7, [HL]                                       ;; 00:1f96 $cb $be
    set  0, H                                          ;; 00:1f98 $cb $c4
    res  7, [HL]                                       ;; 00:1f9a $cb $be
    res  0, H                                          ;; 00:1f9c $cb $84
    inc  L                                             ;; 00:1f9e $2c
    ld   A, D                                          ;; 00:1f9f $7a
    xor  A, $08                                        ;; 00:1fa0 $ee $08
    ld   D, A                                          ;; 00:1fa2 $57
    dec  B                                             ;; 00:1fa3 $05
    jr   NZ, .jr_00_1f8b                               ;; 00:1fa4 $20 $e5
    ld   A, E                                          ;; 00:1fa6 $7b
    xor  A, $08                                        ;; 00:1fa7 $ee $08
    ld   E, A                                          ;; 00:1fa9 $5f
    dec  C                                             ;; 00:1faa $0d
    jr   NZ, .jr_00_1f89                               ;; 00:1fab $20 $dc
    call call_00_1fc2                                  ;; 00:1fad $cd $c2 $1f
    ld   A, [wCCC8]                                    ;; 00:1fb0 $fa $c8 $cc
    ld   E, A                                          ;; 00:1fb3 $5f
    ld   A, [wCCC9]                                    ;; 00:1fb4 $fa $c9 $cc
    ld   D, A                                          ;; 00:1fb7 $57
    call call_00_13fa                                  ;; 00:1fb8 $cd $fa $13
    and  A, $f0                                        ;; 00:1fbb $e6 $f0
    ret  NZ                                            ;; 00:1fbd $c0
    call call_00_211a                                  ;; 00:1fbe $cd $1a $21
    ret                                                ;; 00:1fc1 $c9

call_00_1fc2:
    ld   A, [wC5B7]                                    ;; 00:1fc2 $fa $b7 $c5
    add  A, A                                          ;; 00:1fc5 $87
    add  A, A                                          ;; 00:1fc6 $87
    add  A, A                                          ;; 00:1fc7 $87
    ld   L, A                                          ;; 00:1fc8 $6f
    ld   H, $00                                        ;; 00:1fc9 $26 $00
    ld   DE, $200d                                     ;; 00:1fcb $11 $0d $20
    ld   A, [wCCC1]                                    ;; 00:1fce $fa $c1 $cc
    or   A, A                                          ;; 00:1fd1 $b7
    jr   Z, .jr_00_1fd7                                ;; 00:1fd2 $28 $03
    ld   DE, $202d                                     ;; 00:1fd4 $11 $2d $20
.jr_00_1fd7:
    add  HL, DE                                        ;; 00:1fd7 $19
    ld   E, L                                          ;; 00:1fd8 $5d
    ld   D, H                                          ;; 00:1fd9 $54
    ld   HL, wC002                                     ;; 00:1fda $21 $02 $c0
    ld   B, $04                                        ;; 00:1fdd $06 $04
.jr_00_1fdf:
    ld   A, [DE]                                       ;; 00:1fdf $1a
    ld   C, A                                          ;; 00:1fe0 $4f
    and  A, $0f                                        ;; 00:1fe1 $e6 $0f
    ld   [HL+], A                                      ;; 00:1fe3 $22
    ld   A, C                                          ;; 00:1fe4 $79
    and  A, $f0                                        ;; 00:1fe5 $e6 $f0
    ld   C, A                                          ;; 00:1fe7 $4f
    ld   A, [HL]                                       ;; 00:1fe8 $7e
    and  A, $df                                        ;; 00:1fe9 $e6 $df
    or   A, C                                          ;; 00:1feb $b1
    ld   [HL+], A                                      ;; 00:1fec $22
    inc  DE                                            ;; 00:1fed $13
    inc  L                                             ;; 00:1fee $2c
    inc  L                                             ;; 00:1fef $2c
    dec  B                                             ;; 00:1ff0 $05
    jr   NZ, .jr_00_1fdf                               ;; 00:1ff1 $20 $ec
    ld   HL, wC102                                     ;; 00:1ff3 $21 $02 $c1
    ld   B, $04                                        ;; 00:1ff6 $06 $04
.jr_00_1ff8:
    ld   A, [DE]                                       ;; 00:1ff8 $1a
    ld   C, A                                          ;; 00:1ff9 $4f
    and  A, $0f                                        ;; 00:1ffa $e6 $0f
    ld   [HL+], A                                      ;; 00:1ffc $22
    ld   A, C                                          ;; 00:1ffd $79
    and  A, $f0                                        ;; 00:1ffe $e6 $f0
    ld   C, A                                          ;; 00:2000 $4f
    ld   A, [HL]                                       ;; 00:2001 $7e
    and  A, $df                                        ;; 00:2002 $e6 $df
    or   A, C                                          ;; 00:2004 $b1
    ld   [HL+], A                                      ;; 00:2005 $22
    inc  DE                                            ;; 00:2006 $13
    inc  L                                             ;; 00:2007 $2c
    inc  L                                             ;; 00:2008 $2c
    dec  B                                             ;; 00:2009 $05
    jr   NZ, .jr_00_1ff8                               ;; 00:200a $20 $ec
    ret                                                ;; 00:200c $c9
    db   $00, $01, $02, $03, $21, $20, $23, $22        ;; 00:200d ????????
    db   $04, $05, $06, $07, $25, $24, $27, $26        ;; 00:2015 ????????
    db   $08, $09, $0a, $0b, $2d, $2c, $2f, $2e        ;; 00:201d ????????
    db   $29, $28, $2b, $2a, $0c, $0d, $0e, $0f        ;; 00:2025 ????????
    db   $00, $20, $01, $21, $02, $22, $03, $23        ;; 00:202d ????????
    db   $04, $24, $05, $25, $06, $26, $07, $27        ;; 00:2035 ????????
    db   $08, $09, $0a, $0b, $2d, $2c, $2f, $2e        ;; 00:203d ????????
    db   $29, $28, $2b, $2a, $0c, $0d, $0e, $0f        ;; 00:2045 ????????
    db   $00, $00, $01, $02, $03, $20, $01, $00        ;; 00:204d ????????
    db   $03, $02, $00, $04, $05, $06, $07, $20        ;; 00:2055 ????????
    db   $05, $04, $07, $06, $00, $08, $09, $0a        ;; 00:205d ????????
    db   $0b, $20, $0d, $0c, $0f, $0e, $20, $09        ;; 00:2065 ????????
    db   $08, $0b, $0a, $00, $0c, $0d, $0e, $0f        ;; 00:206d ????????
    db   $00, $00, $01, $02, $03, $00, $00, $01        ;; 00:2075 ????????
    db   $02, $03, $00, $04, $05, $06, $07, $00        ;; 00:207d ????????
    db   $04, $05, $06, $07, $00, $08, $09, $0a        ;; 00:2085 ????????
    db   $0b, $00, $08, $09, $0a, $0b, $00, $0c        ;; 00:208d ????????
    db   $0d, $0e, $0f, $00, $0c, $0d, $0e, $0f        ;; 00:2095 ????????

call_00_209d:
    ld   HL, $245e                                     ;; 00:209d $21 $5e $24
    ld   B, $04                                        ;; 00:20a0 $06 $04
    ld   C, $80                                        ;; 00:20a2 $0e $80
.jr_00_20a4:
    ldh  A, [hFF8D]                                    ;; 00:20a4 $f0 $8d
    and  A, C                                          ;; 00:20a6 $a1
    jr   NZ, call_00_20b1                              ;; 00:20a7 $20 $08
    inc  HL                                            ;; 00:20a9 $23
    inc  HL                                            ;; 00:20aa $23
    srl  C                                             ;; 00:20ab $cb $39
    dec  B                                             ;; 00:20ad $05
    jr   NZ, .jr_00_20a4                               ;; 00:20ae $20 $f4
    ret                                                ;; 00:20b0 $c9

call_00_20b1:
    push HL                                            ;; 00:20b1 $e5
    ld   A, [wCCC8]                                    ;; 00:20b2 $fa $c8 $cc
    add  A, [HL]                                       ;; 00:20b5 $86
    cp   A, $3e                                        ;; 00:20b6 $fe $3e
    jr   NC, .jr_00_20d1                               ;; 00:20b8 $30 $17
    ld   E, A                                          ;; 00:20ba $5f
    inc  HL                                            ;; 00:20bb $23
    ld   A, [wCCC9]                                    ;; 00:20bc $fa $c9 $cc
    add  A, [HL]                                       ;; 00:20bf $86
    cp   A, $40                                        ;; 00:20c0 $fe $40
    jr   NC, .jr_00_20d1                               ;; 00:20c2 $30 $0d
    ld   D, A                                          ;; 00:20c4 $57
    push BC                                            ;; 00:20c5 $c5
    call call_00_1f67                                  ;; 00:20c6 $cd $67 $1f
    pop  BC                                            ;; 00:20c9 $c1
    jr   NZ, .jr_00_20d3                               ;; 00:20ca $20 $07
    call call_00_13fa                                  ;; 00:20cc $cd $fa $13
    jr   Z, .jr_00_2105                                ;; 00:20cf $28 $34
.jr_00_20d1:
    jr   .jr_00_2110                                   ;; 00:20d1 $18 $3d
.jr_00_20d3:
    ld   A, L                                          ;; 00:20d3 $7d
    ld   [wC5BD], A                                    ;; 00:20d4 $ea $bd $c5
    ld   A, H                                          ;; 00:20d7 $7c
    ld   [wC5BE], A                                    ;; 00:20d8 $ea $be $c5
    inc  L                                             ;; 00:20db $2c
    inc  L                                             ;; 00:20dc $2c
    inc  L                                             ;; 00:20dd $2c
    inc  L                                             ;; 00:20de $2c
    bit  6, [HL]                                       ;; 00:20df $cb $76
    jr   Z, .jr_00_2110                                ;; 00:20e1 $28 $2d
    ld   A, [wCCC1]                                    ;; 00:20e3 $fa $c1 $cc
    or   A, A                                          ;; 00:20e6 $b7
    jr   NZ, .jr_00_2110                               ;; 00:20e7 $20 $27
    dec  L                                             ;; 00:20e9 $2d
    ld   A, [HL-]                                      ;; 00:20ea $3a
    ld   [wC3AA], A                                    ;; 00:20eb $ea $aa $c3
    ld   A, [HL]                                       ;; 00:20ee $7e
    ld   [wC3A9], A                                    ;; 00:20ef $ea $a9 $c3
    cp   A, $10                                        ;; 00:20f2 $fe $10
    ld   A, $01                                        ;; 00:20f4 $3e $01
    jr   C, .jr_00_2100                                ;; 00:20f6 $38 $08
    ld   A, $03                                        ;; 00:20f8 $3e $03
    ld   [wC3A9], A                                    ;; 00:20fa $ea $a9 $c3
    ld   A, [HL]                                       ;; 00:20fd $7e
    sub  A, $10                                        ;; 00:20fe $d6 $10
.jr_00_2100:
    ld   [wC3AB], A                                    ;; 00:2100 $ea $ab $c3
    jr   .jr_00_2110                                   ;; 00:2103 $18 $0b
.jr_00_2105:
    bit  6, E                                          ;; 00:2105 $cb $73
    jr   NZ, .jr_00_2110                               ;; 00:2107 $20 $07
    call call_00_211a                                  ;; 00:2109 $cd $1a $21
    ld   A, C                                          ;; 00:210c $79
    ld   [wC5B1], A                                    ;; 00:210d $ea $b1 $c5
.jr_00_2110:
    pop  HL                                            ;; 00:2110 $e1
    ld   A, $04                                        ;; 00:2111 $3e $04
    sub  A, B                                          ;; 00:2113 $90
    ld   [wC5B7], A                                    ;; 00:2114 $ea $b7 $c5
    jp   call_00_1fc2                                  ;; 00:2117 $c3 $c2 $1f

call_00_211a:
    ld   A, [wCCC1]                                    ;; 00:211a $fa $c1 $cc
    or   A, A                                          ;; 00:211d $b7
    ret  NZ                                            ;; 00:211e $c0
    ld   HL, wC003                                     ;; 00:211f $21 $03 $c0
    ld   A, E                                          ;; 00:2122 $7b
    and  A, $e0                                        ;; 00:2123 $e6 $e0
    jr   NZ, .jr_00_213b                               ;; 00:2125 $20 $14
    bit  5, D                                          ;; 00:2127 $cb $6a
    jr   Z, .jr_00_213b                                ;; 00:2129 $28 $10
    set  7, [HL]                                       ;; 00:212b $cb $fe
    set  2, L                                          ;; 00:212d $cb $d5
    set  7, [HL]                                       ;; 00:212f $cb $fe
    set  0, H                                          ;; 00:2131 $cb $c4
    set  7, [HL]                                       ;; 00:2133 $cb $fe
    res  2, L                                          ;; 00:2135 $cb $95
    set  7, [HL]                                       ;; 00:2137 $cb $fe
    jr   .jr_00_2149                                   ;; 00:2139 $18 $0e
.jr_00_213b:
    res  7, [HL]                                       ;; 00:213b $cb $be
    set  2, L                                          ;; 00:213d $cb $d5
    res  7, [HL]                                       ;; 00:213f $cb $be
    set  0, H                                          ;; 00:2141 $cb $c4
    res  7, [HL]                                       ;; 00:2143 $cb $be
    res  2, L                                          ;; 00:2145 $cb $95
    res  7, [HL]                                       ;; 00:2147 $cb $be
.jr_00_2149:
    ld   HL, wC00B                                     ;; 00:2149 $21 $0b $c0
    ld   A, E                                          ;; 00:214c $7b
    and  A, $e0                                        ;; 00:214d $e6 $e0
    jr   NZ, .jr_00_2164                               ;; 00:214f $20 $13
    bit  4, D                                          ;; 00:2151 $cb $62
    jr   Z, .jr_00_2164                                ;; 00:2153 $28 $0f
    set  7, [HL]                                       ;; 00:2155 $cb $fe
    set  2, L                                          ;; 00:2157 $cb $d5
    set  7, [HL]                                       ;; 00:2159 $cb $fe
    set  0, H                                          ;; 00:215b $cb $c4
    set  7, [HL]                                       ;; 00:215d $cb $fe
    res  2, L                                          ;; 00:215f $cb $95
    set  7, [HL]                                       ;; 00:2161 $cb $fe
    ret                                                ;; 00:2163 $c9
.jr_00_2164:
    res  7, [HL]                                       ;; 00:2164 $cb $be
    set  2, L                                          ;; 00:2166 $cb $d5
    res  7, [HL]                                       ;; 00:2168 $cb $be
    set  0, H                                          ;; 00:216a $cb $c4
    res  7, [HL]                                       ;; 00:216c $cb $be
    res  2, L                                          ;; 00:216e $cb $95
    res  7, [HL]                                       ;; 00:2170 $cb $be
    ret                                                ;; 00:2172 $c9

call_00_2173:
    ld   A, [wC5B3]                                    ;; 00:2173 $fa $b3 $c5
    ld   [wC5B2], A                                    ;; 00:2176 $ea $b2 $c5
    xor  A, A                                          ;; 00:2179 $af
    ld   [wC5B8], A                                    ;; 00:217a $ea $b8 $c5
    call call_00_13e7                                  ;; 00:217d $cd $e7 $13
    ld   A, E                                          ;; 00:2180 $7b
    rlca                                               ;; 00:2181 $07
    jp   C, jp_00_2237                                 ;; 00:2182 $da $37 $22
    rlca                                               ;; 00:2185 $07
    ret  C                                             ;; 00:2186 $d8
    rlca                                               ;; 00:2187 $07
    ret  C                                             ;; 00:2188 $d8
    ld   A, D                                          ;; 00:2189 $7a
    and  A, $c0                                        ;; 00:218a $e6 $c0
    push DE                                            ;; 00:218c $d5
    call NZ, call_00_2266                              ;; 00:218d $c4 $66 $22
    pop  DE                                            ;; 00:2190 $d1
    bit  2, E                                          ;; 00:2191 $cb $53
    jr   Z, .jr_00_21f7                                ;; 00:2193 $28 $62
    ld   A, E                                          ;; 00:2195 $7b
    and  A, $03                                        ;; 00:2196 $e6 $03
    ld   C, A                                          ;; 00:2198 $4f
    inc  C                                             ;; 00:2199 $0c
    ld   A, $01                                        ;; 00:219a $3e $01
    ld   HL, $245c                                     ;; 00:219c $21 $5c $24
.jr_00_219f:
    rrca                                               ;; 00:219f $0f
    inc  HL                                            ;; 00:21a0 $23
    inc  HL                                            ;; 00:21a1 $23
    dec  C                                             ;; 00:21a2 $0d
    jr   NZ, .jr_00_219f                               ;; 00:21a3 $20 $fa
    ld   C, A                                          ;; 00:21a5 $4f
    ld   A, [wC5B1]                                    ;; 00:21a6 $fa $b1 $c5
    or   A, A                                          ;; 00:21a9 $b7
    jr   Z, .jr_00_21cb                                ;; 00:21aa $28 $1f
    cp   A, C                                          ;; 00:21ac $b9
    jr   NZ, .jr_00_21b7                               ;; 00:21ad $20 $08
    ld   A, [wC5B2]                                    ;; 00:21af $fa $b2 $c5
    cp   A, $02                                        ;; 00:21b2 $fe $02
    ret  NC                                            ;; 00:21b4 $d0
    jr   .jr_00_21cb                                   ;; 00:21b5 $18 $14
.jr_00_21b7:
    ld   A, [wC5B1]                                    ;; 00:21b7 $fa $b1 $c5
    or   A, A                                          ;; 00:21ba $b7
    jr   Z, .jr_00_21cb                                ;; 00:21bb $28 $0e
    or   A, C                                          ;; 00:21bd $b1
    cp   A, $c0                                        ;; 00:21be $fe $c0
    jr   Z, .jr_00_21c5                                ;; 00:21c0 $28 $03
    cp   A, $30                                        ;; 00:21c2 $fe $30
    ret  NZ                                            ;; 00:21c4 $c0
.jr_00_21c5:
    ld   A, [wC5B2]                                    ;; 00:21c5 $fa $b2 $c5
    cp   A, $03                                        ;; 00:21c8 $fe $03
    ret  NC                                            ;; 00:21ca $d0
.jr_00_21cb:
    ld   A, E                                          ;; 00:21cb $7b
    and  A, $03                                        ;; 00:21cc $e6 $03
    ld   [wC5B7], A                                    ;; 00:21ce $ea $b7 $c5
    ld   A, [wCCC8]                                    ;; 00:21d1 $fa $c8 $cc
    add  A, [HL]                                       ;; 00:21d4 $86
    cp   A, $3e                                        ;; 00:21d5 $fe $3e
    ret  NC                                            ;; 00:21d7 $d0
    ld   E, A                                          ;; 00:21d8 $5f
    inc  HL                                            ;; 00:21d9 $23
    ld   A, [wCCC9]                                    ;; 00:21da $fa $c9 $cc
    add  A, [HL]                                       ;; 00:21dd $86
    cp   A, $40                                        ;; 00:21de $fe $40
    ret  NC                                            ;; 00:21e0 $d0
    ld   D, A                                          ;; 00:21e1 $57
    call call_00_13ed                                  ;; 00:21e2 $cd $ed $13
    call call_00_211a                                  ;; 00:21e5 $cd $1a $21
    ld   A, C                                          ;; 00:21e8 $79
    ld   [wC5B1], A                                    ;; 00:21e9 $ea $b1 $c5
    ld   [wC5B8], A                                    ;; 00:21ec $ea $b8 $c5
    ld   A, $02                                        ;; 00:21ef $3e $02
    ld   [wC5B2], A                                    ;; 00:21f1 $ea $b2 $c5
    jp   call_00_1fc2                                  ;; 00:21f4 $c3 $c2 $1f
.jr_00_21f7:
    ld   A, E                                          ;; 00:21f7 $7b
    and  A, $03                                        ;; 00:21f8 $e6 $03
    ret  Z                                             ;; 00:21fa $c8
    ld   E, A                                          ;; 00:21fb $5f
    ldh  A, [hFFFD]                                    ;; 00:21fc $f0 $fd
    or   A, A                                          ;; 00:21fe $b7
    ret  NZ                                            ;; 00:21ff $c0
    inc  A                                             ;; 00:2200 $3c
    ldh  [hFFFD], A                                    ;; 00:2201 $e0 $fd
    ld   D, $00                                        ;; 00:2203 $16 $00
    ld   BC, wCC00                                     ;; 00:2205 $01 $00 $cc
    ld   A, $04                                        ;; 00:2208 $3e $04
.jr_00_220a:
    push AF                                            ;; 00:220a $f5
    ld   A, [BC]                                       ;; 00:220b $0a
    and  A, $03                                        ;; 00:220c $e6 $03
    jr   NZ, .jr_00_2215                               ;; 00:220e $20 $05
    push BC                                            ;; 00:2210 $c5
    call call_00_221e                                  ;; 00:2211 $cd $1e $22
    pop  BC                                            ;; 00:2214 $c1
.jr_00_2215:
    ld   A, C                                          ;; 00:2215 $79
    add  A, $1f                                        ;; 00:2216 $c6 $1f
    ld   C, A                                          ;; 00:2218 $4f
    pop  AF                                            ;; 00:2219 $f1
    dec  A                                             ;; 00:221a $3d
    jr   NZ, .jr_00_220a                               ;; 00:221b $20 $ed
    ret                                                ;; 00:221d $c9

call_00_221e:
    ld   A, C                                          ;; 00:221e $79
    add  A, $06                                        ;; 00:221f $c6 $06
    ld   C, A                                          ;; 00:2221 $4f
    ld   A, [BC]                                       ;; 00:2222 $0a
    ld   L, A                                          ;; 00:2223 $6f
    inc  C                                             ;; 00:2224 $0c
    ld   A, [BC]                                       ;; 00:2225 $0a
    ld   H, A                                          ;; 00:2226 $67
    call call_00_015c                                  ;; 00:2227 $cd $5c $01
    jr   Z, .jr_00_222e                                ;; 00:222a $28 $02
    jr   NC, .jr_00_2231                               ;; 00:222c $30 $03
.jr_00_222e:
    ld   HL, $01                                       ;; 00:222e $21 $01 $00
.jr_00_2231:
    ld   A, H                                          ;; 00:2231 $7c
    ld   [BC], A                                       ;; 00:2232 $02
    dec  C                                             ;; 00:2233 $0d
    ld   A, L                                          ;; 00:2234 $7d
    ld   [BC], A                                       ;; 00:2235 $02
    ret                                                ;; 00:2236 $c9

jp_00_2237:
    ldh  A, [hFFFE]                                    ;; 00:2237 $f0 $fe
    or   A, A                                          ;; 00:2239 $b7
    ret  NZ                                            ;; 00:223a $c0
    ld   A, $01                                        ;; 00:223b $3e $01
    ldh  [hFFFE], A                                    ;; 00:223d $e0 $fe
    ld   A, D                                          ;; 00:223f $7a
    ld   [wC3AA], A                                    ;; 00:2240 $ea $aa $c3
    ld   A, E                                          ;; 00:2243 $7b
    and  A, $0f                                        ;; 00:2244 $e6 $0f
    call call_00_3b29                                  ;; 00:2246 $cd $29 $3b
    ret                                                ;; 00:2249 $c9

call_00_224a:
    ld   A, [wC5BA]                                    ;; 00:224a $fa $ba $c5
    or   A, A                                          ;; 00:224d $b7
    ret  NZ                                            ;; 00:224e $c0
    ld   A, E                                          ;; 00:224f $7b
    and  A, $01                                        ;; 00:2250 $e6 $01
    ld   L, D                                          ;; 00:2252 $6a
    ld   H, A                                          ;; 00:2253 $67
    ld   A, E                                          ;; 00:2254 $7b
    ld   C, L                                          ;; 00:2255 $4d
    ld   B, H                                          ;; 00:2256 $44
    add  HL, HL                                        ;; 00:2257 $29
    add  HL, BC                                        ;; 00:2258 $09
    ld   BC, $52d0                                     ;; 00:2259 $01 $d0 $52
    add  HL, BC                                        ;; 00:225c $09
    ld   A, L                                          ;; 00:225d $7d
    ld   [wC5BF], A                                    ;; 00:225e $ea $bf $c5
    ld   A, H                                          ;; 00:2261 $7c
    ld   [wC5C0], A                                    ;; 00:2262 $ea $c0 $c5
    ret                                                ;; 00:2265 $c9

call_00_2266:
    rlca                                               ;; 00:2266 $07
    rlca                                               ;; 00:2267 $07
    ld   L, A                                          ;; 00:2268 $6f
    ld   H, $00                                        ;; 00:2269 $26 $00
    ldh  A, [hFFFE]                                    ;; 00:226b $f0 $fe
    or   A, A                                          ;; 00:226d $b7
    ret  NZ                                            ;; 00:226e $c0
    ld   A, $01                                        ;; 00:226f $3e $01
    ldh  [hFFFE], A                                    ;; 00:2271 $e0 $fe
    ld   DE, wC5C2                                     ;; 00:2273 $11 $c2 $c5
    add  HL, DE                                        ;; 00:2276 $19
    ld   A, [HL]                                       ;; 00:2277 $7e
    cp   A, $ff                                        ;; 00:2278 $fe $ff
    ret  Z                                             ;; 00:227a $c8
    ld   L, A                                          ;; 00:227b $6f
    ld   H, $00                                        ;; 00:227c $26 $00
    add  HL, HL                                        ;; 00:227e $29
    add  HL, HL                                        ;; 00:227f $29
    add  HL, HL                                        ;; 00:2280 $29
    ld   A, $06                                        ;; 00:2281 $3e $06
    rst  switchBank                                    ;; 00:2283 $ef
    ld   DE, $6400                                     ;; 00:2284 $11 $00 $64
    add  HL, DE                                        ;; 00:2287 $19
    ld   A, [wC5B3]                                    ;; 00:2288 $fa $b3 $c5
    dec  A                                             ;; 00:228b $3d
    add  A, A                                          ;; 00:228c $87
    add  A, A                                          ;; 00:228d $87
    add  A, A                                          ;; 00:228e $87
    add  A, [HL]                                       ;; 00:228f $86
    jr   NC, .jr_00_2294                               ;; 00:2290 $30 $02
    ld   A, $ff                                        ;; 00:2292 $3e $ff
.jr_00_2294:
    ld   E, A                                          ;; 00:2294 $5f
    xor  A, A                                          ;; 00:2295 $af
    call call_00_016b                                  ;; 00:2296 $cd $6b $01
    or   A, A                                          ;; 00:2299 $b7
    ret  NZ                                            ;; 00:229a $c0
    xor  A, A                                          ;; 00:229b $af
    ld   E, $ff                                        ;; 00:229c $1e $ff
    call call_00_016b                                  ;; 00:229e $cd $6b $01
    ld   E, L                                          ;; 00:22a1 $5d
    ld   D, H                                          ;; 00:22a2 $54
    ld   HL, $22b4                                     ;; 00:22a3 $21 $b4 $22
.jr_00_22a6:
    inc  HL                                            ;; 00:22a6 $23
    inc  DE                                            ;; 00:22a7 $13
    cp   A, [HL]                                       ;; 00:22a8 $be
    jr   C, .jr_00_22a6                                ;; 00:22a9 $38 $fb
    ld   A, [DE]                                       ;; 00:22ab $1a
    ld   [wC3AA], A                                    ;; 00:22ac $ea $aa $c3
    ld   A, $08                                        ;; 00:22af $3e $08
    call call_00_3b29                                  ;; 00:22b1 $cd $29 $3b
    ret                                                ;; 00:22b4 $c9
    db   $80, $40, $20, $10, $08, $04, $00             ;; 00:22b5 ???????

call_00_22bc:
    ld   L, A                                          ;; 00:22bc $6f
    ld   H, $00                                        ;; 00:22bd $26 $00
    add  HL, HL                                        ;; 00:22bf $29
    ld   DE, $58d0                                     ;; 00:22c0 $11 $d0 $58
    add  HL, DE                                        ;; 00:22c3 $19
    ld   A, $02                                        ;; 00:22c4 $3e $02
    rst  switchBank                                    ;; 00:22c6 $ef
    ld   A, [HL+]                                      ;; 00:22c7 $2a
    ld   H, [HL]                                       ;; 00:22c8 $66
    ld   L, A                                          ;; 00:22c9 $6f
    jr   jr_00_231b                                    ;; 00:22ca $18 $4f

call_00_22cc:
    ld   A, [wC5BF]                                    ;; 00:22cc $fa $bf $c5
    ld   L, A                                          ;; 00:22cf $6f
    ld   A, [wC5C0]                                    ;; 00:22d0 $fa $c0 $c5
    ld   H, A                                          ;; 00:22d3 $67
    or   A, L                                          ;; 00:22d4 $b5
    ret  Z                                             ;; 00:22d5 $c8
    ld   A, [wCCC7]                                    ;; 00:22d6 $fa $c7 $cc
    ld   [wCCC2], A                                    ;; 00:22d9 $ea $c2 $cc
    ld   A, [wCCC9]                                    ;; 00:22dc $fa $c9 $cc
    ld   [wCCC4], A                                    ;; 00:22df $ea $c4 $cc
    ld   A, [wCCC8]                                    ;; 00:22e2 $fa $c8 $cc
    ld   [wCCC3], A                                    ;; 00:22e5 $ea $c3 $cc
    ld   A, $02                                        ;; 00:22e8 $3e $02
    rst  switchBank                                    ;; 00:22ea $ef
    ld   A, [HL+]                                      ;; 00:22eb $2a
    or   A, A                                          ;; 00:22ec $b7
    jr   Z, .jr_00_2301                                ;; 00:22ed $28 $12
    cp   A, $18                                        ;; 00:22ef $fe $18
    jr   NC, .jr_00_2301                               ;; 00:22f1 $30 $0e
    ld   [wCCC6], A                                    ;; 00:22f3 $ea $c6 $cc
    ld   C, A                                          ;; 00:22f6 $4f
    ld   A, [wCCC5]                                    ;; 00:22f7 $fa $c5 $cc
    cp   A, C                                          ;; 00:22fa $b9
    ld   A, C                                          ;; 00:22fb $79
    jr   NC, .jr_00_2301                               ;; 00:22fc $30 $03
    ld   [wCCC5], A                                    ;; 00:22fe $ea $c5 $cc
.jr_00_2301:
    ld   [wCCC7], A                                    ;; 00:2301 $ea $c7 $cc
    push HL                                            ;; 00:2304 $e5
    ld   L, A                                          ;; 00:2305 $6f
    ld   H, $00                                        ;; 00:2306 $26 $00
    add  HL, HL                                        ;; 00:2308 $29
    ld   DE, $58d0                                     ;; 00:2309 $11 $d0 $58
    add  HL, DE                                        ;; 00:230c $19
    ld   E, [HL]                                       ;; 00:230d $5e
    inc  HL                                            ;; 00:230e $23
    ld   D, [HL]                                       ;; 00:230f $56
    pop  HL                                            ;; 00:2310 $e1
    ld   A, [HL+]                                      ;; 00:2311 $2a
    ld   [wCCC9], A                                    ;; 00:2312 $ea $c9 $cc
    ld   A, [HL]                                       ;; 00:2315 $7e
    ld   [wCCC8], A                                    ;; 00:2316 $ea $c8 $cc
    ld   L, E                                          ;; 00:2319 $6b
    ld   H, D                                          ;; 00:231a $62

jr_00_231b:
    push HL                                            ;; 00:231b $e5
    call call_00_23ef                                  ;; 00:231c $cd $ef $23
    pop  HL                                            ;; 00:231f $e1
    ld   A, [HL+]                                      ;; 00:2320 $2a
    ldh  [hFFF8], A                                    ;; 00:2321 $e0 $f8
    ld   A, [HL+]                                      ;; 00:2323 $2a
    ldh  [hFFF9], A                                    ;; 00:2324 $e0 $f9
    call call_00_3dcf                                  ;; 00:2326 $cd $cf $3d
    ld   A, [HL+]                                      ;; 00:2329 $2a
    ld   [wC5B9], A                                    ;; 00:232a $ea $b9 $c5
    push HL                                            ;; 00:232d $e5
    call call_00_3f97                                  ;; 00:232e $cd $97 $3f
    pop  HL                                            ;; 00:2331 $e1
    ld   A, [HL+]                                      ;; 00:2332 $2a
    ld   [wC5C9], A                                    ;; 00:2333 $ea $c9 $c5
    ld   A, [HL+]                                      ;; 00:2336 $2a
    push HL                                            ;; 00:2337 $e5
    ld   H, [HL]                                       ;; 00:2338 $66
    ld   L, A                                          ;; 00:2339 $6f
    call call_00_153c                                  ;; 00:233a $cd $3c $15
    pop  HL                                            ;; 00:233d $e1
    ld   A, $02                                        ;; 00:233e $3e $02
    rst  switchBank                                    ;; 00:2340 $ef
    ld   A, [wC5C9]                                    ;; 00:2341 $fa $c9 $c5
    call call_00_2403                                  ;; 00:2344 $cd $03 $24
    inc  HL                                            ;; 00:2347 $23
    ld   A, [HL+]                                      ;; 00:2348 $2a
    ld   [wC5E2], A                                    ;; 00:2349 $ea $e2 $c5
    ld   B, A                                          ;; 00:234c $47
    ld   A, [HL+]                                      ;; 00:234d $2a
    ld_long_store hFFE0, A                             ;; 00:234e $ea $e0 $ff
    call call_00_2616                                  ;; 00:2351 $cd $16 $26
    rlc  B                                             ;; 00:2354 $cb $00
    jr   C, .jr_00_2373                                ;; 00:2356 $38 $1b
    push BC                                            ;; 00:2358 $c5
    ld   A, [HL+]                                      ;; 00:2359 $2a
    push HL                                            ;; 00:235a $e5
    ldh  [hFFFA], A                                    ;; 00:235b $e0 $fa
    call call_00_24f8                                  ;; 00:235d $cd $f8 $24
    pop  HL                                            ;; 00:2360 $e1
    ld   A, $02                                        ;; 00:2361 $3e $02
    rst  switchBank                                    ;; 00:2363 $ef
    ld   A, [HL+]                                      ;; 00:2364 $2a
    push HL                                            ;; 00:2365 $e5
    ldh  [hFFFB], A                                    ;; 00:2366 $e0 $fb
    ld   D, [HL]                                       ;; 00:2368 $56
    ld   E, A                                          ;; 00:2369 $5f
    ld   A, D                                          ;; 00:236a $7a
    ldh  [hFFFC], A                                    ;; 00:236b $e0 $fc
    call call_00_2586                                  ;; 00:236d $cd $86 $25
    pop  HL                                            ;; 00:2370 $e1
    inc  HL                                            ;; 00:2371 $23
    pop  BC                                            ;; 00:2372 $c1
.jr_00_2373:
    ld   A, $02                                        ;; 00:2373 $3e $02
    rst  switchBank                                    ;; 00:2375 $ef
    ld   DE, wC5C3                                     ;; 00:2376 $11 $c3 $c5
    ld   C, $03                                        ;; 00:2379 $0e $03
.jr_00_237b:
    rlc  B                                             ;; 00:237b $cb $00
    ld   A, $ff                                        ;; 00:237d $3e $ff
    jr   C, .jr_00_2382                                ;; 00:237f $38 $01
    ld   A, [HL+]                                      ;; 00:2381 $2a
.jr_00_2382:
    ld   [DE], A                                       ;; 00:2382 $12
    inc  DE                                            ;; 00:2383 $13
    dec  C                                             ;; 00:2384 $0d
    jr   NZ, .jr_00_237b                               ;; 00:2385 $20 $f4
    swap B                                             ;; 00:2387 $cb $30
    ld   A, B                                          ;; 00:2389 $78
    and  A, $03                                        ;; 00:238a $e6 $03
    ld   [wC5BB], A                                    ;; 00:238c $ea $bb $c5
    xor  A, A                                          ;; 00:238f $af
    ld   [wC5BC], A                                    ;; 00:2390 $ea $bc $c5
    call call_00_2554                                  ;; 00:2393 $cd $54 $25
    call call_00_14b0                                  ;; 00:2396 $cd $b0 $14
.jr_00_2399:
    ldh  A, [rLY]                                      ;; 00:2399 $f0 $44
    cp   A, $91                                        ;; 00:239b $fe $91
    jr   NZ, .jr_00_2399                               ;; 00:239d $20 $fa
    call call_00_23fe                                  ;; 00:239f $cd $fe $23
    call call_00_1c80                                  ;; 00:23a2 $cd $80 $1c
    call call_00_1d26                                  ;; 00:23a5 $cd $26 $1d
    rst  rst_00_0010                                   ;; 00:23a8 $d7
    rst  rst_00_0018                                   ;; 00:23a9 $df
    call call_00_3de0                                  ;; 00:23aa $cd $e0 $3d
    ld   A, [wC3A9]                                    ;; 00:23ad $fa $a9 $c3
    and  A, $01                                        ;; 00:23b0 $e6 $01
    jr   NZ, .jr_00_23be                               ;; 00:23b2 $20 $0a
    ld   A, [wC3AA]                                    ;; 00:23b4 $fa $aa $c3
    inc  A                                             ;; 00:23b7 $3c
    jr   NZ, .jr_00_23be                               ;; 00:23b8 $20 $04
    ld   A, $80                                        ;; 00:23ba $3e $80
    jr   .jr_00_23bf                                   ;; 00:23bc $18 $01
.jr_00_23be:
    xor  A, A                                          ;; 00:23be $af
.jr_00_23bf:
    ld   [wC5B1], A                                    ;; 00:23bf $ea $b1 $c5
    xor  A, A                                          ;; 00:23c2 $af
    ld   [wC5CA], A                                    ;; 00:23c3 $ea $ca $c5
    ld   [wC5B0], A                                    ;; 00:23c6 $ea $b0 $c5
    ld   [wC5B6], A                                    ;; 00:23c9 $ea $b6 $c5
    ld   [wC3AB], A                                    ;; 00:23cc $ea $ab $c3
    ld   [wC5BF], A                                    ;; 00:23cf $ea $bf $c5
    ld   [wC5C0], A                                    ;; 00:23d2 $ea $c0 $c5
    ldh  [hFFFE], A                                    ;; 00:23d5 $e0 $fe
    ldh  [hFFFD], A                                    ;; 00:23d7 $e0 $fd
    inc  A                                             ;; 00:23d9 $3c
    ld   [wC5BA], A                                    ;; 00:23da $ea $ba $c5
    ld   HL, $9c21                                     ;; 00:23dd $21 $21 $9c
    call call_00_34bb                                  ;; 00:23e0 $cd $bb $34
    call call_00_13e7                                  ;; 00:23e3 $cd $e7 $13
    call call_00_211a                                  ;; 00:23e6 $cd $1a $21
    ld   A, $07                                        ;; 00:23e9 $3e $07
    ld   [wC5CC], A                                    ;; 00:23eb $ea $cc $c5
    ret                                                ;; 00:23ee $c9

call_00_23ef:
    ld   A, [wCCC1]                                    ;; 00:23ef $fa $c1 $cc
    ld   HL, $245a                                     ;; 00:23f2 $21 $5a $24
    rst  add_hl_a                                      ;; 00:23f5 $c7
    ld   A, [HL]                                       ;; 00:23f6 $7e
    ld   [wC5B2], A                                    ;; 00:23f7 $ea $b2 $c5
    ld   [wC5B3], A                                    ;; 00:23fa $ea $b3 $c5
    ret                                                ;; 00:23fd $c9

call_00_23fe:
    ld   A, $e3                                        ;; 00:23fe $3e $e3
    ldh  [rLCDC], A                                    ;; 00:2400 $e0 $40
    ret                                                ;; 00:2402 $c9

call_00_2403:
    ld   C, $00                                        ;; 00:2403 $0e $00
    srl  A                                             ;; 00:2405 $cb $3f
    rr   C                                             ;; 00:2407 $cb $19
    srl  A                                             ;; 00:2409 $cb $3f
    rr   C                                             ;; 00:240b $cb $19
    ld   B, A                                          ;; 00:240d $47
    push HL                                            ;; 00:240e $e5
    ld   A, $02                                        ;; 00:240f $3e $02
    rst  switchBank                                    ;; 00:2411 $ef
    ld   HL, $4840                                     ;; 00:2412 $21 $40 $48
    add  HL, BC                                        ;; 00:2415 $09
    ld   DE, wDF80                                     ;; 00:2416 $11 $80 $df
    ld   B, $40                                        ;; 00:2419 $06 $40
    call call_00_008f                                  ;; 00:241b $cd $8f $00
    ld   HL, wCC99                                     ;; 00:241e $21 $99 $cc
    ld   A, [wCCC7]                                    ;; 00:2421 $fa $c7 $cc
    ld   C, A                                          ;; 00:2424 $4f
    ld   B, $03                                        ;; 00:2425 $06 $03
.jr_00_2427:
    ld   A, [HL+]                                      ;; 00:2427 $2a
    or   A, A                                          ;; 00:2428 $b7
    jr   Z, .jr_00_242e                                ;; 00:2429 $28 $03
    cp   A, C                                          ;; 00:242b $b9
    jr   Z, .jr_00_2436                                ;; 00:242c $28 $08
.jr_00_242e:
    inc  L                                             ;; 00:242e $2c
    inc  L                                             ;; 00:242f $2c
    inc  L                                             ;; 00:2430 $2c
    dec  B                                             ;; 00:2431 $05
    jr   NZ, .jr_00_2427                               ;; 00:2432 $20 $f3
    jr   .jr_00_2458                                   ;; 00:2434 $18 $22
.jr_00_2436:
    ld   E, [HL]                                       ;; 00:2436 $5e
    inc  L                                             ;; 00:2437 $2c
    ld   A, [wCCC1]                                    ;; 00:2438 $fa $c1 $cc
    or   A, A                                          ;; 00:243b $b7
    jr   NZ, .jr_00_2445                               ;; 00:243c $20 $07
    ld   D, [HL]                                       ;; 00:243e $56
    call call_00_13b0                                  ;; 00:243f $cd $b0 $13
    ld   A, $1f                                        ;; 00:2442 $3e $1f
    ld   [DE], A                                       ;; 00:2444 $12
.jr_00_2445:
    inc  L                                             ;; 00:2445 $2c
    ld   A, $04                                        ;; 00:2446 $3e $04
    sub  A, B                                          ;; 00:2448 $90
    ld   B, A                                          ;; 00:2449 $47
    rrc  B                                             ;; 00:244a $cb $08
    rrc  B                                             ;; 00:244c $cb $08
    ld   A, [HL]                                       ;; 00:244e $7e
    or   A, B                                          ;; 00:244f $b0
    ld   [wDFBF], A                                    ;; 00:2450 $ea $bf $df
    ld   A, $8c                                        ;; 00:2453 $3e $8c
    ld   [wDFBE], A                                    ;; 00:2455 $ea $be $df
.jr_00_2458:
    pop  HL                                            ;; 00:2458 $e1
    ret                                                ;; 00:2459 $c9
    db   $01, $01, $04, $02, $01, $00, $ff, $00        ;; 00:245a ????????
    db   $00, $ff, $00, $01                            ;; 00:2462 ????

call_00_2466:
    ld   A, [wC3AB]                                    ;; 00:2466 $fa $ab $c3
    or   A, A                                          ;; 00:2469 $b7
    ret  NZ                                            ;; 00:246a $c0
    call call_00_0174                                  ;; 00:246b $cd $74 $01
    and  A, $0d                                        ;; 00:246e $e6 $0d
    ret  Z                                             ;; 00:2470 $c8
    push AF                                            ;; 00:2471 $f5
    xor  A, A                                          ;; 00:2472 $af
    ld   [wC5B1], A                                    ;; 00:2473 $ea $b1 $c5
    pop  AF                                            ;; 00:2476 $f1
    bit  3, A                                          ;; 00:2477 $cb $5f
    jp   NZ, jp_00_269d                                ;; 00:2479 $c2 $9d $26
    bit  2, A                                          ;; 00:247c $cb $57
    jp   NZ, jp_00_3bad                                ;; 00:247e $c2 $ad $3b
    ld   A, [wCCC1]                                    ;; 00:2481 $fa $c1 $cc
    or   A, A                                          ;; 00:2484 $b7
    jr   Z, .jr_00_2494                                ;; 00:2485 $28 $0d
    ld   A, $0c                                        ;; 00:2487 $3e $0c
    ld   [wC3A9], A                                    ;; 00:2489 $ea $a9 $c3
    ld   [wC3AB], A                                    ;; 00:248c $ea $ab $c3
    xor  A, A                                          ;; 00:248f $af
    ld   [wC3AA], A                                    ;; 00:2490 $ea $aa $c3
    ret                                                ;; 00:2493 $c9
.jr_00_2494:
    call call_00_3b68                                  ;; 00:2494 $cd $68 $3b
    call call_00_1f67                                  ;; 00:2497 $cd $67 $1f
    jr   Z, .jr_00_24c2                                ;; 00:249a $28 $26
    ld   A, L                                          ;; 00:249c $7d
    ld   [wC5BD], A                                    ;; 00:249d $ea $bd $c5
    ld   A, H                                          ;; 00:24a0 $7c
    ld   [wC5BE], A                                    ;; 00:24a1 $ea $be $c5
    ld   A, $03                                        ;; 00:24a4 $3e $03
    add  A, L                                          ;; 00:24a6 $85
    ld   L, A                                          ;; 00:24a7 $6f
    ld   A, [HL-]                                      ;; 00:24a8 $3a
    ld   [wC3AA], A                                    ;; 00:24a9 $ea $aa $c3
    ld   A, [HL]                                       ;; 00:24ac $7e
    cp   A, $10                                        ;; 00:24ad $fe $10
    jr   C, .jr_00_24bc                                ;; 00:24af $38 $0b
    sub  A, $10                                        ;; 00:24b1 $d6 $10
    ld   [wC3AB], A                                    ;; 00:24b3 $ea $ab $c3
    ld   A, $03                                        ;; 00:24b6 $3e $03
    ld   [wC3A9], A                                    ;; 00:24b8 $ea $a9 $c3
    ret                                                ;; 00:24bb $c9
.jr_00_24bc:
    ld   [wC3A9], A                                    ;; 00:24bc $ea $a9 $c3
    jp   jp_00_3b2c                                    ;; 00:24bf $c3 $2c $3b
.jr_00_24c2:
    call call_00_13ed                                  ;; 00:24c2 $cd $ed $13
    ld   A, E                                          ;; 00:24c5 $7b
    and  A, $90                                        ;; 00:24c6 $e6 $90
    ret  NZ                                            ;; 00:24c8 $c0
    bit  5, E                                          ;; 00:24c9 $cb $6b
    jr   NZ, .jr_00_24d0                               ;; 00:24cb $20 $03
    bit  6, E                                          ;; 00:24cd $cb $73
    ret  Z                                             ;; 00:24cf $c8
.jr_00_24d0:
    ld   A, E                                          ;; 00:24d0 $7b
    and  A, $0f                                        ;; 00:24d1 $e6 $0f
    ld   [wC3A9], A                                    ;; 00:24d3 $ea $a9 $c3
    ld   A, D                                          ;; 00:24d6 $7a
    ld   [wC3AA], A                                    ;; 00:24d7 $ea $aa $c3
    jp   jp_00_3b2c                                    ;; 00:24da $c3 $2c $3b
    db   $f0, $8b, $ea, $d0, $c5, $cd, $16, $26        ;; 00:24dd ????????
    db   $cd, $86, $25, $cd, $54, $25, $cd, $80        ;; 00:24e5 ????????
    db   $1c, $cd, $26, $1d, $d7, $df, $fa, $d0        ;; 00:24ed ????????
    db   $c5, $ef, $c9                                 ;; 00:24f5 ???

call_00_24f8:
    add  A, A                                          ;; 00:24f8 $87
    ld   E, A                                          ;; 00:24f9 $5f
    add  A, A                                          ;; 00:24fa $87
    add  A, E                                          ;; 00:24fb $83
    ld   HL, $5240                                     ;; 00:24fc $21 $40 $52
    rst  add_hl_a                                      ;; 00:24ff $c7
    ld   DE, $8100                                     ;; 00:2500 $11 $00 $81
    ld   B, $06                                        ;; 00:2503 $06 $06
.jr_00_2505:
    push BC                                            ;; 00:2505 $c5
    push HL                                            ;; 00:2506 $e5
    ld   A, $02                                        ;; 00:2507 $3e $02
    rst  switchBank                                    ;; 00:2509 $ef
    ld   A, [HL]                                       ;; 00:250a $7e
    bit  7, A                                          ;; 00:250b $cb $7f
    jr   NZ, .jr_00_2533                               ;; 00:250d $20 $24
    add  A, $60                                        ;; 00:250f $c6 $60
    ld   H, A                                          ;; 00:2511 $67
    ld   L, $00                                        ;; 00:2512 $2e $00
    ld   A, $01                                        ;; 00:2514 $3e $01
    rst  switchBank                                    ;; 00:2516 $ef
    ld   BC, $100                                      ;; 00:2517 $01 $00 $01
    call call_00_00be                                  ;; 00:251a $cd $be $00
.jr_00_251d:
    pop  HL                                            ;; 00:251d $e1
    inc  HL                                            ;; 00:251e $23
    pop  BC                                            ;; 00:251f $c1
    dec  B                                             ;; 00:2520 $05
    jr   NZ, .jr_00_2505                               ;; 00:2521 $20 $e2
    ld   A, $01                                        ;; 00:2523 $3e $01
    rst  switchBank                                    ;; 00:2525 $ef
    ld   HL, $7f00                                     ;; 00:2526 $21 $00 $7f
    ld   DE, $8700                                     ;; 00:2529 $11 $00 $87
    ld   BC, $100                                      ;; 00:252c $01 $00 $01
    call call_00_00be                                  ;; 00:252f $cd $be $00
    ret                                                ;; 00:2532 $c9
.jr_00_2533:
    cp   A, $fd                                        ;; 00:2533 $fe $fd
    jr   Z, .jr_00_254d                                ;; 00:2535 $28 $16
    ld   L, $00                                        ;; 00:2537 $2e $00
    srl  A                                             ;; 00:2539 $cb $3f
    rr   L                                             ;; 00:253b $cb $1d
    srl  A                                             ;; 00:253d $cb $3f
    rr   L                                             ;; 00:253f $cb $1d
    add  A, $60                                        ;; 00:2541 $c6 $60
    ld   H, A                                          ;; 00:2543 $67
    ld   B, $40                                        ;; 00:2544 $06 $40
.jr_00_2546:
    ld   A, $01                                        ;; 00:2546 $3e $01
    call call_00_020e                                  ;; 00:2548 $cd $0e $02
    jr   .jr_00_251d                                   ;; 00:254b $18 $d0
.jr_00_254d:
    ld   HL, $4000                                     ;; 00:254d $21 $00 $40
    ld   B, $80                                        ;; 00:2550 $06 $80
    jr   .jr_00_2546                                   ;; 00:2552 $18 $f2

call_00_2554:
    ld   A, [wCCC1]                                    ;; 00:2554 $fa $c1 $cc
    or   A, A                                          ;; 00:2557 $b7
    jr   Z, .jr_00_256e                                ;; 00:2558 $28 $14
    ld   HL, $6000                                     ;; 00:255a $21 $00 $60
    add  A, $1a                                        ;; 00:255d $c6 $1a
    add  A, H                                          ;; 00:255f $84
    ld   H, A                                          ;; 00:2560 $67
.jr_00_2561:
    ld   A, $01                                        ;; 00:2561 $3e $01
    rst  switchBank                                    ;; 00:2563 $ef
    ld   DE, $8000                                     ;; 00:2564 $11 $00 $80
    ld   BC, $100                                      ;; 00:2567 $01 $00 $01
    call call_00_00be                                  ;; 00:256a $cd $be $00
    ret                                                ;; 00:256d $c9
.jr_00_256e:
    ld   A, [wCC05]                                    ;; 00:256e $fa $05 $cc
    ld   HL, $7438                                     ;; 00:2571 $21 $38 $74
    rst  add_hl_a                                      ;; 00:2574 $c7
    ld   A, $02                                        ;; 00:2575 $3e $02
    rst  switchBank                                    ;; 00:2577 $ef
    ld   A, [HL]                                       ;; 00:2578 $7e
    swap A                                             ;; 00:2579 $cb $37
    and  A, $0f                                        ;; 00:257b $e6 $0f
    ld   E, $00                                        ;; 00:257d $1e $00
    ld   D, A                                          ;; 00:257f $57
    ld   HL, $6000                                     ;; 00:2580 $21 $00 $60
    add  HL, DE                                        ;; 00:2583 $19
    jr   .jr_00_2561                                   ;; 00:2584 $18 $db

call_00_2586:
    ldh  A, [hFFFB]                                    ;; 00:2586 $f0 $fb
    ld   E, A                                          ;; 00:2588 $5f
    ldh  A, [hFFFC]                                    ;; 00:2589 $f0 $fc
    ld   D, A                                          ;; 00:258b $57
    ld   A, $02                                        ;; 00:258c $3e $02
    rst  switchBank                                    ;; 00:258e $ef
    ld   A, [DE]                                       ;; 00:258f $1a
    inc  DE                                            ;; 00:2590 $13
    cp   A, $10                                        ;; 00:2591 $fe $10
    jr   C, .jr_00_2597                                ;; 00:2593 $38 $02
    ld   A, $10                                        ;; 00:2595 $3e $10
.jr_00_2597:
    ld   B, A                                          ;; 00:2597 $47
    ld   HL, wC55C                                     ;; 00:2598 $21 $5c $c5
.jr_00_259b:
    ld   A, [DE]                                       ;; 00:259b $1a
    bit  7, A                                          ;; 00:259c $cb $7f
    jr   NZ, .jr_00_25bc                               ;; 00:259e $20 $1c
    call call_00_2669                                  ;; 00:25a0 $cd $69 $26
    ld   C, A                                          ;; 00:25a3 $4f
    inc  DE                                            ;; 00:25a4 $13
    ld   A, [DE]                                       ;; 00:25a5 $1a
    and  A, $0f                                        ;; 00:25a6 $e6 $0f
    inc  C                                             ;; 00:25a8 $0c
    cp   A, C                                          ;; 00:25a9 $b9
    jr   C, .jr_00_25b4                                ;; 00:25aa $38 $08
    ld   A, [DE]                                       ;; 00:25ac $1a
    swap A                                             ;; 00:25ad $cb $37
    and  A, $0f                                        ;; 00:25af $e6 $0f
    cp   A, C                                          ;; 00:25b1 $b9
    jr   C, .jr_00_25fd                                ;; 00:25b2 $38 $49
.jr_00_25b4:
    inc  DE                                            ;; 00:25b4 $13
    inc  DE                                            ;; 00:25b5 $13
    inc  DE                                            ;; 00:25b6 $13
    inc  DE                                            ;; 00:25b7 $13
    inc  DE                                            ;; 00:25b8 $13
    inc  DE                                            ;; 00:25b9 $13
    jr   .jr_00_259b                                   ;; 00:25ba $18 $df
.jr_00_25bc:
    inc  DE                                            ;; 00:25bc $13
    cp   A, $81                                        ;; 00:25bd $fe $81
    ret  Z                                             ;; 00:25bf $c8
    inc  A                                             ;; 00:25c0 $3c
    jr   Z, .jr_00_25e7                                ;; 00:25c1 $28 $24
    push BC                                            ;; 00:25c3 $c5
    ld   C, L                                          ;; 00:25c4 $4d
    ld   B, H                                          ;; 00:25c5 $44
    dec  BC                                            ;; 00:25c6 $0b
    dec  BC                                            ;; 00:25c7 $0b
    dec  BC                                            ;; 00:25c8 $0b
    ld   A, [DE]                                       ;; 00:25c9 $1a
    inc  L                                             ;; 00:25ca $2c
    ld   [HL-], A                                      ;; 00:25cb $32
    inc  DE                                            ;; 00:25cc $13
    ld   A, [DE]                                       ;; 00:25cd $1a
    and  A, $3f                                        ;; 00:25ce $e6 $3f
    ld   [HL+], A                                      ;; 00:25d0 $22
    inc  L                                             ;; 00:25d1 $2c
    ld   A, [BC]                                       ;; 00:25d2 $0a
    ld   [HL+], A                                      ;; 00:25d3 $22
    inc  BC                                            ;; 00:25d4 $03
    ld   A, [BC]                                       ;; 00:25d5 $0a
    ld   [HL+], A                                      ;; 00:25d6 $22
    inc  BC                                            ;; 00:25d7 $03
    ld   A, [BC]                                       ;; 00:25d8 $0a
    and  A, $cf                                        ;; 00:25d9 $e6 $cf
    ld   C, A                                          ;; 00:25db $4f
    ld   A, [DE]                                       ;; 00:25dc $1a
    inc  DE                                            ;; 00:25dd $13
    and  A, $c0                                        ;; 00:25de $e6 $c0
    rrca                                               ;; 00:25e0 $0f
    rrca                                               ;; 00:25e1 $0f
    or   A, C                                          ;; 00:25e2 $b1
    ld   [HL+], A                                      ;; 00:25e3 $22
    pop  BC                                            ;; 00:25e4 $c1
    jr   .jr_00_2600                                   ;; 00:25e5 $18 $19
.jr_00_25e7:
    ld   A, [DE]                                       ;; 00:25e7 $1a
    call call_00_264b                                  ;; 00:25e8 $cd $4b $26
    jr   NZ, .jr_00_25b4                               ;; 00:25eb $20 $c7
    ld   A, [DE]                                       ;; 00:25ed $1a
    push AF                                            ;; 00:25ee $f5
    call call_00_2604                                  ;; 00:25ef $cd $04 $26
    pop  AF                                            ;; 00:25f2 $f1
    add  A, $10                                        ;; 00:25f3 $c6 $10
    dec  L                                             ;; 00:25f5 $2d
    dec  L                                             ;; 00:25f6 $2d
    dec  L                                             ;; 00:25f7 $2d
    ld   [HL+], A                                      ;; 00:25f8 $22
    inc  L                                             ;; 00:25f9 $2c
    inc  L                                             ;; 00:25fa $2c
    jr   .jr_00_2600                                   ;; 00:25fb $18 $03
.jr_00_25fd:
    call call_00_2604                                  ;; 00:25fd $cd $04 $26
.jr_00_2600:
    dec  B                                             ;; 00:2600 $05
    jr   NZ, .jr_00_259b                               ;; 00:2601 $20 $98
    ret                                                ;; 00:2603 $c9

call_00_2604:
    inc  DE                                            ;; 00:2604 $13
    ld   A, [DE]                                       ;; 00:2605 $1a
    inc  L                                             ;; 00:2606 $2c
    ld   [HL-], A                                      ;; 00:2607 $32
    inc  DE                                            ;; 00:2608 $13
    ld   A, [DE]                                       ;; 00:2609 $1a
    ld   [HL+], A                                      ;; 00:260a $22
    inc  DE                                            ;; 00:260b $13
    inc  L                                             ;; 00:260c $2c
    ld   C, $03                                        ;; 00:260d $0e $03
.jr_00_260f:
    ld   A, [DE]                                       ;; 00:260f $1a
    ld   [HL+], A                                      ;; 00:2610 $22
    inc  DE                                            ;; 00:2611 $13
    dec  C                                             ;; 00:2612 $0d
    jr   NZ, .jr_00_260f                               ;; 00:2613 $20 $fa
    ret                                                ;; 00:2615 $c9

call_00_2616:
    push HL                                            ;; 00:2616 $e5
    push BC                                            ;; 00:2617 $c5
    ld   HL, wC55C                                     ;; 00:2618 $21 $5c $c5
    ld   B, $10                                        ;; 00:261b $06 $10
.jr_00_261d:
    ld   [HL], $5a                                     ;; 00:261d $36 $5a
    ld   A, L                                          ;; 00:261f $7d
    add  A, $05                                        ;; 00:2620 $c6 $05
    ld   L, A                                          ;; 00:2622 $6f
    dec  B                                             ;; 00:2623 $05
    jr   NZ, .jr_00_261d                               ;; 00:2624 $20 $f7
    pop  BC                                            ;; 00:2626 $c1
    pop  HL                                            ;; 00:2627 $e1
    ret                                                ;; 00:2628 $c9

call_00_2629:
    push BC                                            ;; 00:2629 $c5
    push HL                                            ;; 00:262a $e5
    ld   C, A                                          ;; 00:262b $4f
    srl  C                                             ;; 00:262c $cb $39
    srl  C                                             ;; 00:262e $cb $39
    srl  C                                             ;; 00:2630 $cb $39
    ld   B, $00                                        ;; 00:2632 $06 $00
    ld   HL, wCCA5                                     ;; 00:2634 $21 $a5 $cc
    add  HL, BC                                        ;; 00:2637 $09
    and  A, $07                                        ;; 00:2638 $e6 $07
    inc  A                                             ;; 00:263a $3c
.jr_00_263b:
    rrc  E                                             ;; 00:263b $cb $0b
    dec  A                                             ;; 00:263d $3d
    jr   NZ, .jr_00_263b                               ;; 00:263e $20 $fb
    ld   A, E                                          ;; 00:2640 $7b
    xor  A, $ff                                        ;; 00:2641 $ee $ff
    and  A, [HL]                                       ;; 00:2643 $a6
    ld   C, A                                          ;; 00:2644 $4f
    ld   A, E                                          ;; 00:2645 $7b
    or   A, C                                          ;; 00:2646 $b1
    ld   [HL], A                                       ;; 00:2647 $77
    pop  HL                                            ;; 00:2648 $e1
    pop  BC                                            ;; 00:2649 $c1
    ret                                                ;; 00:264a $c9

call_00_264b:
    push HL                                            ;; 00:264b $e5
    push DE                                            ;; 00:264c $d5
    ld   E, A                                          ;; 00:264d $5f
    srl  E                                             ;; 00:264e $cb $3b
    srl  E                                             ;; 00:2650 $cb $3b
    srl  E                                             ;; 00:2652 $cb $3b
    ld   D, $00                                        ;; 00:2654 $16 $00
    ld   HL, wCCA5                                     ;; 00:2656 $21 $a5 $cc
    add  HL, DE                                        ;; 00:2659 $19
    and  A, $07                                        ;; 00:265a $e6 $07
    inc  A                                             ;; 00:265c $3c
    ld   E, $01                                        ;; 00:265d $1e $01
.jr_00_265f:
    rrc  E                                             ;; 00:265f $cb $0b
    dec  A                                             ;; 00:2661 $3d
    jr   NZ, .jr_00_265f                               ;; 00:2662 $20 $fb
    ld   A, E                                          ;; 00:2664 $7b
    and  A, [HL]                                       ;; 00:2665 $a6
    pop  DE                                            ;; 00:2666 $d1
    pop  HL                                            ;; 00:2667 $e1
    ret                                                ;; 00:2668 $c9

call_00_2669:
    push DE                                            ;; 00:2669 $d5
    push HL                                            ;; 00:266a $e5
    ld   E, A                                          ;; 00:266b $5f
    srl  E                                             ;; 00:266c $cb $3b
    ld   D, $00                                        ;; 00:266e $16 $00
    ld   HL, wCC91                                     ;; 00:2670 $21 $91 $cc
    add  HL, DE                                        ;; 00:2673 $19
    srl  A                                             ;; 00:2674 $cb $3f
    ld   A, [HL]                                       ;; 00:2676 $7e
    jr   C, .jr_00_267b                                ;; 00:2677 $38 $02
    swap A                                             ;; 00:2679 $cb $37
.jr_00_267b:
    and  A, $0f                                        ;; 00:267b $e6 $0f
    pop  HL                                            ;; 00:267d $e1
    pop  DE                                            ;; 00:267e $d1
    ret                                                ;; 00:267f $c9

call_00_2680:
    push BC                                            ;; 00:2680 $c5
    push HL                                            ;; 00:2681 $e5
    ld   C, A                                          ;; 00:2682 $4f
    srl  C                                             ;; 00:2683 $cb $39
    ld   B, $00                                        ;; 00:2685 $06 $00
    ld   HL, wCC91                                     ;; 00:2687 $21 $91 $cc
    add  HL, BC                                        ;; 00:268a $09
    srl  A                                             ;; 00:268b $cb $3f
    ld   A, [HL]                                       ;; 00:268d $7e
    jr   C, .jr_00_2696                                ;; 00:268e $38 $06
    and  A, $0f                                        ;; 00:2690 $e6 $0f
    swap E                                             ;; 00:2692 $cb $33
    jr   .jr_00_2698                                   ;; 00:2694 $18 $02
.jr_00_2696:
    and  A, $f0                                        ;; 00:2696 $e6 $f0
.jr_00_2698:
    or   A, E                                          ;; 00:2698 $b3
    ld   [HL], A                                       ;; 00:2699 $77
    pop  HL                                            ;; 00:269a $e1
    pop  BC                                            ;; 00:269b $c1
    ret                                                ;; 00:269c $c9

jp_00_269d:
    call call_00_2cf2                                  ;; 00:269d $cd $f2 $2c
    call call_00_14e8                                  ;; 00:26a0 $cd $e8 $14
    call call_00_3dc1                                  ;; 00:26a3 $cd $c1 $3d
    call call_00_2cb8                                  ;; 00:26a6 $cd $b8 $2c

jp_00_26a9:
    call call_00_2cf2                                  ;; 00:26a9 $cd $f2 $2c
    call call_00_14e8                                  ;; 00:26ac $cd $e8 $14
    call call_00_2cb8                                  ;; 00:26af $cd $b8 $2c
    call call_00_2af0                                  ;; 00:26b2 $cd $f0 $2a
    call call_00_2ca3                                  ;; 00:26b5 $cd $a3 $2c
    ld   HL, $3f12                                     ;; 00:26b8 $21 $12 $3f
    xor  A, A                                          ;; 00:26bb $af
    call call_00_2b2e                                  ;; 00:26bc $cd $2e $2b
    or   A, A                                          ;; 00:26bf $b7
    jp   Z, jp_00_271e                                 ;; 00:26c0 $ca $1e $27
    dec  A                                             ;; 00:26c3 $3d
    jp   Z, jp_00_2799                                 ;; 00:26c4 $ca $99 $27
    dec  A                                             ;; 00:26c7 $3d
    jp   Z, jp_00_28f5                                 ;; 00:26c8 $ca $f5 $28
    dec  A                                             ;; 00:26cb $3d
    jr   Z, jr_00_26fe                                 ;; 00:26cc $28 $30

jp_00_26ce:
    call call_00_3dcf                                  ;; 00:26ce $cd $cf $3d
    call call_00_2cb8                                  ;; 00:26d1 $cd $b8 $2c
    ldh  A, [hFFFA]                                    ;; 00:26d4 $f0 $fa
    call call_00_24f8                                  ;; 00:26d6 $cd $f8 $24
    call call_00_2554                                  ;; 00:26d9 $cd $54 $25
    ld   A, [wC5B9]                                    ;; 00:26dc $fa $b9 $c5
    call call_00_3f97                                  ;; 00:26df $cd $97 $3f
    call call_00_3d9e                                  ;; 00:26e2 $cd $9e $3d
    ld   A, [wC5C9]                                    ;; 00:26e5 $fa $c9 $c5
    call call_00_2403                                  ;; 00:26e8 $cd $03 $24
    call call_00_1c80                                  ;; 00:26eb $cd $80 $1c
    call call_00_1d26                                  ;; 00:26ee $cd $26 $1d
    call call_00_14db                                  ;; 00:26f1 $cd $db $14
    call call_00_1f81                                  ;; 00:26f4 $cd $81 $1f
    xor  A, A                                          ;; 00:26f7 $af
    ld   [wC5BC], A                                    ;; 00:26f8 $ea $bc $c5
    jp   call_00_3de0                                  ;; 00:26fb $c3 $e0 $3d

jr_00_26fe:
    call call_00_2c8b                                  ;; 00:26fe $cd $8b $2c
    ld   HL, $3f1c                                     ;; 00:2701 $21 $1c $3f
    xor  A, A                                          ;; 00:2704 $af
    call call_00_2b2e                                  ;; 00:2705 $cd $2e $2b
    or   A, A                                          ;; 00:2708 $b7
    jr   Z, .jr_00_270e                                ;; 00:2709 $28 $03
    jp   jp_00_26a9                                    ;; 00:270b $c3 $a9 $26
.jr_00_270e:
    ld   A, $15                                        ;; 00:270e $3e $15
    ldh  [hFFE4], A                                    ;; 00:2710 $e0 $e4
    call call_00_01ad                                  ;; 00:2712 $cd $ad $01
    jp   jp_00_26a9                                    ;; 00:2715 $c3 $a9 $26

jr_00_2718:
    pop  AF                                            ;; 00:2718 $f1
    jr   jr_00_2730                                    ;; 00:2719 $18 $15

jp_00_271b:
    call call_00_2cb8                                  ;; 00:271b $cd $b8 $2c

jp_00_271e:
    call call_00_2cc9                                  ;; 00:271e $cd $c9 $2c
    call call_00_2c6d                                  ;; 00:2721 $cd $6d $2c
    call call_00_295f                                  ;; 00:2724 $cd $5f $29
    inc  A                                             ;; 00:2727 $3c
    jp   Z, jp_00_26a9                                 ;; 00:2728 $ca $a9 $26
    ldh  A, [hFFCD]                                    ;; 00:272b $f0 $cd
    ld   [wC5C8], A                                    ;; 00:272d $ea $c8 $c5

jr_00_2730:
    call call_00_2cf2                                  ;; 00:2730 $cd $f2 $2c
    call call_00_2981                                  ;; 00:2733 $cd $81 $29
    ld   DE, wC070                                     ;; 00:2736 $11 $70 $c0
    ld   HL, wC000                                     ;; 00:2739 $21 $00 $c0
    ld   C, $00                                        ;; 00:273c $0e $00
    call call_00_2cd6                                  ;; 00:273e $cd $d6 $2c
    ld   HL, $3f29                                     ;; 00:2741 $21 $29 $3f
    xor  A, A                                          ;; 00:2744 $af
    call call_00_2b2e                                  ;; 00:2745 $cd $2e $2b
    cp   A, $ff                                        ;; 00:2748 $fe $ff
    jp   Z, jp_00_271b                                 ;; 00:274a $ca $1b $27
    add  A, A                                          ;; 00:274d $87
    push AF                                            ;; 00:274e $f5
    call call_00_2cce                                  ;; 00:274f $cd $ce $2c
.jr_00_2752:
    rst  rst_00_0010                                   ;; 00:2752 $d7
    rst  rst_00_0018                                   ;; 00:2753 $df
    call call_00_0174                                  ;; 00:2754 $cd $74 $01
    or   A, A                                          ;; 00:2757 $b7
    jr   Z, .jr_00_2752                                ;; 00:2758 $28 $f8
    dec  A                                             ;; 00:275a $3d
    jr   NZ, jr_00_2718                                ;; 00:275b $20 $bb
    ldh  A, [hFFCD]                                    ;; 00:275d $f0 $cd
    add  A, $10                                        ;; 00:275f $c6 $10
    ld   L, A                                          ;; 00:2761 $6f
    ld   H, $cc                                        ;; 00:2762 $26 $cc
    pop  AF                                            ;; 00:2764 $f1
    rst  add_hl_a                                      ;; 00:2765 $c7
    ldh  A, [hFFCD]                                    ;; 00:2766 $f0 $cd
    ld   E, A                                          ;; 00:2768 $5f
    ld   D, $cc                                        ;; 00:2769 $16 $cc
    ld   A, [DE]                                       ;; 00:276b $1a
    and  A, $03                                        ;; 00:276c $e6 $03
    jr   NZ, jr_00_2730                                ;; 00:276e $20 $c0
    ld   A, [HL-]                                      ;; 00:2770 $3a
    or   A, A                                          ;; 00:2771 $b7
    jr   Z, jr_00_2730                                 ;; 00:2772 $28 $bc
    inc  A                                             ;; 00:2774 $3c
    jr   Z, jr_00_2730                                 ;; 00:2775 $28 $b9
    ldh  A, [hFFCD]                                    ;; 00:2777 $f0 $cd
    push AF                                            ;; 00:2779 $f5
    ld   A, [HL]                                       ;; 00:277a $7e
    push HL                                            ;; 00:277b $e5
    call call_00_36e1                                  ;; 00:277c $cd $e1 $36
    pop  HL                                            ;; 00:277f $e1
    or   A, A                                          ;; 00:2780 $b7
    jr   NZ, .jr_00_2794                               ;; 00:2781 $20 $11
    inc  L                                             ;; 00:2783 $2c
    ld   A, [HL]                                       ;; 00:2784 $7e
    cp   A, $fe                                        ;; 00:2785 $fe $fe
    jr   Z, .jr_00_2794                                ;; 00:2787 $28 $0b
    dec  [HL]                                          ;; 00:2789 $35
    jr   NZ, .jr_00_2794                               ;; 00:278a $20 $08
    dec  L                                             ;; 00:278c $2d
    ld   A, [HL]                                       ;; 00:278d $7e
    rlca                                               ;; 00:278e $07
    jr   C, .jr_00_2794                                ;; 00:278f $38 $03
    inc  L                                             ;; 00:2791 $2c
    ld   [HL], $ff                                     ;; 00:2792 $36 $ff
.jr_00_2794:
    pop  AF                                            ;; 00:2794 $f1
    ldh  [hFFCD], A                                    ;; 00:2795 $e0 $cd
    jr   jr_00_2730                                    ;; 00:2797 $18 $97

jp_00_2799:
    ld   A, $ff                                        ;; 00:2799 $3e $ff
    ld   [wC5C8], A                                    ;; 00:279b $ea $c8 $c5
    call call_00_2a87                                  ;; 00:279e $cd $87 $2a
    call call_00_2caa                                  ;; 00:27a1 $cd $aa $2c
    ld   HL, $3f63                                     ;; 00:27a4 $21 $63 $3f
    ld   DE, $9c23                                     ;; 00:27a7 $11 $23 $9c
    ld   BC, $910                                      ;; 00:27aa $01 $10 $09
    ld   A, $03                                        ;; 00:27ad $3e $03
    call call_00_2b2e                                  ;; 00:27af $cd $2e $2b
    jr   .jr_00_27c1                                   ;; 00:27b2 $18 $0d
.jp_00_27b4:
    call call_00_2aa2                                  ;; 00:27b4 $cd $a2 $2a
    call call_00_2caa                                  ;; 00:27b7 $cd $aa $2c
    ldh  A, [hFFF2]                                    ;; 00:27ba $f0 $f2
    ld   C, $00                                        ;; 00:27bc $0e $00
    call call_00_2be6                                  ;; 00:27be $cd $e6 $2b
.jr_00_27c1:
    cp   A, $ff                                        ;; 00:27c1 $fe $ff
    jp   Z, jp_00_26a9                                 ;; 00:27c3 $ca $a9 $26
    cp   A, $09                                        ;; 00:27c6 $fe $09
    jp   Z, .jp_00_2810                                ;; 00:27c8 $ca $10 $28
    add  A, A                                          ;; 00:27cb $87
    ld   [wC5C6], A                                    ;; 00:27cc $ea $c6 $c5
    call call_00_2cce                                  ;; 00:27cf $cd $ce $2c
.jr_00_27d2:
    call call_00_2b4e                                  ;; 00:27d2 $cd $4e $2b
    cp   A, $ff                                        ;; 00:27d5 $fe $ff
    jr   Z, .jp_00_27b4                                ;; 00:27d7 $28 $db
    cp   A, $09                                        ;; 00:27d9 $fe $09
    jr   Z, .jr_00_27d2                                ;; 00:27db $28 $f5
    add  A, A                                          ;; 00:27dd $87
    ld   B, A                                          ;; 00:27de $47
    add  A, $7c                                        ;; 00:27df $c6 $7c
    ld   L, A                                          ;; 00:27e1 $6f
    ld   H, $cc                                        ;; 00:27e2 $26 $cc
    ld   A, [wC5C6]                                    ;; 00:27e4 $fa $c6 $c5
    add  A, B                                          ;; 00:27e7 $80
    cp   A, $20                                        ;; 00:27e8 $fe $20
    jr   Z, .jp_00_27b4                                ;; 00:27ea $28 $c8
    ld   A, [wC5C6]                                    ;; 00:27ec $fa $c6 $c5
    cp   A, $10                                        ;; 00:27ef $fe $10
    jr   Z, .jr_00_2809                                ;; 00:27f1 $28 $16
    cp   A, B                                          ;; 00:27f3 $b8
    jp   Z, .jp_00_28ac                                ;; 00:27f4 $ca $ac $28
    ld   A, B                                          ;; 00:27f7 $78
    cp   A, $10                                        ;; 00:27f8 $fe $10
    ld   A, [wC5C6]                                    ;; 00:27fa $fa $c6 $c5
    jp   NZ, .jp_00_28df                               ;; 00:27fd $c2 $df $28
    ld   A, [wC5C6]                                    ;; 00:2800 $fa $c6 $c5
    ld   B, A                                          ;; 00:2803 $47
    add  A, $7c                                        ;; 00:2804 $c6 $7c
    ld   L, A                                          ;; 00:2806 $6f
    ld   H, $cc                                        ;; 00:2807 $26 $cc
.jr_00_2809:
    ld   A, $ff                                        ;; 00:2809 $3e $ff
    ld   [HL+], A                                      ;; 00:280b $22
    ld   [HL], A                                       ;; 00:280c $77
    jp   .jp_00_27b4                                   ;; 00:280d $c3 $b4 $27
.jp_00_2810:
    ld   A, $0a                                        ;; 00:2810 $3e $0a
    call call_00_2669                                  ;; 00:2812 $cd $69 $26
    cp   A, $05                                        ;; 00:2815 $fe $05
    jp   Z, .jp_00_27b4                                ;; 00:2817 $ca $b4 $27
    call call_00_2ab1                                  ;; 00:281a $cd $b1 $2a
    call call_00_2cc9                                  ;; 00:281d $cd $c9 $2c
.jr_00_2820:
    ld   HL, $3f79                                     ;; 00:2820 $21 $79 $3f
    xor  A, A                                          ;; 00:2823 $af
    call call_00_2b2e                                  ;; 00:2824 $cd $2e $2b
    cp   A, $ff                                        ;; 00:2827 $fe $ff
    jp   Z, jp_00_2799                                 ;; 00:2829 $ca $99 $27
    push AF                                            ;; 00:282c $f5
    ld   A, $0a                                        ;; 00:282d $3e $0a
    call call_00_2669                                  ;; 00:282f $cd $69 $26
    ld   C, A                                          ;; 00:2832 $4f
    pop  AF                                            ;; 00:2833 $f1
    cp   A, C                                          ;; 00:2834 $b9
    jr   NC, .jr_00_2820                               ;; 00:2835 $30 $e9
    push AF                                            ;; 00:2837 $f5
    ld   A, $00                                        ;; 00:2838 $3e $00
    call call_00_2669                                  ;; 00:283a $cd $69 $26
    cp   A, $02                                        ;; 00:283d $fe $02
    jr   Z, .jr_00_285c                                ;; 00:283f $28 $1b
    pop  AF                                            ;; 00:2841 $f1
    add  A, $05                                        ;; 00:2842 $c6 $05
    ld   E, A                                          ;; 00:2844 $5f
    ld   A, $04                                        ;; 00:2845 $3e $04
    call call_00_2680                                  ;; 00:2847 $cd $80 $26
    ld   A, [wC5E2]                                    ;; 00:284a $fa $e2 $c5
    rlca                                               ;; 00:284d $07
    jr   C, .jr_00_2853                                ;; 00:284e $38 $03
    call call_00_2586                                  ;; 00:2850 $cd $86 $25
.jr_00_2853:
    ld   A, $0c                                        ;; 00:2853 $3e $0c
    ldh  [hFFE4], A                                    ;; 00:2855 $e0 $e4
    call call_00_1779                                  ;; 00:2857 $cd $79 $17
    jr   .jr_00_2820                                   ;; 00:285a $18 $c4
.jr_00_285c:
    pop  AF                                            ;; 00:285c $f1
    ld   A, [wCCC7]                                    ;; 00:285d $fa $c7 $cc
    dec  A                                             ;; 00:2860 $3d
    jp   NZ, jp_00_2799                                ;; 00:2861 $c2 $99 $27
    ld   A, $eb                                        ;; 00:2864 $3e $eb
    ldh  [rLCDC], A                                    ;; 00:2866 $e0 $40
    ldh  A, [rSCY]                                     ;; 00:2868 $f0 $42
    ldh  [hFFC7], A                                    ;; 00:286a $e0 $c7
    ldh  A, [rSCX]                                     ;; 00:286c $f0 $43
    ldh  [hFFC8], A                                    ;; 00:286e $e0 $c8
    xor  A, A                                          ;; 00:2870 $af
    ldh  [rSCX], A                                     ;; 00:2871 $e0 $43
    ldh  [rSCY], A                                     ;; 00:2873 $e0 $42
    ldh  [hFFE0], A                                    ;; 00:2875 $e0 $e0
    call call_00_14db                                  ;; 00:2877 $cd $db $14
    ld   A, $0a                                        ;; 00:287a $3e $0a
    call call_00_2669                                  ;; 00:287c $cd $69 $26
    ld   B, A                                          ;; 00:287f $47
.jr_00_2880:
    push BC                                            ;; 00:2880 $c5
    ld   A, B                                          ;; 00:2881 $78
    call call_00_2ab6                                  ;; 00:2882 $cd $b6 $2a
    ld   A, $0c                                        ;; 00:2885 $3e $0c
    ldh  [hFFE4], A                                    ;; 00:2887 $e0 $e4
    call call_00_1793                                  ;; 00:2889 $cd $93 $17
    pop  BC                                            ;; 00:288c $c1
    dec  B                                             ;; 00:288d $05
    jr   NZ, .jr_00_2880                               ;; 00:288e $20 $f0
    ld   E, $05                                        ;; 00:2890 $1e $05
    ld   A, $0a                                        ;; 00:2892 $3e $0a
    call call_00_2680                                  ;; 00:2894 $cd $80 $26
    call call_00_14e8                                  ;; 00:2897 $cd $e8 $14
    call call_00_23fe                                  ;; 00:289a $cd $fe $23
    ld   A, $01                                        ;; 00:289d $3e $01
    ldh  [hFFE0], A                                    ;; 00:289f $e0 $e0
    ldh  A, [hFFC7]                                    ;; 00:28a1 $f0 $c7
    ldh  [rSCY], A                                     ;; 00:28a3 $e0 $42
    ldh  A, [hFFC8]                                    ;; 00:28a5 $f0 $c8
    ldh  [rSCX], A                                     ;; 00:28a7 $e0 $43
    jp   jp_00_2799                                    ;; 00:28a9 $c3 $99 $27
.jp_00_28ac:
    add  A, $7c                                        ;; 00:28ac $c6 $7c
    ld   L, A                                          ;; 00:28ae $6f
    ld   H, $cc                                        ;; 00:28af $26 $cc
    ld   [wC5C6], A                                    ;; 00:28b1 $ea $c6 $c5
    inc  L                                             ;; 00:28b4 $2c
    ld   A, [HL-]                                      ;; 00:28b5 $3a
    or   A, A                                          ;; 00:28b6 $b7
    jp   Z, .jp_00_27b4                                ;; 00:28b7 $ca $b4 $27
    inc  A                                             ;; 00:28ba $3c
    jp   Z, .jp_00_27b4                                ;; 00:28bb $ca $b4 $27
    push HL                                            ;; 00:28be $e5
    ld   A, [HL]                                       ;; 00:28bf $7e
    call call_00_36e1                                  ;; 00:28c0 $cd $e1 $36
    pop  HL                                            ;; 00:28c3 $e1
    or   A, A                                          ;; 00:28c4 $b7
    jp   NZ, jp_00_2799                                ;; 00:28c5 $c2 $99 $27
    inc  L                                             ;; 00:28c8 $2c
    ld   A, [HL]                                       ;; 00:28c9 $7e
    cp   A, $fe                                        ;; 00:28ca $fe $fe
    jp   Z, jp_00_2799                                 ;; 00:28cc $ca $99 $27
    dec  [HL]                                          ;; 00:28cf $35
    jp   NZ, jp_00_2799                                ;; 00:28d0 $c2 $99 $27
    dec  L                                             ;; 00:28d3 $2d
    ld   A, [HL]                                       ;; 00:28d4 $7e
    rlca                                               ;; 00:28d5 $07
    jp   C, jp_00_2799                                 ;; 00:28d6 $da $99 $27
    inc  L                                             ;; 00:28d9 $2c
    ld   [HL], $ff                                     ;; 00:28da $36 $ff
    jp   jp_00_2799                                    ;; 00:28dc $c3 $99 $27
.jp_00_28df:
    add  A, $7c                                        ;; 00:28df $c6 $7c
    ld   E, A                                          ;; 00:28e1 $5f
    ld   D, $cc                                        ;; 00:28e2 $16 $cc
    ld   C, [HL]                                       ;; 00:28e4 $4e
    ld   A, [DE]                                       ;; 00:28e5 $1a
    ld   [HL+], A                                      ;; 00:28e6 $22
    ld   A, C                                          ;; 00:28e7 $79
    ld   [DE], A                                       ;; 00:28e8 $12
    inc  DE                                            ;; 00:28e9 $13
    ld   C, [HL]                                       ;; 00:28ea $4e
    ld   A, [DE]                                       ;; 00:28eb $1a
    ld   [HL], A                                       ;; 00:28ec $77
    ld   A, C                                          ;; 00:28ed $79
    ld   [DE], A                                       ;; 00:28ee $12
    jp   .jp_00_27b4                                   ;; 00:28ef $c3 $b4 $27

jp_00_28f2:
    call call_00_2cb8                                  ;; 00:28f2 $cd $b8 $2c

jp_00_28f5:
    call call_00_2cc9                                  ;; 00:28f5 $cd $c9 $2c
    call call_00_2c6d                                  ;; 00:28f8 $cd $6d $2c
    call call_00_295f                                  ;; 00:28fb $cd $5f $29
    inc  A                                             ;; 00:28fe $3c
    jp   Z, jp_00_26a9                                 ;; 00:28ff $ca $a9 $26
.jr_00_2902:
    call call_00_2a0f                                  ;; 00:2902 $cd $0f $2a
    ld   HL, $3f3b                                     ;; 00:2905 $21 $3b $3f
    xor  A, A                                          ;; 00:2908 $af
    call call_00_2b2e                                  ;; 00:2909 $cd $2e $2b
    cp   A, $ff                                        ;; 00:290c $fe $ff
    jp   Z, jp_00_28f2                                 ;; 00:290e $ca $f2 $28
    add  A, A                                          ;; 00:2911 $87
    ld   C, A                                          ;; 00:2912 $4f
    ldh  A, [hFFCD]                                    ;; 00:2913 $f0 $cd
    add  A, $0f                                        ;; 00:2915 $c6 $0f
    add  A, C                                          ;; 00:2917 $81
    ld   [wC5C6], A                                    ;; 00:2918 $ea $c6 $c5
    ld   L, A                                          ;; 00:291b $6f
    ld   H, $cc                                        ;; 00:291c $26 $cc
    ld   A, [HL]                                       ;; 00:291e $7e
    inc  A                                             ;; 00:291f $3c
    cp   A, $81                                        ;; 00:2920 $fe $81
    jr   NC, .jr_00_2902                               ;; 00:2922 $30 $de
    call call_00_2a55                                  ;; 00:2924 $cd $55 $2a
    ld   HL, $3f4d                                     ;; 00:2927 $21 $4d $3f
    ld   DE, $9c2a                                     ;; 00:292a $11 $2a $9c
    ld   BC, $910                                      ;; 00:292d $01 $10 $09
    ld   A, $02                                        ;; 00:2930 $3e $02
    call call_00_2b2e                                  ;; 00:2932 $cd $2e $2b
    cp   A, $ff                                        ;; 00:2935 $fe $ff
    jr   Z, .jr_00_2902                                ;; 00:2937 $28 $c9
    ld   C, A                                          ;; 00:2939 $4f
    cp   A, $08                                        ;; 00:293a $fe $08
    jr   Z, .jr_00_294f                                ;; 00:293c $28 $11
    add  A, A                                          ;; 00:293e $87
    add  A, $7c                                        ;; 00:293f $c6 $7c
    ld   [wC5CD], A                                    ;; 00:2941 $ea $cd $c5
.jr_00_2944:
    ld   A, [wC5C6]                                    ;; 00:2944 $fa $c6 $c5
    ld   [wC5CE], A                                    ;; 00:2947 $ea $ce $c5
    call call_00_35a8                                  ;; 00:294a $cd $a8 $35
    jr   .jr_00_2902                                   ;; 00:294d $18 $b3
.jr_00_294f:
    ld   HL, wCCFE                                     ;; 00:294f $21 $fe $cc
    ld   A, $ff                                        ;; 00:2952 $3e $ff
    ld   [HL+], A                                      ;; 00:2954 $22
    ld   [HL], A                                       ;; 00:2955 $77
    ld   A, $fe                                        ;; 00:2956 $3e $fe
    ld   [wC5CD], A                                    ;; 00:2958 $ea $cd $c5
    jr   .jr_00_2944                                   ;; 00:295b $18 $e7
    db   $18, $a3                                      ;; 00:295d ??

call_00_295f:
    ld   HL, $3f21                                     ;; 00:295f $21 $21 $3f
    xor  A, A                                          ;; 00:2962 $af
    call call_00_2b2e                                  ;; 00:2963 $cd $2e $2b
    cp   A, $ff                                        ;; 00:2966 $fe $ff
    ret  Z                                             ;; 00:2968 $c8
    ld   [wC3AC], A                                    ;; 00:2969 $ea $ac $c3
    call call_00_3cec                                  ;; 00:296c $cd $ec $3c
    ldh  [hFFCD], A                                    ;; 00:296f $e0 $cd
    ld   C, A                                          ;; 00:2971 $4f
    ld   B, $cc                                        ;; 00:2972 $06 $cc
    ld   A, [BC]                                       ;; 00:2974 $0a
    cp   A, $ff                                        ;; 00:2975 $fe $ff
    jr   Z, call_00_295f                               ;; 00:2977 $28 $e6
    ld   A, C                                          ;; 00:2979 $79
    add  A, $0a                                        ;; 00:297a $c6 $0a
    ld   C, A                                          ;; 00:297c $4f
    ld   A, [BC]                                       ;; 00:297d $0a
    and  A, $a0                                        ;; 00:297e $e6 $a0
    ret                                                ;; 00:2980 $c9

call_00_2981:
    call call_00_2cb8                                  ;; 00:2981 $cd $b8 $2c
    ld   BC, $60d                                      ;; 00:2984 $01 $0d $06
    call call_00_2d0f                                  ;; 00:2987 $cd $0f $2d
    ldh  A, [hFFCD]                                    ;; 00:298a $f0 $cd
    add  A, $08                                        ;; 00:298c $c6 $08
    ld   L, A                                          ;; 00:298e $6f
    ld   H, $cc                                        ;; 00:298f $26 $cc
    ld   A, [HL+]                                      ;; 00:2991 $2a
    ld_long_store hFFB4, A                             ;; 00:2992 $ea $b4 $ff
    ld   A, [HL]                                       ;; 00:2995 $7e
    ld_long_store hFFB5, A                             ;; 00:2996 $ea $b5 $ff
    ldh  A, [hFFCD]                                    ;; 00:2999 $f0 $cd
    add  A, $0b                                        ;; 00:299b $c6 $0b
    ld   L, A                                          ;; 00:299d $6f
    ld   H, $cc                                        ;; 00:299e $26 $cc
    ld   DE, wC3DA                                     ;; 00:29a0 $11 $da $c3
    ld   B, $04                                        ;; 00:29a3 $06 $04
    call call_00_008f                                  ;; 00:29a5 $cd $8f $00
    ld   DE, $14                                       ;; 00:29a8 $11 $14 $00
    ld   HL, wC611                                     ;; 00:29ab $21 $11 $c6
    ld   BC, $201                                      ;; 00:29ae $01 $01 $02
    ld   A, $08                                        ;; 00:29b1 $3e $08
    rst  rst_00_0008                                   ;; 00:29b3 $cf
    ld   DE, $9c20                                     ;; 00:29b4 $11 $20 $9c
    ld   BC, $80f                                      ;; 00:29b7 $01 $0f $08
    call call_00_2a9c                                  ;; 00:29ba $cd $9c $2a
    ld   HL, $9c07                                     ;; 00:29bd $21 $07 $9c
    call call_00_29d9                                  ;; 00:29c0 $cd $d9 $29
    call call_00_01a7                                  ;; 00:29c3 $cd $a7 $01
    ldh  A, [hFFCD]                                    ;; 00:29c6 $f0 $cd
    add  A, $0f                                        ;; 00:29c8 $c6 $0f
    ld   L, A                                          ;; 00:29ca $6f
    ld   H, $cc                                        ;; 00:29cb $26 $cc
    call call_00_29e7                                  ;; 00:29cd $cd $e7 $29
    ld   DE, $9c29                                     ;; 00:29d0 $11 $29 $9c
    ld   BC, $910                                      ;; 00:29d3 $01 $10 $09
    jp   call_00_2a9c                                  ;; 00:29d6 $c3 $9c $2a

call_00_29d9:
    push HL                                            ;; 00:29d9 $e5
    ld   BC, $a10                                      ;; 00:29da $01 $10 $0a
    call call_00_2d0f                                  ;; 00:29dd $cd $0f $2d
    pop  DE                                            ;; 00:29e0 $d1
    ld   BC, $c12                                      ;; 00:29e1 $01 $12 $0c
    jp   call_00_2a9c                                  ;; 00:29e4 $c3 $9c $2a

call_00_29e7:
    ld   DE, wC609                                     ;; 00:29e7 $11 $09 $c6
    ld   A, $09                                        ;; 00:29ea $3e $09
    push AF                                            ;; 00:29ec $f5
    push DE                                            ;; 00:29ed $d5
    ld   DE, wC3D0                                     ;; 00:29ee $11 $d0 $c3
    ld   BC, wC3DA                                     ;; 00:29f1 $01 $da $c3
    ld   A, $08                                        ;; 00:29f4 $3e $08
.jr_00_29f6:
    push AF                                            ;; 00:29f6 $f5
    ld   A, [HL+]                                      ;; 00:29f7 $2a
    ld   [DE], A                                       ;; 00:29f8 $12
    inc  DE                                            ;; 00:29f9 $13
    inc  A                                             ;; 00:29fa $3c
    jr   NZ, .jr_00_2a01                               ;; 00:29fb $20 $04
    dec  A                                             ;; 00:29fd $3d
    inc  HL                                            ;; 00:29fe $23
    jr   .jr_00_2a02                                   ;; 00:29ff $18 $01
.jr_00_2a01:
    ld   A, [HL+]                                      ;; 00:2a01 $2a
.jr_00_2a02:
    ld   [BC], A                                       ;; 00:2a02 $02
    inc  BC                                            ;; 00:2a03 $03
    pop  AF                                            ;; 00:2a04 $f1
    dec  A                                             ;; 00:2a05 $3d
    jr   NZ, .jr_00_29f6                               ;; 00:2a06 $20 $ee
    pop  HL                                            ;; 00:2a08 $e1
    pop  AF                                            ;; 00:2a09 $f1
    ld   DE, $05                                       ;; 00:2a0a $11 $05 $00
    rst  rst_00_0008                                   ;; 00:2a0d $cf
    ret                                                ;; 00:2a0e $c9

call_00_2a0f:
    call call_00_2cf2                                  ;; 00:2a0f $cd $f2 $2c
    call call_00_2cb8                                  ;; 00:2a12 $cd $b8 $2c
    ld   BC, $e10                                      ;; 00:2a15 $01 $10 $0e
    call call_00_2d0f                                  ;; 00:2a18 $cd $0f $2d
    ldh  A, [hFFCD]                                    ;; 00:2a1b $f0 $cd
    add  A, $0b                                        ;; 00:2a1d $c6 $0b
    ld   L, A                                          ;; 00:2a1f $6f
    ld   H, $cc                                        ;; 00:2a20 $26 $cc
    ld   DE, wC3DA                                     ;; 00:2a22 $11 $da $c3
    ld   B, $04                                        ;; 00:2a25 $06 $04
    call call_00_008f                                  ;; 00:2a27 $cd $8f $00
    ld   DE, $10                                       ;; 00:2a2a $11 $10 $00
    ld   HL, wC621                                     ;; 00:2a2d $21 $21 $c6
    ld   BC, $201                                      ;; 00:2a30 $01 $01 $02
    ld   A, $10                                        ;; 00:2a33 $3e $10
    rst  rst_00_0008                                   ;; 00:2a35 $cf
    ld   DE, $9c00                                     ;; 00:2a36 $11 $00 $9c
    ld   BC, $1012                                     ;; 00:2a39 $01 $12 $10
    call call_00_2a9c                                  ;; 00:2a3c $cd $9c $2a
    call call_00_01a7                                  ;; 00:2a3f $cd $a7 $01
    ldh  A, [hFFCD]                                    ;; 00:2a42 $f0 $cd
    add  A, $0f                                        ;; 00:2a44 $c6 $0f
    ld   L, A                                          ;; 00:2a46 $6f
    ld   H, $cc                                        ;; 00:2a47 $26 $cc
    call call_00_29e7                                  ;; 00:2a49 $cd $e7 $29
    ld   DE, $9c26                                     ;; 00:2a4c $11 $26 $9c
    ld   BC, $910                                      ;; 00:2a4f $01 $10 $09
    jp   call_00_2a9c                                  ;; 00:2a52 $c3 $9c $2a

call_00_2a55:
    call call_00_2cc9                                  ;; 00:2a55 $cd $c9 $2c
    ld   HL, $9c08                                     ;; 00:2a58 $21 $08 $9c
    call call_00_29d9                                  ;; 00:2a5b $cd $d9 $29
    call call_00_01a7                                  ;; 00:2a5e $cd $a7 $01
    ld   HL, wCC7C                                     ;; 00:2a61 $21 $7c $cc
    call call_00_29e7                                  ;; 00:2a64 $cd $e7 $29
    call call_00_2a73                                  ;; 00:2a67 $cd $73 $2a
    ld   DE, $9c2a                                     ;; 00:2a6a $11 $2a $9c
    ld   BC, $910                                      ;; 00:2a6d $01 $10 $09
    jp   call_00_2a9c                                  ;; 00:2a70 $c3 $9c $2a

call_00_2a73:
    ld   DE, $11                                       ;; 00:2a73 $11 $11 $00
    ld   HL, wC692                                     ;; 00:2a76 $21 $92 $c6
    ld   A, $09                                        ;; 00:2a79 $3e $09
    rst  rst_00_0008                                   ;; 00:2a7b $cf
    ret                                                ;; 00:2a7c $c9

jp_00_2a7d:
    ld   DE, $12                                       ;; 00:2a7d $11 $12 $00
    ld   HL, wC6AB                                     ;; 00:2a80 $21 $ab $c6
    ld   A, $09                                        ;; 00:2a83 $3e $09
    rst  rst_00_0008                                   ;; 00:2a85 $cf
    ret                                                ;; 00:2a86 $c9

call_00_2a87:
    call call_00_2cf2                                  ;; 00:2a87 $cd $f2 $2c
    call call_00_2cb8                                  ;; 00:2a8a $cd $b8 $2c
    ld   HL, $9c01                                     ;; 00:2a8d $21 $01 $9c
    call call_00_29d9                                  ;; 00:2a90 $cd $d9 $29
    call call_00_2aa2                                  ;; 00:2a93 $cd $a2 $2a
    ld   DE, $9c23                                     ;; 00:2a96 $11 $23 $9c
    ld   BC, $910                                      ;; 00:2a99 $01 $10 $09

call_00_2a9c:
    ld   HL, wC600                                     ;; 00:2a9c $21 $00 $c6
    jp   call_00_0186                                  ;; 00:2a9f $c3 $86 $01

call_00_2aa2:
    call call_00_01a7                                  ;; 00:2aa2 $cd $a7 $01
    ld   HL, wCC7C                                     ;; 00:2aa5 $21 $7c $cc
    call call_00_29e7                                  ;; 00:2aa8 $cd $e7 $29
    call call_00_2a73                                  ;; 00:2aab $cd $73 $2a
    jp   jp_00_2a7d                                    ;; 00:2aae $c3 $7d $2a

call_00_2ab1:
    ld   A, $0a                                        ;; 00:2ab1 $3e $0a
    call call_00_2669                                  ;; 00:2ab3 $cd $69 $26

call_00_2ab6:
    ld   C, A                                          ;; 00:2ab6 $4f
    ld   B, $04                                        ;; 00:2ab7 $06 $04
    ld   HL, wC3E4                                     ;; 00:2ab9 $21 $e4 $c3
.jr_00_2abc:
    ld   [HL], C                                       ;; 00:2abc $71
    ld   A, C                                          ;; 00:2abd $79
    or   A, A                                          ;; 00:2abe $b7
    jr   Z, .jr_00_2ac2                                ;; 00:2abf $28 $01
    dec  C                                             ;; 00:2ac1 $0d
.jr_00_2ac2:
    inc  HL                                            ;; 00:2ac2 $23
    dec  B                                             ;; 00:2ac3 $05
    jr   NZ, .jr_00_2abc                               ;; 00:2ac4 $20 $f6
    ld   BC, $707                                      ;; 00:2ac6 $01 $07 $07
    call call_00_2d0f                                  ;; 00:2ac9 $cd $0f $2d
    ld   DE, $13                                       ;; 00:2acc $11 $13 $00
    ld   HL, wC614                                     ;; 00:2acf $21 $14 $c6
    ld   A, $09                                        ;; 00:2ad2 $3e $09
    rst  rst_00_0008                                   ;; 00:2ad4 $cf
    ld   DE, $9ca7                                     ;; 00:2ad5 $11 $a7 $9c
    ld   BC, $909                                      ;; 00:2ad8 $01 $09 $09
    jp   call_00_2a9c                                  ;; 00:2adb $c3 $9c $2a

call_00_2ade:
    push HL                                            ;; 00:2ade $e5
    ld   H, $00                                        ;; 00:2adf $26 $00
    ld   L, A                                          ;; 00:2ae1 $6f
    add  HL, HL                                        ;; 00:2ae2 $29
    add  HL, HL                                        ;; 00:2ae3 $29
    add  HL, HL                                        ;; 00:2ae4 $29
    ld   DE, $4640                                     ;; 00:2ae5 $11 $40 $46
    add  HL, DE                                        ;; 00:2ae8 $19
    ld   E, L                                          ;; 00:2ae9 $5d
    ld   D, H                                          ;; 00:2aea $54
    pop  HL                                            ;; 00:2aeb $e1
    ld   A, $05                                        ;; 00:2aec $3e $05
    rst  switchBank                                    ;; 00:2aee $ef
    ret                                                ;; 00:2aef $c9

call_00_2af0:
    ld   BC, $1004                                     ;; 00:2af0 $01 $04 $10
    call call_00_2d0f                                  ;; 00:2af3 $cd $0f $2d
    ld   HL, wC3DA                                     ;; 00:2af6 $21 $da $c3
    ld   DE, wCCC6                                     ;; 00:2af9 $11 $c6 $cc
    ld   A, [DE]                                       ;; 00:2afc $1a
    ld   [HL+], A                                      ;; 00:2afd $22
    dec  E                                             ;; 00:2afe $1d
    ld   A, [DE]                                       ;; 00:2aff $1a
    ld   [HL], A                                       ;; 00:2b00 $77
    ld   DE, $31                                       ;; 00:2b01 $11 $31 $00
    ld   HL, wC625                                     ;; 00:2b04 $21 $25 $c6
    ld   A, $12                                        ;; 00:2b07 $3e $12
    rst  rst_00_0008                                   ;; 00:2b09 $cf
    ld   DE, $9c61                                     ;; 00:2b0a $11 $61 $9c
    ld   BC, $1206                                     ;; 00:2b0d $01 $06 $12
    call call_00_2a9c                                  ;; 00:2b10 $cd $9c $2a
    ld   BC, $1004                                     ;; 00:2b13 $01 $04 $10
    call call_00_2d0f                                  ;; 00:2b16 $cd $0f $2d
    call call_00_32c3                                  ;; 00:2b19 $cd $c3 $32
    ld   DE, $0d                                       ;; 00:2b1c $11 $0d $00
    ld   HL, wC626                                     ;; 00:2b1f $21 $26 $c6
    ld   A, $12                                        ;; 00:2b22 $3e $12
    rst  rst_00_0008                                   ;; 00:2b24 $cf
    ld   DE, $9d81                                     ;; 00:2b25 $11 $81 $9d
    ld   BC, $1206                                     ;; 00:2b28 $01 $06 $12
    jp   call_00_2a9c                                  ;; 00:2b2b $c3 $9c $2a

call_00_2b2e:
    ldh  [hFFF3], A                                    ;; 00:2b2e $e0 $f3
    xor  A, A                                          ;; 00:2b30 $af
    ldh  [hFFCF], A                                    ;; 00:2b31 $e0 $cf
    ldh  [hFFCE], A                                    ;; 00:2b33 $e0 $ce
    ldh  [hFFF2], A                                    ;; 00:2b35 $e0 $f2
    ld   A, E                                          ;; 00:2b37 $7b
    ldh  [hFFF4], A                                    ;; 00:2b38 $e0 $f4
    ld   A, D                                          ;; 00:2b3a $7a
    ldh  [hFFF5], A                                    ;; 00:2b3b $e0 $f5
    ld   A, B                                          ;; 00:2b3d $78
    ldh  [hFFF6], A                                    ;; 00:2b3e $e0 $f6
    ld   A, C                                          ;; 00:2b40 $79
    ldh  [hFFF7], A                                    ;; 00:2b41 $e0 $f7
    ld   A, L                                          ;; 00:2b43 $7d
    ldh  [hFFF0], A                                    ;; 00:2b44 $e0 $f0
    ld   A, H                                          ;; 00:2b46 $7c
    ldh  [hFFF1], A                                    ;; 00:2b47 $e0 $f1
    ld   DE, $00                                       ;; 00:2b49 $11 $00 $00
    jr   jr_00_2b82                                    ;; 00:2b4c $18 $34

call_00_2b4e:
    ldh  A, [hFFCF]                                    ;; 00:2b4e $f0 $cf
    ld   E, A                                          ;; 00:2b50 $5f
    ldh  A, [hFFCE]                                    ;; 00:2b51 $f0 $ce
    ld   D, A                                          ;; 00:2b53 $57
    ldh  A, [hFFF0]                                    ;; 00:2b54 $f0 $f0
    ld   L, A                                          ;; 00:2b56 $6f
    ldh  A, [hFFF1]                                    ;; 00:2b57 $f0 $f1
    ld   H, A                                          ;; 00:2b59 $67
    rst  rst_00_0010                                   ;; 00:2b5a $d7
    rst  rst_00_0018                                   ;; 00:2b5b $df
    call call_00_0174                                  ;; 00:2b5c $cd $74 $01
    or   A, A                                          ;; 00:2b5f $b7
    jr   Z, call_00_2b4e                               ;; 00:2b60 $28 $ec
    bit  0, A                                          ;; 00:2b62 $cb $47
    jp   NZ, jp_00_2bca                                ;; 00:2b64 $c2 $ca $2b
    bit  1, A                                          ;; 00:2b67 $cb $4f
    jp   NZ, jp_00_2bc7                                ;; 00:2b69 $c2 $c7 $2b
    rlca                                               ;; 00:2b6c $07
    jr   C, .jr_00_2b7b                                ;; 00:2b6d $38 $0c
    rlca                                               ;; 00:2b6f $07
    jr   C, .jr_00_2b7e                                ;; 00:2b70 $38 $0c
    rlca                                               ;; 00:2b72 $07
    jr   C, .jr_00_2b81                                ;; 00:2b73 $38 $0c
    rlca                                               ;; 00:2b75 $07
    jr   NC, call_00_2b4e                              ;; 00:2b76 $30 $d6
    inc  D                                             ;; 00:2b78 $14
    jr   jr_00_2b82                                    ;; 00:2b79 $18 $07
.jr_00_2b7b:
    inc  E                                             ;; 00:2b7b $1c
    jr   jr_00_2b82                                    ;; 00:2b7c $18 $04
.jr_00_2b7e:
    dec  E                                             ;; 00:2b7e $1d
    jr   jr_00_2b82                                    ;; 00:2b7f $18 $01
.jr_00_2b81:
    dec  D                                             ;; 00:2b81 $15

jr_00_2b82:
    ld   A, E                                          ;; 00:2b82 $7b
    cp   A, [HL]                                       ;; 00:2b83 $be
    jr   C, .jr_00_2b8f                                ;; 00:2b84 $38 $09
    cp   A, $f0                                        ;; 00:2b86 $fe $f0
    jr   NC, .jr_00_2b8d                               ;; 00:2b88 $30 $03
    sub  A, [HL]                                       ;; 00:2b8a $96
    jr   .jr_00_2b8e                                   ;; 00:2b8b $18 $01
.jr_00_2b8d:
    add  A, [HL]                                       ;; 00:2b8d $86
.jr_00_2b8e:
    ld   E, A                                          ;; 00:2b8e $5f
.jr_00_2b8f:
    inc  HL                                            ;; 00:2b8f $23
    ld   A, D                                          ;; 00:2b90 $7a
    ld   B, [HL]                                       ;; 00:2b91 $46
    dec  B                                             ;; 00:2b92 $05
    cp   A, B                                          ;; 00:2b93 $b8
    jr   C, .jr_00_2b9f                                ;; 00:2b94 $38 $09
    cp   A, $f0                                        ;; 00:2b96 $fe $f0
    jr   NC, .jr_00_2b9d                               ;; 00:2b98 $30 $03
    sub  A, B                                          ;; 00:2b9a $90
    jr   .jr_00_2b9e                                   ;; 00:2b9b $18 $01
.jr_00_2b9d:
    add  A, B                                          ;; 00:2b9d $80
.jr_00_2b9e:
    ld   D, A                                          ;; 00:2b9e $57
.jr_00_2b9f:
    inc  B                                             ;; 00:2b9f $04
    inc  HL                                            ;; 00:2ba0 $23
    xor  A, A                                          ;; 00:2ba1 $af
.jr_00_2ba2:
    add  A, E                                          ;; 00:2ba2 $83
    dec  B                                             ;; 00:2ba3 $05
    jr   NZ, .jr_00_2ba2                               ;; 00:2ba4 $20 $fc
    rst  add_hl_a                                      ;; 00:2ba6 $c7
    ld   C, [HL]                                       ;; 00:2ba7 $4e
    push BC                                            ;; 00:2ba8 $c5
    ld   C, D                                          ;; 00:2ba9 $4a
    inc  C                                             ;; 00:2baa $0c
    ld   B, $00                                        ;; 00:2bab $06 $00
    add  HL, BC                                        ;; 00:2bad $09
    pop  BC                                            ;; 00:2bae $c1
    ld   A, [HL]                                       ;; 00:2baf $7e
    ld   B, A                                          ;; 00:2bb0 $47
    inc  A                                             ;; 00:2bb1 $3c
    jr   Z, call_00_2b4e                               ;; 00:2bb2 $28 $9a
    inc  A                                             ;; 00:2bb4 $3c
    jr   Z, jr_00_2bd8                                 ;; 00:2bb5 $28 $21
    inc  A                                             ;; 00:2bb7 $3c
    jp   Z, jp_00_2c35                                 ;; 00:2bb8 $ca $35 $2c
    ld   A, E                                          ;; 00:2bbb $7b
    ldh  [hFFCF], A                                    ;; 00:2bbc $e0 $cf
    ld   A, D                                          ;; 00:2bbe $7a
    ldh  [hFFCE], A                                    ;; 00:2bbf $e0 $ce
    call call_00_2c42                                  ;; 00:2bc1 $cd $42 $2c
    jp   call_00_2b4e                                  ;; 00:2bc4 $c3 $4e $2b

jp_00_2bc7:
    ld   A, $ff                                        ;; 00:2bc7 $3e $ff
    ret                                                ;; 00:2bc9 $c9

jp_00_2bca:
    inc  HL                                            ;; 00:2bca $23
    ldh  A, [hFFF2]                                    ;; 00:2bcb $f0 $f2
    add  A, E                                          ;; 00:2bcd $83
    ld   E, A                                          ;; 00:2bce $5f
    ld   B, [HL]                                       ;; 00:2bcf $46
    dec  B                                             ;; 00:2bd0 $05
    xor  A, A                                          ;; 00:2bd1 $af
.jr_00_2bd2:
    add  A, E                                          ;; 00:2bd2 $83
    dec  B                                             ;; 00:2bd3 $05
    jr   NZ, .jr_00_2bd2                               ;; 00:2bd4 $20 $fc
    add  A, D                                          ;; 00:2bd6 $82
    ret                                                ;; 00:2bd7 $c9

jr_00_2bd8:
    ldh  A, [hFFF3]                                    ;; 00:2bd8 $f0 $f3
    ld   B, A                                          ;; 00:2bda $47
    ldh  A, [hFFF2]                                    ;; 00:2bdb $f0 $f2
    inc  A                                             ;; 00:2bdd $3c
    cp   A, B                                          ;; 00:2bde $b8
    jp   NC, call_00_2b4e                              ;; 00:2bdf $d2 $4e $2b
    ldh  [hFFF2], A                                    ;; 00:2be2 $e0 $f2
    ld   C, $f0                                        ;; 00:2be4 $0e $f0

call_00_2be6:
    push BC                                            ;; 00:2be6 $c5
    ld   HL, wC600                                     ;; 00:2be7 $21 $00 $c6
    ld   DE, $00                                       ;; 00:2bea $11 $00 $00
    or   A, A                                          ;; 00:2bed $b7
    jr   Z, .jr_00_2bf9                                ;; 00:2bee $28 $09
    ld   B, A                                          ;; 00:2bf0 $47
    ldh  A, [hFFF6]                                    ;; 00:2bf1 $f0 $f6
    add  A, A                                          ;; 00:2bf3 $87
.jr_00_2bf4:
    rst  add_hl_a                                      ;; 00:2bf4 $c7
    add  HL, DE                                        ;; 00:2bf5 $19
    dec  B                                             ;; 00:2bf6 $05
    jr   NZ, .jr_00_2bf4                               ;; 00:2bf7 $20 $fb
.jr_00_2bf9:
    ldh  A, [hFFF4]                                    ;; 00:2bf9 $f0 $f4
    ld   E, A                                          ;; 00:2bfb $5f
    ldh  A, [hFFF5]                                    ;; 00:2bfc $f0 $f5
    ld   D, A                                          ;; 00:2bfe $57
    ldh  A, [hFFF7]                                    ;; 00:2bff $f0 $f7
    ld   C, A                                          ;; 00:2c01 $4f
    ldh  A, [hFFF6]                                    ;; 00:2c02 $f0 $f6
    ld   B, A                                          ;; 00:2c04 $47
    call call_00_0186                                  ;; 00:2c05 $cd $86 $01
    pop  BC                                            ;; 00:2c08 $c1
    ld   A, [wC5CB]                                    ;; 00:2c09 $fa $cb $c5
    or   A, A                                          ;; 00:2c0c $b7
    jp   NZ, call_00_2b4e                              ;; 00:2c0d $c2 $4e $2b
    ld   HL, wC080                                     ;; 00:2c10 $21 $80 $c0
    ld   A, [HL]                                       ;; 00:2c13 $7e
    cp   A, $fa                                        ;; 00:2c14 $fe $fa
    jp   Z, call_00_2b4e                               ;; 00:2c16 $ca $4e $2b
    ld   E, $90                                        ;; 00:2c19 $1e $90
    add  A, C                                          ;; 00:2c1b $81
    cp   A, $20                                        ;; 00:2c1c $fe $20
    jr   C, .jr_00_2c26                                ;; 00:2c1e $38 $06
    cp   A, $98                                        ;; 00:2c20 $fe $98
    jr   NC, .jr_00_2c26                               ;; 00:2c22 $30 $02
    ld   E, $00                                        ;; 00:2c24 $1e $00
.jr_00_2c26:
    ld   B, $04                                        ;; 00:2c26 $06 $04
.jr_00_2c28:
    ld   A, [HL]                                       ;; 00:2c28 $7e
    add  A, C                                          ;; 00:2c29 $81
    ld   [HL+], A                                      ;; 00:2c2a $22
    inc  L                                             ;; 00:2c2b $2c
    inc  L                                             ;; 00:2c2c $2c
    ld   [HL], E                                       ;; 00:2c2d $73
    inc  L                                             ;; 00:2c2e $2c
    dec  B                                             ;; 00:2c2f $05
    jr   NZ, .jr_00_2c28                               ;; 00:2c30 $20 $f6
    jp   call_00_2b4e                                  ;; 00:2c32 $c3 $4e $2b

jp_00_2c35:
    ldh  A, [hFFF2]                                    ;; 00:2c35 $f0 $f2
    or   A, A                                          ;; 00:2c37 $b7
    jp   Z, call_00_2b4e                               ;; 00:2c38 $ca $4e $2b
    dec  A                                             ;; 00:2c3b $3d
    ldh  [hFFF2], A                                    ;; 00:2c3c $e0 $f2
    ld   C, $10                                        ;; 00:2c3e $0e $10
    jr   call_00_2be6                                  ;; 00:2c40 $18 $a4

call_00_2c42:
    ld   L, $90                                        ;; 00:2c42 $2e $90
    ld   E, $7c                                        ;; 00:2c44 $1e $7c
    ld   H, $02                                        ;; 00:2c46 $26 $02

jp_00_2c48:
    push BC                                            ;; 00:2c48 $c5
    push HL                                            ;; 00:2c49 $e5
    ld   D, $02                                        ;; 00:2c4a $16 $02
.jr_00_2c4c:
    ld   H, $c0                                        ;; 00:2c4c $26 $c0
    ld   [HL], C                                       ;; 00:2c4e $71
    inc  L                                             ;; 00:2c4f $2c
    ld   [HL], B                                       ;; 00:2c50 $70
    inc  L                                             ;; 00:2c51 $2c
    ld   [HL], E                                       ;; 00:2c52 $73
    inc  L                                             ;; 00:2c53 $2c
    ld   [HL], $00                                     ;; 00:2c54 $36 $00
    inc  L                                             ;; 00:2c56 $2c
    ld   A, B                                          ;; 00:2c57 $78
    add  A, $08                                        ;; 00:2c58 $c6 $08
    ld   B, A                                          ;; 00:2c5a $47
    inc  E                                             ;; 00:2c5b $1c
    dec  D                                             ;; 00:2c5c $15
    jr   NZ, .jr_00_2c4c                               ;; 00:2c5d $20 $ed
    pop  HL                                            ;; 00:2c5f $e1
    ld   A, L                                          ;; 00:2c60 $7d
    add  A, $08                                        ;; 00:2c61 $c6 $08
    ld   L, A                                          ;; 00:2c63 $6f
    pop  BC                                            ;; 00:2c64 $c1
    ld   A, C                                          ;; 00:2c65 $79
    add  A, $08                                        ;; 00:2c66 $c6 $08
    ld   C, A                                          ;; 00:2c68 $4f
    dec  H                                             ;; 00:2c69 $25
    jr   NZ, jp_00_2c48                                ;; 00:2c6a $20 $dc
    ret                                                ;; 00:2c6c $c9

call_00_2c6d:
    ld   BC, $120b                                     ;; 00:2c6d $01 $0b $12
    call call_00_2d0f                                  ;; 00:2c70 $cd $0f $2d
    call call_00_3d66                                  ;; 00:2c73 $cd $66 $3d
    ld   DE, $0e                                       ;; 00:2c76 $11 $0e $00
    ld   HL, wC62A                                     ;; 00:2c79 $21 $2a $c6
    ld   BC, $102                                      ;; 00:2c7c $01 $02 $01
    ld   A, $14                                        ;; 00:2c7f $3e $14
    rst  rst_00_0008                                   ;; 00:2c81 $cf
    ld   DE, $9c00                                     ;; 00:2c82 $11 $00 $9c
    ld   BC, $140d                                     ;; 00:2c85 $01 $0d $14
    jp   call_00_2a9c                                  ;; 00:2c88 $c3 $9c $2a

call_00_2c8b:
    ld   BC, $1004                                     ;; 00:2c8b $01 $04 $10
    call call_00_2d0f                                  ;; 00:2c8e $cd $0f $2d
    ld   DE, $0f                                       ;; 00:2c91 $11 $0f $00
    ld   HL, wC626                                     ;; 00:2c94 $21 $26 $c6
    ld   A, $12                                        ;; 00:2c97 $3e $12
    rst  rst_00_0008                                   ;; 00:2c99 $cf
    ld   DE, $9d81                                     ;; 00:2c9a $11 $81 $9d
    ld   BC, $1206                                     ;; 00:2c9d $01 $06 $12
    jp   call_00_2a9c                                  ;; 00:2ca0 $c3 $9c $2a

call_00_2ca3:
    ld   HL, wC070                                     ;; 00:2ca3 $21 $70 $c0
    ld   B, $04                                        ;; 00:2ca6 $06 $04
    jr   jr_00_2cbd                                    ;; 00:2ca8 $18 $13

call_00_2caa:
    ld   HL, wC080                                     ;; 00:2caa $21 $80 $c0
    ld   B, $04                                        ;; 00:2cad $06 $04
    jr   jr_00_2cbd                                    ;; 00:2caf $18 $0c

call_00_2cb1:
    ld   HL, wC090                                     ;; 00:2cb1 $21 $90 $c0
    ld   B, $04                                        ;; 00:2cb4 $06 $04
    jr   jr_00_2cbd                                    ;; 00:2cb6 $18 $05

call_00_2cb8:
    ld   HL, wC000                                     ;; 00:2cb8 $21 $00 $c0
    ld   B, $28                                        ;; 00:2cbb $06 $28

jr_00_2cbd:
    ld   A, $fa                                        ;; 00:2cbd $3e $fa
.jr_00_2cbf:
    ld   [HL+], A                                      ;; 00:2cbf $22
    inc  L                                             ;; 00:2cc0 $2c
    inc  L                                             ;; 00:2cc1 $2c
    inc  L                                             ;; 00:2cc2 $2c
    dec  B                                             ;; 00:2cc3 $05
    jr   NZ, .jr_00_2cbf                               ;; 00:2cc4 $20 $f9
    rst  rst_00_0010                                   ;; 00:2cc6 $d7
    rst  rst_00_0018                                   ;; 00:2cc7 $df
    ret                                                ;; 00:2cc8 $c9

call_00_2cc9:
    ld   DE, wC070                                     ;; 00:2cc9 $11 $70 $c0
    jr   jr_00_2cd1                                    ;; 00:2ccc $18 $03

call_00_2cce:
    ld   DE, wC080                                     ;; 00:2cce $11 $80 $c0

jr_00_2cd1:
    ld   HL, wC090                                     ;; 00:2cd1 $21 $90 $c0
    ld   C, $04                                        ;; 00:2cd4 $0e $04

call_00_2cd6:
    ld   B, $04                                        ;; 00:2cd6 $06 $04
.jr_00_2cd8:
    ld   A, [HL+]                                      ;; 00:2cd8 $2a
    ld   [DE], A                                       ;; 00:2cd9 $12
    inc  E                                             ;; 00:2cda $1c
    ld   A, [HL+]                                      ;; 00:2cdb $2a
    add  A, C                                          ;; 00:2cdc $81
    ld   [DE], A                                       ;; 00:2cdd $12
    inc  E                                             ;; 00:2cde $1c
    ld   A, [HL+]                                      ;; 00:2cdf $2a
    ld   [DE], A                                       ;; 00:2ce0 $12
    inc  E                                             ;; 00:2ce1 $1c
    ld   A, [HL+]                                      ;; 00:2ce2 $2a
    ld   [DE], A                                       ;; 00:2ce3 $12
    inc  E                                             ;; 00:2ce4 $1c
    dec  B                                             ;; 00:2ce5 $05
    jr   NZ, .jr_00_2cd8                               ;; 00:2ce6 $20 $f0
    ret                                                ;; 00:2ce8 $c9

call_00_2ce9:
    ld   DE, $9d40                                     ;; 00:2ce9 $11 $40 $9d
    ld   BC, $1408                                     ;; 00:2cec $01 $08 $14
    jp   call_00_2a9c                                  ;; 00:2cef $c3 $9c $2a

call_00_2cf2:
    ld   HL, $9c00                                     ;; 00:2cf2 $21 $00 $9c
    ld   C, $12                                        ;; 00:2cf5 $0e $12
    ld   DE, $0c                                       ;; 00:2cf7 $11 $0c $00
    ld   A, $ff                                        ;; 00:2cfa $3e $ff
    call call_00_017a                                  ;; 00:2cfc $cd $7a $01
.jr_00_2cff:
    ld   B, $14                                        ;; 00:2cff $06 $14
.jr_00_2d01:
    ld   [HL+], A                                      ;; 00:2d01 $22
    dec  B                                             ;; 00:2d02 $05
    jr   NZ, .jr_00_2d01                               ;; 00:2d03 $20 $fc
    add  HL, DE                                        ;; 00:2d05 $19
    dec  C                                             ;; 00:2d06 $0d
    jr   NZ, .jr_00_2cff                               ;; 00:2d07 $20 $f6
    jp   call_00_017d                                  ;; 00:2d09 $c3 $7d $01

call_00_2d0c:
    ld   BC, $1206                                     ;; 00:2d0c $01 $06 $12

call_00_2d0f:
    push BC                                            ;; 00:2d0f $c5
    call call_00_01a7                                  ;; 00:2d10 $cd $a7 $01
    pop  BC                                            ;; 00:2d13 $c1
    ld   HL, wC600                                     ;; 00:2d14 $21 $00 $c6
    jp   call_00_01bf                                  ;; 00:2d17 $c3 $bf $01

call_00_2d1a:
    call call_00_2cf2                                  ;; 00:2d1a $cd $f2 $2c
    call call_00_14e8                                  ;; 00:2d1d $cd $e8 $14
    call call_00_2cb8                                  ;; 00:2d20 $cd $b8 $2c
    jp   call_00_3dc1                                  ;; 00:2d23 $c3 $c1 $3d

jp_00_2d26:
    call call_00_2cf2                                  ;; 00:2d26 $cd $f2 $2c
    call call_00_2cb8                                  ;; 00:2d29 $cd $b8 $2c
    call call_00_2d89                                  ;; 00:2d2c $cd $89 $2d
    ld   HL, $3f08                                     ;; 00:2d2f $21 $08 $3f
    xor  A, A                                          ;; 00:2d32 $af
    call call_00_2b2e                                  ;; 00:2d33 $cd $2e $2b
    cp   A, $ff                                        ;; 00:2d36 $fe $ff
    jr   NZ, jr_00_2d41                                ;; 00:2d38 $20 $07

jp_00_2d3a:
    xor  A, A                                          ;; 00:2d3a $af
    ld   [wC3AB], A                                    ;; 00:2d3b $ea $ab $c3
    jp   jp_00_26ce                                    ;; 00:2d3e $c3 $ce $26

jr_00_2d41:
    push AF                                            ;; 00:2d41 $f5
    ld   HL, wCC8C                                     ;; 00:2d42 $21 $8c $cc
    cp   A, [HL]                                       ;; 00:2d45 $be
    jr   NZ, .jr_00_2d54                               ;; 00:2d46 $20 $0c
    pop  AF                                            ;; 00:2d48 $f1
    ld   DE, $2a                                       ;; 00:2d49 $11 $2a $00
    call call_00_2e36                                  ;; 00:2d4c $cd $36 $2e
    call call_00_3cf7                                  ;; 00:2d4f $cd $f7 $3c
    jr   jp_00_2d26                                    ;; 00:2d52 $18 $d2
.jr_00_2d54:
    call call_00_3cec                                  ;; 00:2d54 $cd $ec $3c
    ld   L, A                                          ;; 00:2d57 $6f
    ld   H, $cc                                        ;; 00:2d58 $26 $cc
    pop  DE                                            ;; 00:2d5a $d1
    ld   A, [HL]                                       ;; 00:2d5b $7e
    bit  0, A                                          ;; 00:2d5c $cb $47
    jr   NZ, .jr_00_2d6b                               ;; 00:2d5e $20 $0b
    ld   DE, $2d                                       ;; 00:2d60 $11 $2d $00
    call call_00_2e36                                  ;; 00:2d63 $cd $36 $2e
    call call_00_3cf7                                  ;; 00:2d66 $cd $f7 $3c
    jr   jp_00_2d26                                    ;; 00:2d69 $18 $bb
.jr_00_2d6b:
    push DE                                            ;; 00:2d6b $d5
    ld   DE, $2c                                       ;; 00:2d6c $11 $2c $00
    call call_00_2f29                                  ;; 00:2d6f $cd $29 $2f
    ld   HL, $3f02                                     ;; 00:2d72 $21 $02 $3f
    xor  A, A                                          ;; 00:2d75 $af
    call call_00_2b2e                                  ;; 00:2d76 $cd $2e $2b
    pop  DE                                            ;; 00:2d79 $d1
    or   A, A                                          ;; 00:2d7a $b7
    jr   NZ, jp_00_2d26                                ;; 00:2d7b $20 $a9
    ld   E, D                                          ;; 00:2d7d $5a
    ld   A, [wC3AA]                                    ;; 00:2d7e $fa $aa $c3
    sub  A, $f2                                        ;; 00:2d81 $d6 $f2
    ld   D, A                                          ;; 00:2d83 $57
    call call_00_01bc                                  ;; 00:2d84 $cd $bc $01
    jr   jp_00_2d26                                    ;; 00:2d87 $18 $9d

call_00_2d89:
    call call_00_2cf2                                  ;; 00:2d89 $cd $f2 $2c
    ld   BC, $c02                                      ;; 00:2d8c $01 $02 $0c
    call call_00_2d0f                                  ;; 00:2d8f $cd $0f $2d
    ld   DE, $29                                       ;; 00:2d92 $11 $29 $00
    ld   HL, wC61D                                     ;; 00:2d95 $21 $1d $c6
    ld   A, $0e                                        ;; 00:2d98 $3e $0e
    rst  rst_00_0008                                   ;; 00:2d9a $cf
    ld   DE, $9c03                                     ;; 00:2d9b $11 $03 $9c
    ld   BC, $e04                                      ;; 00:2d9e $01 $04 $0e
    call call_00_2a9c                                  ;; 00:2da1 $cd $9c $2a
    call call_00_2e80                                  ;; 00:2da4 $cd $80 $2e
    ld   DE, $2b                                       ;; 00:2da7 $11 $2b $00
    jp   call_00_2e36                                  ;; 00:2daa $c3 $36 $2e

jp_00_2dad:
    call call_00_2cf2                                  ;; 00:2dad $cd $f2 $2c
    call call_00_2cb8                                  ;; 00:2db0 $cd $b8 $2c
.jp_00_2db3:
    call call_00_2e59                                  ;; 00:2db3 $cd $59 $2e
    ld   HL, $3f08                                     ;; 00:2db6 $21 $08 $3f
    xor  A, A                                          ;; 00:2db9 $af
    call call_00_2b2e                                  ;; 00:2dba $cd $2e $2b
    cp   A, $ff                                        ;; 00:2dbd $fe $ff
    jr   NZ, .jr_00_2dc4                               ;; 00:2dbf $20 $03
    jp   jp_00_2d3a                                    ;; 00:2dc1 $c3 $3a $2d
.jr_00_2dc4:
    call call_00_3cec                                  ;; 00:2dc4 $cd $ec $3c
    ld   L, A                                          ;; 00:2dc7 $6f
    ld   H, $cc                                        ;; 00:2dc8 $26 $cc
    ld   A, [HL]                                       ;; 00:2dca $7e
    cp   A, $ff                                        ;; 00:2dcb $fe $ff
    jr   Z, .jp_00_2db3                                ;; 00:2dcd $28 $e4
    bit  0, A                                          ;; 00:2dcf $cb $47
    jr   NZ, .jr_00_2dde                               ;; 00:2dd1 $20 $0b
    ld   DE, $28                                       ;; 00:2dd3 $11 $28 $00
    call call_00_2e36                                  ;; 00:2dd6 $cd $36 $2e
    call call_00_3cf7                                  ;; 00:2dd9 $cd $f7 $3c
    jr   .jp_00_2db3                                   ;; 00:2ddc $18 $d5
.jr_00_2dde:
    push HL                                            ;; 00:2dde $e5
    ld   A, L                                          ;; 00:2ddf $7d
    add  A, $0a                                        ;; 00:2de0 $c6 $0a
    ld   L, A                                          ;; 00:2de2 $6f
    ld   A, [HL]                                       ;; 00:2de3 $7e
    and  A, $0f                                        ;; 00:2de4 $e6 $0f
    jr   NZ, .jr_00_2df4                               ;; 00:2de6 $20 $0c
    pop  HL                                            ;; 00:2de8 $e1
    ld   DE, $24                                       ;; 00:2de9 $11 $24 $00
    call call_00_2e36                                  ;; 00:2dec $cd $36 $2e
    call call_00_3cf7                                  ;; 00:2def $cd $f7 $3c
    jr   .jp_00_2db3                                   ;; 00:2df2 $18 $bf
.jr_00_2df4:
    push HL                                            ;; 00:2df4 $e5
    ld   HL, wC400                                     ;; 00:2df5 $21 $00 $c4
    xor  A, A                                          ;; 00:2df8 $af
    ld   [HL+], A                                      ;; 00:2df9 $22
    ld   [HL], $01                                     ;; 00:2dfa $36 $01
    inc  HL                                            ;; 00:2dfc $23
    ld   [HL], A                                       ;; 00:2dfd $77
    ld   HL, wC402                                     ;; 00:2dfe $21 $02 $c4
    ld   DE, wCC8F                                     ;; 00:2e01 $11 $8f $cc
    ld   BC, hFFC2                                     ;; 00:2e04 $01 $c2 $ff
    call call_00_32ed                                  ;; 00:2e07 $cd $ed $32
    jr   NC, .jr_00_2e19                               ;; 00:2e0a $30 $0d
    pop  HL                                            ;; 00:2e0c $e1
    pop  HL                                            ;; 00:2e0d $e1
    ld   DE, $25                                       ;; 00:2e0e $11 $25 $00
    call call_00_2e36                                  ;; 00:2e11 $cd $36 $2e
    call call_00_3cf7                                  ;; 00:2e14 $cd $f7 $3c
    jr   .jp_00_2db3                                   ;; 00:2e17 $18 $9a
.jr_00_2e19:
    pop  HL                                            ;; 00:2e19 $e1
    dec  [HL]                                          ;; 00:2e1a $35
    pop  HL                                            ;; 00:2e1b $e1
    res  0, [HL]                                       ;; 00:2e1c $cb $86
    ld   A, L                                          ;; 00:2e1e $7d
    add  A, $06                                        ;; 00:2e1f $c6 $06
    ld   L, A                                          ;; 00:2e21 $6f
    ld   [HL], $01                                     ;; 00:2e22 $36 $01
    inc  L                                             ;; 00:2e24 $2c
    ld   [HL], $00                                     ;; 00:2e25 $36 $00
    call call_00_2e59                                  ;; 00:2e27 $cd $59 $2e
    ld   DE, $26                                       ;; 00:2e2a $11 $26 $00
    call call_00_2e36                                  ;; 00:2e2d $cd $36 $2e
    call call_00_3cf7                                  ;; 00:2e30 $cd $f7 $3c
    jp   .jp_00_2db3                                   ;; 00:2e33 $c3 $b3 $2d

call_00_2e36:
    push DE                                            ;; 00:2e36 $d5
    ld   BC, $904                                      ;; 00:2e37 $01 $04 $09
    call call_00_2d0f                                  ;; 00:2e3a $cd $0f $2d
    ld   DE, $9d29                                     ;; 00:2e3d $11 $29 $9d
    ld   BC, $b06                                      ;; 00:2e40 $01 $06 $0b
    call call_00_2a9c                                  ;; 00:2e43 $cd $9c $2a
    call call_00_01a7                                  ;; 00:2e46 $cd $a7 $01
    pop  DE                                            ;; 00:2e49 $d1
    ld   HL, wC600                                     ;; 00:2e4a $21 $00 $c6
    ld   A, $09                                        ;; 00:2e4d $3e $09
    rst  rst_00_0008                                   ;; 00:2e4f $cf
    ld   DE, $9d4a                                     ;; 00:2e50 $11 $4a $9d
    ld   BC, $904                                      ;; 00:2e53 $01 $04 $09
    jp   call_00_2a9c                                  ;; 00:2e56 $c3 $9c $2a

call_00_2e59:
    ld   BC, $1004                                     ;; 00:2e59 $01 $04 $10
    call call_00_2d0f                                  ;; 00:2e5c $cd $0f $2d
    ld   DE, $23                                       ;; 00:2e5f $11 $23 $00
    ld   HL, wC625                                     ;; 00:2e62 $21 $25 $c6
    ld   A, $12                                        ;; 00:2e65 $3e $12
    rst  rst_00_0008                                   ;; 00:2e67 $cf
    ld   DE, $9c01                                     ;; 00:2e68 $11 $01 $9c
    ld   BC, $1206                                     ;; 00:2e6b $01 $06 $12
    call call_00_2a9c                                  ;; 00:2e6e $cd $9c $2a
    ld   DE, $9dca                                     ;; 00:2e71 $11 $ca $9d
    call call_00_2fb8                                  ;; 00:2e74 $cd $b8 $2f
    call call_00_2e80                                  ;; 00:2e77 $cd $80 $2e
    ld   DE, $27                                       ;; 00:2e7a $11 $27 $00
    jp   call_00_2e36                                  ;; 00:2e7d $c3 $36 $2e

call_00_2e80:
    ld   BC, $702                                      ;; 00:2e80 $01 $02 $07
    ld   DE, $9ce1                                     ;; 00:2e83 $11 $e1 $9c
    push DE                                            ;; 00:2e86 $d5
    push BC                                            ;; 00:2e87 $c5
    ld   BC, $708                                      ;; 00:2e88 $01 $08 $07
    call call_00_2d0f                                  ;; 00:2e8b $cd $0f $2d
    call call_00_3d66                                  ;; 00:2e8e $cd $66 $3d
    ld   DE, $02                                       ;; 00:2e91 $11 $02 $00
    ld   HL, wC60A                                     ;; 00:2e94 $21 $0a $c6
    pop  BC                                            ;; 00:2e97 $c1
    ld   A, $09                                        ;; 00:2e98 $3e $09
    rst  rst_00_0008                                   ;; 00:2e9a $cf
    pop  DE                                            ;; 00:2e9b $d1
    ld   BC, $90a                                      ;; 00:2e9c $01 $0a $09
    jp   call_00_2a9c                                  ;; 00:2e9f $c3 $9c $2a

jp_00_2ea2:
    call call_00_2cf2                                  ;; 00:2ea2 $cd $f2 $2c
    call call_00_2cb8                                  ;; 00:2ea5 $cd $b8 $2c
.jr_00_2ea8:
    call call_00_2f40                                  ;; 00:2ea8 $cd $40 $2f
    ld   HL, $3f02                                     ;; 00:2eab $21 $02 $3f
    xor  A, A                                          ;; 00:2eae $af
    call call_00_2b2e                                  ;; 00:2eaf $cd $2e $2b
    or   A, A                                          ;; 00:2eb2 $b7
    jr   Z, .jr_00_2eb8                                ;; 00:2eb3 $28 $03
    jp   jp_00_2d3a                                    ;; 00:2eb5 $c3 $3a $2d
.jr_00_2eb8:
    ld   HL, wC402                                     ;; 00:2eb8 $21 $02 $c4
    ld   DE, wCC8F                                     ;; 00:2ebb $11 $8f $cc
    ld   BC, hFFC2                                     ;; 00:2ebe $01 $c2 $ff
    call call_00_32ed                                  ;; 00:2ec1 $cd $ed $32
    jr   NC, .jr_00_2ed4                               ;; 00:2ec4 $30 $0e
    call call_00_2cb1                                  ;; 00:2ec6 $cd $b1 $2c
    ld   DE, $25                                       ;; 00:2ec9 $11 $25 $00
    call call_00_2f29                                  ;; 00:2ecc $cd $29 $2f
    call call_00_3cf7                                  ;; 00:2ecf $cd $f7 $3c
    jr   .jr_00_2ea8                                   ;; 00:2ed2 $18 $d4
.jr_00_2ed4:
    ld   HL, wCC00                                     ;; 00:2ed4 $21 $00 $cc
    ld   B, $04                                        ;; 00:2ed7 $06 $04
.jr_00_2ed9:
    ld   A, [HL]                                       ;; 00:2ed9 $7e
    and  A, $03                                        ;; 00:2eda $e6 $03
    jr   NZ, .jr_00_2eed                               ;; 00:2edc $20 $0f
    push HL                                            ;; 00:2ede $e5
    ld   A, L                                          ;; 00:2edf $7d
    add  A, $08                                        ;; 00:2ee0 $c6 $08
    ld   L, A                                          ;; 00:2ee2 $6f
    ld   E, L                                          ;; 00:2ee3 $5d
    ld   D, H                                          ;; 00:2ee4 $54
    dec  E                                             ;; 00:2ee5 $1d
    dec  E                                             ;; 00:2ee6 $1d
    ld   A, [HL+]                                      ;; 00:2ee7 $2a
    ld   [DE], A                                       ;; 00:2ee8 $12
    inc  E                                             ;; 00:2ee9 $1c
    ld   A, [HL]                                       ;; 00:2eea $7e
    ld   [DE], A                                       ;; 00:2eeb $12
    pop  HL                                            ;; 00:2eec $e1
.jr_00_2eed:
    ld   A, L                                          ;; 00:2eed $7d
    add  A, $1f                                        ;; 00:2eee $c6 $1f
    ld   L, A                                          ;; 00:2ef0 $6f
    dec  B                                             ;; 00:2ef1 $05
    jr   NZ, .jr_00_2ed9                               ;; 00:2ef2 $20 $e5
    ld   L, $00                                        ;; 00:2ef4 $2e $00
    ld   B, $04                                        ;; 00:2ef6 $06 $04
.jr_00_2ef8:
    ld   A, [HL]                                       ;; 00:2ef8 $7e
    and  A, $03                                        ;; 00:2ef9 $e6 $03
    jr   NZ, .jr_00_2f06                               ;; 00:2efb $20 $09
    push HL                                            ;; 00:2efd $e5
    ld   A, L                                          ;; 00:2efe $7d
    add  A, $0f                                        ;; 00:2eff $c6 $0f
    ld   L, A                                          ;; 00:2f01 $6f
    call call_00_2fee                                  ;; 00:2f02 $cd $ee $2f
    pop  HL                                            ;; 00:2f05 $e1
.jr_00_2f06:
    ld   A, L                                          ;; 00:2f06 $7d
    add  A, $1f                                        ;; 00:2f07 $c6 $1f
    ld   L, A                                          ;; 00:2f09 $6f
    dec  B                                             ;; 00:2f0a $05
    jr   NZ, .jr_00_2ef8                               ;; 00:2f0b $20 $eb
    ld   HL, wCC7C                                     ;; 00:2f0d $21 $7c $cc
    call call_00_2fee                                  ;; 00:2f10 $cd $ee $2f
    call call_00_2cb1                                  ;; 00:2f13 $cd $b1 $2c
    call call_00_2f40                                  ;; 00:2f16 $cd $40 $2f
    ld   A, $15                                        ;; 00:2f19 $3e $15
    ldh  [hFFE4], A                                    ;; 00:2f1b $e0 $e4
    ld   DE, $2e                                       ;; 00:2f1d $11 $2e $00
    call call_00_2f29                                  ;; 00:2f20 $cd $29 $2f
    call call_00_3cf7                                  ;; 00:2f23 $cd $f7 $3c
    jp   jp_00_2d3a                                    ;; 00:2f26 $c3 $3a $2d

call_00_2f29:
    push DE                                            ;; 00:2f29 $d5
    ld   BC, $906                                      ;; 00:2f2a $01 $06 $09
    call call_00_2d0f                                  ;; 00:2f2d $cd $0f $2d
    pop  DE                                            ;; 00:2f30 $d1
    ld   HL, wC617                                     ;; 00:2f31 $21 $17 $c6
    ld   A, $0b                                        ;; 00:2f34 $3e $0b
    rst  rst_00_0008                                   ;; 00:2f36 $cf
    ld   DE, $9ce9                                     ;; 00:2f37 $11 $e9 $9c
    ld   BC, $b08                                      ;; 00:2f3a $01 $08 $0b
    jp   call_00_2a9c                                  ;; 00:2f3d $c3 $9c $2a

call_00_2f40:
    ld   BC, $e04                                      ;; 00:2f40 $01 $04 $0e
    call call_00_2d0f                                  ;; 00:2f43 $cd $0f $2d
    ld   DE, $21                                       ;; 00:2f46 $11 $21 $00
    ld   HL, wC622                                     ;; 00:2f49 $21 $22 $c6
    ld   A, $10                                        ;; 00:2f4c $3e $10
    rst  rst_00_0008                                   ;; 00:2f4e $cf
    ld   DE, $9c01                                     ;; 00:2f4f $11 $01 $9c
    ld   BC, $1006                                     ;; 00:2f52 $01 $06 $10
    call call_00_2a9c                                  ;; 00:2f55 $cd $9c $2a
    ld   DE, $9dca                                     ;; 00:2f58 $11 $ca $9d
    call call_00_2fb8                                  ;; 00:2f5b $cd $b8 $2f
    call call_00_2e80                                  ;; 00:2f5e $cd $80 $2e
    ld   HL, wCC00                                     ;; 00:2f61 $21 $00 $cc
    ld   BC, $00                                       ;; 00:2f64 $01 $00 $00
    ld   A, $04                                        ;; 00:2f67 $3e $04
.jr_00_2f69:
    push AF                                            ;; 00:2f69 $f5
    ld   A, [HL]                                       ;; 00:2f6a $7e
    and  A, $03                                        ;; 00:2f6b $e6 $03
    jr   NZ, .jr_00_2f88                               ;; 00:2f6d $20 $19
    push HL                                            ;; 00:2f6f $e5
    ld   A, L                                          ;; 00:2f70 $7d
    add  A, $09                                        ;; 00:2f71 $c6 $09
    ld   L, A                                          ;; 00:2f73 $6f
    ld   D, [HL]                                       ;; 00:2f74 $56
    dec  L                                             ;; 00:2f75 $2d
    ld   E, [HL]                                       ;; 00:2f76 $5e
    dec  L                                             ;; 00:2f77 $2d
    dec  L                                             ;; 00:2f78 $2d
    ld   A, E                                          ;; 00:2f79 $7b
    sub  A, [HL]                                       ;; 00:2f7a $96
    ld   E, A                                          ;; 00:2f7b $5f
    push AF                                            ;; 00:2f7c $f5
    inc  L                                             ;; 00:2f7d $2c
    pop  AF                                            ;; 00:2f7e $f1
    ld   A, D                                          ;; 00:2f7f $7a
    sbc  A, [HL]                                       ;; 00:2f80 $9e
    ld   D, A                                          ;; 00:2f81 $57
    ld   L, C                                          ;; 00:2f82 $69
    ld   H, B                                          ;; 00:2f83 $60
    add  HL, DE                                        ;; 00:2f84 $19
    ld   C, L                                          ;; 00:2f85 $4d
    ld   B, H                                          ;; 00:2f86 $44
    pop  HL                                            ;; 00:2f87 $e1
.jr_00_2f88:
    ld   A, L                                          ;; 00:2f88 $7d
    add  A, $1f                                        ;; 00:2f89 $c6 $1f
    ld   L, A                                          ;; 00:2f8b $6f
    pop  AF                                            ;; 00:2f8c $f1
    dec  A                                             ;; 00:2f8d $3d
    jr   NZ, .jr_00_2f69                               ;; 00:2f8e $20 $d9
    ld   L, C                                          ;; 00:2f90 $69
    ld   H, B                                          ;; 00:2f91 $60
    ld   BC, wC400                                     ;; 00:2f92 $01 $00 $c4
    xor  A, A                                          ;; 00:2f95 $af
    ld   [BC], A                                       ;; 00:2f96 $02
    ld   DE, $2710                                     ;; 00:2f97 $11 $10 $27
    call call_00_2fdf                                  ;; 00:2f9a $cd $df $2f
    ld   DE, $3e8                                      ;; 00:2f9d $11 $e8 $03
    call call_00_2fd2                                  ;; 00:2fa0 $cd $d2 $2f
    ld   DE, $64                                       ;; 00:2fa3 $11 $64 $00
    call call_00_2fdf                                  ;; 00:2fa6 $cd $df $2f
    ld   DE, $0a                                       ;; 00:2fa9 $11 $0a $00
    call call_00_2fd2                                  ;; 00:2fac $cd $d2 $2f
    ld   A, [BC]                                       ;; 00:2faf $0a
    or   A, L                                          ;; 00:2fb0 $b5
    ld   [BC], A                                       ;; 00:2fb1 $02
    ld   DE, $22                                       ;; 00:2fb2 $11 $22 $00
    jp   call_00_2f29                                  ;; 00:2fb5 $c3 $29 $2f

call_00_2fb8:
    push DE                                            ;; 00:2fb8 $d5
    ld   BC, $802                                      ;; 00:2fb9 $01 $02 $08
    call call_00_2d0f                                  ;; 00:2fbc $cd $0f $2d
    call call_00_32c3                                  ;; 00:2fbf $cd $c3 $32
    ld   DE, $1c                                       ;; 00:2fc2 $11 $1c $00
    ld   HL, wC615                                     ;; 00:2fc5 $21 $15 $c6
    ld   A, $0a                                        ;; 00:2fc8 $3e $0a
    rst  rst_00_0008                                   ;; 00:2fca $cf
    pop  DE                                            ;; 00:2fcb $d1
    ld   BC, $a04                                      ;; 00:2fcc $01 $04 $0a
    jp   call_00_2a9c                                  ;; 00:2fcf $c3 $9c $2a

call_00_2fd2:
    ld   A, $ff                                        ;; 00:2fd2 $3e $ff
.jr_00_2fd4:
    inc  A                                             ;; 00:2fd4 $3c
    call call_00_015c                                  ;; 00:2fd5 $cd $5c $01
    jr   NC, .jr_00_2fd4                               ;; 00:2fd8 $30 $fa
    add  HL, DE                                        ;; 00:2fda $19
    swap A                                             ;; 00:2fdb $cb $37
    ld   [BC], A                                       ;; 00:2fdd $02
    ret                                                ;; 00:2fde $c9

call_00_2fdf:
    ld   A, $ff                                        ;; 00:2fdf $3e $ff
.jr_00_2fe1:
    inc  A                                             ;; 00:2fe1 $3c
    call call_00_015c                                  ;; 00:2fe2 $cd $5c $01
    jr   NC, .jr_00_2fe1                               ;; 00:2fe5 $30 $fa
    add  HL, DE                                        ;; 00:2fe7 $19
    ld   E, A                                          ;; 00:2fe8 $5f
    ld   A, [BC]                                       ;; 00:2fe9 $0a
    or   A, E                                          ;; 00:2fea $b3
    ld   [BC], A                                       ;; 00:2feb $02
    inc  BC                                            ;; 00:2fec $03
    ret                                                ;; 00:2fed $c9

call_00_2fee:
    ld   C, $08                                        ;; 00:2fee $0e $08
.jr_00_2ff0:
    ld   A, [HL]                                       ;; 00:2ff0 $7e
    rlca                                               ;; 00:2ff1 $07
    jr   NC, .jr_00_3008                               ;; 00:2ff2 $30 $14
    inc  L                                             ;; 00:2ff4 $2c
    ld   A, [HL-]                                      ;; 00:2ff5 $3a
    inc  A                                             ;; 00:2ff6 $3c
    jr   Z, .jr_00_3008                                ;; 00:2ff7 $28 $0f
    ld   A, [HL]                                       ;; 00:2ff9 $7e
    call call_00_2ade                                  ;; 00:2ffa $cd $de $2a
    push HL                                            ;; 00:2ffd $e5
    ld   HL, $07                                       ;; 00:2ffe $21 $07 $00
    add  HL, DE                                        ;; 00:3001 $19
    ld   E, L                                          ;; 00:3002 $5d
    ld   D, H                                          ;; 00:3003 $54
    pop  HL                                            ;; 00:3004 $e1
    ld   A, [DE]                                       ;; 00:3005 $1a
    inc  L                                             ;; 00:3006 $2c
    ld   [HL-], A                                      ;; 00:3007 $32
.jr_00_3008:
    inc  L                                             ;; 00:3008 $2c
    inc  L                                             ;; 00:3009 $2c
    dec  C                                             ;; 00:300a $0d
    jr   NZ, .jr_00_2ff0                               ;; 00:300b $20 $e3
    ret                                                ;; 00:300d $c9

call_00_300e:
    call call_00_2d1a                                  ;; 00:300e $cd $1a $2d
    ld   A, [wC3AA]                                    ;; 00:3011 $fa $aa $c3
    cp   A, $f0                                        ;; 00:3014 $fe $f0
    jp   Z, jp_00_2ea2                                 ;; 00:3016 $ca $a2 $2e
    cp   A, $f1                                        ;; 00:3019 $fe $f1
    jp   Z, jp_00_2dad                                 ;; 00:301b $ca $ad $2d
    cp   A, $f2                                        ;; 00:301e $fe $f2
    jp   NC, jp_00_2d26                                ;; 00:3020 $d2 $26 $2d

jp_00_3023:
    call call_00_2cf2                                  ;; 00:3023 $cd $f2 $2c
    call call_00_2cb8                                  ;; 00:3026 $cd $b8 $2c
    call call_00_3296                                  ;; 00:3029 $cd $96 $32
    ld   HL, $3edb                                     ;; 00:302c $21 $db $3e
    xor  A, A                                          ;; 00:302f $af
    call call_00_2b2e                                  ;; 00:3030 $cd $2e $2b
    or   A, A                                          ;; 00:3033 $b7
    jp   Z, jp_00_312c                                 ;; 00:3034 $ca $2c $31
    dec  A                                             ;; 00:3037 $3d
    jp   Z, .jp_00_303e                                ;; 00:3038 $ca $3e $30
    jp   jp_00_2d3a                                    ;; 00:303b $c3 $3a $2d
.jp_00_303e:
    call call_00_2cc9                                  ;; 00:303e $cd $c9 $2c
.jp_00_3041:
    call call_00_2caa                                  ;; 00:3041 $cd $aa $2c
    call call_00_30fc                                  ;; 00:3044 $cd $fc $30
    ld   HL, $3eef                                     ;; 00:3047 $21 $ef $3e
    ld   DE, $9c2a                                     ;; 00:304a $11 $2a $9c
    ld   BC, $908                                      ;; 00:304d $01 $08 $09
    ld   A, $05                                        ;; 00:3050 $3e $05
    call call_00_2b2e                                  ;; 00:3052 $cd $2e $2b
    cp   A, $ff                                        ;; 00:3055 $fe $ff
    jp   Z, jp_00_3023                                 ;; 00:3057 $ca $23 $30
    ld   [wC5C6], A                                    ;; 00:305a $ea $c6 $c5
    call call_00_2cce                                  ;; 00:305d $cd $ce $2c
    call call_00_30a9                                  ;; 00:3060 $cd $a9 $30
    cp   A, $ff                                        ;; 00:3063 $fe $ff
    jr   NZ, .jr_00_306d                               ;; 00:3065 $20 $06
    call call_00_3094                                  ;; 00:3067 $cd $94 $30
    jp   .jp_00_3041                                   ;; 00:306a $c3 $41 $30
.jr_00_306d:
    ld   HL, $3efd                                     ;; 00:306d $21 $fd $3e
    xor  A, A                                          ;; 00:3070 $af
    call call_00_2b2e                                  ;; 00:3071 $cd $2e $2b
    or   A, A                                          ;; 00:3074 $b7
    jp   NZ, .jp_00_3041                               ;; 00:3075 $c2 $41 $30
    ld   A, [wC5C6]                                    ;; 00:3078 $fa $c6 $c5
    add  A, A                                          ;; 00:307b $87
    add  A, $7c                                        ;; 00:307c $c6 $7c
    ld   L, A                                          ;; 00:307e $6f
    ld   H, $cc                                        ;; 00:307f $26 $cc
    ld   A, [HL+]                                      ;; 00:3081 $2a
    ld   [HL], $ff                                     ;; 00:3082 $36 $ff
    ld   DE, wC53D                                     ;; 00:3084 $11 $3d $c5
    ld   HL, wCC90                                     ;; 00:3087 $21 $90 $cc
    call call_00_32d2                                  ;; 00:308a $cd $d2 $32
    ld   A, $17                                        ;; 00:308d $3e $17
    ldh  [hFFE4], A                                    ;; 00:308f $e0 $e4
    jp   .jp_00_3041                                   ;; 00:3091 $c3 $41 $30

call_00_3094:
    call call_00_2d0c                                  ;; 00:3094 $cd $0c $2d
    ld   DE, $1d                                       ;; 00:3097 $11 $1d $00
    ld   HL, wC62A                                     ;; 00:309a $21 $2a $c6
    ld   A, $14                                        ;; 00:309d $3e $14
    rst  rst_00_0008                                   ;; 00:309f $cf
    call call_00_2ce9                                  ;; 00:30a0 $cd $e9 $2c
    call call_00_2cb8                                  ;; 00:30a3 $cd $b8 $2c
    jp   call_00_3cf7                                  ;; 00:30a6 $c3 $f7 $3c

call_00_30a9:
    ld   A, [wC5C6]                                    ;; 00:30a9 $fa $c6 $c5
    add  A, A                                          ;; 00:30ac $87
    add  A, $7d                                        ;; 00:30ad $c6 $7d
    ld   E, A                                          ;; 00:30af $5f
    ld   D, $cc                                        ;; 00:30b0 $16 $cc
    ld   A, [DE]                                       ;; 00:30b2 $1a
    cp   A, $ff                                        ;; 00:30b3 $fe $ff
    ret  Z                                             ;; 00:30b5 $c8
    dec  E                                             ;; 00:30b6 $1d
    ld   A, [DE]                                       ;; 00:30b7 $1a
    ld   L, A                                          ;; 00:30b8 $6f
    inc  E                                             ;; 00:30b9 $1c
    ld   A, [DE]                                       ;; 00:30ba $1a
    ld   C, A                                          ;; 00:30bb $4f
    ld   H, $00                                        ;; 00:30bc $26 $00
    ld   D, H                                          ;; 00:30be $54
    ld   E, L                                          ;; 00:30bf $5d
    add  HL, HL                                        ;; 00:30c0 $29
    add  HL, DE                                        ;; 00:30c1 $19
    push DE                                            ;; 00:30c2 $d5
    ld   A, $05                                        ;; 00:30c3 $3e $05
    rst  switchBank                                    ;; 00:30c5 $ef
    ld   DE, $7e10 ;@bank 5                            ;; 00:30c6 $11 $10 $7e
    add  HL, DE                                        ;; 00:30c9 $19
    ld   DE, wC53A                                     ;; 00:30ca $11 $3a $c5
    ld   A, [HL+]                                      ;; 00:30cd $2a
    ld   [DE], A                                       ;; 00:30ce $12
    inc  E                                             ;; 00:30cf $1c
    ld   A, [HL+]                                      ;; 00:30d0 $2a
    ld   [DE], A                                       ;; 00:30d1 $12
    inc  E                                             ;; 00:30d2 $1c
    ld   A, [HL]                                       ;; 00:30d3 $7e
    ld   [DE], A                                       ;; 00:30d4 $12
    pop  DE                                            ;; 00:30d5 $d1
    ld   A, E                                          ;; 00:30d6 $7b
    call call_00_2ade                                  ;; 00:30d7 $cd $de $2a
    ld   HL, $07                                       ;; 00:30da $21 $07 $00
    add  HL, DE                                        ;; 00:30dd $19
    ld   B, [HL]                                       ;; 00:30de $46
    ld   HL, wC53A                                     ;; 00:30df $21 $3a $c5
    call call_00_330b                                  ;; 00:30e2 $cd $0b $33
    call call_00_2d0c                                  ;; 00:30e5 $cd $0c $2d
    ld   HL, wC53A                                     ;; 00:30e8 $21 $3a $c5
    call call_00_32c6                                  ;; 00:30eb $cd $c6 $32
    ld   DE, $19                                       ;; 00:30ee $11 $19 $00
    ld   HL, wC62A                                     ;; 00:30f1 $21 $2a $c6
    ld   A, $14                                        ;; 00:30f4 $3e $14
    rst  rst_00_0008                                   ;; 00:30f6 $cf
    call call_00_2ce9                                  ;; 00:30f7 $cd $e9 $2c
    xor  A, A                                          ;; 00:30fa $af
    ret                                                ;; 00:30fb $c9

call_00_30fc:
    call call_00_2d0c                                  ;; 00:30fc $cd $0c $2d
    ld   DE, $1e                                       ;; 00:30ff $11 $1e $00
    ld   HL, wC62A                                     ;; 00:3102 $21 $2a $c6
    ld   A, $14                                        ;; 00:3105 $3e $14
    rst  rst_00_0008                                   ;; 00:3107 $cf
    call call_00_2ce9                                  ;; 00:3108 $cd $e9 $2c
    ld   BC, $a08                                      ;; 00:310b $01 $08 $0a
    call call_00_2d0f                                  ;; 00:310e $cd $0f $2d
    ld   DE, $9c08                                     ;; 00:3111 $11 $08 $9c
    ld   BC, $c0a                                      ;; 00:3114 $01 $0a $0c
    call call_00_2a9c                                  ;; 00:3117 $cd $9c $2a
    call call_00_01a7                                  ;; 00:311a $cd $a7 $01
    ld   HL, wCC7C                                     ;; 00:311d $21 $7c $cc
    call call_00_29e7                                  ;; 00:3120 $cd $e7 $29
    ld   DE, $9c2a                                     ;; 00:3123 $11 $2a $9c
    ld   BC, $908                                      ;; 00:3126 $01 $08 $09
    jp   call_00_2a9c                                  ;; 00:3129 $c3 $9c $2a

jp_00_312c:
    call call_00_2cc9                                  ;; 00:312c $cd $c9 $2c
    call call_00_31fe                                  ;; 00:312f $cd $fe $31
    ld   DE, $9d62                                     ;; 00:3132 $11 $62 $9d
    ld   HL, $3ee3                                     ;; 00:3135 $21 $e3 $3e
    ld   BC, $1106                                     ;; 00:3138 $01 $06 $11
    ld   A, [wC5C7]                                    ;; 00:313b $fa $c7 $c5
    inc  A                                             ;; 00:313e $3c
    call call_00_2b2e                                  ;; 00:313f $cd $2e $2b
    cp   A, $ff                                        ;; 00:3142 $fe $ff
    jp   Z, jp_00_3023                                 ;; 00:3144 $ca $23 $30
    ld   D, A                                          ;; 00:3147 $57
    call call_00_2cb8                                  ;; 00:3148 $cd $b8 $2c
    ld   A, [wC3AA]                                    ;; 00:314b $fa $aa $c3
    add  A, A                                          ;; 00:314e $87
    ld   E, A                                          ;; 00:314f $5f
    add  A, A                                          ;; 00:3150 $87
    add  A, A                                          ;; 00:3151 $87
    add  A, E                                          ;; 00:3152 $83
    add  A, D                                          ;; 00:3153 $82
    ld   E, A                                          ;; 00:3154 $5f
    ld   D, $00                                        ;; 00:3155 $16 $00
    ld   A, $05                                        ;; 00:3157 $3e $05
    rst  switchBank                                    ;; 00:3159 $ef
    ld   HL, $7d10                                     ;; 00:315a $21 $10 $7d
    add  HL, DE                                        ;; 00:315d $19
    ld   A, [HL]                                       ;; 00:315e $7e
    inc  A                                             ;; 00:315f $3c
    jr   NZ, .jr_00_3168                               ;; 00:3160 $20 $06
    call call_00_3094                                  ;; 00:3162 $cd $94 $30
    jp   jp_00_3023                                    ;; 00:3165 $c3 $23 $30
.jr_00_3168:
    ld   E, L                                          ;; 00:3168 $5d
    ld   D, H                                          ;; 00:3169 $54
    ld   HL, wCC7D                                     ;; 00:316a $21 $7d $cc
    ld   B, $08                                        ;; 00:316d $06 $08
.jr_00_316f:
    ld   A, [HL]                                       ;; 00:316f $7e
    inc  A                                             ;; 00:3170 $3c
    jr   Z, .jr_00_3181                                ;; 00:3171 $28 $0e
    inc  L                                             ;; 00:3173 $2c
    inc  L                                             ;; 00:3174 $2c
    dec  B                                             ;; 00:3175 $05
    jr   NZ, .jr_00_316f                               ;; 00:3176 $20 $f7
    call call_00_31ef                                  ;; 00:3178 $cd $ef $31
    call call_00_3cf7                                  ;; 00:317b $cd $f7 $3c
    jp   jp_00_3023                                    ;; 00:317e $c3 $23 $30
.jr_00_3181:
    dec  L                                             ;; 00:3181 $2d
    ld   A, [DE]                                       ;; 00:3182 $1a
    ld   [HL], A                                       ;; 00:3183 $77
    push HL                                            ;; 00:3184 $e5
    ld   L, A                                          ;; 00:3185 $6f
    ld   H, $00                                        ;; 00:3186 $26 $00
    add  HL, HL                                        ;; 00:3188 $29
    rst  add_hl_a                                      ;; 00:3189 $c7
    ld   A, $05                                        ;; 00:318a $3e $05
    rst  switchBank                                    ;; 00:318c $ef
    ld   DE, $7e12                                     ;; 00:318d $11 $12 $7e
    add  HL, DE                                        ;; 00:3190 $19
    ld   DE, wCC8F                                     ;; 00:3191 $11 $8f $cc
    ld   BC, hFFC2                                     ;; 00:3194 $01 $c2 $ff
    call call_00_32ed                                  ;; 00:3197 $cd $ed $32
    pop  HL                                            ;; 00:319a $e1
    jr   C, jr_00_31c0                                 ;; 00:319b $38 $23
    ld   A, [HL]                                       ;; 00:319d $7e
    push HL                                            ;; 00:319e $e5
    call call_00_2ade                                  ;; 00:319f $cd $de $2a
    ld   HL, $07                                       ;; 00:31a2 $21 $07 $00
    add  HL, DE                                        ;; 00:31a5 $19
    ld   A, [HL]                                       ;; 00:31a6 $7e
    pop  HL                                            ;; 00:31a7 $e1
    ld   C, [HL]                                       ;; 00:31a8 $4e
    inc  HL                                            ;; 00:31a9 $23
    ld   [HL], A                                       ;; 00:31aa $77
    call call_00_31da                                  ;; 00:31ab $cd $da $31
    ld   A, $17                                        ;; 00:31ae $3e $17
    ldh  [hFFE4], A                                    ;; 00:31b0 $e0 $e4
    call call_00_3cf7                                  ;; 00:31b2 $cd $f7 $3c
    jp   jp_00_3023                                    ;; 00:31b5 $c3 $23 $30
    db   $06, $3c                                      ;; 00:31b8 ??

call_00_31ba:
    rst  rst_00_0010                                   ;; 00:31ba $d7
    rst  rst_00_0018                                   ;; 00:31bb $df
    dec  B                                             ;; 00:31bc $05
    jr   NZ, call_00_31ba                              ;; 00:31bd $20 $fb
    ret                                                ;; 00:31bf $c9

jr_00_31c0:
    ld   [HL], $ff                                     ;; 00:31c0 $36 $ff
    call call_00_31cb                                  ;; 00:31c2 $cd $cb $31
    call call_00_3cf7                                  ;; 00:31c5 $cd $f7 $3c
    jp   jp_00_3023                                    ;; 00:31c8 $c3 $23 $30

call_00_31cb:
    call call_00_2d0c                                  ;; 00:31cb $cd $0c $2d
    ld   DE, $1a                                       ;; 00:31ce $11 $1a $00
    ld   HL, wC62A                                     ;; 00:31d1 $21 $2a $c6
    ld   A, $14                                        ;; 00:31d4 $3e $14
    rst  rst_00_0008                                   ;; 00:31d6 $cf
    jp   call_00_2ce9                                  ;; 00:31d7 $c3 $e9 $2c

call_00_31da:
    push BC                                            ;; 00:31da $c5
    call call_00_2d0c                                  ;; 00:31db $cd $0c $2d
    pop  BC                                            ;; 00:31de $c1
    ld   A, C                                          ;; 00:31df $79
    ld_long_store hFFB2, A                             ;; 00:31e0 $ea $b2 $ff
    ld   DE, $18                                       ;; 00:31e3 $11 $18 $00
    ld   HL, wC62A                                     ;; 00:31e6 $21 $2a $c6
    ld   A, $14                                        ;; 00:31e9 $3e $14
    rst  rst_00_0008                                   ;; 00:31eb $cf
    jp   call_00_2ce9                                  ;; 00:31ec $c3 $e9 $2c

call_00_31ef:
    call call_00_2d0c                                  ;; 00:31ef $cd $0c $2d
    ld   DE, $20                                       ;; 00:31f2 $11 $20 $00
    ld   HL, wC62A                                     ;; 00:31f5 $21 $2a $c6
    ld   A, $14                                        ;; 00:31f8 $3e $14
    rst  rst_00_0008                                   ;; 00:31fa $cf
    jp   call_00_2ce9                                  ;; 00:31fb $c3 $e9 $2c

call_00_31fe:
    call call_00_01a7                                  ;; 00:31fe $cd $a7 $01
    call call_00_2d0c                                  ;; 00:3201 $cd $0c $2d
    call call_00_2ce9                                  ;; 00:3204 $cd $e9 $2c
    ld   A, [wC3AA]                                    ;; 00:3207 $fa $aa $c3
    add  A, A                                          ;; 00:320a $87
    ld   E, A                                          ;; 00:320b $5f
    add  A, A                                          ;; 00:320c $87
    add  A, A                                          ;; 00:320d $87
    add  A, E                                          ;; 00:320e $83
    ld   HL, $7d10                                     ;; 00:320f $21 $10 $7d
    rst  add_hl_a                                      ;; 00:3212 $c7
    push HL                                            ;; 00:3213 $e5
    ld   DE, wC3D0                                     ;; 00:3214 $11 $d0 $c3
    ld   BC, wC3DA                                     ;; 00:3217 $01 $da $c3
    ld   A, $0a                                        ;; 00:321a $3e $0a
.jr_00_321c:
    push AF                                            ;; 00:321c $f5
    ld   A, $05                                        ;; 00:321d $3e $05
    rst  switchBank                                    ;; 00:321f $ef
    ld   A, [HL+]                                      ;; 00:3220 $2a
    cp   A, $ff                                        ;; 00:3221 $fe $ff
    jr   NZ, .jr_00_3231                               ;; 00:3223 $20 $0c
    pop  BC                                            ;; 00:3225 $c1
    ld   A, $07                                        ;; 00:3226 $3e $07
    sub  A, B                                          ;; 00:3228 $90
    jr   NC, .jr_00_322c                               ;; 00:3229 $30 $01
    xor  A, A                                          ;; 00:322b $af
.jr_00_322c:
    ld   [wC5C7], A                                    ;; 00:322c $ea $c7 $c5
    jr   .jr_00_324c                                   ;; 00:322f $18 $1b
.jr_00_3231:
    ld   [DE], A                                       ;; 00:3231 $12
    inc  DE                                            ;; 00:3232 $13
    push HL                                            ;; 00:3233 $e5
    push BC                                            ;; 00:3234 $c5
    push DE                                            ;; 00:3235 $d5
    call call_00_2ade                                  ;; 00:3236 $cd $de $2a
    ld   HL, $07                                       ;; 00:3239 $21 $07 $00
    add  HL, DE                                        ;; 00:323c $19
    pop  DE                                            ;; 00:323d $d1
    ld   A, [HL]                                       ;; 00:323e $7e
    pop  BC                                            ;; 00:323f $c1
    pop  HL                                            ;; 00:3240 $e1
    ld   [BC], A                                       ;; 00:3241 $02
    inc  BC                                            ;; 00:3242 $03
    pop  AF                                            ;; 00:3243 $f1
    dec  A                                             ;; 00:3244 $3d
    jr   NZ, .jr_00_321c                               ;; 00:3245 $20 $d5
    ld   A, $07                                        ;; 00:3247 $3e $07
    ld   [wC5C7], A                                    ;; 00:3249 $ea $c7 $c5
.jr_00_324c:
    pop  HL                                            ;; 00:324c $e1
    ld   A, $05                                        ;; 00:324d $3e $05
    rst  switchBank                                    ;; 00:324f $ef
    ld   DE, wC400                                     ;; 00:3250 $11 $00 $c4
    ld   A, $0a                                        ;; 00:3253 $3e $0a
.jr_00_3255:
    push AF                                            ;; 00:3255 $f5
    ld   A, [HL+]                                      ;; 00:3256 $2a
    push HL                                            ;; 00:3257 $e5
    ld   L, A                                          ;; 00:3258 $6f
    ld   H, $00                                        ;; 00:3259 $26 $00
    add  HL, HL                                        ;; 00:325b $29
    rst  add_hl_a                                      ;; 00:325c $c7
    ld   BC, $7e10                                     ;; 00:325d $01 $10 $7e
    add  HL, BC                                        ;; 00:3260 $09
    ld   A, [HL+]                                      ;; 00:3261 $2a
    ld   [DE], A                                       ;; 00:3262 $12
    inc  DE                                            ;; 00:3263 $13
    ld   A, [HL+]                                      ;; 00:3264 $2a
    ld   [DE], A                                       ;; 00:3265 $12
    inc  DE                                            ;; 00:3266 $13
    ld   A, [HL+]                                      ;; 00:3267 $2a
    ld   [DE], A                                       ;; 00:3268 $12
    inc  DE                                            ;; 00:3269 $13
    pop  HL                                            ;; 00:326a $e1
    pop  AF                                            ;; 00:326b $f1
    dec  A                                             ;; 00:326c $3d
    jr   NZ, .jr_00_3255                               ;; 00:326d $20 $e6
    call call_00_01a7                                  ;; 00:326f $cd $a7 $01
    ld   DE, $05                                       ;; 00:3272 $11 $05 $00
    ld   HL, wC611                                     ;; 00:3275 $21 $11 $c6
    ld   A, $11                                        ;; 00:3278 $3e $11
    rst  rst_00_0008                                   ;; 00:327a $cf
    ld   DE, $1f                                       ;; 00:327b $11 $1f $00
    ld   HL, wC721                                     ;; 00:327e $21 $21 $c7
    ld   A, $11                                        ;; 00:3281 $3e $11
    rst  rst_00_0008                                   ;; 00:3283 $cf
    ld   DE, $17                                       ;; 00:3284 $11 $17 $00
    ld   HL, wC61A                                     ;; 00:3287 $21 $1a $c6
    ld   A, $11                                        ;; 00:328a $3e $11
    rst  rst_00_0008                                   ;; 00:328c $cf
    ld   DE, $9d62                                     ;; 00:328d $11 $62 $9d
    ld   BC, $1106                                     ;; 00:3290 $01 $06 $11
    jp   call_00_2a9c                                  ;; 00:3293 $c3 $9c $2a

call_00_3296:
    ld   BC, $506                                      ;; 00:3296 $01 $06 $05
    call call_00_2d0f                                  ;; 00:3299 $cd $0f $2d
    ld   DE, $15                                       ;; 00:329c $11 $15 $00
    ld   HL, wC610                                     ;; 00:329f $21 $10 $c6
    ld   A, $07                                        ;; 00:32a2 $3e $07
    rst  rst_00_0008                                   ;; 00:32a4 $cf
    ld   DE, $9c01                                     ;; 00:32a5 $11 $01 $9c
    ld   BC, $708                                      ;; 00:32a8 $01 $08 $07
    call call_00_2a9c                                  ;; 00:32ab $cd $9c $2a
    ld   DE, $9c07                                     ;; 00:32ae $11 $07 $9c
    call call_00_2fb8                                  ;; 00:32b1 $cd $b8 $2f
    call call_00_2d0c                                  ;; 00:32b4 $cd $0c $2d
    ld   DE, $16                                       ;; 00:32b7 $11 $16 $00
    ld   HL, wC62A                                     ;; 00:32ba $21 $2a $c6
    ld   A, $14                                        ;; 00:32bd $3e $14
    rst  rst_00_0008                                   ;; 00:32bf $cf
    jp   call_00_2ce9                                  ;; 00:32c0 $c3 $e9 $2c

call_00_32c3:
    ld   HL, wCC8D                                     ;; 00:32c3 $21 $8d $cc

call_00_32c6:
    ld   DE, wC400                                     ;; 00:32c6 $11 $00 $c4
    ld   A, [HL+]                                      ;; 00:32c9 $2a
    ld   [DE], A                                       ;; 00:32ca $12
    inc  DE                                            ;; 00:32cb $13
    ld   A, [HL+]                                      ;; 00:32cc $2a
    ld   [DE], A                                       ;; 00:32cd $12
    inc  DE                                            ;; 00:32ce $13
    ld   A, [HL+]                                      ;; 00:32cf $2a
    ld   [DE], A                                       ;; 00:32d0 $12
    ret                                                ;; 00:32d1 $c9

call_00_32d2:
    ld   A, [DE]                                       ;; 00:32d2 $1a
    add  A, [HL]                                       ;; 00:32d3 $86
    daa                                                ;; 00:32d4 $27
    ld   [HL-], A                                      ;; 00:32d5 $32
    dec  DE                                            ;; 00:32d6 $1b
    ld   A, [DE]                                       ;; 00:32d7 $1a
    adc  A, [HL]                                       ;; 00:32d8 $8e
    daa                                                ;; 00:32d9 $27
    ld   [HL-], A                                      ;; 00:32da $32
    dec  DE                                            ;; 00:32db $1b
    ld   A, [DE]                                       ;; 00:32dc $1a
    adc  A, [HL]                                       ;; 00:32dd $8e
    daa                                                ;; 00:32de $27
    ld   [HL-], A                                      ;; 00:32df $32
    dec  DE                                            ;; 00:32e0 $1b
    ld   A, [DE]                                       ;; 00:32e1 $1a
    adc  A, [HL]                                       ;; 00:32e2 $8e
    daa                                                ;; 00:32e3 $27
    ld   [HL], A                                       ;; 00:32e4 $77
    ret  NC                                            ;; 00:32e5 $d0
    ld   A, $99                                        ;; 00:32e6 $3e $99
    ld   [HL+], A                                      ;; 00:32e8 $22
    ld   [HL+], A                                      ;; 00:32e9 $22
    ld   [HL+], A                                      ;; 00:32ea $22
    ld   [HL+], A                                      ;; 00:32eb $22
    ret                                                ;; 00:32ec $c9

call_00_32ed:
    ld   A, [DE]                                       ;; 00:32ed $1a
    sub  A, [HL]                                       ;; 00:32ee $96
    daa                                                ;; 00:32ef $27
    ld   [BC], A                                       ;; 00:32f0 $02
    dec  BC                                            ;; 00:32f1 $0b
    dec  DE                                            ;; 00:32f2 $1b
    dec  HL                                            ;; 00:32f3 $2b
    ld   A, [DE]                                       ;; 00:32f4 $1a
    sbc  A, [HL]                                       ;; 00:32f5 $9e
    daa                                                ;; 00:32f6 $27
    ld   [BC], A                                       ;; 00:32f7 $02
    dec  BC                                            ;; 00:32f8 $0b
    dec  DE                                            ;; 00:32f9 $1b
    dec  HL                                            ;; 00:32fa $2b
    ld   A, [DE]                                       ;; 00:32fb $1a
    sbc  A, [HL]                                       ;; 00:32fc $9e
    daa                                                ;; 00:32fd $27
    ld   [BC], A                                       ;; 00:32fe $02
    ret  C                                             ;; 00:32ff $d8
    ld   A, [BC]                                       ;; 00:3300 $0a
    ld   [DE], A                                       ;; 00:3301 $12
    inc  BC                                            ;; 00:3302 $03
    inc  DE                                            ;; 00:3303 $13
    ld   A, [BC]                                       ;; 00:3304 $0a
    ld   [DE], A                                       ;; 00:3305 $12
    inc  BC                                            ;; 00:3306 $03
    inc  DE                                            ;; 00:3307 $13
    ld   A, [BC]                                       ;; 00:3308 $0a
    ld   [DE], A                                       ;; 00:3309 $12
    ret                                                ;; 00:330a $c9

call_00_330b:
    ld   A, C                                          ;; 00:330b $79
    cp   A, B                                          ;; 00:330c $b8
    jr   NZ, .jr_00_3314                               ;; 00:330d $20 $05
    ld   E, $02                                        ;; 00:330f $1e $02
    jp   jp_00_3409                                    ;; 00:3311 $c3 $09 $34
.jr_00_3314:
    ld   A, C                                          ;; 00:3314 $79
    swap A                                             ;; 00:3315 $cb $37
    ld   D, A                                          ;; 00:3317 $57
    and  A, $f0                                        ;; 00:3318 $e6 $f0
    ld   E, A                                          ;; 00:331a $5f
    ld   A, D                                          ;; 00:331b $7a
    and  A, $0f                                        ;; 00:331c $e6 $0f
    ld   D, A                                          ;; 00:331e $57
    push HL                                            ;; 00:331f $e5
    ld   L, B                                          ;; 00:3320 $68
    ld   H, $00                                        ;; 00:3321 $26 $00
    call call_00_0165                                  ;; 00:3323 $cd $65 $01
    pop  HL                                            ;; 00:3326 $e1
    ld   A, E                                          ;; 00:3327 $7b
    ld   B, $ff                                        ;; 00:3328 $06 $ff
.jr_00_332a:
    inc  B                                             ;; 00:332a $04
    sub  A, $0a                                        ;; 00:332b $d6 $0a
    jr   NC, .jr_00_332a                               ;; 00:332d $30 $fb
    add  A, $0a                                        ;; 00:332f $c6 $0a
    ld   E, A                                          ;; 00:3331 $5f
    push BC                                            ;; 00:3332 $c5
    ld   BC, wC532                                     ;; 00:3333 $01 $32 $c5
    call call_00_3378                                  ;; 00:3336 $cd $78 $33
    ld   BC, wC52D                                     ;; 00:3339 $01 $2d $c5
    call call_00_33ad                                  ;; 00:333c $cd $ad $33
    pop  BC                                            ;; 00:333f $c1
    ld   E, B                                          ;; 00:3340 $58
    ld   BC, wC539                                     ;; 00:3341 $01 $39 $c5
    call call_00_3378                                  ;; 00:3344 $cd $78 $33
    ld   BC, wC533                                     ;; 00:3347 $01 $33 $c5
    call call_00_33c9                                  ;; 00:334a $cd $c9 $33
    inc  HL                                            ;; 00:334d $23
    inc  HL                                            ;; 00:334e $23
    ld   C, L                                          ;; 00:334f $4d
    ld   B, H                                          ;; 00:3350 $44
    ld   DE, wC52F                                     ;; 00:3351 $11 $2f $c5
    ld   HL, wC536                                     ;; 00:3354 $21 $36 $c5
    ld   A, [DE]                                       ;; 00:3357 $1a
    add  A, [HL]                                       ;; 00:3358 $86
    daa                                                ;; 00:3359 $27
    ld   [BC], A                                       ;; 00:335a $02
    dec  HL                                            ;; 00:335b $2b
    dec  BC                                            ;; 00:335c $0b
    dec  DE                                            ;; 00:335d $1b
    ld   A, [DE]                                       ;; 00:335e $1a
    adc  A, [HL]                                       ;; 00:335f $8e
    daa                                                ;; 00:3360 $27
    ld   [BC], A                                       ;; 00:3361 $02
    dec  HL                                            ;; 00:3362 $2b
    dec  BC                                            ;; 00:3363 $0b
    dec  DE                                            ;; 00:3364 $1b
    ld   A, [DE]                                       ;; 00:3365 $1a
    adc  A, [HL]                                       ;; 00:3366 $8e
    daa                                                ;; 00:3367 $27
    ld   [BC], A                                       ;; 00:3368 $02
    dec  HL                                            ;; 00:3369 $2b
    dec  BC                                            ;; 00:336a $0b
    dec  DE                                            ;; 00:336b $1b
    ld   A, [DE]                                       ;; 00:336c $1a
    adc  A, [HL]                                       ;; 00:336d $8e
    daa                                                ;; 00:336e $27
    ld   [BC], A                                       ;; 00:336f $02
    ld   L, C                                          ;; 00:3370 $69
    ld   H, B                                          ;; 00:3371 $60
    inc  HL                                            ;; 00:3372 $23
    ld   E, $20                                        ;; 00:3373 $1e $20
    jp   jp_00_3409                                    ;; 00:3375 $c3 $09 $34

call_00_3378:
    push HL                                            ;; 00:3378 $e5
    push BC                                            ;; 00:3379 $c5
    inc  HL                                            ;; 00:337a $23
    inc  HL                                            ;; 00:337b $23
    xor  A, A                                          ;; 00:337c $af
    ld   [BC], A                                       ;; 00:337d $02
    ld   A, [HL]                                       ;; 00:337e $7e
    and  A, $0f                                        ;; 00:337f $e6 $0f
    call call_00_33ec                                  ;; 00:3381 $cd $ec $33
    ld   A, [HL]                                       ;; 00:3384 $7e
    swap A                                             ;; 00:3385 $cb $37
    and  A, $0f                                        ;; 00:3387 $e6 $0f
    call call_00_33ec                                  ;; 00:3389 $cd $ec $33
    dec  HL                                            ;; 00:338c $2b
    ld   A, [HL]                                       ;; 00:338d $7e
    and  A, $0f                                        ;; 00:338e $e6 $0f
    call call_00_33ec                                  ;; 00:3390 $cd $ec $33
    ld   A, [HL]                                       ;; 00:3393 $7e
    swap A                                             ;; 00:3394 $cb $37
    and  A, $0f                                        ;; 00:3396 $e6 $0f
    call call_00_33ec                                  ;; 00:3398 $cd $ec $33
    dec  HL                                            ;; 00:339b $2b
    ld   A, [HL]                                       ;; 00:339c $7e
    and  A, $0f                                        ;; 00:339d $e6 $0f
    call call_00_33ec                                  ;; 00:339f $cd $ec $33
    ld   A, [HL]                                       ;; 00:33a2 $7e
    swap A                                             ;; 00:33a3 $cb $37
    and  A, $0f                                        ;; 00:33a5 $e6 $0f
    call call_00_33ec                                  ;; 00:33a7 $cd $ec $33
    pop  BC                                            ;; 00:33aa $c1
    pop  HL                                            ;; 00:33ab $e1
    ret                                                ;; 00:33ac $c9

call_00_33ad:
    push HL                                            ;; 00:33ad $e5
    push BC                                            ;; 00:33ae $c5
    ld   L, C                                          ;; 00:33af $69
    ld   H, B                                          ;; 00:33b0 $60
    ld   A, [HL+]                                      ;; 00:33b1 $2a
    swap A                                             ;; 00:33b2 $cb $37
    or   A, [HL]                                       ;; 00:33b4 $b6
    ld   C, A                                          ;; 00:33b5 $4f
    inc  HL                                            ;; 00:33b6 $23
    ld   A, [HL+]                                      ;; 00:33b7 $2a
    swap A                                             ;; 00:33b8 $cb $37
    or   A, [HL]                                       ;; 00:33ba $b6
    ld   B, A                                          ;; 00:33bb $47
    inc  HL                                            ;; 00:33bc $23
    ld   A, [HL+]                                      ;; 00:33bd $2a
    swap A                                             ;; 00:33be $cb $37
    or   A, [HL]                                       ;; 00:33c0 $b6
    pop  HL                                            ;; 00:33c1 $e1
    ld   [HL], C                                       ;; 00:33c2 $71
    inc  HL                                            ;; 00:33c3 $23
    ld   [HL], B                                       ;; 00:33c4 $70
    inc  HL                                            ;; 00:33c5 $23
    ld   [HL], A                                       ;; 00:33c6 $77
    pop  HL                                            ;; 00:33c7 $e1
    ret                                                ;; 00:33c8 $c9

call_00_33c9:
    push HL                                            ;; 00:33c9 $e5
    push BC                                            ;; 00:33ca $c5
    ld   L, C                                          ;; 00:33cb $69
    ld   H, B                                          ;; 00:33cc $60
    ld   A, [HL+]                                      ;; 00:33cd $2a
    swap A                                             ;; 00:33ce $cb $37
    or   A, [HL]                                       ;; 00:33d0 $b6
    ld   C, A                                          ;; 00:33d1 $4f
    inc  HL                                            ;; 00:33d2 $23
    ld   A, [HL+]                                      ;; 00:33d3 $2a
    swap A                                             ;; 00:33d4 $cb $37
    or   A, [HL]                                       ;; 00:33d6 $b6
    ld   B, A                                          ;; 00:33d7 $47
    inc  HL                                            ;; 00:33d8 $23
    ld   A, [HL+]                                      ;; 00:33d9 $2a
    swap A                                             ;; 00:33da $cb $37
    or   A, [HL]                                       ;; 00:33dc $b6
    ld   D, A                                          ;; 00:33dd $57
    inc  HL                                            ;; 00:33de $23
    ld   A, [HL+]                                      ;; 00:33df $2a
    swap A                                             ;; 00:33e0 $cb $37
    pop  HL                                            ;; 00:33e2 $e1
    ld   [HL], C                                       ;; 00:33e3 $71
    inc  HL                                            ;; 00:33e4 $23
    ld   [HL], B                                       ;; 00:33e5 $70
    inc  HL                                            ;; 00:33e6 $23
    ld   [HL], D                                       ;; 00:33e7 $72
    inc  HL                                            ;; 00:33e8 $23
    ld   [HL], A                                       ;; 00:33e9 $77
    pop  HL                                            ;; 00:33ea $e1
    ret                                                ;; 00:33eb $c9

call_00_33ec:
    call call_00_33ff                                  ;; 00:33ec $cd $ff $33
    ld   D, A                                          ;; 00:33ef $57
    ld   A, [BC]                                       ;; 00:33f0 $0a
    add  A, D                                          ;; 00:33f1 $82
    daa                                                ;; 00:33f2 $27
    ld   D, A                                          ;; 00:33f3 $57
    and  A, $0f                                        ;; 00:33f4 $e6 $0f
    ld   [BC], A                                       ;; 00:33f6 $02
    dec  BC                                            ;; 00:33f7 $0b
    ld   A, D                                          ;; 00:33f8 $7a
    swap A                                             ;; 00:33f9 $cb $37
    and  A, $0f                                        ;; 00:33fb $e6 $0f
    ld   [BC], A                                       ;; 00:33fd $02
    ret                                                ;; 00:33fe $c9

call_00_33ff:
    or   A, A                                          ;; 00:33ff $b7
    ret  Z                                             ;; 00:3400 $c8
    ld   D, A                                          ;; 00:3401 $57
    xor  A, A                                          ;; 00:3402 $af
.jr_00_3403:
    add  A, E                                          ;; 00:3403 $83
    daa                                                ;; 00:3404 $27
    dec  D                                             ;; 00:3405 $15
    jr   NZ, .jr_00_3403                               ;; 00:3406 $20 $fb
    ret                                                ;; 00:3408 $c9

jp_00_3409:
    push HL                                            ;; 00:3409 $e5
    push BC                                            ;; 00:340a $c5
    ld   A, [HL]                                       ;; 00:340b $7e
    swap A                                             ;; 00:340c $cb $37
    and  A, $0f                                        ;; 00:340e $e6 $0f
    call call_00_3450                                  ;; 00:3410 $cd $50 $34
    ld   C, A                                          ;; 00:3413 $4f
    ld   A, [HL]                                       ;; 00:3414 $7e
    and  A, $0f                                        ;; 00:3415 $e6 $0f
    add  A, C                                          ;; 00:3417 $81
    swap D                                             ;; 00:3418 $cb $32
    dec  D                                             ;; 00:341a $15
    call call_00_3452                                  ;; 00:341b $cd $52 $34
    ld   [HL], D                                       ;; 00:341e $72
    inc  HL                                            ;; 00:341f $23
    ld   C, A                                          ;; 00:3420 $4f
    ld   A, [HL]                                       ;; 00:3421 $7e
    swap A                                             ;; 00:3422 $cb $37
    and  A, $0f                                        ;; 00:3424 $e6 $0f
    add  A, C                                          ;; 00:3426 $81
    call call_00_3450                                  ;; 00:3427 $cd $50 $34
    ld   C, A                                          ;; 00:342a $4f
    ld   A, [HL]                                       ;; 00:342b $7e
    and  A, $0f                                        ;; 00:342c $e6 $0f
    add  A, C                                          ;; 00:342e $81
    swap D                                             ;; 00:342f $cb $32
    dec  D                                             ;; 00:3431 $15
    call call_00_3452                                  ;; 00:3432 $cd $52 $34
    ld   [HL], D                                       ;; 00:3435 $72
    inc  HL                                            ;; 00:3436 $23
    ld   C, A                                          ;; 00:3437 $4f
    ld   A, [HL]                                       ;; 00:3438 $7e
    swap A                                             ;; 00:3439 $cb $37
    and  A, $0f                                        ;; 00:343b $e6 $0f
    add  A, C                                          ;; 00:343d $81
    call call_00_3450                                  ;; 00:343e $cd $50 $34
    ld   C, A                                          ;; 00:3441 $4f
    ld   A, [HL]                                       ;; 00:3442 $7e
    and  A, $0f                                        ;; 00:3443 $e6 $0f
    add  A, C                                          ;; 00:3445 $81
    swap D                                             ;; 00:3446 $cb $32
    dec  D                                             ;; 00:3448 $15
    call call_00_3452                                  ;; 00:3449 $cd $52 $34
    ld   [HL], D                                       ;; 00:344c $72
    pop  BC                                            ;; 00:344d $c1
    pop  HL                                            ;; 00:344e $e1
    ret                                                ;; 00:344f $c9

call_00_3450:
    ld   D, $ff                                        ;; 00:3450 $16 $ff

call_00_3452:
    inc  D                                             ;; 00:3452 $14
    sub  A, E                                          ;; 00:3453 $93
    jr   NC, call_00_3452                              ;; 00:3454 $30 $fc
    add  A, E                                          ;; 00:3456 $83
    add  A, A                                          ;; 00:3457 $87
    ld   C, A                                          ;; 00:3458 $4f
    add  A, A                                          ;; 00:3459 $87
    add  A, A                                          ;; 00:345a $87
    add  A, C                                          ;; 00:345b $81
    ret                                                ;; 00:345c $c9

call_00_345d:
    call call_00_3584                                  ;; 00:345d $cd $84 $35
    call call_00_2d0c                                  ;; 00:3460 $cd $0c $2d
    ld   DE, $9c00                                     ;; 00:3463 $11 $00 $9c
    ld   BC, $1408                                     ;; 00:3466 $01 $08 $14
    call call_00_2a9c                                  ;; 00:3469 $cd $9c $2a
    rst  rst_00_0010                                   ;; 00:346c $d7
    rst  rst_00_0018                                   ;; 00:346d $df
    ret                                                ;; 00:346e $c9

call_00_346f:
    ld   A, $05                                        ;; 00:346f $3e $05
    rst  switchBank                                    ;; 00:3471 $ef
    ld   [wC5CF], A                                    ;; 00:3472 $ea $cf $c5
    add  HL, HL                                        ;; 00:3475 $29
    ld   DE, $7b10                                     ;; 00:3476 $11 $10 $7b
    add  HL, DE                                        ;; 00:3479 $19
    ld   E, [HL]                                       ;; 00:347a $5e
    inc  HL                                            ;; 00:347b $23
    ld   D, [HL]                                       ;; 00:347c $56
    call call_00_348b                                  ;; 00:347d $cd $8b $34
    ld   A, [wC5CF]                                    ;; 00:3480 $fa $cf $c5
    rst  switchBank                                    ;; 00:3483 $ef
    ret                                                ;; 00:3484 $c9

call_00_3485:
    call call_00_348b                                  ;; 00:3485 $cd $8b $34
    jp   call_00_3cf7                                  ;; 00:3488 $c3 $f7 $3c

call_00_348b:
    call call_00_0156                                  ;; 00:348b $cd $56 $01
    call call_00_34b2                                  ;; 00:348e $cd $b2 $34
    call call_00_0150                                  ;; 00:3491 $cd $50 $01
    ret  Z                                             ;; 00:3494 $c8
    bit  7, D                                          ;; 00:3495 $cb $7a
    jr   Z, .jr_00_349e                                ;; 00:3497 $28 $05
    ld   A, D                                          ;; 00:3499 $7a
    cp   A, $8c                                        ;; 00:349a $fe $8c
    jr   Z, .jr_00_34a6                                ;; 00:349c $28 $08
.jr_00_349e:
    ld   HL, $9c21                                     ;; 00:349e $21 $21 $9c
    call call_00_34bb                                  ;; 00:34a1 $cd $bb $34
    jr   .jr_00_34aa                                   ;; 00:34a4 $18 $04
.jr_00_34a6:
    call call_00_0150                                  ;; 00:34a6 $cd $50 $01
    ret  Z                                             ;; 00:34a9 $c8
.jr_00_34aa:
    call call_00_34b2                                  ;; 00:34aa $cd $b2 $34
    call call_00_351a                                  ;; 00:34ad $cd $1a $35
    jr   .jr_00_34a6                                   ;; 00:34b0 $18 $f4

call_00_34b2:
    ld   A, [wC5C1]                                    ;; 00:34b2 $fa $c1 $c5
    ld   L, A                                          ;; 00:34b5 $6f
    ld   A, [wC5C2]                                    ;; 00:34b6 $fa $c2 $c5
    ld   H, A                                          ;; 00:34b9 $67
    ret                                                ;; 00:34ba $c9

call_00_34bb:
    ld   A, L                                          ;; 00:34bb $7d
    ld   [wC5C1], A                                    ;; 00:34bc $ea $c1 $c5
    ld   A, H                                          ;; 00:34bf $7c
    ld   [wC5C2], A                                    ;; 00:34c0 $ea $c2 $c5
    ret                                                ;; 00:34c3 $c9

jr_00_34c4:
    ld   A, L                                          ;; 00:34c4 $7d
    and  A, $e0                                        ;; 00:34c5 $e6 $e0
    inc  A                                             ;; 00:34c7 $3c
    ld   L, A                                          ;; 00:34c8 $6f
    call call_00_34bb                                  ;; 00:34c9 $cd $bb $34
    ld   A, L                                          ;; 00:34cc $7d
    cp   A, $c1                                        ;; 00:34cd $fe $c1
    jr   Z, call_00_34ed                               ;; 00:34cf $28 $1c
    add  A, $20                                        ;; 00:34d1 $c6 $20
    ld   L, A                                          ;; 00:34d3 $6f
    jp   call_00_34bb                                  ;; 00:34d4 $c3 $bb $34

jr_00_34d7:
    ld   A, L                                          ;; 00:34d7 $7d
    and  A, $e0                                        ;; 00:34d8 $e6 $e0
    inc  A                                             ;; 00:34da $3c
    ld   L, A                                          ;; 00:34db $6f
    call call_00_34bb                                  ;; 00:34dc $cd $bb $34
    ld   A, L                                          ;; 00:34df $7d
    cp   A, $a1                                        ;; 00:34e0 $fe $a1
    jr   Z, .jr_00_34ea                                ;; 00:34e2 $28 $06
    add  A, $40                                        ;; 00:34e4 $c6 $40
    ld   L, A                                          ;; 00:34e6 $6f
    jp   call_00_34bb                                  ;; 00:34e7 $c3 $bb $34
.jr_00_34ea:
    call call_00_34ed                                  ;; 00:34ea $cd $ed $34

call_00_34ed:
    push HL                                            ;; 00:34ed $e5
    call call_00_017a                                  ;; 00:34ee $cd $7a $01
    ld   DE, $9c21                                     ;; 00:34f1 $11 $21 $9c
    ld   A, $05                                        ;; 00:34f4 $3e $05
.jr_00_34f6:
    push DE                                            ;; 00:34f6 $d5
    ld   HL, $20                                       ;; 00:34f7 $21 $20 $00
    add  HL, DE                                        ;; 00:34fa $19
    ld   B, $12                                        ;; 00:34fb $06 $12
    call call_00_008f                                  ;; 00:34fd $cd $8f $00
    pop  DE                                            ;; 00:3500 $d1
    ld   HL, $20                                       ;; 00:3501 $21 $20 $00
    add  HL, DE                                        ;; 00:3504 $19
    ld   E, L                                          ;; 00:3505 $5d
    ld   D, H                                          ;; 00:3506 $54
    dec  A                                             ;; 00:3507 $3d
    jr   NZ, .jr_00_34f6                               ;; 00:3508 $20 $ec
    ld   HL, $9cc1                                     ;; 00:350a $21 $c1 $9c
    ld   B, $12                                        ;; 00:350d $06 $12
    ld   A, $7f                                        ;; 00:350f $3e $7f
.jr_00_3511:
    ld   [HL+], A                                      ;; 00:3511 $22
    dec  B                                             ;; 00:3512 $05
    jr   NZ, .jr_00_3511                               ;; 00:3513 $20 $fc
    call call_00_017d                                  ;; 00:3515 $cd $7d $01
    pop  HL                                            ;; 00:3518 $e1
    ret                                                ;; 00:3519 $c9

call_00_351a:
    ld   A, D                                          ;; 00:351a $7a
    bit  7, A                                          ;; 00:351b $cb $7f
    jr   Z, .jr_00_3527                                ;; 00:351d $28 $08
    cp   A, $8a                                        ;; 00:351f $fe $8a
    jr   Z, jr_00_34c4                                 ;; 00:3521 $28 $a1
    cp   A, $8d                                        ;; 00:3523 $fe $8d
    jr   Z, jr_00_34d7                                 ;; 00:3525 $28 $b0
.jr_00_3527:
    rst  rst_00_0010                                   ;; 00:3527 $d7
    ld   A, [wCCCA]                                    ;; 00:3528 $fa $ca $cc
    cp   A, $0a                                        ;; 00:352b $fe $0a
    jr   Z, .jr_00_353d                                ;; 00:352d $28 $0e
    ldh  A, [hFF8D]                                    ;; 00:352f $f0 $8d
    and  A, $01                                        ;; 00:3531 $e6 $01
    jr   NZ, .jr_00_353d                               ;; 00:3533 $20 $08
    ld   A, [wCCCA]                                    ;; 00:3535 $fa $ca $cc
    inc  A                                             ;; 00:3538 $3c
.jr_00_3539:
    rst  rst_00_0010                                   ;; 00:3539 $d7
    dec  A                                             ;; 00:353a $3d
    jr   NZ, .jr_00_3539                               ;; 00:353b $20 $fc
.jr_00_353d:
    ld   [HL], E                                       ;; 00:353d $73
    push HL                                            ;; 00:353e $e5
    ld   A, $20                                        ;; 00:353f $3e $20
    rst  add_hl_a                                      ;; 00:3541 $c7
    ld   [HL], D                                       ;; 00:3542 $72
    pop  HL                                            ;; 00:3543 $e1
    inc  L                                             ;; 00:3544 $2c
    call call_00_34bb                                  ;; 00:3545 $cd $bb $34
    ld   A, L                                          ;; 00:3548 $7d
    and  A, $1f                                        ;; 00:3549 $e6 $1f
    cp   A, $13                                        ;; 00:354b $fe $13
    ret  NZ                                            ;; 00:354d $c0
    jr   jr_00_34d7                                    ;; 00:354e $18 $87
    db   $b7, $ca, $5d, $34, $cd, $5a, $35, $d7        ;; 00:3550 ????????
    db   $df, $c9                                      ;; 00:3558 ??

call_00_355a:
    ld   A, [wC5CA]                                    ;; 00:355a $fa $ca $c5
    or   A, A                                          ;; 00:355d $b7
    jr   Z, .jr_00_3581                                ;; 00:355e $28 $21
    xor  A, A                                          ;; 00:3560 $af
    ld   [wC5CA], A                                    ;; 00:3561 $ea $ca $c5
    ld   HL, wC000                                     ;; 00:3564 $21 $00 $c0
    ld   B, $24                                        ;; 00:3567 $06 $24
.jr_00_3569:
    ld   A, [HL]                                       ;; 00:3569 $7e
    cp   A, $60                                        ;; 00:356a $fe $60
    jr   C, .jr_00_357a                                ;; 00:356c $38 $0c
    cp   A, $b0                                        ;; 00:356e $fe $b0
    jr   Z, .jr_00_357a                                ;; 00:3570 $28 $08
    sub  A, $51                                        ;; 00:3572 $d6 $51
    ld   [HL], A                                       ;; 00:3574 $77
    set  0, H                                          ;; 00:3575 $cb $c4
    ld   [HL], A                                       ;; 00:3577 $77
    res  0, H                                          ;; 00:3578 $cb $84
.jr_00_357a:
    ld   A, L                                          ;; 00:357a $7d
    add  A, $04                                        ;; 00:357b $c6 $04
    ld   L, A                                          ;; 00:357d $6f
    dec  B                                             ;; 00:357e $05
    jr   NZ, .jr_00_3569                               ;; 00:357f $20 $e8
.jr_00_3581:
    jp   call_00_14db                                  ;; 00:3581 $c3 $db $14

call_00_3584:
    ld   HL, wC000                                     ;; 00:3584 $21 $00 $c0
    ld   B, $24                                        ;; 00:3587 $06 $24
.jr_00_3589:
    ld   A, [HL]                                       ;; 00:3589 $7e
    cp   A, $60                                        ;; 00:358a $fe $60
    jr   C, .jr_00_359a                                ;; 00:358c $38 $0c
    cp   A, $b0                                        ;; 00:358e $fe $b0
    jr   Z, .jr_00_359a                                ;; 00:3590 $28 $08
    add  A, $51                                        ;; 00:3592 $c6 $51
    ld   [HL], A                                       ;; 00:3594 $77
    set  0, H                                          ;; 00:3595 $cb $c4
    ld   [HL], A                                       ;; 00:3597 $77
    res  0, H                                          ;; 00:3598 $cb $84
.jr_00_359a:
    ld   A, L                                          ;; 00:359a $7d
    add  A, $04                                        ;; 00:359b $c6 $04
    ld   L, A                                          ;; 00:359d $6f
    dec  B                                             ;; 00:359e $05
    jr   NZ, .jr_00_3589                               ;; 00:359f $20 $e8
    call call_00_14e4                                  ;; 00:35a1 $cd $e4 $14
    ld   [wC5CA], A                                    ;; 00:35a4 $ea $ca $c5
    ret                                                ;; 00:35a7 $c9

call_00_35a8:
    ldh  A, [hFFCD]                                    ;; 00:35a8 $f0 $cd
    add  A, $0a                                        ;; 00:35aa $c6 $0a
    ld   L, A                                          ;; 00:35ac $6f
    ld   H, $cc                                        ;; 00:35ad $26 $cc
    ld   A, [HL]                                       ;; 00:35af $7e
    and  A, $a0                                        ;; 00:35b0 $e6 $a0
    ret  Z                                             ;; 00:35b2 $c8
    ld   A, [wC5CD]                                    ;; 00:35b3 $fa $cd $c5
    ld   L, A                                          ;; 00:35b6 $6f
    inc  L                                             ;; 00:35b7 $2c
    ld   A, [HL-]                                      ;; 00:35b8 $3a
    inc  A                                             ;; 00:35b9 $3c
    jr   Z, .jr_00_35f3                                ;; 00:35ba $28 $37
    ld   A, [HL]                                       ;; 00:35bc $7e
    push HL                                            ;; 00:35bd $e5
    call call_00_36a7                                  ;; 00:35be $cd $a7 $36
    pop  HL                                            ;; 00:35c1 $e1
    jr   Z, .jr_00_35f3                                ;; 00:35c2 $28 $2f
    ld   C, A                                          ;; 00:35c4 $4f
    ld   A, [wC5CE]                                    ;; 00:35c5 $fa $ce $c5
    ld   L, A                                          ;; 00:35c8 $6f
    inc  L                                             ;; 00:35c9 $2c
    ld   A, [HL-]                                      ;; 00:35ca $3a
    inc  A                                             ;; 00:35cb $3c
    jr   Z, .jr_00_35d7                                ;; 00:35cc $28 $09
    ld   A, [HL]                                       ;; 00:35ce $7e
    push HL                                            ;; 00:35cf $e5
    call call_00_36a7                                  ;; 00:35d0 $cd $a7 $36
    pop  HL                                            ;; 00:35d3 $e1
    cp   A, C                                          ;; 00:35d4 $b9
    jr   Z, .jr_00_35f3                                ;; 00:35d5 $28 $1c
.jr_00_35d7:
    ldh  A, [hFFCD]                                    ;; 00:35d7 $f0 $cd
    add  A, $10                                        ;; 00:35d9 $c6 $10
    ld   L, A                                          ;; 00:35db $6f
    ld   B, $08                                        ;; 00:35dc $06 $08
.jr_00_35de:
    ld   A, [HL]                                       ;; 00:35de $7e
    inc  A                                             ;; 00:35df $3c
    jr   Z, .jr_00_35ee                                ;; 00:35e0 $28 $0c
    dec  L                                             ;; 00:35e2 $2d
    ld   A, [HL+]                                      ;; 00:35e3 $2a
    push HL                                            ;; 00:35e4 $e5
    call call_00_36a7                                  ;; 00:35e5 $cd $a7 $36
    pop  HL                                            ;; 00:35e8 $e1
    or   A, A                                          ;; 00:35e9 $b7
    jr   Z, .jr_00_35ee                                ;; 00:35ea $28 $02
    and  A, C                                          ;; 00:35ec $a1
    ret  NZ                                            ;; 00:35ed $c0
.jr_00_35ee:
    inc  L                                             ;; 00:35ee $2c
    inc  L                                             ;; 00:35ef $2c
    dec  B                                             ;; 00:35f0 $05
    jr   NZ, .jr_00_35de                               ;; 00:35f1 $20 $eb
.jr_00_35f3:
    ld   A, [wC5CE]                                    ;; 00:35f3 $fa $ce $c5
    call call_00_364c                                  ;; 00:35f6 $cd $4c $36
    ld   A, [HL]                                       ;; 00:35f9 $7e
    sub  A, C                                          ;; 00:35fa $91
    ld   [HL], A                                       ;; 00:35fb $77
    ld   A, C                                          ;; 00:35fc $79
    or   A, A                                          ;; 00:35fd $b7
    jr   Z, .jr_00_3614                                ;; 00:35fe $28 $14
    ld   A, [wC5CE]                                    ;; 00:3600 $fa $ce $c5
    call call_00_366c                                  ;; 00:3603 $cd $6c $36
    ld   A, C                                          ;; 00:3606 $79
    inc  A                                             ;; 00:3607 $3c
    jr   NZ, .jr_00_3611                               ;; 00:3608 $20 $07
    ld   A, [HL]                                       ;; 00:360a $7e
    sub  A, $0a                                        ;; 00:360b $d6 $0a
    ld   [HL+], A                                      ;; 00:360d $22
    inc  L                                             ;; 00:360e $2c
    ld   C, $0a                                        ;; 00:360f $0e $0a
.jr_00_3611:
    ld   A, [HL]                                       ;; 00:3611 $7e
    sub  A, C                                          ;; 00:3612 $91
    ld   [HL], A                                       ;; 00:3613 $77
.jr_00_3614:
    ld   A, [wC5CD]                                    ;; 00:3614 $fa $cd $c5
    call call_00_364c                                  ;; 00:3617 $cd $4c $36
    ld   A, [HL]                                       ;; 00:361a $7e
    add  A, C                                          ;; 00:361b $81
    ld   [HL], A                                       ;; 00:361c $77
    ld   A, C                                          ;; 00:361d $79
    or   A, A                                          ;; 00:361e $b7
    jr   Z, .jr_00_3635                                ;; 00:361f $28 $14
    ld   A, [wC5CD]                                    ;; 00:3621 $fa $cd $c5
    call call_00_366c                                  ;; 00:3624 $cd $6c $36
    ld   A, C                                          ;; 00:3627 $79
    inc  A                                             ;; 00:3628 $3c
    jr   NZ, .jr_00_3632                               ;; 00:3629 $20 $07
    ld   A, [HL]                                       ;; 00:362b $7e
    add  A, $0a                                        ;; 00:362c $c6 $0a
    ld   [HL+], A                                      ;; 00:362e $22
    inc  L                                             ;; 00:362f $2c
    ld   C, $0a                                        ;; 00:3630 $0e $0a
.jr_00_3632:
    ld   A, [HL]                                       ;; 00:3632 $7e
    add  A, C                                          ;; 00:3633 $81
    ld   [HL], A                                       ;; 00:3634 $77
.jr_00_3635:
    ld   A, [wC5CE]                                    ;; 00:3635 $fa $ce $c5
    ld   L, A                                          ;; 00:3638 $6f
    ld   A, [wC5CD]                                    ;; 00:3639 $fa $cd $c5
    ld   E, A                                          ;; 00:363c $5f
    ld   H, $cc                                        ;; 00:363d $26 $cc
    ld   D, H                                          ;; 00:363f $54
    ld   C, [HL]                                       ;; 00:3640 $4e
    ld   A, [DE]                                       ;; 00:3641 $1a
    ld   [HL+], A                                      ;; 00:3642 $22
    ld   A, C                                          ;; 00:3643 $79
    ld   [DE], A                                       ;; 00:3644 $12
    inc  E                                             ;; 00:3645 $1c
    ld   C, [HL]                                       ;; 00:3646 $4e
    ld   A, [DE]                                       ;; 00:3647 $1a
    ld   [HL], A                                       ;; 00:3648 $77
    ld   A, C                                          ;; 00:3649 $79
    ld   [DE], A                                       ;; 00:364a $12
    ret                                                ;; 00:364b $c9

call_00_364c:
    ld   L, A                                          ;; 00:364c $6f
    ld   H, $cc                                        ;; 00:364d $26 $cc
    inc  L                                             ;; 00:364f $2c
    ld   A, [HL-]                                      ;; 00:3650 $3a
    ld   C, $00                                        ;; 00:3651 $0e $00
    cp   A, $ff                                        ;; 00:3653 $fe $ff
    ret  Z                                             ;; 00:3655 $c8
    ld   A, [HL]                                       ;; 00:3656 $7e
    call call_00_36a7                                  ;; 00:3657 $cd $a7 $36
    ld   C, $00                                        ;; 00:365a $0e $00
    ld   A, [HL]                                       ;; 00:365c $7e
    and  A, $3c                                        ;; 00:365d $e6 $3c
    ret  Z                                             ;; 00:365f $c8
    ld   A, $04                                        ;; 00:3660 $3e $04
    rst  add_hl_a                                      ;; 00:3662 $c7
    ld   C, [HL]                                       ;; 00:3663 $4e
    ldh  A, [hFFCD]                                    ;; 00:3664 $f0 $cd
    add  A, $0c                                        ;; 00:3666 $c6 $0c
    ld   L, A                                          ;; 00:3668 $6f
    ld   H, $cc                                        ;; 00:3669 $26 $cc
    ret                                                ;; 00:366b $c9

call_00_366c:
    ld   L, A                                          ;; 00:366c $6f
    ld   H, $cc                                        ;; 00:366d $26 $cc
    inc  L                                             ;; 00:366f $2c
    ld   A, [HL-]                                      ;; 00:3670 $3a
    ld   C, $00                                        ;; 00:3671 $0e $00
    cp   A, $ff                                        ;; 00:3673 $fe $ff
    ret  Z                                             ;; 00:3675 $c8
    ld   A, [HL]                                       ;; 00:3676 $7e
    call call_00_36a7                                  ;; 00:3677 $cd $a7 $36
    ld   C, $00                                        ;; 00:367a $0e $00
    ld   A, [HL]                                       ;; 00:367c $7e
    bit  6, A                                          ;; 00:367d $cb $77
    ret  NZ                                            ;; 00:367f $c0
    ld   A, $05                                        ;; 00:3680 $3e $05
    rst  add_hl_a                                      ;; 00:3682 $c7
    ld   C, [HL]                                       ;; 00:3683 $4e
    inc  C                                             ;; 00:3684 $0c
    ldh  A, [hFFCD]                                    ;; 00:3685 $f0 $cd
    add  A, $0b                                        ;; 00:3687 $c6 $0b
    ld   L, A                                          ;; 00:3689 $6f
    ld   H, $cc                                        ;; 00:368a $26 $cc
    dec  C                                             ;; 00:368c $0d
    jr   Z, .jr_00_36a4                                ;; 00:368d $28 $15
    dec  C                                             ;; 00:368f $0d
    jr   Z, .jr_00_36a1                                ;; 00:3690 $28 $0f
    inc  L                                             ;; 00:3692 $2c
    inc  L                                             ;; 00:3693 $2c
    dec  C                                             ;; 00:3694 $0d
    jr   Z, .jr_00_36a1                                ;; 00:3695 $28 $0a
    inc  L                                             ;; 00:3697 $2c
    dec  C                                             ;; 00:3698 $0d
    jr   Z, .jr_00_36a1                                ;; 00:3699 $28 $06
    dec  L                                             ;; 00:369b $2d
    dec  L                                             ;; 00:369c $2d
    dec  L                                             ;; 00:369d $2d
    ld   C, $ff                                        ;; 00:369e $0e $ff
    ret                                                ;; 00:36a0 $c9
.jr_00_36a1:
    ld   C, $0a                                        ;; 00:36a1 $0e $0a
    ret                                                ;; 00:36a3 $c9
.jr_00_36a4:
    ld   C, $00                                        ;; 00:36a4 $0e $00
    ret                                                ;; 00:36a6 $c9

call_00_36a7:
    ld   L, A                                          ;; 00:36a7 $6f
    ld   H, $00                                        ;; 00:36a8 $26 $00
    add  HL, HL                                        ;; 00:36aa $29
    add  HL, HL                                        ;; 00:36ab $29
    add  HL, HL                                        ;; 00:36ac $29
    push DE                                            ;; 00:36ad $d5
    ld   A, $06                                        ;; 00:36ae $3e $06
    rst  switchBank                                    ;; 00:36b0 $ef
    ld   DE, $7700                                     ;; 00:36b1 $11 $00 $77
    add  HL, DE                                        ;; 00:36b4 $19
    pop  DE                                            ;; 00:36b5 $d1
    ld   A, [HL]                                       ;; 00:36b6 $7e
    and  A, $3c                                        ;; 00:36b7 $e6 $3c
    ret                                                ;; 00:36b9 $c9
    db   $21, $7c, $cc, $06, $08, $7e, $b9, $c8        ;; 00:36ba ????????
    db   $2c, $2c, $05, $20, $f8, $21, $0f, $cc        ;; 00:36c2 ????????
    db   $1e, $04, $06, $08, $7e, $b9, $c8, $2c        ;; 00:36ca ????????
    db   $2c, $05, $20, $f8, $7d, $c6, $0f, $6f        ;; 00:36d2 ????????
    db   $1d, $20, $ef, $3e, $01, $b7, $c9             ;; 00:36da ???????

call_00_36e1:
    ld   L, A                                          ;; 00:36e1 $6f
    ld   C, A                                          ;; 00:36e2 $4f
    ld   H, $00                                        ;; 00:36e3 $26 $00
    add  HL, HL                                        ;; 00:36e5 $29
    add  HL, HL                                        ;; 00:36e6 $29
    add  HL, HL                                        ;; 00:36e7 $29
    ld   A, $06                                        ;; 00:36e8 $3e $06
    rst  switchBank                                    ;; 00:36ea $ef
    ld   DE, $7700                                     ;; 00:36eb $11 $00 $77
    add  HL, DE                                        ;; 00:36ee $19
    ld   A, [HL]                                       ;; 00:36ef $7e
    and  A, $02                                        ;; 00:36f0 $e6 $02
    jp   Z, .jp_00_3718                                ;; 00:36f2 $ca $18 $37
    ld   E, L                                          ;; 00:36f5 $5d
    ld   D, H                                          ;; 00:36f6 $54
    ld   A, C                                          ;; 00:36f7 $79
    cp   A, $80                                        ;; 00:36f8 $fe $80
    jr   C, .jr_00_3707                                ;; 00:36fa $38 $0b
    and  A, $7f                                        ;; 00:36fc $e6 $7f
    cp   A, $07                                        ;; 00:36fe $fe $07
    jr   NC, .jp_00_3718                               ;; 00:3700 $30 $16
    ld   HL, $3769                                     ;; 00:3702 $21 $69 $37
    jr   .jr_00_3710                                   ;; 00:3705 $18 $09
.jr_00_3707:
    ld   HL, $3739                                     ;; 00:3707 $21 $39 $37
    ld   A, C                                          ;; 00:370a $79
    cp   A, $18                                        ;; 00:370b $fe $18
    jp   NC, .jp_00_3718                               ;; 00:370d $d2 $18 $37
.jr_00_3710:
    add  A, A                                          ;; 00:3710 $87
    rst  add_hl_a                                      ;; 00:3711 $c7
    ld   A, [HL+]                                      ;; 00:3712 $2a
    ld   H, [HL]                                       ;; 00:3713 $66
    ld   L, A                                          ;; 00:3714 $6f
    jp   HL                                            ;; 00:3715 $e9
    db   $af, $c9                                      ;; 00:3716 ??
.jp_00_3718:
    ld   DE, $32                                       ;; 00:3718 $11 $32 $00
    ld   HL, wC60D                                     ;; 00:371b $21 $0d $c6
    ld   A, $0c                                        ;; 00:371e $3e $0c
    rst  rst_00_0008                                   ;; 00:3720 $cf
    ld   BC, $a01                                      ;; 00:3721 $01 $01 $0a
    ld   HL, wC600                                     ;; 00:3724 $21 $00 $c6
    call call_00_01bf                                  ;; 00:3727 $cd $bf $01
    ld   DE, $9de8                                     ;; 00:372a $11 $e8 $9d
    ld   BC, $c03                                      ;; 00:372d $01 $03 $0c
    call call_00_2a9c                                  ;; 00:3730 $cd $9c $2a
    call call_00_3cf7                                  ;; 00:3733 $cd $f7 $3c
    ld   A, $ff                                        ;; 00:3736 $3e $ff
    ret                                                ;; 00:3738 $c9
    db   $81, $38, $81, $38, $cf, $38, $cf, $38        ;; 00:3739 ????????
    db   $29, $39, $29, $39, $29, $39, $4a, $39        ;; 00:3741 ????????
    db   $74, $39, $bd, $39, $02, $38, $77, $37        ;; 00:3749 ????????
    db   $d9, $39, $e0, $39, $1b, $3a, $1b, $3a        ;; 00:3751 ????????
    db   $1b, $3a, $9e, $3a, $aa, $3a, $b6, $3a        ;; 00:3759 ????????
    db   $32, $3b, $75, $3a, $75, $3a, $3d, $3b        ;; 00:3761 ????????
    db   $81, $38, $cf, $38, $cf, $38, $29, $39        ;; 00:3769 ????????
    db   $aa, $39, $4a, $39, $77, $37, $01, $04        ;; 00:3771 ????????
    db   $08, $cd, $0f, $2d, $3e, $01, $ea, $da        ;; 00:3779 ????????
    db   $c3, $11, $30, $00, $21, $15, $c6, $01        ;; 00:3781 ????????
    db   $0b, $04, $3e, $0a, $cf, $11, $8a, $9c        ;; 00:3789 ????????
    db   $01, $06, $0a, $cd, $9c, $2a, $d7, $df        ;; 00:3791 ????????
    db   $cd, $74, $01, $b7, $28, $f8, $cb, $47        ;; 00:3799 ????????
    db   $c2, $cb, $37, $cb, $4f, $c2, $36, $37        ;; 00:37a1 ????????
    db   $fe, $ff, $ca, $36, $37, $07, $38, $12        ;; 00:37a9 ????????
    db   $07, $30, $e3, $fa, $da, $c3, $21, $c5        ;; 00:37b1 ????????
    db   $cc, $be, $28, $da, $3c, $ea, $da, $c3        ;; 00:37b9 ????????
    db   $18, $bf, $fa, $da, $c3, $3d, $28, $ce        ;; 00:37c1 ????????
    db   $18, $f3, $fa, $c1, $cc, $b7, $c2, $18        ;; 00:37c9 ????????
    db   $37, $fa, $da, $c3, $3d, $4f, $87, $81        ;; 00:37d1 ????????
    db   $21, $d0, $52, $c7, $7d, $ea, $bf, $c5        ;; 00:37d9 ????????
    db   $7c, $ea, $c0, $c5, $3e, $15, $ea, $e4        ;; 00:37e1 ????????
    db   $ff, $3e, $eb, $e0, $40, $cd, $db, $14        ;; 00:37e9 ????????
    db   $af, $e0, $43, $e0, $42, $cd, $f5, $3d        ;; 00:37f1 ????????
    db   $cd, $e8, $14, $cd, $fe, $23, $c3, $4e        ;; 00:37f9 ????????
    db   $3b, $01, $10, $0a, $cd, $0f, $2d, $21        ;; 00:3801 ????????
    db   $7c, $cc, $11, $1a, $c6, $3e, $0c, $cd        ;; 00:3809 ????????
    db   $ec, $29, $11, $07, $9c, $01, $12, $0c        ;; 00:3811 ????????
    db   $cd, $9c, $2a, $21, $29, $3f, $af, $cd        ;; 00:3819 ????????
    db   $2e, $2b, $fe, $ff, $ca, $36, $37, $87        ;; 00:3821 ????????
    db   $21, $7c, $cc, $c7, $5e, $2c, $7e, $3c        ;; 00:3829 ????????
    db   $ca, $36, $37, $7b, $e5, $cd, $de, $2a        ;; 00:3831 ????????
    db   $21, $07, $00, $19, $7e, $e1, $77, $c3        ;; 00:3839 ????????
    db   $16, $37, $cd, $78, $38, $21, $81, $3f        ;; 00:3841 ????????
    db   $af, $cd, $2e, $2b, $fe, $ff, $c8, $cd        ;; 00:3849 ????????
    db   $ec, $3c, $e0, $cd, $4f, $06, $cc, $0a        ;; 00:3851 ????????
    db   $fe, $ff, $28, $e9, $79, $c6, $0a, $4f        ;; 00:3859 ????????
    db   $0a, $e6, $a0, $f5, $3e, $06, $ef, $f1        ;; 00:3861 ????????
    db   $c9, $3e, $11, $ea, $e4, $ff, $cd, $78        ;; 00:3869 ????????
    db   $38, $cd, $f7, $3c, $c3, $16, $37, $01        ;; 00:3871 ????????
    db   $0c, $04, $11, $8b, $9c, $c3, $86, $2e        ;; 00:3879 ????????
    db   $d5, $cd, $43, $38, $d1, $fe, $ff, $ca        ;; 00:3881 ????????
    db   $36, $37, $f0, $cd, $6f, $26, $cc, $7e        ;; 00:3889 ????????
    db   $e6, $03, $c2, $18, $37, $e5, $21, $05        ;; 00:3891 ????????
    db   $00, $19, $5e, $af, $cd, $6b, $01, $4f        ;; 00:3899 ????????
    db   $06, $00, $2b, $7e, $e1, $e5, $f5, $3e        ;; 00:38a1 ????????
    db   $06, $c7, $f1, $5e, $23, $56, $6f, $26        ;; 00:38a9 ????????
    db   $00, $19, $09, $4d, $44, $e1, $e5, $3e        ;; 00:38b1 ????????
    db   $08, $c7, $2a, $66, $6f, $cd, $a0, $3b        ;; 00:38b9 ????????
    db   $30, $02, $4d, $44, $e1, $3e, $06, $c7        ;; 00:38c1 ????????
    db   $71, $23, $70, $c3, $6a, $38, $d5, $cd        ;; 00:38c9 ????????
    db   $43, $38, $d1, $fe, $ff, $ca, $36, $37        ;; 00:38d1 ????????
    db   $f0, $cd, $6f, $26, $cc, $7e, $e6, $03        ;; 00:38d9 ????????
    db   $c2, $18, $37, $e5, $21, $04, $00, $19        ;; 00:38e1 ????????
    db   $5e, $e1, $e5, $7d, $c6, $0e, $6f, $4e        ;; 00:38e9 ????????
    db   $fa, $c8, $c5, $fe, $ff, $28, $03, $c6        ;; 00:38f1 ????????
    db   $0e, $6f, $46, $6b, $60, $cd, $5f, $01        ;; 00:38f9 ????????
    db   $11, $04, $00, $cd, $0b, $00, $cd, $65        ;; 00:3901 ????????
    db   $01, $af, $cd, $6b, $01, $6f, $26, $00        ;; 00:3909 ????????
    db   $54, $19, $58, $19, $59, $19, $4d, $44        ;; 00:3911 ????????
    db   $e1, $e5, $3e, $06, $c7, $7e, $23, $66        ;; 00:3919 ????????
    db   $6f, $09, $4d, $44, $e1, $c3, $b7, $38        ;; 00:3921 ????????
    db   $d5, $cd, $43, $38, $d1, $fe, $ff, $ca        ;; 00:3929 ????????
    db   $36, $37, $f0, $cd, $6f, $26, $cc, $7e        ;; 00:3931 ????????
    db   $e6, $01, $c2, $18, $37, $e5, $21, $04        ;; 00:3939 ????????
    db   $00, $19, $7e, $e1, $a6, $77, $c3, $6a        ;; 00:3941 ????????
    db   $38, $d5, $cd, $43, $38, $d1, $fe, $ff        ;; 00:3949 ????????
    db   $ca, $36, $37, $f0, $cd, $6f, $26, $cc        ;; 00:3951 ????????
    db   $7e, $e6, $01, $ca, $18, $37, $e5, $21        ;; 00:3959 ????????
    db   $04, $00, $19, $7e, $e1, $a6, $77, $7d        ;; 00:3961 ????????
    db   $c6, $06, $6f, $36, $01, $2c, $36, $00        ;; 00:3969 ????????
    db   $c3, $6a, $38, $d5, $cd, $43, $38, $d1        ;; 00:3971 ????????
    db   $fe, $ff, $ca, $36, $37, $f0, $cd, $6f        ;; 00:3979 ????????
    db   $26, $cc, $7e, $e6, $01, $c2, $18, $37        ;; 00:3981 ????????
    db   $e5, $21, $04, $00, $19, $7e, $e1, $a6        ;; 00:3989 ????????
    db   $77, $7d, $c6, $08, $6f, $5e, $2c, $56        ;; 00:3991 ????????
    db   $7d, $d6, $03, $6f, $73, $2c, $72, $7d        ;; 00:3999 ????????
    db   $c6, $08, $6f, $cd, $ee, $2f, $c3, $6a        ;; 00:39a1 ????????
    db   $38, $fa, $c8, $c5, $c6, $08, $6f, $5e        ;; 00:39a9 ????????
    db   $2c, $56, $7d, $d6, $03, $6f, $73, $2c        ;; 00:39b1 ????????
    db   $72, $c3, $6a, $38, $d5, $cd, $43, $38        ;; 00:39b9 ????????
    db   $d1, $fe, $ff, $ca, $36, $37, $f0, $cd        ;; 00:39c1 ????????
    db   $c6, $0a, $6f, $26, $cc, $7e, $e6, $0f        ;; 00:39c9 ????????
    db   $fe, $07, $30, $01, $34, $c3, $6a, $38        ;; 00:39d1 ????????
    db   $3e, $0b, $ea, $ac, $c5, $18, $05, $3e        ;; 00:39d9 ????????
    db   $0d, $ea, $ac, $c5, $d5, $cd, $43, $38        ;; 00:39e1 ????????
    db   $d1, $fe, $ff, $c8, $e6, $80, $ca, $18        ;; 00:39e9 ????????
    db   $37, $f0, $cd, $6f, $26, $cc, $7e, $e6        ;; 00:39f1 ????????
    db   $03, $c2, $36, $37, $fa, $ac, $c5, $85        ;; 00:39f9 ????????
    db   $6f, $4e, $e5, $21, $05, $00, $19, $5e        ;; 00:3a01 ????????
    db   $af, $cd, $6b, $01, $47, $59, $cd, $8a        ;; 00:3a09 ????????
    db   $3b, $79, $2b, $86, $e1, $86, $77, $c3        ;; 00:3a11 ????????
    db   $6a, $38, $d5, $cd, $43, $38, $d1, $fe        ;; 00:3a19 ????????
    db   $ff, $c8, $e6, $80, $ca, $18, $37, $f0        ;; 00:3a21 ????????
    db   $cd, $6f, $26, $cc, $7e, $e6, $03, $c2        ;; 00:3a29 ????????
    db   $36, $37, $e5, $21, $04, $00, $19, $6e        ;; 00:3a31 ????????
    db   $26, $0a, $cd, $5f, $01, $4d, $44, $e1        ;; 00:3a39 ????????
    db   $7d, $c6, $08, $6f, $e5, $2a, $66, $6f        ;; 00:3a41 ????????
    db   $cd, $a0, $3b, $38, $0a, $5d, $54, $e1        ;; 00:3a49 ????????
    db   $13, $73, $2c, $72, $c3, $6a, $38, $21        ;; 00:3a51 ????????
    db   $05, $00, $19, $5e, $af, $cd, $6b, $01        ;; 00:3a59 ????????
    db   $c6, $05, $4f, $06, $00, $e1, $e5, $2a        ;; 00:3a61 ????????
    db   $66, $6f, $09, $4d, $44, $e1, $71, $2c        ;; 00:3a69 ????????
    db   $70, $c3, $6a, $38, $21, $04, $00, $19        ;; 00:3a71 ????????
    db   $c5, $4e, $cd, $ba, $36, $c1, $c2, $18        ;; 00:3a79 ????????
    db   $37, $3e, $ff, $22, $77, $cd, $ba, $36        ;; 00:3a81 ????????
    db   $3e, $ff, $22, $77, $1e, $02, $3e, $0a        ;; 00:3a89 ????????
    db   $cd, $80, $26, $1e, $06, $3e, $05, $cd        ;; 00:3a91 ????????
    db   $80, $26, $c3, $1e, $3b, $3e, $04, $ea        ;; 00:3a99 ????????
    db   $ac, $c5, $3e, $02, $ea, $ad, $c5, $18        ;; 00:3aa1 ????????
    db   $16, $3e, $03, $ea, $ac, $c5, $3e, $03        ;; 00:3aa9 ????????
    db   $ea, $ad, $c5, $18, $0a, $3e, $02, $ea        ;; 00:3ab1 ????????
    db   $ac, $c5, $3e, $04, $ea, $ad, $c5, $fa        ;; 00:3ab9 ????????
    db   $c7, $cc, $fe, $4f, $c2, $18, $37, $cd        ;; 00:3ac1 ????????
    db   $84, $3b, $fe, $07, $c2, $18, $37, $fa        ;; 00:3ac9 ????????
    db   $ad, $c5, $5f, $fa, $ac, $c5, $cd, $80        ;; 00:3ad1 ????????
    db   $26, $cd, $ba, $36, $fa, $c8, $c5, $fe        ;; 00:3ad9 ????????
    db   $ff, $20, $06, $3e, $ff, $22, $77, $18        ;; 00:3ae1 ????????
    db   $15, $e0, $cd, $7d, $ea, $ce, $c5, $3e        ;; 00:3ae9 ????????
    db   $ff, $21, $cb, $cc, $22, $77, $3e, $cb        ;; 00:3af1 ????????
    db   $ea, $cd, $c5, $cd, $a8, $35, $3e, $01        ;; 00:3af9 ????????
    db   $cd, $69, $26, $fe, $03, $ca, $36, $37        ;; 00:3b01 ????????
    db   $3c, $f5, $5f, $3e, $01, $cd, $80, $26        ;; 00:3b09 ????????
    db   $f1, $fe, $03, $c2, $36, $37, $1e, $01        ;; 00:3b11 ????????
    db   $3e, $0a, $cd, $80, $26, $3e, $1f, $ea        ;; 00:3b19 ????????
    db   $aa, $c3, $af, $cd, $29, $3b, $18, $25        ;; 00:3b21 ????????

call_00_3b29:
    ld   [wC3A9], A                                    ;; 00:3b29 $ea $a9 $c3

jp_00_3b2c:
    ld   A, $01                                        ;; 00:3b2c $3e $01
    ld   [wC3AB], A                                    ;; 00:3b2e $ea $ab $c3
    ret                                                ;; 00:3b31 $c9
    db   $3e, $e9, $ea, $aa, $c3, $af, $cd, $29        ;; 00:3b32 ????????
    db   $3b, $18, $11, $fa, $c7, $cc, $fe, $c4        ;; 00:3b3a ????????
    db   $c2, $18, $37, $3e, $21, $ea, $aa, $c3        ;; 00:3b42 ????????
    db   $af, $cd, $29, $3b, $e1, $e1, $2c, $7e        ;; 00:3b4a ????????
    db   $fe, $fe, $30, $0c, $35, $c2, $62, $3b        ;; 00:3b52 ????????
    db   $2d, $2a, $fe, $80, $30, $02, $36, $ff        ;; 00:3b5a ????????
    db   $31, $fe, $cf, $c3, $ce, $26                  ;; 00:3b62 ??????

call_00_3b68:
    ld   A, [wCCC9]                                    ;; 00:3b68 $fa $c9 $cc
    ld   D, A                                          ;; 00:3b6b $57
    ld   A, [wCCC8]                                    ;; 00:3b6c $fa $c8 $cc
    ld   E, A                                          ;; 00:3b6f $5f
    ld   A, [wC5B7]                                    ;; 00:3b70 $fa $b7 $c5
    or   A, A                                          ;; 00:3b73 $b7
    jr   Z, .jr_00_3b7e                                ;; 00:3b74 $28 $08
    dec  A                                             ;; 00:3b76 $3d
    jr   Z, .jr_00_3b80                                ;; 00:3b77 $28 $07
    dec  A                                             ;; 00:3b79 $3d
    jr   Z, .jr_00_3b82                                ;; 00:3b7a $28 $06
    inc  D                                             ;; 00:3b7c $14
    ret                                                ;; 00:3b7d $c9
.jr_00_3b7e:
    inc  E                                             ;; 00:3b7e $1c
    ret                                                ;; 00:3b7f $c9
.jr_00_3b80:
    dec  E                                             ;; 00:3b80 $1d
    ret                                                ;; 00:3b81 $c9
.jr_00_3b82:
    dec  D                                             ;; 00:3b82 $15
    ret                                                ;; 00:3b83 $c9
    db   $cd, $68, $3b, $c3, $b0, $13, $0e, $00        ;; 00:3b84 ????????
    db   $7b, $b7, $c8, $af, $16, $08, $cb, $00        ;; 00:3b8c ????????
    db   $17, $bb, $38, $01, $93, $3f, $cb, $11        ;; 00:3b94 ????????
    db   $15, $20, $f3, $c9, $7c, $b8, $c0, $7d        ;; 00:3b9c ????????
    db   $b9, $c9                                      ;; 00:3ba4 ??

jr_00_3ba6:
    sub  A, $20                                        ;; 00:3ba6 $d6 $20
    ld   [wCCCA], A                                    ;; 00:3ba8 $ea $ca $cc
    jr   jp_00_3bb0                                    ;; 00:3bab $18 $03

jp_00_3bad:
    call call_00_2d1a                                  ;; 00:3bad $cd $1a $2d

jp_00_3bb0:
    call call_00_2cb8                                  ;; 00:3bb0 $cd $b8 $2c
    call call_00_3d04                                  ;; 00:3bb3 $cd $04 $3d
.jr_00_3bb6:
    call call_00_2caa                                  ;; 00:3bb6 $cd $aa $2c
    ld   HL, $3eac                                     ;; 00:3bb9 $21 $ac $3e
    xor  A, A                                          ;; 00:3bbc $af
    call call_00_2b2e                                  ;; 00:3bbd $cd $2e $2b
    cp   A, $ff                                        ;; 00:3bc0 $fe $ff
    jp   Z, jp_00_26ce                                 ;; 00:3bc2 $ca $ce $26
    cp   A, $20                                        ;; 00:3bc5 $fe $20
    jr   NC, jr_00_3ba6                                ;; 00:3bc7 $30 $dd
    srl  A                                             ;; 00:3bc9 $cb $3f
    srl  A                                             ;; 00:3bcb $cb $3f
    srl  A                                             ;; 00:3bcd $cb $3f
    ldh  [hFFCD], A                                    ;; 00:3bcf $e0 $cd
    call call_00_2cce                                  ;; 00:3bd1 $cd $ce $2c
    ld   HL, $3eac                                     ;; 00:3bd4 $21 $ac $3e
    xor  A, A                                          ;; 00:3bd7 $af
    call call_00_2b2e                                  ;; 00:3bd8 $cd $2e $2b
    cp   A, $ff                                        ;; 00:3bdb $fe $ff
    jr   Z, .jr_00_3bb6                                ;; 00:3bdd $28 $d7
    cp   A, $20                                        ;; 00:3bdf $fe $20
    jr   NC, jr_00_3ba6                                ;; 00:3be1 $30 $c3
    srl  A                                             ;; 00:3be3 $cb $3f
    srl  A                                             ;; 00:3be5 $cb $3f
    srl  A                                             ;; 00:3be7 $cb $3f
    ld   B, A                                          ;; 00:3be9 $47
    ldh  A, [hFFCD]                                    ;; 00:3bea $f0 $cd
    cp   A, B                                          ;; 00:3bec $b8
    jr   NZ, .jr_00_3bff                               ;; 00:3bed $20 $10
    ld   [wC3AC], A                                    ;; 00:3bef $ea $ac $c3
    call call_00_3cec                                  ;; 00:3bf2 $cd $ec $3c
    ldh  [hFFCD], A                                    ;; 00:3bf5 $e0 $cd
    call call_00_2a0f                                  ;; 00:3bf7 $cd $0f $2a
    call call_00_3cf7                                  ;; 00:3bfa $cd $f7 $3c
    jr   jp_00_3bb0                                    ;; 00:3bfd $18 $b1
.jr_00_3bff:
    jr   NC, .jr_00_3c06                               ;; 00:3bff $30 $05
    ld   C, A                                          ;; 00:3c01 $4f
    ld   A, B                                          ;; 00:3c02 $78
    ldh  [hFFCD], A                                    ;; 00:3c03 $e0 $cd
    ld   B, C                                          ;; 00:3c05 $41
.jr_00_3c06:
    ld   E, A                                          ;; 00:3c06 $5f
    push BC                                            ;; 00:3c07 $c5
    call call_00_3cec                                  ;; 00:3c08 $cd $ec $3c
    ld   L, A                                          ;; 00:3c0b $6f
    ld   H, $cc                                        ;; 00:3c0c $26 $cc
    ld   A, [HL]                                       ;; 00:3c0e $7e
    and  A, $03                                        ;; 00:3c0f $e6 $03
    jr   Z, .jr_00_3c16                                ;; 00:3c11 $28 $03
    pop  BC                                            ;; 00:3c13 $c1
    jr   .jr_00_3bb6                                   ;; 00:3c14 $18 $a0
.jr_00_3c16:
    pop  BC                                            ;; 00:3c16 $c1
    ld   A, [wCC8C]                                    ;; 00:3c17 $fa $8c $cc
    cp   A, E                                          ;; 00:3c1a $bb
    jr   NZ, .jr_00_3c23                               ;; 00:3c1b $20 $06
    ld   A, B                                          ;; 00:3c1d $78
    ld   [wCC8C], A                                    ;; 00:3c1e $ea $8c $cc
    jr   .jr_00_3c2e                                   ;; 00:3c21 $18 $0b
.jr_00_3c23:
    ld   A, [wCC8C]                                    ;; 00:3c23 $fa $8c $cc
    cp   A, B                                          ;; 00:3c26 $b8
    jr   NZ, .jr_00_3c2e                               ;; 00:3c27 $20 $05
    ldh  A, [hFFCD]                                    ;; 00:3c29 $f0 $cd
    ld   [wCC8C], A                                    ;; 00:3c2b $ea $8c $cc
.jr_00_3c2e:
    push BC                                            ;; 00:3c2e $c5
    push BC                                            ;; 00:3c2f $c5
    ldh  A, [hFFCD]                                    ;; 00:3c30 $f0 $cd
    call call_00_3cec                                  ;; 00:3c32 $cd $ec $3c
    pop  BC                                            ;; 00:3c35 $c1
    ld   L, A                                          ;; 00:3c36 $6f
    ld   A, B                                          ;; 00:3c37 $78
    call call_00_3cec                                  ;; 00:3c38 $cd $ec $3c
    ld   E, A                                          ;; 00:3c3b $5f
    ld   H, $cc                                        ;; 00:3c3c $26 $cc
    ld   D, H                                          ;; 00:3c3e $54
    ld   B, $1f                                        ;; 00:3c3f $06 $1f
.jr_00_3c41:
    ld   C, [HL]                                       ;; 00:3c41 $4e
    ld   A, [DE]                                       ;; 00:3c42 $1a
    ld   [HL+], A                                      ;; 00:3c43 $22
    ld   A, C                                          ;; 00:3c44 $79
    ld   [DE], A                                       ;; 00:3c45 $12
    inc  E                                             ;; 00:3c46 $1c
    dec  B                                             ;; 00:3c47 $05
    jr   NZ, .jr_00_3c41                               ;; 00:3c48 $20 $f7
    call call_00_2caa                                  ;; 00:3c4a $cd $aa $2c
    call call_00_2cb1                                  ;; 00:3c4d $cd $b1 $2c
    pop  BC                                            ;; 00:3c50 $c1
    push BC                                            ;; 00:3c51 $c5
    swap B                                             ;; 00:3c52 $cb $30
    ld   L, B                                          ;; 00:3c54 $68
    ld   H, $c0                                        ;; 00:3c55 $26 $c0
    ld   C, $02                                        ;; 00:3c57 $0e $02
    ld   B, $10                                        ;; 00:3c59 $06 $10
    call call_00_3c8c                                  ;; 00:3c5b $cd $8c $3c
    pop  BC                                            ;; 00:3c5e $c1
    ldh  A, [hFFCD]                                    ;; 00:3c5f $f0 $cd
    sub  A, B                                          ;; 00:3c61 $90
    add  A, A                                          ;; 00:3c62 $87
    add  A, A                                          ;; 00:3c63 $87
    add  A, A                                          ;; 00:3c64 $87
    ld   C, A                                          ;; 00:3c65 $4f
    add  A, A                                          ;; 00:3c66 $87
    add  A, C                                          ;; 00:3c67 $81
    ld   B, A                                          ;; 00:3c68 $47
    ld   C, $00                                        ;; 00:3c69 $0e $00
    call call_00_3c8c                                  ;; 00:3c6b $cd $8c $3c
    ld   BC, $602                                      ;; 00:3c6e $01 $02 $06
    call call_00_2d0f                                  ;; 00:3c71 $cd $0f $2d
    ld   DE, $2f                                       ;; 00:3c74 $11 $2f $00
    ld   HL, wC611                                     ;; 00:3c77 $21 $11 $c6
    ld   A, $08                                        ;; 00:3c7a $3e $08
    rst  rst_00_0008                                   ;; 00:3c7c $cf
    ld   DE, $9d0a                                     ;; 00:3c7d $11 $0a $9d
    ld   BC, $804                                      ;; 00:3c80 $01 $04 $08
    call call_00_2a9c                                  ;; 00:3c83 $cd $9c $2a
    call call_00_3cf7                                  ;; 00:3c86 $cd $f7 $3c
    jp   jp_00_3bb0                                    ;; 00:3c89 $c3 $b0 $3b

call_00_3c8c:
    push HL                                            ;; 00:3c8c $e5
    rst  rst_00_0010                                   ;; 00:3c8d $d7
    rst  rst_00_0018                                   ;; 00:3c8e $df
    ld   D, $04                                        ;; 00:3c8f $16 $04
    ld   A, C                                          ;; 00:3c91 $79
    or   A, A                                          ;; 00:3c92 $b7
    jr   NZ, .jr_00_3c99                               ;; 00:3c93 $20 $04
    ld   E, $01                                        ;; 00:3c95 $1e $01
    jr   .jr_00_3caa                                   ;; 00:3c97 $18 $11
.jr_00_3c99:
    dec  A                                             ;; 00:3c99 $3d
    jr   NZ, .jr_00_3ca0                               ;; 00:3c9a $20 $04
    ld   E, $ff                                        ;; 00:3c9c $1e $ff
    jr   .jr_00_3caa                                   ;; 00:3c9e $18 $0a
.jr_00_3ca0:
    inc  L                                             ;; 00:3ca0 $2c
    dec  A                                             ;; 00:3ca1 $3d
    jr   NZ, .jr_00_3ca8                               ;; 00:3ca2 $20 $04
    ld   E, $ff                                        ;; 00:3ca4 $1e $ff
    jr   .jr_00_3caa                                   ;; 00:3ca6 $18 $02
.jr_00_3ca8:
    ld   E, $01                                        ;; 00:3ca8 $1e $01
.jr_00_3caa:
    ld   A, [HL]                                       ;; 00:3caa $7e
    add  A, E                                          ;; 00:3cab $83
    ld   [HL], A                                       ;; 00:3cac $77
    ld   A, L                                          ;; 00:3cad $7d
    add  A, $04                                        ;; 00:3cae $c6 $04
    ld   L, A                                          ;; 00:3cb0 $6f
    dec  D                                             ;; 00:3cb1 $15
    jr   NZ, .jr_00_3caa                               ;; 00:3cb2 $20 $f6
    ld   A, [wC5C7]                                    ;; 00:3cb4 $fa $c7 $c5
    inc  A                                             ;; 00:3cb7 $3c
    ld   [wC5C7], A                                    ;; 00:3cb8 $ea $c7 $c5
    and  A, $08                                        ;; 00:3cbb $e6 $08
    jr   Z, .jr_00_3ce3                                ;; 00:3cbd $28 $24
    xor  A, A                                          ;; 00:3cbf $af
    ld   [wC5C7], A                                    ;; 00:3cc0 $ea $c7 $c5
    pop  HL                                            ;; 00:3cc3 $e1
    push HL                                            ;; 00:3cc4 $e5
    ld   A, L                                          ;; 00:3cc5 $7d
    add  A, $02                                        ;; 00:3cc6 $c6 $02
    ld   L, A                                          ;; 00:3cc8 $6f
    ld   D, H                                          ;; 00:3cc9 $54
    push BC                                            ;; 00:3cca $c5
    ld   B, $02                                        ;; 00:3ccb $06 $02
.jr_00_3ccd:
    add  A, $04                                        ;; 00:3ccd $c6 $04
    ld   E, A                                          ;; 00:3ccf $5f
    ld   C, [HL]                                       ;; 00:3cd0 $4e
    ld   A, [DE]                                       ;; 00:3cd1 $1a
    ld   [HL+], A                                      ;; 00:3cd2 $22
    ld   A, C                                          ;; 00:3cd3 $79
    ld   [DE], A                                       ;; 00:3cd4 $12
    inc  E                                             ;; 00:3cd5 $1c
    ld   A, [HL]                                       ;; 00:3cd6 $7e
    xor  A, $20                                        ;; 00:3cd7 $ee $20
    ld   [HL+], A                                      ;; 00:3cd9 $22
    ld   [DE], A                                       ;; 00:3cda $12
    ld   A, L                                          ;; 00:3cdb $7d
    add  A, $06                                        ;; 00:3cdc $c6 $06
    ld   L, A                                          ;; 00:3cde $6f
    dec  B                                             ;; 00:3cdf $05
    jr   NZ, .jr_00_3ccd                               ;; 00:3ce0 $20 $eb
    pop  BC                                            ;; 00:3ce2 $c1
.jr_00_3ce3:
    pop  HL                                            ;; 00:3ce3 $e1
    ld   A, L                                          ;; 00:3ce4 $7d
    and  A, $f0                                        ;; 00:3ce5 $e6 $f0
    ld   L, A                                          ;; 00:3ce7 $6f
    dec  B                                             ;; 00:3ce8 $05
    jr   NZ, call_00_3c8c                              ;; 00:3ce9 $20 $a1
    ret                                                ;; 00:3ceb $c9

call_00_3cec:
    inc  A                                             ;; 00:3cec $3c
    ld   B, A                                          ;; 00:3ced $47
    ld   A, $e1                                        ;; 00:3cee $3e $e1
    ld   C, $1f                                        ;; 00:3cf0 $0e $1f
.jr_00_3cf2:
    add  A, C                                          ;; 00:3cf2 $81
    dec  B                                             ;; 00:3cf3 $05
    jr   NZ, .jr_00_3cf2                               ;; 00:3cf4 $20 $fc
    ret                                                ;; 00:3cf6 $c9

call_00_3cf7:
    rst  rst_00_0010                                   ;; 00:3cf7 $d7
    rst  rst_00_0018                                   ;; 00:3cf8 $df
    call call_00_0177                                  ;; 00:3cf9 $cd $77 $01
.jr_00_3cfc:
    rst  rst_00_0010                                   ;; 00:3cfc $d7
    call call_00_0174                                  ;; 00:3cfd $cd $74 $01
    or   A, A                                          ;; 00:3d00 $b7
    jr   Z, .jr_00_3cfc                                ;; 00:3d01 $28 $f9
    ret                                                ;; 00:3d03 $c9

call_00_3d04:
    ld   BC, $1210                                     ;; 00:3d04 $01 $10 $12
    call call_00_2d0f                                  ;; 00:3d07 $cd $0f $2d
    call call_00_3d66                                  ;; 00:3d0a $cd $66 $3d
    ld   DE, $1b                                       ;; 00:3d0d $11 $1b $00
    ld   HL, wC62B                                     ;; 00:3d10 $21 $2b $c6
    ld   BC, $103                                      ;; 00:3d13 $01 $03 $01
    ld   A, $14                                        ;; 00:3d16 $3e $14
    rst  rst_00_0008                                   ;; 00:3d18 $cf
    ld   HL, wCC00                                     ;; 00:3d19 $21 $00 $cc
    ld   DE, wC648                                     ;; 00:3d1c $11 $48 $c6
    ld   B, $04                                        ;; 00:3d1f $06 $04
.jr_00_3d21:
    push HL                                            ;; 00:3d21 $e5
    ld   A, [HL]                                       ;; 00:3d22 $7e
    cp   A, $ff                                        ;; 00:3d23 $fe $ff
    jr   Z, .jr_00_3d3a                                ;; 00:3d25 $28 $13
    ld   A, L                                          ;; 00:3d27 $7d
    add  A, $0a                                        ;; 00:3d28 $c6 $0a
    ld   L, A                                          ;; 00:3d2a $6f
    ld   A, [HL]                                       ;; 00:3d2b $7e
    and  A, $0f                                        ;; 00:3d2c $e6 $0f
    jr   Z, .jr_00_3d3a                                ;; 00:3d2e $28 $0a
    ld   C, A                                          ;; 00:3d30 $4f
    push DE                                            ;; 00:3d31 $d5
.jr_00_3d32:
    ld   A, $f2                                        ;; 00:3d32 $3e $f2
    ld   [DE], A                                       ;; 00:3d34 $12
    inc  DE                                            ;; 00:3d35 $13
    dec  C                                             ;; 00:3d36 $0d
    jr   NZ, .jr_00_3d32                               ;; 00:3d37 $20 $f9
    pop  DE                                            ;; 00:3d39 $d1
.jr_00_3d3a:
    ld   HL, $3c                                       ;; 00:3d3a $21 $3c $00
    add  HL, DE                                        ;; 00:3d3d $19
    ld   E, L                                          ;; 00:3d3e $5d
    ld   D, H                                          ;; 00:3d3f $54
    pop  HL                                            ;; 00:3d40 $e1
    ld   A, L                                          ;; 00:3d41 $7d
    add  A, $1f                                        ;; 00:3d42 $c6 $1f
    ld   L, A                                          ;; 00:3d44 $6f
    dec  B                                             ;; 00:3d45 $05
    jr   NZ, .jr_00_3d21                               ;; 00:3d46 $20 $d9
    ld   DE, $9c00                                     ;; 00:3d48 $11 $00 $9c
    ld   BC, $1412                                     ;; 00:3d4b $01 $12 $14
    call call_00_2a9c                                  ;; 00:3d4e $cd $9c $2a
    ld   A, [wCCCA]                                    ;; 00:3d51 $fa $ca $cc
    swap A                                             ;; 00:3d54 $cb $37
    and  A, $f0                                        ;; 00:3d56 $e6 $f0
    add  A, $10                                        ;; 00:3d58 $c6 $10
    ld   B, A                                          ;; 00:3d5a $47
    ld   C, $90                                        ;; 00:3d5b $0e $90
    ld   L, $70                                        ;; 00:3d5d $2e $70
    ld   E, $7c                                        ;; 00:3d5f $1e $7c
    ld   H, $02                                        ;; 00:3d61 $26 $02
    jp   jp_00_2c48                                    ;; 00:3d63 $c3 $48 $2c

call_00_3d66:
    ld   HL, wCC00                                     ;; 00:3d66 $21 $00 $cc
    ld   DE, $8000                                     ;; 00:3d69 $11 $00 $80
    ld   B, $04                                        ;; 00:3d6c $06 $04
.jr_00_3d6e:
    push BC                                            ;; 00:3d6e $c5
    call call_00_3d7b                                  ;; 00:3d6f $cd $7b $3d
    ld   A, $1f                                        ;; 00:3d72 $3e $1f
    add  A, L                                          ;; 00:3d74 $85
    ld   L, A                                          ;; 00:3d75 $6f
    pop  BC                                            ;; 00:3d76 $c1
    dec  B                                             ;; 00:3d77 $05
    jr   NZ, .jr_00_3d6e                               ;; 00:3d78 $20 $f4
    ret                                                ;; 00:3d7a $c9

call_00_3d7b:
    ld   A, [HL]                                       ;; 00:3d7b $7e
    inc  A                                             ;; 00:3d7c $3c
    jr   Z, .jr_00_3d90                                ;; 00:3d7d $28 $11
    ld   C, $00                                        ;; 00:3d7f $0e $00
    dec  A                                             ;; 00:3d81 $3d
    jr   Z, .jr_00_3d85                                ;; 00:3d82 $28 $01
    inc  C                                             ;; 00:3d84 $0c
.jr_00_3d85:
    push HL                                            ;; 00:3d85 $e5
    ld   A, $05                                        ;; 00:3d86 $3e $05
    add  A, L                                          ;; 00:3d88 $85
    ld   L, A                                          ;; 00:3d89 $6f
    ld   A, [HL]                                       ;; 00:3d8a $7e
    call call_00_0189                                  ;; 00:3d8b $cd $89 $01
    pop  HL                                            ;; 00:3d8e $e1
    ret                                                ;; 00:3d8f $c9
.jr_00_3d90:
    push HL                                            ;; 00:3d90 $e5
    ld   A, $01                                        ;; 00:3d91 $3e $01
    rst  switchBank                                    ;; 00:3d93 $ef
    ld   HL, $7f80                                     ;; 00:3d94 $21 $80 $7f
    ld   B, $40                                        ;; 00:3d97 $06 $40
    call call_00_00b5                                  ;; 00:3d99 $cd $b5 $00
    pop  HL                                            ;; 00:3d9c $e1
    ret                                                ;; 00:3d9d $c9

call_00_3d9e:
    ld   A, $02                                        ;; 00:3d9e $3e $02
    rst  switchBank                                    ;; 00:3da0 $ef
    ld   A, [wCCC7]                                    ;; 00:3da1 $fa $c7 $cc
    ld   L, A                                          ;; 00:3da4 $6f
    ld   H, $00                                        ;; 00:3da5 $26 $00
    add  HL, HL                                        ;; 00:3da7 $29
    ld   DE, $58d0                                     ;; 00:3da8 $11 $d0 $58
    add  HL, DE                                        ;; 00:3dab $19
    ld   A, [HL]                                       ;; 00:3dac $7e
    inc  HL                                            ;; 00:3dad $23
    ld   H, [HL]                                       ;; 00:3dae $66
    ld   L, A                                          ;; 00:3daf $6f
    inc  HL                                            ;; 00:3db0 $23
    inc  HL                                            ;; 00:3db1 $23
    inc  HL                                            ;; 00:3db2 $23
    inc  HL                                            ;; 00:3db3 $23
    ld   A, [HL]                                       ;; 00:3db4 $7e
    inc  HL                                            ;; 00:3db5 $23
    ld   H, [HL]                                       ;; 00:3db6 $66
    ld   L, A                                          ;; 00:3db7 $6f
    call call_00_153c                                  ;; 00:3db8 $cd $3c $15
    ld   A, [wC5C9]                                    ;; 00:3dbb $fa $c9 $c5
    jp   call_00_2403                                  ;; 00:3dbe $c3 $03 $24

call_00_3dc1:
    ld   A, $02                                        ;; 00:3dc1 $3e $02
    ld   HL, $7e00                                     ;; 00:3dc3 $21 $00 $7e
    ld   DE, $8e00                                     ;; 00:3dc6 $11 $00 $8e
    ld   BC, $200                                      ;; 00:3dc9 $01 $00 $02
    jp   jp_00_0215                                    ;; 00:3dcc $c3 $15 $02

call_00_3dcf:
    xor  A, A                                          ;; 00:3dcf $af
    ld   [wC3A6], A                                    ;; 00:3dd0 $ea $a6 $c3
    ldh  [rBGP], A                                     ;; 00:3dd3 $e0 $47
    ld   [wC3A7], A                                    ;; 00:3dd5 $ea $a7 $c3
    ldh  [rOBP0], A                                    ;; 00:3dd8 $e0 $48
    ld   [wC3A8], A                                    ;; 00:3dda $ea $a8 $c3
    ldh  [rOBP1], A                                    ;; 00:3ddd $e0 $49
    ret                                                ;; 00:3ddf $c9

call_00_3de0:
    ld   A, $e4                                        ;; 00:3de0 $3e $e4
    ld   [wC3A6], A                                    ;; 00:3de2 $ea $a6 $c3
    ldh  [rBGP], A                                     ;; 00:3de5 $e0 $47
    ld   A, $d1                                        ;; 00:3de7 $3e $d1
    ld   [wC3A7], A                                    ;; 00:3de9 $ea $a7 $c3
    ldh  [rOBP0], A                                    ;; 00:3dec $e0 $48
    xor  A, A                                          ;; 00:3dee $af
    ld   [wC3A8], A                                    ;; 00:3def $ea $a8 $c3
    ldh  [rOBP1], A                                    ;; 00:3df2 $e0 $49
    ret                                                ;; 00:3df4 $c9
    db   $21, $00, $c6, $06, $90, $af, $22, $05        ;; 00:3df5 ????????
    db   $20, $fc, $3e, $2f, $e0, $ca, $f0, $43        ;; 00:3dfd ????????
    db   $e0, $c9, $f0, $44, $fe, $90, $38, $fa        ;; 00:3e05 ????????
    db   $f3, $21, $9e, $c3, $11, $c7, $ff, $7e        ;; 00:3e0d ????????
    db   $12, $36, $8d, $23, $1c, $7e, $12, $36        ;; 00:3e15 ????????
    db   $3e, $f0, $41, $e0, $c6, $3e, $c0, $e0        ;; 00:3e1d ????????
    db   $41, $af, $e0, $45, $fb, $3e, $3c, $f5        ;; 00:3e25 ????????
    db   $cb, $37, $e6, $0f, $e0, $cc, $3e, $00        ;; 00:3e2d ????????
    db   $e0, $cb, $26, $12, $f0, $ca, $6f, $11        ;; 00:3e35 ????????
    db   $00, $c6, $06, $90, $4e, $f0, $cc, $b7        ;; 00:3e3d ????????
    db   $28, $05, $cb, $29, $3d, $20, $fb, $f0        ;; 00:3e45 ????????
    db   $c9, $81, $12, $2c, $26, $12, $7e, $fe        ;; 00:3e4d ????????
    db   $80, $20, $02, $2e, $2f, $1c, $05, $20        ;; 00:3e55 ????????
    db   $e3, $cd, $71, $01, $f0, $44, $fe, $90        ;; 00:3e5d ????????
    db   $38, $fa, $f0, $ca, $6f, $26, $12, $2c        ;; 00:3e65 ????????
    db   $7e, $fe, $80, $20, $02, $2e, $2f, $7d        ;; 00:3e6d ????????
    db   $e0, $ca, $f1, $3d, $20, $b1, $f3, $21        ;; 00:3e75 ????????
    db   $c7, $ff, $11, $9e, $c3, $2a, $12, $13        ;; 00:3e7d ????????
    db   $7e, $12, $f0, $c6, $e0, $41, $fb, $c9        ;; 00:3e85 ????????
    db   $f5, $e5, $f0, $44, $fe, $90, $30, $0c        ;; 00:3e8d ????????
    db   $f0, $cb, $6f, $26, $c6, $7e, $e0, $43        ;; 00:3e95 ????????
    db   $2c, $7d, $e0, $cb, $21, $45, $ff, $34        ;; 00:3e9d ????????
    db   $3e, $c0, $e0, $41, $e1, $f1, $d9, $05        ;; 00:3ea5 ????????
    db   $09, $30, $10, $ff, $ff, $ff, $ff, $ff        ;; 00:3ead ????????
    db   $ff, $ff, $48, $10, $ff, $ff, $ff, $ff        ;; 00:3eb5 ????????
    db   $ff, $ff, $ff, $60, $10, $ff, $ff, $ff        ;; 00:3ebd ????????
    db   $ff, $ff, $ff, $ff, $78, $10, $ff, $ff        ;; 00:3ec5 ????????
    db   $ff, $ff, $ff, $ff, $ff, $90, $10, $20        ;; 00:3ecd ????????
    db   $30, $40, $50, $60, $70, $80, $03, $02        ;; 00:3ed5 ????????
    db   $20, $10, $30, $10, $40, $10, $05, $02        ;; 00:3edd ????????
    db   $70, $08, $80, $08, $90, $08, $00, $fe        ;; 00:3ee5 ????????
    db   $00, $fd, $06, $02, $20, $48, $30, $48        ;; 00:3eed ????????
    db   $40, $48, $50, $48, $00, $fe, $00, $fd        ;; 00:3ef5 ????????
    db   $01, $03, $90, $18, $58, $02, $02, $68        ;; 00:3efd ????????
    db   $60, $78, $60, $04, $02, $58, $08, $68        ;; 00:3f05 ????????
    db   $08, $78, $08, $88, $08, $02, $04, $80        ;; 00:3f0d ????????
    db   $10, $40, $68, $90, $10, $ff, $ff, $01        ;; 00:3f15 ????????
    db   $03, $90, $20, $60, $02, $03, $20, $08        ;; 00:3f1d ????????
    db   $50, $50, $08, $50, $08, $02, $20, $40        ;; 00:3f25 ????????
    db   $30, $40, $40, $40, $50, $40, $60, $40        ;; 00:3f2d ????????
    db   $70, $40, $80, $40, $90, $40, $08, $02        ;; 00:3f35 ????????
    db   $20, $28, $30, $28, $40, $28, $50, $28        ;; 00:3f3d ????????
    db   $60, $28, $70, $28, $80, $28, $90, $28        ;; 00:3f45 ????????
    db   $0a, $02, $20, $48, $30, $48, $40, $48        ;; 00:3f4d ????????
    db   $50, $48, $60, $48, $70, $48, $80, $48        ;; 00:3f55 ????????
    db   $90, $48, $00, $fe, $00, $fd, $0a, $02        ;; 00:3f5d ????????
    db   $20, $10, $30, $10, $40, $10, $50, $10        ;; 00:3f65 ????????
    db   $60, $10, $70, $10, $80, $10, $90, $10        ;; 00:3f6d ????????
    db   $00, $fe, $00, $fd, $02, $03, $50, $40        ;; 00:3f75 ????????
    db   $58, $68, $40, $58, $04, $02, $40, $58        ;; 00:3f7d ????????
    db   $50, $58, $60, $58, $70, $58, $05, $02        ;; 00:3f85 ????????
    db   $70, $48, $80, $48, $90, $48, $00, $fe        ;; 00:3f8d ????????
    db   $00, $fd                                      ;; 00:3f95 ??

call_00_3f97:
    ld   C, A                                          ;; 00:3f97 $4f
    ld   A, $02                                        ;; 00:3f98 $3e $02
    rst  switchBank                                    ;; 00:3f9a $ef
    push AF                                            ;; 00:3f9b $f5
    sla  C                                             ;; 00:3f9c $cb $21
    ld   B, $00                                        ;; 00:3f9e $06 $00
    ld   HL, $4820                                     ;; 00:3fa0 $21 $20 $48
    add  HL, BC                                        ;; 00:3fa3 $09
    ld   A, [HL+]                                      ;; 00:3fa4 $2a
    ld   H, [HL]                                       ;; 00:3fa5 $66
    ld   L, A                                          ;; 00:3fa6 $6f
    ld   BC, $2d0                                      ;; 00:3fa7 $01 $d0 $02
.jr_00_3faa:
    ld   A, [HL]                                       ;; 00:3faa $7e
    and  A, $f0                                        ;; 00:3fab $e6 $f0
    swap A                                             ;; 00:3fad $cb $37
    ldh  [C], A                                        ;; 00:3faf $e2
    inc  C                                             ;; 00:3fb0 $0c
    ld   A, [HL+]                                      ;; 00:3fb1 $2a
    and  A, $0f                                        ;; 00:3fb2 $e6 $0f
    ldh  [C], A                                        ;; 00:3fb4 $e2
    inc  C                                             ;; 00:3fb5 $0c
    dec  B                                             ;; 00:3fb6 $05
    jr   NZ, .jr_00_3faa                               ;; 00:3fb7 $20 $f1
    push HL                                            ;; 00:3fb9 $e5
    ld   BC, $4d0                                      ;; 00:3fba $01 $d0 $04
    ld   DE, wD000                                     ;; 00:3fbd $11 $00 $d0
.jr_00_3fc0:
    push BC                                            ;; 00:3fc0 $c5
    ldh  A, [C]                                        ;; 00:3fc1 $f2
    add  A, A                                          ;; 00:3fc2 $87
    add  A, A                                          ;; 00:3fc3 $87
    add  A, $40                                        ;; 00:3fc4 $c6 $40
    ld   H, A                                          ;; 00:3fc6 $67
    ld   L, $00                                        ;; 00:3fc7 $2e $00
    ld   BC, $400                                      ;; 00:3fc9 $01 $00 $04
    ld   A, $01                                        ;; 00:3fcc $3e $01
    call call_00_0207                                  ;; 00:3fce $cd $07 $02
    pop  BC                                            ;; 00:3fd1 $c1
    inc  C                                             ;; 00:3fd2 $0c
    dec  B                                             ;; 00:3fd3 $05
    jr   NZ, .jr_00_3fc0                               ;; 00:3fd4 $20 $ea
    pop  HL                                            ;; 00:3fd6 $e1
    ld   DE, $8800                                     ;; 00:3fd7 $11 $00 $88
    ld   B, $80                                        ;; 00:3fda $06 $80
    call call_00_017a                                  ;; 00:3fdc $cd $7a $01
.jr_00_3fdf:
    push BC                                            ;; 00:3fdf $c5
    ld   A, [HL+]                                      ;; 00:3fe0 $2a
    push HL                                            ;; 00:3fe1 $e5
    ld   BC, wD000                                     ;; 00:3fe2 $01 $00 $d0
    ld   L, A                                          ;; 00:3fe5 $6f
    ld   H, $00                                        ;; 00:3fe6 $26 $00
    add  HL, HL                                        ;; 00:3fe8 $29
    add  HL, HL                                        ;; 00:3fe9 $29
    add  HL, HL                                        ;; 00:3fea $29
    add  HL, HL                                        ;; 00:3feb $29
    add  HL, BC                                        ;; 00:3fec $09
    ld   B, $10                                        ;; 00:3fed $06 $10
    call call_00_008f                                  ;; 00:3fef $cd $8f $00
    pop  HL                                            ;; 00:3ff2 $e1
    pop  BC                                            ;; 00:3ff3 $c1
    dec  B                                             ;; 00:3ff4 $05
    jr   NZ, .jr_00_3fdf                               ;; 00:3ff5 $20 $e8
    call call_00_017d                                  ;; 00:3ff7 $cd $7d $01
    pop  AF                                            ;; 00:3ffa $f1
    rst  switchBank                                    ;; 00:3ffb $ef
    ret                                                ;; 00:3ffc $c9
    db   $77, $4a, $a3                                 ;; 00:3ffd ???
