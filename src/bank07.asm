;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank07", ROMX[$4000], BANK[$07]

call_07_4000:
    jp   jp_07_4006                                    ;; 07:4000 $c3 $06 $40

call_07_4003:
    jp   jp_07_4030                                    ;; 07:4003 $c3 $30 $40

jp_07_4006:
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
    ld_long_store hFFE0, A                             ;; 07:401b $ea $e0 $ff
    ld_long_store hFFE1, A                             ;; 07:401e $ea $e1 $ff
    dec  A                                             ;; 07:4021 $3d
    ld   [wCE00], A                                    ;; 07:4022 $ea $00 $ce
    ld   [wCE20], A                                    ;; 07:4025 $ea $20 $ce
    ld   [wCE40], A                                    ;; 07:4028 $ea $40 $ce
    ldh  [hFFEA], A                                    ;; 07:402b $e0 $ea
    jp   jp_07_44d7                                    ;; 07:402d $c3 $d7 $44

jp_07_4030:
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
    call call_07_6aa8                                  ;; 07:404d $cd $a8 $6a
    jp   jp_07_44d7                                    ;; 07:4050 $c3 $d7 $44

call_07_4053:
    ld   A, [HL+]                                      ;; 07:4053 $2a
    ld   [DE], A                                       ;; 07:4054 $12
    inc  DE                                            ;; 07:4055 $13
    ld   A, [HL+]                                      ;; 07:4056 $2a
    ld   [DE], A                                       ;; 07:4057 $12
    ret                                                ;; 07:4058 $c9

call_07_4059:
    ld   A, E                                          ;; 07:4059 $7b
    ldh  [hFFE1], A                                    ;; 07:405a $e0 $e1
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
    ld   HL, data_07_462f                              ;; 07:406f $21 $2f $46
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
    ldh  A, [hFFE0]                                    ;; 07:40d1 $f0 $e0
    ld   E, A                                          ;; 07:40d3 $5f
    ldh  A, [hFFE1]                                    ;; 07:40d4 $f0 $e1
    cp   A, E                                          ;; 07:40d6 $bb
    jr   Z, .jr_07_40dc                                ;; 07:40d7 $28 $03
    call call_07_4059                                  ;; 07:40d9 $cd $59 $40
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
    jp   jp_07_44d7                                    ;; 07:40f9 $c3 $d7 $44

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

jp_07_44d7:
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
    ld   HL, data_07_69bd                              ;; 07:45ea $21 $bd $69
    add  HL, DE                                        ;; 07:45ed $19
    ld   C, $30                                        ;; 07:45ee $0e $30
    ld   B, $10                                        ;; 07:45f0 $06 $10
.jr_07_45f2:
    ld   A, [HL+]                                      ;; 07:45f2 $2a
    ldh  [C], A                                        ;; 07:45f3 $e2
    inc  C                                             ;; 07:45f4 $0c
    dec  B                                             ;; 07:45f5 $05
    jr   NZ, .jr_07_45f2                               ;; 07:45f6 $20 $fa
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

data_07_462f:
    db   $ee, $50, $ee, $50, $ee, $50, $5f, $47        ;; 07:462f ????????
    db   $9b, $46, $37, $48, $ea, $55, $5e, $55        ;; 07:4637 ????????
    db   $ab, $56, $ef, $50, $49, $4f, $c0, $52        ;; 07:463f ????????
    db   $54, $58, $f8, $58, $d8, $57, $5f, $4a        ;; 07:4647 ????????
    db   $1d, $49, $73, $4b, $f9, $59, $2a, $59        ;; 07:464f ????????
    db   $e9, $5a, $9d, $5c, $3c, $5c, $0b, $5d        ;; 07:4657 ????????
    db   $91, $4d, $bb, $4c, $6e, $4e, $ac, $5e        ;; 07:465f ????????
    db   $98, $5d, $09, $5e, $d2, $5f, $0d, $5f        ;; 07:4667 ????????
    db   $9e, $60, $88, $62, $85, $63, $3d, $62        ;; 07:466f ????????
    db   $24, $65, $d7, $64, $6c, $65, $3c, $66        ;; 07:4677 ????????
    db   $b7, $65, $f8, $65, $e6, $66, $5c, $66        ;; 07:467f ????????
    db   $b7, $66, $34, $67, $10, $67, $56, $67        ;; 07:4687 ????????
    db   $91, $67, $73, $67, $a9, $67, $19, $68        ;; 07:468f ????????
    db   $aa, $67, $3f, $68, $e0, $37, $f7, $02        ;; 07:4697 ????????
    db   $f7, $82, $f7, $43, $ed, $f2, $2d, $4d        ;; 07:469f ????????
    db   $5d, $6d, $f7, $c0, $f2, $7a, $ca, $7a        ;; 07:46a7 ????????
    db   $f3, $22, $0a, $2a, $4a, $25, $f2, $75        ;; 07:46af ????????
    db   $f3, $6a, $ca, $4a, $2a, $ca, $1a, $f2        ;; 07:46b7 ????????
    db   $ba, $ca, $ba, $f3, $62, $4a, $6a, $7a        ;; 07:46bf ????????
    db   $65, $f2, $b5, $f3, $9a, $ca, $7a, $6a        ;; 07:46c7 ????????
    db   $ca, $4a, $2a, $f2, $ba, $f3, $0a, $22        ;; 07:46cf ????????
    db   $f2, $bc, $de, $ce, $ba, $f3, $0a, $25        ;; 07:46d7 ????????
    db   $55, $45, $25, $0a, $f2, $9a, $ba, $f3        ;; 07:46df ????????
    db   $02, $f2, $9c, $de, $ce, $9a, $ba, $f3        ;; 07:46e7 ????????
    db   $05, $35, $25, $05, $f9, $f2, $b5, $d7        ;; 07:46ef ????????
    db   $f3, $0a, $25, $95, $21, $2a, $0a, $f2        ;; 07:46f7 ????????
    db   $ba, $fd, $0e, $47, $95, $d7, $ba, $f3        ;; 07:46ff ????????
    db   $05, $65, $21, $c5, $fc, $f4, $46, $f3        ;; 07:4707 ????????
    db   $05, $d7, $2a, $45, $65, $75, $45, $65        ;; 07:470f ????????
    db   $95, $52, $d7, $ca, $5a, $4a, $2a, $4a        ;; 07:4717 ????????
    db   $ca, $f2, $bc, $cc, $b1, $f3, $32, $d7        ;; 07:471f ????????
    db   $ca, $3a, $2a, $0a, $2a, $ca, $f2, $9c        ;; 07:4727 ????????
    db   $cc, $91, $f3, $22, $d7, $ca, $2a, $0a        ;; 07:472f ????????
    db   $f2, $ba, $f3, $0a, $ca, $f2, $9c, $cc        ;; 07:4737 ????????
    db   $95, $d7, $ca, $9a, $ca, $ba, $f3, $01        ;; 07:473f ????????
    db   $f2, $9a, $ba, $f3, $0a, $27, $ca, $f7        ;; 07:4747 ????????
    db   $0a, $2a, $2a, $2a, $2a, $2a, $2a, $2a        ;; 07:474f ????????
    db   $2a, $2a, $f7, $02, $20, $fe, $a9, $46        ;; 07:4757 ????????
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
    db   $25, $f0, $25, $fe, $3d, $48, $e0, $46        ;; 07:4917 ????????
    db   $f7, $02, $f7, $82, $f7, $c4, $f7, $43        ;; 07:491f ????????
    db   $ef, $f9, $f3, $7c, $f4, $7c, $f3, $7c        ;; 07:4927 ????????
    db   $f4, $7c, $f3, $7c, $f4, $7c, $f3, $6c        ;; 07:492f ????????
    db   $f4, $6c, $f3, $6c, $f4, $6c, $f3, $6c        ;; 07:4937 ????????
    db   $f4, $6c, $f3, $5c, $f4, $5c, $f3, $5c        ;; 07:493f ????????
    db   $f4, $5c, $f3, $5c, $f4, $5c, $f3, $4c        ;; 07:4947 ????????
    db   $f4, $4c, $f3, $4c, $f4, $4c, $f3, $4c        ;; 07:494f ????????
    db   $f4, $4c, $f3, $3c, $f4, $3c, $f3, $3c        ;; 07:4957 ????????
    db   $f4, $3c, $f3, $3c, $f4, $3c, $f3, $2c        ;; 07:495f ????????
    db   $f4, $2c, $f3, $2c, $f4, $2c, $f3, $2c        ;; 07:4967 ????????
    db   $f4, $2c, $f3, $1c, $f4, $1c, $f3, $1c        ;; 07:496f ????????
    db   $f4, $1c, $f3, $1c, $f4, $1c, $f3, $0c        ;; 07:4977 ????????
    db   $f4, $0c, $f3, $0c, $f4, $0c, $f3, $0c        ;; 07:497f ????????
    db   $f4, $0c, $fc, $29, $49, $e0, $45, $f2        ;; 07:4987 ????????
    db   $bb, $f3, $0b, $f2, $bb, $f3, $0b, $ed        ;; 07:498f ????????
    db   $e0, $44, $f2, $bb, $f3, $0b, $f2, $bb        ;; 07:4997 ????????
    db   $f3, $0b, $eb, $e0, $43, $f2, $bb, $f3        ;; 07:499f ????????
    db   $0b, $f2, $bb, $f3, $0b, $e0, $42, $e9        ;; 07:49a7 ????????
    db   $f2, $bb, $f3, $0b, $f2, $bb, $f3, $0b        ;; 07:49af ????????
    db   $e0, $41, $e7, $f2, $bb, $f3, $0b, $f2        ;; 07:49b7 ????????
    db   $bb, $f3, $0b, $e5, $f2, $bb, $f3, $0b        ;; 07:49bf ????????
    db   $f2, $bb, $f3, $0b, $e3, $f2, $bb, $f3        ;; 07:49c7 ????????
    db   $0b, $f2, $bb, $f3, $0b, $f7, $c0, $ef        ;; 07:49cf ????????
    db   $e0, $46, $f2, $4d, $6d, $8d, $9d, $bd        ;; 07:49d7 ????????
    db   $f3, $0d, $2d, $4d, $f9, $f7, $43, $f7        ;; 07:49df ????????
    db   $c0, $eb, $f2, $95, $f3, $75, $68, $45        ;; 07:49e7 ????????
    db   $08, $75, $68, $48, $d8, $08, $28, $48        ;; 07:49ef ????????
    db   $f2, $95, $f3, $75, $68, $45, $08, $75        ;; 07:49f7 ????????
    db   $68, $48, $d8, $08, $28, $48, $26, $dc        ;; 07:49ff ????????
    db   $ce, $25, $f2, $b5, $f3, $25, $02, $f2        ;; 07:4a07 ????????
    db   $95, $f3, $05, $f2, $b5, $65, $f3, $25        ;; 07:4a0f ????????
    db   $05, $f2, $b5, $d6, $f3, $2d, $3d, $45        ;; 07:4a17 ????????
    db   $d6, $dc, $ce, $fc, $e4, $49, $f9, $f7        ;; 07:4a1f ????????
    db   $82, $f7, $c4, $ef, $f3, $42, $65, $75        ;; 07:4a27 ????????
    db   $65, $45, $c2, $f7, $46, $c5, $f4, $45        ;; 07:4a2f ????????
    db   $65, $75, $65, $45, $c2, $f7, $43, $f7        ;; 07:4a37 ????????
    db   $05, $f7, $80, $f7, $c3, $f3, $72, $95        ;; 07:4a3f ????????
    db   $b5, $95, $75, $c2, $f7, $02, $f7, $82        ;; 07:4a47 ????????
    db   $f7, $46, $c5, $f4, $75, $95, $b5, $95        ;; 07:4a4f ????????
    db   $75, $c2, $fc, $26, $4a, $fe, $e3, $49        ;; 07:4a57 ????????
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
    db   $4a, $fe, $9a, $4a, $f7, $01, $f7, $c0        ;; 07:4b6f ????????
    db   $f8, $06, $ef, $f9, $f0, $48, $f1, $48        ;; 07:4b77 ????????
    db   $f0, $48, $f1, $48, $f0, $58, $f1, $58        ;; 07:4b7f ????????
    db   $f0, $58, $f1, $58, $f0, $68, $f1, $68        ;; 07:4b87 ????????
    db   $f0, $68, $f1, $68, $f0, $78, $f1, $78        ;; 07:4b8f ????????
    db   $f0, $78, $f1, $78, $fc, $7b, $4b, $f0        ;; 07:4b97 ????????
    db   $81, $f1, $45, $b1, $f0, $85, $f9, $f7        ;; 07:4b9f ????????
    db   $0a, $f7, $c4, $f0, $98, $95, $f1, $7b        ;; 07:4ba7 ????????
    db   $9b, $f0, $98, $95, $f1, $7b, $9b, $f0        ;; 07:4baf ????????
    db   $98, $95, $f1, $7b, $9b, $f0, $98, $95        ;; 07:4bb7 ????????
    db   $f1, $7b, $9b, $f0, $98, $95, $f1, $7b        ;; 07:4bbf ????????
    db   $9b, $f0, $98, $95, $f1, $7b, $9b, $f0        ;; 07:4bc7 ????????
    db   $98, $95, $f1, $7b, $9b, $f0, $98, $95        ;; 07:4bcf ????????
    db   $f1, $7b, $9b, $f7, $01, $f0, $78, $f1        ;; 07:4bd7 ????????
    db   $7b, $cb, $f0, $78, $f1, $7b, $cb, $f0        ;; 07:4bdf ????????
    db   $78, $f1, $7b, $cb, $f0, $78, $f1, $7b        ;; 07:4be7 ????????
    db   $cb, $f0, $58, $f1, $5b, $cb, $f0, $58        ;; 07:4bef ????????
    db   $f1, $5b, $cb, $f0, $58, $f1, $5b, $cb        ;; 07:4bf7 ????????
    db   $f0, $58, $f1, $5b, $cb, $f0, $b8, $f1        ;; 07:4bff ????????
    db   $bb, $cb, $f0, $b8, $f1, $bb, $cb, $f0        ;; 07:4c07 ????????
    db   $b8, $f1, $bb, $cb, $f0, $b8, $f1, $bb        ;; 07:4c0f ????????
    db   $cb, $48, $f2, $4b, $cb, $f1, $28, $f2        ;; 07:4c17 ????????
    db   $2b, $cb, $f1, $08, $f2, $0b, $cb, $f0        ;; 07:4c1f ????????
    db   $b8, $f1, $bb, $cb, $fc, $a6, $4b, $f9        ;; 07:4c27 ????????
    db   $f7, $0a, $f7, $c0, $f1, $08, $05, $08        ;; 07:4c2f ????????
    db   $08, $05, $08, $08, $05, $08, $08, $05        ;; 07:4c37 ????????
    db   $08, $f7, $c7, $0b, $7b, $f2, $0b, $f1        ;; 07:4c3f ????????
    db   $7b, $0b, $7b, $f2, $0b, $f1, $7b, $0b        ;; 07:4c47 ????????
    db   $7b, $f2, $2b, $f1, $7b, $0b, $7b, $f2        ;; 07:4c4f ????????
    db   $4b, $f1, $7b, $0b, $7b, $f2, $2b, $f1        ;; 07:4c57 ????????
    db   $7b, $0b, $7b, $f2, $0b, $f1, $7b, $0b        ;; 07:4c5f ????????
    db   $7b, $f2, $0b, $f1, $7b, $0b, $f2, $0b        ;; 07:4c67 ????????
    db   $f1, $2b, $f2, $2b, $f7, $c0, $f1, $48        ;; 07:4c6f ????????
    db   $45, $48, $48, $45, $48, $48, $45, $48        ;; 07:4c77 ????????
    db   $48, $45, $48, $f7, $c7, $4b, $bb, $f2        ;; 07:4c7f ????????
    db   $4b, $f1, $bb, $4b, $bb, $f2, $4b, $f1        ;; 07:4c87 ????????
    db   $bb, $4b, $bb, $f2, $6b, $f1, $bb, $4b        ;; 07:4c8f ????????
    db   $bb, $f2, $7b, $f1, $bb, $4b, $bb, $f2        ;; 07:4c97 ????????
    db   $6b, $f1, $bb, $4b, $bb, $f2, $4b, $f1        ;; 07:4c9f ????????
    db   $bb, $4b, $bb, $f2, $4b, $f1, $bb, $4b        ;; 07:4ca7 ????????
    db   $f2, $4b, $f1, $2b, $f2, $2b, $fc, $2f        ;; 07:4caf ????????
    db   $4c, $fe, $a5, $4b, $e0, $41, $f7, $05        ;; 07:4cb7 ????????
    db   $f7, $80, $f7, $43, $f7, $c0, $ef, $f2        ;; 07:4cbf ????????
    db   $5e, $6e, $7e, $db, $d3, $ae, $be, $f3        ;; 07:4cc7 ????????
    db   $0e, $db, $d3, $f2, $8e, $9e, $ae, $db        ;; 07:4ccf ????????
    db   $d3, $ae, $be, $f3, $0e, $db, $d3, $f2        ;; 07:4cd7 ????????
    db   $7e, $8e, $9e, $db, $d3, $d2, $f7, $41        ;; 07:4cdf ????????
    db   $f7, $82, $f7, $c4, $f4, $95, $05, $35        ;; 07:4ce7 ????????
    db   $f3, $65, $f7, $43, $f7, $80, $f7, $c0        ;; 07:4cef ????????
    db   $f2, $6e, $7e, $8e, $db, $d3, $be, $f3        ;; 07:4cf7 ????????
    db   $0e, $1e, $db, $d3, $f2, $ae, $be, $f3        ;; 07:4cff ????????
    db   $0e, $db, $d3, $f2, $be, $f3, $0e, $1e        ;; 07:4d07 ????????
    db   $db, $d3, $f2, $9e, $ae, $be, $db, $d3        ;; 07:4d0f ????????
    db   $d2, $f7, $c4, $f7, $82, $f7, $41, $f4        ;; 07:4d17 ????????
    db   $b5, $25, $55, $f3, $85, $f9, $f7, $c3        ;; 07:4d1f ????????
    db   $f7, $02, $f7, $43, $ed, $f3, $05, $35        ;; 07:4d27 ????????
    db   $78, $65, $08, $38, $08, $a8, $9c, $8c        ;; 07:4d2f ????????
    db   $7c, $68, $28, $68, $98, $f4, $03, $f3        ;; 07:4d37 ????????
    db   $a8, $d2, $fd, $4a, $4d, $93, $88, $d2        ;; 07:4d3f ????????
    db   $fc, $25, $4d, $93, $88, $d5, $f7, $c0        ;; 07:4d47 ????????
    db   $ef, $1b, $2b, $3b, $4b, $53, $25, $f2        ;; 07:4d4f ????????
    db   $ab, $f3, $2b, $5b, $8b, $7b, $5b, $73        ;; 07:4d57 ????????
    db   $83, $a5, $53, $25, $f2, $ab, $f3, $2b        ;; 07:4d5f ????????
    db   $5b, $8b, $7b, $5b, $73, $38, $d2, $73        ;; 07:4d67 ????????
    db   $45, $0b, $4b, $7b, $ab, $8b, $7b, $83        ;; 07:4d6f ????????
    db   $a3, $f4, $05, $f3, $93, $65, $2b, $6b        ;; 07:4d77 ????????
    db   $9b, $f4, $0b, $f3, $bb, $9b, $b8, $78        ;; 07:4d7f ????????
    db   $c8, $58, $c8, $28, $c8, $f2, $b8, $fe        ;; 07:4d87 ????????
    db   $bd, $4c, $f7, $82, $e6, $fb, $f7, $0a        ;; 07:4d8f ????????
    db   $f7, $40, $f7, $c2, $f2, $38, $08, $38        ;; 07:4d97 ????????
    db   $08, $fc, $95, $4d, $f7, $c3, $f7, $02        ;; 07:4d9f ????????
    db   $60, $f7, $41, $f4, $65, $f3, $95, $f4        ;; 07:4da7 ????????
    db   $05, $f3, $35, $fb, $f7, $0a, $f7, $40        ;; 07:4daf ????????
    db   $f7, $c2, $f2, $58, $18, $58, $18, $fc        ;; 07:4db7 ????????
    db   $b3, $4d, $f7, $c3, $f7, $02, $80, $f7        ;; 07:4dbf ????????
    db   $41, $f4, $85, $f3, $b5, $f4, $25, $f3        ;; 07:4dc7 ????????
    db   $55, $f9, $f7, $c4, $f7, $0a, $f7, $40        ;; 07:4dcf ????????
    db   $f2, $38, $08, $78, $08, $a8, $98, $28        ;; 07:4dd7 ????????
    db   $68, $f7, $02, $78, $38, $f3, $38, $0c        ;; 07:4ddf ????????
    db   $f2, $bc, $ac, $98, $68, $98, $f3, $08        ;; 07:4de7 ????????
    db   $78, $38, $08, $38, $f2, $a8, $78, $a8        ;; 07:4def ????????
    db   $f3, $38, $28, $f2, $98, $68, $f3, $18        ;; 07:4df7 ????????
    db   $f2, $88, $58, $88, $58, $fc, $d1, $4d        ;; 07:4dff ????????
    db   $f9, $f7, $c1, $ab, $5b, $2b, $5b, $8b        ;; 07:4e07 ????????
    db   $5b, $2b, $5b, $7b, $5b, $2b, $5b, $8b        ;; 07:4e0f ????????
    db   $5b, $2b, $5b, $f7, $c4, $a8, $38, $28        ;; 07:4e17 ????????
    db   $88, $38, $28, $78, $38, $fc, $08, $4e        ;; 07:4e1f ????????
    db   $f7, $c1, $f3, $0b, $f2, $7b, $4b, $7b        ;; 07:4e27 ????????
    db   $ab, $7b, $4b, $7b, $8b, $7b, $4b, $7b        ;; 07:4e2f ????????
    db   $ab, $7b, $4b, $7b, $f7, $c4, $f3, $08        ;; 07:4e37 ????????
    db   $f2, $58, $38, $a8, $58, $38, $88, $58        ;; 07:4e3f ????????
    db   $f7, $c1, $f3, $2b, $f2, $9b, $6b, $9b        ;; 07:4e47 ????????
    db   $f3, $0b, $f2, $9b, $6b, $9b, $bb, $9b        ;; 07:4e4f ????????
    db   $6b, $9b, $f3, $0b, $f2, $9b, $6b, $9b        ;; 07:4e57 ????????
    db   $f7, $c4, $f3, $28, $f2, $b8, $c8, $78        ;; 07:4e5f ????????
    db   $c8, $58, $c8, $28, $fe, $94, $4d, $f8        ;; 07:4e67 ????????
    db   $06, $f7, $40, $ef, $fb, $f7, $0a, $f7        ;; 07:4e6f ????????
    db   $c0, $f1, $08, $08, $08, $fc, $74, $4e        ;; 07:4e77 ????????
    db   $f7, $01, $08, $38, $78, $a8, $f7, $0a        ;; 07:4e7f ????????
    db   $f7, $c4, $08, $05, $08, $0b, $2b, $3b        ;; 07:4e87 ????????
    db   $2b, $05, $f7, $c0, $08, $05, $08, $0b        ;; 07:4e8f ????????
    db   $2b, $3b, $2b, $05, $fb, $18, $18, $18        ;; 07:4e97 ????????
    db   $fc, $9c, $4e, $f7, $01, $18, $58, $88        ;; 07:4e9f ????????
    db   $f2, $18, $f7, $c4, $f7, $0a, $f1, $28        ;; 07:4ea7 ????????
    db   $25, $28, $2b, $4b, $5b, $4b, $25, $f7        ;; 07:4eaf ????????
    db   $c0, $28, $25, $28, $2b, $4b, $5b, $4b        ;; 07:4eb7 ????????
    db   $25, $f9, $f7, $0a, $08, $05, $78, $28        ;; 07:4ebf ????????
    db   $25, $98, $38, $35, $a8, $28, $25, $98        ;; 07:4ec7 ????????
    db   $f7, $01, $08, $7b, $cb, $08, $36, $cb        ;; 07:4ecf ????????
    db   $3b, $cb, $ab, $cb, $38, $28, $9b, $cb        ;; 07:4ed7 ????????
    db   $28, $16, $cb, $1b, $cb, $8b, $cb, $18        ;; 07:4edf ????????
    db   $fc, $c1, $4e, $f9, $f7, $cc, $f0, $a8        ;; 07:4ee7 ????????
    db   $f1, $ab, $cb, $f0, $a8, $f1, $ab, $cb        ;; 07:4eef ????????
    db   $f0, $a8, $f1, $ab, $cb, $f0, $a8, $f1        ;; 07:4ef7 ????????
    db   $ab, $cb, $f7, $c0, $35, $a8, $55, $a8        ;; 07:4eff ????????
    db   $78, $a8, $fc, $eb, $4e, $f7, $cc, $08        ;; 07:4f07 ????????
    db   $f2, $0b, $cb, $f1, $08, $f2, $0b, $cb        ;; 07:4f0f ????????
    db   $f1, $08, $f2, $0b, $cb, $f1, $08, $f2        ;; 07:4f17 ????????
    db   $0b, $cb, $f7, $c0, $f1, $55, $f2, $08        ;; 07:4f1f ????????
    db   $f1, $75, $f2, $08, $f1, $88, $f2, $08        ;; 07:4f27 ????????
    db   $f7, $cc, $f1, $28, $9b, $cb, $28, $9b        ;; 07:4f2f ????????
    db   $cb, $28, $9b, $cb, $28, $9b, $cb, $f7        ;; 07:4f37 ????????
    db   $c0, $78, $f0, $75, $95, $a5, $b8, $fe        ;; 07:4f3f ????????
    db   $73, $4e, $e8, $f7, $09, $f7, $81, $f7        ;; 07:4f47 ????????
    db   $c0, $f7, $40, $e0, $3e, $fb, $f4, $2b        ;; 07:4f4f ????????
    db   $c8, $cd, $4d, $f3, $bb, $c6, $f4, $2b        ;; 07:4f57 ????????
    db   $f3, $bd, $cd, $c8, $f4, $6b, $c8, $4b        ;; 07:4f5f ????????
    db   $fc, $55, $4f, $f9, $f7, $02, $f7, $82        ;; 07:4f67 ????????
    db   $f7, $c3, $f7, $43, $ed, $f3, $61, $25        ;; 07:4f6f ????????
    db   $42, $15, $f2, $b8, $98, $fd, $87, $4f        ;; 07:4f77 ????????
    db   $b0, $d2, $f3, $15, $25, $fc, $6b, $4f        ;; 07:4f7f ????????
    db   $e0, $35, $f2, $b0, $c0, $f9, $f7, $02        ;; 07:4f87 ????????
    db   $f7, $82, $f7, $c0, $f7, $43, $ed, $f2        ;; 07:4f8f ????????
    db   $ba, $ca, $ba, $f3, $62, $4a, $6a, $8a        ;; 07:4f97 ????????
    db   $65, $f2, $b5, $f3, $aa, $ca, $8a, $6a        ;; 07:4f9f ????????
    db   $ca, $5a, $3a, $ca, $3a, $a2, $8a, $aa        ;; 07:4fa7 ????????
    db   $ba, $a5, $35, $f4, $1a, $ca, $f3, $ba        ;; 07:4faf ????????
    db   $aa, $ca, $8a, $6a, $3a, $4a, $65, $d7        ;; 07:4fb7 ????????
    db   $3c, $4c, $6a, $ca, $ba, $61, $45, $3a        ;; 07:4fbf ????????
    db   $f2, $ba, $f3, $1a, $35, $d7, $f2, $bc        ;; 07:4fc7 ????????
    db   $f3, $1c, $3a, $ca, $8a, $31, $15, $fd        ;; 07:4fcf ????????
    db   $09, $50, $f2, $ba, $ca, $ba, $f3, $b2        ;; 07:4fd7 ????????
    db   $8c, $cc, $8a, $aa, $b2, $f4, $15, $f3        ;; 07:4fdf ????????
    db   $b5, $aa, $6a, $8a, $a2, $6c, $cc, $6a        ;; 07:4fe7 ????????
    db   $8a, $a2, $b5, $a5, $8a, $4a, $6a, $82        ;; 07:4fef ????????
    db   $4c, $cc, $4a, $6a, $82, $a5, $b5, $a2        ;; 07:4ff7 ????????
    db   $d7, $8a, $a7, $ba, $f4, $11, $c5, $fc        ;; 07:4fff ????????
    db   $8d, $4f, $f2, $ba, $ca, $ba, $f3, $b2        ;; 07:5007 ????????
    db   $8c, $cc, $8a, $aa, $e0, $32, $b2, $e0        ;; 07:500f ????????
    db   $30, $f4, $15, $f3, $95, $f7, $05, $f7        ;; 07:5017 ????????
    db   $80, $f7, $c3, $f7, $43, $ef, $e0, $2f        ;; 07:501f ????????
    db   $b2, $62, $42, $32, $12, $e0, $2d, $f2        ;; 07:5027 ????????
    db   $b2, $e0, $28, $a2, $e0, $23, $82, $e0        ;; 07:502f ????????
    db   $2b, $b8, $f3, $68, $78, $98, $b2, $d3        ;; 07:5037 ????????
    db   $c8, $b8, $98, $f4, $28, $f3, $b8, $70        ;; 07:503f ????????
    db   $c2, $68, $48, $98, $28, $02, $d8, $f2        ;; 07:5047 ????????
    db   $b8, $f3, $08, $78, $65, $42, $25, $40        ;; 07:504f ????????
    db   $d5, $c1, $f9, $f7, $02, $f7, $81, $f7        ;; 07:5057 ????????
    db   $c3, $f7, $40, $e3, $f3, $8b, $9b, $e4        ;; 07:505f ????????
    db   $8b, $9b, $e5, $8b, $9b, $e7, $8b, $9b        ;; 07:5067 ????????
    db   $e9, $8b, $9b, $eb, $8b, $9b, $ed, $8b        ;; 07:506f ????????
    db   $9b, $ef, $8b, $9b, $fc, $5a, $50, $f9        ;; 07:5077 ????????
    db   $e3, $f3, $bb, $f4, $0b, $e4, $f3, $bb        ;; 07:507f ????????
    db   $f4, $0b, $e5, $f3, $bb, $f4, $0b, $e7        ;; 07:5087 ????????
    db   $f3, $bb, $f4, $0b, $e9, $f3, $bb, $f4        ;; 07:508f ????????
    db   $0b, $eb, $f3, $bb, $f4, $0b, $ed, $f3        ;; 07:5097 ????????
    db   $bb, $f4, $0b, $ef, $f3, $bb, $f4, $0b        ;; 07:509f ????????
    db   $fc, $7f, $50, $f7, $05, $f7, $82, $f7        ;; 07:50a7 ????????
    db   $c0, $f7, $43, $ef, $f2, $99, $cd, $98        ;; 07:50af ????????
    db   $f3, $42, $3b, $4b, $68, $45, $f2, $95        ;; 07:50b7 ????????
    db   $f3, $88, $68, $48, $38, $19, $cd, $18        ;; 07:50bf ????????
    db   $82, $6b, $8b, $98, $85, $15, $b8, $98        ;; 07:50c7 ????????
    db   $88, $68, $f9, $80, $d5, $c5, $68, $48        ;; 07:50cf ????????
    db   $28, $18, $f2, $b2, $f3, $b2, $d2, $25        ;; 07:50d7 ????????
    db   $65, $fc, $d2, $50, $fa, $80, $d5, $c5        ;; 07:50df ????????
    db   $25, $65, $fc, $e4, $50, $80, $d5, $ff        ;; 07:50e7 ????????
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
    db   $ff, $f7, $01, $f8, $06, $f7, $c0, $ef        ;; 07:52bf ????????
    db   $f9, $c0, $fc, $c8, $52, $f9, $f1, $28        ;; 07:52c7 ????????
    db   $c8, $28, $c8, $28, $c8, $28, $c8, $fc        ;; 07:52cf ????????
    db   $cd, $52, $f9, $f0, $78, $f1, $7b, $cb        ;; 07:52d7 ????????
    db   $f0, $78, $f1, $7b, $cb, $f0, $78, $f1        ;; 07:52df ????????
    db   $7b, $cb, $f0, $78, $f1, $7b, $cb, $f0        ;; 07:52e7 ????????
    db   $98, $f1, $9b, $cb, $f0, $98, $f1, $9b        ;; 07:52ef ????????
    db   $cb, $f0, $98, $f1, $9b, $cb, $f0, $98        ;; 07:52f7 ????????
    db   $f1, $9b, $cb, $fd, $30, $53, $f0, $b8        ;; 07:52ff ????????
    db   $f1, $bb, $cb, $f0, $b8, $f1, $bb, $cb        ;; 07:5307 ????????
    db   $f0, $b8, $f1, $bb, $cb, $f0, $b8, $f1        ;; 07:530f ????????
    db   $bb, $cb, $f0, $b8, $f1, $bb, $cb, $f0        ;; 07:5317 ????????
    db   $b8, $f1, $bb, $cb, $f0, $b8, $f1, $bb        ;; 07:531f ????????
    db   $cb, $f0, $98, $f1, $9b, $cb, $fc, $da        ;; 07:5327 ????????
    db   $52, $f7, $0b, $f0, $b5, $b5, $b5, $b5        ;; 07:532f ????????
    db   $b5, $b5, $b7, $b7, $b7, $f9, $f7, $0b        ;; 07:5337 ????????
    db   $f7, $c4, $f0, $b5, $b5, $b5, $b5, $b5        ;; 07:533f ????????
    db   $b5, $a5, $a5, $f1, $35, $35, $35, $35        ;; 07:5347 ????????
    db   $35, $35, $45, $45, $f7, $01, $f0, $ba        ;; 07:534f ????????
    db   $c7, $bc, $cc, $bc, $cc, $bc, $cc, $b2        ;; 07:5357 ????????
    db   $9a, $c7, $9c, $cc, $9c, $cc, $9c, $cc        ;; 07:535f ????????
    db   $92, $8a, $c7, $8c, $cc, $8c, $cc, $8c        ;; 07:5367 ????????
    db   $cc, $82, $6a, $c7, $6a, $c7, $aa, $c7        ;; 07:536f ????????
    db   $f1, $1a, $c7, $fd, $c6, $53, $4a, $c7        ;; 07:5377 ????????
    db   $f0, $b5, $f1, $4a, $ca, $4a, $f0, $b5        ;; 07:537f ????????
    db   $f1, $1a, $c7, $f0, $85, $f1, $1a, $ca        ;; 07:5387 ????????
    db   $1a, $f0, $85, $f1, $6a, $c7, $15, $6a        ;; 07:538f ????????
    db   $ca, $6a, $15, $3a, $c7, $f0, $a5, $f1        ;; 07:5397 ????????
    db   $3a, $ca, $3a, $f0, $a5, $f1, $4a, $c7        ;; 07:539f ????????
    db   $f0, $b5, $f1, $4a, $ca, $4a, $f0, $b5        ;; 07:53a7 ????????
    db   $f1, $5a, $c7, $15, $5a, $ca, $5a, $15        ;; 07:53af ????????
    db   $6a, $c7, $65, $4a, $c7, $45, $3a, $c7        ;; 07:53b7 ????????
    db   $35, $1a, $c7, $15, $fc, $3d, $53, $47        ;; 07:53bf ????????
    db   $ca, $4c, $cc, $4c, $cc, $4c, $cc, $45        ;; 07:53c7 ????????
    db   $c5, $75, $f0, $7c, $cc, $7c, $cc, $7c        ;; 07:53cf ????????
    db   $cc, $f1, $95, $f0, $9c, $cc, $9c, $cc        ;; 07:53d7 ????????
    db   $9c, $cc, $fb, $f8, $00, $f7, $c0, $f0        ;; 07:53df ????????
    db   $b8, $f1, $68, $b8, $f2, $18, $38, $18        ;; 07:53e7 ????????
    db   $f1, $b8, $68, $fc, $e2, $53, $48, $b8        ;; 07:53ef ????????
    db   $f2, $48, $f1, $b8, $f2, $48, $f1, $b8        ;; 07:53f7 ????????
    db   $f2, $48, $f1, $b8, $28, $b8, $f2, $68        ;; 07:53ff ????????
    db   $f1, $b8, $f2, $68, $f1, $b8, $f2, $68        ;; 07:5407 ????????
    db   $f1, $b8, $08, $78, $f2, $48, $f1, $78        ;; 07:540f ????????
    db   $f2, $48, $f1, $78, $f2, $48, $f1, $78        ;; 07:5417 ????????
    db   $f0, $b8, $f1, $68, $f2, $28, $f1, $68        ;; 07:541f ????????
    db   $f2, $28, $f1, $68, $f2, $28, $f1, $68        ;; 07:5427 ????????
    db   $f0, $98, $f1, $48, $f2, $08, $f1, $48        ;; 07:542f ????????
    db   $f2, $08, $f1, $48, $f2, $08, $f1, $48        ;; 07:5437 ????????
    db   $f0, $b8, $f1, $68, $f2, $28, $f1, $68        ;; 07:543f ????????
    db   $f2, $28, $f1, $68, $f2, $28, $f1, $68        ;; 07:5447 ????????
    db   $08, $78, $f2, $48, $f1, $78, $f2, $48        ;; 07:544f ????????
    db   $f1, $78, $f2, $48, $f1, $78, $28, $98        ;; 07:5457 ????????
    db   $f2, $68, $f1, $98, $f2, $68, $f1, $98        ;; 07:545f ????????
    db   $f2, $68, $f1, $98, $f9, $48, $b8, $f2        ;; 07:5467 ????????
    db   $88, $f1, $b8, $f2, $88, $f1, $b8, $f2        ;; 07:546f ????????
    db   $88, $f1, $b8, $fc, $6c, $54, $f9, $48        ;; 07:5477 ????????
    db   $b8, $f2, $78, $f1, $b8, $f2, $78, $f1        ;; 07:547f ????????
    db   $b8, $f2, $78, $f1, $b8, $fc, $7e, $54        ;; 07:5487 ????????
    db   $f8, $07, $f7, $c3, $f0, $98, $f1, $48        ;; 07:548f ????????
    db   $98, $48, $98, $48, $98, $48, $f0, $98        ;; 07:5497 ????????
    db   $f1, $48, $98, $48, $f0, $88, $f1, $38        ;; 07:549f ????????
    db   $88, $f2, $08, $f1, $18, $88, $f2, $18        ;; 07:54a7 ????????
    db   $f1, $88, $f2, $18, $f1, $88, $f2, $18        ;; 07:54af ????????
    db   $f1, $88, $18, $88, $f2, $18, $f1, $88        ;; 07:54b7 ????????
    db   $28, $68, $98, $f2, $28, $f9, $f1, $48        ;; 07:54bf ????????
    db   $b8, $f2, $88, $f1, $b8, $f2, $88, $f1        ;; 07:54c7 ????????
    db   $b8, $f2, $88, $f1, $b8, $48, $b8, $f2        ;; 07:54cf ????????
    db   $88, $f1, $b8, $f2, $68, $f1, $b8, $f2        ;; 07:54d7 ????????
    db   $28, $f1, $b8, $f0, $ba, $f1, $6a, $ba        ;; 07:54df ????????
    db   $f2, $2a, $f1, $ba, $6a, $f2, $6a, $2a        ;; 07:54e7 ????????
    db   $f1, $ba, $f2, $ba, $6a, $2a, $f0, $ba        ;; 07:54ef ????????
    db   $f1, $6a, $ba, $f2, $2a, $f1, $ba, $6a        ;; 07:54f7 ????????
    db   $f2, $6a, $2a, $f1, $ba, $f2, $ba, $6a        ;; 07:54ff ????????
    db   $2a, $fc, $c5, $54, $f9, $f1, $48, $b8        ;; 07:5507 ????????
    db   $f2, $48, $f1, $b8, $f2, $48, $f1, $b8        ;; 07:550f ????????
    db   $f2, $48, $f1, $b8, $48, $b8, $f2, $48        ;; 07:5517 ????????
    db   $f1, $b8, $28, $f2, $28, $f1, $68, $f2        ;; 07:551f ????????
    db   $28, $fc, $0c, $55, $e0, $2a, $f1, $48        ;; 07:5527 ????????
    db   $b8, $e0, $29, $f2, $48, $f1, $b8, $e0        ;; 07:552f ????????
    db   $27, $f2, $48, $f1, $b8, $e0, $26, $f2        ;; 07:5537 ????????
    db   $48, $f1, $b8, $e0, $25, $48, $b8, $e0        ;; 07:553f ????????
    db   $24, $f2, $48, $f1, $b8, $e0, $23, $28        ;; 07:5547 ????????
    db   $f2, $28, $e0, $21, $f1, $68, $e0, $1f        ;; 07:554f ????????
    db   $f2, $28, $e0, $1e, $f1, $40, $ff, $f7        ;; 07:5557 ????????
    db   $02, $f7, $82, $ed, $e0, $44, $f7, $c3        ;; 07:555f ????????
    db   $f1, $bc, $f2, $0c, $f7, $c0, $2c, $4c        ;; 07:5567 ????????
    db   $f7, $c4, $6c, $8c, $f9, $f7, $46, $f7        ;; 07:556f ????????
    db   $c3, $90, $a2, $f3, $22, $fd, $86, $55        ;; 07:5577 ????????
    db   $01, $f2, $95, $a0, $fc, $74, $55, $f3        ;; 07:557f ????????
    db   $01, $45, $50, $f9, $f7, $02, $f7, $82        ;; 07:5587 ????????
    db   $f7, $c0, $f7, $43, $ed, $f2, $92, $d8        ;; 07:558f ????????
    db   $f3, $05, $48, $25, $f2, $a2, $9c, $ac        ;; 07:5597 ????????
    db   $9c, $78, $92, $d8, $f3, $05, $48, $65        ;; 07:559f ????????
    db   $25, $da, $de, $ce, $25, $48, $fd, $c5        ;; 07:55a7 ????????
    db   $55, $53, $03, $f2, $95, $83, $93, $b5        ;; 07:55af ????????
    db   $f3, $02, $d8, $25, $08, $f2, $b3, $f3        ;; 07:55b7 ????????
    db   $05, $25, $48, $fc, $8b, $55, $52, $25        ;; 07:55bf ????????
    db   $f2, $a5, $f3, $45, $05, $f2, $95, $f3        ;; 07:55c7 ????????
    db   $05, $20, $f7, $02, $f7, $82, $f7, $43        ;; 07:55cf ????????
    db   $ed, $f7, $c3, $c1, $f1, $bc, $f2, $0c        ;; 07:55d7 ????????
    db   $f7, $c0, $2c, $4c, $f7, $c4, $6c, $8c        ;; 07:55df ????????
    db   $fe, $73, $55, $f7, $02, $f7, $82, $eb        ;; 07:55e7 ????????
    db   $f7, $c4, $f1, $8c, $9c, $f7, $c0, $bc        ;; 07:55ef ????????
    db   $f2, $0c, $f7, $c3, $2c, $4c, $f9, $f7        ;; 07:55f7 ????????
    db   $46, $f7, $c4, $f2, $00, $22, $52, $fd        ;; 07:55ff ????????
    db   $12, $56, $41, $05, $23, $03, $f1, $a5        ;; 07:5607 ????????
    db   $fc, $fe, $55, $f2, $41, $75, $a3, $93        ;; 07:560f ????????
    db   $75, $f9, $f7, $07, $f7, $82, $f7, $c9        ;; 07:5617 ????????
    db   $f7, $43, $f2, $43, $23, $05, $53, $43        ;; 07:561f ????????
    db   $25, $43, $23, $05, $63, $43, $25, $fd        ;; 07:5627 ????????
    db   $66, $56, $95, $08, $75, $08, $58, $08        ;; 07:562f ????????
    db   $48, $f1, $88, $b8, $88, $f2, $28, $f1        ;; 07:5637 ????????
    db   $88, $f2, $88, $f1, $88, $f2, $98, $08        ;; 07:563f ????????
    db   $58, $08, $28, $08, $58, $98, $f7, $c2        ;; 07:5647 ????????
    db   $88, $4d, $cd, $4d, $cd, $98, $4d, $cd        ;; 07:564f ????????
    db   $4d, $cd, $b8, $4d, $cd, $4d, $cd, $8b        ;; 07:5657 ????????
    db   $4b, $2b, $f1, $bb, $fc, $19, $56, $f2        ;; 07:565f ????????
    db   $a5, $28, $95, $28, $78, $28, $98, $08        ;; 07:5667 ????????
    db   $48, $08, $28, $08, $48, $08, $f7, $c2        ;; 07:566f ????????
    db   $68, $2d, $cd, $2d, $cd, $a8, $2d, $cd        ;; 07:5677 ????????
    db   $2d, $cd, $98, $2d, $cd, $2d, $cd, $78        ;; 07:567f ????????
    db   $2d, $cd, $2d, $cd, $68, $2d, $cd, $2d        ;; 07:5687 ????????
    db   $cd, $08, $48, $28, $f1, $98, $f7, $02        ;; 07:568f ????????
    db   $f7, $82, $f7, $43, $f7, $c4, $8c, $9c        ;; 07:5697 ????????
    db   $f7, $c0, $bc, $f2, $0c, $f7, $c3, $2c        ;; 07:569f ????????
    db   $4c, $fe, $fd, $55, $f7, $01, $f8, $06        ;; 07:56a7 ????????
    db   $ef, $c5, $fb, $f7, $c0, $f0, $98, $f1        ;; 07:56af ????????
    db   $4d, $cd, $4d, $cd, $f0, $98, $f1, $4d        ;; 07:56b7 ????????
    db   $cd, $4d, $cd, $f0, $98, $f1, $4d, $cd        ;; 07:56bf ????????
    db   $4d, $cd, $f0, $98, $f1, $4d, $cd, $4d        ;; 07:56c7 ????????
    db   $cd, $f0, $a8, $f1, $5d, $cd, $5d, $cd        ;; 07:56cf ????????
    db   $f0, $a8, $f1, $5d, $cd, $5d, $cd, $f0        ;; 07:56d7 ????????
    db   $a8, $f1, $5d, $cd, $5d, $cd, $f0, $a8        ;; 07:56df ????????
    db   $f1, $5d, $cd, $5d, $cd, $fc, $b2, $56        ;; 07:56e7 ????????
    db   $f9, $f7, $ca, $f0, $98, $f1, $4b, $cb        ;; 07:56ef ????????
    db   $f0, $98, $f1, $4b, $cb, $f0, $98, $f1        ;; 07:56f7 ????????
    db   $4b, $cb, $f0, $98, $f1, $4b, $cb, $f0        ;; 07:56ff ????????
    db   $a8, $f1, $5b, $cb, $f0, $a8, $f1, $5b        ;; 07:5707 ????????
    db   $cb, $f0, $a8, $f1, $5b, $cb, $f0, $a8        ;; 07:570f ????????
    db   $f1, $5b, $cb, $f0, $98, $f1, $4b, $cb        ;; 07:5717 ????????
    db   $f0, $98, $f1, $4b, $cb, $f0, $98, $f1        ;; 07:571f ????????
    db   $4b, $cb, $f0, $98, $f1, $4b, $cb, $28        ;; 07:5727 ????????
    db   $f0, $9b, $cb, $f1, $28, $f0, $9b, $cb        ;; 07:572f ????????
    db   $f1, $28, $f0, $9b, $cb, $f1, $28, $f0        ;; 07:5737 ????????
    db   $9b, $cb, $fd, $87, $57, $f1, $58, $0b        ;; 07:573f ????????
    db   $cb, $58, $0b, $cb, $58, $0b, $cb, $58        ;; 07:5747 ????????
    db   $0b, $cb, $48, $f0, $bb, $cb, $f1, $48        ;; 07:574f ????????
    db   $f0, $bb, $cb, $f1, $48, $f0, $bb, $cb        ;; 07:5757 ????????
    db   $f1, $48, $f0, $bb, $cb, $f1, $58, $0b        ;; 07:575f ????????
    db   $cb, $58, $0b, $cb, $58, $0b, $cb, $58        ;; 07:5767 ????????
    db   $0b, $cb, $48, $f0, $bb, $cb, $f1, $48        ;; 07:576f ????????
    db   $f0, $bb, $cb, $f1, $48, $f0, $bb, $cb        ;; 07:5777 ????????
    db   $f1, $48, $f0, $bb, $cb, $fc, $f0, $56        ;; 07:577f ????????
    db   $a8, $f1, $5b, $cb, $f0, $a8, $f1, $5b        ;; 07:5787 ????????
    db   $cb, $f0, $a8, $f1, $5b, $cb, $f0, $a8        ;; 07:578f ????????
    db   $f1, $5b, $cb, $f0, $98, $f1, $4b, $cb        ;; 07:5797 ????????
    db   $f0, $98, $f1, $4b, $cb, $f0, $98, $f1        ;; 07:579f ????????
    db   $4b, $cb, $f0, $98, $f1, $4b, $cb, $28        ;; 07:57a7 ????????
    db   $f0, $9b, $cb, $f1, $28, $f0, $9b, $cb        ;; 07:57af ????????
    db   $f1, $28, $f0, $9b, $cb, $f1, $28, $f0        ;; 07:57b7 ????????
    db   $9b, $cb, $f1, $28, $f0, $9b, $cb, $f1        ;; 07:57bf ????????
    db   $28, $f0, $9b, $cb, $f1, $28, $f0, $9b        ;; 07:57c7 ????????
    db   $cb, $f1, $28, $f0, $9b, $cb, $fe, $b1        ;; 07:57cf ????????
    db   $56, $f7, $40, $f7, $03, $f8, $02, $ef        ;; 07:57d7 ????????
    db   $f9, $f7, $c3, $f1, $48, $58, $b8, $f2        ;; 07:57df ????????
    db   $28, $48, $28, $f1, $b8, $58, $48, $58        ;; 07:57e7 ????????
    db   $b8, $f2, $28, $48, $28, $f1, $b8, $58        ;; 07:57ef ????????
    db   $48, $58, $f2, $08, $48, $58, $48, $08        ;; 07:57f7 ????????
    db   $f1, $58, $fd, $11, $58, $48, $58, $f2        ;; 07:57ff ????????
    db   $08, $48, $58, $48, $08, $f1, $58, $fc        ;; 07:5807 ????????
    db   $e0, $57, $48, $58, $f2, $08, $48, $58        ;; 07:580f ????????
    db   $48, $08, $f1, $5a, $de, $ce, $f9, $f7        ;; 07:5817 ????????
    db   $46, $f7, $c0, $f8, $04, $f7, $03, $ef        ;; 07:581f ????????
    db   $f3, $b5, $95, $75, $65, $95, $75, $65        ;; 07:5827 ????????
    db   $46, $dc, $ce, $40, $05, $d6, $dc, $ce        ;; 07:582f ????????
    db   $05, $25, $42, $f2, $b2, $d2, $f3, $65        ;; 07:5837 ????????
    db   $46, $dc, $ce, $fd, $4a, $58, $40, $00        ;; 07:583f ????????
    db   $fc, $1e, $58, $72, $42, $d1, $d8, $da        ;; 07:5847 ????????
    db   $de, $ce, $fe, $d8, $57, $f7, $80, $f7        ;; 07:584f ????????
    db   $46, $f7, $04, $f7, $c4, $e3, $ca, $f9        ;; 07:5857 ????????
    db   $f2, $48, $58, $b8, $f3, $28, $48, $28        ;; 07:585f ????????
    db   $f2, $b8, $58, $48, $58, $b8, $f3, $28        ;; 07:5867 ????????
    db   $48, $28, $f2, $b8, $58, $48, $58, $f3        ;; 07:586f ????????
    db   $08, $48, $58, $48, $08, $f2, $58, $fd        ;; 07:5877 ????????
    db   $8e, $58, $48, $58, $f3, $08, $48, $58        ;; 07:587f ????????
    db   $48, $08, $f2, $58, $fc, $5f, $58, $48        ;; 07:5887 ????????
    db   $58, $f3, $08, $48, $58, $48, $08, $f2        ;; 07:588f ????????
    db   $5c, $fb, $f7, $40, $f7, $03, $f7, $c6        ;; 07:5897 ????????
    db   $f7, $81, $f2, $ea, $4b, $6b, $7b, $6b        ;; 07:589f ????????
    db   $e8, $4b, $6b, $7b, $6b, $e7, $4b, $6b        ;; 07:58a7 ????????
    db   $7b, $6b, $e5, $4b, $6b, $7b, $6b, $e3        ;; 07:58af ????????
    db   $4b, $6b, $7b, $6b, $e5, $4b, $6b, $7b        ;; 07:58b7 ????????
    db   $6b, $e7, $4b, $6b, $7b, $6b, $e8, $4b        ;; 07:58bf ????????
    db   $6b, $7b, $4b, $ea, $5b, $7b, $9b, $7b        ;; 07:58c7 ????????
    db   $e8, $5b, $7b, $9b, $7b, $e7, $5b, $7b        ;; 07:58cf ????????
    db   $9b, $7b, $e5, $5b, $7b, $9b, $7b, $e3        ;; 07:58d7 ????????
    db   $5b, $7b, $9b, $7b, $e5, $5b, $7b, $9b        ;; 07:58df ????????
    db   $7b, $e7, $5b, $7b, $9b, $7b, $e8, $5b        ;; 07:58e7 ????????
    db   $7b, $9b, $5b, $fc, $99, $58, $fe, $54        ;; 07:58ef ????????
    db   $58, $e0, $30, $f7, $00, $f7, $82, $f7        ;; 07:58f7 ????????
    db   $c8, $f7, $43, $e5, $f0, $42, $d6, $de        ;; 07:58ff ????????
    db   $9e, $ae, $b5, $f1, $40, $f0, $52, $d6        ;; 07:5907 ????????
    db   $de, $ae, $be, $f1, $05, $50, $f0, $42        ;; 07:590f ????????
    db   $d6, $de, $9e, $ae, $b5, $f1, $40, $f0        ;; 07:5917 ????????
    db   $22, $d6, $de, $7e, $8e, $95, $f1, $20        ;; 07:591f ????????
    db   $fe, $03, $59, $e0, $46, $f7, $0a, $f7        ;; 07:5927 ????????
    db   $82, $f7, $c3, $f7, $43, $ef, $f9, $f3        ;; 07:592f ????????
    db   $88, $85, $88, $85, $88, $85, $88, $85        ;; 07:5937 ????????
    db   $85, $88, $88, $78, $75, $78, $75, $78        ;; 07:593f ????????
    db   $75, $fd, $53, $59, $78, $75, $75, $78        ;; 07:5947 ????????
    db   $78, $fc, $36, $59, $78, $75, $4b, $5b        ;; 07:594f ????????
    db   $6b, $7b, $8b, $7b, $6b, $5b, $f9, $f7        ;; 07:5957 ????????
    db   $02, $f7, $cd, $ef, $f3, $42, $02, $f2        ;; 07:595f ????????
    db   $92, $f3, $05, $45, $35, $f2, $bb, $c6        ;; 07:5967 ????????
    db   $c8, $ec, $f3, $3b, $cb, $f2, $b5, $e8        ;; 07:596f ????????
    db   $f3, $3b, $cb, $f2, $b5, $e4, $f3, $3b        ;; 07:5977 ????????
    db   $cb, $f2, $b5, $ef, $f3, $22, $f2, $a2        ;; 07:597f ????????
    db   $45, $55, $a5, $f3, $25, $15, $f2, $9b        ;; 07:5987 ????????
    db   $c6, $c8, $ec, $f3, $1b, $cb, $f2, $95        ;; 07:598f ????????
    db   $fd, $a9, $59, $e8, $f3, $1b, $cb, $f2        ;; 07:5997 ????????
    db   $95, $e4, $f3, $1b, $cb, $f2, $95, $fc        ;; 07:599f ????????
    db   $5e, $59, $e8, $f3, $1b, $cb, $f2, $95        ;; 07:59a7 ????????
    db   $e4, $f3, $1b, $cb, $f2, $95, $f7, $c0        ;; 07:59af ????????
    db   $ef, $9b, $bb, $f3, $0b, $1b, $f9, $22        ;; 07:59b7 ????????
    db   $02, $f2, $b2, $92, $f3, $25, $05, $f2        ;; 07:59bf ????????
    db   $b5, $95, $fd, $e2, $59, $bb, $4b, $9b        ;; 07:59c7 ????????
    db   $bb, $f3, $4b, $f2, $bb, $f3, $2b, $4b        ;; 07:59cf ????????
    db   $8b, $4b, $8b, $9b, $bb, $9b, $8b, $4b        ;; 07:59d7 ????????
    db   $fc, $be, $59, $f2, $8b, $9b, $bb, $9b        ;; 07:59df ????????
    db   $bb, $f3, $0b, $f2, $bb, $f3, $0b, $2b        ;; 07:59e7 ????????
    db   $0b, $2b, $4b, $2b, $4b, $5b, $8b, $fe        ;; 07:59ef ????????
    db   $5d, $59, $f7, $0a, $f7, $c4, $f7, $43        ;; 07:59f7 ????????
    db   $e8, $f9, $f7, $81, $f3, $38, $f2, $95        ;; 07:59ff ????????
    db   $f3, $38, $f2, $95, $f3, $38, $f2, $95        ;; 07:5a07 ????????
    db   $f3, $38, $f2, $95, $9b, $8b, $9b, $ab        ;; 07:5a0f ????????
    db   $bb, $ab, $9b, $8b, $f3, $28, $f2, $85        ;; 07:5a17 ????????
    db   $f3, $28, $f2, $85, $f3, $28, $f2, $85        ;; 07:5a1f ????????
    db   $fd, $3a, $5a, $f3, $28, $f2, $85, $7b        ;; 07:5a27 ????????
    db   $8b, $9b, $ab, $bb, $f3, $0b, $1b, $2b        ;; 07:5a2f ????????
    db   $fc, $01, $5a, $f3, $28, $f2, $85, $8b        ;; 07:5a37 ????????
    db   $7b, $6b, $5b, $4b, $3b, $2b, $1b, $f9        ;; 07:5a3f ????????
    db   $f7, $02, $f7, $c4, $ea, $f1, $98, $ab        ;; 07:5a47 ????????
    db   $bb, $f2, $08, $f1, $bb, $ab, $98, $ab        ;; 07:5a4f ????????
    db   $bb, $f2, $08, $f1, $bb, $ab, $98, $ab        ;; 07:5a57 ????????
    db   $bb, $f2, $08, $f1, $bb, $ab, $98, $ab        ;; 07:5a5f ????????
    db   $bb, $f2, $08, $f1, $bb, $ab, $f2, $65        ;; 07:5a67 ????????
    db   $3b, $c6, $c8, $e8, $6b, $cb, $35, $f7        ;; 07:5a6f ????????
    db   $c0, $e4, $6b, $cb, $35, $f7, $c3, $e3        ;; 07:5a77 ????????
    db   $6b, $cb, $35, $ea, $f1, $a8, $f2, $0b        ;; 07:5a7f ????????
    db   $1b, $28, $1b, $0b, $f1, $a8, $f2, $0b        ;; 07:5a87 ????????
    db   $1b, $28, $1b, $0b, $f1, $a8, $f2, $0b        ;; 07:5a8f ????????
    db   $1b, $28, $1b, $0b, $f1, $a8, $f2, $0b        ;; 07:5a97 ????????
    db   $1b, $28, $1b, $0b, $45, $1b, $c6, $c8        ;; 07:5a9f ????????
    db   $f7, $c4, $e8, $4b, $cb, $15, $fd, $bf        ;; 07:5aa7 ????????
    db   $5a, $f7, $c0, $e4, $4b, $cb, $15, $f7        ;; 07:5aaf ????????
    db   $c3, $e3, $4b, $cb, $15, $fc, $47, $5a        ;; 07:5ab7 ????????
    db   $f7, $c0, $e4, $4b, $cb, $15, $f7, $c3        ;; 07:5abf ????????
    db   $4b, $cb, $15, $4b, $cb, $18, $f9, $f7        ;; 07:5ac7 ????????
    db   $00, $e8, $92, $52, $22, $02, $25, $45        ;; 07:5acf ????????
    db   $55, $25, $fd, $e5, $5a, $f1, $b5, $f2        ;; 07:5ad7 ????????
    db   $25, $45, $85, $fc, $ce, $5a, $40, $fe        ;; 07:5adf ????????
    db   $46, $5a, $f7, $c0, $f7, $0a, $f8, $06        ;; 07:5ae7 ????????
    db   $ef, $f0, $58, $55, $58, $55, $58, $55        ;; 07:5aef ????????
    db   $58, $55, $55, $58, $58, $48, $45, $48        ;; 07:5af7 ????????
    db   $45, $48, $45, $48, $45, $45, $48, $48        ;; 07:5aff ????????
    db   $f7, $01, $5b, $cb, $5b, $cb, $f1, $58        ;; 07:5b07 ????????
    db   $f0, $5b, $cb, $5b, $cb, $f1, $58, $f0        ;; 07:5b0f ????????
    db   $5b, $cb, $5b, $cb, $f1, $58, $f0, $5b        ;; 07:5b17 ????????
    db   $cb, $5b, $cb, $f1, $58, $f0, $58, $f1        ;; 07:5b1f ????????
    db   $58, $f0, $58, $f1, $58, $f0, $4b, $cb        ;; 07:5b27 ????????
    db   $4b, $cb, $f1, $48, $f0, $4b, $cb, $4b        ;; 07:5b2f ????????
    db   $cb, $f1, $48, $f0, $4b, $cb, $4b, $cb        ;; 07:5b37 ????????
    db   $f1, $48, $f0, $4b, $cb, $4b, $cb, $f1        ;; 07:5b3f ????????
    db   $48, $f0, $48, $f1, $48, $f0, $48, $f1        ;; 07:5b47 ????????
    db   $48, $f9, $f7, $0a, $f7, $c0, $f0, $98        ;; 07:5b4f ????????
    db   $f1, $48, $f0, $98, $f1, $48, $f0, $98        ;; 07:5b57 ????????
    db   $f1, $48, $f0, $98, $f1, $48, $f0, $98        ;; 07:5b5f ????????
    db   $f1, $48, $f0, $98, $f1, $48, $f0, $98        ;; 07:5b67 ????????
    db   $f1, $48, $f0, $98, $f1, $48, $f7, $01        ;; 07:5b6f ????????
    db   $f0, $b8, $f1, $68, $78, $08, $68, $78        ;; 07:5b77 ????????
    db   $18, $68, $78, $08, $68, $78, $f0, $b8        ;; 07:5b7f ????????
    db   $f1, $68, $f7, $0a, $f0, $a8, $f1, $58        ;; 07:5b87 ????????
    db   $f0, $a8, $f1, $58, $f0, $a8, $f1, $58        ;; 07:5b8f ????????
    db   $f0, $a8, $f1, $58, $f0, $a8, $f1, $58        ;; 07:5b97 ????????
    db   $f0, $a8, $f1, $58, $f0, $a8, $f1, $58        ;; 07:5b9f ????????
    db   $f0, $a8, $f1, $58, $f7, $01, $f0, $98        ;; 07:5ba7 ????????
    db   $f1, $48, $98, $f0, $a8, $f1, $48, $a8        ;; 07:5baf ????????
    db   $f0, $b8, $f1, $48, $fd, $cb, $5b, $b8        ;; 07:5bb7 ????????
    db   $f0, $a8, $f1, $48, $a8, $f0, $98, $f1        ;; 07:5bbf ????????
    db   $48, $fc, $51, $5b, $b8, $f0, $a8, $f1        ;; 07:5bc7 ????????
    db   $48, $a8, $f0, $98, $f1, $48, $98, $48        ;; 07:5bcf ????????
    db   $f9, $f7, $cc, $f1, $5b, $cb, $08, $5b        ;; 07:5bd7 ????????
    db   $cb, $08, $5b, $cb, $08, $5b, $cb, $08        ;; 07:5bdf ????????
    db   $5b, $cb, $08, $5b, $cb, $08, $5b, $cb        ;; 07:5be7 ????????
    db   $08, $5b, $cb, $08, $fd, $20, $5c, $2b        ;; 07:5bef ????????
    db   $cb, $f0, $98, $f1, $2b, $cb, $f0, $98        ;; 07:5bf7 ????????
    db   $f1, $2b, $cb, $f0, $98, $f1, $2b, $cb        ;; 07:5bff ????????
    db   $f0, $98, $f1, $4b, $cb, $f0, $b8, $f1        ;; 07:5c07 ????????
    db   $4b, $cb, $f0, $b8, $f1, $4b, $cb, $f0        ;; 07:5c0f ????????
    db   $b8, $f1, $4b, $cb, $f0, $b8, $fc, $d8        ;; 07:5c17 ????????
    db   $5b, $f0, $bb, $cb, $f1, $58, $f0, $bb        ;; 07:5c1f ????????
    db   $cb, $f1, $58, $f0, $bb, $cb, $f1, $58        ;; 07:5c27 ????????
    db   $f0, $bb, $cb, $f1, $58, $45, $25, $05        ;; 07:5c2f ????????
    db   $f0, $b5, $fe, $50, $5b, $e0, $21, $f7        ;; 07:5c37 ????????
    db   $05, $f7, $80, $f7, $c0, $f7, $43, $ef        ;; 07:5c3f ????????
    db   $f2, $b8, $f3, $08, $f9, $f3, $25, $f2        ;; 07:5c47 ????????
    db   $75, $f3, $68, $48, $28, $08, $25, $f2        ;; 07:5c4f ????????
    db   $75, $f3, $08, $f2, $b8, $98, $f3, $08        ;; 07:5c57 ????????
    db   $fd, $71, $5c, $f2, $b5, $25, $48, $78        ;; 07:5c5f ????????
    db   $98, $78, $b2, $95, $b8, $f3, $08, $fc        ;; 07:5c67 ????????
    db   $4c, $5c, $f2, $b5, $25, $38, $78, $98        ;; 07:5c6f ????????
    db   $78, $71, $c5, $f9, $72, $f3, $62, $21        ;; 07:5c77 ????????
    db   $f2, $b5, $f3, $48, $28, $08, $f2, $b8        ;; 07:5c7f ????????
    db   $95, $b8, $f3, $08, $fd, $94, $5c, $f2        ;; 07:5c87 ????????
    db   $b1, $c5, $fc, $7b, $5c, $f3, $21, $f2        ;; 07:5c8f ????????
    db   $b8, $f3, $08, $fe, $4b, $5c, $c5, $f7        ;; 07:5c97 ????????
    db   $04, $f7, $82, $f7, $c4, $f7, $42, $ea        ;; 07:5c9f ????????
    db   $ce, $fa, $f0, $78, $f1, $28, $78, $b8        ;; 07:5ca7 ????????
    db   $f0, $78, $f1, $48, $98, $f2, $08, $f0        ;; 07:5caf ????????
    db   $78, $f1, $68, $b8, $f2, $28, $f0, $78        ;; 07:5cb7 ????????
    db   $f1, $48, $98, $f2, $08, $fc, $a9, $5c        ;; 07:5cbf ????????
    db   $f0, $78, $f1, $28, $78, $b8, $f0, $78        ;; 07:5cc7 ????????
    db   $f1, $38, $98, $f2, $08, $f0, $78, $f1        ;; 07:5ccf ????????
    db   $28, $78, $b8, $f2, $28, $f1, $b8, $78        ;; 07:5cd7 ????????
    db   $6a, $de, $f9, $f7, $06, $f7, $80, $f7        ;; 07:5cdf ????????
    db   $45, $e6, $f2, $42, $f3, $22, $f2, $61        ;; 07:5ce7 ????????
    db   $25, $fd, $fc, $5c, $75, $45, $65, $45        ;; 07:5cef ????????
    db   $21, $c5, $fc, $e2, $5c, $75, $45, $05        ;; 07:5cf7 ????????
    db   $45, $a8, $58, $28, $58, $68, $48, $28        ;; 07:5cff ????????
    db   $08, $fe, $9e, $5c, $f7, $c3, $f7, $47        ;; 07:5d07 ????????
    db   $f7, $04, $f8, $05, $ef, $c5, $fa, $f0        ;; 07:5d0f ????????
    db   $78, $f1, $28, $78, $b8, $f0, $78, $f1        ;; 07:5d17 ????????
    db   $48, $98, $f2, $08, $f0, $78, $f1, $68        ;; 07:5d1f ????????
    db   $b8, $f2, $28, $f0, $78, $f1, $48, $98        ;; 07:5d27 ????????
    db   $f2, $08, $fc, $16, $5d, $f0, $78, $f1        ;; 07:5d2f ????????
    db   $28, $78, $b8, $f0, $78, $f1, $38, $98        ;; 07:5d37 ????????
    db   $f2, $08, $f0, $78, $f1, $28, $78, $b8        ;; 07:5d3f ????????
    db   $f2, $28, $f1, $b8, $78, $68, $f9, $f0        ;; 07:5d47 ????????
    db   $48, $b8, $f1, $48, $78, $48, $78, $b8        ;; 07:5d4f ????????
    db   $f2, $48, $f0, $b8, $f1, $68, $b8, $f2        ;; 07:5d57 ????????
    db   $18, $28, $18, $f1, $b8, $68, $fd, $81        ;; 07:5d5f ????????
    db   $5d, $08, $78, $f2, $08, $f1, $78, $28        ;; 07:5d67 ????????
    db   $98, $f2, $28, $f1, $98, $f0, $78, $f1        ;; 07:5d6f ????????
    db   $28, $78, $98, $b8, $98, $78, $68, $fc        ;; 07:5d77 ????????
    db   $4e, $5d, $f1, $08, $78, $f2, $08, $f1        ;; 07:5d7f ????????
    db   $78, $f0, $98, $f1, $48, $98, $48, $f0        ;; 07:5d87 ????????
    db   $a8, $f1, $58, $a8, $58, $22, $fe, $15        ;; 07:5d8f ????????
    db   $5d, $f7, $05, $f7, $80, $f7, $43, $ef        ;; 07:5d97 ????????
    db   $f7, $c0, $e0, $23, $f9, $f2, $b8, $f3        ;; 07:5d9f ????????
    db   $68, $78, $98, $b2, $d3, $d9, $cd, $b8        ;; 07:5da7 ????????
    db   $98, $f4, $28, $f3, $b8, $70, $c5, $c5        ;; 07:5daf ????????
    db   $68, $48, $98, $28, $fd, $d9, $5d, $02        ;; 07:5db7 ????????
    db   $d6, $dd, $cd, $08, $28, $45, $d9, $cd        ;; 07:5dbf ????????
    db   $48, $25, $05, $f2, $b5, $d9, $cd, $b8        ;; 07:5dc7 ????????
    db   $a5, $f3, $15, $f2, $b1, $d8, $c8, $fc        ;; 07:5dcf ????????
    db   $a4, $5d, $f3, $02, $d8, $f2, $b8, $f3        ;; 07:5dd7 ????????
    db   $08, $78, $65, $45, $25, $65, $40, $d5        ;; 07:5ddf ????????
    db   $c1, $f9, $f3, $28, $48, $58, $98, $f4        ;; 07:5de7 ????????
    db   $05, $f3, $b8, $98, $b5, $71, $48, $58        ;; 07:5def ????????
    db   $98, $f4, $08, $45, $28, $08, $fd, $04        ;; 07:5df7 ????????
    db   $5e, $20, $fc, $e9, $5d, $f3, $b0, $fe        ;; 07:5dff ????????
    db   $9f, $5d, $f7, $03, $f8, $02, $ef, $f7        ;; 07:5e07 ????????
    db   $c3, $f9, $f1, $78, $b8, $78, $b8, $78        ;; 07:5e0f ????????
    db   $b8, $78, $b8, $68, $b8, $68, $b8, $68        ;; 07:5e17 ????????
    db   $b8, $68, $b8, $48, $b8, $48, $b8, $48        ;; 07:5e1f ????????
    db   $b8, $48, $b8, $68, $98, $68, $98, $68        ;; 07:5e27 ????????
    db   $98, $68, $98, $48, $78, $48, $78, $48        ;; 07:5e2f ????????
    db   $78, $48, $78, $fd, $58, $5e, $08, $68        ;; 07:5e37 ????????
    db   $08, $68, $08, $68, $08, $68, $18, $68        ;; 07:5e3f ????????
    db   $18, $68, $18, $68, $18, $68, $48, $68        ;; 07:5e47 ????????
    db   $48, $68, $38, $68, $38, $68, $fc, $11        ;; 07:5e4f ????????
    db   $5e, $68, $98, $68, $98, $68, $98, $68        ;; 07:5e57 ????????
    db   $98, $78, $b8, $78, $b8, $78, $b8, $78        ;; 07:5e5f ????????
    db   $b8, $48, $78, $48, $78, $48, $78, $48        ;; 07:5e67 ????????
    db   $78, $f9, $98, $58, $28, $58, $98, $58        ;; 07:5e6f ????????
    db   $28, $58, $78, $58, $28, $58, $78, $58        ;; 07:5e77 ????????
    db   $28, $58, $98, $58, $48, $58, $98, $58        ;; 07:5e7f ????????
    db   $48, $58, $fd, $97, $5e, $78, $58, $28        ;; 07:5e87 ????????
    db   $58, $78, $58, $28, $58, $fc, $71, $5e        ;; 07:5e8f ????????
    db   $e0, $22, $98, $68, $e0, $21, $48, $68        ;; 07:5e97 ????????
    db   $e0, $20, $98, $68, $e0, $1f, $38, $e0        ;; 07:5e9f ????????
    db   $1e, $68, $fe, $0e, $5e, $f7, $82, $f7        ;; 07:5ea7 ????????
    db   $45, $f7, $02, $e9, $f7, $c4, $f9, $f1        ;; 07:5eaf ????????
    db   $41, $db, $cb, $48, $20, $01, $db, $cb        ;; 07:5eb7 ????????
    db   $08, $f0, $b0, $91, $db, $cb, $98, $fd        ;; 07:5ebf ????????
    db   $d2, $5e, $f1, $20, $62, $12, $f0, $b0        ;; 07:5ec7 ????????
    db   $fc, $b6, $5e, $b0, $f1, $00, $10, $f9        ;; 07:5ecf ????????
    db   $f7, $0a, $f7, $c7, $e8, $25, $e3, $25        ;; 07:5ed7 ????????
    db   $e8, $95, $e3, $95, $e8, $f0, $75, $f1        ;; 07:5edf ????????
    db   $75, $f0, $72, $f1, $55, $e3, $55, $e8        ;; 07:5ee7 ????????
    db   $f2, $05, $e3, $05, $fd, $00, $5f, $e8        ;; 07:5eef ????????
    db   $f0, $75, $f1, $75, $25, $75, $fc, $d7        ;; 07:5ef7 ????????
    db   $5e, $e8, $f0, $b5, $f1, $e7, $b5, $e6        ;; 07:5eff ????????
    db   $65, $e5, $b5, $fe, $b0, $5e, $f7, $02        ;; 07:5f07 ????????
    db   $f7, $82, $f7, $c0, $f7, $43, $ef, $e0        ;; 07:5f0f ????????
    db   $40, $f2, $5b, $cb, $8b, $cb, $f9, $f3        ;; 07:5f17 ????????
    db   $05, $f2, $5b, $cb, $8b, $cb, $f3, $0b        ;; 07:5f1f ????????
    db   $cb, $c8, $55, $38, $1b, $cb, $0b, $cb        ;; 07:5f27 ????????
    db   $f2, $ab, $cb, $f3, $0b, $cb, $c8, $f2        ;; 07:5f2f ????????
    db   $85, $fd, $4c, $5f, $f3, $02, $d8, $f2        ;; 07:5f37 ????????
    db   $a8, $f3, $08, $f2, $a8, $61, $5b, $cb        ;; 07:5f3f ????????
    db   $8b, $cb, $fc, $1e, $5f, $f3, $02, $d8        ;; 07:5f47 ????????
    db   $f2, $a8, $f3, $08, $18, $61, $0b, $cb        ;; 07:5f4f ????????
    db   $1b, $cb, $35, $0b, $cb, $1b, $cb, $35        ;; 07:5f57 ????????
    db   $0b, $cb, $1b, $cb, $35, $65, $55, $05        ;; 07:5f5f ????????
    db   $10, $c1, $f2, $ab, $cb, $f3, $0b, $cb        ;; 07:5f67 ????????
    db   $15, $f2, $ab, $cb, $f3, $0b, $cb, $15        ;; 07:5f6f ????????
    db   $f2, $ab, $cb, $f3, $0b, $cb, $15, $55        ;; 07:5f77 ????????
    db   $35, $f2, $a5, $f3, $00, $c1, $f2, $8b        ;; 07:5f7f ????????
    db   $cb, $ab, $cb, $f3, $05, $d9, $cd, $08        ;; 07:5f87 ????????
    db   $18, $08, $f2, $a8, $88, $a8, $c8, $72        ;; 07:5f8f ????????
    db   $f3, $0b, $cb, $1b, $cb, $35, $d9, $cd        ;; 07:5f97 ????????
    db   $38, $58, $38, $18, $0a, $de, $ce, $08        ;; 07:5f9f ????????
    db   $c8, $f2, $92, $ab, $cb, $f3, $0b, $cb        ;; 07:5fa7 ????????
    db   $15, $d9, $cd, $18, $38, $18, $08, $f2        ;; 07:5faf ????????
    db   $a8, $f3, $15, $d9, $cd, $18, $38, $18        ;; 07:5fb7 ????????
    db   $08, $f2, $a8, $f3, $12, $d9, $cd, $18        ;; 07:5fbf ????????
    db   $38, $18, $01, $f2, $5b, $cb, $8b, $cb        ;; 07:5fc7 ????????
    db   $fe, $1d, $5f, $c5, $fb, $f7, $0a, $f7        ;; 07:5fcf ????????
    db   $81, $f7, $c1, $f7, $43, $e9, $f2, $08        ;; 07:5fd7 ????????
    db   $18, $08, $f1, $a8, $fc, $d4, $5f, $fb        ;; 07:5fdf ????????
    db   $f1, $68, $f2, $0b, $1b, $f1, $a8, $f2        ;; 07:5fe7 ????????
    db   $0b, $1b, $fc, $e7, $5f, $fb, $f2, $08        ;; 07:5fef ????????
    db   $18, $08, $f1, $a8, $fc, $f5, $5f, $fb        ;; 07:5ff7 ????????
    db   $f1, $68, $f2, $0b, $1b, $f1, $ab, $f2        ;; 07:5fff ????????
    db   $0b, $1b, $6b, $fc, $ff, $5f, $f7, $05        ;; 07:6007 ????????
    db   $f7, $82, $f7, $cb, $f3, $08, $f2, $88        ;; 07:600f ????????
    db   $38, $88, $a8, $68, $38, $68, $98, $58        ;; 07:6017 ????????
    db   $38, $58, $98, $58, $38, $58, $f7, $81        ;; 07:601f ????????
    db   $a8, $58, $18, $a8, $98, $58, $18, $98        ;; 07:6027 ????????
    db   $88, $58, $18, $88, $78, $38, $f1, $a8        ;; 07:602f ????????
    db   $f2, $38, $f7, $82, $78, $18, $f1, $a8        ;; 07:6037 ????????
    db   $f2, $18, $78, $18, $f1, $a8, $f2, $18        ;; 07:603f ????????
    db   $78, $18, $f1, $a8, $f2, $18, $78, $38        ;; 07:6047 ????????
    db   $f1, $a8, $f2, $38, $f7, $81, $88, $38        ;; 07:604f ????????
    db   $08, $88, $78, $38, $08, $78, $88, $38        ;; 07:6057 ????????
    db   $08, $88, $78, $38, $08, $38, $f7, $80        ;; 07:605f ????????
    db   $e7, $52, $15, $55, $32, $12, $f7, $82        ;; 07:6067 ????????
    db   $72, $35, $75, $52, $32, $f9, $f7, $0a        ;; 07:606f ????????
    db   $f7, $81, $f7, $c1, $e9, $18, $58, $18        ;; 07:6077 ????????
    db   $58, $18, $58, $18, $58, $fc, $75, $60        ;; 07:607f ????????
    db   $f7, $c0, $18, $78, $38, $78, $18, $78        ;; 07:6087 ????????
    db   $38, $78, $48, $78, $28, $58, $08, $48        ;; 07:608f ????????
    db   $f1, $a8, $f2, $28, $fe, $d3, $5f, $f7        ;; 07:6097 ????????
    db   $01, $f8, $06, $ef, $c5, $f7, $ca, $f9        ;; 07:609f ????????
    db   $f0, $58, $f1, $5b, $cb, $f0, $58, $f1        ;; 07:60a7 ????????
    db   $5b, $cb, $f0, $18, $f1, $1b, $cb, $f0        ;; 07:60af ????????
    db   $18, $f1, $1b, $cb, $f0, $38, $f1, $3b        ;; 07:60b7 ????????
    db   $cb, $f0, $38, $f1, $3b, $cb, $f0, $58        ;; 07:60bf ????????
    db   $f1, $5b, $cb, $f0, $58, $f1, $5b, $cb        ;; 07:60c7 ????????
    db   $f0, $68, $f1, $1b, $cb, $f0, $68, $f1        ;; 07:60cf ????????
    db   $1b, $cb, $f0, $68, $f1, $1b, $cb, $f0        ;; 07:60d7 ????????
    db   $68, $f1, $1b, $cb, $f0, $68, $f1, $1b        ;; 07:60df ????????
    db   $cb, $f0, $68, $f1, $1b, $cb, $f0, $68        ;; 07:60e7 ????????
    db   $f1, $1b, $cb, $f0, $68, $f1, $1b, $cb        ;; 07:60ef ????????
    db   $fc, $a7, $60, $f0, $88, $f1, $8b, $cb        ;; 07:60f7 ????????
    db   $f0, $88, $f1, $8b, $cb, $f0, $68, $f1        ;; 07:60ff ????????
    db   $6b, $cb, $f0, $68, $f1, $6b, $cb, $f0        ;; 07:6107 ????????
    db   $58, $f1, $5b, $cb, $f0, $58, $f1, $5b        ;; 07:610f ????????
    db   $cb, $f0, $58, $f1, $5b, $cb, $f0, $58        ;; 07:6117 ????????
    db   $f1, $5b, $cb, $f0, $a8, $f1, $ab, $cb        ;; 07:611f ????????
    db   $f0, $a8, $f1, $ab, $cb, $f0, $98, $f1        ;; 07:6127 ????????
    db   $9b, $cb, $f0, $98, $f1, $9b, $cb, $f0        ;; 07:612f ????????
    db   $88, $f1, $8b, $cb, $f0, $88, $f1, $8b        ;; 07:6137 ????????
    db   $cb, $f0, $78, $f1, $7b, $cb, $f0, $78        ;; 07:613f ????????
    db   $f1, $7b, $cb, $f0, $38, $f1, $3b, $cb        ;; 07:6147 ????????
    db   $f0, $38, $f1, $3b, $cb, $f0, $48, $f1        ;; 07:614f ????????
    db   $4b, $cb, $f0, $48, $f1, $4b, $cb, $f0        ;; 07:6157 ????????
    db   $58, $f1, $5b, $cb, $f0, $58, $f1, $5b        ;; 07:615f ????????
    db   $cb, $f0, $78, $f1, $7b, $cb, $f0, $78        ;; 07:6167 ????????
    db   $f1, $7b, $cb, $f0, $88, $f1, $8b, $cb        ;; 07:616f ????????
    db   $f0, $88, $f1, $8b, $cb, $f0, $78, $f1        ;; 07:6177 ????????
    db   $7b, $cb, $f0, $78, $f1, $7b, $cb, $f0        ;; 07:617f ????????
    db   $58, $f1, $5b, $cb, $f0, $58, $f1, $5b        ;; 07:6187 ????????
    db   $cb, $f0, $38, $f1, $3b, $cb, $f0, $38        ;; 07:618f ????????
    db   $f1, $3b, $cb, $f0, $18, $f1, $1b, $cb        ;; 07:6197 ????????
    db   $f0, $18, $f1, $1b, $cb, $f0, $18, $f1        ;; 07:619f ????????
    db   $1b, $cb, $f0, $18, $f1, $1b, $cb, $f0        ;; 07:61a7 ????????
    db   $38, $f1, $3b, $cb, $f0, $38, $f1, $3b        ;; 07:61af ????????
    db   $cb, $f0, $38, $f1, $3b, $cb, $f0, $38        ;; 07:61b7 ????????
    db   $f1, $3b, $cb, $f0, $08, $f1, $0b, $cb        ;; 07:61bf ????????
    db   $f0, $08, $f1, $0b, $cb, $f0, $08, $f1        ;; 07:61c7 ????????
    db   $0b, $cb, $f0, $08, $f1, $0b, $cb, $f0        ;; 07:61cf ????????
    db   $58, $f1, $5b, $cb, $f0, $58, $f1, $5b        ;; 07:61d7 ????????
    db   $cb, $f0, $58, $f1, $5b, $cb, $f0, $58        ;; 07:61df ????????
    db   $f1, $5b, $cb, $f0, $a8, $f1, $ab, $cb        ;; 07:61e7 ????????
    db   $f0, $a8, $f1, $ab, $cb, $f0, $a8, $f1        ;; 07:61ef ????????
    db   $ab, $cb, $f0, $a8, $f1, $ab, $cb, $f0        ;; 07:61f7 ????????
    db   $88, $f1, $8b, $cb, $f0, $88, $f1, $8b        ;; 07:61ff ????????
    db   $cb, $f0, $88, $f1, $8b, $cb, $f0, $88        ;; 07:6207 ????????
    db   $f1, $8b, $cb, $f0, $38, $f1, $3b, $cb        ;; 07:620f ????????
    db   $f0, $38, $f1, $3b, $cb, $f0, $38, $f1        ;; 07:6217 ????????
    db   $3b, $cb, $f0, $38, $f1, $3b, $cb, $f0        ;; 07:621f ????????
    db   $08, $f1, $0b, $cb, $f0, $08, $f1, $0b        ;; 07:6227 ????????
    db   $cb, $f0, $08, $f1, $0b, $cb, $f0, $08        ;; 07:622f ????????
    db   $f1, $0b, $cb, $fe, $a4, $60, $f7, $c0        ;; 07:6237 ????????
    db   $f7, $01, $f7, $48, $f8, $03, $ef, $fb        ;; 07:623f ????????
    db   $c0, $fc, $47, $62, $f2, $51, $db, $dc        ;; 07:6247 ????????
    db   $ce, $5c, $8c, $f3, $0c, $52, $05, $35        ;; 07:624f ????????
    db   $22, $f2, $a2, $d1, $c5, $a1, $db, $dc        ;; 07:6257 ????????
    db   $ce, $ac, $f3, $1c, $5c, $a2, $55, $85        ;; 07:625f ????????
    db   $70, $d1, $c5, $51, $db, $dc, $ce, $5b        ;; 07:6267 ????????
    db   $7b, $82, $75, $55, $33, $58, $72, $d3        ;; 07:626f ????????
    db   $db, $dc, $ce, $75, $85, $a3, $58, $d0        ;; 07:6277 ????????
    db   $f4, $05, $f3, $a5, $70, $c0, $fe, $4b        ;; 07:627f ????????
    db   $62, $f7, $08, $f7, $82, $f7, $c0, $f7        ;; 07:6287 ????????
    db   $43, $ec, $fb, $f1, $ab, $ab, $ab, $ab        ;; 07:628f ????????
    db   $f2, $1b, $f1, $ab, $ab, $ab, $f2, $3b        ;; 07:6297 ????????
    db   $f1, $ab, $ab, $ab, $f2, $1b, $f1, $ab        ;; 07:629f ????????
    db   $8b, $f2, $0b, $fc, $92, $62, $f7, $c4        ;; 07:62a7 ????????
    db   $0b, $0b, $0b, $0b, $3b, $0b, $0b, $0b        ;; 07:62af ????????
    db   $5b, $0b, $0b, $0b, $3b, $0b, $0b, $0b        ;; 07:62b7 ????????
    db   $0b, $0b, $0b, $0b, $3b, $0b, $0b, $0b        ;; 07:62bf ????????
    db   $5b, $0b, $0b, $0b, $3b, $0b, $0b, $0b        ;; 07:62c7 ????????
    db   $2b, $2b, $2b, $2b, $5b, $2b, $2b, $2b        ;; 07:62cf ????????
    db   $7b, $2b, $2b, $2b, $5b, $2b, $2b, $2b        ;; 07:62d7 ????????
    db   $2b, $2b, $2b, $2b, $5b, $2b, $2b, $2b        ;; 07:62df ????????
    db   $7b, $2b, $2b, $2b, $5b, $2b, $2b, $2b        ;; 07:62e7 ????????
    db   $5b, $5b, $5b, $5b, $8b, $5b, $5b, $5b        ;; 07:62ef ????????
    db   $ab, $5b, $5b, $5b, $8b, $5b, $5b, $5b        ;; 07:62f7 ????????
    db   $5b, $5b, $5b, $5b, $8b, $5b, $5b, $5b        ;; 07:62ff ????????
    db   $ab, $5b, $5b, $5b, $8b, $5b, $5b, $5b        ;; 07:6307 ????????
    db   $7b, $7b, $7b, $7b, $ab, $7b, $7b, $7b        ;; 07:630f ????????
    db   $f3, $0b, $f2, $7b, $7b, $7b, $ab, $7b        ;; 07:6317 ????????
    db   $7b, $7b, $7b, $7b, $7b, $7b, $ab, $7b        ;; 07:631f ????????
    db   $7b, $7b, $f3, $0b, $f2, $7b, $7b, $7b        ;; 07:6327 ????????
    db   $ab, $7b, $7b, $7b, $f7, $05, $f3, $13        ;; 07:632f ????????
    db   $03, $f2, $a5, $d8, $83, $a5, $f3, $15        ;; 07:6337 ????????
    db   $02, $d8, $f2, $7b, $8b, $ab, $f3, $0b        ;; 07:633f ????????
    db   $f2, $ab, $8b, $72, $f3, $35, $55, $13        ;; 07:6347 ????????
    db   $03, $f2, $a5, $d8, $83, $a5, $f3, $05        ;; 07:634f ????????
    db   $f7, $08, $f7, $c3, $f2, $7b, $7b, $7b        ;; 07:6357 ????????
    db   $7b, $ab, $7b, $7b, $7b, $f3, $0b, $f2        ;; 07:635f ????????
    db   $7b, $7b, $7b, $ab, $7b, $7b, $7b, $f3        ;; 07:6367 ????????
    db   $0b, $f2, $7b, $7b, $7b, $ab, $7b, $7b        ;; 07:636f ????????
    db   $7b, $8b, $7b, $f3, $0b, $f2, $7b, $7b        ;; 07:6377 ????????
    db   $7b, $ab, $7b, $fe, $ad, $62, $e0, $36        ;; 07:637f ????????
    db   $f7, $0a, $f7, $82, $f7, $c0, $f7, $40        ;; 07:6387 ????????
    db   $eb, $fb, $f0, $38, $f1, $5b, $6b, $f0        ;; 07:638f ????????
    db   $38, $f1, $5b, $6b, $f0, $38, $f1, $5b        ;; 07:6397 ????????
    db   $6b, $f0, $38, $f1, $5b, $6b, $fc, $91        ;; 07:639f ????????
    db   $63, $f7, $c3, $f0, $58, $f1, $7b, $8b        ;; 07:63a7 ????????
    db   $f0, $58, $f1, $7b, $8b, $f0, $58, $f1        ;; 07:63af ????????
    db   $7b, $8b, $08, $2b, $3b, $f0, $58, $f1        ;; 07:63b7 ????????
    db   $7b, $8b, $f0, $58, $f1, $7b, $8b, $f0        ;; 07:63bf ????????
    db   $58, $f1, $7b, $8b, $08, $2b, $3b, $f0        ;; 07:63c7 ????????
    db   $78, $f1, $9b, $ab, $f0, $78, $f1, $9b        ;; 07:63cf ????????
    db   $ab, $f0, $78, $f1, $9b, $ab, $28, $4b        ;; 07:63d7 ????????
    db   $5b, $f0, $78, $f1, $9b, $ab, $f0, $78        ;; 07:63df ????????
    db   $f1, $9b, $ab, $f0, $78, $f1, $9b, $ab        ;; 07:63e7 ????????
    db   $28, $4b, $5b, $f0, $a8, $f2, $0b, $1b        ;; 07:63ef ????????
    db   $f0, $a8, $f2, $0b, $1b, $f0, $a8, $f2        ;; 07:63f7 ????????
    db   $0b, $1b, $f1, $58, $7b, $8b, $f0, $a8        ;; 07:63ff ????????
    db   $f2, $0b, $1b, $f0, $a8, $f2, $0b, $1b        ;; 07:6407 ????????
    db   $f0, $a8, $f2, $0b, $1b, $f1, $58, $7b        ;; 07:640f ????????
    db   $8b, $08, $f2, $2b, $3b, $f1, $08, $f2        ;; 07:6417 ????????
    db   $2b, $3b, $f1, $08, $f2, $2b, $3b, $f1        ;; 07:641f ????????
    db   $78, $9b, $ab, $08, $f2, $2b, $3b, $f1        ;; 07:6427 ????????
    db   $08, $f2, $2b, $3b, $f1, $08, $f2, $2b        ;; 07:642f ????????
    db   $3b, $f1, $78, $9b, $ab, $f7, $c5, $18        ;; 07:6437 ????????
    db   $f2, $0b, $1b, $f1, $18, $f2, $0b, $1b        ;; 07:643f ????????
    db   $f1, $18, $f2, $0b, $1b, $f1, $88, $ab        ;; 07:6447 ????????
    db   $f2, $0b, $f1, $18, $f2, $0b, $1b, $f1        ;; 07:644f ????????
    db   $18, $f2, $0b, $1b, $f1, $18, $f2, $0b        ;; 07:6457 ????????
    db   $1b, $f1, $88, $ab, $f2, $0b, $f1, $08        ;; 07:645f ????????
    db   $ab, $f2, $0b, $f1, $08, $ab, $f2, $0b        ;; 07:6467 ????????
    db   $f1, $08, $ab, $f2, $0b, $f1, $78, $8b        ;; 07:646f ????????
    db   $ab, $08, $ab, $f2, $0b, $f1, $08, $ab        ;; 07:6477 ????????
    db   $f2, $0b, $f1, $08, $ab, $f2, $0b, $f1        ;; 07:647f ????????
    db   $78, $8b, $ab, $f0, $a8, $f1, $8b, $ab        ;; 07:6487 ????????
    db   $f0, $a8, $f1, $8b, $ab, $f0, $a8, $f1        ;; 07:648f ????????
    db   $8b, $ab, $58, $7b, $8b, $f0, $a8, $f1        ;; 07:6497 ????????
    db   $8b, $ab, $f0, $a8, $f1, $8b, $ab, $f0        ;; 07:649f ????????
    db   $a8, $f1, $8b, $ab, $58, $7b, $8b, $f7        ;; 07:64a7 ????????
    db   $c4, $08, $f2, $2b, $3b, $f1, $08, $f2        ;; 07:64af ????????
    db   $2b, $3b, $f1, $08, $f2, $2b, $3b, $f1        ;; 07:64b7 ????????
    db   $78, $9b, $ab, $08, $f2, $2b, $4b, $f1        ;; 07:64bf ????????
    db   $08, $f2, $2b, $4b, $f1, $08, $f2, $2b        ;; 07:64c7 ????????
    db   $4b, $f1, $78, $9b, $ab, $fe, $a8, $63        ;; 07:64cf ????????
    db   $e0, $36, $f7, $02, $f7, $82, $f7, $c3        ;; 07:64d7 ????????
    db   $f7, $43, $ef, $f3, $a5, $ac, $cc, $ac        ;; 07:64df ????????
    db   $cc, $ac, $cc, $98, $78, $58, $98, $71        ;; 07:64e7 ????????
    db   $c8, $e0, $3c, $f2, $7e, $9e, $be, $f3        ;; 07:64ef ????????
    db   $0e, $2e, $3e, $f9, $f7, $0c, $45, $45        ;; 07:64f7 ????????
    db   $28, $45, $48, $28, $45, $58, $45, $25        ;; 07:64ff ????????
    db   $fc, $fb, $64, $f9, $78, $58, $38, $55        ;; 07:6507 ????????
    db   $58, $38, $58, $fd, $1c, $65, $75, $55        ;; 07:650f ????????
    db   $35, $55, $fc, $0b, $65, $75, $55, $38        ;; 07:6517 ????????
    db   $55, $58, $fe, $fa, $64, $f7, $02, $f7        ;; 07:651f ????????
    db   $80, $f7, $c4, $f7, $43, $ec, $f3, $25        ;; 07:6527 ????????
    db   $5a, $3a, $2a, $08, $f2, $a8, $98, $f3        ;; 07:652f ????????
    db   $08, $f2, $b1, $c5, $f9, $f7, $0c, $f3        ;; 07:6537 ????????
    db   $05, $05, $f2, $b8, $f3, $05, $08, $f2        ;; 07:653f ????????
    db   $b8, $f3, $05, $28, $05, $f2, $b5, $fc        ;; 07:6547 ????????
    db   $3c, $65, $f9, $f3, $38, $18, $08, $15        ;; 07:654f ????????
    db   $18, $08, $18, $fd, $64, $65, $35, $15        ;; 07:6557 ????????
    db   $05, $15, $fc, $52, $65, $35, $15, $08        ;; 07:655f ????????
    db   $15, $18, $fe, $3b, $65, $f7, $c0, $f7        ;; 07:6567 ????????
    db   $01, $f8, $06, $ef, $f1, $35, $f2, $2a        ;; 07:656f ????????
    db   $0a, $f1, $aa, $55, $f2, $05, $f1, $71        ;; 07:6577 ????????
    db   $c5, $fb, $f7, $ca, $f7, $0a, $f1, $08        ;; 07:657f ????????
    db   $bb, $f2, $0b, $f0, $78, $f1, $bb, $f2        ;; 07:6587 ????????
    db   $0b, $f1, $08, $bb, $f2, $0b, $f0, $78        ;; 07:658f ????????
    db   $f1, $bb, $f2, $0b, $fc, $81, $65, $fb        ;; 07:6597 ????????
    db   $f1, $18, $f2, $18, $f1, $7b, $8b, $f2        ;; 07:659f ????????
    db   $18, $f1, $18, $f2, $18, $f1, $7b, $8b        ;; 07:65a7 ????????
    db   $f2, $18, $fc, $9f, $65, $fe, $80, $65        ;; 07:65af ????????
    db   $e0, $23, $f7, $05, $f7, $82, $f7, $c0        ;; 07:65b7 ????????
    db   $f7, $43, $ef, $f4, $28, $f3, $98, $78        ;; 07:65bf ????????
    db   $98, $58, $98, $48, $98, $28, $f2, $98        ;; 07:65c7 ????????
    db   $78, $98, $58, $98, $48, $98, $f9, $f3        ;; 07:65cf ????????
    db   $53, $48, $25, $48, $58, $43, $28, $05        ;; 07:65d7 ????????
    db   $f2, $a8, $f3, $08, $fd, $f0, $65, $25        ;; 07:65df ????????
    db   $25, $25, $48, $28, $22, $12, $fc, $d6        ;; 07:65e7 ????????
    db   $65, $23, $28, $25, $05, $20, $fe, $d5        ;; 07:65ef ????????
    db   $65, $f7, $c4, $f7, $03, $f8, $06, $ef        ;; 07:65f7 ????????
    db   $c0, $c0, $f9, $f2, $58, $98, $78, $98        ;; 07:65ff ????????
    db   $58, $98, $78, $98, $48, $78, $58, $78        ;; 07:6607 ????????
    db   $48, $78, $58, $78, $fd, $29, $66, $28        ;; 07:660f ????????
    db   $58, $48, $58, $28, $88, $48, $88, $48        ;; 07:6617 ????????
    db   $98, $78, $98, $48, $78, $18, $48, $fc        ;; 07:661f ????????
    db   $02, $66, $28, $58, $48, $58, $28, $48        ;; 07:6627 ????????
    db   $08, $48, $28, $98, $a8, $98, $78, $98        ;; 07:662f ????????
    db   $48, $98, $fe, $01, $66, $f7, $05, $f7        ;; 07:6637 ????????
    db   $82, $f7, $c3, $f7, $43, $e8, $c0, $c0        ;; 07:663f ????????
    db   $f9, $f1, $20, $00, $f0, $a2, $f1, $42        ;; 07:6647 ????????
    db   $f0, $90, $f1, $20, $00, $f0, $a2, $92        ;; 07:664f ????????
    db   $f1, $20, $fe, $47, $66, $e0, $1e, $f7        ;; 07:6657 ????????
    db   $05, $f7, $80, $f7, $c3, $f7, $43, $ef        ;; 07:665f ????????
    db   $f2, $48, $48, $b2, $ab, $bb, $f3, $18        ;; 07:6667 ????????
    db   $f2, $b0, $f3, $48, $48, $b2, $ab, $bb        ;; 07:666f ????????
    db   $f4, $18, $f3, $b0, $f9, $f7, $c0, $f3        ;; 07:6677 ????????
    db   $82, $98, $88, $68, $98, $85, $42, $f2        ;; 07:667f ????????
    db   $b5, $f3, $05, $45, $65, $45, $fd, $95        ;; 07:6687 ????????
    db   $66, $42, $32, $fc, $7c, $66, $b0, $f9        ;; 07:668f ????????
    db   $48, $48, $b2, $ab, $bb, $f4, $18, $f3        ;; 07:6697 ????????
    db   $b5, $42, $45, $fd, $ae, $66, $f4, $02        ;; 07:669f ????????
    db   $25, $05, $f3, $b0, $fc, $97, $66, $f4        ;; 07:66a7 ????????
    db   $42, $25, $05, $f3, $b0, $fe, $7b, $66        ;; 07:66af ????????
    db   $f7, $c6, $f7, $03, $f8, $06, $ef, $c0        ;; 07:66b7 ????????
    db   $c0, $c0, $c0, $fb, $f2, $4b, $bb, $6b        ;; 07:66bf ????????
    db   $8b, $fc, $c3, $66, $fb, $4b, $bb, $6b        ;; 07:66c7 ????????
    db   $8b, $fc, $cc, $66, $fb, $4b, $bb, $6b        ;; 07:66cf ????????
    db   $7b, $fc, $d4, $66, $fb, $3b, $bb, $4b        ;; 07:66d7 ????????
    db   $6b, $fc, $dc, $66, $fe, $c2, $66, $f7        ;; 07:66df ????????
    db   $05, $f7, $80, $f7, $c4, $f7, $44, $ec        ;; 07:66e7 ????????
    db   $c0, $f2, $48, $48, $b2, $ab, $bb, $f3        ;; 07:66ef ????????
    db   $18, $f2, $b0, $f3, $48, $48, $b2, $ab        ;; 07:66f7 ????????
    db   $bb, $f4, $18, $f7, $82, $f7, $c9, $e8        ;; 07:66ff ????????
    db   $f1, $40, $20, $00, $f0, $b0, $fe, $02        ;; 07:6707 ????????
    db   $67, $e0, $64, $f7, $02, $f7, $82, $f7        ;; 07:670f ????????
    db   $c3, $f7, $43, $ef, $f2, $9b, $bb, $f3        ;; 07:6717 ????????
    db   $0b, $2b, $45, $db, $cb, $4b, $cb, $45        ;; 07:671f ????????
    db   $78, $c8, $78, $c8, $55, $48, $c8, $28        ;; 07:6727 ????????
    db   $c8, $58, $c8, $41, $ff, $f7, $02, $f7        ;; 07:672f ????????
    db   $80, $f7, $c4, $f7, $43, $ec, $c5, $f3        ;; 07:6737 ????????
    db   $05, $db, $cb, $0b, $cb, $06, $cb, $08        ;; 07:673f ????????
    db   $c8, $08, $c8, $08, $c8, $08, $c8, $f2        ;; 07:6747 ????????
    db   $a8, $c8, $f3, $18, $c8, $01, $ff, $f7        ;; 07:674f ????????
    db   $c0, $f7, $01, $f8, $06, $ef, $c5, $f2        ;; 07:6757 ????????
    db   $75, $db, $cb, $7b, $cb, $75, $b8, $c8        ;; 07:675f ????????
    db   $b8, $c8, $98, $c8, $78, $c8, $58, $c8        ;; 07:6767 ????????
    db   $88, $c8, $71, $ff, $f7, $05, $f7, $80        ;; 07:676f ????????
    db   $f7, $c3, $f7, $47, $ef, $e0, $2d, $f2        ;; 07:6777 ????????
    db   $98, $f3, $08, $78, $e0, $23, $6c, $5c        ;; 07:677f ????????
    db   $4c, $e0, $1e, $38, $f4, $08, $f3, $93        ;; 07:6787 ????????
    db   $dd, $ff, $f7, $05, $f7, $80, $f7, $c4        ;; 07:678f ????????
    db   $f7, $42, $ec, $cd, $f2, $98, $f3, $08        ;; 07:6797 ????????
    db   $78, $6c, $5c, $4c, $38, $f4, $08, $f3        ;; 07:679f ????????
    db   $93, $ff, $ff, $e0, $23, $f7, $05, $f7        ;; 07:67a7 ????????
    db   $80, $f7, $c0, $f7, $46, $ef, $f3, $08        ;; 07:67af ????????
    db   $f2, $b8, $f9, $f3, $08, $b8, $f2, $b8        ;; 07:67b7 ????????
    db   $f3, $08, $98, $f2, $b8, $f3, $08, $78        ;; 07:67bf ????????
    db   $fd, $da, $67, $f2, $b8, $f3, $08, $68        ;; 07:67c7 ????????
    db   $f2, $b8, $f3, $08, $48, $08, $f2, $b8        ;; 07:67cf ????????
    db   $fc, $ba, $67, $f2, $b8, $f3, $08, $68        ;; 07:67d7 ????????
    db   $f2, $b8, $f3, $08, $48, $f2, $a8, $98        ;; 07:67df ????????
    db   $f9, $f2, $a8, $f3, $98, $f2, $98, $a8        ;; 07:67e7 ????????
    db   $f3, $78, $f2, $98, $a8, $f3, $58, $fd        ;; 07:67ef ????????
    db   $09, $68, $f2, $98, $a8, $f3, $48, $f2        ;; 07:67f7 ????????
    db   $98, $a8, $f3, $28, $f2, $a8, $98, $fc        ;; 07:67ff ????????
    db   $e8, $67, $f2, $98, $a8, $f3, $48, $f2        ;; 07:6807 ????????
    db   $98, $a8, $f3, $28, $08, $f2, $b8, $fe        ;; 07:680f ????????
    db   $b9, $67, $f7, $0a, $f7, $81, $f7, $43        ;; 07:6817 ????????
    db   $e9, $c5, $fa, $f7, $c1, $f2, $45, $35        ;; 07:681f ????????
    db   $45, $35, $fc, $22, $68, $45, $35, $45        ;; 07:6827 ????????
    db   $25, $fa, $25, $15, $25, $15, $fc, $31        ;; 07:682f ????????
    db   $68, $25, $15, $25, $45, $fe, $21, $68        ;; 07:6837 ????????
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

data_07_69bd:
    db   $da, $c9, $b8, $a8, $68, $57, $46, $38        ;; 07:69bd ????????
    db   $da, $c9, $b8, $a8, $68, $57, $46, $38        ;; 07:69c5 ????????
    db   $00, $00, $55, $55, $aa, $aa, $ff, $ff        ;; 07:69cd ????????
    db   $00, $00, $55, $55, $aa, $aa, $ff, $ff        ;; 07:69d5 ????????
    db   $fa, $52, $02, $5a, $fa, $52, $02, $5a        ;; 07:69dd ????????
    db   $fa, $52, $02, $5a, $fa, $52, $02, $5a        ;; 07:69e5 ????????
    db   $01, $23, $45, $67, $89, $ab, $cd, $ef        ;; 07:69ed ????????
    db   $01, $23, $45, $67, $89, $ab, $cd, $ef        ;; 07:69f5 ????????
    db   $dd, $dd, $dd, $dd, $33, $33, $33, $33        ;; 07:69fd ????????
    db   $dd, $dd, $dd, $dd, $33, $33, $33, $33        ;; 07:6a05 ????????
    db   $dd, $dd, $33, $33, $33, $33, $33, $33        ;; 07:6a0d ????????
    db   $dd, $dd, $33, $33, $33, $33, $33, $33        ;; 07:6a15 ????????
    db   $8b, $cd, $d8, $d8, $38, $33, $45, $88        ;; 07:6a1d ????????
    db   $8b, $cd, $d8, $d8, $38, $33, $45, $88        ;; 07:6a25 ????????
    db   $23, $45, $66, $78, $88, $9a, $ab, $cd        ;; 07:6a2d ????????
    db   $23, $45, $66, $78, $88, $9a, $ab, $cd        ;; 07:6a35 ????????

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
    ldh  A, [hFFE0]                                    ;; 07:6a55 $f0 $e0
    ld   [wCEC1], A                                    ;; 07:6a57 $ea $c1 $ce
    ld   A, $01                                        ;; 07:6a5a $3e $01
    ldh  [hFFE3], A                                    ;; 07:6a5c $e0 $e3
    ld   C, $60                                        ;; 07:6a5e $0e $60
    ld   HL, wCE00                                     ;; 07:6a60 $21 $00 $ce
    ld   DE, wCE60                                     ;; 07:6a63 $11 $60 $ce
    call call_07_6a3d                                  ;; 07:6a66 $cd $3d $6a
.jr_07_6a69:
    ldh  A, [hFFE2]                                    ;; 07:6a69 $f0 $e2
    ldh  [hFFE0], A                                    ;; 07:6a6b $e0 $e0
    sub  A, A                                          ;; 07:6a6d $97
    ldh  [hFFE2], A                                    ;; 07:6a6e $e0 $e2
    ldh  [hFFE1], A                                    ;; 07:6a70 $e0 $e1
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
    ldh  [hFFE0], A                                    ;; 07:6aa0 $e0 $e0
    ldh  [hFFE1], A                                    ;; 07:6aa2 $e0 $e1
    sub  A, A                                          ;; 07:6aa4 $97
    ldh  [hFFE3], A                                    ;; 07:6aa5 $e0 $e3
.jr_07_6aa7:
    ret                                                ;; 07:6aa7 $c9

call_07_6aa8:
    ldh  A, [hFFE4]                                    ;; 07:6aa8 $f0 $e4
    cp   A, $00                                        ;; 07:6aaa $fe $00
    jr   Z, .jr_07_6adf                                ;; 07:6aac $28 $31
    dec  A                                             ;; 07:6aae $3d
    add  A, A                                          ;; 07:6aaf $87
    ld   B, A                                          ;; 07:6ab0 $47
    ld   E, A                                          ;; 07:6ab1 $5f
    ld   D, $00                                        ;; 07:6ab2 $16 $00
    ld   HL, data_07_6bc7                              ;; 07:6ab4 $21 $c7 $6b
    add  HL, DE                                        ;; 07:6ab7 $19
    ld   A, [HL+]                                      ;; 07:6ab8 $2a
    ldh  [hFFEB], A                                    ;; 07:6ab9 $e0 $eb
    ld   A, [HL]                                       ;; 07:6abb $7e
    ldh  [hFFEC], A                                    ;; 07:6abc $e0 $ec
    ld   A, B                                          ;; 07:6abe $78
    ld   E, A                                          ;; 07:6abf $5f
    ld   D, $00                                        ;; 07:6ac0 $16 $00
    ld   HL, data_07_6c0f                              ;; 07:6ac2 $21 $0f $6c
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
    ldh  [hFFE4], A                                    ;; 07:6add $e0 $e4
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

data_07_6bc7:
    db   $58, $6c, $65, $6c, $57, $6c, $57, $6c        ;; 07:6bc7 ????????
    db   $57, $6c, $57, $6c, $57, $6c, $57, $6c        ;; 07:6bcf ????????
    db   $ad, $6c, $b8, $6c, $bf, $6c, $57, $6c        ;; 07:6bd7 ????????
    db   $57, $6c, $57, $6c, $57, $6c, $57, $6c        ;; 07:6bdf ????????
    db   $f9, $6c, $57, $6c, $04, $6d, $57, $6c        ;; 07:6be7 ????????
    db   $1c, $6d, $2f, $6d, $42, $6d, $49, $6d        ;; 07:6bef ????????
    db   $5d, $6d, $72, $6d, $8b, $6d, $96, $6d        ;; 07:6bf7 ????????
    db   $57, $6c, $ad, $6d, $57, $6c, $57, $6c        ;; 07:6bff ????????
    db   $57, $6c, $57, $6c, $e0, $6d, $e7, $6d        ;; 07:6c07 ????????

data_07_6c0f:
    db   $57, $6c, $72, $6c, $79, $6c, $80, $6c        ;; 07:6c0f ????????
    db   $87, $6c, $91, $6c, $98, $6c, $a3, $6c        ;; 07:6c17 ????????
    db   $b4, $6c, $57, $6c, $c6, $6c, $ca, $6c        ;; 07:6c1f ????????
    db   $d4, $6c, $df, $6c, $e6, $6c, $f1, $6c        ;; 07:6c27 ????????
    db   $57, $6c, $00, $6d, $0b, $6d, $12, $6d        ;; 07:6c2f ????????
    db   $57, $6c, $3a, $6d, $57, $6c, $56, $6d        ;; 07:6c37 ????????
    db   $68, $6d, $7d, $6d, $92, $6d, $57, $6c        ;; 07:6c3f ????????
    db   $a3, $6d, $ba, $6d, $c1, $6d, $c5, $6d        ;; 07:6c47 ????????
    db   $cc, $6d, $d6, $6d, $57, $6c, $f2, $6d        ;; 07:6c4f ????????
    db   $00, $02, $00, $40, $fa, $a0, $87, $10        ;; 07:6c57 ????????
    db   $00, $00, $a2, $e0, $87, $00, $06, $71        ;; 07:6c5f ????????
    db   $00, $87, $80, $83, $20, $17, $80, $a6        ;; 07:6c67 ????????
    db   $ff, $85, $00, $1f, $ff, $5f, $14, $a4        ;; 07:6c6f ????????
    db   $07, $00, $02, $81, $1f, $16, $ff, $6a        ;; 07:6c77 ????????
    db   $00, $04, $8a, $50, $30, $f7, $37, $00        ;; 07:6c7f ????????
    db   $02, $ca, $6a, $08, $fc, $7c, $30, $a7        ;; 07:6c87 ????????
    db   $35, $00, $14, $c7, $65, $06, $ff, $40        ;; 07:6c8f ????????
    db   $00, $e6, $03, $fb, $5e, $04, $fd, $22        ;; 07:6c97 ????????
    db   $f0, $99, $6c, $00, $04, $cd, $32, $12        ;; 07:6c9f ????????
    db   $8f, $6d, $04, $fa, $3f, $00, $60, $27        ;; 07:6ca7 ????????
    db   $00, $ff, $00, $82, $00, $60, $58, $41        ;; 07:6caf ????????
    db   $00, $1a, $37, $80, $fd, $50, $87, $00        ;; 07:6cb7 ????????
    db   $06, $25, $00, $f0, $55, $86, $00, $10        ;; 07:6cbf ????????
    db   $f2, $07, $00, $09, $fb, $5d, $16, $c5        ;; 07:6cc7 ????????
    db   $6e, $16, $92, $6e, $00, $e8, $03, $f1        ;; 07:6ccf ????????
    db   $69, $01, $01, $5a, $f0, $d5, $6c, $00        ;; 07:6cd7 ????????
    db   $1a, $f4, $37, $20, $f7, $10, $00, $e4        ;; 07:6cdf ????????
    db   $05, $f8, $08, $0f, $a7, $07, $f0, $e7        ;; 07:6ce7 ????????
    db   $6c, $00, $e8, $0a, $fc, $17, $f0, $f2        ;; 07:6cef ????????
    db   $6c, $00, $1e, $27, $80, $ff, $b0, $86        ;; 07:6cf7 ????????
    db   $00, $15, $92, $5e, $00, $03, $1f, $c0        ;; 07:6cff ????????
    db   $e7, $99, $87, $00, $04, $d2, $07, $05        ;; 07:6d07 ????????
    db   $71, $02, $00, $03, $f1, $6c, $01, $32        ;; 07:6d0f ????????
    db   $11, $27, $f2, $32, $00, $16, $57, $80        ;; 07:6d17 ????????
    db   $f7, $f7, $86, $16, $47, $80, $94, $f7        ;; 07:6d1f ????????
    db   $86, $16, $37, $80, $55, $f7, $86, $00        ;; 07:6d27 ????????
    db   $e6, $21, $75, $80, $a8, $87, $80, $f0        ;; 07:6d2f ????????
    db   $30, $6d, $00, $e6, $21, $c1, $6f, $f0        ;; 07:6d37 ????????
    db   $3b, $6d, $00, $20, $25, $80, $ad, $1a        ;; 07:6d3f ????????
    db   $87, $00, $06, $33, $00, $a1, $5a, $84        ;; 07:6d47 ????????
    db   $05, $14, $c0, $f1, $ff, $85, $00, $03        ;; 07:6d4f ????????
    db   $fa, $4e, $07, $a2, $24, $00, $e4, $20        ;; 07:6d57 ????????
    db   $37, $40, $c7, $40, $85, $f0, $5e, $6d        ;; 07:6d5f ????????
    db   $00, $80, $00, $00, $06, $ff, $17, $16        ;; 07:6d67 ????????
    db   $f9, $51, $00, $e3, $23, $4d, $00, $d1        ;; 07:6d6f ????????
    db   $00, $85, $f0, $73, $6d, $00, $e3, $13        ;; 07:6d77 ????????
    db   $91, $2b, $08, $91, $2a, $08, $91, $2a        ;; 07:6d7f ????????
    db   $f0, $7e, $6d, $00, $26, $00, $80, $a7        ;; 07:6d87 ????????
    db   $00, $85, $00, $06, $f7, $5f, $00, $10        ;; 07:6d8f ????????
    db   $5c, $80, $f7, $00, $87, $20, $37, $00        ;; 07:6d97 ????????
    db   $f2, $b0, $86, $00, $06, $8a, $5c, $08        ;; 07:6d9f ????????
    db   $fc, $7f, $30, $b5, $67, $00, $04, $4e        ;; 07:6da7 ????????
    db   $c0, $f0, $ff, $86, $05, $26, $40, $90        ;; 07:6daf ????????
    db   $0e, $87, $00, $06, $f0, $12, $08, $f1        ;; 07:6db7 ????????
    db   $32, $00, $4a, $f7, $90, $00, $02, $fc        ;; 07:6dbf ????????
    db   $5c, $0c, $f4, $57, $00, $0a, $f7, $80        ;; 07:6dc7 ????????
    db   $08, $f7, $40, $20, $e3, $37, $00, $0a        ;; 07:6dcf ????????
    db   $f7, $31, $20, $f7, $11, $0f, $f2, $08        ;; 07:6dd7 ????????
    db   $00, $10, $23, $00, $f0, $10, $82, $00        ;; 07:6ddf ????????
    db   $e4, $0d, $35, $00, $29, $01, $85, $f0        ;; 07:6de7 ????????
    db   $e8, $6d, $00, $e4, $0d, $39, $5c, $f0        ;; 07:6def ????????
    db   $f3, $6d, $00, $02, $00, $20, $00, $00        ;; 07:6df7 ????????
    db   $00, $c3, $ac, $71, $c3, $0f, $6e, $c3        ;; 07:6dff ????????
    db   $6d, $77, $c3, $9c, $77, $c3, $da, $74        ;; 07:6e07 ????????
    db   $e0, $d5, $a7, $c8, $cd, $be, $74, $f0        ;; 07:6e0f ????????
    db   $b2, $6f, $26, $00, $01, $01, $77, $cd        ;; 07:6e17 ????????
    db   $67, $00, $3e, $06, $cd, $1d, $02, $e6        ;; 07:6e1f ????????
    db   $c0, $17, $d0, $ea, $3c, $d8, $17, $3e        ;; 07:6e27 ????????
    db   $01, $30, $03, $fa, $0c, $d8, $ea, $3b        ;; 07:6e2f ????????
    db   $d8, $f0, $b1, $fe, $04, $d8, $cd, $8c        ;; 07:6e37 ????????
    db   $01, $21, $50, $76, $11, $00, $80, $01        ;; 07:6e3f ????????
    db   $00, $04, $3e, $03, $cd, $15, $02, $f0        ;; 07:6e47 ????????
    db   $d5, $cb, $37, $e6, $0f, $c4, $af, $77        ;; 07:6e4f ????????
    db   $cd, $60, $6e, $cd, $8c, $01, $d7, $df        ;; 07:6e57 ????????
    db   $c9, $af, $ea, $28, $c4, $f0, $d5, $e6        ;; 07:6e5f ????????
    db   $0f, $c8, $3d, $01, $00, $7c, $cd, $7c        ;; 07:6e67 ????????
    db   $71, $7e, $a7, $c8, $cb, $37, $e6, $0f        ;; 07:6e6f ????????
    db   $ea, $3d, $d8, $2a, $e6, $0f, $3c, $ea        ;; 07:6e77 ????????
    db   $3e, $d8, $ea, $3f, $d8, $cd, $85, $71        ;; 07:6e7f ????????
    db   $cd, $8e, $71, $cd, $97, $71, $cd, $a8        ;; 07:6e87 ????????
    db   $6e, $21, $3e, $d8, $35, $20, $f7, $23        ;; 07:6e8f ????????
    db   $3a, $32, $35, $20, $eb, $cd, $a0, $71        ;; 07:6e97 ????????
    db   $18, $cf, $cd, $a0, $71, $2a, $c3, $97        ;; 07:6e9f ????????
    db   $71, $cd, $a1, $6e, $4f, $e6, $3f, $ea        ;; 07:6ea7 ????????
    db   $40, $d8, $79, $07, $07, $e6, $03, $20        ;; 07:6eaf ????????
    db   $04, $79, $c3, $d1, $77, $3d, $28, $16        ;; 07:6eb7 ????????
    db   $3d, $28, $5c, $3e, $01, $e0, $f6, $11        ;; 07:6ebf ????????
    db   $00, $00, $21, $00, $c0, $cd, $1a, $71        ;; 07:6ec7 ????????
    db   $cd, $dc, $70, $d7, $df, $c9, $01, $00        ;; 07:6ecf ????????
    db   $03, $fa, $3c, $d8, $a7, $20, $09, $f0        ;; 07:6ed7 ????????
    db   $b1, $21, $80, $df, $c7, $4e, $06, $01        ;; 07:6edf ????????
    db   $cd, $a0, $71, $cd, $97, $71, $c5, $e5        ;; 07:6ee7 ????????
    db   $79, $87, $21, $ea, $d3, $c7, $7e, $a7        ;; 07:6eef ????????
    db   $28, $01, $3c, $e0, $f6, $21, $28, $d8        ;; 07:6ef7 ????????
    db   $79, $c7, $7e, $d6, $02, $87, $87, $87        ;; 07:6eff ????????
    db   $5f, $16, $18, $79, $21, $a9, $71, $c7        ;; 07:6f07 ????????
    db   $6e, $26, $c0, $cd, $1a, $71, $e1, $c1        ;; 07:6f0f ????????
    db   $0c, $05, $20, $cf, $c3, $dc, $70, $cd        ;; 07:6f17 ????????
    db   $a0, $71, $2b, $11, $61, $d8, $01, $71        ;; 07:6f1f ????????
    db   $d8, $fa, $3e, $d8, $e0, $d0, $2a, $e6        ;; 07:6f27 ????????
    db   $3f, $02, $03, $c5, $cd, $4b, $00, $46        ;; 07:6f2f ????????
    db   $23, $23, $23, $05, $20, $fb, $c1, $f0        ;; 07:6f37 ????????
    db   $d0, $3d, $e0, $d0, $20, $e8, $cd, $85        ;; 07:6f3f ????????
    db   $71, $fa, $3d, $d8, $ea, $76, $d8, $21        ;; 07:6f47 ????????
    db   $69, $d8, $af, $22, $22, $22, $77, $ea        ;; 07:6f4f ????????
    db   $75, $d8, $21, $6d, $d8, $3d, $22, $22        ;; 07:6f57 ????????
    db   $22, $77, $cd, $8c, $01, $fa, $3d, $d8        ;; 07:6f5f ????????
    db   $a7, $28, $1f, $fa, $76, $d8, $a7, $28        ;; 07:6f67 ????????
    db   $19, $fa, $75, $d8, $4f, $21, $6d, $d8        ;; 07:6f6f ????????
    db   $c7, $7e, $fe, $ff, $20, $0c, $34, $cd        ;; 07:6f77 ????????
    db   $04, $70, $7e, $cd, $ef, $6f, $21, $76        ;; 07:6f7f ????????
    db   $d8, $35, $cd, $69, $70, $cd, $eb, $70        ;; 07:6f87 ????????
    db   $fa, $3e, $d8, $5f, $47, $0e, $00, $c5        ;; 07:6f8f ????????
    db   $79, $21, $69, $d8, $c7, $7e, $a7, $28        ;; 07:6f97 ????????
    db   $25, $35, $20, $22, $79, $21, $6d, $d8        ;; 07:6f9f ????????
    db   $c7, $34, $7e, $bb, $20, $0a, $36, $ff        ;; 07:6fa7 ????????
    db   $21, $3d, $d8, $7e, $a7, $28, $0f, $35        ;; 07:6faf ????????
    db   $cd, $ef, $6f, $fa, $75, $d8, $3c, $bb        ;; 07:6fb7 ????????
    db   $20, $01, $af, $ea, $75, $d8, $c1, $0c        ;; 07:6fbf ????????
    db   $05, $20, $cc, $21, $69, $d8, $fa, $3e        ;; 07:6fc7 ????????
    db   $d8, $47, $af, $b6, $23, $05, $20, $fb        ;; 07:6fcf ????????
    db   $a7, $c2, $61, $6f, $fa, $3d, $d8, $a7        ;; 07:6fd7 ????????
    db   $c2, $61, $6f, $cd, $8c, $01, $d7, $df        ;; 07:6fdf ????????
    db   $cd, $8e, $71, $e8, $02, $c3, $70, $6e        ;; 07:6fe7 ????????
    db   $f5, $c5, $d5, $e5, $21, $71, $d8, $c7        ;; 07:6fef ????????
    db   $cd, $0b, $00, $79, $21, $69, $d8, $c7        ;; 07:6ff7 ????????
    db   $1a, $77, $c3, $13, $00, $f5, $c5, $d5        ;; 07:6fff ????????
    db   $e5, $11, $0d, $d8, $21, $41, $d8, $cd        ;; 07:7007 ????????
    db   $1d, $70, $11, $10, $d8, $21, $51, $d8        ;; 07:700f ????????
    db   $cd, $1d, $70, $c3, $13, $00, $c5, $79        ;; 07:7017 ????????
    db   $87, $87, $c7, $cd, $0b, $00, $01, $00        ;; 07:701f ????????
    db   $03, $fa, $3c, $d8, $a7, $20, $0b, $f0        ;; 07:7027 ????????
    db   $b1, $e5, $21, $80, $df, $c7, $4e, $e1        ;; 07:702f ????????
    db   $06, $01, $79, $87, $e5, $21, $ea, $d3        ;; 07:7037 ????????
    db   $c7, $7e, $e1, $a7, $28, $09, $3c, $28        ;; 07:703f ????????
    db   $06, $79, $cd, $54, $70, $12, $13, $0c        ;; 07:7047 ????????
    db   $05, $20, $e7, $c1, $c9, $d5, $e5, $c7        ;; 07:704f ????????
    db   $5e, $1d, $1d, $3e, $06, $c7, $56, $af        ;; 07:7057 ????????
    db   $cd, $6b, $01, $82, $87, $87, $87, $e1        ;; 07:705f ????????
    db   $d1, $c9, $af, $e0, $f5, $21, $00, $c0        ;; 07:7067 ????????
    db   $11, $dc, $ff, $cd, $4b, $00, $cd, $73        ;; 07:706f ????????
    db   $71, $fa, $3b, $d8, $47, $c5, $fa, $3e        ;; 07:7077 ????????
    db   $d8, $47, $af, $e0, $f4, $c5, $f0, $f4        ;; 07:707f ????????
    db   $21, $6d, $d8, $c7, $7e, $fe, $ff, $28        ;; 07:7087 ????????
    db   $23, $87, $21, $61, $d8, $c7, $2a, $66        ;; 07:708f ????????
    db   $6f, $cd, $97, $71, $21, $41, $d8, $cd        ;; 07:7097 ????????
    db   $d2, $70, $5e, $21, $51, $d8, $cd, $d2        ;; 07:709f ????????
    db   $70, $56, $cd, $6a, $71, $3e, $01, $e0        ;; 07:70a7 ????????
    db   $f6, $cd, $1a, $71, $c1, $21, $f4, $ff        ;; 07:70af ????????
    db   $34, $05, $20, $c9, $21, $dc, $ff, $e5        ;; 07:70b7 ????????
    db   $2a, $66, $6f, $3e, $34, $c7, $d1, $cd        ;; 07:70bf ????????
    db   $4b, $00, $21, $f5, $ff, $34, $c1, $05        ;; 07:70c7 ????????
    db   $20, $ab, $c9, $f0, $f5, $47, $f0, $f4        ;; 07:70cf ????????
    db   $87, $87, $80, $c7, $c9, $fa, $40, $d8        ;; 07:70d7 ????????
    db   $47, $c5, $cd, $eb, $70, $c1, $05, $20        ;; 07:70df ????????
    db   $f8, $c3, $8c, $01, $cd, $f4, $70, $d7        ;; 07:70e7 ????????
    db   $3e, $c1, $c3, $80, $ff, $06, $a0, $21        ;; 07:70ef ????????
    db   $00, $c0, $16, $c1, $fa, $28, $c4, $5f        ;; 07:70f7 ????????
    db   $c6, $28, $b8, $20, $01, $af, $ea, $28        ;; 07:70ff ????????
    db   $c4, $1c, $1d, $28, $0b, $78, $93, $47        ;; 07:7107 ????????
    db   $cd, $8f, $00, $58, $3e, $a0, $95, $47        ;; 07:710f ????????
    db   $c3, $8f, $00, $7a, $e0, $d0, $7b, $e0        ;; 07:7117 ????????
    db   $d1, $c5, $cd, $73, $71, $cd, $a1, $6e        ;; 07:711f ????????
    db   $47, $e0, $d4, $c5, $cd, $a1, $6e, $87        ;; 07:7127 ????????
    db   $21, $1e, $7c, $c7, $f0, $d0, $86, $57        ;; 07:712f ????????
    db   $23, $f0, $d1, $86, $5f, $cd, $a1, $6e        ;; 07:7137 ????????
    db   $47, $e6, $c0, $cb, $3f, $4f, $f0, $f6        ;; 07:713f ????????
    db   $a7, $28, $0c, $78, $e6, $3f, $cd, $6a        ;; 07:7147 ????????
    db   $71, $cd, $5c, $71, $cd, $73, $71, $c1        ;; 07:714f ????????
    db   $05, $20, $d0, $c1, $c9, $f5, $7a, $c6        ;; 07:7157 ????????
    db   $10, $22, $7b, $c6, $08, $22, $f1, $22        ;; 07:715f ????????
    db   $71, $23, $c9, $f5, $f0, $d2, $6f, $f0        ;; 07:7167 ????????
    db   $d3, $67, $f1, $c9, $f5, $7d, $e0, $d2        ;; 07:716f ????????
    db   $7c, $e0, $d3, $f1, $c9, $6f, $26, $00        ;; 07:7177 ????????
    db   $29, $09, $2a, $66, $6f, $c9, $f5, $7d        ;; 07:717f ????????
    db   $e0, $f0, $7c, $e0, $f1, $f1, $c9, $f5        ;; 07:7187 ????????
    db   $f0, $f0, $6f, $f0, $f1, $67, $f1, $c9        ;; 07:718f ????????
    db   $f5, $7d, $e0, $f2, $7c, $e0, $f3, $f1        ;; 07:7197 ????????
    db   $c9, $f5, $f0, $f2, $6f, $f0, $f3, $67        ;; 07:719f ????????
    db   $f1, $c9, $00, $34, $68, $3e, $05, $e0        ;; 07:71a7 ????????
    db   $e4, $cd, $8c, $01, $d7, $df, $3e, $80        ;; 07:71af ????????
    db   $e0, $40, $af, $e0, $42, $e0, $43, $3e        ;; 07:71b7 ????????
    db   $0a, $21, $32, $d8, $06, $04, $cd, $7c        ;; 07:71bf ????????
    db   $00, $06, $04, $cd, $7b, $00, $21, $80        ;; 07:71c7 ????????
    db   $df, $06, $20, $cd, $7b, $00, $e0, $d0        ;; 07:71cf ????????
    db   $21, $84, $df, $11, $ea, $d3, $0e, $03        ;; 07:71d7 ????????
    db   $1a, $13, $13, $fe, $ff, $28, $09, $47        ;; 07:71df ????????
    db   $f0, $d0, $cd, $7c, $00, $3c, $e0, $d0        ;; 07:71e7 ????????
    db   $0d, $20, $ed, $21, $e9, $d3, $11, $00        ;; 07:71ef ????????
    db   $d8, $06, $06, $cd, $8f, $00, $cd, $be        ;; 07:71f7 ????????
    db   $74, $21, $00, $d8, $11, $09, $06, $0e        ;; 07:71ff ????????
    db   $3a, $fa, $0c, $d8, $47, $2a, $23, $e5        ;; 07:7207 ????????
    db   $c5, $cd, $cb, $01, $6a, $70, $6b, $71        ;; 07:720f ????????
    db   $c1, $69, $77, $e1, $0c, $1c, $14, $05        ;; 07:7217 ????????
    db   $20, $eb, $fa, $3a, $d8, $21, $d7, $74        ;; 07:721f ????????
    db   $c7, $7e, $e0, $e0, $21, $00, $79, $11        ;; 07:7227 ????????
    db   $00, $c6, $01, $00, $01, $3e, $02, $cd        ;; 07:722f ????????
    db   $07, $02, $21, $0c, $d8, $46, $2e, $06        ;; 07:7237 ????????
    db   $11, $0d, $d8, $2a, $e5, $87, $21, $c8        ;; 07:723f ????????
    db   $c6, $c7, $2a, $12, $13, $13, $13, $7e        ;; 07:7247 ????????
    db   $12, $1b, $1b, $e1, $05, $20, $ec, $21        ;; 07:724f ????????
    db   $0c, $d8, $46, $2e, $06, $11, $19, $d8        ;; 07:7257 ????????
    db   $2a, $e5, $21, $ea, $c6, $c7, $2a, $12        ;; 07:725f ????????
    db   $13, $e1, $05, $20, $f3, $cd, $ae, $74        ;; 07:7267 ????????
    db   $11, $0d, $13, $2a, $e5, $26, $d8, $6b        ;; 07:726f ????????
    db   $4e, $cb, $39, $91, $6a, $77, $1c, $14        ;; 07:7277 ????????
    db   $e1, $05, $20, $ef, $21, $0c, $d8, $46        ;; 07:727f ????????
    db   $2e, $06, $11, $16, $d8, $2a, $e5, $21        ;; 07:7287 ????????
    db   $e5, $c6, $c7, $7e, $e1, $12, $13, $05        ;; 07:728f ????????
    db   $20, $f3, $11, $06, $d8, $21, $0c, $d8        ;; 07:7297 ????????
    db   $46, $2e, $1c, $05, $3e, $80, $77, $28        ;; 07:729f ????????
    db   $0f, $1a, $13, $e5, $21, $ea, $c6, $c7        ;; 07:72a7 ????????
    db   $7e, $e1, $86, $23, $77, $05, $20, $f1        ;; 07:72af ????????
    db   $cd, $ae, $74, $11, $28, $d8, $06, $03        ;; 07:72b7 ????????
    db   $cd, $8f, $00, $21, $10, $d8, $11, $2b        ;; 07:72bf ????????
    db   $d8, $06, $03, $d5, $cd, $8f, $00, $e1        ;; 07:72c7 ????????
    db   $06, $03, $11, $16, $d8, $cb, $3e, $1a        ;; 07:72cf ????????
    db   $86, $22, $13, $05, $20, $f7, $cd, $ae        ;; 07:72d7 ????????
    db   $74, $11, $2e, $d8, $06, $03, $2a, $d6        ;; 07:72df ????????
    db   $03, $12, $13, $05, $20, $f8, $21, $0c        ;; 07:72e7 ????????
    db   $d8, $46, $11, $1f, $06, $0e, $19, $c5        ;; 07:72ef ????????
    db   $d5, $26, $d8, $69, $4e, $6a, $7e, $87        ;; 07:72f7 ????????
    db   $21, $d2, $c6, $c7, $2a, $66, $6f, $e5        ;; 07:72ff ????????
    db   $26, $d8, $6a, $2c, $2c, $2c, $6e, $61        ;; 07:7307 ????????
    db   $cd, $5f, $01, $cd, $5e, $00, $c1, $09        ;; 07:730f ????????
    db   $4d, $44, $26, $d8, $6b, $71, $23, $70        ;; 07:7317 ????????
    db   $d1, $c1, $0c, $1c, $1c, $14, $05, $20        ;; 07:731f ????????
    db   $ce, $21, $32, $d8, $06, $04, $3e, $0a        ;; 07:7327 ????????
    db   $cd, $7c, $00, $06, $04, $cd, $7b, $00        ;; 07:732f ????????
    db   $e0, $d0, $f0, $d0, $6f, $cd, $ce, $01        ;; 07:7337 ????????
    db   $01, $00, $08, $21, $da, $c3, $79, $c7        ;; 07:733f ????????
    db   $7e, $3c, $28, $20, $f0, $d0, $21, $32        ;; 07:7347 ????????
    db   $d8, $c7, $5d, $54, $21, $36, $d8, $c7        ;; 07:734f ????????
    db   $79, $e6, $03, $87, $c6, $0a, $12, $79        ;; 07:7357 ????????
    db   $fe, $04, $30, $04, $36, $00, $18, $02        ;; 07:735f ????????
    db   $36, $04, $06, $01, $0c, $05, $20, $d3        ;; 07:7367 ????????
    db   $f0, $d0, $3c, $e0, $d0, $fe, $04, $20        ;; 07:736f ????????
    db   $c1, $21, $0c, $d8, $46, $0e, $00, $11        ;; 07:7377 ????????
    db   $00, $88, $c5, $21, $19, $d8, $7d, $81        ;; 07:737f ????????
    db   $6f, $46, $79, $87, $c6, $1f, $6f, $2a        ;; 07:7387 ????????
    db   $66, $6f, $e5, $68, $26, $00, $cd, $5e        ;; 07:738f ????????
    db   $00, $4d, $44, $e1, $d7, $d7, $3e, $04        ;; 07:7397 ????????
    db   $cd, $15, $02, $c1, $0c, $05, $20, $da        ;; 07:739f ????????
    db   $21, $00, $7f, $11, $00, $8f, $06, $00        ;; 07:73a7 ????????
    db   $3e, $02, $cd, $0e, $02, $cd, $8c, $01        ;; 07:73af ????????
    db   $cd, $a7, $01, $06, $a0, $3e, $7f, $21        ;; 07:73b7 ????????
    db   $00, $d9, $cd, $7c, $00, $fa, $0c, $d8        ;; 07:73bf ????????
    db   $5f, $7b, $3d, $cd, $9a, $74, $26, $d9        ;; 07:73c7 ????????
    db   $e5, $21, $0d, $d8, $c7, $4e, $23, $23        ;; 07:73cf ????????
    db   $23, $46, $21, $1c, $d8, $c7, $7e, $e1        ;; 07:73d7 ????????
    db   $51, $4a, $22, $3c, $0d, $20, $fb, $f5        ;; 07:73df ????????
    db   $3e, $14, $92, $c7, $f1, $05, $20, $f1        ;; 07:73e7 ????????
    db   $1d, $20, $d6, $3e, $7f, $01, $00, $08        ;; 07:73ef ????????
    db   $21, $00, $98, $cd, $ac, $00, $21, $00        ;; 07:73f7 ????????
    db   $d9, $11, $00, $98, $01, $08, $14, $cd        ;; 07:73ff ????????
    db   $86, $01, $3e, $98, $ea, $77, $d8, $d7        ;; 07:7407 ????????
    db   $df, $3e, $e3, $e0, $40, $3e, $07, $e0        ;; 07:740f ????????
    db   $4b, $af, $e0, $4a, $21, $00, $d9, $06        ;; 07:7417 ????????
    db   $40, $3e, $07, $cd, $7c, $00, $21, $00        ;; 07:741f ????????
    db   $da, $06, $40, $3e, $07, $1e, $57, $cd        ;; 07:7427 ????????
    db   $6b, $01, $d6, $57, $22, $05, $20, $f3        ;; 07:742f ????????
    db   $cd, $d7, $01, $cd, $dd, $01, $21, $00        ;; 07:7437 ????????
    db   $d9, $7e, $e0, $4b, $f0, $44, $bd, $20        ;; 07:743f ????????
    db   $fb, $fe, $3f, $28, $03, $2c, $18, $f1        ;; 07:7447 ????????
    db   $3e, $a5, $e0, $4b, $cd, $71, $01, $2e        ;; 07:744f ????????
    db   $00, $06, $40, $26, $da, $7e, $a7, $20        ;; 07:7457 ????????
    db   $0c, $25, $7e, $c6, $08, $fe, $a6, $38        ;; 07:745f ????????
    db   $13, $3e, $a5, $18, $0f, $7e, $c6, $08        ;; 07:7467 ????????
    db   $fe, $b0, $30, $08, $fe, $07, $38, $04        ;; 07:746f ????????
    db   $25, $77, $af, $24, $22, $05, $20, $db        ;; 07:7477 ????????
    db   $21, $00, $d9, $01, $00, $40, $2a, $d6        ;; 07:747f ????????
    db   $a5, $b1, $4f, $05, $20, $f8, $79, $a7        ;; 07:7487 ????????
    db   $20, $a9, $cd, $da, $01, $d7, $3e, $c3        ;; 07:748f ????????
    db   $e0, $40, $c9, $f5, $d5, $21, $13, $d8        ;; 07:7497 ????????
    db   $c7, $2a, $23, $23, $6e, $26, $14, $cd        ;; 07:749f ????????
    db   $5f, $01, $85, $6f, $d1, $f1, $c9, $fa        ;; 07:74a7 ????????
    db   $0c, $d8, $47, $3d, $6f, $26, $03, $cd        ;; 07:74af ????????
    db   $5f, $01, $11, $dc, $c6, $19, $c9, $3e        ;; 07:74b7 ????????
    db   $ff, $01, $00, $03, $21, $ea, $d3, $2a        ;; 07:74bf ????????
    db   $a7, $28, $04, $3c, $28, $01, $0c, $23        ;; 07:74c7 ????????
    db   $05, $20, $f4, $79, $ea, $0c, $d8, $c9        ;; 07:74cf ????????
    db   $08, $06, $05, $f5, $c5, $d5, $e5, $fa        ;; 07:74d7 ????????
    db   $77, $d8, $fe, $98, $20, $06, $fa, $3a        ;; 07:74df ????????
    db   $d8, $a7, $20, $11, $cd, $0f, $77, $21        ;; 07:74e7 ????????
    db   $e9, $d3, $11, $00, $d8, $06, $06, $cd        ;; 07:74ef ????????
    db   $8f, $00, $c3, $13, $00, $4f, $fa, $ea        ;; 07:74f7 ????????
    db   $d3, $a7, $20, $0b, $0d, $28, $05, $cd        ;; 07:74ff ????????
    db   $c6, $75, $18, $03, $cd, $10, $75, $18        ;; 07:7507 ????????
    db   $de, $3e, $04, $e0, $d2, $af, $e0, $d1        ;; 07:750f ????????
    db   $21, $00, $d9, $06, $00, $cd, $7b, $00        ;; 07:7517 ????????
    db   $21, $00, $9c, $3e, $7f, $06, $00, $cd        ;; 07:751f ????????
    db   $a3, $00, $21, $00, $99, $11, $00, $9d        ;; 07:7527 ????????
    db   $01, $40, $01, $cd, $be, $00, $cd, $d7        ;; 07:752f ????????
    db   $01, $3e, $c3, $e0, $40, $3e, $07, $e0        ;; 07:7537 ????????
    db   $4b, $af, $e0, $4a, $cd, $dd, $01, $21        ;; 07:753f ????????
    db   $00, $d9, $7e, $e0, $43, $f0, $44, $bd        ;; 07:7547 ????????
    db   $20, $fb, $fe, $3f, $28, $03, $2c, $18        ;; 07:754f ????????
    db   $f1, $af, $e0, $43, $cd, $71, $01, $21        ;; 07:7557 ????????
    db   $d2, $ff, $35, $20, $df, $36, $04, $f0        ;; 07:755f ????????
    db   $d1, $3c, $fe, $20, $38, $02, $3e, $20        ;; 07:7567 ????????
    db   $e0, $d1, $cd, $95, $75, $fa, $1f, $d9        ;; 07:756f ????????
    db   $fe, $70, $20, $c8, $cd, $dd, $01, $3e        ;; 07:7577 ????????
    db   $e3, $e0, $40, $cd, $da, $01, $21, $00        ;; 07:757f ????????
    db   $98, $3e, $7f, $06, $00, $cd, $a3, $00        ;; 07:7587 ????????
    db   $d7, $3e, $c3, $e0, $40, $c9, $21, $00        ;; 07:758f ????????
    db   $d9, $f0, $d1, $47, $7e, $a7, $20, $03        ;; 07:7597 ????????
    db   $34, $18, $08, $87, $fe, $70, $38, $02        ;; 07:759f ????????
    db   $3e, $70, $22, $05, $20, $ee, $f0, $d1        ;; 07:75a7 ????????
    db   $47, $21, $3f, $d9, $7e, $a7, $20, $03        ;; 07:75af ????????
    db   $35, $18, $08, $87, $fe, $90, $30, $02        ;; 07:75b7 ????????
    db   $3e, $90, $32, $05, $20, $ee, $c9, $3e        ;; 07:75bf ????????
    db   $04, $e0, $d0, $3e, $01, $e0, $d2, $e0        ;; 07:75c7 ????????
    db   $d3, $af, $e0, $d1, $21, $00, $d9, $06        ;; 07:75cf ????????
    db   $00, $cd, $7b, $00, $21, $0a, $98, $11        ;; 07:75d7 ????????
    db   $00, $9c, $0e, $08, $cd, $7a, $01, $06        ;; 07:75df ????????
    db   $0a, $cd, $8f, $00, $3e, $16, $c7, $cd        ;; 07:75e7 ????????
    db   $0b, $00, $c7, $cd, $0b, $00, $0d, $20        ;; 07:75ef ????????
    db   $ee, $cd, $7d, $01, $21, $13, $99, $11        ;; 07:75f7 ????????
    db   $00, $9d, $0e, $0a, $cd, $7a, $01, $7e        ;; 07:75ff ????????
    db   $12, $3e, $20, $c7, $cd, $0b, $00, $c7        ;; 07:7607 ????????
    db   $cd, $0b, $00, $0d, $20, $f1, $cd, $7d        ;; 07:760f ????????
    db   $01, $cd, $d7, $01, $3e, $e3, $e0, $40        ;; 07:7617 ????????
    db   $af, $e0, $4a, $21, $0a, $98, $0e, $08        ;; 07:761f ????????
    db   $3e, $57, $e0, $4b, $f0, $44, $a7, $20        ;; 07:7627 ????????
    db   $fb, $f0, $44, $fe, $40, $38, $fa, $3e        ;; 07:762f ????????
    db   $9f, $e0, $4b, $cd, $71, $01, $cd, $dd        ;; 07:7637 ????????
    db   $01, $06, $04, $3e, $7f, $cd, $7c, $00        ;; 07:763f ????????
    db   $3e, $1c, $c7, $0d, $20, $da, $3e, $57        ;; 07:7647 ????????
    db   $e0, $4b, $f0, $44, $a7, $20, $fb, $f0        ;; 07:764f ????????
    db   $44, $fe, $40, $38, $fa, $3e, $9f, $e0        ;; 07:7657 ????????
    db   $4b, $cd, $71, $01, $fa, $a6, $c3, $e0        ;; 07:765f ????????
    db   $47, $21, $00, $d9, $f0, $44, $fe, $98        ;; 07:7667 ????????
    db   $38, $fa, $fa, $a6, $c3, $57, $0e, $57        ;; 07:766f ????????
    db   $06, $a5, $1e, $50, $7e, $e0, $43, $81        ;; 07:7677 ????????
    db   $b8, $38, $01, $78, $e0, $4b, $b8, $28        ;; 07:767f ????????
    db   $03, $7a, $18, $01, $af, $e0, $47, $f0        ;; 07:7687 ????????
    db   $d2, $fe, $01, $20, $10, $f0, $d1, $bd        ;; 07:768f ????????
    db   $30, $03, $af, $18, $07, $f0, $d3, $86        ;; 07:7697 ????????
    db   $bb, $38, $01, $7b, $77, $f0, $44, $bd        ;; 07:769f ????????
    db   $20, $fb, $fe, $3f, $28, $03, $2c, $18        ;; 07:76a7 ????????
    db   $cb, $fa, $a6, $c3, $e0, $47, $3e, $9f        ;; 07:76af ????????
    db   $e0, $4b, $af, $e0, $43, $cd, $71, $01        ;; 07:76b7 ????????
    db   $21, $d2, $ff, $35, $20, $9e, $f0, $d0        ;; 07:76bf ????????
    db   $77, $f0, $d1, $3c, $fe, $40, $38, $02        ;; 07:76c7 ????????
    db   $3e, $40, $e0, $d1, $fe, $20, $38, $04        ;; 07:76cf ????????
    db   $3e, $01, $e0, $d0, $fa, $3f, $d9, $a7        ;; 07:76d7 ????????
    db   $ca, $e6, $76, $3e, $08, $e0, $d3, $fa        ;; 07:76df ????????
    db   $3f, $d9, $fe, $50, $c2, $63, $76, $21        ;; 07:76e7 ????????
    db   $06, $98, $11, $1c, $00, $3e, $7f, $06        ;; 07:76ef ????????
    db   $01, $cd, $dd, $01, $3e, $c3, $e0, $40        ;; 07:76f7 ????????
    db   $0e, $08, $22, $22, $22, $22, $19, $0d        ;; 07:76ff ????????
    db   $20, $f8, $05, $20, $ec, $c3, $da, $01        ;; 07:7707 ????????
    db   $21, $ea, $d3, $11, $01, $d8, $06, $00        ;; 07:770f ????????
    db   $7e, $a7, $20, $07, $1a, $a7, $28, $03        ;; 07:7717 ????????
    db   $cd, $2d, $77, $23, $23, $13, $13, $04        ;; 07:771f ????????
    db   $78, $fe, $03, $20, $eb, $c9, $c5, $d5        ;; 07:7727 ????????
    db   $e5, $78, $e0, $d0, $21, $0d, $d8, $c7        ;; 07:772f ????????
    db   $4e, $23, $23, $23, $46, $23, $23, $23        ;; 07:7737 ????????
    db   $5e, $23, $23, $23, $56, $6a, $26, $20        ;; 07:773f ????????
    db   $cd, $5f, $01, $7b, $c7, $fa, $77, $d8        ;; 07:7747 ????????
    db   $84, $67, $3e, $20, $91, $5f, $16, $00        ;; 07:774f ????????
    db   $cd, $7a, $01, $c5, $41, $3e, $7f, $cd        ;; 07:7757 ????????
    db   $7c, $00, $19, $c1, $05, $20, $f4, $cd        ;; 07:775f ????????
    db   $7d, $01, $e1, $d1, $c1, $c9, $f5, $c5        ;; 07:7767 ????????
    db   $d5, $e5, $cd, $6d, $7a, $06, $02, $c5        ;; 07:776f ????????
    db   $21, $e7, $7a, $01, $4a, $08, $3e, $40        ;; 07:7777 ????????
    db   $e0, $d2, $cd, $8e, $77, $c1, $05, $20        ;; 07:777f ????????
    db   $ee, $cd, $93, $7a, $c3, $13, $00, $c5        ;; 07:7787 ????????
    db   $e5, $d7, $f0, $d2, $86, $23, $e2, $05        ;; 07:778f ????????
    db   $20, $f7, $e1, $c1, $c9, $3e, $98, $21        ;; 07:7797 ????????
    db   $77, $d8, $be, $c8, $77, $21, $00, $dd        ;; 07:779f ????????
    db   $11, $00, $98, $06, $00, $c3, $b5, $00        ;; 07:77a7 ????????
    db   $3d, $01, $a0, $7b, $cd, $7c, $71, $7d        ;; 07:77af ????????
    db   $e0, $d6, $7c, $e0, $d7, $21, $d6, $ff        ;; 07:77b7 ????????
    db   $2a, $66, $6f, $2a, $a7, $c8, $01, $bc        ;; 07:77bf ????????
    db   $77, $c5, $f5, $7d, $e0, $d6, $7c, $e0        ;; 07:77c7 ????????
    db   $d7, $f1, $3d, $87, $21, $d5, $7a, $c7        ;; 07:77cf ????????
    db   $2a, $66, $6f, $e9, $21, $00, $98, $11        ;; 07:77d7 ????????
    db   $00, $dd, $06, $00, $cd, $b5, $00, $21        ;; 07:77df ????????
    db   $00, $9c, $06, $00, $3e, $7f, $cd, $a3        ;; 07:77e7 ????????
    db   $00, $5d, $54, $21, $00, $99, $01, $40        ;; 07:77ef ????????
    db   $01, $cd, $be, $00, $fa, $a6, $c3, $5f        ;; 07:77f7 ????????
    db   $06, $03, $c5, $cb, $23, $cb, $23, $16        ;; 07:77ff ????????
    db   $0f, $d7, $7b, $e0, $47, $f0, $44, $fe        ;; 07:7807 ????????
    db   $40, $20, $fa, $fa, $a6, $c3, $e0, $47        ;; 07:780f ????????
    db   $15, $20, $ee, $c1, $05, $20, $e3, $d7        ;; 07:7817 ????????
    db   $af, $e0, $4a, $3e, $07, $e0, $4b, $f0        ;; 07:781f ????????
    db   $40, $f6, $60, $e0, $40, $21, $00, $98        ;; 07:7827 ????????
    db   $06, $00, $3e, $7f, $cd, $a3, $00, $d7        ;; 07:782f ????????
    db   $f0, $40, $e6, $df, $e0, $40, $3e, $dd        ;; 07:7837 ????????
    db   $ea, $77, $d8, $c9, $f5, $cd, $6d, $7a        ;; 07:783f ????????
    db   $06, $02, $c5, $21, $e7, $7a, $01, $43        ;; 07:7847 ????????
    db   $08, $cd, $60, $78, $0d, $cd, $60, $78        ;; 07:784f ????????
    db   $c1, $05, $20, $ee, $cd, $93, $7a, $f1        ;; 07:7857 ????????
    db   $c9, $c5, $e5, $d7, $2a, $e2, $05, $20        ;; 07:785f ????????
    db   $fa, $e1, $c1, $c9, $f5, $06, $04, $c5        ;; 07:7867 ????????
    db   $f0, $44, $fe, $91, $38, $fa, $f0, $40        ;; 07:786f ????????
    db   $cb, $bf, $e0, $40, $e0, $04, $f0, $04        ;; 07:7877 ????????
    db   $cb, $6f, $28, $fa, $f0, $40, $cb, $ff        ;; 07:787f ????????
    db   $e0, $40, $06, $06, $d7, $05, $20, $fc        ;; 07:7887 ????????
    db   $c1, $05, $20, $db, $f1, $c9, $f5, $cd        ;; 07:788f ????????
    db   $d7, $01, $fa, $a6, $c3, $e0, $d4, $06        ;; 07:7897 ????????
    db   $10, $c5, $3e, $01, $e0, $d2, $f0, $d4        ;; 07:789f ????????
    db   $e0, $d1, $af, $e0, $d3, $f0, $d3, $e0        ;; 07:78a7 ????????
    db   $d0, $21, $44, $ff, $0e, $47, $be, $20        ;; 07:78af ????????
    db   $fd, $f0, $d1, $2f, $e0, $d1, $e2, $f0        ;; 07:78b7 ????????
    db   $d0, $c6, $08, $fe, $40, $38, $e8, $f0        ;; 07:78bf ????????
    db   $44, $fe, $40, $20, $fa, $fa, $a6, $c3        ;; 07:78c7 ????????
    db   $e0, $47, $f0, $d4, $e0, $d1, $cd, $71        ;; 07:78cf ????????
    db   $01, $21, $d2, $ff, $35, $20, $ce, $36        ;; 07:78d7 ????????
    db   $01, $f0, $d3, $3c, $3c, $fe, $08, $38        ;; 07:78df ????????
    db   $c2, $af, $e0, $d3, $f0, $d4, $2f, $e0        ;; 07:78e7 ????????
    db   $d4, $c1, $05, $20, $ac, $cd, $da, $01        ;; 07:78ef ????????
    db   $f1, $c9, $f5, $af, $e0, $d0, $cd, $46        ;; 07:78f7 ????????
    db   $79, $3e, $04, $e0, $d2, $cd, $d7, $01        ;; 07:78ff ????????
    db   $06, $10, $c5, $f0, $44, $fe, $90, $20        ;; 07:7907 ????????
    db   $fa, $21, $00, $d9, $7e, $e0, $43, $f0        ;; 07:790f ????????
    db   $44, $bd, $20, $fb, $fe, $3f, $28, $03        ;; 07:7917 ????????
    db   $2c, $18, $f1, $af, $e0, $43, $cd, $71        ;; 07:791f ????????
    db   $01, $21, $d2, $ff, $35, $20, $dc, $36        ;; 07:7927 ????????
    db   $04, $f0, $d0, $3c, $fe, $40, $38, $01        ;; 07:792f ????????
    db   $af, $e0, $d0, $cd, $46, $79, $c1, $05        ;; 07:7937 ????????
    db   $20, $c8, $cd, $da, $01, $f1, $c9, $21        ;; 07:793f ????????
    db   $60, $7b, $11, $00, $da, $d5, $06, $40        ;; 07:7947 ????????
    db   $cd, $8f, $00, $e1, $f0, $d0, $6f, $11        ;; 07:794f ????????
    db   $00, $d9, $06, $40, $2a, $12, $13, $7d        ;; 07:7957 ????????
    db   $fe, $40, $38, $02, $2e, $00, $05, $20        ;; 07:795f ????????
    db   $f3, $c9, $cd, $d7, $01, $06, $3c, $21        ;; 07:7967 ????????
    db   $60, $7b, $f0, $44, $fe, $90, $20, $fa        ;; 07:796f ????????
    db   $2a, $e0, $43, $f0, $44, $fe, $40, $20        ;; 07:7977 ????????
    db   $fa, $af, $e0, $43, $cd, $71, $01, $05        ;; 07:797f ????????
    db   $20, $e8, $af, $e0, $43, $c3, $da, $01        ;; 07:7987 ????????
    db   $cd, $6d, $7a, $06, $03, $c5, $cd, $a5        ;; 07:798f ????????
    db   $79, $06, $03, $d7, $05, $20, $fc, $c1        ;; 07:7997 ????????
    db   $05, $20, $f2, $c3, $93, $7a, $cd, $d7        ;; 07:799f ????????
    db   $01, $1e, $01, $3e, $ff, $e0, $d0, $1d        ;; 07:79a7 ????????
    db   $20, $1c, $1e, $04, $f0, $d0, $3c, $fe        ;; 07:79af ????????
    db   $07, $30, $37, $e0, $d0, $21, $ce, $7a        ;; 07:79b7 ????????
    db   $c7, $7e, $e0, $d1, $cd, $f7, $79, $21        ;; 07:79bf ????????
    db   $c7, $7a, $f0, $d0, $c7, $56, $f0, $44        ;; 07:79c7 ????????
    db   $fe, $00, $20, $fa, $f0, $44, $fe, $40        ;; 07:79cf ????????
    db   $38, $05, $cd, $71, $01, $18, $d0, $01        ;; 07:79d7 ????????
    db   $00, $d9, $6f, $26, $00, $09, $f0, $41        ;; 07:79df ????????
    db   $e6, $03, $20, $fa, $7e, $82, $e0, $42        ;; 07:79e7 ????????
    db   $18, $e2, $af, $e0, $42, $c3, $da, $01        ;; 07:79ef ????????
    db   $d5, $21, $00, $d9, $f0, $d1, $5f, $af        ;; 07:79f7 ????????
    db   $0e, $40, $43, $22, $0d, $28, $06, $05        ;; 07:79ff ????????
    db   $20, $f9, $3c, $18, $f5, $d1, $c9, $cd        ;; 07:7a07 ????????
    db   $d7, $01, $06, $03, $cd, $1c, $7a, $05        ;; 07:7a0f ????????
    db   $20, $fa, $c3, $da, $01, $c5, $cd, $4f        ;; 07:7a17 ????????
    db   $7a, $af, $e0, $d1, $01, $01, $0b, $cd        ;; 07:7a1f ????????
    db   $3a, $7a, $0d, $20, $fa, $0e, $01, $21        ;; 07:7a27 ????????
    db   $d1, $ff, $34, $05, $20, $f1, $af, $e0        ;; 07:7a2f ????????
    db   $43, $c1, $c9, $c5, $f0, $d1, $21, $00        ;; 07:7a37 ????????
    db   $d9, $c7, $7e, $e0, $d0, $cd, $b4, $7a        ;; 07:7a3f ????????
    db   $af, $e0, $d0, $cd, $b4, $7a, $c1, $c9        ;; 07:7a47 ????????
    db   $c5, $21, $60, $7b, $11, $00, $d9, $06        ;; 07:7a4f ????????
    db   $0b, $2a, $87, $12, $13, $05, $20, $f9        ;; 07:7a57 ????????
    db   $c1, $c9, $cd, $db, $77, $06, $3c, $d7        ;; 07:7a5f ????????
    db   $05, $20, $fc, $c3, $9c, $77, $21, $00        ;; 07:7a67 ????????
    db   $99, $11, $00, $9c, $01, $40, $01, $cd        ;; 07:7a6f ????????
    db   $be, $00, $d7, $21, $4a, $ff, $36, $40        ;; 07:7a77 ????????
    db   $23, $36, $07, $f0, $40, $f6, $60, $e0        ;; 07:7a7f ????????
    db   $40, $21, $00, $99, $01, $40, $01, $3e        ;; 07:7a87 ????????
    db   $7f, $c3, $ac, $00, $d7, $3e, $40, $e0        ;; 07:7a8f ????????
    db   $4a, $3e, $07, $e0, $4b, $af, $e0, $43        ;; 07:7a97 ????????
    db   $e0, $42, $21, $00, $9c, $11, $00, $99        ;; 07:7a9f ????????
    db   $01, $40, $01, $cd, $be, $00, $d7, $21        ;; 07:7aa7 ????????
    db   $40, $ff, $cb, $ae, $c9, $cd, $dd, $01        ;; 07:7aaf ????????
    db   $f0, $d0, $e0, $43, $f0, $44, $fe, $40        ;; 07:7ab7 ????????
    db   $20, $fa, $af, $e0, $43, $c3, $71, $01        ;; 07:7abf ????????
    db   $f8, $f4, $f0, $e0, $f0, $f4, $f8, $04        ;; 07:7ac7 ????????
    db   $03, $02, $01, $02, $03, $04, $db, $77        ;; 07:7acf ????????
    db   $43, $78, $6b, $78, $95, $78, $f9, $78        ;; 07:7ad7 ????????
    db   $69, $79, $8f, $79, $0e, $7a, $61, $7a        ;; 07:7adf ????????
    db   $08, $f8, $f8, $08, $08, $f8, $f8, $08        ;; 07:7ae7 ????????
    db   $10, $00, $21, $80, $45, $80, $50, $80        ;; 07:7aef ????????
    db   $6a, $00, $00, $00, $4a, $00, $22, $00        ;; 07:7af7 ????????
    db   $10, $28, $03, $20, $0c, $00, $00, $02        ;; 07:7aff ????????
    db   $41, $28, $00, $00, $46, $00, $80, $a0        ;; 07:7b07 ????????
    db   $04, $00, $00, $00, $01, $02, $00, $00        ;; 07:7b0f ????????
    db   $48, $00, $00, $82, $12, $00, $00, $00        ;; 07:7b17 ????????
    db   $01, $28, $80, $00, $18, $20, $00, $08        ;; 07:7b1f ????????
    db   $04, $a0, $09, $28, $90, $20, $00, $00        ;; 07:7b27 ????????
    db   $c0, $00, $04, $20, $08, $02, $0a, $20        ;; 07:7b2f ????????
    db   $10, $22, $21, $00, $00, $00, $61, $2a        ;; 07:7b37 ????????
    db   $00, $00, $80, $80, $20, $00, $32, $0a        ;; 07:7b3f ????????
    db   $48, $22, $5d, $00, $01, $02, $b4, $28        ;; 07:7b47 ????????
    db   $01, $02, $01, $08, $4a, $00, $04, $00        ;; 07:7b4f ????????
    db   $40, $00, $0c, $0a, $00, $00, $82, $02        ;; 07:7b57 ????????
    db   $00, $00, $fd, $fb, $fb, $fc, $fe, $01        ;; 07:7b5f ????????
    db   $03, $04, $04, $03, $00, $fd, $fb, $fb        ;; 07:7b67 ????????
    db   $fb, $fd, $00, $02, $04, $04, $03, $01        ;; 07:7b6f ????????
    db   $fe, $fc, $fb, $fb, $fd, $ff, $02, $04        ;; 07:7b77 ????????
    db   $04, $04, $02, $ff, $fc, $fb, $fb, $fc        ;; 07:7b7f ????????
    db   $fe, $01, $03, $04, $04, $02, $00, $fd        ;; 07:7b87 ????????
    db   $fb, $fb, $fc, $fe, $01, $03, $04, $04        ;; 07:7b8f ????????
    db   $03, $00, $fd, $fb, $fb, $fb, $fd, $00        ;; 07:7b97 ????????
    db   $02, $be, $7b, $c0, $7b, $c2, $7b, $c4        ;; 07:7b9f ????????
    db   $7b, $c6, $7b, $c8, $7b, $ca, $7b, $cc        ;; 07:7ba7 ????????
    db   $7b, $ce, $7b, $d1, $7b, $d6, $7b, $d8        ;; 07:7baf ????????
    db   $7b, $da, $7b, $dc, $7b, $de, $7b, $01        ;; 07:7bb7 ????????
    db   $00, $02, $00, $03, $00, $04, $00, $05        ;; 07:7bbf ????????
    db   $00, $06, $00, $07, $00, $08, $00, $03        ;; 07:7bc7 ????????
    db   $06, $00, $03, $03, $03, $03, $00, $01        ;; 07:7bcf ????????
    db   $00, $01, $00, $01, $00, $01, $00, $01        ;; 07:7bd7 ????????
    db   $00, $20, $0a, $80, $03, $00, $0b, $80        ;; 07:7bdf ????????
    db   $01, $20, $10, $02, $00, $80, $c6, $82        ;; 07:7be7 ????????
    db   $00, $00, $20, $00, $20, $28, $80, $a8        ;; 07:7bef ????????
    db   $a2, $08, $00, $08, $00, $02, $00, $44        ;; 07:7bf7 ????????
    db   $61, $ac, $7c, $dc, $7c, $0e, $7d, $18        ;; 07:7bff ????????
    db   $7d, $3c, $7d, $5c, $7d, $83, $7d, $17        ;; 07:7c07 ????????
    db   $7e, $48, $7e, $96, $7e, $fe, $7e, $0e        ;; 07:7c0f ????????
    db   $7f, $32, $7f, $46, $7f, $61, $7f, $00        ;; 07:7c17 ????????
    db   $18, $00, $10, $08, $08, $08, $10, $10        ;; 07:7c1f ????????
    db   $00, $10, $08, $18, $00, $00, $00, $00        ;; 07:7c27 ????????
    db   $08, $10, $10, $10, $18, $18, $18, $04        ;; 07:7c2f ????????
    db   $04, $14, $04, $1c, $04, $08, $14, $0c        ;; 07:7c37 ????????
    db   $04, $10, $14, $18, $04, $00, $14, $08        ;; 07:7c3f ????????
    db   $0c, $10, $0c, $18, $0c, $0c, $0c, $20        ;; 07:7c47 ????????
    db   $0c, $18, $08, $08, $00, $20, $08, $20        ;; 07:7c4f ????????
    db   $10, $18, $10, $08, $18, $00, $04, $08        ;; 07:7c57 ????????
    db   $04, $10, $04, $10, $1c, $18, $14, $18        ;; 07:7c5f ????????
    db   $1c, $04, $08, $02, $10, $16, $08, $14        ;; 07:7c67 ????????
    db   $10, $20, $4c, $20, $2c, $20, $34, $20        ;; 07:7c6f ????????
    db   $3c, $20, $44, $20, $54, $20, $5c, $20        ;; 07:7c77 ????????
    db   $64, $20, $6c, $28, $4c, $30, $4c, $32        ;; 07:7c7f ????????
    db   $3e, $32, $5a, $36, $46, $38, $4c, $36        ;; 07:7c87 ????????
    db   $52, $38, $48, $38, $50, $28, $44, $28        ;; 07:7c8f ????????
    db   $54, $30, $44, $30, $54, $38, $44, $38        ;; 07:7c97 ????????
    db   $54, $10, $fc, $18, $fc, $24, $04, $20        ;; 07:7c9f ????????
    db   $04, $20, $44, $20, $14, $14, $44, $01        ;; 07:7ca7 ????????
    db   $00, $0a, $44, $02, $01, $00, $00, $01        ;; 07:7caf ????????
    db   $46, $07, $01, $00, $00, $01, $02, $00        ;; 07:7cb7 ????????
    db   $03, $02, $04, $00, $05, $02, $06, $03        ;; 07:7cbf ????????
    db   $48, $01, $07, $4a, $4c, $07, $07, $41        ;; 07:7cc7 ????????
    db   $08, $40, $02, $42, $03, $40, $09, $42        ;; 07:7ccf ????????
    db   $0a, $40, $0b, $43, $00, $13, $44, $03        ;; 07:7cd7 ????????
    db   $10, $04, $0d, $05, $0e, $06, $48, $05        ;; 07:7cdf ????????
    db   $10, $05, $11, $04, $0d, $06, $23, $05        ;; 07:7ce7 ????????
    db   $46, $06, $46, $06, $11, $05, $10, $05        ;; 07:7cef ????????
    db   $16, $04, $23, $06, $0d, $06, $18, $05        ;; 07:7cf7 ????????
    db   $58, $06, $11, $05, $10, $05, $16, $05        ;; 07:7cff ????????
    db   $23, $06, $0d, $06, $18, $06, $00, $11        ;; 07:7d07 ????????
    db   $4c, $01, $17, $0a, $74, $01, $17, $09        ;; 07:7d0f ????????
    db   $00, $13, $44, $02, $16, $05, $18, $05        ;; 07:7d17 ????????
    db   $48, $03, $15, $05, $16, $05, $18, $05        ;; 07:7d1f ????????
    db   $46, $04, $14, $0b, $15, $05, $16, $05        ;; 07:7d27 ????????
    db   $18, $05, $4a, $04, $02, $21, $03, $61        ;; 07:7d2f ????????
    db   $05, $a1, $09, $e1, $00, $12, $4c, $02        ;; 07:7d37 ????????
    db   $03, $39, $05, $3a, $4c, $04, $02, $79        ;; 07:7d3f ????????
    db   $03, $39, $05, $3a, $09, $7a, $5e, $06        ;; 07:7d47 ????????
    db   $08, $3b, $01, $7b, $02, $3c, $03, $7c        ;; 07:7d4f ????????
    db   $05, $3a, $09, $7a, $00, $15, $03, $4c        ;; 07:7d57 ????????
    db   $02, $19, $50, $1b, $10, $48, $03, $05        ;; 07:7d5f ????????
    db   $50, $19, $10, $1b, $50, $46, $01, $1b        ;; 07:7d67 ????????
    db   $10, $48, $06, $02, $4e, $1e, $0e, $04        ;; 07:7d6f ????????
    db   $8f, $09, $cf, $19, $cf, $1b, $4e, $44        ;; 07:7d77 ????????
    db   $01, $1b, $cf, $00, $16, $44, $02, $1b        ;; 07:7d7f ????????
    db   $13, $1c, $14, $46, $04, $19, $54, $1d        ;; 07:7d87 ????????
    db   $53, $1b, $60, $1c, $5f, $48, $0e, $1a        ;; 07:7d8f ????????
    db   $13, $02, $14, $03, $15, $1e, $16, $04        ;; 07:7d97 ????????
    db   $17, $05, $18, $09, $19, $0a, $1a, $06        ;; 07:7d9f ????????
    db   $1b, $19, $1c, $1d, $1d, $0b, $1e, $1b        ;; 07:7da7 ????????
    db   $1f, $1c, $20, $48, $0e, $1a, $56, $02        ;; 07:7daf ????????
    db   $55, $03, $54, $1e, $53, $04, $5a, $05        ;; 07:7db7 ????????
    db   $59, $09, $58, $0a, $57, $06, $5e, $19        ;; 07:7dbf ????????
    db   $5d, $1d, $5c, $0b, $5b, $1b, $60, $1c        ;; 07:7dc7 ????????
    db   $5f, $48, $0e, $1a, $13, $02, $14, $03        ;; 07:7dcf ????????
    db   $15, $1e, $16, $04, $17, $05, $18, $09        ;; 07:7dd7 ????????
    db   $19, $0a, $1a, $06, $1b, $19, $1c, $1d        ;; 07:7ddf ????????
    db   $1d, $0b, $1e, $1b, $1f, $1c, $20, $48        ;; 07:7de7 ????????
    db   $0e, $1a, $56, $02, $55, $03, $54, $1e        ;; 07:7def ????????
    db   $53, $04, $5a, $05, $59, $09, $58, $0a        ;; 07:7df7 ????????
    db   $57, $06, $5e, $19, $5d, $1d, $5c, $0b        ;; 07:7dff ????????
    db   $5b, $1b, $60, $1c, $5f, $48, $04, $19        ;; 07:7e07 ????????
    db   $54, $1d, $53, $1b, $60, $1c, $5f, $00        ;; 07:7e0f ????????
    db   $32, $45, $03, $05, $12, $06, $12, $19        ;; 07:7e17 ????????
    db   $12, $45, $03, $09, $12, $0a, $12, $1d        ;; 07:7e1f ????????
    db   $12, $45, $04, $01, $12, $00, $12, $02        ;; 07:7e27 ????????
    db   $12, $03, $12, $11, $48, $04, $08, $2a        ;; 07:7e2f ????????
    db   $03, $0a, $04, $0a, $1d, $2a, $4c, $04        ;; 07:7e37 ????????
    db   $08, $0a, $03, $2a, $04, $2a, $1d, $0a        ;; 07:7e3f ????????
    db   $00, $12, $48, $04, $02, $21, $03, $61        ;; 07:7e47 ????????
    db   $05, $a1, $09, $e1, $4a, $10, $07, $2c        ;; 07:7e4f ????????
    db   $08, $2d, $01, $6d, $00, $6c, $1a, $2e        ;; 07:7e57 ????????
    db   $02, $2f, $03, $6f, $1e, $6e, $04, $ae        ;; 07:7e5f ????????
    db   $05, $af, $09, $ef, $0a, $ee, $06, $ac        ;; 07:7e67 ????????
    db   $19, $ad, $1d, $ed, $0b, $ec, $56, $0f        ;; 07:7e6f ????????
    db   $1f, $30, $13, $70, $20, $31, $14, $32        ;; 07:7e77 ????????
    db   $0f, $71, $41, $33, $21, $34, $15, $35        ;; 07:7e7f ????????
    db   $11, $74, $22, $73, $42, $36, $12, $37        ;; 07:7e87 ????????
    db   $16, $38, $23, $77, $24, $76, $00, $17        ;; 07:7e8f ????????
    db   $46, $02, $25, $0a, $26, $09, $46, $03        ;; 07:7e97 ????????
    db   $25, $0a, $26, $09, $00, $09, $46, $04        ;; 07:7e9f ????????
    db   $25, $09, $26, $09, $00, $09, $03, $0a        ;; 07:7ea7 ????????
    db   $46, $05, $25, $09, $26, $09, $00, $09        ;; 07:7eaf ????????
    db   $03, $09, $05, $0a, $46, $06, $25, $09        ;; 07:7eb7 ????????
    db   $26, $09, $00, $09, $03, $09, $05, $09        ;; 07:7ebf ????????
    db   $06, $0a, $46, $07, $25, $09, $26, $09        ;; 07:7ec7 ????????
    db   $00, $09, $03, $09, $05, $09, $06, $09        ;; 07:7ecf ????????
    db   $27, $0a, $46, $08, $25, $09, $26, $09        ;; 07:7ed7 ????????
    db   $00, $09, $03, $09, $05, $09, $06, $09        ;; 07:7edf ????????
    db   $27, $09, $28, $0a, $6e, $08, $25, $09        ;; 07:7ee7 ????????
    db   $26, $09, $00, $09, $03, $09, $05, $09        ;; 07:7eef ????????
    db   $06, $09, $27, $09, $28, $09, $00, $41        ;; 07:7ef7 ????????
    db   $8a, $01, $0c, $0a, $88, $04, $07, $07        ;; 07:7eff ????????
    db   $08, $08, $1a, $c8, $02, $c7, $00, $63        ;; 07:7f07 ????????
    db   $84, $01, $0c, $0b, $88, $04, $07, $21        ;; 07:7f0f ????????
    db   $08, $61, $1a, $a1, $02, $e1, $8a, $04        ;; 07:7f17 ????????
    db   $07, $22, $08, $23, $1a, $24, $02, $25        ;; 07:7f1f ????????
    db   $8a, $04, $07, $e5, $08, $e4, $1a, $e3        ;; 07:7f27 ????????
    db   $02, $e2, $00, $42, $88, $01, $0c, $2b        ;; 07:7f2f ????????
    db   $88, $01, $0c, $0a, $86, $04, $07, $26        ;; 07:7f37 ????????
    db   $08, $27, $1a, $28, $02, $29, $00, $12        ;; 07:7f3f ????????
    db   $c4, $01, $29, $0b, $ca, $09, $2a, $0c        ;; 07:7f47 ????????
    db   $2b, $0c, $2c, $0c, $2d, $0c, $29, $0d        ;; 07:7f4f ????????
    db   $2e, $0c, $2f, $0c, $30, $0c, $31, $0c        ;; 07:7f57 ????????
    db   $09, $00, $1a, $d0, $01, $32, $3d, $d0        ;; 07:7f5f ????????
    db   $02, $33, $3d, $34, $3d, $d0, $03, $35        ;; 07:7f67 ????????
    db   $3d, $36, $3d, $37, $3d, $d0, $02, $38        ;; 07:7f6f ????????
    db   $3d, $34, $3d, $d0, $02, $32, $3d, $37        ;; 07:7f77 ????????
    db   $3d, $d0, $03, $33, $3d, $34, $3d, $37        ;; 07:7f7f ????????
    db   $3d, $d0, $03, $35, $3d, $36, $3d, $37        ;; 07:7f87 ????????
    db   $3d, $d0, $02, $38, $3d, $34, $3d, $c5        ;; 07:7f8f ????????
    db   $02, $39, $21, $3a, $61, $c8, $09, $3b        ;; 07:7f97 ????????
    db   $3e, $32, $32, $3c, $7e, $3d, $3f, $33        ;; 07:7f9f ????????
    db   $35, $3e, $7f, $3f, $36, $37, $38, $40        ;; 07:7fa7 ????????
    db   $76, $01, $00, $00, $00, $00, $40, $40        ;; 07:7faf ????????
    db   $00, $00, $40, $e0, $00, $08, $00, $80        ;; 07:7fb7 ????????
    db   $00, $01, $00, $00, $00, $00, $04, $20        ;; 07:7fbf ????????
    db   $00, $00, $00, $01, $00, $81, $00, $00        ;; 07:7fc7 ????????
    db   $04, $02, $00, $00, $40, $20, $00, $00        ;; 07:7fcf ????????
    db   $00, $00, $00, $00, $00, $00, $00, $10        ;; 07:7fd7 ????????
    db   $00, $08, $10, $08, $00, $00, $10, $04        ;; 07:7fdf ????????
    db   $40, $00, $40, $44, $04, $18, $00, $01        ;; 07:7fe7 ????????
    db   $00, $08, $00, $01, $00, $00, $00, $00        ;; 07:7fef ????????
    db   $00, $00, $00, $00, $00, $40, $00, $40        ;; 07:7ff7 ????????
    db   $04                                           ;; 07:7fff ?
