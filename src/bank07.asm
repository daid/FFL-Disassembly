;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank07", ROMX[$4000], BANK[$07]

initSoundEngine:
    jp   initSoundEngineReal                           ;; 07:4000 $c3 $06 $40

runSoundEngine:
    jp   runSoundEngineReal                            ;; 07:4003 $c3 $30 $40

initSoundEngineReal:
    push AF                                            ;; 07:4006 $f5
    push BC                                            ;; 07:4007 $c5
    push DE                                            ;; 07:4008 $d5
    push HL                                            ;; 07:4009 $e5
    ld   A, $8f                                        ;; 07:400a $3e $8f
    ldh  [rNR52], A                                    ;; 07:400c $e0 $26
    xor  A, A                                          ;; 07:400e $af
    ldh  [rNR10], A                                    ;; 07:400f $e0 $10
    ldh  [rNR12], A                                    ;; 07:4011 $e0 $12
    ldh  [rNR22], A                                    ;; 07:4013 $e0 $17
    ldh  [rNR32], A                                    ;; 07:4015 $e0 $1c
    ldh  [rNR42], A                                    ;; 07:4017 $e0 $21
    ldh  [rNR51], A                                    ;; 07:4019 $e0 $25
    ld_long_store hCurrentMusic, A                     ;; 07:401b $ea $e0 $ff
    ld_long_store hPlayingMusic, A                     ;; 07:401e $ea $e1 $ff
    dec  A                                             ;; 07:4021 $3d
    ld   [wCE00], A                                    ;; 07:4022 $ea $00 $ce
    ld   [wCE20], A                                    ;; 07:4025 $ea $20 $ce
    ld   [wCE40], A                                    ;; 07:4028 $ea $40 $ce
    ldh  [hFFEA], A                                    ;; 07:402b $e0 $ea
    jp   popAll                                        ;; 07:402d $c3 $d7 $44

runSoundEngineReal:
    push AF                                            ;; 07:4030 $f5
    push BC                                            ;; 07:4031 $c5
    push DE                                            ;; 07:4032 $d5
    push HL                                            ;; 07:4033 $e5
    call call_07_6a44                                  ;; 07:4034 $cd $44 $6a
    ldh  A, [hFFEA]                                    ;; 07:4037 $f0 $ea
    ld   E, A                                          ;; 07:4039 $5f
    ld   A, [wCEC2]                                    ;; 07:403a $fa $c2 $ce
    add  A, E                                          ;; 07:403d $83
.jr_07_403e:
    ld   [wCEC2], A                                    ;; 07:403e $ea $c2 $ce
    sub  A, $3c                                        ;; 07:4041 $d6 $3c
    jr   C, .jr_07_404d                                ;; 07:4043 $38 $08
    call call_07_40cd                                  ;; 07:4045 $cd $cd $40
    call call_07_44bc                                  ;; 07:4048 $cd $bc $44
    jr   .jr_07_403e                                   ;; 07:404b $18 $f1
.jr_07_404d:
    call soundEffectPlay                               ;; 07:404d $cd $a8 $6a
    jp   popAll                                        ;; 07:4050 $c3 $d7 $44

call_07_4053:
    ld   A, [HL+]                                      ;; 07:4053 $2a
    ld   [DE], A                                       ;; 07:4054 $12
    inc  DE                                            ;; 07:4055 $13
    ld   A, [HL+]                                      ;; 07:4056 $2a
    ld   [DE], A                                       ;; 07:4057 $12
    ret                                                ;; 07:4058 $c9

musicSongInit:
    ld   A, E                                          ;; 07:4059 $7b
    ldh  [hPlayingMusic], A                            ;; 07:405a $e0 $e1
    push AF                                            ;; 07:405c $f5
    xor  A, A                                          ;; 07:405d $af
    ld   C, $60                                        ;; 07:405e $0e $60
    ld   HL, wCE00                                     ;; 07:4060 $21 $00 $ce
.jr_07_4063:
    ld   [HL+], A                                      ;; 07:4063 $22
    dec  C                                             ;; 07:4064 $0d
    jr   NZ, .jr_07_4063                               ;; 07:4065 $20 $fc
    pop  AF                                            ;; 07:4067 $f1
    ld   E, A                                          ;; 07:4068 $5f
    add  A, A                                          ;; 07:4069 $87
    add  A, E                                          ;; 07:406a $83
    add  A, A                                          ;; 07:406b $87
    ld   E, A                                          ;; 07:406c $5f
    ld   D, $00                                        ;; 07:406d $16 $00
    ld   HL, musicSongChannelPointers                  ;; 07:406f $21 $2f $46
    add  HL, DE                                        ;; 07:4072 $19
    ld   DE, wCE02                                     ;; 07:4073 $11 $02 $ce
    call call_07_4053                                  ;; 07:4076 $cd $53 $40
    ld   DE, wCE22                                     ;; 07:4079 $11 $22 $ce
    call call_07_4053                                  ;; 07:407c $cd $53 $40
    ld   DE, wCE42                                     ;; 07:407f $11 $42 $ce
    call call_07_4053                                  ;; 07:4082 $cd $53 $40
    ld   A, $0f                                        ;; 07:4085 $3e $0f
    ld   [wCE04], A                                    ;; 07:4087 $ea $04 $ce
    ld   [wCE24], A                                    ;; 07:408a $ea $24 $ce
    ld   [wCE44], A                                    ;; 07:408d $ea $44 $ce
    ld   A, $01                                        ;; 07:4090 $3e $01
    ld   [wCE01], A                                    ;; 07:4092 $ea $01 $ce
    ld   [wCE21], A                                    ;; 07:4095 $ea $21 $ce
    ld   [wCE41], A                                    ;; 07:4098 $ea $41 $ce
    ld   [wCE0E], A                                    ;; 07:409b $ea $0e $ce
    ld   [wCE2E], A                                    ;; 07:409e $ea $2e $ce
    ld   [wCE4E], A                                    ;; 07:40a1 $ea $4e $ce
    ld   [wCE14], A                                    ;; 07:40a4 $ea $14 $ce
    ld   [wCE34], A                                    ;; 07:40a7 $ea $34 $ce
    ld   [wCE54], A                                    ;; 07:40aa $ea $54 $ce
    ld   [wCE17], A                                    ;; 07:40ad $ea $17 $ce
    ld   [wCE37], A                                    ;; 07:40b0 $ea $37 $ce
    ld   [wCE57], A                                    ;; 07:40b3 $ea $57 $ce
    sub  A, A                                          ;; 07:40b6 $97
    ld   [wCE00], A                                    ;; 07:40b7 $ea $00 $ce
    ld   [wCE20], A                                    ;; 07:40ba $ea $20 $ce
    ld   [wCE40], A                                    ;; 07:40bd $ea $40 $ce
    ld   A, $8f                                        ;; 07:40c0 $3e $8f
    ldh  [rNR52], A                                    ;; 07:40c2 $e0 $26
    ld   A, $ff                                        ;; 07:40c4 $3e $ff
    ldh  [rNR30], A                                    ;; 07:40c6 $e0 $1a
    ld   A, $77                                        ;; 07:40c8 $3e $77
    ldh  [rNR50], A                                    ;; 07:40ca $e0 $24
    ret                                                ;; 07:40cc $c9

call_07_40cd:
    push AF                                            ;; 07:40cd $f5
    push BC                                            ;; 07:40ce $c5
    push DE                                            ;; 07:40cf $d5
    push HL                                            ;; 07:40d0 $e5
    ldh  A, [hCurrentMusic]                            ;; 07:40d1 $f0 $e0
    ld   E, A                                          ;; 07:40d3 $5f
    ldh  A, [hPlayingMusic]                            ;; 07:40d4 $f0 $e1
    cp   A, E                                          ;; 07:40d6 $bb
    jr   Z, .jr_07_40dc                                ;; 07:40d7 $28 $03
    call musicSongInit                                 ;; 07:40d9 $cd $59 $40
.jr_07_40dc:
    ld   HL, wCE00                                     ;; 07:40dc $21 $00 $ce
    sub  A, A                                          ;; 07:40df $97
    bit  0, [HL]                                       ;; 07:40e0 $cb $46
    jr   NZ, .jr_07_40e6                               ;; 07:40e2 $20 $02
    ldh  [rNR10], A                                    ;; 07:40e4 $e0 $10
.jr_07_40e6:
    call call_07_40fc                                  ;; 07:40e6 $cd $fc $40
    ld   HL, wCE20                                     ;; 07:40e9 $21 $20 $ce
    ld   A, $01                                        ;; 07:40ec $3e $01
    call call_07_40fc                                  ;; 07:40ee $cd $fc $40
    ld   HL, wCE40                                     ;; 07:40f1 $21 $40 $ce
    ld   A, $02                                        ;; 07:40f4 $3e $02
    call call_07_40fc                                  ;; 07:40f6 $cd $fc $40
    jp   popAll                                        ;; 07:40f9 $c3 $d7 $44

call_07_40fc:
    ldh  [hFFE9], A                                    ;; 07:40fc $e0 $e9
    ld   A, L                                          ;; 07:40fe $7d
    ldh  [hFFE7], A                                    ;; 07:40ff $e0 $e7
    ld   A, H                                          ;; 07:4101 $7c
    ldh  [hFFE8], A                                    ;; 07:4102 $e0 $e8
    push HL                                            ;; 07:4104 $e5
    ld   DE, $04                                       ;; 07:4105 $11 $04 $00
    add  HL, DE                                        ;; 07:4108 $19
    ld   A, [HL]                                       ;; 07:4109 $7e
    ldh  [hFFE6], A                                    ;; 07:410a $e0 $e6
    cp   A, $0f                                        ;; 07:410c $fe $0f
    jr   Z, .jr_07_4121                                ;; 07:410e $28 $11
    and  A, $0f                                        ;; 07:4110 $e6 $0f
    ld   B, $00                                        ;; 07:4112 $06 $00
    ld   C, A                                          ;; 07:4114 $4f
    ld   HL, data_07_4403                              ;; 07:4115 $21 $03 $44
    add  HL, BC                                        ;; 07:4118 $09
    ld   A, [HL]                                       ;; 07:4119 $7e
    ld   HL, $01                                       ;; 07:411a $21 $01 $00
    call call_07_45b5                                  ;; 07:411d $cd $b5 $45
    ld   [HL], A                                       ;; 07:4120 $77
.jr_07_4121:
    pop  HL                                            ;; 07:4121 $e1
    bit  7, [HL]                                       ;; 07:4122 $cb $7e
    jr   Z, .jr_07_412e                                ;; 07:4124 $28 $08
    ld   DE, $04                                       ;; 07:4126 $11 $04 $00
    add  HL, DE                                        ;; 07:4129 $19
    ld   A, $0f                                        ;; 07:412a $3e $0f
    ld   [HL], A                                       ;; 07:412c $77
    ret                                                ;; 07:412d $c9
.jr_07_412e:
    call call_07_4134                                  ;; 07:412e $cd $34 $41
    jp   jp_07_418b                                    ;; 07:4131 $c3 $8b $41

call_07_4134:
    ldh  A, [hFFE6]                                    ;; 07:4134 $f0 $e6
    cp   A, $0f                                        ;; 07:4136 $fe $0f
    ret  Z                                             ;; 07:4138 $c8
    cp   A, $d0                                        ;; 07:4139 $fe $d0
    jp   NC, .jp_07_4186                               ;; 07:413b $d2 $86 $41
    cp   A, $c0                                        ;; 07:413e $fe $c0
    jp   NC, .jp_07_417a                               ;; 07:4140 $d2 $7a $41
    srl  A                                             ;; 07:4143 $cb $3f
    srl  A                                             ;; 07:4145 $cb $3f
    srl  A                                             ;; 07:4147 $cb $3f
    and  A, $1e                                        ;; 07:4149 $e6 $1e
    ld   B, $00                                        ;; 07:414b $06 $00
    ld   C, A                                          ;; 07:414d $4f
    ld   HL, $05                                       ;; 07:414e $21 $05 $00
    call call_07_45b5                                  ;; 07:4151 $cd $b5 $45
    ld   A, [HL]                                       ;; 07:4154 $7e
    add  A, A                                          ;; 07:4155 $87
    add  A, A                                          ;; 07:4156 $87
    ld   E, A                                          ;; 07:4157 $5f
    add  A, A                                          ;; 07:4158 $87
    add  A, E                                          ;; 07:4159 $83
    add  A, A                                          ;; 07:415a $87
    ld   E, A                                          ;; 07:415b $5f
    ld   D, $00                                        ;; 07:415c $16 $00
    ld   HL, data_07_4412                              ;; 07:415e $21 $12 $44
    add  HL, BC                                        ;; 07:4161 $09
    call indexPointerTable                             ;; 07:4162 $cd $81 $43
    ld   HL, $09                                       ;; 07:4165 $21 $09 $00
    call call_07_45b5                                  ;; 07:4168 $cd $b5 $45
    ld   [HL], E                                       ;; 07:416b $73
    inc  HL                                            ;; 07:416c $23
    ld   [HL], D                                       ;; 07:416d $72
    ld   HL, $0d                                       ;; 07:416e $21 $0d $00
    call call_07_45b5                                  ;; 07:4171 $cd $b5 $45
    sub  A, A                                          ;; 07:4174 $97
    ld   [HL+], A                                      ;; 07:4175 $22
    ld   A, $01                                        ;; 07:4176 $3e $01
    ld   [HL], A                                       ;; 07:4178 $77
    ret                                                ;; 07:4179 $c9
.jp_07_417a:
    ld   HL, $09                                       ;; 07:417a $21 $09 $00
    call call_07_45b5                                  ;; 07:417d $cd $b5 $45
    ld   [HL], $ff                                     ;; 07:4180 $36 $ff
    inc  HL                                            ;; 07:4182 $23
    ld   [HL], $ff                                     ;; 07:4183 $36 $ff
    ret                                                ;; 07:4185 $c9
.jp_07_4186:
    ld   A, $0f                                        ;; 07:4186 $3e $0f
    ldh  [hFFE6], A                                    ;; 07:4188 $e0 $e6
    ret                                                ;; 07:418a $c9

jp_07_418b:
    ld   HL, $0a                                       ;; 07:418b $21 $0a $00
    call call_07_45b5                                  ;; 07:418e $cd $b5 $45
    ld   A, [HL]                                       ;; 07:4191 $7e
    cp   A, $ff                                        ;; 07:4192 $fe $ff
    jr   NZ, .jr_07_41b2                               ;; 07:4194 $20 $1c
    ldh  A, [hFFE9]                                    ;; 07:4196 $f0 $e9
    ld   L, A                                          ;; 07:4198 $6f
    ld   H, $00                                        ;; 07:4199 $26 $00
    ld   DE, data_07_43fd                              ;; 07:419b $11 $fd $43
    add  HL, DE                                        ;; 07:419e $19
    ld   C, [HL]                                       ;; 07:419f $4e
    ld   A, $08                                        ;; 07:41a0 $3e $08
    ldh  [C], A                                        ;; 07:41a2 $e2
    ldh  A, [hFFE9]                                    ;; 07:41a3 $f0 $e9
    cp   A, $02                                        ;; 07:41a5 $fe $02
    jp   Z, .jp_07_4338                                ;; 07:41a7 $ca $38 $43
    inc  C                                             ;; 07:41aa $0c
    inc  C                                             ;; 07:41ab $0c
    ld   A, $80                                        ;; 07:41ac $3e $80
    ldh  [C], A                                        ;; 07:41ae $e2
    jp   .jp_07_4338                                   ;; 07:41af $c3 $38 $43
.jr_07_41b2:
    ld   HL, $0e                                       ;; 07:41b2 $21 $0e $00
    call call_07_45b5                                  ;; 07:41b5 $cd $b5 $45
    dec  [HL]                                          ;; 07:41b8 $35
    jp   NZ, .jp_07_425c                               ;; 07:41b9 $c2 $5c $42
    push HL                                            ;; 07:41bc $e5
.jr_07_41bd:
    ld   HL, $0c                                       ;; 07:41bd $21 $0c $00
    call call_07_45b5                                  ;; 07:41c0 $cd $b5 $45
    ld   A, [HL]                                       ;; 07:41c3 $7e
    add  A, A                                          ;; 07:41c4 $87
    ld   L, A                                          ;; 07:41c5 $6f
    ld   H, $00                                        ;; 07:41c6 $26 $00
    ld   DE, data_07_6870                              ;; 07:41c8 $11 $70 $68
    call indexPointerTable                             ;; 07:41cb $cd $81 $43
    ld   HL, $0d                                       ;; 07:41ce $21 $0d $00
    call call_07_45b5                                  ;; 07:41d1 $cd $b5 $45
    push HL                                            ;; 07:41d4 $e5
    ld   A, [HL]                                       ;; 07:41d5 $7e
    inc  [HL]                                          ;; 07:41d6 $34
    inc  [HL]                                          ;; 07:41d7 $34
    ld   L, A                                          ;; 07:41d8 $6f
    ld   H, $00                                        ;; 07:41d9 $26 $00
    add  HL, DE                                        ;; 07:41db $19
    ld   A, [HL+]                                      ;; 07:41dc $2a
    pop  BC                                            ;; 07:41dd $c1
    inc  BC                                            ;; 07:41de $03
    ld   [BC], A                                       ;; 07:41df $02
    cp   A, $00                                        ;; 07:41e0 $fe $00
    jr   NZ, .jr_07_41e9                               ;; 07:41e2 $20 $05
    ld   A, [HL]                                       ;; 07:41e4 $7e
    dec  BC                                            ;; 07:41e5 $0b
    ld   [BC], A                                       ;; 07:41e6 $02
    jr   .jr_07_41bd                                   ;; 07:41e7 $18 $d4
.jr_07_41e9:
    ld   A, [HL]                                       ;; 07:41e9 $7e
    pop  HL                                            ;; 07:41ea $e1
    push AF                                            ;; 07:41eb $f5
    and  A, $f0                                        ;; 07:41ec $e6 $f0
    swap A                                             ;; 07:41ee $cb $37
    ld   E, A                                          ;; 07:41f0 $5f
    dec  HL                                            ;; 07:41f1 $2b
    dec  HL                                            ;; 07:41f2 $2b
    dec  HL                                            ;; 07:41f3 $2b
    ld   A, [HL]                                       ;; 07:41f4 $7e
    ld   D, A                                          ;; 07:41f5 $57
    sub  A, A                                          ;; 07:41f6 $97
    bit  0, E                                          ;; 07:41f7 $cb $43
    jr   Z, .jr_07_41fc                                ;; 07:41f9 $28 $01
    add  A, D                                          ;; 07:41fb $82
.jr_07_41fc:
    sla  D                                             ;; 07:41fc $cb $22
    bit  1, E                                          ;; 07:41fe $cb $4b
    jr   Z, .jr_07_4203                                ;; 07:4200 $28 $01
    add  A, D                                          ;; 07:4202 $82
.jr_07_4203:
    sla  D                                             ;; 07:4203 $cb $22
    bit  2, E                                          ;; 07:4205 $cb $53
    jr   Z, .jr_07_420a                                ;; 07:4207 $28 $01
    add  A, D                                          ;; 07:4209 $82
.jr_07_420a:
    sla  D                                             ;; 07:420a $cb $22
    bit  3, E                                          ;; 07:420c $cb $5b
    jr   Z, .jr_07_4211                                ;; 07:420e $28 $01
    add  A, D                                          ;; 07:4210 $82
.jr_07_4211:
    add  A, $10                                        ;; 07:4211 $c6 $10
    ld   HL, $19                                       ;; 07:4213 $21 $19 $00
    call call_07_45b5                                  ;; 07:4216 $cd $b5 $45
    ld   E, A                                          ;; 07:4219 $5f
    ldh  A, [hFFE9]                                    ;; 07:421a $f0 $e9
    cp   A, $02                                        ;; 07:421c $fe $02
    jr   NZ, .jr_07_4231                               ;; 07:421e $20 $11
    ld   A, E                                          ;; 07:4220 $7b
    and  A, $f0                                        ;; 07:4221 $e6 $f0
    swap A                                             ;; 07:4223 $cb $37
    ld   E, A                                          ;; 07:4225 $5f
    ld   D, $00                                        ;; 07:4226 $16 $00
    push HL                                            ;; 07:4228 $e5
    ld   HL, data_07_43ea                              ;; 07:4229 $21 $ea $43
    add  HL, DE                                        ;; 07:422c $19
    ld   A, [HL]                                       ;; 07:422d $7e
    pop  HL                                            ;; 07:422e $e1
    jr   .jr_07_4234                                   ;; 07:422f $18 $03
.jr_07_4231:
    ld   A, E                                          ;; 07:4231 $7b
    and  A, $f0                                        ;; 07:4232 $e6 $f0
.jr_07_4234:
    ld   E, A                                          ;; 07:4234 $5f
    pop  AF                                            ;; 07:4235 $f1
    and  A, $0f                                        ;; 07:4236 $e6 $0f
    or   A, E                                          ;; 07:4238 $b3
    ld   [HL], A                                       ;; 07:4239 $77
    ldh  A, [hFFE9]                                    ;; 07:423a $f0 $e9
    ld   DE, data_07_43fd                              ;; 07:423c $11 $fd $43
    add  A, E                                          ;; 07:423f $83
    jr   NC, .jr_07_4243                               ;; 07:4240 $30 $01
    inc  D                                             ;; 07:4242 $14
.jr_07_4243:
    ld   E, A                                          ;; 07:4243 $5f
    ld   A, [DE]                                       ;; 07:4244 $1a
    ld   C, A                                          ;; 07:4245 $4f
    call call_07_43d9                                  ;; 07:4246 $cd $d9 $43
    jr   NC, .jp_07_425c                               ;; 07:4249 $30 $11
    ld   A, [HL+]                                      ;; 07:424b $2a
    ldh  [C], A                                        ;; 07:424c $e2
    ldh  A, [hFFE9]                                    ;; 07:424d $f0 $e9
    cp   A, $02                                        ;; 07:424f $fe $02
    jr   Z, .jp_07_425c                                ;; 07:4251 $28 $09
    inc  HL                                            ;; 07:4253 $23
    ld   A, [HL]                                       ;; 07:4254 $7e
    or   A, $80                                        ;; 07:4255 $f6 $80
    and  A, $87                                        ;; 07:4257 $e6 $87
    inc  C                                             ;; 07:4259 $0c
    inc  C                                             ;; 07:425a $0c
    ldh  [C], A                                        ;; 07:425b $e2
.jp_07_425c:
    ldh  A, [hFFE6]                                    ;; 07:425c $f0 $e6
    cp   A, $0f                                        ;; 07:425e $fe $0f
    jr   Z, .jr_07_426d                                ;; 07:4260 $28 $0b
    ld   HL, $10                                       ;; 07:4262 $21 $10 $00
    call call_07_45b5                                  ;; 07:4265 $cd $b5 $45
    sub  A, A                                          ;; 07:4268 $97
    ld   [HL+], A                                      ;; 07:4269 $22
    ld   A, $01                                        ;; 07:426a $3e $01
    ld   [HL], A                                       ;; 07:426c $77
.jr_07_426d:
    ld   HL, $11                                       ;; 07:426d $21 $11 $00
    call call_07_45b5                                  ;; 07:4270 $cd $b5 $45
    dec  [HL]                                          ;; 07:4273 $35
    jp   NZ, .jp_07_42df                               ;; 07:4274 $c2 $df $42
    dec  HL                                            ;; 07:4277 $2b
    dec  HL                                            ;; 07:4278 $2b
    ld   A, [HL+]                                      ;; 07:4279 $2a
    push HL                                            ;; 07:427a $e5
    add  A, A                                          ;; 07:427b $87
    ld   E, A                                          ;; 07:427c $5f
    ld   D, $00                                        ;; 07:427d $16 $00
    ld   HL, data_07_68d3                              ;; 07:427f $21 $d3 $68
    call indexPointerTable                             ;; 07:4282 $cd $81 $43
    pop  HL                                            ;; 07:4285 $e1
    push HL                                            ;; 07:4286 $e5
    ld   A, [HL]                                       ;; 07:4287 $7e
    inc  [HL]                                          ;; 07:4288 $34
    inc  [HL]                                          ;; 07:4289 $34
    ld   L, A                                          ;; 07:428a $6f
    ld   H, $00                                        ;; 07:428b $26 $00
    add  HL, DE                                        ;; 07:428d $19
    ld   A, [HL+]                                      ;; 07:428e $2a
    push HL                                            ;; 07:428f $e5
    pop  DE                                            ;; 07:4290 $d1
    cp   A, $00                                        ;; 07:4291 $fe $00
    jr   NZ, .jr_07_429d                               ;; 07:4293 $20 $08
    ld   A, [HL]                                       ;; 07:4295 $7e
    pop  HL                                            ;; 07:4296 $e1
    ld   [HL+], A                                      ;; 07:4297 $22
    ld   A, $01                                        ;; 07:4298 $3e $01
    ld   [HL], A                                       ;; 07:429a $77
    jr   .jr_07_426d                                   ;; 07:429b $18 $d0
.jr_07_429d:
    pop  HL                                            ;; 07:429d $e1
    inc  HL                                            ;; 07:429e $23
    ld   [HL], A                                       ;; 07:429f $77
    ld   HL, $09                                       ;; 07:42a0 $21 $09 $00
    call call_07_45b5                                  ;; 07:42a3 $cd $b5 $45
    ld   C, [HL]                                       ;; 07:42a6 $4e
    inc  HL                                            ;; 07:42a7 $23
    ld   B, [HL]                                       ;; 07:42a8 $46
    ld   A, [DE]                                       ;; 07:42a9 $1a
    bit  7, A                                          ;; 07:42aa $cb $7f
    jr   NZ, .jr_07_42b3                               ;; 07:42ac $20 $05
    ld   L, A                                          ;; 07:42ae $6f
    ld   H, $00                                        ;; 07:42af $26 $00
    jr   .jr_07_42b6                                   ;; 07:42b1 $18 $03
.jr_07_42b3:
    ld   L, A                                          ;; 07:42b3 $6f
    ld   H, $ff                                        ;; 07:42b4 $26 $ff
.jr_07_42b6:
    add  HL, BC                                        ;; 07:42b6 $09
    push HL                                            ;; 07:42b7 $e5
    ldh  A, [hFFE9]                                    ;; 07:42b8 $f0 $e9
    ld   E, A                                          ;; 07:42ba $5f
    ld   D, $00                                        ;; 07:42bb $16 $00
    ld   HL, data_07_43fa                              ;; 07:42bd $21 $fa $43
    add  HL, DE                                        ;; 07:42c0 $19
    ld   A, [HL]                                       ;; 07:42c1 $7e
    ld   C, A                                          ;; 07:42c2 $4f
    ld   HL, $1a                                       ;; 07:42c3 $21 $1a $00
    call call_07_45b5                                  ;; 07:42c6 $cd $b5 $45
    pop  DE                                            ;; 07:42c9 $d1
    call call_07_43d9                                  ;; 07:42ca $cd $d9 $43
    jr   NC, .jp_07_42df                               ;; 07:42cd $30 $10
    ld   A, E                                          ;; 07:42cf $7b
    cp   A, [HL]                                       ;; 07:42d0 $be
    jr   Z, .jr_07_42d5                                ;; 07:42d1 $28 $02
    ld   [HL], A                                       ;; 07:42d3 $77
    ldh  [C], A                                        ;; 07:42d4 $e2
.jr_07_42d5:
    inc  HL                                            ;; 07:42d5 $23
    inc  C                                             ;; 07:42d6 $0c
    ld   A, D                                          ;; 07:42d7 $7a
    and  A, $07                                        ;; 07:42d8 $e6 $07
    cp   A, [HL]                                       ;; 07:42da $be
    jr   Z, .jp_07_42df                                ;; 07:42db $28 $02
    ld   [HL], A                                       ;; 07:42dd $77
    ldh  [C], A                                        ;; 07:42de $e2
.jp_07_42df:
    ldh  A, [hFFE6]                                    ;; 07:42df $f0 $e6
    cp   A, $0f                                        ;; 07:42e1 $fe $0f
    jr   Z, .jr_07_42f0                                ;; 07:42e3 $28 $0b
    ld   HL, $13                                       ;; 07:42e5 $21 $13 $00
    call call_07_45b5                                  ;; 07:42e8 $cd $b5 $45
    sub  A, A                                          ;; 07:42eb $97
    ld   [HL+], A                                      ;; 07:42ec $22
    ld   A, $01                                        ;; 07:42ed $3e $01
    ld   [HL], A                                       ;; 07:42ef $77
.jr_07_42f0:
    ld   HL, $14                                       ;; 07:42f0 $21 $14 $00
    call call_07_45b5                                  ;; 07:42f3 $cd $b5 $45
    dec  [HL]                                          ;; 07:42f6 $35
    jr   NZ, .jp_07_4338                               ;; 07:42f7 $20 $3f
    dec  HL                                            ;; 07:42f9 $2b
    dec  HL                                            ;; 07:42fa $2b
    ld   A, [HL+]                                      ;; 07:42fb $2a
    push HL                                            ;; 07:42fc $e5
    add  A, A                                          ;; 07:42fd $87
    ld   E, A                                          ;; 07:42fe $5f
    ld   D, $00                                        ;; 07:42ff $16 $00
    ld   HL, data_07_69ae                              ;; 07:4301 $21 $ae $69
    call indexPointerTable                             ;; 07:4304 $cd $81 $43
    pop  HL                                            ;; 07:4307 $e1
    push HL                                            ;; 07:4308 $e5
    ld   A, [HL]                                       ;; 07:4309 $7e
    inc  [HL]                                          ;; 07:430a $34
    ld   L, A                                          ;; 07:430b $6f
    ld   H, $00                                        ;; 07:430c $26 $00
    add  HL, DE                                        ;; 07:430e $19
    ld   A, [HL+]                                      ;; 07:430f $2a
    push HL                                            ;; 07:4310 $e5
    pop  DE                                            ;; 07:4311 $d1
    cp   A, $00                                        ;; 07:4312 $fe $00
    jr   NZ, .jr_07_431e                               ;; 07:4314 $20 $08
    ld   A, [HL]                                       ;; 07:4316 $7e
    pop  HL                                            ;; 07:4317 $e1
    ld   [HL+], A                                      ;; 07:4318 $22
    ld   A, $01                                        ;; 07:4319 $3e $01
    ld   [HL], A                                       ;; 07:431b $77
    jr   .jr_07_42f0                                   ;; 07:431c $18 $d2
.jr_07_431e:
    pop  HL                                            ;; 07:431e $e1
    inc  HL                                            ;; 07:431f $23
    ld   B, A                                          ;; 07:4320 $47
    and  A, $3f                                        ;; 07:4321 $e6 $3f
    ld   [HL], A                                       ;; 07:4323 $77
    call call_07_43d9                                  ;; 07:4324 $cd $d9 $43
    jr   NC, .jp_07_4338                               ;; 07:4327 $30 $0f
    ldh  A, [hFFE9]                                    ;; 07:4329 $f0 $e9
    ld   E, A                                          ;; 07:432b $5f
    ld   D, $00                                        ;; 07:432c $16 $00
    ld   HL, data_07_4400                              ;; 07:432e $21 $00 $44
    add  HL, DE                                        ;; 07:4331 $19
    ld   A, [HL]                                       ;; 07:4332 $7e
    ld   C, A                                          ;; 07:4333 $4f
    ld   A, B                                          ;; 07:4334 $78
    and  A, $c0                                        ;; 07:4335 $e6 $c0
    ldh  [C], A                                        ;; 07:4337 $e2
.jp_07_4338:
    ld   HL, $17                                       ;; 07:4338 $21 $17 $00
    call call_07_45b5                                  ;; 07:433b $cd $b5 $45
    dec  [HL]                                          ;; 07:433e $35
    jr   NZ, .jr_07_4375                               ;; 07:433f $20 $34
    dec  HL                                            ;; 07:4341 $2b
    dec  HL                                            ;; 07:4342 $2b
    ld   A, [HL+]                                      ;; 07:4343 $2a
    push HL                                            ;; 07:4344 $e5
    add  A, A                                          ;; 07:4345 $87
    ld   E, A                                          ;; 07:4346 $5f
    ld   D, $00                                        ;; 07:4347 $16 $00
    ld   HL, data_07_692f                              ;; 07:4349 $21 $2f $69
    call indexPointerTable                             ;; 07:434c $cd $81 $43
    pop  HL                                            ;; 07:434f $e1
    push HL                                            ;; 07:4350 $e5
    ld   A, [HL]                                       ;; 07:4351 $7e
    inc  [HL]                                          ;; 07:4352 $34
    ld   L, A                                          ;; 07:4353 $6f
    ld   H, $00                                        ;; 07:4354 $26 $00
    add  HL, DE                                        ;; 07:4356 $19
    ld   A, [HL+]                                      ;; 07:4357 $2a
    push HL                                            ;; 07:4358 $e5
    pop  DE                                            ;; 07:4359 $d1
    cp   A, $00                                        ;; 07:435a $fe $00
    jr   NZ, .jr_07_4366                               ;; 07:435c $20 $08
    ld   A, [HL]                                       ;; 07:435e $7e
    pop  HL                                            ;; 07:435f $e1
    ld   [HL+], A                                      ;; 07:4360 $22
    ld   A, $01                                        ;; 07:4361 $3e $01
    ld   [HL], A                                       ;; 07:4363 $77
    jr   .jp_07_4338                                   ;; 07:4364 $18 $d2
.jr_07_4366:
    pop  HL                                            ;; 07:4366 $e1
    push AF                                            ;; 07:4367 $f5
    inc  HL                                            ;; 07:4368 $23
    and  A, $3f                                        ;; 07:4369 $e6 $3f
    ld   [HL], A                                       ;; 07:436b $77
    pop  AF                                            ;; 07:436c $f1
    ld   DE, $05                                       ;; 07:436d $11 $05 $00
    add  HL, DE                                        ;; 07:4370 $19
    ld   [HL], A                                       ;; 07:4371 $77
    call call_07_4386                                  ;; 07:4372 $cd $86 $43
.jr_07_4375:
    ld   HL, $04                                       ;; 07:4375 $21 $04 $00
    call call_07_45b5                                  ;; 07:4378 $cd $b5 $45
    ld   A, $0f                                        ;; 07:437b $3e $0f
    ld   [HL], A                                       ;; 07:437d $77
    ldh  [hFFE6], A                                    ;; 07:437e $e0 $e6
    ret                                                ;; 07:4380 $c9

indexPointerTable:
    add  HL, DE                                        ;; 07:4381 $19
    ld   E, [HL]                                       ;; 07:4382 $5e
    inc  HL                                            ;; 07:4383 $23
    ld   D, [HL]                                       ;; 07:4384 $56
    ret                                                ;; 07:4385 $c9

call_07_4386:
    ldh  A, [hFFE9]                                    ;; 07:4386 $f0 $e9
    cp   A, $00                                        ;; 07:4388 $fe $00
    jr   Z, .jr_07_4392                                ;; 07:438a $28 $06
    cp   A, $01                                        ;; 07:438c $fe $01
    jr   Z, .jr_07_43ab                                ;; 07:438e $28 $1b
    jr   .jr_07_43be                                   ;; 07:4390 $18 $2c
.jr_07_4392:
    ld   A, [wCE00]                                    ;; 07:4392 $fa $00 $ce
    bit  0, A                                          ;; 07:4395 $cb $47
    ret  NZ                                            ;; 07:4397 $c0
    ld   A, [HL]                                       ;; 07:4398 $7e
    ld   E, A                                          ;; 07:4399 $5f
    sub  A, A                                          ;; 07:439a $97
    bit  7, E                                          ;; 07:439b $cb $7b
    jr   Z, .jr_07_43a1                                ;; 07:439d $28 $02
    or   A, $10                                        ;; 07:439f $f6 $10
.jr_07_43a1:
    bit  6, E                                          ;; 07:43a1 $cb $73
    jr   Z, .jr_07_43a7                                ;; 07:43a3 $28 $02
    or   A, $01                                        ;; 07:43a5 $f6 $01
.jr_07_43a7:
    ld   E, $ee                                        ;; 07:43a7 $1e $ee
    jr   .jr_07_43cf                                   ;; 07:43a9 $18 $24
.jr_07_43ab:
    ld   A, [HL]                                       ;; 07:43ab $7e
    ld   E, A                                          ;; 07:43ac $5f
    sub  A, A                                          ;; 07:43ad $97
    bit  7, E                                          ;; 07:43ae $cb $7b
    jr   Z, .jr_07_43b4                                ;; 07:43b0 $28 $02
    or   A, $20                                        ;; 07:43b2 $f6 $20
.jr_07_43b4:
    bit  6, E                                          ;; 07:43b4 $cb $73
    jr   Z, .jr_07_43ba                                ;; 07:43b6 $28 $02
    or   A, $02                                        ;; 07:43b8 $f6 $02
.jr_07_43ba:
    ld   E, $dd                                        ;; 07:43ba $1e $dd
    jr   .jr_07_43cf                                   ;; 07:43bc $18 $11
.jr_07_43be:
    ld   A, [HL]                                       ;; 07:43be $7e
    ld   E, A                                          ;; 07:43bf $5f
    sub  A, A                                          ;; 07:43c0 $97
    bit  7, E                                          ;; 07:43c1 $cb $7b
    jr   Z, .jr_07_43c7                                ;; 07:43c3 $28 $02
    or   A, $40                                        ;; 07:43c5 $f6 $40
.jr_07_43c7:
    bit  6, E                                          ;; 07:43c7 $cb $73
    jr   Z, .jr_07_43cd                                ;; 07:43c9 $28 $02
    or   A, $04                                        ;; 07:43cb $f6 $04
.jr_07_43cd:
    ld   E, $bb                                        ;; 07:43cd $1e $bb
.jr_07_43cf:
    push DE                                            ;; 07:43cf $d5
    ld   D, A                                          ;; 07:43d0 $57
    ldh  A, [rNR51]                                    ;; 07:43d1 $f0 $25
    and  A, E                                          ;; 07:43d3 $a3
    or   A, D                                          ;; 07:43d4 $b2
    ldh  [rNR51], A                                    ;; 07:43d5 $e0 $25
    pop  DE                                            ;; 07:43d7 $d1
    ret                                                ;; 07:43d8 $c9

call_07_43d9:
    push HL                                            ;; 07:43d9 $e5
    ld   HL, $00                                       ;; 07:43da $21 $00 $00
    call call_07_45b5                                  ;; 07:43dd $cd $b5 $45
    bit  0, [HL]                                       ;; 07:43e0 $cb $46
    jr   NZ, .jr_07_43e7                               ;; 07:43e2 $20 $03
    pop  HL                                            ;; 07:43e4 $e1
    scf                                                ;; 07:43e5 $37
    ret                                                ;; 07:43e6 $c9
.jr_07_43e7:
    pop  HL                                            ;; 07:43e7 $e1
    or   A, A                                          ;; 07:43e8 $b7
    ret                                                ;; 07:43e9 $c9

data_07_43ea:
    db   $00, $00, $00, $60, $60, $60, $60, $40        ;; 07:43ea ????????
    db   $40, $40, $40, $20, $20, $20, $20, $20        ;; 07:43f2 ????????

data_07_43fa:
    db   $13, $18, $1d                                 ;; 07:43fa ???

data_07_43fd:
    db   $12, $17, $1c                                 ;; 07:43fd ???

data_07_4400:
    db   $11, $16, $1b                                 ;; 07:4400 ???

data_07_4403:
    db   $60, $48, $30, $24, $20, $18, $12, $10        ;; 07:4403 ????????
    db   $0c, $09, $08, $06, $04, $03, $02             ;; 07:440b ???????

data_07_4412:
    db   $2c, $00, $9d, $00, $07, $01, $6b, $01        ;; 07:4412 ????????
    db   $c9, $01, $23, $02, $77, $02, $c7, $02        ;; 07:441a ????????
    db   $12, $03, $58, $03, $9b, $03, $da, $03        ;; 07:4422 ????????
    db   $16, $04, $4e, $04, $83, $04, $b5, $04        ;; 07:442a ????????
    db   $e5, $04, $11, $05, $3b, $05, $63, $05        ;; 07:4432 ????????
    db   $89, $05, $ac, $05, $ce, $05, $ed, $05        ;; 07:443a ????????
    db   $0b, $06, $27, $06, $42, $06, $5b, $06        ;; 07:4442 ????????
    db   $72, $06, $89, $06, $9e, $06, $b2, $06        ;; 07:444a ????????
    db   $c4, $06, $d6, $06, $e7, $06, $f7, $06        ;; 07:4452 ????????
    db   $06, $07, $14, $07, $21, $07, $2d, $07        ;; 07:445a ????????
    db   $39, $07, $44, $07, $4f, $07, $59, $07        ;; 07:4462 ????????
    db   $62, $07, $6b, $07, $73, $07, $7b, $07        ;; 07:446a ????????
    db   $83, $07, $8a, $07, $90, $07, $97, $07        ;; 07:4472 ????????
    db   $9d, $07, $a2, $07, $a7, $07, $ac, $07        ;; 07:447a ????????
    db   $b1, $07, $b6, $07, $ba, $07, $be, $07        ;; 07:4482 ????????
    db   $c1, $07, $c5, $07, $c8, $07, $cb, $07        ;; 07:448a ????????
    db   $ce, $07, $d1, $07, $d4, $07, $d6, $07        ;; 07:4492 ????????
    db   $d9, $07, $db, $07, $dd, $07, $df, $07        ;; 07:449a ????????
    db   $e1, $07, $e2, $07, $e4, $07, $e6, $07        ;; 07:44a2 ????????
    db   $e7, $07, $e9, $07, $ea, $07, $eb, $07        ;; 07:44aa ????????
    db   $ec, $07, $ed, $07, $ee, $07, $ef, $07        ;; 07:44b2 ????????
    db   $f0, $07                                      ;; 07:44ba ??

call_07_44bc:
    push AF                                            ;; 07:44bc $f5
    push BC                                            ;; 07:44bd $c5
    push DE                                            ;; 07:44be $d5
    push HL                                            ;; 07:44bf $e5
    ld   HL, wCE00                                     ;; 07:44c0 $21 $00 $ce
    sub  A, A                                          ;; 07:44c3 $97
    call call_07_44dc                                  ;; 07:44c4 $cd $dc $44
    ld   HL, wCE20                                     ;; 07:44c7 $21 $20 $ce
    ld   A, $01                                        ;; 07:44ca $3e $01
    call call_07_44dc                                  ;; 07:44cc $cd $dc $44
    ld   HL, wCE40                                     ;; 07:44cf $21 $40 $ce
    ld   A, $02                                        ;; 07:44d2 $3e $02
    call call_07_44dc                                  ;; 07:44d4 $cd $dc $44

popAll:
    pop  HL                                            ;; 07:44d7 $e1
    pop  DE                                            ;; 07:44d8 $d1
    pop  BC                                            ;; 07:44d9 $c1
    pop  AF                                            ;; 07:44da $f1
    ret                                                ;; 07:44db $c9

call_07_44dc:
    ldh  [hFFE9], A                                    ;; 07:44dc $e0 $e9
    ld   A, L                                          ;; 07:44de $7d
    ldh  [hFFE7], A                                    ;; 07:44df $e0 $e7
    ld   A, H                                          ;; 07:44e1 $7c
    ldh  [hFFE8], A                                    ;; 07:44e2 $e0 $e8
    ld   A, [HL+]                                      ;; 07:44e4 $2a
    bit  7, A                                          ;; 07:44e5 $cb $7f
    ret  NZ                                            ;; 07:44e7 $c0
    dec  [HL]                                          ;; 07:44e8 $35
    ret  NZ                                            ;; 07:44e9 $c0

jp_07_44ea:
    call call_07_45c1                                  ;; 07:44ea $cd $c1 $45
    cp   A, $e0                                        ;; 07:44ed $fe $e0
    jr   NC, .jr_07_44f9                               ;; 07:44ef $30 $08
    ld   HL, $04                                       ;; 07:44f1 $21 $04 $00
    call call_07_45b5                                  ;; 07:44f4 $cd $b5 $45
    ld   [HL], A                                       ;; 07:44f7 $77
    ret                                                ;; 07:44f8 $c9
.jr_07_44f9:
    cp   A, $ff                                        ;; 07:44f9 $fe $ff
    jr   Z, .jr_07_4513                                ;; 07:44fb $28 $16
    cp   A, $f0                                        ;; 07:44fd $fe $f0
    jp   NC, jp_07_45a4                                ;; 07:44ff $d2 $a4 $45
    and  A, $0f                                        ;; 07:4502 $e6 $0f
    jr   NZ, .jr_07_450e                               ;; 07:4504 $20 $08
    call call_07_45c1                                  ;; 07:4506 $cd $c1 $45
    ldh  [hFFEA], A                                    ;; 07:4509 $e0 $ea
    jp   jp_07_44ea                                    ;; 07:450b $c3 $ea $44
.jr_07_450e:
    ld   HL, $0b                                       ;; 07:450e $21 $0b $00
    jr   jr_07_455c                                    ;; 07:4511 $18 $49
.jr_07_4513:
    ld   HL, $00                                       ;; 07:4513 $21 $00 $00
    call call_07_45b5                                  ;; 07:4516 $cd $b5 $45
    set  7, [HL]                                       ;; 07:4519 $cb $fe
    ldh  A, [hFFE9]                                    ;; 07:451b $f0 $e9
    ld   E, A                                          ;; 07:451d $5f
    ld   D, $00                                        ;; 07:451e $16 $00
    ld   HL, data_07_45a0                              ;; 07:4520 $21 $a0 $45
    add  HL, DE                                        ;; 07:4523 $19
    ld   C, [HL]                                       ;; 07:4524 $4e
    sub  A, A                                          ;; 07:4525 $97
    ldh  [C], A                                        ;; 07:4526 $e2
    ret                                                ;; 07:4527 $c9

;@jumptable amount=6
data_07_4528:
    dw   call_07_4546                                  ;; 07:4528 ?? $00
    dw   call_07_4546                                  ;; 07:452a ?? $01
    dw   call_07_4546                                  ;; 07:452c ?? $02
    dw   call_07_4546                                  ;; 07:452e ?? $03
    dw   call_07_4546                                  ;; 07:4530 ?? $04
    dw   call_07_454d                                  ;; 07:4532 ?? $05
    db   $00, $00                                      ;; 07:4534 ??
;@jumptable amount=8
    dw   call_07_4608                                  ;; 07:4536 ?? $00
    dw   call_07_45d8                                  ;; 07:4538 ?? $01
    dw   call_07_4555                                  ;; 07:453a ?? $02
    dw   call_07_4555                                  ;; 07:453c ?? $03
    dw   call_07_4555                                  ;; 07:453e ?? $04
    dw   call_07_4563                                  ;; 07:4540 ?? $05
    dw   call_07_457a                                  ;; 07:4542 ?? $06
    dw   call_07_458e                                  ;; 07:4544 ?? $07

call_07_4546:
    and  A, $0f                                        ;; 07:4546 $e6 $0f
    ld   HL, $05                                       ;; 07:4548 $21 $05 $00
    jr   jr_07_455c                                    ;; 07:454b $18 $0f

call_07_454d:
    call call_07_45c1                                  ;; 07:454d $cd $c1 $45
    ld   HL, $18                                       ;; 07:4550 $21 $18 $00
    jr   jr_07_455c                                    ;; 07:4553 $18 $07

call_07_4555:
    and  A, $0f                                        ;; 07:4555 $e6 $0f
    sub  A, $08                                        ;; 07:4557 $d6 $08
    ld   HL, $06                                       ;; 07:4559 $21 $06 $00

jr_07_455c:
    call call_07_45b5                                  ;; 07:455c $cd $b5 $45
    ld   [HL], A                                       ;; 07:455f $77
    jp   jp_07_44ea                                    ;; 07:4560 $c3 $ea $44

call_07_4563:
    ld   HL, $06                                       ;; 07:4563 $21 $06 $00
    call call_07_45b5                                  ;; 07:4566 $cd $b5 $45
    ld   A, [HL]                                       ;; 07:4569 $7e
    cp   A, $00                                        ;; 07:456a $fe $00
    jr   NZ, .jr_07_4577                               ;; 07:456c $20 $09
    call call_07_45c1                                  ;; 07:456e $cd $c1 $45
    call call_07_45c1                                  ;; 07:4571 $cd $c1 $45
    jp   jp_07_44ea                                    ;; 07:4574 $c3 $ea $44
.jr_07_4577:
    dec  [HL]                                          ;; 07:4577 $35
    jr   call_07_458e                                  ;; 07:4578 $18 $14

call_07_457a:
    ld   HL, $06                                       ;; 07:457a $21 $06 $00
    call call_07_45b5                                  ;; 07:457d $cd $b5 $45
    ld   A, [HL]                                       ;; 07:4580 $7e
    cp   A, $00                                        ;; 07:4581 $fe $00
    jr   Z, call_07_458e                               ;; 07:4583 $28 $09
    call call_07_45c1                                  ;; 07:4585 $cd $c1 $45
    call call_07_45c1                                  ;; 07:4588 $cd $c1 $45
    jp   jp_07_44ea                                    ;; 07:458b $c3 $ea $44

call_07_458e:
    ld   HL, $03                                       ;; 07:458e $21 $03 $00
    call call_07_45b5                                  ;; 07:4591 $cd $b5 $45
    call call_07_45c1                                  ;; 07:4594 $cd $c1 $45
    ld   E, A                                          ;; 07:4597 $5f
    call call_07_45c1                                  ;; 07:4598 $cd $c1 $45
    ld   [HL-], A                                      ;; 07:459b $32
    ld   [HL], E                                       ;; 07:459c $73
    jp   jp_07_44ea                                    ;; 07:459d $c3 $ea $44

data_07_45a0:
    db   $12, $17, $1c, $21                            ;; 07:45a0 ????

jp_07_45a4:
    push AF                                            ;; 07:45a4 $f5
    and  A, $0f                                        ;; 07:45a5 $e6 $0f
    add  A, A                                          ;; 07:45a7 $87
    ld   E, A                                          ;; 07:45a8 $5f
    ld   D, $00                                        ;; 07:45a9 $16 $00
    ld   HL, data_07_4528                              ;; 07:45ab $21 $28 $45
    call indexPointerTable                             ;; 07:45ae $cd $81 $43
    push DE                                            ;; 07:45b1 $d5
    pop  HL                                            ;; 07:45b2 $e1
    pop  AF                                            ;; 07:45b3 $f1
    jp   HL                                            ;; 07:45b4 $e9

call_07_45b5:
    push AF                                            ;; 07:45b5 $f5
    push DE                                            ;; 07:45b6 $d5
    ldh  A, [hFFE7]                                    ;; 07:45b7 $f0 $e7
    ld   E, A                                          ;; 07:45b9 $5f
    ldh  A, [hFFE8]                                    ;; 07:45ba $f0 $e8
    ld   D, A                                          ;; 07:45bc $57
    add  HL, DE                                        ;; 07:45bd $19
    pop  DE                                            ;; 07:45be $d1
    pop  AF                                            ;; 07:45bf $f1
    ret                                                ;; 07:45c0 $c9

call_07_45c1:
    push DE                                            ;; 07:45c1 $d5
    push HL                                            ;; 07:45c2 $e5
    ldh  A, [hFFE7]                                    ;; 07:45c3 $f0 $e7
    ld   L, A                                          ;; 07:45c5 $6f
    ldh  A, [hFFE8]                                    ;; 07:45c6 $f0 $e8
    ld   H, A                                          ;; 07:45c8 $67
    ld   DE, $02                                       ;; 07:45c9 $11 $02 $00
    call indexPointerTable                             ;; 07:45cc $cd $81 $43
    dec  HL                                            ;; 07:45cf $2b
    ld   A, [DE]                                       ;; 07:45d0 $1a
    inc  DE                                            ;; 07:45d1 $13
    ld   [HL], E                                       ;; 07:45d2 $73
    inc  HL                                            ;; 07:45d3 $23
    ld   [HL], D                                       ;; 07:45d4 $72
    pop  HL                                            ;; 07:45d5 $e1
    pop  DE                                            ;; 07:45d6 $d1
    ret                                                ;; 07:45d7 $c9

call_07_45d8:
    xor  A, A                                          ;; 07:45d8 $af
    ldh  [rNR30], A                                    ;; 07:45d9 $e0 $1a
    call call_07_45c1                                  ;; 07:45db $cd $c1 $45
    ld   D, A                                          ;; 07:45de $57
    and  A, $0f                                        ;; 07:45df $e6 $0f
    swap A                                             ;; 07:45e1 $cb $37
    ld   E, A                                          ;; 07:45e3 $5f
    ld   A, D                                          ;; 07:45e4 $7a
    swap A                                             ;; 07:45e5 $cb $37
    and  A, $0f                                        ;; 07:45e7 $e6 $0f
    ld   D, A                                          ;; 07:45e9 $57
    ld   HL, wavePatternsData                          ;; 07:45ea $21 $bd $69
    add  HL, DE                                        ;; 07:45ed $19
    ld   C, $30                                        ;; 07:45ee $0e $30
    ld   B, $10                                        ;; 07:45f0 $06 $10
.loop:
    ld   A, [HL+]                                      ;; 07:45f2 $2a
    ldh  [C], A                                        ;; 07:45f3 $e2
    inc  C                                             ;; 07:45f4 $0c
    dec  B                                             ;; 07:45f5 $05
    jr   NZ, .loop                                     ;; 07:45f6 $20 $fa
    ld   A, $80                                        ;; 07:45f8 $3e $80
    ldh  [rNR30], A                                    ;; 07:45fa $e0 $1a
    ld   A, [wCE5B]                                    ;; 07:45fc $fa $5b $ce
    or   A, $80                                        ;; 07:45ff $f6 $80
    and  A, $87                                        ;; 07:4601 $e6 $87
    ldh  [rNR34], A                                    ;; 07:4603 $e0 $1e
    jp   jp_07_44ea                                    ;; 07:4605 $c3 $ea $44

call_07_4608:
    call call_07_45c1                                  ;; 07:4608 $cd $c1 $45
    ld   B, A                                          ;; 07:460b $47
    rlca                                               ;; 07:460c $07
    rlca                                               ;; 07:460d $07
    and  A, $03                                        ;; 07:460e $e6 $03
    ld   E, A                                          ;; 07:4610 $5f
    ld   D, $00                                        ;; 07:4611 $16 $00
    ld   HL, .data_07_4629                             ;; 07:4613 $21 $29 $46
    add  HL, DE                                        ;; 07:4616 $19
    ld   A, [HL]                                       ;; 07:4617 $7e
    ld   L, A                                          ;; 07:4618 $6f
    ld   H, $00                                        ;; 07:4619 $26 $00
    call call_07_45b5                                  ;; 07:461b $cd $b5 $45
    ld   A, B                                          ;; 07:461e $78
    and  A, $3f                                        ;; 07:461f $e6 $3f
    ld   [HL+], A                                      ;; 07:4621 $22
    sub  A, A                                          ;; 07:4622 $97
    ld   [HL+], A                                      ;; 07:4623 $22
    inc  A                                             ;; 07:4624 $3c
    ld   [HL+], A                                      ;; 07:4625 $22
    jp   jp_07_44ea                                    ;; 07:4626 $c3 $ea $44
.data_07_4629:
    db   $0c, $0f, $12, $15, $c9, $01                  ;; 07:4629 ??????

;@data format=ppp amount=18
musicSongChannelPointers:
    dw   data_07_50ee, data_07_50ee, data_07_50ee      ;; 07:462f ?????? $00
    dw   data_07_475f, data_07_469b, data_07_4837      ;; 07:4635 ?????? $01
    dw   data_07_55ea, data_07_555e, data_07_56ab      ;; 07:463b ?????? $02
    dw   data_07_50ef, data_07_4f49, data_07_52c0      ;; 07:4641 ?????? $03
    dw   data_07_5854, data_07_58f8, data_07_57d8      ;; 07:4647 ?????? $04
    dw   data_07_4a5f, data_07_491d, data_07_4b73      ;; 07:464d ?????? $05
    dw   data_07_59f9, data_07_592a, data_07_5ae9      ;; 07:4653 ?????? $06
    dw   data_07_5c9d, data_07_5c3c, data_07_5d0b      ;; 07:4659 ?????? $07
    dw   data_07_4d91, data_07_4cbb, data_07_4e6e      ;; 07:465f ?????? $08
    dw   data_07_5eac, data_07_5d98, data_07_5e09      ;; 07:4665 ?????? $09
    dw   data_07_5fd2, data_07_5f0d, data_07_609e      ;; 07:466b ?????? $0a
    dw   data_07_6288, data_07_6385, data_07_623d      ;; 07:4671 ?????? $0b
    dw   data_07_6524, data_07_64d7, data_07_656c      ;; 07:4677 ?????? $0c
    dw   data_07_663c, data_07_65b7, data_07_65f8      ;; 07:467d ?????? $0d
    dw   data_07_66e6, data_07_665c, data_07_66b7      ;; 07:4683 ?????? $0e
    dw   data_07_6734, data_07_6710, data_07_6756      ;; 07:4689 ?????? $0f
    dw   data_07_6791, data_07_6773, data_07_67a9      ;; 07:468f ?????? $10
    dw   data_07_6819, data_07_67aa, data_07_683f      ;; 07:4695 ?????? $11

data_07_469b:
    db   $e0, $37, $f7, $02, $f7, $82, $f7, $43        ;; 07:469b ????????
    db   $ed, $f2, $2d, $4d, $5d, $6d, $f7, $c0        ;; 07:46a3 ????????
    db   $f2, $7a, $ca, $7a, $f3, $22, $0a, $2a        ;; 07:46ab ????????
    db   $4a, $25, $f2, $75, $f3, $6a, $ca, $4a        ;; 07:46b3 ????????
    db   $2a, $ca, $1a, $f2, $ba, $ca, $ba, $f3        ;; 07:46bb ????????
    db   $62, $4a, $6a, $7a, $65, $f2, $b5, $f3        ;; 07:46c3 ????????
    db   $9a, $ca, $7a, $6a, $ca, $4a, $2a, $f2        ;; 07:46cb ????????
    db   $ba, $f3, $0a, $22, $f2, $bc, $de, $ce        ;; 07:46d3 ????????
    db   $ba, $f3, $0a, $25, $55, $45, $25, $0a        ;; 07:46db ????????
    db   $f2, $9a, $ba, $f3, $02, $f2, $9c, $de        ;; 07:46e3 ????????
    db   $ce, $9a, $ba, $f3, $05, $35, $25, $05        ;; 07:46eb ????????
    db   $f9, $f2, $b5, $d7, $f3, $0a, $25, $95        ;; 07:46f3 ????????
    db   $21, $2a, $0a, $f2, $ba, $fd, $0e, $47        ;; 07:46fb ????????
    db   $95, $d7, $ba, $f3, $05, $65, $21, $c5        ;; 07:4703 ????????
    db   $fc, $f4, $46, $f3, $05, $d7, $2a, $45        ;; 07:470b ????????
    db   $65, $75, $45, $65, $95, $52, $d7, $ca        ;; 07:4713 ????????
    db   $5a, $4a, $2a, $4a, $ca, $f2, $bc, $cc        ;; 07:471b ????????
    db   $b1, $f3, $32, $d7, $ca, $3a, $2a, $0a        ;; 07:4723 ????????
    db   $2a, $ca, $f2, $9c, $cc, $91, $f3, $22        ;; 07:472b ????????
    db   $d7, $ca, $2a, $0a, $f2, $ba, $f3, $0a        ;; 07:4733 ????????
    db   $ca, $f2, $9c, $cc, $95, $d7, $ca, $9a        ;; 07:473b ????????
    db   $ca, $ba, $f3, $01, $f2, $9a, $ba, $f3        ;; 07:4743 ????????
    db   $0a, $27, $ca, $f7, $0a, $2a, $2a, $2a        ;; 07:474b ????????
    db   $2a, $2a, $2a, $2a, $2a, $2a, $f7, $02        ;; 07:4753 ????????
    db   $20, $fe, $a9, $46                            ;; 07:475b ????

data_07_475f:
    db   $f7, $40, $f7, $02, $f7, $80, $ea, $c8        ;; 07:475f ????????
    db   $f7, $cb, $f1, $ba, $ca, $ba, $f2, $b5        ;; 07:4767 ????????
    db   $9a, $7a, $6a, $4a, $2a, $0a, $f1, $b5        ;; 07:476f ????????
    db   $f2, $25, $f1, $aa, $ba, $f2, $1a, $2a        ;; 07:4777 ????????
    db   $3a, $4a, $2a, $ca, $2a, $f3, $25, $1a        ;; 07:477f ????????
    db   $f2, $ba, $9a, $7a, $6a, $4a, $25, $65        ;; 07:4787 ????????
    db   $4a, $6a, $7a, $9a, $ba, $f3, $0a, $f2        ;; 07:478f ????????
    db   $ba, $7a, $4a, $22, $2a, $7a, $9a, $b5        ;; 07:4797 ????????
    db   $95, $85, $b5, $9a, $4a, $0a, $f1, $92        ;; 07:479f ????????
    db   $9a, $f2, $0a, $4a, $35, $75, $65, $95        ;; 07:47a7 ????????
    db   $f9, $72, $95, $f3, $05, $f2, $b5, $95        ;; 07:47af ????????
    db   $85, $8a, $4a, $2a, $fd, $c9, $47, $05        ;; 07:47b7 ????????
    db   $45, $75, $95, $65, $75, $85, $95, $fc        ;; 07:47bf ????????
    db   $b0, $47, $45, $95, $85, $b5, $f3, $0a        ;; 07:47c7 ????????
    db   $f2, $7a, $4a, $0a, $4a, $0a, $f3, $2a        ;; 07:47cf ????????
    db   $f2, $9a, $6a, $2a, $6a, $2a, $95, $f1        ;; 07:47d7 ????????
    db   $9a, $f2, $2a, $5a, $95, $b5, $9a, $ca        ;; 07:47df ????????
    db   $8c, $cc, $81, $75, $f1, $7a, $f2, $0a        ;; 07:47e7 ????????
    db   $3a, $75, $95, $7a, $ca, $6c, $cc, $61        ;; 07:47ef ????????
    db   $5a, $2a, $5a, $9a, $5a, $9a, $ba, $8a        ;; 07:47f7 ????????
    db   $ba, $8a, $5a, $2a, $4a, $ca, $0c, $cc        ;; 07:47ff ????????
    db   $02, $4a, $ca, $7a, $9a, $7c, $5c, $4a        ;; 07:4807 ????????
    db   $2a, $0a, $f1, $ba, $f2, $5a, $4a, $2a        ;; 07:480f ????????
    db   $0a, $f1, $ba, $9a, $f2, $77, $ca, $f7        ;; 07:4817 ????????
    db   $0a, $7a, $7a, $7a, $7a, $7a, $7a, $7a        ;; 07:481f ????????
    db   $7a, $7a, $f7, $02, $67, $ca, $6c, $cc        ;; 07:4827 ????????
    db   $6c, $cc, $6c, $cc, $62, $fe, $67, $47        ;; 07:482f ????????

data_07_4837:
    db   $f7, $01, $f8, $06, $ef, $c8, $f7, $0b        ;; 07:4837 ????????
    db   $f7, $c0, $f0, $75, $75, $75, $75, $75        ;; 07:483f ????????
    db   $75, $65, $65, $b5, $b5, $b5, $b5, $b5        ;; 07:4847 ????????
    db   $b5, $f1, $05, $05, $f7, $c6, $f7, $01        ;; 07:484f ????????
    db   $f0, $7a, $c7, $f1, $75, $f0, $7a, $ca        ;; 07:4857 ????????
    db   $7a, $f1, $75, $f0, $5a, $c7, $f1, $55        ;; 07:485f ????????
    db   $f0, $5a, $ca, $5a, $f1, $55, $f0, $9a        ;; 07:4867 ????????
    db   $c7, $f1, $45, $f0, $9a, $ca, $9a, $f1        ;; 07:486f ????????
    db   $45, $3a, $ca, $3a, $f0, $95, $f1, $2a        ;; 07:4877 ????????
    db   $ca, $2a, $f0, $95, $f9, $f7, $0b, $f7        ;; 07:487f ????????
    db   $c2, $77, $7a, $77, $7a, $67, $6a, $67        ;; 07:4887 ????????
    db   $6a, $57, $5a, $57, $5a, $47, $4a, $47        ;; 07:488f ????????
    db   $4a, $fd, $ae, $48, $97, $9a, $97, $9a        ;; 07:4897 ????????
    db   $77, $7a, $77, $7a, $27, $2a, $47, $4a        ;; 07:489f ????????
    db   $57, $5a, $67, $6a, $fc, $84, $48, $97        ;; 07:48a7 ????????
    db   $9a, $97, $9a, $87, $8a, $87, $8a, $77        ;; 07:48af ????????
    db   $7a, $77, $7a, $67, $6a, $67, $6a, $f7        ;; 07:48b7 ????????
    db   $01, $f7, $c0, $f2, $25, $f1, $2a, $5a        ;; 07:48bf ????????
    db   $9a, $f2, $25, $55, $45, $f1, $4c, $cc        ;; 07:48c7 ????????
    db   $4c, $cc, $4c, $cc, $f0, $45, $f1, $8a        ;; 07:48cf ????????
    db   $9a, $ba, $f2, $05, $f1, $0a, $3a, $7a        ;; 07:48d7 ????????
    db   $f2, $05, $35, $25, $f1, $2c, $cc, $2c        ;; 07:48df ????????
    db   $cc, $2c, $cc, $f0, $25, $6a, $7a, $9a        ;; 07:48e7 ????????
    db   $b5, $95, $85, $f1, $45, $f0, $95, $f1        ;; 07:48ef ????????
    db   $75, $55, $45, $55, $45, $25, $05, $2a        ;; 07:48f7 ????????
    db   $f0, $9c, $bc, $f1, $0a, $2a, $4a, $6a        ;; 07:48ff ????????
    db   $7a, $9a, $ba, $f2, $0a, $2a, $4a, $27        ;; 07:4907 ????????
    db   $ca, $f1, $2c, $cc, $2c, $cc, $2c, $cc        ;; 07:490f ????????
    db   $25, $f0, $25, $fe, $3d, $48                  ;; 07:4917 ??????

data_07_491d:
    db   $e0, $46, $f7, $02, $f7, $82, $f7, $c4        ;; 07:491d ????????
    db   $f7, $43, $ef, $f9, $f3, $7c, $f4, $7c        ;; 07:4925 ????????
    db   $f3, $7c, $f4, $7c, $f3, $7c, $f4, $7c        ;; 07:492d ????????
    db   $f3, $6c, $f4, $6c, $f3, $6c, $f4, $6c        ;; 07:4935 ????????
    db   $f3, $6c, $f4, $6c, $f3, $5c, $f4, $5c        ;; 07:493d ????????
    db   $f3, $5c, $f4, $5c, $f3, $5c, $f4, $5c        ;; 07:4945 ????????
    db   $f3, $4c, $f4, $4c, $f3, $4c, $f4, $4c        ;; 07:494d ????????
    db   $f3, $4c, $f4, $4c, $f3, $3c, $f4, $3c        ;; 07:4955 ????????
    db   $f3, $3c, $f4, $3c, $f3, $3c, $f4, $3c        ;; 07:495d ????????
    db   $f3, $2c, $f4, $2c, $f3, $2c, $f4, $2c        ;; 07:4965 ????????
    db   $f3, $2c, $f4, $2c, $f3, $1c, $f4, $1c        ;; 07:496d ????????
    db   $f3, $1c, $f4, $1c, $f3, $1c, $f4, $1c        ;; 07:4975 ????????
    db   $f3, $0c, $f4, $0c, $f3, $0c, $f4, $0c        ;; 07:497d ????????
    db   $f3, $0c, $f4, $0c, $fc, $29, $49, $e0        ;; 07:4985 ????????
    db   $45, $f2, $bb, $f3, $0b, $f2, $bb, $f3        ;; 07:498d ????????
    db   $0b, $ed, $e0, $44, $f2, $bb, $f3, $0b        ;; 07:4995 ????????
    db   $f2, $bb, $f3, $0b, $eb, $e0, $43, $f2        ;; 07:499d ????????
    db   $bb, $f3, $0b, $f2, $bb, $f3, $0b, $e0        ;; 07:49a5 ????????
    db   $42, $e9, $f2, $bb, $f3, $0b, $f2, $bb        ;; 07:49ad ????????
    db   $f3, $0b, $e0, $41, $e7, $f2, $bb, $f3        ;; 07:49b5 ????????
    db   $0b, $f2, $bb, $f3, $0b, $e5, $f2, $bb        ;; 07:49bd ????????
    db   $f3, $0b, $f2, $bb, $f3, $0b, $e3, $f2        ;; 07:49c5 ????????
    db   $bb, $f3, $0b, $f2, $bb, $f3, $0b, $f7        ;; 07:49cd ????????
    db   $c0, $ef, $e0, $46, $f2, $4d, $6d, $8d        ;; 07:49d5 ????????
    db   $9d, $bd, $f3, $0d, $2d, $4d, $f9, $f7        ;; 07:49dd ????????
    db   $43, $f7, $c0, $eb, $f2, $95, $f3, $75        ;; 07:49e5 ????????
    db   $68, $45, $08, $75, $68, $48, $d8, $08        ;; 07:49ed ????????
    db   $28, $48, $f2, $95, $f3, $75, $68, $45        ;; 07:49f5 ????????
    db   $08, $75, $68, $48, $d8, $08, $28, $48        ;; 07:49fd ????????
    db   $26, $dc, $ce, $25, $f2, $b5, $f3, $25        ;; 07:4a05 ????????
    db   $02, $f2, $95, $f3, $05, $f2, $b5, $65        ;; 07:4a0d ????????
    db   $f3, $25, $05, $f2, $b5, $d6, $f3, $2d        ;; 07:4a15 ????????
    db   $3d, $45, $d6, $dc, $ce, $fc, $e4, $49        ;; 07:4a1d ????????
    db   $f9, $f7, $82, $f7, $c4, $ef, $f3, $42        ;; 07:4a25 ????????
    db   $65, $75, $65, $45, $c2, $f7, $46, $c5        ;; 07:4a2d ????????
    db   $f4, $45, $65, $75, $65, $45, $c2, $f7        ;; 07:4a35 ????????
    db   $43, $f7, $05, $f7, $80, $f7, $c3, $f3        ;; 07:4a3d ????????
    db   $72, $95, $b5, $95, $75, $c2, $f7, $02        ;; 07:4a45 ????????
    db   $f7, $82, $f7, $46, $c5, $f4, $75, $95        ;; 07:4a4d ????????
    db   $b5, $95, $75, $c2, $fc, $26, $4a, $fe        ;; 07:4a55 ????????
    db   $e3, $49                                      ;; 07:4a5d ??

data_07_4a5f:
    db   $f7, $02, $f7, $82, $f7, $c3, $f7, $46        ;; 07:4a5f ????????
    db   $ea, $f9, $f3, $45, $35, $25, $15, $05        ;; 07:4a67 ????????
    db   $f2, $b5, $a5, $95, $fc, $69, $4a, $f7        ;; 07:4a6f ????????
    db   $43, $ea, $4b, $5b, $4b, $5b, $e8, $4b        ;; 07:4a77 ????????
    db   $5b, $4b, $5b, $e6, $4b, $5b, $4b, $5b        ;; 07:4a7f ????????
    db   $e4, $4b, $5b, $4b, $5b, $e2, $4b, $5b        ;; 07:4a87 ????????
    db   $4b, $5b, $4b, $5b, $4b, $5b, $4b, $5b        ;; 07:4a8f ????????
    db   $4b, $5b, $c5, $f9, $f7, $0a, $f7, $c3        ;; 07:4a97 ????????
    db   $f7, $43, $ea, $f2, $08, $48, $08, $48        ;; 07:4a9f ????????
    db   $28, $68, $28, $68, $48, $78, $48, $78        ;; 07:4aa7 ????????
    db   $68, $98, $68, $98, $08, $48, $08, $48        ;; 07:4aaf ????????
    db   $28, $68, $28, $68, $48, $78, $48, $78        ;; 07:4ab7 ????????
    db   $68, $98, $68, $98, $f7, $02, $f7, $43        ;; 07:4abf ????????
    db   $ea, $b8, $78, $28, $78, $28, $f1, $b8        ;; 07:4ac7 ????????
    db   $f2, $78, $28, $98, $58, $08, $58, $08        ;; 07:4acf ????????
    db   $f1, $98, $f2, $58, $08, $38, $48, $38        ;; 07:4ad7 ????????
    db   $48, $38, $48, $68, $98, $88, $7b, $8b        ;; 07:4adf ????????
    db   $98, $8b, $9b, $a8, $9b, $ab, $bb, $8b        ;; 07:4ae7 ????????
    db   $5b, $2b, $fc, $9b, $4a, $f9, $f7, $c3        ;; 07:4aef ????????
    db   $f7, $43, $ea, $f3, $0b, $f2, $7b, $6b        ;; 07:4af7 ????????
    db   $7b, $f3, $0b, $f2, $7b, $6b, $7b, $f3        ;; 07:4aff ????????
    db   $2b, $f2, $7b, $6b, $7b, $f3, $4b, $f2        ;; 07:4b07 ????????
    db   $7b, $6b, $7b, $f3, $2b, $f2, $7b, $6b        ;; 07:4b0f ????????
    db   $7b, $f3, $0b, $f2, $7b, $6b, $7b, $4b        ;; 07:4b17 ????????
    db   $7b, $2b, $7b, $0b, $7b, $2b, $7b, $f7        ;; 07:4b1f ????????
    db   $46, $ea, $c5, $f4, $05, $25, $45, $25        ;; 07:4b27 ????????
    db   $05, $c2, $f7, $c4, $f7, $43, $ea, $f3        ;; 07:4b2f ????????
    db   $4b, $f2, $bb, $9b, $bb, $f3, $4b, $f2        ;; 07:4b37 ????????
    db   $bb, $9b, $bb, $f3, $6b, $f2, $bb, $9b        ;; 07:4b3f ????????
    db   $bb, $f3, $7b, $f2, $bb, $9b, $bb, $f3        ;; 07:4b47 ????????
    db   $6b, $f2, $bb, $9b, $bb, $f3, $4b, $f2        ;; 07:4b4f ????????
    db   $bb, $9b, $bb, $7b, $bb, $6b, $bb, $4b        ;; 07:4b57 ????????
    db   $bb, $6b, $bb, $f7, $46, $ea, $c5, $f4        ;; 07:4b5f ????????
    db   $45, $65, $75, $65, $45, $c2, $fc, $f5        ;; 07:4b67 ????????
    db   $4a, $fe, $9a, $4a                            ;; 07:4b6f ????

data_07_4b73:
    db   $f7, $01, $f7, $c0, $f8, $06, $ef, $f9        ;; 07:4b73 ????????
    db   $f0, $48, $f1, $48, $f0, $48, $f1, $48        ;; 07:4b7b ????????
    db   $f0, $58, $f1, $58, $f0, $58, $f1, $58        ;; 07:4b83 ????????
    db   $f0, $68, $f1, $68, $f0, $68, $f1, $68        ;; 07:4b8b ????????
    db   $f0, $78, $f1, $78, $f0, $78, $f1, $78        ;; 07:4b93 ????????
    db   $fc, $7b, $4b, $f0, $81, $f1, $45, $b1        ;; 07:4b9b ????????
    db   $f0, $85, $f9, $f7, $0a, $f7, $c4, $f0        ;; 07:4ba3 ????????
    db   $98, $95, $f1, $7b, $9b, $f0, $98, $95        ;; 07:4bab ????????
    db   $f1, $7b, $9b, $f0, $98, $95, $f1, $7b        ;; 07:4bb3 ????????
    db   $9b, $f0, $98, $95, $f1, $7b, $9b, $f0        ;; 07:4bbb ????????
    db   $98, $95, $f1, $7b, $9b, $f0, $98, $95        ;; 07:4bc3 ????????
    db   $f1, $7b, $9b, $f0, $98, $95, $f1, $7b        ;; 07:4bcb ????????
    db   $9b, $f0, $98, $95, $f1, $7b, $9b, $f7        ;; 07:4bd3 ????????
    db   $01, $f0, $78, $f1, $7b, $cb, $f0, $78        ;; 07:4bdb ????????
    db   $f1, $7b, $cb, $f0, $78, $f1, $7b, $cb        ;; 07:4be3 ????????
    db   $f0, $78, $f1, $7b, $cb, $f0, $58, $f1        ;; 07:4beb ????????
    db   $5b, $cb, $f0, $58, $f1, $5b, $cb, $f0        ;; 07:4bf3 ????????
    db   $58, $f1, $5b, $cb, $f0, $58, $f1, $5b        ;; 07:4bfb ????????
    db   $cb, $f0, $b8, $f1, $bb, $cb, $f0, $b8        ;; 07:4c03 ????????
    db   $f1, $bb, $cb, $f0, $b8, $f1, $bb, $cb        ;; 07:4c0b ????????
    db   $f0, $b8, $f1, $bb, $cb, $48, $f2, $4b        ;; 07:4c13 ????????
    db   $cb, $f1, $28, $f2, $2b, $cb, $f1, $08        ;; 07:4c1b ????????
    db   $f2, $0b, $cb, $f0, $b8, $f1, $bb, $cb        ;; 07:4c23 ????????
    db   $fc, $a6, $4b, $f9, $f7, $0a, $f7, $c0        ;; 07:4c2b ????????
    db   $f1, $08, $05, $08, $08, $05, $08, $08        ;; 07:4c33 ????????
    db   $05, $08, $08, $05, $08, $f7, $c7, $0b        ;; 07:4c3b ????????
    db   $7b, $f2, $0b, $f1, $7b, $0b, $7b, $f2        ;; 07:4c43 ????????
    db   $0b, $f1, $7b, $0b, $7b, $f2, $2b, $f1        ;; 07:4c4b ????????
    db   $7b, $0b, $7b, $f2, $4b, $f1, $7b, $0b        ;; 07:4c53 ????????
    db   $7b, $f2, $2b, $f1, $7b, $0b, $7b, $f2        ;; 07:4c5b ????????
    db   $0b, $f1, $7b, $0b, $7b, $f2, $0b, $f1        ;; 07:4c63 ????????
    db   $7b, $0b, $f2, $0b, $f1, $2b, $f2, $2b        ;; 07:4c6b ????????
    db   $f7, $c0, $f1, $48, $45, $48, $48, $45        ;; 07:4c73 ????????
    db   $48, $48, $45, $48, $48, $45, $48, $f7        ;; 07:4c7b ????????
    db   $c7, $4b, $bb, $f2, $4b, $f1, $bb, $4b        ;; 07:4c83 ????????
    db   $bb, $f2, $4b, $f1, $bb, $4b, $bb, $f2        ;; 07:4c8b ????????
    db   $6b, $f1, $bb, $4b, $bb, $f2, $7b, $f1        ;; 07:4c93 ????????
    db   $bb, $4b, $bb, $f2, $6b, $f1, $bb, $4b        ;; 07:4c9b ????????
    db   $bb, $f2, $4b, $f1, $bb, $4b, $bb, $f2        ;; 07:4ca3 ????????
    db   $4b, $f1, $bb, $4b, $f2, $4b, $f1, $2b        ;; 07:4cab ????????
    db   $f2, $2b, $fc, $2f, $4c, $fe, $a5, $4b        ;; 07:4cb3 ????????

data_07_4cbb:
    db   $e0, $41, $f7, $05, $f7, $80, $f7, $43        ;; 07:4cbb ????????
    db   $f7, $c0, $ef, $f2, $5e, $6e, $7e, $db        ;; 07:4cc3 ????????
    db   $d3, $ae, $be, $f3, $0e, $db, $d3, $f2        ;; 07:4ccb ????????
    db   $8e, $9e, $ae, $db, $d3, $ae, $be, $f3        ;; 07:4cd3 ????????
    db   $0e, $db, $d3, $f2, $7e, $8e, $9e, $db        ;; 07:4cdb ????????
    db   $d3, $d2, $f7, $41, $f7, $82, $f7, $c4        ;; 07:4ce3 ????????
    db   $f4, $95, $05, $35, $f3, $65, $f7, $43        ;; 07:4ceb ????????
    db   $f7, $80, $f7, $c0, $f2, $6e, $7e, $8e        ;; 07:4cf3 ????????
    db   $db, $d3, $be, $f3, $0e, $1e, $db, $d3        ;; 07:4cfb ????????
    db   $f2, $ae, $be, $f3, $0e, $db, $d3, $f2        ;; 07:4d03 ????????
    db   $be, $f3, $0e, $1e, $db, $d3, $f2, $9e        ;; 07:4d0b ????????
    db   $ae, $be, $db, $d3, $d2, $f7, $c4, $f7        ;; 07:4d13 ????????
    db   $82, $f7, $41, $f4, $b5, $25, $55, $f3        ;; 07:4d1b ????????
    db   $85, $f9, $f7, $c3, $f7, $02, $f7, $43        ;; 07:4d23 ????????
    db   $ed, $f3, $05, $35, $78, $65, $08, $38        ;; 07:4d2b ????????
    db   $08, $a8, $9c, $8c, $7c, $68, $28, $68        ;; 07:4d33 ????????
    db   $98, $f4, $03, $f3, $a8, $d2, $fd, $4a        ;; 07:4d3b ????????
    db   $4d, $93, $88, $d2, $fc, $25, $4d, $93        ;; 07:4d43 ????????
    db   $88, $d5, $f7, $c0, $ef, $1b, $2b, $3b        ;; 07:4d4b ????????
    db   $4b, $53, $25, $f2, $ab, $f3, $2b, $5b        ;; 07:4d53 ????????
    db   $8b, $7b, $5b, $73, $83, $a5, $53, $25        ;; 07:4d5b ????????
    db   $f2, $ab, $f3, $2b, $5b, $8b, $7b, $5b        ;; 07:4d63 ????????
    db   $73, $38, $d2, $73, $45, $0b, $4b, $7b        ;; 07:4d6b ????????
    db   $ab, $8b, $7b, $83, $a3, $f4, $05, $f3        ;; 07:4d73 ????????
    db   $93, $65, $2b, $6b, $9b, $f4, $0b, $f3        ;; 07:4d7b ????????
    db   $bb, $9b, $b8, $78, $c8, $58, $c8, $28        ;; 07:4d83 ????????
    db   $c8, $f2, $b8, $fe, $bd, $4c                  ;; 07:4d8b ??????

data_07_4d91:
    db   $f7, $82, $e6, $fb, $f7, $0a, $f7, $40        ;; 07:4d91 ????????
    db   $f7, $c2, $f2, $38, $08, $38, $08, $fc        ;; 07:4d99 ????????
    db   $95, $4d, $f7, $c3, $f7, $02, $60, $f7        ;; 07:4da1 ????????
    db   $41, $f4, $65, $f3, $95, $f4, $05, $f3        ;; 07:4da9 ????????
    db   $35, $fb, $f7, $0a, $f7, $40, $f7, $c2        ;; 07:4db1 ????????
    db   $f2, $58, $18, $58, $18, $fc, $b3, $4d        ;; 07:4db9 ????????
    db   $f7, $c3, $f7, $02, $80, $f7, $41, $f4        ;; 07:4dc1 ????????
    db   $85, $f3, $b5, $f4, $25, $f3, $55, $f9        ;; 07:4dc9 ????????
    db   $f7, $c4, $f7, $0a, $f7, $40, $f2, $38        ;; 07:4dd1 ????????
    db   $08, $78, $08, $a8, $98, $28, $68, $f7        ;; 07:4dd9 ????????
    db   $02, $78, $38, $f3, $38, $0c, $f2, $bc        ;; 07:4de1 ????????
    db   $ac, $98, $68, $98, $f3, $08, $78, $38        ;; 07:4de9 ????????
    db   $08, $38, $f2, $a8, $78, $a8, $f3, $38        ;; 07:4df1 ????????
    db   $28, $f2, $98, $68, $f3, $18, $f2, $88        ;; 07:4df9 ????????
    db   $58, $88, $58, $fc, $d1, $4d, $f9, $f7        ;; 07:4e01 ????????
    db   $c1, $ab, $5b, $2b, $5b, $8b, $5b, $2b        ;; 07:4e09 ????????
    db   $5b, $7b, $5b, $2b, $5b, $8b, $5b, $2b        ;; 07:4e11 ????????
    db   $5b, $f7, $c4, $a8, $38, $28, $88, $38        ;; 07:4e19 ????????
    db   $28, $78, $38, $fc, $08, $4e, $f7, $c1        ;; 07:4e21 ????????
    db   $f3, $0b, $f2, $7b, $4b, $7b, $ab, $7b        ;; 07:4e29 ????????
    db   $4b, $7b, $8b, $7b, $4b, $7b, $ab, $7b        ;; 07:4e31 ????????
    db   $4b, $7b, $f7, $c4, $f3, $08, $f2, $58        ;; 07:4e39 ????????
    db   $38, $a8, $58, $38, $88, $58, $f7, $c1        ;; 07:4e41 ????????
    db   $f3, $2b, $f2, $9b, $6b, $9b, $f3, $0b        ;; 07:4e49 ????????
    db   $f2, $9b, $6b, $9b, $bb, $9b, $6b, $9b        ;; 07:4e51 ????????
    db   $f3, $0b, $f2, $9b, $6b, $9b, $f7, $c4        ;; 07:4e59 ????????
    db   $f3, $28, $f2, $b8, $c8, $78, $c8, $58        ;; 07:4e61 ????????
    db   $c8, $28, $fe, $94, $4d                       ;; 07:4e69 ?????

data_07_4e6e:
    db   $f8, $06, $f7, $40, $ef, $fb, $f7, $0a        ;; 07:4e6e ????????
    db   $f7, $c0, $f1, $08, $08, $08, $fc, $74        ;; 07:4e76 ????????
    db   $4e, $f7, $01, $08, $38, $78, $a8, $f7        ;; 07:4e7e ????????
    db   $0a, $f7, $c4, $08, $05, $08, $0b, $2b        ;; 07:4e86 ????????
    db   $3b, $2b, $05, $f7, $c0, $08, $05, $08        ;; 07:4e8e ????????
    db   $0b, $2b, $3b, $2b, $05, $fb, $18, $18        ;; 07:4e96 ????????
    db   $18, $fc, $9c, $4e, $f7, $01, $18, $58        ;; 07:4e9e ????????
    db   $88, $f2, $18, $f7, $c4, $f7, $0a, $f1        ;; 07:4ea6 ????????
    db   $28, $25, $28, $2b, $4b, $5b, $4b, $25        ;; 07:4eae ????????
    db   $f7, $c0, $28, $25, $28, $2b, $4b, $5b        ;; 07:4eb6 ????????
    db   $4b, $25, $f9, $f7, $0a, $08, $05, $78        ;; 07:4ebe ????????
    db   $28, $25, $98, $38, $35, $a8, $28, $25        ;; 07:4ec6 ????????
    db   $98, $f7, $01, $08, $7b, $cb, $08, $36        ;; 07:4ece ????????
    db   $cb, $3b, $cb, $ab, $cb, $38, $28, $9b        ;; 07:4ed6 ????????
    db   $cb, $28, $16, $cb, $1b, $cb, $8b, $cb        ;; 07:4ede ????????
    db   $18, $fc, $c1, $4e, $f9, $f7, $cc, $f0        ;; 07:4ee6 ????????
    db   $a8, $f1, $ab, $cb, $f0, $a8, $f1, $ab        ;; 07:4eee ????????
    db   $cb, $f0, $a8, $f1, $ab, $cb, $f0, $a8        ;; 07:4ef6 ????????
    db   $f1, $ab, $cb, $f7, $c0, $35, $a8, $55        ;; 07:4efe ????????
    db   $a8, $78, $a8, $fc, $eb, $4e, $f7, $cc        ;; 07:4f06 ????????
    db   $08, $f2, $0b, $cb, $f1, $08, $f2, $0b        ;; 07:4f0e ????????
    db   $cb, $f1, $08, $f2, $0b, $cb, $f1, $08        ;; 07:4f16 ????????
    db   $f2, $0b, $cb, $f7, $c0, $f1, $55, $f2        ;; 07:4f1e ????????
    db   $08, $f1, $75, $f2, $08, $f1, $88, $f2        ;; 07:4f26 ????????
    db   $08, $f7, $cc, $f1, $28, $9b, $cb, $28        ;; 07:4f2e ????????
    db   $9b, $cb, $28, $9b, $cb, $28, $9b, $cb        ;; 07:4f36 ????????
    db   $f7, $c0, $78, $f0, $75, $95, $a5, $b8        ;; 07:4f3e ????????
    db   $fe, $73, $4e                                 ;; 07:4f46 ???

data_07_4f49:
    db   $e8, $f7, $09, $f7, $81, $f7, $c0, $f7        ;; 07:4f49 ????????
    db   $40, $e0, $3e, $fb, $f4, $2b, $c8, $cd        ;; 07:4f51 ????????
    db   $4d, $f3, $bb, $c6, $f4, $2b, $f3, $bd        ;; 07:4f59 ????????
    db   $cd, $c8, $f4, $6b, $c8, $4b, $fc, $55        ;; 07:4f61 ????????
    db   $4f, $f9, $f7, $02, $f7, $82, $f7, $c3        ;; 07:4f69 ????????
    db   $f7, $43, $ed, $f3, $61, $25, $42, $15        ;; 07:4f71 ????????
    db   $f2, $b8, $98, $fd, $87, $4f, $b0, $d2        ;; 07:4f79 ????????
    db   $f3, $15, $25, $fc, $6b, $4f, $e0, $35        ;; 07:4f81 ????????
    db   $f2, $b0, $c0, $f9, $f7, $02, $f7, $82        ;; 07:4f89 ????????
    db   $f7, $c0, $f7, $43, $ed, $f2, $ba, $ca        ;; 07:4f91 ????????
    db   $ba, $f3, $62, $4a, $6a, $8a, $65, $f2        ;; 07:4f99 ????????
    db   $b5, $f3, $aa, $ca, $8a, $6a, $ca, $5a        ;; 07:4fa1 ????????
    db   $3a, $ca, $3a, $a2, $8a, $aa, $ba, $a5        ;; 07:4fa9 ????????
    db   $35, $f4, $1a, $ca, $f3, $ba, $aa, $ca        ;; 07:4fb1 ????????
    db   $8a, $6a, $3a, $4a, $65, $d7, $3c, $4c        ;; 07:4fb9 ????????
    db   $6a, $ca, $ba, $61, $45, $3a, $f2, $ba        ;; 07:4fc1 ????????
    db   $f3, $1a, $35, $d7, $f2, $bc, $f3, $1c        ;; 07:4fc9 ????????
    db   $3a, $ca, $8a, $31, $15, $fd, $09, $50        ;; 07:4fd1 ????????
    db   $f2, $ba, $ca, $ba, $f3, $b2, $8c, $cc        ;; 07:4fd9 ????????
    db   $8a, $aa, $b2, $f4, $15, $f3, $b5, $aa        ;; 07:4fe1 ????????
    db   $6a, $8a, $a2, $6c, $cc, $6a, $8a, $a2        ;; 07:4fe9 ????????
    db   $b5, $a5, $8a, $4a, $6a, $82, $4c, $cc        ;; 07:4ff1 ????????
    db   $4a, $6a, $82, $a5, $b5, $a2, $d7, $8a        ;; 07:4ff9 ????????
    db   $a7, $ba, $f4, $11, $c5, $fc, $8d, $4f        ;; 07:5001 ????????
    db   $f2, $ba, $ca, $ba, $f3, $b2, $8c, $cc        ;; 07:5009 ????????
    db   $8a, $aa, $e0, $32, $b2, $e0, $30, $f4        ;; 07:5011 ????????
    db   $15, $f3, $95, $f7, $05, $f7, $80, $f7        ;; 07:5019 ????????
    db   $c3, $f7, $43, $ef, $e0, $2f, $b2, $62        ;; 07:5021 ????????
    db   $42, $32, $12, $e0, $2d, $f2, $b2, $e0        ;; 07:5029 ????????
    db   $28, $a2, $e0, $23, $82, $e0, $2b, $b8        ;; 07:5031 ????????
    db   $f3, $68, $78, $98, $b2, $d3, $c8, $b8        ;; 07:5039 ????????
    db   $98, $f4, $28, $f3, $b8, $70, $c2, $68        ;; 07:5041 ????????
    db   $48, $98, $28, $02, $d8, $f2, $b8, $f3        ;; 07:5049 ????????
    db   $08, $78, $65, $42, $25, $40, $d5, $c1        ;; 07:5051 ????????
    db   $f9, $f7, $02, $f7, $81, $f7, $c3, $f7        ;; 07:5059 ????????
    db   $40, $e3, $f3, $8b, $9b, $e4, $8b, $9b        ;; 07:5061 ????????
    db   $e5, $8b, $9b, $e7, $8b, $9b, $e9, $8b        ;; 07:5069 ????????
    db   $9b, $eb, $8b, $9b, $ed, $8b, $9b, $ef        ;; 07:5071 ????????
    db   $8b, $9b, $fc, $5a, $50, $f9, $e3, $f3        ;; 07:5079 ????????
    db   $bb, $f4, $0b, $e4, $f3, $bb, $f4, $0b        ;; 07:5081 ????????
    db   $e5, $f3, $bb, $f4, $0b, $e7, $f3, $bb        ;; 07:5089 ????????
    db   $f4, $0b, $e9, $f3, $bb, $f4, $0b, $eb        ;; 07:5091 ????????
    db   $f3, $bb, $f4, $0b, $ed, $f3, $bb, $f4        ;; 07:5099 ????????
    db   $0b, $ef, $f3, $bb, $f4, $0b, $fc, $7f        ;; 07:50a1 ????????
    db   $50, $f7, $05, $f7, $82, $f7, $c0, $f7        ;; 07:50a9 ????????
    db   $43, $ef, $f2, $99, $cd, $98, $f3, $42        ;; 07:50b1 ????????
    db   $3b, $4b, $68, $45, $f2, $95, $f3, $88        ;; 07:50b9 ????????
    db   $68, $48, $38, $19, $cd, $18, $82, $6b        ;; 07:50c1 ????????
    db   $8b, $98, $85, $15, $b8, $98, $88, $68        ;; 07:50c9 ????????
    db   $f9, $80, $d5, $c5, $68, $48, $28, $18        ;; 07:50d1 ????????
    db   $f2, $b2, $f3, $b2, $d2, $25, $65, $fc        ;; 07:50d9 ????????
    db   $d2, $50, $fa, $80, $d5, $c5, $25, $65        ;; 07:50e1 ????????
    db   $fc, $e4, $50, $80, $d5                       ;; 07:50e9 ?????

data_07_50ee:
    db   $ff                                           ;; 07:50ee ?

data_07_50ef:
    db   $f7, $09, $f7, $81, $f7, $c0, $f7, $40        ;; 07:50ef ????????
    db   $e8, $fb, $f3, $7b, $cb, $9b, $c6, $7b        ;; 07:50f7 ????????
    db   $c6, $9b, $c6, $9b, $cb, $fc, $f9, $50        ;; 07:50ff ????????
    db   $f9, $f7, $07, $f7, $82, $f7, $c4, $f7        ;; 07:5107 ????????
    db   $43, $ea, $f2, $b2, $75, $b5, $f3, $15        ;; 07:510f ????????
    db   $f2, $95, $45, $75, $fd, $2c, $51, $62        ;; 07:5117 ????????
    db   $d8, $58, $48, $38, $25, $38, $c8, $65        ;; 07:511f ????????
    db   $98, $c8, $fc, $08, $51, $37, $ca, $3c        ;; 07:5127 ????????
    db   $cc, $3c, $cc, $3c, $cc, $37, $ca, $3c        ;; 07:512f ????????
    db   $cc, $3c, $cc, $3c, $cc, $37, $ca, $3c        ;; 07:5137 ????????
    db   $cc, $3c, $cc, $3c, $cc, $3a, $ca, $3a        ;; 07:513f ????????
    db   $ca, $3a, $ca, $f9, $f7, $07, $f7, $82        ;; 07:5147 ????????
    db   $f7, $c3, $f7, $43, $ea, $3a, $ca, $3a        ;; 07:514f ????????
    db   $f3, $32, $f2, $8a, $aa, $ba, $f3, $35        ;; 07:5157 ????????
    db   $f2, $35, $2a, $3a, $5a, $6a, $8a, $aa        ;; 07:515f ????????
    db   $6a, $ca, $6a, $f3, $62, $5a, $6a, $8a        ;; 07:5167 ????????
    db   $65, $f2, $65, $8a, $aa, $ba, $f3, $1a        ;; 07:516f ????????
    db   $3a, $4a, $3a, $f2, $ba, $8a, $61, $17        ;; 07:5177 ????????
    db   $ca, $1c, $cc, $1c, $cc, $1a, $45, $95        ;; 07:517f ????????
    db   $ba, $8a, $3a, $f1, $b1, $a7, $ca, $ac        ;; 07:5187 ????????
    db   $cc, $ac, $cc, $aa, $f2, $15, $45, $fd        ;; 07:518f ????????
    db   $da, $51, $8a, $ca, $8c, $cc, $85, $d7        ;; 07:5197 ????????
    db   $ca, $8c, $cc, $8a, $6a, $52, $85, $55        ;; 07:519f ????????
    db   $f3, $1a, $f2, $aa, $ba, $f3, $12, $f2        ;; 07:51a7 ????????
    db   $ac, $cc, $aa, $8a, $62, $85, $a5, $bc        ;; 07:51af ????????
    db   $cc, $bc, $cc, $bc, $cc, $b5, $d7, $ca        ;; 07:51b7 ????????
    db   $ba, $8a, $4a, $15, $55, $85, $55, $67        ;; 07:51bf ????????
    db   $ca, $6c, $cc, $6c, $cc, $6a, $82, $97        ;; 07:51c7 ????????
    db   $ca, $9c, $cc, $9c, $cc, $9a, $a5, $65        ;; 07:51cf ????????
    db   $fc, $4b, $51, $87, $ca, $8c, $cc, $8c        ;; 07:51d7 ????????
    db   $cc, $8c, $cc, $85, $c5, $22, $42, $f7        ;; 07:51df ????????
    db   $05, $f7, $80, $f7, $c4, $f7, $44, $ec        ;; 07:51e7 ????????
    db   $cb, $f3, $b2, $62, $42, $32, $12, $e0        ;; 07:51ef ????????
    db   $2d, $f2, $b2, $e0, $28, $a2, $e0, $23        ;; 07:51f7 ????????
    db   $82, $e0, $2b, $b8, $f3, $68, $78, $98        ;; 07:51ff ????????
    db   $b2, $d3, $c8, $b8, $98, $f4, $28, $f3        ;; 07:5207 ????????
    db   $b8, $70, $c2, $68, $48, $98, $28, $02        ;; 07:520f ????????
    db   $d8, $f2, $b8, $f3, $08, $78, $65, $42        ;; 07:5217 ????????
    db   $25, $40, $d5, $c2, $c8, $cb, $fb, $f7        ;; 07:521f ????????
    db   $02, $f7, $81, $f7, $c4, $f7, $40, $e3        ;; 07:5227 ????????
    db   $4b, $6b, $e4, $4b, $6b, $e5, $4b, $6b        ;; 07:522f ????????
    db   $e7, $4b, $6b, $e9, $4b, $6b, $eb, $4b        ;; 07:5237 ????????
    db   $6b, $ed, $4b, $6b, $ef, $4b, $6b, $fc        ;; 07:523f ????????
    db   $26, $52, $f7, $05, $f7, $80, $f7, $c4        ;; 07:5247 ????????
    db   $f7, $43, $ea, $48, $28, $12, $6b, $8b        ;; 07:524f ????????
    db   $98, $f3, $15, $f2, $45, $38, $48, $68        ;; 07:5257 ????????
    db   $88, $88, $68, $42, $3b, $4b, $68, $45        ;; 07:525f ????????
    db   $85, $68, $68, $88, $98, $f9, $b2, $f3        ;; 07:5267 ????????
    db   $45, $f2, $b5, $85, $b5, $f3, $28, $18        ;; 07:526f ????????
    db   $f2, $b8, $98, $f1, $6a, $f2, $2a, $6a        ;; 07:5277 ????????
    db   $ba, $6a, $2a, $f3, $2a, $f2, $ba, $6a        ;; 07:527f ????????
    db   $f3, $6a, $2a, $f2, $ba, $f1, $6a, $f2        ;; 07:5287 ????????
    db   $2a, $6a, $ba, $6a, $2a, $f3, $2a, $f2        ;; 07:528f ????????
    db   $ba, $6a, $f3, $6a, $2a, $f2, $ba, $fc        ;; 07:5297 ????????
    db   $6d, $52, $fa, $f3, $48, $f2, $b8, $98        ;; 07:529f ????????
    db   $88, $f3, $48, $f2, $b8, $98, $88, $f3        ;; 07:52a7 ????????
    db   $48, $f2, $b8, $98, $88, $f3, $28, $f2        ;; 07:52af ????????
    db   $68, $98, $68, $fc, $a2, $52, $80, $d5        ;; 07:52b7 ????????
    db   $ff                                           ;; 07:52bf ?

data_07_52c0:
    db   $f7, $01, $f8, $06, $f7, $c0, $ef, $f9        ;; 07:52c0 ????????
    db   $c0, $fc, $c8, $52, $f9, $f1, $28, $c8        ;; 07:52c8 ????????
    db   $28, $c8, $28, $c8, $28, $c8, $fc, $cd        ;; 07:52d0 ????????
    db   $52, $f9, $f0, $78, $f1, $7b, $cb, $f0        ;; 07:52d8 ????????
    db   $78, $f1, $7b, $cb, $f0, $78, $f1, $7b        ;; 07:52e0 ????????
    db   $cb, $f0, $78, $f1, $7b, $cb, $f0, $98        ;; 07:52e8 ????????
    db   $f1, $9b, $cb, $f0, $98, $f1, $9b, $cb        ;; 07:52f0 ????????
    db   $f0, $98, $f1, $9b, $cb, $f0, $98, $f1        ;; 07:52f8 ????????
    db   $9b, $cb, $fd, $30, $53, $f0, $b8, $f1        ;; 07:5300 ????????
    db   $bb, $cb, $f0, $b8, $f1, $bb, $cb, $f0        ;; 07:5308 ????????
    db   $b8, $f1, $bb, $cb, $f0, $b8, $f1, $bb        ;; 07:5310 ????????
    db   $cb, $f0, $b8, $f1, $bb, $cb, $f0, $b8        ;; 07:5318 ????????
    db   $f1, $bb, $cb, $f0, $b8, $f1, $bb, $cb        ;; 07:5320 ????????
    db   $f0, $98, $f1, $9b, $cb, $fc, $da, $52        ;; 07:5328 ????????
    db   $f7, $0b, $f0, $b5, $b5, $b5, $b5, $b5        ;; 07:5330 ????????
    db   $b5, $b7, $b7, $b7, $f9, $f7, $0b, $f7        ;; 07:5338 ????????
    db   $c4, $f0, $b5, $b5, $b5, $b5, $b5, $b5        ;; 07:5340 ????????
    db   $a5, $a5, $f1, $35, $35, $35, $35, $35        ;; 07:5348 ????????
    db   $35, $45, $45, $f7, $01, $f0, $ba, $c7        ;; 07:5350 ????????
    db   $bc, $cc, $bc, $cc, $bc, $cc, $b2, $9a        ;; 07:5358 ????????
    db   $c7, $9c, $cc, $9c, $cc, $9c, $cc, $92        ;; 07:5360 ????????
    db   $8a, $c7, $8c, $cc, $8c, $cc, $8c, $cc        ;; 07:5368 ????????
    db   $82, $6a, $c7, $6a, $c7, $aa, $c7, $f1        ;; 07:5370 ????????
    db   $1a, $c7, $fd, $c6, $53, $4a, $c7, $f0        ;; 07:5378 ????????
    db   $b5, $f1, $4a, $ca, $4a, $f0, $b5, $f1        ;; 07:5380 ????????
    db   $1a, $c7, $f0, $85, $f1, $1a, $ca, $1a        ;; 07:5388 ????????
    db   $f0, $85, $f1, $6a, $c7, $15, $6a, $ca        ;; 07:5390 ????????
    db   $6a, $15, $3a, $c7, $f0, $a5, $f1, $3a        ;; 07:5398 ????????
    db   $ca, $3a, $f0, $a5, $f1, $4a, $c7, $f0        ;; 07:53a0 ????????
    db   $b5, $f1, $4a, $ca, $4a, $f0, $b5, $f1        ;; 07:53a8 ????????
    db   $5a, $c7, $15, $5a, $ca, $5a, $15, $6a        ;; 07:53b0 ????????
    db   $c7, $65, $4a, $c7, $45, $3a, $c7, $35        ;; 07:53b8 ????????
    db   $1a, $c7, $15, $fc, $3d, $53, $47, $ca        ;; 07:53c0 ????????
    db   $4c, $cc, $4c, $cc, $4c, $cc, $45, $c5        ;; 07:53c8 ????????
    db   $75, $f0, $7c, $cc, $7c, $cc, $7c, $cc        ;; 07:53d0 ????????
    db   $f1, $95, $f0, $9c, $cc, $9c, $cc, $9c        ;; 07:53d8 ????????
    db   $cc, $fb, $f8, $00, $f7, $c0, $f0, $b8        ;; 07:53e0 ????????
    db   $f1, $68, $b8, $f2, $18, $38, $18, $f1        ;; 07:53e8 ????????
    db   $b8, $68, $fc, $e2, $53, $48, $b8, $f2        ;; 07:53f0 ????????
    db   $48, $f1, $b8, $f2, $48, $f1, $b8, $f2        ;; 07:53f8 ????????
    db   $48, $f1, $b8, $28, $b8, $f2, $68, $f1        ;; 07:5400 ????????
    db   $b8, $f2, $68, $f1, $b8, $f2, $68, $f1        ;; 07:5408 ????????
    db   $b8, $08, $78, $f2, $48, $f1, $78, $f2        ;; 07:5410 ????????
    db   $48, $f1, $78, $f2, $48, $f1, $78, $f0        ;; 07:5418 ????????
    db   $b8, $f1, $68, $f2, $28, $f1, $68, $f2        ;; 07:5420 ????????
    db   $28, $f1, $68, $f2, $28, $f1, $68, $f0        ;; 07:5428 ????????
    db   $98, $f1, $48, $f2, $08, $f1, $48, $f2        ;; 07:5430 ????????
    db   $08, $f1, $48, $f2, $08, $f1, $48, $f0        ;; 07:5438 ????????
    db   $b8, $f1, $68, $f2, $28, $f1, $68, $f2        ;; 07:5440 ????????
    db   $28, $f1, $68, $f2, $28, $f1, $68, $08        ;; 07:5448 ????????
    db   $78, $f2, $48, $f1, $78, $f2, $48, $f1        ;; 07:5450 ????????
    db   $78, $f2, $48, $f1, $78, $28, $98, $f2        ;; 07:5458 ????????
    db   $68, $f1, $98, $f2, $68, $f1, $98, $f2        ;; 07:5460 ????????
    db   $68, $f1, $98, $f9, $48, $b8, $f2, $88        ;; 07:5468 ????????
    db   $f1, $b8, $f2, $88, $f1, $b8, $f2, $88        ;; 07:5470 ????????
    db   $f1, $b8, $fc, $6c, $54, $f9, $48, $b8        ;; 07:5478 ????????
    db   $f2, $78, $f1, $b8, $f2, $78, $f1, $b8        ;; 07:5480 ????????
    db   $f2, $78, $f1, $b8, $fc, $7e, $54, $f8        ;; 07:5488 ????????
    db   $07, $f7, $c3, $f0, $98, $f1, $48, $98        ;; 07:5490 ????????
    db   $48, $98, $48, $98, $48, $f0, $98, $f1        ;; 07:5498 ????????
    db   $48, $98, $48, $f0, $88, $f1, $38, $88        ;; 07:54a0 ????????
    db   $f2, $08, $f1, $18, $88, $f2, $18, $f1        ;; 07:54a8 ????????
    db   $88, $f2, $18, $f1, $88, $f2, $18, $f1        ;; 07:54b0 ????????
    db   $88, $18, $88, $f2, $18, $f1, $88, $28        ;; 07:54b8 ????????
    db   $68, $98, $f2, $28, $f9, $f1, $48, $b8        ;; 07:54c0 ????????
    db   $f2, $88, $f1, $b8, $f2, $88, $f1, $b8        ;; 07:54c8 ????????
    db   $f2, $88, $f1, $b8, $48, $b8, $f2, $88        ;; 07:54d0 ????????
    db   $f1, $b8, $f2, $68, $f1, $b8, $f2, $28        ;; 07:54d8 ????????
    db   $f1, $b8, $f0, $ba, $f1, $6a, $ba, $f2        ;; 07:54e0 ????????
    db   $2a, $f1, $ba, $6a, $f2, $6a, $2a, $f1        ;; 07:54e8 ????????
    db   $ba, $f2, $ba, $6a, $2a, $f0, $ba, $f1        ;; 07:54f0 ????????
    db   $6a, $ba, $f2, $2a, $f1, $ba, $6a, $f2        ;; 07:54f8 ????????
    db   $6a, $2a, $f1, $ba, $f2, $ba, $6a, $2a        ;; 07:5500 ????????
    db   $fc, $c5, $54, $f9, $f1, $48, $b8, $f2        ;; 07:5508 ????????
    db   $48, $f1, $b8, $f2, $48, $f1, $b8, $f2        ;; 07:5510 ????????
    db   $48, $f1, $b8, $48, $b8, $f2, $48, $f1        ;; 07:5518 ????????
    db   $b8, $28, $f2, $28, $f1, $68, $f2, $28        ;; 07:5520 ????????
    db   $fc, $0c, $55, $e0, $2a, $f1, $48, $b8        ;; 07:5528 ????????
    db   $e0, $29, $f2, $48, $f1, $b8, $e0, $27        ;; 07:5530 ????????
    db   $f2, $48, $f1, $b8, $e0, $26, $f2, $48        ;; 07:5538 ????????
    db   $f1, $b8, $e0, $25, $48, $b8, $e0, $24        ;; 07:5540 ????????
    db   $f2, $48, $f1, $b8, $e0, $23, $28, $f2        ;; 07:5548 ????????
    db   $28, $e0, $21, $f1, $68, $e0, $1f, $f2        ;; 07:5550 ????????
    db   $28, $e0, $1e, $f1, $40, $ff                  ;; 07:5558 ??????

data_07_555e:
    db   $f7, $02, $f7, $82, $ed, $e0, $44, $f7        ;; 07:555e ????????
    db   $c3, $f1, $bc, $f2, $0c, $f7, $c0, $2c        ;; 07:5566 ????????
    db   $4c, $f7, $c4, $6c, $8c, $f9, $f7, $46        ;; 07:556e ????????
    db   $f7, $c3, $90, $a2, $f3, $22, $fd, $86        ;; 07:5576 ????????
    db   $55, $01, $f2, $95, $a0, $fc, $74, $55        ;; 07:557e ????????
    db   $f3, $01, $45, $50, $f9, $f7, $02, $f7        ;; 07:5586 ????????
    db   $82, $f7, $c0, $f7, $43, $ed, $f2, $92        ;; 07:558e ????????
    db   $d8, $f3, $05, $48, $25, $f2, $a2, $9c        ;; 07:5596 ????????
    db   $ac, $9c, $78, $92, $d8, $f3, $05, $48        ;; 07:559e ????????
    db   $65, $25, $da, $de, $ce, $25, $48, $fd        ;; 07:55a6 ????????
    db   $c5, $55, $53, $03, $f2, $95, $83, $93        ;; 07:55ae ????????
    db   $b5, $f3, $02, $d8, $25, $08, $f2, $b3        ;; 07:55b6 ????????
    db   $f3, $05, $25, $48, $fc, $8b, $55, $52        ;; 07:55be ????????
    db   $25, $f2, $a5, $f3, $45, $05, $f2, $95        ;; 07:55c6 ????????
    db   $f3, $05, $20, $f7, $02, $f7, $82, $f7        ;; 07:55ce ????????
    db   $43, $ed, $f7, $c3, $c1, $f1, $bc, $f2        ;; 07:55d6 ????????
    db   $0c, $f7, $c0, $2c, $4c, $f7, $c4, $6c        ;; 07:55de ????????
    db   $8c, $fe, $73, $55                            ;; 07:55e6 ????

data_07_55ea:
    db   $f7, $02, $f7, $82, $eb, $f7, $c4, $f1        ;; 07:55ea ????????
    db   $8c, $9c, $f7, $c0, $bc, $f2, $0c, $f7        ;; 07:55f2 ????????
    db   $c3, $2c, $4c, $f9, $f7, $46, $f7, $c4        ;; 07:55fa ????????
    db   $f2, $00, $22, $52, $fd, $12, $56, $41        ;; 07:5602 ????????
    db   $05, $23, $03, $f1, $a5, $fc, $fe, $55        ;; 07:560a ????????
    db   $f2, $41, $75, $a3, $93, $75, $f9, $f7        ;; 07:5612 ????????
    db   $07, $f7, $82, $f7, $c9, $f7, $43, $f2        ;; 07:561a ????????
    db   $43, $23, $05, $53, $43, $25, $43, $23        ;; 07:5622 ????????
    db   $05, $63, $43, $25, $fd, $66, $56, $95        ;; 07:562a ????????
    db   $08, $75, $08, $58, $08, $48, $f1, $88        ;; 07:5632 ????????
    db   $b8, $88, $f2, $28, $f1, $88, $f2, $88        ;; 07:563a ????????
    db   $f1, $88, $f2, $98, $08, $58, $08, $28        ;; 07:5642 ????????
    db   $08, $58, $98, $f7, $c2, $88, $4d, $cd        ;; 07:564a ????????
    db   $4d, $cd, $98, $4d, $cd, $4d, $cd, $b8        ;; 07:5652 ????????
    db   $4d, $cd, $4d, $cd, $8b, $4b, $2b, $f1        ;; 07:565a ????????
    db   $bb, $fc, $19, $56, $f2, $a5, $28, $95        ;; 07:5662 ????????
    db   $28, $78, $28, $98, $08, $48, $08, $28        ;; 07:566a ????????
    db   $08, $48, $08, $f7, $c2, $68, $2d, $cd        ;; 07:5672 ????????
    db   $2d, $cd, $a8, $2d, $cd, $2d, $cd, $98        ;; 07:567a ????????
    db   $2d, $cd, $2d, $cd, $78, $2d, $cd, $2d        ;; 07:5682 ????????
    db   $cd, $68, $2d, $cd, $2d, $cd, $08, $48        ;; 07:568a ????????
    db   $28, $f1, $98, $f7, $02, $f7, $82, $f7        ;; 07:5692 ????????
    db   $43, $f7, $c4, $8c, $9c, $f7, $c0, $bc        ;; 07:569a ????????
    db   $f2, $0c, $f7, $c3, $2c, $4c, $fe, $fd        ;; 07:56a2 ????????
    db   $55                                           ;; 07:56aa ?

data_07_56ab:
    db   $f7, $01, $f8, $06, $ef, $c5, $fb, $f7        ;; 07:56ab ????????
    db   $c0, $f0, $98, $f1, $4d, $cd, $4d, $cd        ;; 07:56b3 ????????
    db   $f0, $98, $f1, $4d, $cd, $4d, $cd, $f0        ;; 07:56bb ????????
    db   $98, $f1, $4d, $cd, $4d, $cd, $f0, $98        ;; 07:56c3 ????????
    db   $f1, $4d, $cd, $4d, $cd, $f0, $a8, $f1        ;; 07:56cb ????????
    db   $5d, $cd, $5d, $cd, $f0, $a8, $f1, $5d        ;; 07:56d3 ????????
    db   $cd, $5d, $cd, $f0, $a8, $f1, $5d, $cd        ;; 07:56db ????????
    db   $5d, $cd, $f0, $a8, $f1, $5d, $cd, $5d        ;; 07:56e3 ????????
    db   $cd, $fc, $b2, $56, $f9, $f7, $ca, $f0        ;; 07:56eb ????????
    db   $98, $f1, $4b, $cb, $f0, $98, $f1, $4b        ;; 07:56f3 ????????
    db   $cb, $f0, $98, $f1, $4b, $cb, $f0, $98        ;; 07:56fb ????????
    db   $f1, $4b, $cb, $f0, $a8, $f1, $5b, $cb        ;; 07:5703 ????????
    db   $f0, $a8, $f1, $5b, $cb, $f0, $a8, $f1        ;; 07:570b ????????
    db   $5b, $cb, $f0, $a8, $f1, $5b, $cb, $f0        ;; 07:5713 ????????
    db   $98, $f1, $4b, $cb, $f0, $98, $f1, $4b        ;; 07:571b ????????
    db   $cb, $f0, $98, $f1, $4b, $cb, $f0, $98        ;; 07:5723 ????????
    db   $f1, $4b, $cb, $28, $f0, $9b, $cb, $f1        ;; 07:572b ????????
    db   $28, $f0, $9b, $cb, $f1, $28, $f0, $9b        ;; 07:5733 ????????
    db   $cb, $f1, $28, $f0, $9b, $cb, $fd, $87        ;; 07:573b ????????
    db   $57, $f1, $58, $0b, $cb, $58, $0b, $cb        ;; 07:5743 ????????
    db   $58, $0b, $cb, $58, $0b, $cb, $48, $f0        ;; 07:574b ????????
    db   $bb, $cb, $f1, $48, $f0, $bb, $cb, $f1        ;; 07:5753 ????????
    db   $48, $f0, $bb, $cb, $f1, $48, $f0, $bb        ;; 07:575b ????????
    db   $cb, $f1, $58, $0b, $cb, $58, $0b, $cb        ;; 07:5763 ????????
    db   $58, $0b, $cb, $58, $0b, $cb, $48, $f0        ;; 07:576b ????????
    db   $bb, $cb, $f1, $48, $f0, $bb, $cb, $f1        ;; 07:5773 ????????
    db   $48, $f0, $bb, $cb, $f1, $48, $f0, $bb        ;; 07:577b ????????
    db   $cb, $fc, $f0, $56, $a8, $f1, $5b, $cb        ;; 07:5783 ????????
    db   $f0, $a8, $f1, $5b, $cb, $f0, $a8, $f1        ;; 07:578b ????????
    db   $5b, $cb, $f0, $a8, $f1, $5b, $cb, $f0        ;; 07:5793 ????????
    db   $98, $f1, $4b, $cb, $f0, $98, $f1, $4b        ;; 07:579b ????????
    db   $cb, $f0, $98, $f1, $4b, $cb, $f0, $98        ;; 07:57a3 ????????
    db   $f1, $4b, $cb, $28, $f0, $9b, $cb, $f1        ;; 07:57ab ????????
    db   $28, $f0, $9b, $cb, $f1, $28, $f0, $9b        ;; 07:57b3 ????????
    db   $cb, $f1, $28, $f0, $9b, $cb, $f1, $28        ;; 07:57bb ????????
    db   $f0, $9b, $cb, $f1, $28, $f0, $9b, $cb        ;; 07:57c3 ????????
    db   $f1, $28, $f0, $9b, $cb, $f1, $28, $f0        ;; 07:57cb ????????
    db   $9b, $cb, $fe, $b1, $56                       ;; 07:57d3 ?????

data_07_57d8:
    db   $f7, $40, $f7, $03, $f8, $02, $ef, $f9        ;; 07:57d8 ????????
    db   $f7, $c3, $f1, $48, $58, $b8, $f2, $28        ;; 07:57e0 ????????
    db   $48, $28, $f1, $b8, $58, $48, $58, $b8        ;; 07:57e8 ????????
    db   $f2, $28, $48, $28, $f1, $b8, $58, $48        ;; 07:57f0 ????????
    db   $58, $f2, $08, $48, $58, $48, $08, $f1        ;; 07:57f8 ????????
    db   $58, $fd, $11, $58, $48, $58, $f2, $08        ;; 07:5800 ????????
    db   $48, $58, $48, $08, $f1, $58, $fc, $e0        ;; 07:5808 ????????
    db   $57, $48, $58, $f2, $08, $48, $58, $48        ;; 07:5810 ????????
    db   $08, $f1, $5a, $de, $ce, $f9, $f7, $46        ;; 07:5818 ????????
    db   $f7, $c0, $f8, $04, $f7, $03, $ef, $f3        ;; 07:5820 ????????
    db   $b5, $95, $75, $65, $95, $75, $65, $46        ;; 07:5828 ????????
    db   $dc, $ce, $40, $05, $d6, $dc, $ce, $05        ;; 07:5830 ????????
    db   $25, $42, $f2, $b2, $d2, $f3, $65, $46        ;; 07:5838 ????????
    db   $dc, $ce, $fd, $4a, $58, $40, $00, $fc        ;; 07:5840 ????????
    db   $1e, $58, $72, $42, $d1, $d8, $da, $de        ;; 07:5848 ????????
    db   $ce, $fe, $d8, $57                            ;; 07:5850 ????

data_07_5854:
    db   $f7, $80, $f7, $46, $f7, $04, $f7, $c4        ;; 07:5854 ????????
    db   $e3, $ca, $f9, $f2, $48, $58, $b8, $f3        ;; 07:585c ????????
    db   $28, $48, $28, $f2, $b8, $58, $48, $58        ;; 07:5864 ????????
    db   $b8, $f3, $28, $48, $28, $f2, $b8, $58        ;; 07:586c ????????
    db   $48, $58, $f3, $08, $48, $58, $48, $08        ;; 07:5874 ????????
    db   $f2, $58, $fd, $8e, $58, $48, $58, $f3        ;; 07:587c ????????
    db   $08, $48, $58, $48, $08, $f2, $58, $fc        ;; 07:5884 ????????
    db   $5f, $58, $48, $58, $f3, $08, $48, $58        ;; 07:588c ????????
    db   $48, $08, $f2, $5c, $fb, $f7, $40, $f7        ;; 07:5894 ????????
    db   $03, $f7, $c6, $f7, $81, $f2, $ea, $4b        ;; 07:589c ????????
    db   $6b, $7b, $6b, $e8, $4b, $6b, $7b, $6b        ;; 07:58a4 ????????
    db   $e7, $4b, $6b, $7b, $6b, $e5, $4b, $6b        ;; 07:58ac ????????
    db   $7b, $6b, $e3, $4b, $6b, $7b, $6b, $e5        ;; 07:58b4 ????????
    db   $4b, $6b, $7b, $6b, $e7, $4b, $6b, $7b        ;; 07:58bc ????????
    db   $6b, $e8, $4b, $6b, $7b, $4b, $ea, $5b        ;; 07:58c4 ????????
    db   $7b, $9b, $7b, $e8, $5b, $7b, $9b, $7b        ;; 07:58cc ????????
    db   $e7, $5b, $7b, $9b, $7b, $e5, $5b, $7b        ;; 07:58d4 ????????
    db   $9b, $7b, $e3, $5b, $7b, $9b, $7b, $e5        ;; 07:58dc ????????
    db   $5b, $7b, $9b, $7b, $e7, $5b, $7b, $9b        ;; 07:58e4 ????????
    db   $7b, $e8, $5b, $7b, $9b, $5b, $fc, $99        ;; 07:58ec ????????
    db   $58, $fe, $54, $58                            ;; 07:58f4 ????

data_07_58f8:
    db   $e0, $30, $f7, $00, $f7, $82, $f7, $c8        ;; 07:58f8 ????????
    db   $f7, $43, $e5, $f0, $42, $d6, $de, $9e        ;; 07:5900 ????????
    db   $ae, $b5, $f1, $40, $f0, $52, $d6, $de        ;; 07:5908 ????????
    db   $ae, $be, $f1, $05, $50, $f0, $42, $d6        ;; 07:5910 ????????
    db   $de, $9e, $ae, $b5, $f1, $40, $f0, $22        ;; 07:5918 ????????
    db   $d6, $de, $7e, $8e, $95, $f1, $20, $fe        ;; 07:5920 ????????
    db   $03, $59                                      ;; 07:5928 ??

data_07_592a:
    db   $e0, $46, $f7, $0a, $f7, $82, $f7, $c3        ;; 07:592a ????????
    db   $f7, $43, $ef, $f9, $f3, $88, $85, $88        ;; 07:5932 ????????
    db   $85, $88, $85, $88, $85, $85, $88, $88        ;; 07:593a ????????
    db   $78, $75, $78, $75, $78, $75, $fd, $53        ;; 07:5942 ????????
    db   $59, $78, $75, $75, $78, $78, $fc, $36        ;; 07:594a ????????
    db   $59, $78, $75, $4b, $5b, $6b, $7b, $8b        ;; 07:5952 ????????
    db   $7b, $6b, $5b, $f9, $f7, $02, $f7, $cd        ;; 07:595a ????????
    db   $ef, $f3, $42, $02, $f2, $92, $f3, $05        ;; 07:5962 ????????
    db   $45, $35, $f2, $bb, $c6, $c8, $ec, $f3        ;; 07:596a ????????
    db   $3b, $cb, $f2, $b5, $e8, $f3, $3b, $cb        ;; 07:5972 ????????
    db   $f2, $b5, $e4, $f3, $3b, $cb, $f2, $b5        ;; 07:597a ????????
    db   $ef, $f3, $22, $f2, $a2, $45, $55, $a5        ;; 07:5982 ????????
    db   $f3, $25, $15, $f2, $9b, $c6, $c8, $ec        ;; 07:598a ????????
    db   $f3, $1b, $cb, $f2, $95, $fd, $a9, $59        ;; 07:5992 ????????
    db   $e8, $f3, $1b, $cb, $f2, $95, $e4, $f3        ;; 07:599a ????????
    db   $1b, $cb, $f2, $95, $fc, $5e, $59, $e8        ;; 07:59a2 ????????
    db   $f3, $1b, $cb, $f2, $95, $e4, $f3, $1b        ;; 07:59aa ????????
    db   $cb, $f2, $95, $f7, $c0, $ef, $9b, $bb        ;; 07:59b2 ????????
    db   $f3, $0b, $1b, $f9, $22, $02, $f2, $b2        ;; 07:59ba ????????
    db   $92, $f3, $25, $05, $f2, $b5, $95, $fd        ;; 07:59c2 ????????
    db   $e2, $59, $bb, $4b, $9b, $bb, $f3, $4b        ;; 07:59ca ????????
    db   $f2, $bb, $f3, $2b, $4b, $8b, $4b, $8b        ;; 07:59d2 ????????
    db   $9b, $bb, $9b, $8b, $4b, $fc, $be, $59        ;; 07:59da ????????
    db   $f2, $8b, $9b, $bb, $9b, $bb, $f3, $0b        ;; 07:59e2 ????????
    db   $f2, $bb, $f3, $0b, $2b, $0b, $2b, $4b        ;; 07:59ea ????????
    db   $2b, $4b, $5b, $8b, $fe, $5d, $59             ;; 07:59f2 ???????

data_07_59f9:
    db   $f7, $0a, $f7, $c4, $f7, $43, $e8, $f9        ;; 07:59f9 ????????
    db   $f7, $81, $f3, $38, $f2, $95, $f3, $38        ;; 07:5a01 ????????
    db   $f2, $95, $f3, $38, $f2, $95, $f3, $38        ;; 07:5a09 ????????
    db   $f2, $95, $9b, $8b, $9b, $ab, $bb, $ab        ;; 07:5a11 ????????
    db   $9b, $8b, $f3, $28, $f2, $85, $f3, $28        ;; 07:5a19 ????????
    db   $f2, $85, $f3, $28, $f2, $85, $fd, $3a        ;; 07:5a21 ????????
    db   $5a, $f3, $28, $f2, $85, $7b, $8b, $9b        ;; 07:5a29 ????????
    db   $ab, $bb, $f3, $0b, $1b, $2b, $fc, $01        ;; 07:5a31 ????????
    db   $5a, $f3, $28, $f2, $85, $8b, $7b, $6b        ;; 07:5a39 ????????
    db   $5b, $4b, $3b, $2b, $1b, $f9, $f7, $02        ;; 07:5a41 ????????
    db   $f7, $c4, $ea, $f1, $98, $ab, $bb, $f2        ;; 07:5a49 ????????
    db   $08, $f1, $bb, $ab, $98, $ab, $bb, $f2        ;; 07:5a51 ????????
    db   $08, $f1, $bb, $ab, $98, $ab, $bb, $f2        ;; 07:5a59 ????????
    db   $08, $f1, $bb, $ab, $98, $ab, $bb, $f2        ;; 07:5a61 ????????
    db   $08, $f1, $bb, $ab, $f2, $65, $3b, $c6        ;; 07:5a69 ????????
    db   $c8, $e8, $6b, $cb, $35, $f7, $c0, $e4        ;; 07:5a71 ????????
    db   $6b, $cb, $35, $f7, $c3, $e3, $6b, $cb        ;; 07:5a79 ????????
    db   $35, $ea, $f1, $a8, $f2, $0b, $1b, $28        ;; 07:5a81 ????????
    db   $1b, $0b, $f1, $a8, $f2, $0b, $1b, $28        ;; 07:5a89 ????????
    db   $1b, $0b, $f1, $a8, $f2, $0b, $1b, $28        ;; 07:5a91 ????????
    db   $1b, $0b, $f1, $a8, $f2, $0b, $1b, $28        ;; 07:5a99 ????????
    db   $1b, $0b, $45, $1b, $c6, $c8, $f7, $c4        ;; 07:5aa1 ????????
    db   $e8, $4b, $cb, $15, $fd, $bf, $5a, $f7        ;; 07:5aa9 ????????
    db   $c0, $e4, $4b, $cb, $15, $f7, $c3, $e3        ;; 07:5ab1 ????????
    db   $4b, $cb, $15, $fc, $47, $5a, $f7, $c0        ;; 07:5ab9 ????????
    db   $e4, $4b, $cb, $15, $f7, $c3, $4b, $cb        ;; 07:5ac1 ????????
    db   $15, $4b, $cb, $18, $f9, $f7, $00, $e8        ;; 07:5ac9 ????????
    db   $92, $52, $22, $02, $25, $45, $55, $25        ;; 07:5ad1 ????????
    db   $fd, $e5, $5a, $f1, $b5, $f2, $25, $45        ;; 07:5ad9 ????????
    db   $85, $fc, $ce, $5a, $40, $fe, $46, $5a        ;; 07:5ae1 ????????

data_07_5ae9:
    db   $f7, $c0, $f7, $0a, $f8, $06, $ef, $f0        ;; 07:5ae9 ????????
    db   $58, $55, $58, $55, $58, $55, $58, $55        ;; 07:5af1 ????????
    db   $55, $58, $58, $48, $45, $48, $45, $48        ;; 07:5af9 ????????
    db   $45, $48, $45, $45, $48, $48, $f7, $01        ;; 07:5b01 ????????
    db   $5b, $cb, $5b, $cb, $f1, $58, $f0, $5b        ;; 07:5b09 ????????
    db   $cb, $5b, $cb, $f1, $58, $f0, $5b, $cb        ;; 07:5b11 ????????
    db   $5b, $cb, $f1, $58, $f0, $5b, $cb, $5b        ;; 07:5b19 ????????
    db   $cb, $f1, $58, $f0, $58, $f1, $58, $f0        ;; 07:5b21 ????????
    db   $58, $f1, $58, $f0, $4b, $cb, $4b, $cb        ;; 07:5b29 ????????
    db   $f1, $48, $f0, $4b, $cb, $4b, $cb, $f1        ;; 07:5b31 ????????
    db   $48, $f0, $4b, $cb, $4b, $cb, $f1, $48        ;; 07:5b39 ????????
    db   $f0, $4b, $cb, $4b, $cb, $f1, $48, $f0        ;; 07:5b41 ????????
    db   $48, $f1, $48, $f0, $48, $f1, $48, $f9        ;; 07:5b49 ????????
    db   $f7, $0a, $f7, $c0, $f0, $98, $f1, $48        ;; 07:5b51 ????????
    db   $f0, $98, $f1, $48, $f0, $98, $f1, $48        ;; 07:5b59 ????????
    db   $f0, $98, $f1, $48, $f0, $98, $f1, $48        ;; 07:5b61 ????????
    db   $f0, $98, $f1, $48, $f0, $98, $f1, $48        ;; 07:5b69 ????????
    db   $f0, $98, $f1, $48, $f7, $01, $f0, $b8        ;; 07:5b71 ????????
    db   $f1, $68, $78, $08, $68, $78, $18, $68        ;; 07:5b79 ????????
    db   $78, $08, $68, $78, $f0, $b8, $f1, $68        ;; 07:5b81 ????????
    db   $f7, $0a, $f0, $a8, $f1, $58, $f0, $a8        ;; 07:5b89 ????????
    db   $f1, $58, $f0, $a8, $f1, $58, $f0, $a8        ;; 07:5b91 ????????
    db   $f1, $58, $f0, $a8, $f1, $58, $f0, $a8        ;; 07:5b99 ????????
    db   $f1, $58, $f0, $a8, $f1, $58, $f0, $a8        ;; 07:5ba1 ????????
    db   $f1, $58, $f7, $01, $f0, $98, $f1, $48        ;; 07:5ba9 ????????
    db   $98, $f0, $a8, $f1, $48, $a8, $f0, $b8        ;; 07:5bb1 ????????
    db   $f1, $48, $fd, $cb, $5b, $b8, $f0, $a8        ;; 07:5bb9 ????????
    db   $f1, $48, $a8, $f0, $98, $f1, $48, $fc        ;; 07:5bc1 ????????
    db   $51, $5b, $b8, $f0, $a8, $f1, $48, $a8        ;; 07:5bc9 ????????
    db   $f0, $98, $f1, $48, $98, $48, $f9, $f7        ;; 07:5bd1 ????????
    db   $cc, $f1, $5b, $cb, $08, $5b, $cb, $08        ;; 07:5bd9 ????????
    db   $5b, $cb, $08, $5b, $cb, $08, $5b, $cb        ;; 07:5be1 ????????
    db   $08, $5b, $cb, $08, $5b, $cb, $08, $5b        ;; 07:5be9 ????????
    db   $cb, $08, $fd, $20, $5c, $2b, $cb, $f0        ;; 07:5bf1 ????????
    db   $98, $f1, $2b, $cb, $f0, $98, $f1, $2b        ;; 07:5bf9 ????????
    db   $cb, $f0, $98, $f1, $2b, $cb, $f0, $98        ;; 07:5c01 ????????
    db   $f1, $4b, $cb, $f0, $b8, $f1, $4b, $cb        ;; 07:5c09 ????????
    db   $f0, $b8, $f1, $4b, $cb, $f0, $b8, $f1        ;; 07:5c11 ????????
    db   $4b, $cb, $f0, $b8, $fc, $d8, $5b, $f0        ;; 07:5c19 ????????
    db   $bb, $cb, $f1, $58, $f0, $bb, $cb, $f1        ;; 07:5c21 ????????
    db   $58, $f0, $bb, $cb, $f1, $58, $f0, $bb        ;; 07:5c29 ????????
    db   $cb, $f1, $58, $45, $25, $05, $f0, $b5        ;; 07:5c31 ????????
    db   $fe, $50, $5b                                 ;; 07:5c39 ???

data_07_5c3c:
    db   $e0, $21, $f7, $05, $f7, $80, $f7, $c0        ;; 07:5c3c ????????
    db   $f7, $43, $ef, $f2, $b8, $f3, $08, $f9        ;; 07:5c44 ????????
    db   $f3, $25, $f2, $75, $f3, $68, $48, $28        ;; 07:5c4c ????????
    db   $08, $25, $f2, $75, $f3, $08, $f2, $b8        ;; 07:5c54 ????????
    db   $98, $f3, $08, $fd, $71, $5c, $f2, $b5        ;; 07:5c5c ????????
    db   $25, $48, $78, $98, $78, $b2, $95, $b8        ;; 07:5c64 ????????
    db   $f3, $08, $fc, $4c, $5c, $f2, $b5, $25        ;; 07:5c6c ????????
    db   $38, $78, $98, $78, $71, $c5, $f9, $72        ;; 07:5c74 ????????
    db   $f3, $62, $21, $f2, $b5, $f3, $48, $28        ;; 07:5c7c ????????
    db   $08, $f2, $b8, $95, $b8, $f3, $08, $fd        ;; 07:5c84 ????????
    db   $94, $5c, $f2, $b1, $c5, $fc, $7b, $5c        ;; 07:5c8c ????????
    db   $f3, $21, $f2, $b8, $f3, $08, $fe, $4b        ;; 07:5c94 ????????
    db   $5c                                           ;; 07:5c9c ?

data_07_5c9d:
    db   $c5, $f7, $04, $f7, $82, $f7, $c4, $f7        ;; 07:5c9d ????????
    db   $42, $ea, $ce, $fa, $f0, $78, $f1, $28        ;; 07:5ca5 ????????
    db   $78, $b8, $f0, $78, $f1, $48, $98, $f2        ;; 07:5cad ????????
    db   $08, $f0, $78, $f1, $68, $b8, $f2, $28        ;; 07:5cb5 ????????
    db   $f0, $78, $f1, $48, $98, $f2, $08, $fc        ;; 07:5cbd ????????
    db   $a9, $5c, $f0, $78, $f1, $28, $78, $b8        ;; 07:5cc5 ????????
    db   $f0, $78, $f1, $38, $98, $f2, $08, $f0        ;; 07:5ccd ????????
    db   $78, $f1, $28, $78, $b8, $f2, $28, $f1        ;; 07:5cd5 ????????
    db   $b8, $78, $6a, $de, $f9, $f7, $06, $f7        ;; 07:5cdd ????????
    db   $80, $f7, $45, $e6, $f2, $42, $f3, $22        ;; 07:5ce5 ????????
    db   $f2, $61, $25, $fd, $fc, $5c, $75, $45        ;; 07:5ced ????????
    db   $65, $45, $21, $c5, $fc, $e2, $5c, $75        ;; 07:5cf5 ????????
    db   $45, $05, $45, $a8, $58, $28, $58, $68        ;; 07:5cfd ????????
    db   $48, $28, $08, $fe, $9e, $5c                  ;; 07:5d05 ??????

data_07_5d0b:
    db   $f7, $c3, $f7, $47, $f7, $04, $f8, $05        ;; 07:5d0b ????????
    db   $ef, $c5, $fa, $f0, $78, $f1, $28, $78        ;; 07:5d13 ????????
    db   $b8, $f0, $78, $f1, $48, $98, $f2, $08        ;; 07:5d1b ????????
    db   $f0, $78, $f1, $68, $b8, $f2, $28, $f0        ;; 07:5d23 ????????
    db   $78, $f1, $48, $98, $f2, $08, $fc, $16        ;; 07:5d2b ????????
    db   $5d, $f0, $78, $f1, $28, $78, $b8, $f0        ;; 07:5d33 ????????
    db   $78, $f1, $38, $98, $f2, $08, $f0, $78        ;; 07:5d3b ????????
    db   $f1, $28, $78, $b8, $f2, $28, $f1, $b8        ;; 07:5d43 ????????
    db   $78, $68, $f9, $f0, $48, $b8, $f1, $48        ;; 07:5d4b ????????
    db   $78, $48, $78, $b8, $f2, $48, $f0, $b8        ;; 07:5d53 ????????
    db   $f1, $68, $b8, $f2, $18, $28, $18, $f1        ;; 07:5d5b ????????
    db   $b8, $68, $fd, $81, $5d, $08, $78, $f2        ;; 07:5d63 ????????
    db   $08, $f1, $78, $28, $98, $f2, $28, $f1        ;; 07:5d6b ????????
    db   $98, $f0, $78, $f1, $28, $78, $98, $b8        ;; 07:5d73 ????????
    db   $98, $78, $68, $fc, $4e, $5d, $f1, $08        ;; 07:5d7b ????????
    db   $78, $f2, $08, $f1, $78, $f0, $98, $f1        ;; 07:5d83 ????????
    db   $48, $98, $48, $f0, $a8, $f1, $58, $a8        ;; 07:5d8b ????????
    db   $58, $22, $fe, $15, $5d                       ;; 07:5d93 ?????

data_07_5d98:
    db   $f7, $05, $f7, $80, $f7, $43, $ef, $f7        ;; 07:5d98 ????????
    db   $c0, $e0, $23, $f9, $f2, $b8, $f3, $68        ;; 07:5da0 ????????
    db   $78, $98, $b2, $d3, $d9, $cd, $b8, $98        ;; 07:5da8 ????????
    db   $f4, $28, $f3, $b8, $70, $c5, $c5, $68        ;; 07:5db0 ????????
    db   $48, $98, $28, $fd, $d9, $5d, $02, $d6        ;; 07:5db8 ????????
    db   $dd, $cd, $08, $28, $45, $d9, $cd, $48        ;; 07:5dc0 ????????
    db   $25, $05, $f2, $b5, $d9, $cd, $b8, $a5        ;; 07:5dc8 ????????
    db   $f3, $15, $f2, $b1, $d8, $c8, $fc, $a4        ;; 07:5dd0 ????????
    db   $5d, $f3, $02, $d8, $f2, $b8, $f3, $08        ;; 07:5dd8 ????????
    db   $78, $65, $45, $25, $65, $40, $d5, $c1        ;; 07:5de0 ????????
    db   $f9, $f3, $28, $48, $58, $98, $f4, $05        ;; 07:5de8 ????????
    db   $f3, $b8, $98, $b5, $71, $48, $58, $98        ;; 07:5df0 ????????
    db   $f4, $08, $45, $28, $08, $fd, $04, $5e        ;; 07:5df8 ????????
    db   $20, $fc, $e9, $5d, $f3, $b0, $fe, $9f        ;; 07:5e00 ????????
    db   $5d                                           ;; 07:5e08 ?

data_07_5e09:
    db   $f7, $03, $f8, $02, $ef, $f7, $c3, $f9        ;; 07:5e09 ????????
    db   $f1, $78, $b8, $78, $b8, $78, $b8, $78        ;; 07:5e11 ????????
    db   $b8, $68, $b8, $68, $b8, $68, $b8, $68        ;; 07:5e19 ????????
    db   $b8, $48, $b8, $48, $b8, $48, $b8, $48        ;; 07:5e21 ????????
    db   $b8, $68, $98, $68, $98, $68, $98, $68        ;; 07:5e29 ????????
    db   $98, $48, $78, $48, $78, $48, $78, $48        ;; 07:5e31 ????????
    db   $78, $fd, $58, $5e, $08, $68, $08, $68        ;; 07:5e39 ????????
    db   $08, $68, $08, $68, $18, $68, $18, $68        ;; 07:5e41 ????????
    db   $18, $68, $18, $68, $48, $68, $48, $68        ;; 07:5e49 ????????
    db   $38, $68, $38, $68, $fc, $11, $5e, $68        ;; 07:5e51 ????????
    db   $98, $68, $98, $68, $98, $68, $98, $78        ;; 07:5e59 ????????
    db   $b8, $78, $b8, $78, $b8, $78, $b8, $48        ;; 07:5e61 ????????
    db   $78, $48, $78, $48, $78, $48, $78, $f9        ;; 07:5e69 ????????
    db   $98, $58, $28, $58, $98, $58, $28, $58        ;; 07:5e71 ????????
    db   $78, $58, $28, $58, $78, $58, $28, $58        ;; 07:5e79 ????????
    db   $98, $58, $48, $58, $98, $58, $48, $58        ;; 07:5e81 ????????
    db   $fd, $97, $5e, $78, $58, $28, $58, $78        ;; 07:5e89 ????????
    db   $58, $28, $58, $fc, $71, $5e, $e0, $22        ;; 07:5e91 ????????
    db   $98, $68, $e0, $21, $48, $68, $e0, $20        ;; 07:5e99 ????????
    db   $98, $68, $e0, $1f, $38, $e0, $1e, $68        ;; 07:5ea1 ????????
    db   $fe, $0e, $5e                                 ;; 07:5ea9 ???

data_07_5eac:
    db   $f7, $82, $f7, $45, $f7, $02, $e9, $f7        ;; 07:5eac ????????
    db   $c4, $f9, $f1, $41, $db, $cb, $48, $20        ;; 07:5eb4 ????????
    db   $01, $db, $cb, $08, $f0, $b0, $91, $db        ;; 07:5ebc ????????
    db   $cb, $98, $fd, $d2, $5e, $f1, $20, $62        ;; 07:5ec4 ????????
    db   $12, $f0, $b0, $fc, $b6, $5e, $b0, $f1        ;; 07:5ecc ????????
    db   $00, $10, $f9, $f7, $0a, $f7, $c7, $e8        ;; 07:5ed4 ????????
    db   $25, $e3, $25, $e8, $95, $e3, $95, $e8        ;; 07:5edc ????????
    db   $f0, $75, $f1, $75, $f0, $72, $f1, $55        ;; 07:5ee4 ????????
    db   $e3, $55, $e8, $f2, $05, $e3, $05, $fd        ;; 07:5eec ????????
    db   $00, $5f, $e8, $f0, $75, $f1, $75, $25        ;; 07:5ef4 ????????
    db   $75, $fc, $d7, $5e, $e8, $f0, $b5, $f1        ;; 07:5efc ????????
    db   $e7, $b5, $e6, $65, $e5, $b5, $fe, $b0        ;; 07:5f04 ????????
    db   $5e                                           ;; 07:5f0c ?

data_07_5f0d:
    db   $f7, $02, $f7, $82, $f7, $c0, $f7, $43        ;; 07:5f0d ????????
    db   $ef, $e0, $40, $f2, $5b, $cb, $8b, $cb        ;; 07:5f15 ????????
    db   $f9, $f3, $05, $f2, $5b, $cb, $8b, $cb        ;; 07:5f1d ????????
    db   $f3, $0b, $cb, $c8, $55, $38, $1b, $cb        ;; 07:5f25 ????????
    db   $0b, $cb, $f2, $ab, $cb, $f3, $0b, $cb        ;; 07:5f2d ????????
    db   $c8, $f2, $85, $fd, $4c, $5f, $f3, $02        ;; 07:5f35 ????????
    db   $d8, $f2, $a8, $f3, $08, $f2, $a8, $61        ;; 07:5f3d ????????
    db   $5b, $cb, $8b, $cb, $fc, $1e, $5f, $f3        ;; 07:5f45 ????????
    db   $02, $d8, $f2, $a8, $f3, $08, $18, $61        ;; 07:5f4d ????????
    db   $0b, $cb, $1b, $cb, $35, $0b, $cb, $1b        ;; 07:5f55 ????????
    db   $cb, $35, $0b, $cb, $1b, $cb, $35, $65        ;; 07:5f5d ????????
    db   $55, $05, $10, $c1, $f2, $ab, $cb, $f3        ;; 07:5f65 ????????
    db   $0b, $cb, $15, $f2, $ab, $cb, $f3, $0b        ;; 07:5f6d ????????
    db   $cb, $15, $f2, $ab, $cb, $f3, $0b, $cb        ;; 07:5f75 ????????
    db   $15, $55, $35, $f2, $a5, $f3, $00, $c1        ;; 07:5f7d ????????
    db   $f2, $8b, $cb, $ab, $cb, $f3, $05, $d9        ;; 07:5f85 ????????
    db   $cd, $08, $18, $08, $f2, $a8, $88, $a8        ;; 07:5f8d ????????
    db   $c8, $72, $f3, $0b, $cb, $1b, $cb, $35        ;; 07:5f95 ????????
    db   $d9, $cd, $38, $58, $38, $18, $0a, $de        ;; 07:5f9d ????????
    db   $ce, $08, $c8, $f2, $92, $ab, $cb, $f3        ;; 07:5fa5 ????????
    db   $0b, $cb, $15, $d9, $cd, $18, $38, $18        ;; 07:5fad ????????
    db   $08, $f2, $a8, $f3, $15, $d9, $cd, $18        ;; 07:5fb5 ????????
    db   $38, $18, $08, $f2, $a8, $f3, $12, $d9        ;; 07:5fbd ????????
    db   $cd, $18, $38, $18, $01, $f2, $5b, $cb        ;; 07:5fc5 ????????
    db   $8b, $cb, $fe, $1d, $5f                       ;; 07:5fcd ?????

data_07_5fd2:
    db   $c5, $fb, $f7, $0a, $f7, $81, $f7, $c1        ;; 07:5fd2 ????????
    db   $f7, $43, $e9, $f2, $08, $18, $08, $f1        ;; 07:5fda ????????
    db   $a8, $fc, $d4, $5f, $fb, $f1, $68, $f2        ;; 07:5fe2 ????????
    db   $0b, $1b, $f1, $a8, $f2, $0b, $1b, $fc        ;; 07:5fea ????????
    db   $e7, $5f, $fb, $f2, $08, $18, $08, $f1        ;; 07:5ff2 ????????
    db   $a8, $fc, $f5, $5f, $fb, $f1, $68, $f2        ;; 07:5ffa ????????
    db   $0b, $1b, $f1, $ab, $f2, $0b, $1b, $6b        ;; 07:6002 ????????
    db   $fc, $ff, $5f, $f7, $05, $f7, $82, $f7        ;; 07:600a ????????
    db   $cb, $f3, $08, $f2, $88, $38, $88, $a8        ;; 07:6012 ????????
    db   $68, $38, $68, $98, $58, $38, $58, $98        ;; 07:601a ????????
    db   $58, $38, $58, $f7, $81, $a8, $58, $18        ;; 07:6022 ????????
    db   $a8, $98, $58, $18, $98, $88, $58, $18        ;; 07:602a ????????
    db   $88, $78, $38, $f1, $a8, $f2, $38, $f7        ;; 07:6032 ????????
    db   $82, $78, $18, $f1, $a8, $f2, $18, $78        ;; 07:603a ????????
    db   $18, $f1, $a8, $f2, $18, $78, $18, $f1        ;; 07:6042 ????????
    db   $a8, $f2, $18, $78, $38, $f1, $a8, $f2        ;; 07:604a ????????
    db   $38, $f7, $81, $88, $38, $08, $88, $78        ;; 07:6052 ????????
    db   $38, $08, $78, $88, $38, $08, $88, $78        ;; 07:605a ????????
    db   $38, $08, $38, $f7, $80, $e7, $52, $15        ;; 07:6062 ????????
    db   $55, $32, $12, $f7, $82, $72, $35, $75        ;; 07:606a ????????
    db   $52, $32, $f9, $f7, $0a, $f7, $81, $f7        ;; 07:6072 ????????
    db   $c1, $e9, $18, $58, $18, $58, $18, $58        ;; 07:607a ????????
    db   $18, $58, $fc, $75, $60, $f7, $c0, $18        ;; 07:6082 ????????
    db   $78, $38, $78, $18, $78, $38, $78, $48        ;; 07:608a ????????
    db   $78, $28, $58, $08, $48, $f1, $a8, $f2        ;; 07:6092 ????????
    db   $28, $fe, $d3, $5f                            ;; 07:609a ????

data_07_609e:
    db   $f7, $01, $f8, $06, $ef, $c5, $f7, $ca        ;; 07:609e ????????
    db   $f9, $f0, $58, $f1, $5b, $cb, $f0, $58        ;; 07:60a6 ????????
    db   $f1, $5b, $cb, $f0, $18, $f1, $1b, $cb        ;; 07:60ae ????????
    db   $f0, $18, $f1, $1b, $cb, $f0, $38, $f1        ;; 07:60b6 ????????
    db   $3b, $cb, $f0, $38, $f1, $3b, $cb, $f0        ;; 07:60be ????????
    db   $58, $f1, $5b, $cb, $f0, $58, $f1, $5b        ;; 07:60c6 ????????
    db   $cb, $f0, $68, $f1, $1b, $cb, $f0, $68        ;; 07:60ce ????????
    db   $f1, $1b, $cb, $f0, $68, $f1, $1b, $cb        ;; 07:60d6 ????????
    db   $f0, $68, $f1, $1b, $cb, $f0, $68, $f1        ;; 07:60de ????????
    db   $1b, $cb, $f0, $68, $f1, $1b, $cb, $f0        ;; 07:60e6 ????????
    db   $68, $f1, $1b, $cb, $f0, $68, $f1, $1b        ;; 07:60ee ????????
    db   $cb, $fc, $a7, $60, $f0, $88, $f1, $8b        ;; 07:60f6 ????????
    db   $cb, $f0, $88, $f1, $8b, $cb, $f0, $68        ;; 07:60fe ????????
    db   $f1, $6b, $cb, $f0, $68, $f1, $6b, $cb        ;; 07:6106 ????????
    db   $f0, $58, $f1, $5b, $cb, $f0, $58, $f1        ;; 07:610e ????????
    db   $5b, $cb, $f0, $58, $f1, $5b, $cb, $f0        ;; 07:6116 ????????
    db   $58, $f1, $5b, $cb, $f0, $a8, $f1, $ab        ;; 07:611e ????????
    db   $cb, $f0, $a8, $f1, $ab, $cb, $f0, $98        ;; 07:6126 ????????
    db   $f1, $9b, $cb, $f0, $98, $f1, $9b, $cb        ;; 07:612e ????????
    db   $f0, $88, $f1, $8b, $cb, $f0, $88, $f1        ;; 07:6136 ????????
    db   $8b, $cb, $f0, $78, $f1, $7b, $cb, $f0        ;; 07:613e ????????
    db   $78, $f1, $7b, $cb, $f0, $38, $f1, $3b        ;; 07:6146 ????????
    db   $cb, $f0, $38, $f1, $3b, $cb, $f0, $48        ;; 07:614e ????????
    db   $f1, $4b, $cb, $f0, $48, $f1, $4b, $cb        ;; 07:6156 ????????
    db   $f0, $58, $f1, $5b, $cb, $f0, $58, $f1        ;; 07:615e ????????
    db   $5b, $cb, $f0, $78, $f1, $7b, $cb, $f0        ;; 07:6166 ????????
    db   $78, $f1, $7b, $cb, $f0, $88, $f1, $8b        ;; 07:616e ????????
    db   $cb, $f0, $88, $f1, $8b, $cb, $f0, $78        ;; 07:6176 ????????
    db   $f1, $7b, $cb, $f0, $78, $f1, $7b, $cb        ;; 07:617e ????????
    db   $f0, $58, $f1, $5b, $cb, $f0, $58, $f1        ;; 07:6186 ????????
    db   $5b, $cb, $f0, $38, $f1, $3b, $cb, $f0        ;; 07:618e ????????
    db   $38, $f1, $3b, $cb, $f0, $18, $f1, $1b        ;; 07:6196 ????????
    db   $cb, $f0, $18, $f1, $1b, $cb, $f0, $18        ;; 07:619e ????????
    db   $f1, $1b, $cb, $f0, $18, $f1, $1b, $cb        ;; 07:61a6 ????????
    db   $f0, $38, $f1, $3b, $cb, $f0, $38, $f1        ;; 07:61ae ????????
    db   $3b, $cb, $f0, $38, $f1, $3b, $cb, $f0        ;; 07:61b6 ????????
    db   $38, $f1, $3b, $cb, $f0, $08, $f1, $0b        ;; 07:61be ????????
    db   $cb, $f0, $08, $f1, $0b, $cb, $f0, $08        ;; 07:61c6 ????????
    db   $f1, $0b, $cb, $f0, $08, $f1, $0b, $cb        ;; 07:61ce ????????
    db   $f0, $58, $f1, $5b, $cb, $f0, $58, $f1        ;; 07:61d6 ????????
    db   $5b, $cb, $f0, $58, $f1, $5b, $cb, $f0        ;; 07:61de ????????
    db   $58, $f1, $5b, $cb, $f0, $a8, $f1, $ab        ;; 07:61e6 ????????
    db   $cb, $f0, $a8, $f1, $ab, $cb, $f0, $a8        ;; 07:61ee ????????
    db   $f1, $ab, $cb, $f0, $a8, $f1, $ab, $cb        ;; 07:61f6 ????????
    db   $f0, $88, $f1, $8b, $cb, $f0, $88, $f1        ;; 07:61fe ????????
    db   $8b, $cb, $f0, $88, $f1, $8b, $cb, $f0        ;; 07:6206 ????????
    db   $88, $f1, $8b, $cb, $f0, $38, $f1, $3b        ;; 07:620e ????????
    db   $cb, $f0, $38, $f1, $3b, $cb, $f0, $38        ;; 07:6216 ????????
    db   $f1, $3b, $cb, $f0, $38, $f1, $3b, $cb        ;; 07:621e ????????
    db   $f0, $08, $f1, $0b, $cb, $f0, $08, $f1        ;; 07:6226 ????????
    db   $0b, $cb, $f0, $08, $f1, $0b, $cb, $f0        ;; 07:622e ????????
    db   $08, $f1, $0b, $cb, $fe, $a4, $60             ;; 07:6236 ???????

data_07_623d:
    db   $f7, $c0, $f7, $01, $f7, $48, $f8, $03        ;; 07:623d ????????
    db   $ef, $fb, $c0, $fc, $47, $62, $f2, $51        ;; 07:6245 ????????
    db   $db, $dc, $ce, $5c, $8c, $f3, $0c, $52        ;; 07:624d ????????
    db   $05, $35, $22, $f2, $a2, $d1, $c5, $a1        ;; 07:6255 ????????
    db   $db, $dc, $ce, $ac, $f3, $1c, $5c, $a2        ;; 07:625d ????????
    db   $55, $85, $70, $d1, $c5, $51, $db, $dc        ;; 07:6265 ????????
    db   $ce, $5b, $7b, $82, $75, $55, $33, $58        ;; 07:626d ????????
    db   $72, $d3, $db, $dc, $ce, $75, $85, $a3        ;; 07:6275 ????????
    db   $58, $d0, $f4, $05, $f3, $a5, $70, $c0        ;; 07:627d ????????
    db   $fe, $4b, $62                                 ;; 07:6285 ???

data_07_6288:
    db   $f7, $08, $f7, $82, $f7, $c0, $f7, $43        ;; 07:6288 ????????
    db   $ec, $fb, $f1, $ab, $ab, $ab, $ab, $f2        ;; 07:6290 ????????
    db   $1b, $f1, $ab, $ab, $ab, $f2, $3b, $f1        ;; 07:6298 ????????
    db   $ab, $ab, $ab, $f2, $1b, $f1, $ab, $8b        ;; 07:62a0 ????????
    db   $f2, $0b, $fc, $92, $62, $f7, $c4, $0b        ;; 07:62a8 ????????
    db   $0b, $0b, $0b, $3b, $0b, $0b, $0b, $5b        ;; 07:62b0 ????????
    db   $0b, $0b, $0b, $3b, $0b, $0b, $0b, $0b        ;; 07:62b8 ????????
    db   $0b, $0b, $0b, $3b, $0b, $0b, $0b, $5b        ;; 07:62c0 ????????
    db   $0b, $0b, $0b, $3b, $0b, $0b, $0b, $2b        ;; 07:62c8 ????????
    db   $2b, $2b, $2b, $5b, $2b, $2b, $2b, $7b        ;; 07:62d0 ????????
    db   $2b, $2b, $2b, $5b, $2b, $2b, $2b, $2b        ;; 07:62d8 ????????
    db   $2b, $2b, $2b, $5b, $2b, $2b, $2b, $7b        ;; 07:62e0 ????????
    db   $2b, $2b, $2b, $5b, $2b, $2b, $2b, $5b        ;; 07:62e8 ????????
    db   $5b, $5b, $5b, $8b, $5b, $5b, $5b, $ab        ;; 07:62f0 ????????
    db   $5b, $5b, $5b, $8b, $5b, $5b, $5b, $5b        ;; 07:62f8 ????????
    db   $5b, $5b, $5b, $8b, $5b, $5b, $5b, $ab        ;; 07:6300 ????????
    db   $5b, $5b, $5b, $8b, $5b, $5b, $5b, $7b        ;; 07:6308 ????????
    db   $7b, $7b, $7b, $ab, $7b, $7b, $7b, $f3        ;; 07:6310 ????????
    db   $0b, $f2, $7b, $7b, $7b, $ab, $7b, $7b        ;; 07:6318 ????????
    db   $7b, $7b, $7b, $7b, $7b, $ab, $7b, $7b        ;; 07:6320 ????????
    db   $7b, $f3, $0b, $f2, $7b, $7b, $7b, $ab        ;; 07:6328 ????????
    db   $7b, $7b, $7b, $f7, $05, $f3, $13, $03        ;; 07:6330 ????????
    db   $f2, $a5, $d8, $83, $a5, $f3, $15, $02        ;; 07:6338 ????????
    db   $d8, $f2, $7b, $8b, $ab, $f3, $0b, $f2        ;; 07:6340 ????????
    db   $ab, $8b, $72, $f3, $35, $55, $13, $03        ;; 07:6348 ????????
    db   $f2, $a5, $d8, $83, $a5, $f3, $05, $f7        ;; 07:6350 ????????
    db   $08, $f7, $c3, $f2, $7b, $7b, $7b, $7b        ;; 07:6358 ????????
    db   $ab, $7b, $7b, $7b, $f3, $0b, $f2, $7b        ;; 07:6360 ????????
    db   $7b, $7b, $ab, $7b, $7b, $7b, $f3, $0b        ;; 07:6368 ????????
    db   $f2, $7b, $7b, $7b, $ab, $7b, $7b, $7b        ;; 07:6370 ????????
    db   $8b, $7b, $f3, $0b, $f2, $7b, $7b, $7b        ;; 07:6378 ????????
    db   $ab, $7b, $fe, $ad, $62                       ;; 07:6380 ?????

data_07_6385:
    db   $e0, $36, $f7, $0a, $f7, $82, $f7, $c0        ;; 07:6385 ????????
    db   $f7, $40, $eb, $fb, $f0, $38, $f1, $5b        ;; 07:638d ????????
    db   $6b, $f0, $38, $f1, $5b, $6b, $f0, $38        ;; 07:6395 ????????
    db   $f1, $5b, $6b, $f0, $38, $f1, $5b, $6b        ;; 07:639d ????????
    db   $fc, $91, $63, $f7, $c3, $f0, $58, $f1        ;; 07:63a5 ????????
    db   $7b, $8b, $f0, $58, $f1, $7b, $8b, $f0        ;; 07:63ad ????????
    db   $58, $f1, $7b, $8b, $08, $2b, $3b, $f0        ;; 07:63b5 ????????
    db   $58, $f1, $7b, $8b, $f0, $58, $f1, $7b        ;; 07:63bd ????????
    db   $8b, $f0, $58, $f1, $7b, $8b, $08, $2b        ;; 07:63c5 ????????
    db   $3b, $f0, $78, $f1, $9b, $ab, $f0, $78        ;; 07:63cd ????????
    db   $f1, $9b, $ab, $f0, $78, $f1, $9b, $ab        ;; 07:63d5 ????????
    db   $28, $4b, $5b, $f0, $78, $f1, $9b, $ab        ;; 07:63dd ????????
    db   $f0, $78, $f1, $9b, $ab, $f0, $78, $f1        ;; 07:63e5 ????????
    db   $9b, $ab, $28, $4b, $5b, $f0, $a8, $f2        ;; 07:63ed ????????
    db   $0b, $1b, $f0, $a8, $f2, $0b, $1b, $f0        ;; 07:63f5 ????????
    db   $a8, $f2, $0b, $1b, $f1, $58, $7b, $8b        ;; 07:63fd ????????
    db   $f0, $a8, $f2, $0b, $1b, $f0, $a8, $f2        ;; 07:6405 ????????
    db   $0b, $1b, $f0, $a8, $f2, $0b, $1b, $f1        ;; 07:640d ????????
    db   $58, $7b, $8b, $08, $f2, $2b, $3b, $f1        ;; 07:6415 ????????
    db   $08, $f2, $2b, $3b, $f1, $08, $f2, $2b        ;; 07:641d ????????
    db   $3b, $f1, $78, $9b, $ab, $08, $f2, $2b        ;; 07:6425 ????????
    db   $3b, $f1, $08, $f2, $2b, $3b, $f1, $08        ;; 07:642d ????????
    db   $f2, $2b, $3b, $f1, $78, $9b, $ab, $f7        ;; 07:6435 ????????
    db   $c5, $18, $f2, $0b, $1b, $f1, $18, $f2        ;; 07:643d ????????
    db   $0b, $1b, $f1, $18, $f2, $0b, $1b, $f1        ;; 07:6445 ????????
    db   $88, $ab, $f2, $0b, $f1, $18, $f2, $0b        ;; 07:644d ????????
    db   $1b, $f1, $18, $f2, $0b, $1b, $f1, $18        ;; 07:6455 ????????
    db   $f2, $0b, $1b, $f1, $88, $ab, $f2, $0b        ;; 07:645d ????????
    db   $f1, $08, $ab, $f2, $0b, $f1, $08, $ab        ;; 07:6465 ????????
    db   $f2, $0b, $f1, $08, $ab, $f2, $0b, $f1        ;; 07:646d ????????
    db   $78, $8b, $ab, $08, $ab, $f2, $0b, $f1        ;; 07:6475 ????????
    db   $08, $ab, $f2, $0b, $f1, $08, $ab, $f2        ;; 07:647d ????????
    db   $0b, $f1, $78, $8b, $ab, $f0, $a8, $f1        ;; 07:6485 ????????
    db   $8b, $ab, $f0, $a8, $f1, $8b, $ab, $f0        ;; 07:648d ????????
    db   $a8, $f1, $8b, $ab, $58, $7b, $8b, $f0        ;; 07:6495 ????????
    db   $a8, $f1, $8b, $ab, $f0, $a8, $f1, $8b        ;; 07:649d ????????
    db   $ab, $f0, $a8, $f1, $8b, $ab, $58, $7b        ;; 07:64a5 ????????
    db   $8b, $f7, $c4, $08, $f2, $2b, $3b, $f1        ;; 07:64ad ????????
    db   $08, $f2, $2b, $3b, $f1, $08, $f2, $2b        ;; 07:64b5 ????????
    db   $3b, $f1, $78, $9b, $ab, $08, $f2, $2b        ;; 07:64bd ????????
    db   $4b, $f1, $08, $f2, $2b, $4b, $f1, $08        ;; 07:64c5 ????????
    db   $f2, $2b, $4b, $f1, $78, $9b, $ab, $fe        ;; 07:64cd ????????
    db   $a8, $63                                      ;; 07:64d5 ??

data_07_64d7:
    db   $e0, $36, $f7, $02, $f7, $82, $f7, $c3        ;; 07:64d7 ????????
    db   $f7, $43, $ef, $f3, $a5, $ac, $cc, $ac        ;; 07:64df ????????
    db   $cc, $ac, $cc, $98, $78, $58, $98, $71        ;; 07:64e7 ????????
    db   $c8, $e0, $3c, $f2, $7e, $9e, $be, $f3        ;; 07:64ef ????????
    db   $0e, $2e, $3e, $f9, $f7, $0c, $45, $45        ;; 07:64f7 ????????
    db   $28, $45, $48, $28, $45, $58, $45, $25        ;; 07:64ff ????????
    db   $fc, $fb, $64, $f9, $78, $58, $38, $55        ;; 07:6507 ????????
    db   $58, $38, $58, $fd, $1c, $65, $75, $55        ;; 07:650f ????????
    db   $35, $55, $fc, $0b, $65, $75, $55, $38        ;; 07:6517 ????????
    db   $55, $58, $fe, $fa, $64                       ;; 07:651f ?????

data_07_6524:
    db   $f7, $02, $f7, $80, $f7, $c4, $f7, $43        ;; 07:6524 ????????
    db   $ec, $f3, $25, $5a, $3a, $2a, $08, $f2        ;; 07:652c ????????
    db   $a8, $98, $f3, $08, $f2, $b1, $c5, $f9        ;; 07:6534 ????????
    db   $f7, $0c, $f3, $05, $05, $f2, $b8, $f3        ;; 07:653c ????????
    db   $05, $08, $f2, $b8, $f3, $05, $28, $05        ;; 07:6544 ????????
    db   $f2, $b5, $fc, $3c, $65, $f9, $f3, $38        ;; 07:654c ????????
    db   $18, $08, $15, $18, $08, $18, $fd, $64        ;; 07:6554 ????????
    db   $65, $35, $15, $05, $15, $fc, $52, $65        ;; 07:655c ????????
    db   $35, $15, $08, $15, $18, $fe, $3b, $65        ;; 07:6564 ????????

data_07_656c:
    db   $f7, $c0, $f7, $01, $f8, $06, $ef, $f1        ;; 07:656c ????????
    db   $35, $f2, $2a, $0a, $f1, $aa, $55, $f2        ;; 07:6574 ????????
    db   $05, $f1, $71, $c5, $fb, $f7, $ca, $f7        ;; 07:657c ????????
    db   $0a, $f1, $08, $bb, $f2, $0b, $f0, $78        ;; 07:6584 ????????
    db   $f1, $bb, $f2, $0b, $f1, $08, $bb, $f2        ;; 07:658c ????????
    db   $0b, $f0, $78, $f1, $bb, $f2, $0b, $fc        ;; 07:6594 ????????
    db   $81, $65, $fb, $f1, $18, $f2, $18, $f1        ;; 07:659c ????????
    db   $7b, $8b, $f2, $18, $f1, $18, $f2, $18        ;; 07:65a4 ????????
    db   $f1, $7b, $8b, $f2, $18, $fc, $9f, $65        ;; 07:65ac ????????
    db   $fe, $80, $65                                 ;; 07:65b4 ???

data_07_65b7:
    db   $e0, $23, $f7, $05, $f7, $82, $f7, $c0        ;; 07:65b7 ????????
    db   $f7, $43, $ef, $f4, $28, $f3, $98, $78        ;; 07:65bf ????????
    db   $98, $58, $98, $48, $98, $28, $f2, $98        ;; 07:65c7 ????????
    db   $78, $98, $58, $98, $48, $98, $f9, $f3        ;; 07:65cf ????????
    db   $53, $48, $25, $48, $58, $43, $28, $05        ;; 07:65d7 ????????
    db   $f2, $a8, $f3, $08, $fd, $f0, $65, $25        ;; 07:65df ????????
    db   $25, $25, $48, $28, $22, $12, $fc, $d6        ;; 07:65e7 ????????
    db   $65, $23, $28, $25, $05, $20, $fe, $d5        ;; 07:65ef ????????
    db   $65                                           ;; 07:65f7 ?

data_07_65f8:
    db   $f7, $c4, $f7, $03, $f8, $06, $ef, $c0        ;; 07:65f8 ????????
    db   $c0, $f9, $f2, $58, $98, $78, $98, $58        ;; 07:6600 ????????
    db   $98, $78, $98, $48, $78, $58, $78, $48        ;; 07:6608 ????????
    db   $78, $58, $78, $fd, $29, $66, $28, $58        ;; 07:6610 ????????
    db   $48, $58, $28, $88, $48, $88, $48, $98        ;; 07:6618 ????????
    db   $78, $98, $48, $78, $18, $48, $fc, $02        ;; 07:6620 ????????
    db   $66, $28, $58, $48, $58, $28, $48, $08        ;; 07:6628 ????????
    db   $48, $28, $98, $a8, $98, $78, $98, $48        ;; 07:6630 ????????
    db   $98, $fe, $01, $66                            ;; 07:6638 ????

data_07_663c:
    db   $f7, $05, $f7, $82, $f7, $c3, $f7, $43        ;; 07:663c ????????
    db   $e8, $c0, $c0, $f9, $f1, $20, $00, $f0        ;; 07:6644 ????????
    db   $a2, $f1, $42, $f0, $90, $f1, $20, $00        ;; 07:664c ????????
    db   $f0, $a2, $92, $f1, $20, $fe, $47, $66        ;; 07:6654 ????????

data_07_665c:
    db   $e0, $1e, $f7, $05, $f7, $80, $f7, $c3        ;; 07:665c ????????
    db   $f7, $43, $ef, $f2, $48, $48, $b2, $ab        ;; 07:6664 ????????
    db   $bb, $f3, $18, $f2, $b0, $f3, $48, $48        ;; 07:666c ????????
    db   $b2, $ab, $bb, $f4, $18, $f3, $b0, $f9        ;; 07:6674 ????????
    db   $f7, $c0, $f3, $82, $98, $88, $68, $98        ;; 07:667c ????????
    db   $85, $42, $f2, $b5, $f3, $05, $45, $65        ;; 07:6684 ????????
    db   $45, $fd, $95, $66, $42, $32, $fc, $7c        ;; 07:668c ????????
    db   $66, $b0, $f9, $48, $48, $b2, $ab, $bb        ;; 07:6694 ????????
    db   $f4, $18, $f3, $b5, $42, $45, $fd, $ae        ;; 07:669c ????????
    db   $66, $f4, $02, $25, $05, $f3, $b0, $fc        ;; 07:66a4 ????????
    db   $97, $66, $f4, $42, $25, $05, $f3, $b0        ;; 07:66ac ????????
    db   $fe, $7b, $66                                 ;; 07:66b4 ???

data_07_66b7:
    db   $f7, $c6, $f7, $03, $f8, $06, $ef, $c0        ;; 07:66b7 ????????
    db   $c0, $c0, $c0, $fb, $f2, $4b, $bb, $6b        ;; 07:66bf ????????
    db   $8b, $fc, $c3, $66, $fb, $4b, $bb, $6b        ;; 07:66c7 ????????
    db   $8b, $fc, $cc, $66, $fb, $4b, $bb, $6b        ;; 07:66cf ????????
    db   $7b, $fc, $d4, $66, $fb, $3b, $bb, $4b        ;; 07:66d7 ????????
    db   $6b, $fc, $dc, $66, $fe, $c2, $66             ;; 07:66df ???????

data_07_66e6:
    db   $f7, $05, $f7, $80, $f7, $c4, $f7, $44        ;; 07:66e6 ????????
    db   $ec, $c0, $f2, $48, $48, $b2, $ab, $bb        ;; 07:66ee ????????
    db   $f3, $18, $f2, $b0, $f3, $48, $48, $b2        ;; 07:66f6 ????????
    db   $ab, $bb, $f4, $18, $f7, $82, $f7, $c9        ;; 07:66fe ????????
    db   $e8, $f1, $40, $20, $00, $f0, $b0, $fe        ;; 07:6706 ????????
    db   $02, $67                                      ;; 07:670e ??

data_07_6710:
    db   $e0, $64, $f7, $02, $f7, $82, $f7, $c3        ;; 07:6710 ????????
    db   $f7, $43, $ef, $f2, $9b, $bb, $f3, $0b        ;; 07:6718 ????????
    db   $2b, $45, $db, $cb, $4b, $cb, $45, $78        ;; 07:6720 ????????
    db   $c8, $78, $c8, $55, $48, $c8, $28, $c8        ;; 07:6728 ????????
    db   $58, $c8, $41, $ff                            ;; 07:6730 ????

data_07_6734:
    db   $f7, $02, $f7, $80, $f7, $c4, $f7, $43        ;; 07:6734 ????????
    db   $ec, $c5, $f3, $05, $db, $cb, $0b, $cb        ;; 07:673c ????????
    db   $06, $cb, $08, $c8, $08, $c8, $08, $c8        ;; 07:6744 ????????
    db   $08, $c8, $f2, $a8, $c8, $f3, $18, $c8        ;; 07:674c ????????
    db   $01, $ff                                      ;; 07:6754 ??

data_07_6756:
    db   $f7, $c0, $f7, $01, $f8, $06, $ef, $c5        ;; 07:6756 ????????
    db   $f2, $75, $db, $cb, $7b, $cb, $75, $b8        ;; 07:675e ????????
    db   $c8, $b8, $c8, $98, $c8, $78, $c8, $58        ;; 07:6766 ????????
    db   $c8, $88, $c8, $71, $ff                       ;; 07:676e ?????

data_07_6773:
    db   $f7, $05, $f7, $80, $f7, $c3, $f7, $47        ;; 07:6773 ????????
    db   $ef, $e0, $2d, $f2, $98, $f3, $08, $78        ;; 07:677b ????????
    db   $e0, $23, $6c, $5c, $4c, $e0, $1e, $38        ;; 07:6783 ????????
    db   $f4, $08, $f3, $93, $dd, $ff                  ;; 07:678b ??????

data_07_6791:
    db   $f7, $05, $f7, $80, $f7, $c4, $f7, $42        ;; 07:6791 ????????
    db   $ec, $cd, $f2, $98, $f3, $08, $78, $6c        ;; 07:6799 ????????
    db   $5c, $4c, $38, $f4, $08, $f3, $93, $ff        ;; 07:67a1 ????????

data_07_67a9:
    db   $ff                                           ;; 07:67a9 ?

data_07_67aa:
    db   $e0, $23, $f7, $05, $f7, $80, $f7, $c0        ;; 07:67aa ????????
    db   $f7, $46, $ef, $f3, $08, $f2, $b8, $f9        ;; 07:67b2 ????????
    db   $f3, $08, $b8, $f2, $b8, $f3, $08, $98        ;; 07:67ba ????????
    db   $f2, $b8, $f3, $08, $78, $fd, $da, $67        ;; 07:67c2 ????????
    db   $f2, $b8, $f3, $08, $68, $f2, $b8, $f3        ;; 07:67ca ????????
    db   $08, $48, $08, $f2, $b8, $fc, $ba, $67        ;; 07:67d2 ????????
    db   $f2, $b8, $f3, $08, $68, $f2, $b8, $f3        ;; 07:67da ????????
    db   $08, $48, $f2, $a8, $98, $f9, $f2, $a8        ;; 07:67e2 ????????
    db   $f3, $98, $f2, $98, $a8, $f3, $78, $f2        ;; 07:67ea ????????
    db   $98, $a8, $f3, $58, $fd, $09, $68, $f2        ;; 07:67f2 ????????
    db   $98, $a8, $f3, $48, $f2, $98, $a8, $f3        ;; 07:67fa ????????
    db   $28, $f2, $a8, $98, $fc, $e8, $67, $f2        ;; 07:6802 ????????
    db   $98, $a8, $f3, $48, $f2, $98, $a8, $f3        ;; 07:680a ????????
    db   $28, $08, $f2, $b8, $fe, $b9, $67             ;; 07:6812 ???????

data_07_6819:
    db   $f7, $0a, $f7, $81, $f7, $43, $e9, $c5        ;; 07:6819 ????????
    db   $fa, $f7, $c1, $f2, $45, $35, $45, $35        ;; 07:6821 ????????
    db   $fc, $22, $68, $45, $35, $45, $25, $fa        ;; 07:6829 ????????
    db   $25, $15, $25, $15, $fc, $31, $68, $25        ;; 07:6831 ????????
    db   $15, $25, $45, $fe, $21, $68                  ;; 07:6839 ??????

data_07_683f:
    db   $f7, $03, $f8, $03, $ef, $c5, $fb, $f7        ;; 07:683f ????????
    db   $c6, $f1, $98, $f2, $06, $cb, $08, $f1        ;; 07:6847 ????????
    db   $98, $f2, $06, $cb, $08, $fc, $46, $68        ;; 07:684f ????????
    db   $fa, $f1, $78, $a6, $cb, $a8, $78, $a6        ;; 07:6857 ????????
    db   $cb, $a8, $fc, $58, $68, $78, $a6, $cb        ;; 07:685f ????????
    db   $a8, $78, $a6, $cb, $f2, $28, $fe, $45        ;; 07:6867 ????????
    db   $68                                           ;; 07:686f ?

data_07_6870:
    db   $8a, $68, $93, $68, $96, $68, $9b, $68        ;; 07:6870 ????????
    db   $9e, $68, $a1, $68, $a8, $68, $b1, $68        ;; 07:6878 ????????
    db   $ba, $68, $bf, $68, $c4, $68, $c9, $68        ;; 07:6880 ????????
    db   $ce, $68, $18, $6e, $30, $e8, $54, $e7        ;; 07:6888 ????????
    db   $ff, $08, $01, $ff, $f8, $00, $60, $f7        ;; 07:6890 ????????
    db   $ff, $08, $00, $ff, $88, $00, $ff, $48        ;; 07:6898 ????????
    db   $00, $28, $6c, $54, $f7, $ff, $00, $01        ;; 07:68a0 ????????
    db   $0a, $3c, $28, $c8, $54, $c7, $ff, $08        ;; 07:68a8 ????????
    db   $01, $22, $a7, $32, $20, $20, $27, $ff        ;; 07:68b0 ????????
    db   $08, $01, $ff, $a1, $ff, $08, $00, $ff        ;; 07:68b8 ????????
    db   $a2, $ff, $08, $00, $06, $f8, $ff, $08        ;; 07:68c0 ????????
    db   $00, $08, $f8, $ff, $08, $00, $ff, $a4        ;; 07:68c8 ????????
    db   $ff, $08, $00                                 ;; 07:68d0 ???

data_07_68d3:
    db   $e5, $68, $e9, $68, $f3, $68, $fb, $68        ;; 07:68d3 ????????
    db   $03, $69, $0b, $69, $13, $69, $1d, $69        ;; 07:68db ????????
    db   $23, $69, $ff, $00, $00, $00, $03, $01        ;; 07:68e3 ????????
    db   $03, $00, $03, $ff, $03, $00, $00, $00        ;; 07:68eb ????????
    db   $02, $ff, $02, $fe, $02, $fd, $00, $00        ;; 07:68f3 ????????
    db   $14, $00, $03, $01, $03, $00, $00, $02        ;; 07:68fb ????????
    db   $10, $00, $02, $00, $02, $ff, $00, $02        ;; 07:6903 ????????
    db   $14, $00, $03, $00, $03, $ff, $00, $02        ;; 07:690b ????????
    db   $02, $00, $02, $ff, $02, $00, $02, $01        ;; 07:6913 ????????
    db   $00, $00, $02, $00, $02, $01, $00, $00        ;; 07:691b ????????
    db   $0e, $00, $03, $01, $03, $00, $03, $ff        ;; 07:6923 ????????
    db   $03, $00, $00, $02                            ;; 07:692b ????

data_07_692f:
    db   $4b, $69, $4e, $69, $52, $69, $56, $69        ;; 07:692f ????????
    db   $59, $69, $5c, $69, $65, $69, $6f, $69        ;; 07:6937 ????????
    db   $79, $69, $80, $69, $86, $69, $8c, $69        ;; 07:693f ????????
    db   $96, $69, $9a, $69, $fc, $00, $00, $58        ;; 07:6947 ????????
    db   $98, $00, $00, $98, $58, $00, $00, $94        ;; 07:694f ????????
    db   $00, $00, $68, $00, $00, $cc, $8c, $cc        ;; 07:6957 ????????
    db   $8c, $cc, $8c, $98, $00, $00, $b0, $f0        ;; 07:695f ????????
    db   $70, $f0, $70, $f0, $b0, $f0, $00, $00        ;; 07:6967 ????????
    db   $98, $58, $d8, $98, $58, $98, $58, $d8        ;; 07:696f ????????
    db   $00, $00, $72, $52, $dc, $b2, $ae, $00        ;; 07:6977 ????????
    db   $00, $b2, $ae, $72, $6e, $00, $00, $cc        ;; 07:697f ????????
    db   $4c, $cc, $8c, $00, $00, $72, $6e, $72        ;; 07:6987 ????????
    db   $6e, $b2, $ae, $b2, $ae, $00, $00, $d8        ;; 07:698f ????????
    db   $58, $00, $00, $b2, $ae, $b2, $ae, $b0        ;; 07:6997 ????????
    db   $8c, $64, $e4, $a4, $72, $6e, $72, $6e        ;; 07:699f ????????
    db   $70, $4c, $64, $e4, $a4, $00, $00             ;; 07:69a7 ???????

data_07_69ae:
    db   $b4, $69, $b7, $69, $ba, $69, $bc, $00        ;; 07:69ae ????????
    db   $00, $3c, $00, $00, $7c, $00, $00             ;; 07:69b6 ???????

;@data format=bbbbbbbbbbbbbbbb amount=8
wavePatternsData:
    db   $da, $c9, $b8, $a8, $68, $57, $46, $38, $da, $c9, $b8, $a8, $68, $57, $46, $38 ;; 07:69bd ???????????????? $00
    db   $00, $00, $55, $55, $aa, $aa, $ff, $ff, $00, $00, $55, $55, $aa, $aa, $ff, $ff ;; 07:69cd ???????????????? $01
    db   $fa, $52, $02, $5a, $fa, $52, $02, $5a, $fa, $52, $02, $5a, $fa, $52, $02, $5a ;; 07:69dd ???????????????? $02
    db   $01, $23, $45, $67, $89, $ab, $cd, $ef, $01, $23, $45, $67, $89, $ab, $cd, $ef ;; 07:69ed ???????????????? $03
    db   $dd, $dd, $dd, $dd, $33, $33, $33, $33, $dd, $dd, $dd, $dd, $33, $33, $33, $33 ;; 07:69fd ???????????????? $04
    db   $dd, $dd, $33, $33, $33, $33, $33, $33, $dd, $dd, $33, $33, $33, $33, $33, $33 ;; 07:6a0d ???????????????? $05
    db   $8b, $cd, $d8, $d8, $38, $33, $45, $88, $8b, $cd, $d8, $d8, $38, $33, $45, $88 ;; 07:6a1d ???????????????? $06
    db   $23, $45, $66, $78, $88, $9a, $ab, $cd, $23, $45, $66, $78, $88, $9a, $ab, $cd ;; 07:6a2d ???????????????? $07

call_07_6a3d:
    ld   A, [HL+]                                      ;; 07:6a3d $2a
    ld   [DE], A                                       ;; 07:6a3e $12
    inc  DE                                            ;; 07:6a3f $13
    dec  C                                             ;; 07:6a40 $0d
    jr   NZ, call_07_6a3d                              ;; 07:6a41 $20 $fa
    ret                                                ;; 07:6a43 $c9

call_07_6a44:
    ldh  A, [hFFE2]                                    ;; 07:6a44 $f0 $e2
    cp   A, $00                                        ;; 07:6a46 $fe $00
    jr   Z, .jr_07_6a72                                ;; 07:6a48 $28 $28
    ldh  A, [hFFE3]                                    ;; 07:6a4a $f0 $e3
    cp   A, $00                                        ;; 07:6a4c $fe $00
    jr   NZ, .jr_07_6a69                               ;; 07:6a4e $20 $19
    ldh  A, [hFFEA]                                    ;; 07:6a50 $f0 $ea
    ld   [wCEC0], A                                    ;; 07:6a52 $ea $c0 $ce
    ldh  A, [hCurrentMusic]                            ;; 07:6a55 $f0 $e0
    ld   [wCEC1], A                                    ;; 07:6a57 $ea $c1 $ce
    ld   A, $01                                        ;; 07:6a5a $3e $01
    ldh  [hFFE3], A                                    ;; 07:6a5c $e0 $e3
    ld   C, $60                                        ;; 07:6a5e $0e $60
    ld   HL, wCE00                                     ;; 07:6a60 $21 $00 $ce
    ld   DE, wCE60                                     ;; 07:6a63 $11 $60 $ce
    call call_07_6a3d                                  ;; 07:6a66 $cd $3d $6a
.jr_07_6a69:
    ldh  A, [hFFE2]                                    ;; 07:6a69 $f0 $e2
    ldh  [hCurrentMusic], A                            ;; 07:6a6b $e0 $e0
    sub  A, A                                          ;; 07:6a6d $97
    ldh  [hFFE2], A                                    ;; 07:6a6e $e0 $e2
    ldh  [hPlayingMusic], A                            ;; 07:6a70 $e0 $e1
.jr_07_6a72:
    ldh  A, [hFFE3]                                    ;; 07:6a72 $f0 $e3
    cp   A, $00                                        ;; 07:6a74 $fe $00
    jr   Z, .jr_07_6aa7                                ;; 07:6a76 $28 $2f
    ld   A, [wCE00]                                    ;; 07:6a78 $fa $00 $ce
    ld   E, A                                          ;; 07:6a7b $5f
    ld   A, [wCE20]                                    ;; 07:6a7c $fa $20 $ce
    ld   D, A                                          ;; 07:6a7f $57
    ld   A, [wCE40]                                    ;; 07:6a80 $fa $40 $ce
    ld   C, A                                          ;; 07:6a83 $4f
    ld   A, $80                                        ;; 07:6a84 $3e $80
    and  A, C                                          ;; 07:6a86 $a1
    and  A, D                                          ;; 07:6a87 $a2
    and  A, E                                          ;; 07:6a88 $a3
    cp   A, $00                                        ;; 07:6a89 $fe $00
    jr   Z, .jr_07_6aa7                                ;; 07:6a8b $28 $1a
    ld   C, $60                                        ;; 07:6a8d $0e $60
    ld   HL, wCE60                                     ;; 07:6a8f $21 $60 $ce
    ld   DE, wCE00                                     ;; 07:6a92 $11 $00 $ce
    call call_07_6a3d                                  ;; 07:6a95 $cd $3d $6a
    ld   A, [wCEC0]                                    ;; 07:6a98 $fa $c0 $ce
    ldh  [hFFEA], A                                    ;; 07:6a9b $e0 $ea
    ld   A, [wCEC1]                                    ;; 07:6a9d $fa $c1 $ce
    ldh  [hCurrentMusic], A                            ;; 07:6aa0 $e0 $e0
    ldh  [hPlayingMusic], A                            ;; 07:6aa2 $e0 $e1
    sub  A, A                                          ;; 07:6aa4 $97
    ldh  [hFFE3], A                                    ;; 07:6aa5 $e0 $e3
.jr_07_6aa7:
    ret                                                ;; 07:6aa7 $c9

soundEffectPlay:
    ldh  A, [hSFX]                                     ;; 07:6aa8 $f0 $e4
    cp   A, $00                                        ;; 07:6aaa $fe $00
    jr   Z, .jr_07_6adf                                ;; 07:6aac $28 $31
    dec  A                                             ;; 07:6aae $3d
    add  A, A                                          ;; 07:6aaf $87
    ld   B, A                                          ;; 07:6ab0 $47
    ld   E, A                                          ;; 07:6ab1 $5f
    ld   D, $00                                        ;; 07:6ab2 $16 $00
    ld   HL, soundEffectDataChannel1                   ;; 07:6ab4 $21 $c7 $6b
    add  HL, DE                                        ;; 07:6ab7 $19
    ld   A, [HL+]                                      ;; 07:6ab8 $2a
    ldh  [hFFEB], A                                    ;; 07:6ab9 $e0 $eb
    ld   A, [HL]                                       ;; 07:6abb $7e
    ldh  [hFFEC], A                                    ;; 07:6abc $e0 $ec
    ld   A, B                                          ;; 07:6abe $78
    ld   E, A                                          ;; 07:6abf $5f
    ld   D, $00                                        ;; 07:6ac0 $16 $00
    ld   HL, soundEffectDataChannel4                   ;; 07:6ac2 $21 $0f $6c
    add  HL, DE                                        ;; 07:6ac5 $19
    ld   A, [HL+]                                      ;; 07:6ac6 $2a
    ldh  [hFFED], A                                    ;; 07:6ac7 $e0 $ed
    ld   A, [HL]                                       ;; 07:6ac9 $7e
    ldh  [hFFEE], A                                    ;; 07:6aca $e0 $ee
    ld   HL, wCE00                                     ;; 07:6acc $21 $00 $ce
    set  0, [HL]                                       ;; 07:6acf $cb $c6
    ld   A, $01                                        ;; 07:6ad1 $3e $01
    ld   [wCEC7], A                                    ;; 07:6ad3 $ea $c7 $ce
    ld   [wCEC3], A                                    ;; 07:6ad6 $ea $c3 $ce
    ld   [wCEC4], A                                    ;; 07:6ad9 $ea $c4 $ce
    sub  A, A                                          ;; 07:6adc $97
    ldh  [hSFX], A                                     ;; 07:6add $e0 $e4
.jr_07_6adf:
    ld   A, [wCE00]                                    ;; 07:6adf $fa $00 $ce
    bit  0, A                                          ;; 07:6ae2 $cb $47
    call NZ, call_07_6af0                              ;; 07:6ae4 $c4 $f0 $6a
    ld   A, [wCEC7]                                    ;; 07:6ae7 $fa $c7 $ce
    bit  0, A                                          ;; 07:6aea $cb $47
    call NZ, call_07_6b51                              ;; 07:6aec $c4 $51 $6b
    ret                                                ;; 07:6aef $c9

call_07_6af0:
    ld   HL, wCEC3                                     ;; 07:6af0 $21 $c3 $ce
    dec  [HL]                                          ;; 07:6af3 $35
    ret  NZ                                            ;; 07:6af4 $c0
    ldh  A, [rNR51]                                    ;; 07:6af5 $f0 $25
    or   A, $11                                        ;; 07:6af7 $f6 $11
    ldh  [rNR51], A                                    ;; 07:6af9 $e0 $25
.jr_07_6afb:
    ldh  A, [hFFEB]                                    ;; 07:6afb $f0 $eb
    ld   L, A                                          ;; 07:6afd $6f
    ldh  A, [hFFEC]                                    ;; 07:6afe $f0 $ec
    ld   H, A                                          ;; 07:6b00 $67
.jr_07_6b01:
    ld   A, [HL]                                       ;; 07:6b01 $7e
    and  A, $f0                                        ;; 07:6b02 $e6 $f0
    cp   A, $e0                                        ;; 07:6b04 $fe $e0
    jr   NZ, .jr_07_6b10                               ;; 07:6b06 $20 $08
    ld   A, [HL+]                                      ;; 07:6b08 $2a
    and  A, $0f                                        ;; 07:6b09 $e6 $0f
    ld   [wCEC5], A                                    ;; 07:6b0b $ea $c5 $ce
    jr   .jr_07_6b01                                   ;; 07:6b0e $18 $f1
.jr_07_6b10:
    cp   A, $f0                                        ;; 07:6b10 $fe $f0
    jr   NZ, .jr_07_6b2a                               ;; 07:6b12 $20 $16
    ld   A, [wCEC5]                                    ;; 07:6b14 $fa $c5 $ce
    dec  A                                             ;; 07:6b17 $3d
    ld   [wCEC5], A                                    ;; 07:6b18 $ea $c5 $ce
    inc  HL                                            ;; 07:6b1b $23
    jr   Z, .jr_07_6b26                                ;; 07:6b1c $28 $08
    ld   A, [HL+]                                      ;; 07:6b1e $2a
    ldh  [hFFEB], A                                    ;; 07:6b1f $e0 $eb
    ld   A, [HL+]                                      ;; 07:6b21 $2a
    ldh  [hFFEC], A                                    ;; 07:6b22 $e0 $ec
    jr   .jr_07_6afb                                   ;; 07:6b24 $18 $d5
.jr_07_6b26:
    inc  HL                                            ;; 07:6b26 $23
    inc  HL                                            ;; 07:6b27 $23
    jr   .jr_07_6b01                                   ;; 07:6b28 $18 $d7
.jr_07_6b2a:
    ld   A, [HL+]                                      ;; 07:6b2a $2a
    cp   A, $00                                        ;; 07:6b2b $fe $00
    jr   NZ, .jr_07_6b47                               ;; 07:6b2d $20 $18
    ld   HL, wCE00                                     ;; 07:6b2f $21 $00 $ce
    res  0, [HL]                                       ;; 07:6b32 $cb $86
    ld   C, $10                                        ;; 07:6b34 $0e $10
    sub  A, A                                          ;; 07:6b36 $97
    ldh  [C], A                                        ;; 07:6b37 $e2
    inc  C                                             ;; 07:6b38 $0c
    ldh  A, [rNR51]                                    ;; 07:6b39 $f0 $25
    and  A, $ee                                        ;; 07:6b3b $e6 $ee
    ldh  [rNR51], A                                    ;; 07:6b3d $e0 $25
    ld   HL, wCE18                                     ;; 07:6b3f $21 $18 $ce
    ld   DE, hFFEB                                     ;; 07:6b42 $11 $eb $ff
    jr   jr_07_6bb3                                    ;; 07:6b45 $18 $6c
.jr_07_6b47:
    ld   [wCEC3], A                                    ;; 07:6b47 $ea $c3 $ce
    ld   C, $10                                        ;; 07:6b4a $0e $10
    ld   DE, hFFEB                                     ;; 07:6b4c $11 $eb $ff
    jr   jr_07_6bb0                                    ;; 07:6b4f $18 $5f

call_07_6b51:
    ld   HL, wCEC4                                     ;; 07:6b51 $21 $c4 $ce
    dec  [HL]                                          ;; 07:6b54 $35
    ret  NZ                                            ;; 07:6b55 $c0
    ldh  A, [rNR51]                                    ;; 07:6b56 $f0 $25
    or   A, $88                                        ;; 07:6b58 $f6 $88
    ldh  [rNR51], A                                    ;; 07:6b5a $e0 $25
.jr_07_6b5c:
    ldh  A, [hFFED]                                    ;; 07:6b5c $f0 $ed
    ld   L, A                                          ;; 07:6b5e $6f
    ldh  A, [hFFEE]                                    ;; 07:6b5f $f0 $ee
    ld   H, A                                          ;; 07:6b61 $67
.jr_07_6b62:
    ld   A, [HL]                                       ;; 07:6b62 $7e
    and  A, $f0                                        ;; 07:6b63 $e6 $f0
    cp   A, $e0                                        ;; 07:6b65 $fe $e0
    jr   NZ, .jr_07_6b71                               ;; 07:6b67 $20 $08
    ld   A, [HL+]                                      ;; 07:6b69 $2a
    and  A, $0f                                        ;; 07:6b6a $e6 $0f
    ld   [wCEC6], A                                    ;; 07:6b6c $ea $c6 $ce
    jr   .jr_07_6b62                                   ;; 07:6b6f $18 $f1
.jr_07_6b71:
    cp   A, $f0                                        ;; 07:6b71 $fe $f0
    jr   NZ, .jr_07_6b8b                               ;; 07:6b73 $20 $16
    ld   A, [wCEC6]                                    ;; 07:6b75 $fa $c6 $ce
    dec  A                                             ;; 07:6b78 $3d
    ld   [wCEC6], A                                    ;; 07:6b79 $ea $c6 $ce
    inc  HL                                            ;; 07:6b7c $23
    jr   Z, .jr_07_6b87                                ;; 07:6b7d $28 $08
    ld   A, [HL+]                                      ;; 07:6b7f $2a
    ldh  [hFFED], A                                    ;; 07:6b80 $e0 $ed
    ld   A, [HL+]                                      ;; 07:6b82 $2a
    ldh  [hFFEE], A                                    ;; 07:6b83 $e0 $ee
    jr   .jr_07_6b5c                                   ;; 07:6b85 $18 $d5
.jr_07_6b87:
    inc  HL                                            ;; 07:6b87 $23
    inc  HL                                            ;; 07:6b88 $23
    jr   .jr_07_6b62                                   ;; 07:6b89 $18 $d7
.jr_07_6b8b:
    ld   A, [HL+]                                      ;; 07:6b8b $2a
    cp   A, $00                                        ;; 07:6b8c $fe $00
    jr   NZ, .jr_07_6b9b                               ;; 07:6b8e $20 $0b
    sub  A, A                                          ;; 07:6b90 $97
    ld   [wCEC7], A                                    ;; 07:6b91 $ea $c7 $ce
    ldh  A, [rNR51]                                    ;; 07:6b94 $f0 $25
    and  A, $77                                        ;; 07:6b96 $e6 $77
    ldh  [rNR51], A                                    ;; 07:6b98 $e0 $25
    ret                                                ;; 07:6b9a $c9
.jr_07_6b9b:
    ld   [wCEC4], A                                    ;; 07:6b9b $ea $c4 $ce
    ld   C, $20                                        ;; 07:6b9e $0e $20
    sub  A, A                                          ;; 07:6ba0 $97
    ldh  [C], A                                        ;; 07:6ba1 $e2
    inc  C                                             ;; 07:6ba2 $0c
    ld   DE, hFFED                                     ;; 07:6ba3 $11 $ed $ff
    ld   B, $02                                        ;; 07:6ba6 $06 $02
    call call_07_6bc0                                  ;; 07:6ba8 $cd $c0 $6b
    ld   A, $80                                        ;; 07:6bab $3e $80
    ldh  [C], A                                        ;; 07:6bad $e2
    jr   jr_07_6bb8                                    ;; 07:6bae $18 $08

jr_07_6bb0:
    ld   A, [HL+]                                      ;; 07:6bb0 $2a
    ldh  [C], A                                        ;; 07:6bb1 $e2
    inc  C                                             ;; 07:6bb2 $0c

jr_07_6bb3:
    ld   B, $04                                        ;; 07:6bb3 $06 $04
    call call_07_6bc0                                  ;; 07:6bb5 $cd $c0 $6b

jr_07_6bb8:
    push HL                                            ;; 07:6bb8 $e5
    push DE                                            ;; 07:6bb9 $d5
    pop  HL                                            ;; 07:6bba $e1
    pop  DE                                            ;; 07:6bbb $d1
    ld   [HL], E                                       ;; 07:6bbc $73
    inc  HL                                            ;; 07:6bbd $23
    ld   [HL], D                                       ;; 07:6bbe $72
    ret                                                ;; 07:6bbf $c9

call_07_6bc0:
    ld   A, [HL+]                                      ;; 07:6bc0 $2a
    ldh  [C], A                                        ;; 07:6bc1 $e2
    inc  C                                             ;; 07:6bc2 $0c
    dec  B                                             ;; 07:6bc3 $05
    jr   NZ, call_07_6bc0                              ;; 07:6bc4 $20 $fa
    ret                                                ;; 07:6bc6 $c9

;@data format=p amount=36
soundEffectDataChannel1:
    dw   data_07_6c58                                  ;; 07:6bc7 ?? $00
    dw   data_07_6c65                                  ;; 07:6bc9 ?? $01
    dw   soundEffectChannelUnused                      ;; 07:6bcb ?? $02
    dw   soundEffectChannelUnused                      ;; 07:6bcd ?? $03
    dw   soundEffectChannelUnused                      ;; 07:6bcf ?? $04
    dw   soundEffectChannelUnused                      ;; 07:6bd1 ?? $05
    dw   soundEffectChannelUnused                      ;; 07:6bd3 ?? $06
    dw   soundEffectChannelUnused                      ;; 07:6bd5 ?? $07
    dw   data_07_6cad                                  ;; 07:6bd7 ?? $08
    dw   data_07_6cb8                                  ;; 07:6bd9 ?? $09
    dw   data_07_6cbf                                  ;; 07:6bdb ?? $0a
    dw   soundEffectChannelUnused                      ;; 07:6bdd ?? $0b
    dw   soundEffectChannelUnused                      ;; 07:6bdf ?? $0c
    dw   soundEffectChannelUnused                      ;; 07:6be1 ?? $0d
    dw   soundEffectChannelUnused                      ;; 07:6be3 ?? $0e
    dw   soundEffectChannelUnused                      ;; 07:6be5 ?? $0f
    dw   data_07_6cf9                                  ;; 07:6be7 ?? $10
    dw   soundEffectChannelUnused                      ;; 07:6be9 ?? $11
    dw   data_07_6d04                                  ;; 07:6beb ?? $12
    dw   soundEffectChannelUnused                      ;; 07:6bed ?? $13
    dw   data_07_6d1c                                  ;; 07:6bef ?? $14
    dw   data_07_6d2f                                  ;; 07:6bf1 ?? $15
    dw   data_07_6d42                                  ;; 07:6bf3 ?? $16
    dw   data_07_6d49                                  ;; 07:6bf5 ?? $17
    dw   data_07_6d5d                                  ;; 07:6bf7 ?? $18
    dw   data_07_6d72                                  ;; 07:6bf9 ?? $19
    dw   data_07_6d8b                                  ;; 07:6bfb ?? $1a
    dw   data_07_6d96                                  ;; 07:6bfd ?? $1b
    dw   soundEffectChannelUnused                      ;; 07:6bff ?? $1c
    dw   data_07_6dad                                  ;; 07:6c01 ?? $1d
    dw   soundEffectChannelUnused                      ;; 07:6c03 ?? $1e
    dw   soundEffectChannelUnused                      ;; 07:6c05 ?? $1f
    dw   soundEffectChannelUnused                      ;; 07:6c07 ?? $20
    dw   soundEffectChannelUnused                      ;; 07:6c09 ?? $21
    dw   data_07_6de0                                  ;; 07:6c0b ?? $22
    dw   data_07_6de7                                  ;; 07:6c0d ?? $23

;@data format=p amount=36
soundEffectDataChannel4:
    dw   soundEffectChannelUnused                      ;; 07:6c0f ?? $00
    dw   data_07_6c72                                  ;; 07:6c11 ?? $01
    dw   data_07_6c79                                  ;; 07:6c13 ?? $02
    dw   data_07_6c80                                  ;; 07:6c15 ?? $03
    dw   data_07_6c87                                  ;; 07:6c17 ?? $04
    dw   data_07_6c91                                  ;; 07:6c19 ?? $05
    dw   data_07_6c98                                  ;; 07:6c1b ?? $06
    dw   data_07_6ca3                                  ;; 07:6c1d ?? $07
    dw   data_07_6cb4                                  ;; 07:6c1f ?? $08
    dw   soundEffectChannelUnused                      ;; 07:6c21 ?? $09
    dw   data_07_6cc6                                  ;; 07:6c23 ?? $0a
    dw   data_07_6cca                                  ;; 07:6c25 ?? $0b
    dw   data_07_6cd4                                  ;; 07:6c27 ?? $0c
    dw   data_07_6cdf                                  ;; 07:6c29 ?? $0d
    dw   data_07_6ce6                                  ;; 07:6c2b ?? $0e
    dw   data_07_6cf1                                  ;; 07:6c2d ?? $0f
    dw   soundEffectChannelUnused                      ;; 07:6c2f ?? $10
    dw   data_07_6d00                                  ;; 07:6c31 ?? $11
    dw   data_07_6d0b                                  ;; 07:6c33 ?? $12
    dw   data_07_6d12                                  ;; 07:6c35 ?? $13
    dw   soundEffectChannelUnused                      ;; 07:6c37 ?? $14
    dw   data_07_6d3a                                  ;; 07:6c39 ?? $15
    dw   soundEffectChannelUnused                      ;; 07:6c3b ?? $16
    dw   data_07_6d56                                  ;; 07:6c3d ?? $17
    dw   data_07_6d68                                  ;; 07:6c3f ?? $18
    dw   data_07_6d7d                                  ;; 07:6c41 ?? $19
    dw   data_07_6d92                                  ;; 07:6c43 ?? $1a
    dw   soundEffectChannelUnused                      ;; 07:6c45 ?? $1b
    dw   data_07_6da3                                  ;; 07:6c47 ?? $1c
    dw   data_07_6dba                                  ;; 07:6c49 ?? $1d
    dw   data_07_6dc1                                  ;; 07:6c4b ?? $1e
    dw   data_07_6dc5                                  ;; 07:6c4d ?? $1f
    dw   data_07_6dcc                                  ;; 07:6c4f ?? $20
    dw   data_07_6dd6                                  ;; 07:6c51 ?? $21
    dw   soundEffectChannelUnused                      ;; 07:6c53 ?? $22
    dw   data_07_6df2                                  ;; 07:6c55 ?? $23

soundEffectChannelUnused:
    db   $00                                           ;; 07:6c57 ?

data_07_6c58:
    db   $02, $00, $40, $fa, $a0, $87, $10, $00        ;; 07:6c58 ????????
    db   $00, $a2, $e0, $87, $00                       ;; 07:6c60 ?????

data_07_6c65:
    db   $06, $71, $00, $87, $80, $83, $20, $17        ;; 07:6c65 ????????
    db   $80, $a6, $ff, $85, $00                       ;; 07:6c6d ?????

data_07_6c72:
    db   $1f, $ff, $5f, $14, $a4, $07, $00             ;; 07:6c72 ???????

data_07_6c79:
    db   $02, $81, $1f, $16, $ff, $6a, $00             ;; 07:6c79 ???????

data_07_6c80:
    db   $04, $8a, $50, $30, $f7, $37, $00             ;; 07:6c80 ???????

data_07_6c87:
    db   $02, $ca, $6a, $08, $fc, $7c, $30, $a7        ;; 07:6c87 ????????
    db   $35, $00                                      ;; 07:6c8f ??

data_07_6c91:
    db   $14, $c7, $65, $06, $ff, $40, $00             ;; 07:6c91 ???????

data_07_6c98:
    db   $e6, $03, $fb, $5e, $04, $fd, $22, $f0        ;; 07:6c98 ????????
    db   $99, $6c, $00                                 ;; 07:6ca0 ???

data_07_6ca3:
    db   $04, $cd, $32, $12, $8f, $6d, $04, $fa        ;; 07:6ca3 ????????
    db   $3f, $00                                      ;; 07:6cab ??

data_07_6cad:
    db   $60, $27, $00, $ff, $00, $82, $00             ;; 07:6cad ???????

data_07_6cb4:
    db   $60, $58, $41, $00                            ;; 07:6cb4 ????

data_07_6cb8:
    db   $1a, $37, $80, $fd, $50, $87, $00             ;; 07:6cb8 ???????

data_07_6cbf:
    db   $06, $25, $00, $f0, $55, $86, $00             ;; 07:6cbf ???????

data_07_6cc6:
    db   $10, $f2, $07, $00                            ;; 07:6cc6 ????

data_07_6cca:
    db   $09, $fb, $5d, $16, $c5, $6e, $16, $92        ;; 07:6cca ????????
    db   $6e, $00                                      ;; 07:6cd2 ??

data_07_6cd4:
    db   $e8, $03, $f1, $69, $01, $01, $5a, $f0        ;; 07:6cd4 ????????
    db   $d5, $6c, $00                                 ;; 07:6cdc ???

data_07_6cdf:
    db   $1a, $f4, $37, $20, $f7, $10, $00             ;; 07:6cdf ???????

data_07_6ce6:
    db   $e4, $05, $f8, $08, $0f, $a7, $07, $f0        ;; 07:6ce6 ????????
    db   $e7, $6c, $00                                 ;; 07:6cee ???

data_07_6cf1:
    db   $e8, $0a, $fc, $17, $f0, $f2, $6c, $00        ;; 07:6cf1 ????????

data_07_6cf9:
    db   $1e, $27, $80, $ff, $b0, $86, $00             ;; 07:6cf9 ???????

data_07_6d00:
    db   $15, $92, $5e, $00                            ;; 07:6d00 ????

data_07_6d04:
    db   $03, $1f, $c0, $e7, $99, $87, $00             ;; 07:6d04 ???????

data_07_6d0b:
    db   $04, $d2, $07, $05, $71, $02, $00             ;; 07:6d0b ???????

data_07_6d12:
    db   $03, $f1, $6c, $01, $32, $11, $27, $f2        ;; 07:6d12 ????????
    db   $32, $00                                      ;; 07:6d1a ??

data_07_6d1c:
    db   $16, $57, $80, $f7, $f7, $86, $16, $47        ;; 07:6d1c ????????
    db   $80, $94, $f7, $86, $16, $37, $80, $55        ;; 07:6d24 ????????
    db   $f7, $86, $00                                 ;; 07:6d2c ???

data_07_6d2f:
    db   $e6, $21, $75, $80, $a8, $87, $80, $f0        ;; 07:6d2f ????????
    db   $30, $6d, $00                                 ;; 07:6d37 ???

data_07_6d3a:
    db   $e6, $21, $c1, $6f, $f0, $3b, $6d, $00        ;; 07:6d3a ????????

data_07_6d42:
    db   $20, $25, $80, $ad, $1a, $87, $00             ;; 07:6d42 ???????

data_07_6d49:
    db   $06, $33, $00, $a1, $5a, $84, $05, $14        ;; 07:6d49 ????????
    db   $c0, $f1, $ff, $85, $00                       ;; 07:6d51 ?????

data_07_6d56:
    db   $03, $fa, $4e, $07, $a2, $24, $00             ;; 07:6d56 ???????

data_07_6d5d:
    db   $e4, $20, $37, $40, $c7, $40, $85, $f0        ;; 07:6d5d ????????
    db   $5e, $6d, $00                                 ;; 07:6d65 ???

data_07_6d68:
    db   $80, $00, $00, $06, $ff, $17, $16, $f9        ;; 07:6d68 ????????
    db   $51, $00                                      ;; 07:6d70 ??

data_07_6d72:
    db   $e3, $23, $4d, $00, $d1, $00, $85, $f0        ;; 07:6d72 ????????
    db   $73, $6d, $00                                 ;; 07:6d7a ???

data_07_6d7d:
    db   $e3, $13, $91, $2b, $08, $91, $2a, $08        ;; 07:6d7d ????????
    db   $91, $2a, $f0, $7e, $6d, $00                  ;; 07:6d85 ??????

data_07_6d8b:
    db   $26, $00, $80, $a7, $00, $85, $00             ;; 07:6d8b ???????

data_07_6d92:
    db   $06, $f7, $5f, $00                            ;; 07:6d92 ????

data_07_6d96:
    db   $10, $5c, $80, $f7, $00, $87, $20, $37        ;; 07:6d96 ????????
    db   $00, $f2, $b0, $86, $00                       ;; 07:6d9e ?????

data_07_6da3:
    db   $06, $8a, $5c, $08, $fc, $7f, $30, $b5        ;; 07:6da3 ????????
    db   $67, $00                                      ;; 07:6dab ??

data_07_6dad:
    db   $04, $4e, $c0, $f0, $ff, $86, $05, $26        ;; 07:6dad ????????
    db   $40, $90, $0e, $87, $00                       ;; 07:6db5 ?????

data_07_6dba:
    db   $06, $f0, $12, $08, $f1, $32, $00             ;; 07:6dba ???????

data_07_6dc1:
    db   $4a, $f7, $90, $00                            ;; 07:6dc1 ????

data_07_6dc5:
    db   $02, $fc, $5c, $0c, $f4, $57, $00             ;; 07:6dc5 ???????

data_07_6dcc:
    db   $0a, $f7, $80, $08, $f7, $40, $20, $e3        ;; 07:6dcc ????????
    db   $37, $00                                      ;; 07:6dd4 ??

data_07_6dd6:
    db   $0a, $f7, $31, $20, $f7, $11, $0f, $f2        ;; 07:6dd6 ????????
    db   $08, $00                                      ;; 07:6dde ??

data_07_6de0:
    db   $10, $23, $00, $f0, $10, $82, $00             ;; 07:6de0 ???????

data_07_6de7:
    db   $e4, $0d, $35, $00, $29, $01, $85, $f0        ;; 07:6de7 ????????
    db   $e8, $6d, $00                                 ;; 07:6def ???

data_07_6df2:
    db   $e4, $0d, $39, $5c, $f0, $f3, $6d, $00        ;; 07:6df2 ????????
    db   $02, $00, $20, $00, $00, $00, $c3, $ac        ;; 07:6dfa ????????
    db   $71, $c3, $0f, $6e, $c3, $6d, $77, $c3        ;; 07:6e02 ????????
    db   $9c, $77, $c3, $da, $74, $e0, $d5, $a7        ;; 07:6e0a ????????
    db   $c8, $cd, $be, $74, $f0, $b2, $6f, $26        ;; 07:6e12 ????????
    db   $00, $01, $01, $77, $cd, $67, $00, $3e        ;; 07:6e1a ????????
    db   $06, $cd, $1d, $02, $e6, $c0, $17, $d0        ;; 07:6e22 ????????
    db   $ea, $3c, $d8, $17, $3e, $01, $30, $03        ;; 07:6e2a ????????
    db   $fa, $0c, $d8, $ea, $3b, $d8, $f0, $b1        ;; 07:6e32 ????????
    db   $fe, $04, $d8, $cd, $8c, $01, $21, $50        ;; 07:6e3a ????????
    db   $76, $11, $00, $80, $01, $00, $04, $3e        ;; 07:6e42 ????????
    db   $03, $cd, $15, $02, $f0, $d5, $cb, $37        ;; 07:6e4a ????????
    db   $e6, $0f, $c4, $af, $77, $cd, $60, $6e        ;; 07:6e52 ????????
    db   $cd, $8c, $01, $d7, $df, $c9, $af, $ea        ;; 07:6e5a ????????
    db   $28, $c4, $f0, $d5, $e6, $0f, $c8, $3d        ;; 07:6e62 ????????
    db   $01, $00, $7c, $cd, $7c, $71, $7e, $a7        ;; 07:6e6a ????????
    db   $c8, $cb, $37, $e6, $0f, $ea, $3d, $d8        ;; 07:6e72 ????????
    db   $2a, $e6, $0f, $3c, $ea, $3e, $d8, $ea        ;; 07:6e7a ????????
    db   $3f, $d8, $cd, $85, $71, $cd, $8e, $71        ;; 07:6e82 ????????
    db   $cd, $97, $71, $cd, $a8, $6e, $21, $3e        ;; 07:6e8a ????????
    db   $d8, $35, $20, $f7, $23, $3a, $32, $35        ;; 07:6e92 ????????
    db   $20, $eb, $cd, $a0, $71, $18, $cf, $cd        ;; 07:6e9a ????????
    db   $a0, $71, $2a, $c3, $97, $71, $cd, $a1        ;; 07:6ea2 ????????
    db   $6e, $4f, $e6, $3f, $ea, $40, $d8, $79        ;; 07:6eaa ????????
    db   $07, $07, $e6, $03, $20, $04, $79, $c3        ;; 07:6eb2 ????????
    db   $d1, $77, $3d, $28, $16, $3d, $28, $5c        ;; 07:6eba ????????
    db   $3e, $01, $e0, $f6, $11, $00, $00, $21        ;; 07:6ec2 ????????
    db   $00, $c0, $cd, $1a, $71, $cd, $dc, $70        ;; 07:6eca ????????
    db   $d7, $df, $c9, $01, $00, $03, $fa, $3c        ;; 07:6ed2 ????????
    db   $d8, $a7, $20, $09, $f0, $b1, $21, $80        ;; 07:6eda ????????
    db   $df, $c7, $4e, $06, $01, $cd, $a0, $71        ;; 07:6ee2 ????????
    db   $cd, $97, $71, $c5, $e5, $79, $87, $21        ;; 07:6eea ????????
    db   $ea, $d3, $c7, $7e, $a7, $28, $01, $3c        ;; 07:6ef2 ????????
    db   $e0, $f6, $21, $28, $d8, $79, $c7, $7e        ;; 07:6efa ????????
    db   $d6, $02, $87, $87, $87, $5f, $16, $18        ;; 07:6f02 ????????
    db   $79, $21, $a9, $71, $c7, $6e, $26, $c0        ;; 07:6f0a ????????
    db   $cd, $1a, $71, $e1, $c1, $0c, $05, $20        ;; 07:6f12 ????????
    db   $cf, $c3, $dc, $70, $cd, $a0, $71, $2b        ;; 07:6f1a ????????
    db   $11, $61, $d8, $01, $71, $d8, $fa, $3e        ;; 07:6f22 ????????
    db   $d8, $e0, $d0, $2a, $e6, $3f, $02, $03        ;; 07:6f2a ????????
    db   $c5, $cd, $4b, $00, $46, $23, $23, $23        ;; 07:6f32 ????????
    db   $05, $20, $fb, $c1, $f0, $d0, $3d, $e0        ;; 07:6f3a ????????
    db   $d0, $20, $e8, $cd, $85, $71, $fa, $3d        ;; 07:6f42 ????????
    db   $d8, $ea, $76, $d8, $21, $69, $d8, $af        ;; 07:6f4a ????????
    db   $22, $22, $22, $77, $ea, $75, $d8, $21        ;; 07:6f52 ????????
    db   $6d, $d8, $3d, $22, $22, $22, $77, $cd        ;; 07:6f5a ????????
    db   $8c, $01, $fa, $3d, $d8, $a7, $28, $1f        ;; 07:6f62 ????????
    db   $fa, $76, $d8, $a7, $28, $19, $fa, $75        ;; 07:6f6a ????????
    db   $d8, $4f, $21, $6d, $d8, $c7, $7e, $fe        ;; 07:6f72 ????????
    db   $ff, $20, $0c, $34, $cd, $04, $70, $7e        ;; 07:6f7a ????????
    db   $cd, $ef, $6f, $21, $76, $d8, $35, $cd        ;; 07:6f82 ????????
    db   $69, $70, $cd, $eb, $70, $fa, $3e, $d8        ;; 07:6f8a ????????
    db   $5f, $47, $0e, $00, $c5, $79, $21, $69        ;; 07:6f92 ????????
    db   $d8, $c7, $7e, $a7, $28, $25, $35, $20        ;; 07:6f9a ????????
    db   $22, $79, $21, $6d, $d8, $c7, $34, $7e        ;; 07:6fa2 ????????
    db   $bb, $20, $0a, $36, $ff, $21, $3d, $d8        ;; 07:6faa ????????
    db   $7e, $a7, $28, $0f, $35, $cd, $ef, $6f        ;; 07:6fb2 ????????
    db   $fa, $75, $d8, $3c, $bb, $20, $01, $af        ;; 07:6fba ????????
    db   $ea, $75, $d8, $c1, $0c, $05, $20, $cc        ;; 07:6fc2 ????????
    db   $21, $69, $d8, $fa, $3e, $d8, $47, $af        ;; 07:6fca ????????
    db   $b6, $23, $05, $20, $fb, $a7, $c2, $61        ;; 07:6fd2 ????????
    db   $6f, $fa, $3d, $d8, $a7, $c2, $61, $6f        ;; 07:6fda ????????
    db   $cd, $8c, $01, $d7, $df, $cd, $8e, $71        ;; 07:6fe2 ????????
    db   $e8, $02, $c3, $70, $6e, $f5, $c5, $d5        ;; 07:6fea ????????
    db   $e5, $21, $71, $d8, $c7, $cd, $0b, $00        ;; 07:6ff2 ????????
    db   $79, $21, $69, $d8, $c7, $1a, $77, $c3        ;; 07:6ffa ????????
    db   $13, $00, $f5, $c5, $d5, $e5, $11, $0d        ;; 07:7002 ????????
    db   $d8, $21, $41, $d8, $cd, $1d, $70, $11        ;; 07:700a ????????
    db   $10, $d8, $21, $51, $d8, $cd, $1d, $70        ;; 07:7012 ????????
    db   $c3, $13, $00, $c5, $79, $87, $87, $c7        ;; 07:701a ????????
    db   $cd, $0b, $00, $01, $00, $03, $fa, $3c        ;; 07:7022 ????????
    db   $d8, $a7, $20, $0b, $f0, $b1, $e5, $21        ;; 07:702a ????????
    db   $80, $df, $c7, $4e, $e1, $06, $01, $79        ;; 07:7032 ????????
    db   $87, $e5, $21, $ea, $d3, $c7, $7e, $e1        ;; 07:703a ????????
    db   $a7, $28, $09, $3c, $28, $06, $79, $cd        ;; 07:7042 ????????
    db   $54, $70, $12, $13, $0c, $05, $20, $e7        ;; 07:704a ????????
    db   $c1, $c9, $d5, $e5, $c7, $5e, $1d, $1d        ;; 07:7052 ????????
    db   $3e, $06, $c7, $56, $af, $cd, $6b, $01        ;; 07:705a ????????
    db   $82, $87, $87, $87, $e1, $d1, $c9, $af        ;; 07:7062 ????????
    db   $e0, $f5, $21, $00, $c0, $11, $dc, $ff        ;; 07:706a ????????
    db   $cd, $4b, $00, $cd, $73, $71, $fa, $3b        ;; 07:7072 ????????
    db   $d8, $47, $c5, $fa, $3e, $d8, $47, $af        ;; 07:707a ????????
    db   $e0, $f4, $c5, $f0, $f4, $21, $6d, $d8        ;; 07:7082 ????????
    db   $c7, $7e, $fe, $ff, $28, $23, $87, $21        ;; 07:708a ????????
    db   $61, $d8, $c7, $2a, $66, $6f, $cd, $97        ;; 07:7092 ????????
    db   $71, $21, $41, $d8, $cd, $d2, $70, $5e        ;; 07:709a ????????
    db   $21, $51, $d8, $cd, $d2, $70, $56, $cd        ;; 07:70a2 ????????
    db   $6a, $71, $3e, $01, $e0, $f6, $cd, $1a        ;; 07:70aa ????????
    db   $71, $c1, $21, $f4, $ff, $34, $05, $20        ;; 07:70b2 ????????
    db   $c9, $21, $dc, $ff, $e5, $2a, $66, $6f        ;; 07:70ba ????????
    db   $3e, $34, $c7, $d1, $cd, $4b, $00, $21        ;; 07:70c2 ????????
    db   $f5, $ff, $34, $c1, $05, $20, $ab, $c9        ;; 07:70ca ????????
    db   $f0, $f5, $47, $f0, $f4, $87, $87, $80        ;; 07:70d2 ????????
    db   $c7, $c9, $fa, $40, $d8, $47, $c5, $cd        ;; 07:70da ????????
    db   $eb, $70, $c1, $05, $20, $f8, $c3, $8c        ;; 07:70e2 ????????
    db   $01, $cd, $f4, $70, $d7, $3e, $c1, $c3        ;; 07:70ea ????????
    db   $80, $ff, $06, $a0, $21, $00, $c0, $16        ;; 07:70f2 ????????
    db   $c1, $fa, $28, $c4, $5f, $c6, $28, $b8        ;; 07:70fa ????????
    db   $20, $01, $af, $ea, $28, $c4, $1c, $1d        ;; 07:7102 ????????
    db   $28, $0b, $78, $93, $47, $cd, $8f, $00        ;; 07:710a ????????
    db   $58, $3e, $a0, $95, $47, $c3, $8f, $00        ;; 07:7112 ????????
    db   $7a, $e0, $d0, $7b, $e0, $d1, $c5, $cd        ;; 07:711a ????????
    db   $73, $71, $cd, $a1, $6e, $47, $e0, $d4        ;; 07:7122 ????????
    db   $c5, $cd, $a1, $6e, $87, $21, $1e, $7c        ;; 07:712a ????????
    db   $c7, $f0, $d0, $86, $57, $23, $f0, $d1        ;; 07:7132 ????????
    db   $86, $5f, $cd, $a1, $6e, $47, $e6, $c0        ;; 07:713a ????????
    db   $cb, $3f, $4f, $f0, $f6, $a7, $28, $0c        ;; 07:7142 ????????
    db   $78, $e6, $3f, $cd, $6a, $71, $cd, $5c        ;; 07:714a ????????
    db   $71, $cd, $73, $71, $c1, $05, $20, $d0        ;; 07:7152 ????????
    db   $c1, $c9, $f5, $7a, $c6, $10, $22, $7b        ;; 07:715a ????????
    db   $c6, $08, $22, $f1, $22, $71, $23, $c9        ;; 07:7162 ????????
    db   $f5, $f0, $d2, $6f, $f0, $d3, $67, $f1        ;; 07:716a ????????
    db   $c9, $f5, $7d, $e0, $d2, $7c, $e0, $d3        ;; 07:7172 ????????
    db   $f1, $c9, $6f, $26, $00, $29, $09, $2a        ;; 07:717a ????????
    db   $66, $6f, $c9, $f5, $7d, $e0, $f0, $7c        ;; 07:7182 ????????
    db   $e0, $f1, $f1, $c9, $f5, $f0, $f0, $6f        ;; 07:718a ????????
    db   $f0, $f1, $67, $f1, $c9, $f5, $7d, $e0        ;; 07:7192 ????????
    db   $f2, $7c, $e0, $f3, $f1, $c9, $f5, $f0        ;; 07:719a ????????
    db   $f2, $6f, $f0, $f3, $67, $f1, $c9, $00        ;; 07:71a2 ????????
    db   $34, $68, $3e, $05, $e0, $e4, $cd, $8c        ;; 07:71aa ????????
    db   $01, $d7, $df, $3e, $80, $e0, $40, $af        ;; 07:71b2 ????????
    db   $e0, $42, $e0, $43, $3e, $0a, $21, $32        ;; 07:71ba ????????
    db   $d8, $06, $04, $cd, $7c, $00, $06, $04        ;; 07:71c2 ????????
    db   $cd, $7b, $00, $21, $80, $df, $06, $20        ;; 07:71ca ????????
    db   $cd, $7b, $00, $e0, $d0, $21, $84, $df        ;; 07:71d2 ????????
    db   $11, $ea, $d3, $0e, $03, $1a, $13, $13        ;; 07:71da ????????
    db   $fe, $ff, $28, $09, $47, $f0, $d0, $cd        ;; 07:71e2 ????????
    db   $7c, $00, $3c, $e0, $d0, $0d, $20, $ed        ;; 07:71ea ????????
    db   $21, $e9, $d3, $11, $00, $d8, $06, $06        ;; 07:71f2 ????????
    db   $cd, $8f, $00, $cd, $be, $74, $21, $00        ;; 07:71fa ????????
    db   $d8, $11, $09, $06, $0e, $3a, $fa, $0c        ;; 07:7202 ????????
    db   $d8, $47, $2a, $23, $e5, $c5, $cd, $cb        ;; 07:720a ????????
    db   $01, $6a, $70, $6b, $71, $c1, $69, $77        ;; 07:7212 ????????
    db   $e1, $0c, $1c, $14, $05, $20, $eb, $fa        ;; 07:721a ????????
    db   $3a, $d8, $21, $d7, $74, $c7, $7e, $e0        ;; 07:7222 ????????
    db   $e0, $21, $00, $79, $11, $00, $c6, $01        ;; 07:722a ????????
    db   $00, $01, $3e, $02, $cd, $07, $02, $21        ;; 07:7232 ????????
    db   $0c, $d8, $46, $2e, $06, $11, $0d, $d8        ;; 07:723a ????????
    db   $2a, $e5, $87, $21, $c8, $c6, $c7, $2a        ;; 07:7242 ????????
    db   $12, $13, $13, $13, $7e, $12, $1b, $1b        ;; 07:724a ????????
    db   $e1, $05, $20, $ec, $21, $0c, $d8, $46        ;; 07:7252 ????????
    db   $2e, $06, $11, $19, $d8, $2a, $e5, $21        ;; 07:725a ????????
    db   $ea, $c6, $c7, $2a, $12, $13, $e1, $05        ;; 07:7262 ????????
    db   $20, $f3, $cd, $ae, $74, $11, $0d, $13        ;; 07:726a ????????
    db   $2a, $e5, $26, $d8, $6b, $4e, $cb, $39        ;; 07:7272 ????????
    db   $91, $6a, $77, $1c, $14, $e1, $05, $20        ;; 07:727a ????????
    db   $ef, $21, $0c, $d8, $46, $2e, $06, $11        ;; 07:7282 ????????
    db   $16, $d8, $2a, $e5, $21, $e5, $c6, $c7        ;; 07:728a ????????
    db   $7e, $e1, $12, $13, $05, $20, $f3, $11        ;; 07:7292 ????????
    db   $06, $d8, $21, $0c, $d8, $46, $2e, $1c        ;; 07:729a ????????
    db   $05, $3e, $80, $77, $28, $0f, $1a, $13        ;; 07:72a2 ????????
    db   $e5, $21, $ea, $c6, $c7, $7e, $e1, $86        ;; 07:72aa ????????
    db   $23, $77, $05, $20, $f1, $cd, $ae, $74        ;; 07:72b2 ????????
    db   $11, $28, $d8, $06, $03, $cd, $8f, $00        ;; 07:72ba ????????
    db   $21, $10, $d8, $11, $2b, $d8, $06, $03        ;; 07:72c2 ????????
    db   $d5, $cd, $8f, $00, $e1, $06, $03, $11        ;; 07:72ca ????????
    db   $16, $d8, $cb, $3e, $1a, $86, $22, $13        ;; 07:72d2 ????????
    db   $05, $20, $f7, $cd, $ae, $74, $11, $2e        ;; 07:72da ????????
    db   $d8, $06, $03, $2a, $d6, $03, $12, $13        ;; 07:72e2 ????????
    db   $05, $20, $f8, $21, $0c, $d8, $46, $11        ;; 07:72ea ????????
    db   $1f, $06, $0e, $19, $c5, $d5, $26, $d8        ;; 07:72f2 ????????
    db   $69, $4e, $6a, $7e, $87, $21, $d2, $c6        ;; 07:72fa ????????
    db   $c7, $2a, $66, $6f, $e5, $26, $d8, $6a        ;; 07:7302 ????????
    db   $2c, $2c, $2c, $6e, $61, $cd, $5f, $01        ;; 07:730a ????????
    db   $cd, $5e, $00, $c1, $09, $4d, $44, $26        ;; 07:7312 ????????
    db   $d8, $6b, $71, $23, $70, $d1, $c1, $0c        ;; 07:731a ????????
    db   $1c, $1c, $14, $05, $20, $ce, $21, $32        ;; 07:7322 ????????
    db   $d8, $06, $04, $3e, $0a, $cd, $7c, $00        ;; 07:732a ????????
    db   $06, $04, $cd, $7b, $00, $e0, $d0, $f0        ;; 07:7332 ????????
    db   $d0, $6f, $cd, $ce, $01, $01, $00, $08        ;; 07:733a ????????
    db   $21, $da, $c3, $79, $c7, $7e, $3c, $28        ;; 07:7342 ????????
    db   $20, $f0, $d0, $21, $32, $d8, $c7, $5d        ;; 07:734a ????????
    db   $54, $21, $36, $d8, $c7, $79, $e6, $03        ;; 07:7352 ????????
    db   $87, $c6, $0a, $12, $79, $fe, $04, $30        ;; 07:735a ????????
    db   $04, $36, $00, $18, $02, $36, $04, $06        ;; 07:7362 ????????
    db   $01, $0c, $05, $20, $d3, $f0, $d0, $3c        ;; 07:736a ????????
    db   $e0, $d0, $fe, $04, $20, $c1, $21, $0c        ;; 07:7372 ????????
    db   $d8, $46, $0e, $00, $11, $00, $88, $c5        ;; 07:737a ????????
    db   $21, $19, $d8, $7d, $81, $6f, $46, $79        ;; 07:7382 ????????
    db   $87, $c6, $1f, $6f, $2a, $66, $6f, $e5        ;; 07:738a ????????
    db   $68, $26, $00, $cd, $5e, $00, $4d, $44        ;; 07:7392 ????????
    db   $e1, $d7, $d7, $3e, $04, $cd, $15, $02        ;; 07:739a ????????
    db   $c1, $0c, $05, $20, $da, $21, $00, $7f        ;; 07:73a2 ????????
    db   $11, $00, $8f, $06, $00, $3e, $02, $cd        ;; 07:73aa ????????
    db   $0e, $02, $cd, $8c, $01, $cd, $a7, $01        ;; 07:73b2 ????????
    db   $06, $a0, $3e, $7f, $21, $00, $d9, $cd        ;; 07:73ba ????????
    db   $7c, $00, $fa, $0c, $d8, $5f, $7b, $3d        ;; 07:73c2 ????????
    db   $cd, $9a, $74, $26, $d9, $e5, $21, $0d        ;; 07:73ca ????????
    db   $d8, $c7, $4e, $23, $23, $23, $46, $21        ;; 07:73d2 ????????
    db   $1c, $d8, $c7, $7e, $e1, $51, $4a, $22        ;; 07:73da ????????
    db   $3c, $0d, $20, $fb, $f5, $3e, $14, $92        ;; 07:73e2 ????????
    db   $c7, $f1, $05, $20, $f1, $1d, $20, $d6        ;; 07:73ea ????????
    db   $3e, $7f, $01, $00, $08, $21, $00, $98        ;; 07:73f2 ????????
    db   $cd, $ac, $00, $21, $00, $d9, $11, $00        ;; 07:73fa ????????
    db   $98, $01, $08, $14, $cd, $86, $01, $3e        ;; 07:7402 ????????
    db   $98, $ea, $77, $d8, $d7, $df, $3e, $e3        ;; 07:740a ????????
    db   $e0, $40, $3e, $07, $e0, $4b, $af, $e0        ;; 07:7412 ????????
    db   $4a, $21, $00, $d9, $06, $40, $3e, $07        ;; 07:741a ????????
    db   $cd, $7c, $00, $21, $00, $da, $06, $40        ;; 07:7422 ????????
    db   $3e, $07, $1e, $57, $cd, $6b, $01, $d6        ;; 07:742a ????????
    db   $57, $22, $05, $20, $f3, $cd, $d7, $01        ;; 07:7432 ????????
    db   $cd, $dd, $01, $21, $00, $d9, $7e, $e0        ;; 07:743a ????????
    db   $4b, $f0, $44, $bd, $20, $fb, $fe, $3f        ;; 07:7442 ????????
    db   $28, $03, $2c, $18, $f1, $3e, $a5, $e0        ;; 07:744a ????????
    db   $4b, $cd, $71, $01, $2e, $00, $06, $40        ;; 07:7452 ????????
    db   $26, $da, $7e, $a7, $20, $0c, $25, $7e        ;; 07:745a ????????
    db   $c6, $08, $fe, $a6, $38, $13, $3e, $a5        ;; 07:7462 ????????
    db   $18, $0f, $7e, $c6, $08, $fe, $b0, $30        ;; 07:746a ????????
    db   $08, $fe, $07, $38, $04, $25, $77, $af        ;; 07:7472 ????????
    db   $24, $22, $05, $20, $db, $21, $00, $d9        ;; 07:747a ????????
    db   $01, $00, $40, $2a, $d6, $a5, $b1, $4f        ;; 07:7482 ????????
    db   $05, $20, $f8, $79, $a7, $20, $a9, $cd        ;; 07:748a ????????
    db   $da, $01, $d7, $3e, $c3, $e0, $40, $c9        ;; 07:7492 ????????
    db   $f5, $d5, $21, $13, $d8, $c7, $2a, $23        ;; 07:749a ????????
    db   $23, $6e, $26, $14, $cd, $5f, $01, $85        ;; 07:74a2 ????????
    db   $6f, $d1, $f1, $c9, $fa, $0c, $d8, $47        ;; 07:74aa ????????
    db   $3d, $6f, $26, $03, $cd, $5f, $01, $11        ;; 07:74b2 ????????
    db   $dc, $c6, $19, $c9, $3e, $ff, $01, $00        ;; 07:74ba ????????
    db   $03, $21, $ea, $d3, $2a, $a7, $28, $04        ;; 07:74c2 ????????
    db   $3c, $28, $01, $0c, $23, $05, $20, $f4        ;; 07:74ca ????????
    db   $79, $ea, $0c, $d8, $c9, $08, $06, $05        ;; 07:74d2 ????????
    db   $f5, $c5, $d5, $e5, $fa, $77, $d8, $fe        ;; 07:74da ????????
    db   $98, $20, $06, $fa, $3a, $d8, $a7, $20        ;; 07:74e2 ????????
    db   $11, $cd, $0f, $77, $21, $e9, $d3, $11        ;; 07:74ea ????????
    db   $00, $d8, $06, $06, $cd, $8f, $00, $c3        ;; 07:74f2 ????????
    db   $13, $00, $4f, $fa, $ea, $d3, $a7, $20        ;; 07:74fa ????????
    db   $0b, $0d, $28, $05, $cd, $c6, $75, $18        ;; 07:7502 ????????
    db   $03, $cd, $10, $75, $18, $de, $3e, $04        ;; 07:750a ????????
    db   $e0, $d2, $af, $e0, $d1, $21, $00, $d9        ;; 07:7512 ????????
    db   $06, $00, $cd, $7b, $00, $21, $00, $9c        ;; 07:751a ????????
    db   $3e, $7f, $06, $00, $cd, $a3, $00, $21        ;; 07:7522 ????????
    db   $00, $99, $11, $00, $9d, $01, $40, $01        ;; 07:752a ????????
    db   $cd, $be, $00, $cd, $d7, $01, $3e, $c3        ;; 07:7532 ????????
    db   $e0, $40, $3e, $07, $e0, $4b, $af, $e0        ;; 07:753a ????????
    db   $4a, $cd, $dd, $01, $21, $00, $d9, $7e        ;; 07:7542 ????????
    db   $e0, $43, $f0, $44, $bd, $20, $fb, $fe        ;; 07:754a ????????
    db   $3f, $28, $03, $2c, $18, $f1, $af, $e0        ;; 07:7552 ????????
    db   $43, $cd, $71, $01, $21, $d2, $ff, $35        ;; 07:755a ????????
    db   $20, $df, $36, $04, $f0, $d1, $3c, $fe        ;; 07:7562 ????????
    db   $20, $38, $02, $3e, $20, $e0, $d1, $cd        ;; 07:756a ????????
    db   $95, $75, $fa, $1f, $d9, $fe, $70, $20        ;; 07:7572 ????????
    db   $c8, $cd, $dd, $01, $3e, $e3, $e0, $40        ;; 07:757a ????????
    db   $cd, $da, $01, $21, $00, $98, $3e, $7f        ;; 07:7582 ????????
    db   $06, $00, $cd, $a3, $00, $d7, $3e, $c3        ;; 07:758a ????????
    db   $e0, $40, $c9, $21, $00, $d9, $f0, $d1        ;; 07:7592 ????????
    db   $47, $7e, $a7, $20, $03, $34, $18, $08        ;; 07:759a ????????
    db   $87, $fe, $70, $38, $02, $3e, $70, $22        ;; 07:75a2 ????????
    db   $05, $20, $ee, $f0, $d1, $47, $21, $3f        ;; 07:75aa ????????
    db   $d9, $7e, $a7, $20, $03, $35, $18, $08        ;; 07:75b2 ????????
    db   $87, $fe, $90, $30, $02, $3e, $90, $32        ;; 07:75ba ????????
    db   $05, $20, $ee, $c9, $3e, $04, $e0, $d0        ;; 07:75c2 ????????
    db   $3e, $01, $e0, $d2, $e0, $d3, $af, $e0        ;; 07:75ca ????????
    db   $d1, $21, $00, $d9, $06, $00, $cd, $7b        ;; 07:75d2 ????????
    db   $00, $21, $0a, $98, $11, $00, $9c, $0e        ;; 07:75da ????????
    db   $08, $cd, $7a, $01, $06, $0a, $cd, $8f        ;; 07:75e2 ????????
    db   $00, $3e, $16, $c7, $cd, $0b, $00, $c7        ;; 07:75ea ????????
    db   $cd, $0b, $00, $0d, $20, $ee, $cd, $7d        ;; 07:75f2 ????????
    db   $01, $21, $13, $99, $11, $00, $9d, $0e        ;; 07:75fa ????????
    db   $0a, $cd, $7a, $01, $7e, $12, $3e, $20        ;; 07:7602 ????????
    db   $c7, $cd, $0b, $00, $c7, $cd, $0b, $00        ;; 07:760a ????????
    db   $0d, $20, $f1, $cd, $7d, $01, $cd, $d7        ;; 07:7612 ????????
    db   $01, $3e, $e3, $e0, $40, $af, $e0, $4a        ;; 07:761a ????????
    db   $21, $0a, $98, $0e, $08, $3e, $57, $e0        ;; 07:7622 ????????
    db   $4b, $f0, $44, $a7, $20, $fb, $f0, $44        ;; 07:762a ????????
    db   $fe, $40, $38, $fa, $3e, $9f, $e0, $4b        ;; 07:7632 ????????
    db   $cd, $71, $01, $cd, $dd, $01, $06, $04        ;; 07:763a ????????
    db   $3e, $7f, $cd, $7c, $00, $3e, $1c, $c7        ;; 07:7642 ????????
    db   $0d, $20, $da, $3e, $57, $e0, $4b, $f0        ;; 07:764a ????????
    db   $44, $a7, $20, $fb, $f0, $44, $fe, $40        ;; 07:7652 ????????
    db   $38, $fa, $3e, $9f, $e0, $4b, $cd, $71        ;; 07:765a ????????
    db   $01, $fa, $a6, $c3, $e0, $47, $21, $00        ;; 07:7662 ????????
    db   $d9, $f0, $44, $fe, $98, $38, $fa, $fa        ;; 07:766a ????????
    db   $a6, $c3, $57, $0e, $57, $06, $a5, $1e        ;; 07:7672 ????????
    db   $50, $7e, $e0, $43, $81, $b8, $38, $01        ;; 07:767a ????????
    db   $78, $e0, $4b, $b8, $28, $03, $7a, $18        ;; 07:7682 ????????
    db   $01, $af, $e0, $47, $f0, $d2, $fe, $01        ;; 07:768a ????????
    db   $20, $10, $f0, $d1, $bd, $30, $03, $af        ;; 07:7692 ????????
    db   $18, $07, $f0, $d3, $86, $bb, $38, $01        ;; 07:769a ????????
    db   $7b, $77, $f0, $44, $bd, $20, $fb, $fe        ;; 07:76a2 ????????
    db   $3f, $28, $03, $2c, $18, $cb, $fa, $a6        ;; 07:76aa ????????
    db   $c3, $e0, $47, $3e, $9f, $e0, $4b, $af        ;; 07:76b2 ????????
    db   $e0, $43, $cd, $71, $01, $21, $d2, $ff        ;; 07:76ba ????????
    db   $35, $20, $9e, $f0, $d0, $77, $f0, $d1        ;; 07:76c2 ????????
    db   $3c, $fe, $40, $38, $02, $3e, $40, $e0        ;; 07:76ca ????????
    db   $d1, $fe, $20, $38, $04, $3e, $01, $e0        ;; 07:76d2 ????????
    db   $d0, $fa, $3f, $d9, $a7, $ca, $e6, $76        ;; 07:76da ????????
    db   $3e, $08, $e0, $d3, $fa, $3f, $d9, $fe        ;; 07:76e2 ????????
    db   $50, $c2, $63, $76, $21, $06, $98, $11        ;; 07:76ea ????????
    db   $1c, $00, $3e, $7f, $06, $01, $cd, $dd        ;; 07:76f2 ????????
    db   $01, $3e, $c3, $e0, $40, $0e, $08, $22        ;; 07:76fa ????????
    db   $22, $22, $22, $19, $0d, $20, $f8, $05        ;; 07:7702 ????????
    db   $20, $ec, $c3, $da, $01, $21, $ea, $d3        ;; 07:770a ????????
    db   $11, $01, $d8, $06, $00, $7e, $a7, $20        ;; 07:7712 ????????
    db   $07, $1a, $a7, $28, $03, $cd, $2d, $77        ;; 07:771a ????????
    db   $23, $23, $13, $13, $04, $78, $fe, $03        ;; 07:7722 ????????
    db   $20, $eb, $c9, $c5, $d5, $e5, $78, $e0        ;; 07:772a ????????
    db   $d0, $21, $0d, $d8, $c7, $4e, $23, $23        ;; 07:7732 ????????
    db   $23, $46, $23, $23, $23, $5e, $23, $23        ;; 07:773a ????????
    db   $23, $56, $6a, $26, $20, $cd, $5f, $01        ;; 07:7742 ????????
    db   $7b, $c7, $fa, $77, $d8, $84, $67, $3e        ;; 07:774a ????????
    db   $20, $91, $5f, $16, $00, $cd, $7a, $01        ;; 07:7752 ????????
    db   $c5, $41, $3e, $7f, $cd, $7c, $00, $19        ;; 07:775a ????????
    db   $c1, $05, $20, $f4, $cd, $7d, $01, $e1        ;; 07:7762 ????????
    db   $d1, $c1, $c9, $f5, $c5, $d5, $e5, $cd        ;; 07:776a ????????
    db   $6d, $7a, $06, $02, $c5, $21, $e7, $7a        ;; 07:7772 ????????
    db   $01, $4a, $08, $3e, $40, $e0, $d2, $cd        ;; 07:777a ????????
    db   $8e, $77, $c1, $05, $20, $ee, $cd, $93        ;; 07:7782 ????????
    db   $7a, $c3, $13, $00, $c5, $e5, $d7, $f0        ;; 07:778a ????????
    db   $d2, $86, $23, $e2, $05, $20, $f7, $e1        ;; 07:7792 ????????
    db   $c1, $c9, $3e, $98, $21, $77, $d8, $be        ;; 07:779a ????????
    db   $c8, $77, $21, $00, $dd, $11, $00, $98        ;; 07:77a2 ????????
    db   $06, $00, $c3, $b5, $00, $3d, $01, $a0        ;; 07:77aa ????????
    db   $7b, $cd, $7c, $71, $7d, $e0, $d6, $7c        ;; 07:77b2 ????????
    db   $e0, $d7, $21, $d6, $ff, $2a, $66, $6f        ;; 07:77ba ????????
    db   $2a, $a7, $c8, $01, $bc, $77, $c5, $f5        ;; 07:77c2 ????????
    db   $7d, $e0, $d6, $7c, $e0, $d7, $f1, $3d        ;; 07:77ca ????????
    db   $87, $21, $d5, $7a, $c7, $2a, $66, $6f        ;; 07:77d2 ????????
    db   $e9, $21, $00, $98, $11, $00, $dd, $06        ;; 07:77da ????????
    db   $00, $cd, $b5, $00, $21, $00, $9c, $06        ;; 07:77e2 ????????
    db   $00, $3e, $7f, $cd, $a3, $00, $5d, $54        ;; 07:77ea ????????
    db   $21, $00, $99, $01, $40, $01, $cd, $be        ;; 07:77f2 ????????
    db   $00, $fa, $a6, $c3, $5f, $06, $03, $c5        ;; 07:77fa ????????
    db   $cb, $23, $cb, $23, $16, $0f, $d7, $7b        ;; 07:7802 ????????
    db   $e0, $47, $f0, $44, $fe, $40, $20, $fa        ;; 07:780a ????????
    db   $fa, $a6, $c3, $e0, $47, $15, $20, $ee        ;; 07:7812 ????????
    db   $c1, $05, $20, $e3, $d7, $af, $e0, $4a        ;; 07:781a ????????
    db   $3e, $07, $e0, $4b, $f0, $40, $f6, $60        ;; 07:7822 ????????
    db   $e0, $40, $21, $00, $98, $06, $00, $3e        ;; 07:782a ????????
    db   $7f, $cd, $a3, $00, $d7, $f0, $40, $e6        ;; 07:7832 ????????
    db   $df, $e0, $40, $3e, $dd, $ea, $77, $d8        ;; 07:783a ????????
    db   $c9, $f5, $cd, $6d, $7a, $06, $02, $c5        ;; 07:7842 ????????
    db   $21, $e7, $7a, $01, $43, $08, $cd, $60        ;; 07:784a ????????
    db   $78, $0d, $cd, $60, $78, $c1, $05, $20        ;; 07:7852 ????????
    db   $ee, $cd, $93, $7a, $f1, $c9, $c5, $e5        ;; 07:785a ????????
    db   $d7, $2a, $e2, $05, $20, $fa, $e1, $c1        ;; 07:7862 ????????
    db   $c9, $f5, $06, $04, $c5, $f0, $44, $fe        ;; 07:786a ????????
    db   $91, $38, $fa, $f0, $40, $cb, $bf, $e0        ;; 07:7872 ????????
    db   $40, $e0, $04, $f0, $04, $cb, $6f, $28        ;; 07:787a ????????
    db   $fa, $f0, $40, $cb, $ff, $e0, $40, $06        ;; 07:7882 ????????
    db   $06, $d7, $05, $20, $fc, $c1, $05, $20        ;; 07:788a ????????
    db   $db, $f1, $c9, $f5, $cd, $d7, $01, $fa        ;; 07:7892 ????????
    db   $a6, $c3, $e0, $d4, $06, $10, $c5, $3e        ;; 07:789a ????????
    db   $01, $e0, $d2, $f0, $d4, $e0, $d1, $af        ;; 07:78a2 ????????
    db   $e0, $d3, $f0, $d3, $e0, $d0, $21, $44        ;; 07:78aa ????????
    db   $ff, $0e, $47, $be, $20, $fd, $f0, $d1        ;; 07:78b2 ????????
    db   $2f, $e0, $d1, $e2, $f0, $d0, $c6, $08        ;; 07:78ba ????????
    db   $fe, $40, $38, $e8, $f0, $44, $fe, $40        ;; 07:78c2 ????????
    db   $20, $fa, $fa, $a6, $c3, $e0, $47, $f0        ;; 07:78ca ????????
    db   $d4, $e0, $d1, $cd, $71, $01, $21, $d2        ;; 07:78d2 ????????
    db   $ff, $35, $20, $ce, $36, $01, $f0, $d3        ;; 07:78da ????????
    db   $3c, $3c, $fe, $08, $38, $c2, $af, $e0        ;; 07:78e2 ????????
    db   $d3, $f0, $d4, $2f, $e0, $d4, $c1, $05        ;; 07:78ea ????????
    db   $20, $ac, $cd, $da, $01, $f1, $c9, $f5        ;; 07:78f2 ????????
    db   $af, $e0, $d0, $cd, $46, $79, $3e, $04        ;; 07:78fa ????????
    db   $e0, $d2, $cd, $d7, $01, $06, $10, $c5        ;; 07:7902 ????????
    db   $f0, $44, $fe, $90, $20, $fa, $21, $00        ;; 07:790a ????????
    db   $d9, $7e, $e0, $43, $f0, $44, $bd, $20        ;; 07:7912 ????????
    db   $fb, $fe, $3f, $28, $03, $2c, $18, $f1        ;; 07:791a ????????
    db   $af, $e0, $43, $cd, $71, $01, $21, $d2        ;; 07:7922 ????????
    db   $ff, $35, $20, $dc, $36, $04, $f0, $d0        ;; 07:792a ????????
    db   $3c, $fe, $40, $38, $01, $af, $e0, $d0        ;; 07:7932 ????????
    db   $cd, $46, $79, $c1, $05, $20, $c8, $cd        ;; 07:793a ????????
    db   $da, $01, $f1, $c9, $21, $60, $7b, $11        ;; 07:7942 ????????
    db   $00, $da, $d5, $06, $40, $cd, $8f, $00        ;; 07:794a ????????
    db   $e1, $f0, $d0, $6f, $11, $00, $d9, $06        ;; 07:7952 ????????
    db   $40, $2a, $12, $13, $7d, $fe, $40, $38        ;; 07:795a ????????
    db   $02, $2e, $00, $05, $20, $f3, $c9, $cd        ;; 07:7962 ????????
    db   $d7, $01, $06, $3c, $21, $60, $7b, $f0        ;; 07:796a ????????
    db   $44, $fe, $90, $20, $fa, $2a, $e0, $43        ;; 07:7972 ????????
    db   $f0, $44, $fe, $40, $20, $fa, $af, $e0        ;; 07:797a ????????
    db   $43, $cd, $71, $01, $05, $20, $e8, $af        ;; 07:7982 ????????
    db   $e0, $43, $c3, $da, $01, $cd, $6d, $7a        ;; 07:798a ????????
    db   $06, $03, $c5, $cd, $a5, $79, $06, $03        ;; 07:7992 ????????
    db   $d7, $05, $20, $fc, $c1, $05, $20, $f2        ;; 07:799a ????????
    db   $c3, $93, $7a, $cd, $d7, $01, $1e, $01        ;; 07:79a2 ????????
    db   $3e, $ff, $e0, $d0, $1d, $20, $1c, $1e        ;; 07:79aa ????????
    db   $04, $f0, $d0, $3c, $fe, $07, $30, $37        ;; 07:79b2 ????????
    db   $e0, $d0, $21, $ce, $7a, $c7, $7e, $e0        ;; 07:79ba ????????
    db   $d1, $cd, $f7, $79, $21, $c7, $7a, $f0        ;; 07:79c2 ????????
    db   $d0, $c7, $56, $f0, $44, $fe, $00, $20        ;; 07:79ca ????????
    db   $fa, $f0, $44, $fe, $40, $38, $05, $cd        ;; 07:79d2 ????????
    db   $71, $01, $18, $d0, $01, $00, $d9, $6f        ;; 07:79da ????????
    db   $26, $00, $09, $f0, $41, $e6, $03, $20        ;; 07:79e2 ????????
    db   $fa, $7e, $82, $e0, $42, $18, $e2, $af        ;; 07:79ea ????????
    db   $e0, $42, $c3, $da, $01, $d5, $21, $00        ;; 07:79f2 ????????
    db   $d9, $f0, $d1, $5f, $af, $0e, $40, $43        ;; 07:79fa ????????
    db   $22, $0d, $28, $06, $05, $20, $f9, $3c        ;; 07:7a02 ????????
    db   $18, $f5, $d1, $c9, $cd, $d7, $01, $06        ;; 07:7a0a ????????
    db   $03, $cd, $1c, $7a, $05, $20, $fa, $c3        ;; 07:7a12 ????????
    db   $da, $01, $c5, $cd, $4f, $7a, $af, $e0        ;; 07:7a1a ????????
    db   $d1, $01, $01, $0b, $cd, $3a, $7a, $0d        ;; 07:7a22 ????????
    db   $20, $fa, $0e, $01, $21, $d1, $ff, $34        ;; 07:7a2a ????????
    db   $05, $20, $f1, $af, $e0, $43, $c1, $c9        ;; 07:7a32 ????????
    db   $c5, $f0, $d1, $21, $00, $d9, $c7, $7e        ;; 07:7a3a ????????
    db   $e0, $d0, $cd, $b4, $7a, $af, $e0, $d0        ;; 07:7a42 ????????
    db   $cd, $b4, $7a, $c1, $c9, $c5, $21, $60        ;; 07:7a4a ????????
    db   $7b, $11, $00, $d9, $06, $0b, $2a, $87        ;; 07:7a52 ????????
    db   $12, $13, $05, $20, $f9, $c1, $c9, $cd        ;; 07:7a5a ????????
    db   $db, $77, $06, $3c, $d7, $05, $20, $fc        ;; 07:7a62 ????????
    db   $c3, $9c, $77, $21, $00, $99, $11, $00        ;; 07:7a6a ????????
    db   $9c, $01, $40, $01, $cd, $be, $00, $d7        ;; 07:7a72 ????????
    db   $21, $4a, $ff, $36, $40, $23, $36, $07        ;; 07:7a7a ????????
    db   $f0, $40, $f6, $60, $e0, $40, $21, $00        ;; 07:7a82 ????????
    db   $99, $01, $40, $01, $3e, $7f, $c3, $ac        ;; 07:7a8a ????????
    db   $00, $d7, $3e, $40, $e0, $4a, $3e, $07        ;; 07:7a92 ????????
    db   $e0, $4b, $af, $e0, $43, $e0, $42, $21        ;; 07:7a9a ????????
    db   $00, $9c, $11, $00, $99, $01, $40, $01        ;; 07:7aa2 ????????
    db   $cd, $be, $00, $d7, $21, $40, $ff, $cb        ;; 07:7aaa ????????
    db   $ae, $c9, $cd, $dd, $01, $f0, $d0, $e0        ;; 07:7ab2 ????????
    db   $43, $f0, $44, $fe, $40, $20, $fa, $af        ;; 07:7aba ????????
    db   $e0, $43, $c3, $71, $01, $f8, $f4, $f0        ;; 07:7ac2 ????????
    db   $e0, $f0, $f4, $f8, $04, $03, $02, $01        ;; 07:7aca ????????
    db   $02, $03, $04, $db, $77, $43, $78, $6b        ;; 07:7ad2 ????????
    db   $78, $95, $78, $f9, $78, $69, $79, $8f        ;; 07:7ada ????????
    db   $79, $0e, $7a, $61, $7a, $08, $f8, $f8        ;; 07:7ae2 ????????
    db   $08, $08, $f8, $f8, $08, $10, $00, $21        ;; 07:7aea ????????
    db   $80, $45, $80, $50, $80, $6a, $00, $00        ;; 07:7af2 ????????
    db   $00, $4a, $00, $22, $00, $10, $28, $03        ;; 07:7afa ????????
    db   $20, $0c, $00, $00, $02, $41, $28, $00        ;; 07:7b02 ????????
    db   $00, $46, $00, $80, $a0, $04, $00, $00        ;; 07:7b0a ????????
    db   $00, $01, $02, $00, $00, $48, $00, $00        ;; 07:7b12 ????????
    db   $82, $12, $00, $00, $00, $01, $28, $80        ;; 07:7b1a ????????
    db   $00, $18, $20, $00, $08, $04, $a0, $09        ;; 07:7b22 ????????
    db   $28, $90, $20, $00, $00, $c0, $00, $04        ;; 07:7b2a ????????
    db   $20, $08, $02, $0a, $20, $10, $22, $21        ;; 07:7b32 ????????
    db   $00, $00, $00, $61, $2a, $00, $00, $80        ;; 07:7b3a ????????
    db   $80, $20, $00, $32, $0a, $48, $22, $5d        ;; 07:7b42 ????????
    db   $00, $01, $02, $b4, $28, $01, $02, $01        ;; 07:7b4a ????????
    db   $08, $4a, $00, $04, $00, $40, $00, $0c        ;; 07:7b52 ????????
    db   $0a, $00, $00, $82, $02, $00, $00, $fd        ;; 07:7b5a ????????
    db   $fb, $fb, $fc, $fe, $01, $03, $04, $04        ;; 07:7b62 ????????
    db   $03, $00, $fd, $fb, $fb, $fb, $fd, $00        ;; 07:7b6a ????????
    db   $02, $04, $04, $03, $01, $fe, $fc, $fb        ;; 07:7b72 ????????
    db   $fb, $fd, $ff, $02, $04, $04, $04, $02        ;; 07:7b7a ????????
    db   $ff, $fc, $fb, $fb, $fc, $fe, $01, $03        ;; 07:7b82 ????????
    db   $04, $04, $02, $00, $fd, $fb, $fb, $fc        ;; 07:7b8a ????????
    db   $fe, $01, $03, $04, $04, $03, $00, $fd        ;; 07:7b92 ????????
    db   $fb, $fb, $fb, $fd, $00, $02, $be, $7b        ;; 07:7b9a ????????
    db   $c0, $7b, $c2, $7b, $c4, $7b, $c6, $7b        ;; 07:7ba2 ????????
    db   $c8, $7b, $ca, $7b, $cc, $7b, $ce, $7b        ;; 07:7baa ????????
    db   $d1, $7b, $d6, $7b, $d8, $7b, $da, $7b        ;; 07:7bb2 ????????
    db   $dc, $7b, $de, $7b, $01, $00, $02, $00        ;; 07:7bba ????????
    db   $03, $00, $04, $00, $05, $00, $06, $00        ;; 07:7bc2 ????????
    db   $07, $00, $08, $00, $03, $06, $00, $03        ;; 07:7bca ????????
    db   $03, $03, $03, $00, $01, $00, $01, $00        ;; 07:7bd2 ????????
    db   $01, $00, $01, $00, $01, $00, $20, $0a        ;; 07:7bda ????????
    db   $80, $03, $00, $0b, $80, $01, $20, $10        ;; 07:7be2 ????????
    db   $02, $00, $80, $c6, $82, $00, $00, $20        ;; 07:7bea ????????
    db   $00, $20, $28, $80, $a8, $a2, $08, $00        ;; 07:7bf2 ????????
    db   $08, $00, $02, $00, $44, $61, $ac, $7c        ;; 07:7bfa ????????
    db   $dc, $7c, $0e, $7d, $18, $7d, $3c, $7d        ;; 07:7c02 ????????
    db   $5c, $7d, $83, $7d, $17, $7e, $48, $7e        ;; 07:7c0a ????????
    db   $96, $7e, $fe, $7e, $0e, $7f, $32, $7f        ;; 07:7c12 ????????
    db   $46, $7f, $61, $7f, $00, $18, $00, $10        ;; 07:7c1a ????????
    db   $08, $08, $08, $10, $10, $00, $10, $08        ;; 07:7c22 ????????
    db   $18, $00, $00, $00, $00, $08, $10, $10        ;; 07:7c2a ????????
    db   $10, $18, $18, $18, $04, $04, $14, $04        ;; 07:7c32 ????????
    db   $1c, $04, $08, $14, $0c, $04, $10, $14        ;; 07:7c3a ????????
    db   $18, $04, $00, $14, $08, $0c, $10, $0c        ;; 07:7c42 ????????
    db   $18, $0c, $0c, $0c, $20, $0c, $18, $08        ;; 07:7c4a ????????
    db   $08, $00, $20, $08, $20, $10, $18, $10        ;; 07:7c52 ????????
    db   $08, $18, $00, $04, $08, $04, $10, $04        ;; 07:7c5a ????????
    db   $10, $1c, $18, $14, $18, $1c, $04, $08        ;; 07:7c62 ????????
    db   $02, $10, $16, $08, $14, $10, $20, $4c        ;; 07:7c6a ????????
    db   $20, $2c, $20, $34, $20, $3c, $20, $44        ;; 07:7c72 ????????
    db   $20, $54, $20, $5c, $20, $64, $20, $6c        ;; 07:7c7a ????????
    db   $28, $4c, $30, $4c, $32, $3e, $32, $5a        ;; 07:7c82 ????????
    db   $36, $46, $38, $4c, $36, $52, $38, $48        ;; 07:7c8a ????????
    db   $38, $50, $28, $44, $28, $54, $30, $44        ;; 07:7c92 ????????
    db   $30, $54, $38, $44, $38, $54, $10, $fc        ;; 07:7c9a ????????
    db   $18, $fc, $24, $04, $20, $04, $20, $44        ;; 07:7ca2 ????????
    db   $20, $14, $14, $44, $01, $00, $0a, $44        ;; 07:7caa ????????
    db   $02, $01, $00, $00, $01, $46, $07, $01        ;; 07:7cb2 ????????
    db   $00, $00, $01, $02, $00, $03, $02, $04        ;; 07:7cba ????????
    db   $00, $05, $02, $06, $03, $48, $01, $07        ;; 07:7cc2 ????????
    db   $4a, $4c, $07, $07, $41, $08, $40, $02        ;; 07:7cca ????????
    db   $42, $03, $40, $09, $42, $0a, $40, $0b        ;; 07:7cd2 ????????
    db   $43, $00, $13, $44, $03, $10, $04, $0d        ;; 07:7cda ????????
    db   $05, $0e, $06, $48, $05, $10, $05, $11        ;; 07:7ce2 ????????
    db   $04, $0d, $06, $23, $05, $46, $06, $46        ;; 07:7cea ????????
    db   $06, $11, $05, $10, $05, $16, $04, $23        ;; 07:7cf2 ????????
    db   $06, $0d, $06, $18, $05, $58, $06, $11        ;; 07:7cfa ????????
    db   $05, $10, $05, $16, $05, $23, $06, $0d        ;; 07:7d02 ????????
    db   $06, $18, $06, $00, $11, $4c, $01, $17        ;; 07:7d0a ????????
    db   $0a, $74, $01, $17, $09, $00, $13, $44        ;; 07:7d12 ????????
    db   $02, $16, $05, $18, $05, $48, $03, $15        ;; 07:7d1a ????????
    db   $05, $16, $05, $18, $05, $46, $04, $14        ;; 07:7d22 ????????
    db   $0b, $15, $05, $16, $05, $18, $05, $4a        ;; 07:7d2a ????????
    db   $04, $02, $21, $03, $61, $05, $a1, $09        ;; 07:7d32 ????????
    db   $e1, $00, $12, $4c, $02, $03, $39, $05        ;; 07:7d3a ????????
    db   $3a, $4c, $04, $02, $79, $03, $39, $05        ;; 07:7d42 ????????
    db   $3a, $09, $7a, $5e, $06, $08, $3b, $01        ;; 07:7d4a ????????
    db   $7b, $02, $3c, $03, $7c, $05, $3a, $09        ;; 07:7d52 ????????
    db   $7a, $00, $15, $03, $4c, $02, $19, $50        ;; 07:7d5a ????????
    db   $1b, $10, $48, $03, $05, $50, $19, $10        ;; 07:7d62 ????????
    db   $1b, $50, $46, $01, $1b, $10, $48, $06        ;; 07:7d6a ????????
    db   $02, $4e, $1e, $0e, $04, $8f, $09, $cf        ;; 07:7d72 ????????
    db   $19, $cf, $1b, $4e, $44, $01, $1b, $cf        ;; 07:7d7a ????????
    db   $00, $16, $44, $02, $1b, $13, $1c, $14        ;; 07:7d82 ????????
    db   $46, $04, $19, $54, $1d, $53, $1b, $60        ;; 07:7d8a ????????
    db   $1c, $5f, $48, $0e, $1a, $13, $02, $14        ;; 07:7d92 ????????
    db   $03, $15, $1e, $16, $04, $17, $05, $18        ;; 07:7d9a ????????
    db   $09, $19, $0a, $1a, $06, $1b, $19, $1c        ;; 07:7da2 ????????
    db   $1d, $1d, $0b, $1e, $1b, $1f, $1c, $20        ;; 07:7daa ????????
    db   $48, $0e, $1a, $56, $02, $55, $03, $54        ;; 07:7db2 ????????
    db   $1e, $53, $04, $5a, $05, $59, $09, $58        ;; 07:7dba ????????
    db   $0a, $57, $06, $5e, $19, $5d, $1d, $5c        ;; 07:7dc2 ????????
    db   $0b, $5b, $1b, $60, $1c, $5f, $48, $0e        ;; 07:7dca ????????
    db   $1a, $13, $02, $14, $03, $15, $1e, $16        ;; 07:7dd2 ????????
    db   $04, $17, $05, $18, $09, $19, $0a, $1a        ;; 07:7dda ????????
    db   $06, $1b, $19, $1c, $1d, $1d, $0b, $1e        ;; 07:7de2 ????????
    db   $1b, $1f, $1c, $20, $48, $0e, $1a, $56        ;; 07:7dea ????????
    db   $02, $55, $03, $54, $1e, $53, $04, $5a        ;; 07:7df2 ????????
    db   $05, $59, $09, $58, $0a, $57, $06, $5e        ;; 07:7dfa ????????
    db   $19, $5d, $1d, $5c, $0b, $5b, $1b, $60        ;; 07:7e02 ????????
    db   $1c, $5f, $48, $04, $19, $54, $1d, $53        ;; 07:7e0a ????????
    db   $1b, $60, $1c, $5f, $00, $32, $45, $03        ;; 07:7e12 ????????
    db   $05, $12, $06, $12, $19, $12, $45, $03        ;; 07:7e1a ????????
    db   $09, $12, $0a, $12, $1d, $12, $45, $04        ;; 07:7e22 ????????
    db   $01, $12, $00, $12, $02, $12, $03, $12        ;; 07:7e2a ????????
    db   $11, $48, $04, $08, $2a, $03, $0a, $04        ;; 07:7e32 ????????
    db   $0a, $1d, $2a, $4c, $04, $08, $0a, $03        ;; 07:7e3a ????????
    db   $2a, $04, $2a, $1d, $0a, $00, $12, $48        ;; 07:7e42 ????????
    db   $04, $02, $21, $03, $61, $05, $a1, $09        ;; 07:7e4a ????????
    db   $e1, $4a, $10, $07, $2c, $08, $2d, $01        ;; 07:7e52 ????????
    db   $6d, $00, $6c, $1a, $2e, $02, $2f, $03        ;; 07:7e5a ????????
    db   $6f, $1e, $6e, $04, $ae, $05, $af, $09        ;; 07:7e62 ????????
    db   $ef, $0a, $ee, $06, $ac, $19, $ad, $1d        ;; 07:7e6a ????????
    db   $ed, $0b, $ec, $56, $0f, $1f, $30, $13        ;; 07:7e72 ????????
    db   $70, $20, $31, $14, $32, $0f, $71, $41        ;; 07:7e7a ????????
    db   $33, $21, $34, $15, $35, $11, $74, $22        ;; 07:7e82 ????????
    db   $73, $42, $36, $12, $37, $16, $38, $23        ;; 07:7e8a ????????
    db   $77, $24, $76, $00, $17, $46, $02, $25        ;; 07:7e92 ????????
    db   $0a, $26, $09, $46, $03, $25, $0a, $26        ;; 07:7e9a ????????
    db   $09, $00, $09, $46, $04, $25, $09, $26        ;; 07:7ea2 ????????
    db   $09, $00, $09, $03, $0a, $46, $05, $25        ;; 07:7eaa ????????
    db   $09, $26, $09, $00, $09, $03, $09, $05        ;; 07:7eb2 ????????
    db   $0a, $46, $06, $25, $09, $26, $09, $00        ;; 07:7eba ????????
    db   $09, $03, $09, $05, $09, $06, $0a, $46        ;; 07:7ec2 ????????
    db   $07, $25, $09, $26, $09, $00, $09, $03        ;; 07:7eca ????????
    db   $09, $05, $09, $06, $09, $27, $0a, $46        ;; 07:7ed2 ????????
    db   $08, $25, $09, $26, $09, $00, $09, $03        ;; 07:7eda ????????
    db   $09, $05, $09, $06, $09, $27, $09, $28        ;; 07:7ee2 ????????
    db   $0a, $6e, $08, $25, $09, $26, $09, $00        ;; 07:7eea ????????
    db   $09, $03, $09, $05, $09, $06, $09, $27        ;; 07:7ef2 ????????
    db   $09, $28, $09, $00, $41, $8a, $01, $0c        ;; 07:7efa ????????
    db   $0a, $88, $04, $07, $07, $08, $08, $1a        ;; 07:7f02 ????????
    db   $c8, $02, $c7, $00, $63, $84, $01, $0c        ;; 07:7f0a ????????
    db   $0b, $88, $04, $07, $21, $08, $61, $1a        ;; 07:7f12 ????????
    db   $a1, $02, $e1, $8a, $04, $07, $22, $08        ;; 07:7f1a ????????
    db   $23, $1a, $24, $02, $25, $8a, $04, $07        ;; 07:7f22 ????????
    db   $e5, $08, $e4, $1a, $e3, $02, $e2, $00        ;; 07:7f2a ????????
    db   $42, $88, $01, $0c, $2b, $88, $01, $0c        ;; 07:7f32 ????????
    db   $0a, $86, $04, $07, $26, $08, $27, $1a        ;; 07:7f3a ????????
    db   $28, $02, $29, $00, $12, $c4, $01, $29        ;; 07:7f42 ????????
    db   $0b, $ca, $09, $2a, $0c, $2b, $0c, $2c        ;; 07:7f4a ????????
    db   $0c, $2d, $0c, $29, $0d, $2e, $0c, $2f        ;; 07:7f52 ????????
    db   $0c, $30, $0c, $31, $0c, $09, $00, $1a        ;; 07:7f5a ????????
    db   $d0, $01, $32, $3d, $d0, $02, $33, $3d        ;; 07:7f62 ????????
    db   $34, $3d, $d0, $03, $35, $3d, $36, $3d        ;; 07:7f6a ????????
    db   $37, $3d, $d0, $02, $38, $3d, $34, $3d        ;; 07:7f72 ????????
    db   $d0, $02, $32, $3d, $37, $3d, $d0, $03        ;; 07:7f7a ????????
    db   $33, $3d, $34, $3d, $37, $3d, $d0, $03        ;; 07:7f82 ????????
    db   $35, $3d, $36, $3d, $37, $3d, $d0, $02        ;; 07:7f8a ????????
    db   $38, $3d, $34, $3d, $c5, $02, $39, $21        ;; 07:7f92 ????????
    db   $3a, $61, $c8, $09, $3b, $3e, $32, $32        ;; 07:7f9a ????????
    db   $3c, $7e, $3d, $3f, $33, $35, $3e, $7f        ;; 07:7fa2 ????????
    db   $3f, $36, $37, $38, $40, $76, $01, $00        ;; 07:7faa ????????
    db   $00, $00, $00, $40, $40, $00, $00, $40        ;; 07:7fb2 ????????
    db   $e0, $00, $08, $00, $80, $00, $01, $00        ;; 07:7fba ????????
    db   $00, $00, $00, $04, $20, $00, $00, $00        ;; 07:7fc2 ????????
    db   $01, $00, $81, $00, $00, $04, $02, $00        ;; 07:7fca ????????
    db   $00, $40, $20, $00, $00, $00, $00, $00        ;; 07:7fd2 ????????
    db   $00, $00, $00, $00, $10, $00, $08, $10        ;; 07:7fda ????????
    db   $08, $00, $00, $10, $04, $40, $00, $40        ;; 07:7fe2 ????????
    db   $44, $04, $18, $00, $01, $00, $08, $00        ;; 07:7fea ????????
    db   $01, $00, $00, $00, $00, $00, $00, $00        ;; 07:7ff2 ????????
    db   $00, $00, $40, $00, $40, $04                  ;; 07:7ffa ??????
