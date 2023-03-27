;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "bank06", ROMX[$4000], BANK[$06]

call_06_4000:
    jp   jp_06_4006                                    ;; 06:4000 $c3 $06 $40
    db   $c3, $f2, $5b                                 ;; 06:4003 ???

jp_06_4006:
    call call_06_565e                                  ;; 06:4006 $cd $5e $56
    ld   [wD4AB], SP                                   ;; 06:4009 $08 $ab $d4
    call call_06_5d90                                  ;; 06:400c $cd $90 $5d
    call call_06_556a                                  ;; 06:400f $cd $6a $55
    call call_06_56ad                                  ;; 06:4012 $cd $ad $56
    call call_06_5513                                  ;; 06:4015 $cd $13 $55
    call call_06_5e00                                  ;; 06:4018 $cd $00 $5e
.jr_06_401b:
    call call_06_5513                                  ;; 06:401b $cd $13 $55
.jr_06_401e:
    call call_06_5240                                  ;; 06:401e $cd $40 $52
    call call_06_5bd4                                  ;; 06:4021 $cd $d4 $5b
    call call_06_5cf9                                  ;; 06:4024 $cd $f9 $5c
    call call_06_5a8a                                  ;; 06:4027 $cd $8a $5a
    call call_06_5acc                                  ;; 06:402a $cd $cc $5a
    jr   C, .jr_06_401e                                ;; 06:402d $38 $ef
    call call_06_582b                                  ;; 06:402f $cd $2b $58
    call call_06_59ac                                  ;; 06:4032 $cd $ac $59
    call call_06_409c                                  ;; 06:4035 $cd $9c $40
    jr   .jr_06_401b                                   ;; 06:4038 $18 $e1

data_06_403a:
    db   $b0, $44, $bc, $44, $e4, $44, $0c, $45        ;; 06:403a ????????
    db   $1b, $45, $3c, $45, $70, $45, $25, $47        ;; 06:4042 ????????
    db   $6b, $47, $7f, $47, $06, $48, $6a, $48        ;; 06:404a ????????
    db   $cd, $48, $09, $49, $66, $49, $af, $49        ;; 06:4052 ????????
    db   $d2, $49, $53, $4a, $a5, $4a, $b1, $4a        ;; 06:405a ????????
    db   $fc, $4a, $13, $4b, $1f, $4b, $43, $4b        ;; 06:4062 ????????
    db   $66, $4b, $7e, $4b, $e0, $4b, $41, $4c        ;; 06:406a ????????
    db   $7e, $4c, $b3, $4c, $21, $4d, $b9, $4d        ;; 06:4072 ????????
    db   $19, $4e, $5d, $4e, $69, $4e, $aa, $4e        ;; 06:407a ????????
    db   $ed, $4e, $55, $4f, $69, $4f, $8e, $4f        ;; 06:4082 ????????
    db   $e7, $4f, $01, $50, $17, $50, $2a, $50        ;; 06:408a ????????
    db   $3b, $50, $6a, $50, $77, $50, $98, $50        ;; 06:4092 ????????
    db   $b7, $50                                      ;; 06:409a ??

call_06_409c:
    ld   HL, wD3EF                                     ;; 06:409c $21 $ef $d3
    ld   C, $1f                                        ;; 06:409f $0e $1f
.jr_06_40a1:
    push BC                                            ;; 06:40a1 $c5
    push HL                                            ;; 06:40a2 $e5
    call call_06_4316                                  ;; 06:40a3 $cd $16 $43
    pop  HL                                            ;; 06:40a6 $e1
    pop  BC                                            ;; 06:40a7 $c1
    ld   DE, $04                                       ;; 06:40a8 $11 $04 $00
    add  HL, DE                                        ;; 06:40ab $19
    dec  C                                             ;; 06:40ac $0d
    jr   NZ, .jr_06_40a1                               ;; 06:40ad $20 $f2
    jp   jp_06_50f1                                    ;; 06:40af $c3 $f1 $50
    db   $3e, $0f, $cd, $71, $5a, $3e, $10, $c3        ;; 06:40b2 ????????
    db   $71, $5a, $3e, $0b, $c3, $71, $5a, $3e        ;; 06:40ba ????????
    db   $0c, $c3, $71, $5a, $f0, $b1, $2e, $0b        ;; 06:40c2 ????????
    db   $ff, $c9, $f0, $b0, $2e, $0a, $ff, $c9        ;; 06:40ca ????????
    db   $f5, $f0, $b0, $f5, $f0, $b1, $e0, $b0        ;; 06:40d2 ????????
    db   $f1, $e0, $b1, $f1, $c9, $d5, $1e, $04        ;; 06:40da ????????
    db   $18, $03, $d5, $1e, $05, $f0, $b2             ;; 06:40e2 ???????

jr_06_40e9:
    call call_06_5bf2                                  ;; 06:40e9 $cd $f2 $5b
    pop  DE                                            ;; 06:40ec $d1
    ret                                                ;; 06:40ed $c9

call_06_40ee:
    push DE                                            ;; 06:40ee $d5
    ld   E, $04                                        ;; 06:40ef $1e $04
    jr   jr_06_40e9                                    ;; 06:40f1 $18 $f6
    db   $d5, $1e, $05, $18, $f1                       ;; 06:40f3 ?????

call_06_40f8:
    ldh  A, [hFFB1]                                    ;; 06:40f8 $f0 $b1
    jr   jr_06_40fe                                    ;; 06:40fa $18 $02

call_06_40fc:
    ldh  A, [hFFB0]                                    ;; 06:40fc $f0 $b0

jr_06_40fe:
    ld   L, $02                                        ;; 06:40fe $2e $02
    rst  rst_00_0038                                   ;; 06:4100 $ff
    ret                                                ;; 06:4101 $c9

call_06_4102:
    ldh  A, [hFFBB]                                    ;; 06:4102 $f0 $bb
    cp   A, $00                                        ;; 06:4104 $fe $00
    ret                                                ;; 06:4106 $c9
    db   $e5, $d5, $f0, $b0, $6f, $26, $00, $cd        ;; 06:4107 ????????
    db   $07, $5c, $11, $0e, $d0, $19, $1e, $08        ;; 06:410f ????????
    db   $f0, $b2, $57, $2a, $ba, $28, $06, $1d        ;; 06:4117 ????????
    db   $20, $f9, $97, $18, $05, $3e, $07, $cd        ;; 06:411f ????????
    db   $62, $7f, $d1, $e1, $c9                       ;; 06:4127 ?????

call_06_412c:
    push AF                                            ;; 06:412c $f5
    ld   A, L                                          ;; 06:412d $7d
    ldh  [hFFB4], A                                    ;; 06:412e $e0 $b4
    ld   A, H                                          ;; 06:4130 $7c
    ldh  [hFFB5], A                                    ;; 06:4131 $e0 $b5
    pop  AF                                            ;; 06:4133 $f1
    ret                                                ;; 06:4134 $c9
    db   $f5, $f0, $b4, $5f, $f0, $b5, $57, $f1        ;; 06:4135 ????????
    db   $c9                                           ;; 06:413d ?

call_06_413e:
    ldh  [hFFB4], A                                    ;; 06:413e $e0 $b4
    sub  A, A                                          ;; 06:4140 $97
    ldh  [hFFB5], A                                    ;; 06:4141 $e0 $b5
    ret                                                ;; 06:4143 $c9
    db   $cd, $2c, $41, $cd, $31, $42                  ;; 06:4144 ??????

call_06_414a:
    push HL                                            ;; 06:414a $e5
    pop  DE                                            ;; 06:414b $d1
    jr   .jr_06_4151                                   ;; 06:414c $18 $03
    db   $cd, $35, $41                                 ;; 06:414e ???
.jr_06_4151:
    call call_06_7f72                                  ;; 06:4151 $cd $72 $7f
    ldh  A, [hFFB1]                                    ;; 06:4154 $f0 $b1
    jp   .jp_06_416b                                   ;; 06:4156 $c3 $6b $41
    db   $7d, $ea, $b3, $d4, $7c, $ea, $b4, $d4        ;; 06:4159 ????????
    db   $c9, $fa, $b3, $d4, $5f, $fa, $b4, $d4        ;; 06:4161 ????????
    db   $57, $c9                                      ;; 06:4169 ??
.jp_06_416b:
    ld   HL, wD4AE                                     ;; 06:416b $21 $ae $d4
    call call_06_7f6e                                  ;; 06:416e $cd $6e $7f
    cp   A, $04                                        ;; 06:4171 $fe $04
    jr   NC, .jr_06_4182                               ;; 06:4173 $30 $0d
    bit  7, D                                          ;; 06:4175 $cb $7a
    jr   Z, .jr_06_4182                                ;; 06:4177 $28 $09
    call call_06_42b9                                  ;; 06:4179 $cd $b9 $42
    call call_06_42a5                                  ;; 06:417c $cd $a5 $42
    call call_06_5e1e                                  ;; 06:417f $cd $1e $5e
.jr_06_4182:
    push DE                                            ;; 06:4182 $d5
    push BC                                            ;; 06:4183 $c5
    ld   L, $03                                        ;; 06:4184 $2e $03
    rst  rst_00_0038                                   ;; 06:4186 $ff
    call call_06_7f6a                                  ;; 06:4187 $cd $6a $7f
    ld   A, C                                          ;; 06:418a $79
    ld   [wD4B0], A                                    ;; 06:418b $ea $b0 $d4
    ld   A, B                                          ;; 06:418e $78
    ld   [wD4B1], A                                    ;; 06:418f $ea $b1 $d4
    push HL                                            ;; 06:4192 $e5
    push BC                                            ;; 06:4193 $c5
    pop  HL                                            ;; 06:4194 $e1
    add  HL, DE                                        ;; 06:4195 $19
    push HL                                            ;; 06:4196 $e5
    pop  BC                                            ;; 06:4197 $c1
    pop  HL                                            ;; 06:4198 $e1
    bit  7, B                                          ;; 06:4199 $cb $78
    jr   Z, .jr_06_41a2                                ;; 06:419b $28 $05
    ld   BC, $00                                       ;; 06:419d $01 $00 $00
    jr   .jr_06_41c4                                   ;; 06:41a0 $18 $22
.jr_06_41a2:
    push HL                                            ;; 06:41a2 $e5
    inc  HL                                            ;; 06:41a3 $23
    inc  HL                                            ;; 06:41a4 $23
    call call_06_7f6c                                  ;; 06:41a5 $cd $6c $7f
    call call_06_5df3                                  ;; 06:41a8 $cd $f3 $5d
    jr   C, .jr_06_41c3                                ;; 06:41ab $38 $16
    push DE                                            ;; 06:41ad $d5
    push DE                                            ;; 06:41ae $d5
    ld   HL, wD4B0                                     ;; 06:41af $21 $b0 $d4
    call call_06_7f6c                                  ;; 06:41b2 $cd $6c $7f
    call call_06_7f72                                  ;; 06:41b5 $cd $72 $7f
    pop  HL                                            ;; 06:41b8 $e1
    add  HL, DE                                        ;; 06:41b9 $19
    push HL                                            ;; 06:41ba $e5
    pop  DE                                            ;; 06:41bb $d1
    ld   HL, wD4AE                                     ;; 06:41bc $21 $ae $d4
    call call_06_7f6e                                  ;; 06:41bf $cd $6e $7f
    pop  BC                                            ;; 06:41c2 $c1
.jr_06_41c3:
    pop  HL                                            ;; 06:41c3 $e1
.jr_06_41c4:
    ld   [HL], C                                       ;; 06:41c4 $71
    inc  HL                                            ;; 06:41c5 $23
    ld   [HL], B                                       ;; 06:41c6 $70
    dec  HL                                            ;; 06:41c7 $2b
    pop  BC                                            ;; 06:41c8 $c1
    pop  DE                                            ;; 06:41c9 $d1
    ret                                                ;; 06:41ca $c9
    db   $fa, $ae, $d4, $e0, $b4, $fa, $af, $d4        ;; 06:41cb ????????
    db   $e0, $b5, $c9                                 ;; 06:41d3 ???

call_06_41d6:
    push HL                                            ;; 06:41d6 $e5
    inc  HL                                            ;; 06:41d7 $23
    ld   A, [HL-]                                      ;; 06:41d8 $3a
    bit  7, A                                          ;; 06:41d9 $cb $7f
    jr   NZ, .jr_06_41e4                               ;; 06:41db $20 $07
    or   A, [HL]                                       ;; 06:41dd $b6
    jr   Z, .jr_06_41e4                                ;; 06:41de $28 $04
    and  A, A                                          ;; 06:41e0 $a7
    pop  HL                                            ;; 06:41e1 $e1
    jr   call_06_4219                                  ;; 06:41e2 $18 $35
.jr_06_41e4:
    sub  A, A                                          ;; 06:41e4 $97
    ld   [HL+], A                                      ;; 06:41e5 $22
    ld   [HL-], A                                      ;; 06:41e6 $32
    dec  HL                                            ;; 06:41e7 $2b
    set  0, [HL]                                       ;; 06:41e8 $cb $c6
    ld   DE, wD080                                     ;; 06:41ea $11 $80 $d0
    call call_00_0168                                  ;; 06:41ed $cd $68 $01
    jr   C, .jr_06_41f9                                ;; 06:41f0 $38 $07
    ld   A, [wD4B6]                                    ;; 06:41f2 $fa $b6 $d4
    bit  0, A                                          ;; 06:41f5 $cb $47
    jr   Z, .jr_06_4210                                ;; 06:41f7 $28 $17
.jr_06_41f9:
    dec  HL                                            ;; 06:41f9 $2b
    dec  HL                                            ;; 06:41fa $2b
    ld   A, H                                          ;; 06:41fb $7c
    and  A, $0f                                        ;; 06:41fc $e6 $0f
    ld   H, A                                          ;; 06:41fe $67
    call call_06_5c0d                                  ;; 06:41ff $cd $0d $5c
    ldh  A, [hFFB0]                                    ;; 06:4202 $f0 $b0
    push AF                                            ;; 06:4204 $f5
    ld   A, L                                          ;; 06:4205 $7d
    ldh  [hFFB0], A                                    ;; 06:4206 $e0 $b0
    ld   A, $11                                        ;; 06:4208 $3e $11
    call call_06_5a71                                  ;; 06:420a $cd $71 $5a
    pop  AF                                            ;; 06:420d $f1
    ldh  [hFFB0], A                                    ;; 06:420e $e0 $b0
.jr_06_4210:
    ld   A, [wD4AA]                                    ;; 06:4210 $fa $aa $d4
    inc  A                                             ;; 06:4213 $3c
    ld   [wD4AA], A                                    ;; 06:4214 $ea $aa $d4
    scf                                                ;; 06:4217 $37
    pop  HL                                            ;; 06:4218 $e1

call_06_4219:
    call call_06_5bdb                                  ;; 06:4219 $cd $db $5b
    jp   call_06_5be8                                  ;; 06:421c $c3 $e8 $5b
    db   $f5, $cd, $02, $41, $20, $0a, $3e, $09        ;; 06:421f ????????
    db   $cd, $71, $5a, $3e, $0a, $cd, $71, $5a        ;; 06:4227 ????????
    db   $f1, $c9, $f5, $d5, $f0, $b4, $5f, $f0        ;; 06:422f ????????
    db   $b5, $b3, $fe, $00, $20, $07, $3e, $0c        ;; 06:4237 ????????
    db   $cd, $71, $5a, $18, $08, $3e, $17, $cd        ;; 06:423f ????????
    db   $71, $5a, $cd, $55, $42, $cd, $02, $41        ;; 06:4247 ????????
    db   $20, $01, $f7, $d1, $f1, $c9                  ;; 06:424f ??????

call_06_4255:
    ld   A, $0d                                        ;; 06:4255 $3e $0d
    jp   call_06_5a71                                  ;; 06:4257 $c3 $71 $5a

call_06_425a:
    ld   A, $01                                        ;; 06:425a $3e $01
    jp   call_06_5a71                                  ;; 06:425c $c3 $71 $5a
    db   $f5, $cd, $02, $41, $20, $0a, $3e, $09        ;; 06:425f ????????
    db   $cd, $71, $5a, $3e, $18, $cd, $71, $5a        ;; 06:4267 ????????
    db   $f1, $c9, $3e, $1d, $cd, $71, $5a, $f7        ;; 06:426f ????????
    db   $c9, $3e, $0f, $cd, $71, $5a, $3e, $33        ;; 06:4277 ????????
    db   $cd, $71, $5a, $3e, $22, $c3, $71, $5a        ;; 06:427f ????????
    db   $cd, $02, $41, $c0, $cd, $a5, $42, $cd        ;; 06:4287 ????????
    db   $5a, $42, $3e, $19, $c3, $71, $5a             ;; 06:428f ???????

data_06_4296:
    db   $f5, $cd, $02, $41, $cc, $b9, $42, $cc        ;; 06:4296 ????????
    db   $d5, $42, $cd, $a5, $42, $f1, $c9             ;; 06:429e ???????

call_06_42a5:
    push HL                                            ;; 06:42a5 $e5
    ld   HL, hFFBB                                     ;; 06:42a6 $21 $bb $ff
    inc  [HL]                                          ;; 06:42a9 $34
    pop  HL                                            ;; 06:42aa $e1
    ret                                                ;; 06:42ab $c9

call_06_42ac:
    sub  A, A                                          ;; 06:42ac $97
    ld   [wD4AA], A                                    ;; 06:42ad $ea $aa $d4
    ldh  [hFFBB], A                                    ;; 06:42b0 $e0 $bb
    ld   [wD4B6], A                                    ;; 06:42b2 $ea $b6 $d4
    ld   [wD4BE], A                                    ;; 06:42b5 $ea $be $d4
    ret                                                ;; 06:42b8 $c9

call_06_42b9:
    push AF                                            ;; 06:42b9 $f5
    push BC                                            ;; 06:42ba $c5
    push DE                                            ;; 06:42bb $d5
    push HL                                            ;; 06:42bc $e5
    ldh  A, [hFFB2]                                    ;; 06:42bd $f0 $b2
    ld   E, $07                                        ;; 06:42bf $1e $07
    call call_06_5bf2                                  ;; 06:42c1 $cd $f2 $5b
    and  A, $7f                                        ;; 06:42c4 $e6 $7f
    bit  6, A                                          ;; 06:42c6 $cb $77
    jr   NZ, .jr_06_42ce                               ;; 06:42c8 $20 $04
    ldh  [hFFE4], A                                    ;; 06:42ca $e0 $e4
    jr   .jr_06_42d2                                   ;; 06:42cc $18 $04
.jr_06_42ce:
    and  A, $3f                                        ;; 06:42ce $e6 $3f
    ldh  [hFFE2], A                                    ;; 06:42d0 $e0 $e2
.jr_06_42d2:
    jp   jp_06_7f7c                                    ;; 06:42d2 $c3 $7c $7f
    db   $f5, $c5, $d5, $e5, $f0, $b2, $1e, $06        ;; 06:42d5 ????????
    db   $cd, $f2, $5b, $cd, $06, $5e, $c3, $7c        ;; 06:42dd ????????
    db   $7f                                           ;; 06:42e5 ?

call_06_42e6:
    push AF                                            ;; 06:42e6 $f5
    push BC                                            ;; 06:42e7 $c5
    push DE                                            ;; 06:42e8 $d5
    push HL                                            ;; 06:42e9 $e5
    ldh  A, [hFFB1]                                    ;; 06:42ea $f0 $b1
    ld   HL, wD3F2                                     ;; 06:42ec $21 $f2 $d3
    ld   C, $1f                                        ;; 06:42ef $0e $1f
    ld   DE, $04                                       ;; 06:42f1 $11 $04 $00
.jr_06_42f4:
    cp   A, [HL]                                       ;; 06:42f4 $be
    jr   Z, .jr_06_42ff                                ;; 06:42f5 $28 $08
    add  HL, DE                                        ;; 06:42f7 $19
    dec  C                                             ;; 06:42f8 $0d
    jr   NZ, .jr_06_42f4                               ;; 06:42f9 $20 $f9
    ld   A, $ff                                        ;; 06:42fb $3e $ff
    jr   .jr_06_4311                                   ;; 06:42fd $18 $12
.jr_06_42ff:
    dec  HL                                            ;; 06:42ff $2b
    dec  HL                                            ;; 06:4300 $2b
    dec  HL                                            ;; 06:4301 $2b
    ld   B, [HL]                                       ;; 06:4302 $46
    ld   C, A                                          ;; 06:4303 $4f
    ldh  A, [hFFB1]                                    ;; 06:4304 $f0 $b1
    cp   A, $04                                        ;; 06:4306 $fe $04
    jr   NC, .jr_06_4310                               ;; 06:4308 $30 $06
    ld   A, B                                          ;; 06:430a $78
    add  A, $0e                                        ;; 06:430b $c6 $0e
    ld   L, A                                          ;; 06:430d $6f
    ld   A, C                                          ;; 06:430e $79
    rst  rst_00_0038                                   ;; 06:430f $ff
.jr_06_4310:
    ld   A, [HL]                                       ;; 06:4310 $7e
.jr_06_4311:
    ldh  [hFFB3], A                                    ;; 06:4311 $e0 $b3
    jp   jp_06_7f7c                                    ;; 06:4313 $c3 $7c $7f

call_06_4316:
    ld   A, L                                          ;; 06:4316 $7d
    ldh  [hFFBE], A                                    ;; 06:4317 $e0 $be
    ld   A, H                                          ;; 06:4319 $7c
    ldh  [hFFBF], A                                    ;; 06:431a $e0 $bf
    inc  HL                                            ;; 06:431c $23
    inc  HL                                            ;; 06:431d $23
    inc  HL                                            ;; 06:431e $23
    ld   A, [HL-]                                      ;; 06:431f $3a
    ldh  [hFFB0], A                                    ;; 06:4320 $e0 $b0
    ld   [wD4B9], A                                    ;; 06:4322 $ea $b9 $d4
    push AF                                            ;; 06:4325 $f5
    push HL                                            ;; 06:4326 $e5
    call call_06_5c63                                  ;; 06:4327 $cd $63 $5c
    jr   Z, .jr_06_435c                                ;; 06:432a $28 $30
    bit  0, A                                          ;; 06:432c $cb $47
    jr   NZ, .jr_06_435c                               ;; 06:432e $20 $2c
    bit  1, A                                          ;; 06:4330 $cb $4f
    jr   NZ, .jr_06_435c                               ;; 06:4332 $20 $28
    bit  7, A                                          ;; 06:4334 $cb $7f
    jp   NZ, jp_06_44e4                                ;; 06:4336 $c2 $e4 $44
    bit  6, A                                          ;; 06:4339 $cb $77
    jp   NZ, jp_06_44bc                                ;; 06:433b $c2 $bc $44
    bit  5, A                                          ;; 06:433e $cb $6f
    jr   Z, .jr_06_435f                                ;; 06:4340 $28 $1d
    call call_06_5ce2                                  ;; 06:4342 $cd $e2 $5c
    cp   A, $0a                                        ;; 06:4345 $fe $0a
    jr   C, .jr_06_4352                                ;; 06:4347 $38 $09
    ld   A, $47                                        ;; 06:4349 $3e $47
    call call_06_5a71                                  ;; 06:434b $cd $71 $5a
    ldh  A, [hFFB0]                                    ;; 06:434e $f0 $b0
    jr   .jr_06_435f                                   ;; 06:4350 $18 $0d
.jr_06_4352:
    ld   A, $4a                                        ;; 06:4352 $3e $4a
    call call_06_5a71                                  ;; 06:4354 $cd $71 $5a
    call call_06_40fc                                  ;; 06:4357 $cd $fc $40
    res  5, [HL]                                       ;; 06:435a $cb $ae
.jr_06_435c:
    pop  HL                                            ;; 06:435c $e1
    pop  AF                                            ;; 06:435d $f1
    ret                                                ;; 06:435e $c9
.jr_06_435f:
    pop  HL                                            ;; 06:435f $e1
    dec  HL                                            ;; 06:4360 $2b
    dec  HL                                            ;; 06:4361 $2b
    pop  AF                                            ;; 06:4362 $f1
    cp   A, $04                                        ;; 06:4363 $fe $04
    jr   NC, .jr_06_43a2                               ;; 06:4365 $30 $3b
    ld   E, A                                          ;; 06:4367 $5f
    ld   A, [HL]                                       ;; 06:4368 $7e
    cp   A, $ff                                        ;; 06:4369 $fe $ff
    jp   Z, jp_06_44b0                                 ;; 06:436b $ca $b0 $44
    cp   A, $fd                                        ;; 06:436e $fe $fd
    jr   NC, .jr_06_43a8                               ;; 06:4370 $30 $36
    push HL                                            ;; 06:4372 $e5
    push AF                                            ;; 06:4373 $f5
    push DE                                            ;; 06:4374 $d5
    call call_06_5b8f                                  ;; 06:4375 $cd $8f $5b
    pop  DE                                            ;; 06:4378 $d1
    jr   NC, .jr_06_437e                               ;; 06:4379 $30 $03
    pop  AF                                            ;; 06:437b $f1
    pop  HL                                            ;; 06:437c $e1
    ret                                                ;; 06:437d $c9
.jr_06_437e:
    ld   A, E                                          ;; 06:437e $7b
    call call_06_5c63                                  ;; 06:437f $cd $63 $5c
    pop  AF                                            ;; 06:4382 $f1
    add  A, $0e                                        ;; 06:4383 $c6 $0e
    call call_06_7f62                                  ;; 06:4385 $cd $62 $7f
    ldh  [hFFB2], A                                    ;; 06:4388 $e0 $b2
    push HL                                            ;; 06:438a $e5
    pop  BC                                            ;; 06:438b $c1
    ld   DE, $08                                       ;; 06:438c $11 $08 $00
    add  HL, DE                                        ;; 06:438f $19
    ld   A, [HL]                                       ;; 06:4390 $7e
    cp   A, $fe                                        ;; 06:4391 $fe $fe
    jr   Z, .jr_06_439f                                ;; 06:4393 $28 $0a
    dec  [HL]                                          ;; 06:4395 $35
    jr   NZ, .jr_06_439f                               ;; 06:4396 $20 $07
    ld   A, [BC]                                       ;; 06:4398 $0a
    bit  7, A                                          ;; 06:4399 $cb $7f
    jr   NZ, .jr_06_439f                               ;; 06:439b $20 $02
    ld   [HL], $ff                                     ;; 06:439d $36 $ff
.jr_06_439f:
    pop  HL                                            ;; 06:439f $e1
    jr   .jr_06_43aa                                   ;; 06:43a0 $18 $08
.jr_06_43a2:
    ldh  A, [hFFBC]                                    ;; 06:43a2 $f0 $bc
    cp   A, $02                                        ;; 06:43a4 $fe $02
    ret  Z                                             ;; 06:43a6 $c8
    ld   A, [HL]                                       ;; 06:43a7 $7e
.jr_06_43a8:
    ldh  [hFFB2], A                                    ;; 06:43a8 $e0 $b2
.jr_06_43aa:
    ldh  A, [hFFBE]                                    ;; 06:43aa $f0 $be
    ld   L, A                                          ;; 06:43ac $6f
    ldh  A, [hFFBF]                                    ;; 06:43ad $f0 $bf
    ld   H, A                                          ;; 06:43af $67
    inc  HL                                            ;; 06:43b0 $23
    inc  HL                                            ;; 06:43b1 $23
    ld   A, [HL-]                                      ;; 06:43b2 $3a
    bit  1, A                                          ;; 06:43b3 $cb $4f
    jp   NZ, jp_06_446b                                ;; 06:43b5 $c2 $6b $44
    bit  2, A                                          ;; 06:43b8 $cb $57
    jp   NZ, jp_06_446b                                ;; 06:43ba $c2 $6b $44
    bit  5, A                                          ;; 06:43bd $cb $6f
    jr   NZ, jr_06_4439                                ;; 06:43bf $20 $78
    bit  6, A                                          ;; 06:43c1 $cb $77
    jr   NZ, jr_06_43ef                                ;; 06:43c3 $20 $2a
    sub  A, A                                          ;; 06:43c5 $97
    ldh  [hFFBB], A                                    ;; 06:43c6 $e0 $bb
    inc  A                                             ;; 06:43c8 $3c
    ld   [wD4B6], A                                    ;; 06:43c9 $ea $b6 $d4
    ld   A, [HL]                                       ;; 06:43cc $7e
    ldh  [hFFB1], A                                    ;; 06:43cd $e0 $b1
    ld   E, A                                          ;; 06:43cf $5f
    call call_06_40f8                                  ;; 06:43d0 $cd $f8 $40
    and  A, $03                                        ;; 06:43d3 $e6 $03
    ret  NZ                                            ;; 06:43d5 $c0
    ld   A, E                                          ;; 06:43d6 $7b
    call call_06_448f                                  ;; 06:43d7 $cd $8f $44
    jp   call_06_5240                                  ;; 06:43da $c3 $40 $52

call_06_43dd:
    cp   A, $27                                        ;; 06:43dd $fe $27
    jr   Z, .jr_06_43e6                                ;; 06:43df $28 $05
    cp   A, $23                                        ;; 06:43e1 $fe $23
    jr   Z, .jr_06_43e6                                ;; 06:43e3 $28 $01
    ret                                                ;; 06:43e5 $c9
.jr_06_43e6:
    pop  HL                                            ;; 06:43e6 $e1
    pop  HL                                            ;; 06:43e7 $e1
    pop  HL                                            ;; 06:43e8 $e1
    call call_06_449c                                  ;; 06:43e9 $cd $9c $44
    jp   call_06_5240                                  ;; 06:43ec $c3 $40 $52

jr_06_43ef:
    call call_06_42ac                                  ;; 06:43ef $cd $ac $42
    ld   A, [HL]                                       ;; 06:43f2 $7e
    ld   L, $1f                                        ;; 06:43f3 $2e $1f
    rst  rst_00_0038                                   ;; 06:43f5 $ff
    ld   D, A                                          ;; 06:43f6 $57
    ld   A, $04                                        ;; 06:43f7 $3e $04
.jr_06_43f9:
    ldh  [hFFB1], A                                    ;; 06:43f9 $e0 $b1
    ld   E, A                                          ;; 06:43fb $5f
    push AF                                            ;; 06:43fc $f5
    call call_06_40f8                                  ;; 06:43fd $cd $f8 $40
    and  A, $03                                        ;; 06:4400 $e6 $03
    jr   NZ, .jr_06_4417                               ;; 06:4402 $20 $13
    ld   A, E                                          ;; 06:4404 $7b
    ld   L, $1f                                        ;; 06:4405 $2e $1f
    rst  rst_00_0038                                   ;; 06:4407 $ff
    cp   A, D                                          ;; 06:4408 $ba
    jr   NZ, .jr_06_4417                               ;; 06:4409 $20 $0c
    ld   A, E                                          ;; 06:440b $7b
    push DE                                            ;; 06:440c $d5
    call call_06_448f                                  ;; 06:440d $cd $8f $44
    call call_06_42a5                                  ;; 06:4410 $cd $a5 $42
    call call_06_5240                                  ;; 06:4413 $cd $40 $52
    pop  DE                                            ;; 06:4416 $d1
.jr_06_4417:
    pop  AF                                            ;; 06:4417 $f1
    inc  A                                             ;; 06:4418 $3c
    cp   A, $1f                                        ;; 06:4419 $fe $1f
    jr   NZ, .jr_06_43f9                               ;; 06:441b $20 $dc
    call call_06_4423                                  ;; 06:441d $cd $23 $44
    jp   call_06_42ac                                  ;; 06:4420 $c3 $ac $42

call_06_4423:
    ld   A, [wD4B6]                                    ;; 06:4423 $fa $b6 $d4
    bit  0, A                                          ;; 06:4426 $cb $47
    ret  NZ                                            ;; 06:4428 $c0
    ld   A, [wD4AA]                                    ;; 06:4429 $fa $aa $d4
    cp   A, $00                                        ;; 06:442c $fe $00
    jr   Z, .jr_06_4438                                ;; 06:442e $28 $08
    call call_06_413e                                  ;; 06:4430 $cd $3e $41
    ld   A, $20                                        ;; 06:4433 $3e $20
    call call_06_5a71                                  ;; 06:4435 $cd $71 $5a
.jr_06_4438:
    ret                                                ;; 06:4438 $c9

jr_06_4439:
    call call_06_42ac                                  ;; 06:4439 $cd $ac $42
    ld   A, $04                                        ;; 06:443c $3e $04
.jr_06_443e:
    ldh  [hFFB1], A                                    ;; 06:443e $e0 $b1
    ld   E, A                                          ;; 06:4440 $5f
    push AF                                            ;; 06:4441 $f5
    call call_06_40f8                                  ;; 06:4442 $cd $f8 $40
    and  A, $03                                        ;; 06:4445 $e6 $03
    jr   NZ, .jr_06_4450                               ;; 06:4447 $20 $07
    ld   A, E                                          ;; 06:4449 $7b
    call call_06_448f                                  ;; 06:444a $cd $8f $44
    call call_06_42a5                                  ;; 06:444d $cd $a5 $42
.jr_06_4450:
    pop  AF                                            ;; 06:4450 $f1
    inc  A                                             ;; 06:4451 $3c
    cp   A, $1f                                        ;; 06:4452 $fe $1f
    jr   NZ, .jr_06_443e                               ;; 06:4454 $20 $e8
    call call_06_4423                                  ;; 06:4456 $cd $23 $44
    ld   A, [wD4BE]                                    ;; 06:4459 $fa $be $d4
    cp   A, $00                                        ;; 06:445c $fe $00
    jr   Z, .jr_06_4465                                ;; 06:445e $28 $05
    ld   A, $3f                                        ;; 06:4460 $3e $3f
    call call_06_5a71                                  ;; 06:4462 $cd $71 $5a
.jr_06_4465:
    call call_06_42ac                                  ;; 06:4465 $cd $ac $42
    jp   call_06_5240                                  ;; 06:4468 $c3 $40 $52

jp_06_446b:
    call call_06_42ac                                  ;; 06:446b $cd $ac $42
    ld   A, $00                                        ;; 06:446e $3e $00
.jr_06_4470:
    ldh  [hFFB1], A                                    ;; 06:4470 $e0 $b1
    ld   E, A                                          ;; 06:4472 $5f
    push AF                                            ;; 06:4473 $f5
    call call_06_40f8                                  ;; 06:4474 $cd $f8 $40
    and  A, $03                                        ;; 06:4477 $e6 $03
    jr   NZ, .jr_06_4485                               ;; 06:4479 $20 $0a
    ld   A, E                                          ;; 06:447b $7b
    call call_06_448f                                  ;; 06:447c $cd $8f $44
    call call_06_42a5                                  ;; 06:447f $cd $a5 $42
    call call_06_5240                                  ;; 06:4482 $cd $40 $52
.jr_06_4485:
    pop  AF                                            ;; 06:4485 $f1
    inc  A                                             ;; 06:4486 $3c
    cp   A, $04                                        ;; 06:4487 $fe $04
    jr   NZ, .jr_06_4470                               ;; 06:4489 $20 $e5
    sub  A, A                                          ;; 06:448b $97
    ldh  [hFFBB], A                                    ;; 06:448c $e0 $bb
    ret                                                ;; 06:448e $c9

call_06_448f:
    call call_06_42e6                                  ;; 06:448f $cd $e6 $42
    ldh  A, [hFFB2]                                    ;; 06:4492 $f0 $b2
    ld   E, $02                                        ;; 06:4494 $1e $02
    call call_06_5bf2                                  ;; 06:4496 $cd $f2 $5b
    call call_06_43dd                                  ;; 06:4499 $cd $dd $43

call_06_449c:
    add  A, A                                          ;; 06:449c $87
    ld   E, A                                          ;; 06:449d $5f
    ld   D, $00                                        ;; 06:449e $16 $00
    ld   HL, data_06_403a                              ;; 06:44a0 $21 $3a $40
    add  HL, DE                                        ;; 06:44a3 $19
    ld   E, [HL]                                       ;; 06:44a4 $5e
    inc  HL                                            ;; 06:44a5 $23
    ld   D, [HL]                                       ;; 06:44a6 $56
    push DE                                            ;; 06:44a7 $d5
    pop  HL                                            ;; 06:44a8 $e1
    ldh  A, [hFFB2]                                    ;; 06:44a9 $f0 $b2
    cp   A, $ff                                        ;; 06:44ab $fe $ff
    jr   Z, jp_06_44b0                                 ;; 06:44ad $28 $01
    jp   HL                                            ;; 06:44af $e9

jp_06_44b0:
    call call_06_4102                                  ;; 06:44b0 $cd $02 $41
    ret  NZ                                            ;; 06:44b3 $c0
    call call_06_42a5                                  ;; 06:44b4 $cd $a5 $42
    ld   A, $14                                        ;; 06:44b7 $3e $14
    jp   call_06_5a71                                  ;; 06:44b9 $c3 $71 $5a

jp_06_44bc:
    pop  HL                                            ;; 06:44bc $e1
    pop  AF                                            ;; 06:44bd $f1
    ld   D, A                                          ;; 06:44be $57
    ldh  [hFFB0], A                                    ;; 06:44bf $e0 $b0
    ld   A, $01                                        ;; 06:44c1 $3e $01
    call call_06_5a71                                  ;; 06:44c3 $cd $71 $5a
    ld   A, $fe                                        ;; 06:44c6 $3e $fe
    call call_06_40ee                                  ;; 06:44c8 $cd $ee $40
    ld   C, A                                          ;; 06:44cb $4f
    call call_06_5ce2                                  ;; 06:44cc $cd $e2 $5c
    cp   A, C                                          ;; 06:44cf $b9
    jr   C, .jr_06_44d7                                ;; 06:44d0 $38 $05
    ld   A, $03                                        ;; 06:44d2 $3e $03
    jp   call_06_5a71                                  ;; 06:44d4 $c3 $71 $5a
.jr_06_44d7:
    ld   A, $4c                                        ;; 06:44d7 $3e $4c
    call call_06_5a71                                  ;; 06:44d9 $cd $71 $5a
    ld   A, D                                          ;; 06:44dc $7a
    ld   L, $02                                        ;; 06:44dd $2e $02
    rst  rst_00_0038                                   ;; 06:44df $ff
    and  A, $bf                                        ;; 06:44e0 $e6 $bf
    ld   [HL], A                                       ;; 06:44e2 $77
    ret                                                ;; 06:44e3 $c9

jp_06_44e4:
    pop  HL                                            ;; 06:44e4 $e1
    pop  AF                                            ;; 06:44e5 $f1
    ld   D, A                                          ;; 06:44e6 $57
    ldh  [hFFB0], A                                    ;; 06:44e7 $e0 $b0
    ld   A, $01                                        ;; 06:44e9 $3e $01
    call call_06_5a71                                  ;; 06:44eb $cd $71 $5a
    ld   A, $fd                                        ;; 06:44ee $3e $fd
    call call_06_40ee                                  ;; 06:44f0 $cd $ee $40
    ld   C, A                                          ;; 06:44f3 $4f
    call call_06_5ce2                                  ;; 06:44f4 $cd $e2 $5c
    cp   A, C                                          ;; 06:44f7 $b9
    jr   C, .jr_06_44ff                                ;; 06:44f8 $38 $05
    ld   A, $05                                        ;; 06:44fa $3e $05
    jp   call_06_5a71                                  ;; 06:44fc $c3 $71 $5a
.jr_06_44ff:
    ld   A, $4d                                        ;; 06:44ff $3e $4d
    call call_06_5a71                                  ;; 06:4501 $cd $71 $5a
    ld   A, D                                          ;; 06:4504 $7a
    ld   L, $02                                        ;; 06:4505 $2e $02
    rst  rst_00_0038                                   ;; 06:4507 $ff
    and  A, $7f                                        ;; 06:4508 $e6 $7f
    ld   [HL], A                                       ;; 06:450a $77
    ret                                                ;; 06:450b $c9
    db   $cd, $02, $41, $c0, $3e, $01, $cd, $71        ;; 06:450c ????????
    db   $5a, $f7, $3e, $06, $c3, $71, $5a, $f5        ;; 06:4514 ????????
    db   $cd, $02, $41, $20, $10, $3e, $01, $cd        ;; 06:451c ????????
    db   $71, $5a, $3e, $06, $cd, $71, $5a, $3e        ;; 06:4524 ????????
    db   $07, $cd, $71, $5a, $f7, $f1, $cd, $ee        ;; 06:452c ????????
    db   $40, $4f, $cd, $c6, $40, $b1, $77, $c9        ;; 06:4534 ????????
    db   $cd, $02, $41, $c0, $3e, $01, $cd, $71        ;; 06:453c ????????
    db   $5a, $3e, $08, $c3, $71, $5a, $2e, $09        ;; 06:4544 ????????
    db   $ff, $11, $f9, $ff, $19, $cb, $5e, $20        ;; 06:454c ????????
    db   $02, $cb, $3f, $c9, $f0, $b3, $fe, $ff        ;; 06:4554 ????????
    db   $28, $09, $1e, $01, $cd, $f2, $5b, $cb        ;; 06:455c ????????
    db   $47, $37, $c9, $a7, $c9, $f0, $b3, $1e        ;; 06:4564 ????????
    db   $05, $c3, $f2, $5b, $cd, $1f, $42, $f0        ;; 06:456c ????????
    db   $b1, $cd, $4a, $45, $e0, $b6, $f0, $b0        ;; 06:4574 ????????
    db   $cd, $4a, $45, $e0, $b7, $4f, $cd, $58        ;; 06:457c ????????
    db   $45, $30, $08, $28, $06, $47, $f0, $b6        ;; 06:4584 ????????
    db   $80, $e0, $b6, $f0, $b6, $91, $30, $02        ;; 06:458c ????????
    db   $3e, $00, $e0, $b8, $4f, $cd, $e2, $5c        ;; 06:4594 ????????
    db   $b9, $da, $bc, $40, $cd, $58, $48, $79        ;; 06:459c ????????
    db   $e0, $b6, $cd, $29, $4a, $79, $e0, $b7        ;; 06:45a4 ????????
    db   $cb, $3f, $cb, $3f, $6f, $cd, $df, $40        ;; 06:45ac ????????
    db   $67, $cd, $5f, $01, $5d, $cb, $3b, $f0        ;; 06:45b4 ????????
    db   $b7, $cd, $62, $7f, $cd, $f5, $5c, $cd        ;; 06:45bc ????????
    db   $62, $7f, $f0, $b6, $cd, $64, $7f, $cd        ;; 06:45c4 ????????
    db   $58, $45, $30, $03, $c4, $1d, $5c, $e5        ;; 06:45cc ????????
    db   $cd, $c6, $40, $e1, $cb, $77, $c4, $1d        ;; 06:45d4 ????????
    db   $5c, $cb, $7c, $20, $04, $7c, $b5, $20        ;; 06:45dc ????????
    db   $0d, $3e, $0c, $cd, $71, $5a, $f0, $b3        ;; 06:45e4 ????????
    db   $fe, $ff, $c8, $c3, $36, $46, $cd, $5d        ;; 06:45ec ????????
    db   $50, $cd, $31, $42, $cd, $d6, $41, $d8        ;; 06:45f4 ????????
    db   $cd, $58, $45, $d0, $cb, $4f, $20, $0a        ;; 06:45fc ????????
    db   $cb, $57, $20, $69, $cb, $67, $c2, $d5        ;; 06:4604 ????????
    db   $46, $c9, $f0, $b4, $87, $5f, $f0, $b5        ;; 06:460c ????????
    db   $17, $57, $d5, $cd, $72, $7f, $cd, $b2        ;; 06:4614 ????????
    db   $40, $e1, $cd, $2c, $41, $cd, $5a, $42        ;; 06:461c ????????
    db   $3e, $15, $cd, $71, $5a, $cd, $d2, $40        ;; 06:4624 ????????
    db   $f7, $cd, $4e, $41, $cd, $d6, $41, $c3        ;; 06:462c ????????
    db   $d2, $40, $cd, $58, $45, $d0, $cb, $4f        ;; 06:4634 ????????
    db   $c8, $f0, $b1, $cd, $63, $5c, $4f, $11        ;; 06:463c ????????
    db   $07, $00, $19, $7e, $cb, $51, $28, $02        ;; 06:4644 ????????
    db   $cb, $3f, $5f, $16, $00, $cd, $3e, $41        ;; 06:464c ????????
    db   $cd, $72, $7f, $f0, $b0, $cd, $6b, $41        ;; 06:4654 ????????
    db   $cd, $b2, $40, $cd, $5a, $42, $3e, $15        ;; 06:465c ????????
    db   $cd, $71, $5a, $cd, $d2, $40, $f7, $cd        ;; 06:4664 ????????
    db   $d2, $40, $c3, $d6, $41, $cd, $69, $45        ;; 06:466c ????????
    db   $4f, $f0, $b0, $2e, $0b, $ff, $a1, $c2        ;; 06:4674 ????????
    db   $82, $42, $f0, $b0, $2e, $0c, $ff, $a1        ;; 06:467c ????????
    db   $20, $05, $21, $00, $00, $18, $17, $cd        ;; 06:4684 ????????
    db   $cc, $40, $5e, $16, $00, $21, $32, $00        ;; 06:468c ????????
    db   $19, $e5, $d1, $f0, $b1, $2e, $0a, $ff        ;; 06:4694 ????????
    db   $2f, $6f, $26, $ff, $23, $19, $cd, $e2        ;; 06:469c ????????
    db   $5c, $16, $00, $5f, $cd, $70, $7f, $28        ;; 06:46a4 ????????
    db   $1a, $30, $18, $cd, $fc, $40, $5f, $f0        ;; 06:46ac ????????
    db   $b3, $cd, $ee, $40, $b3, $77, $cd, $c8        ;; 06:46b4 ????????
    db   $46, $cd, $8e, $5c, $cd, $d2, $40, $f7        ;; 06:46bc ????????
    db   $cd, $d2, $40, $c9, $f5, $3e, $12, $cd        ;; 06:46c4 ????????
    db   $71, $5a, $3e, $13, $cd, $71, $5a, $f1        ;; 06:46cc ????????
    db   $c9, $f0, $b3, $57, $cd, $f3, $40, $4f        ;; 06:46d4 ????????
    db   $f0, $b0, $2e, $0b, $ff, $a1, $c2, $82        ;; 06:46dc ????????
    db   $42, $f0, $b3, $cd, $ee, $40, $57, $f0        ;; 06:46e4 ????????
    db   $b0, $2e, $0c, $ff, $a1, $20, $06, $5a        ;; 06:46ec ????????
    db   $cd, $f5, $5c, $18, $01, $7a, $5f, $16        ;; 06:46f4 ????????
    db   $00, $cd, $72, $7f, $cd, $3e, $41, $f0        ;; 06:46fc ????????
    db   $b0, $cd, $6b, $41, $cd, $c8, $46, $3e        ;; 06:4704 ????????
    db   $15, $cd, $71, $5a, $cd, $d6, $41, $cd        ;; 06:470c ????????
    db   $d2, $40, $f7, $c3, $d2, $40, $cd, $e4        ;; 06:4714 ????????
    db   $40, $4f, $f0, $b1, $2e, $0c, $ff, $a1        ;; 06:471c ????????
    db   $c9, $cd, $1f, $42, $cd, $1a, $47, $ca        ;; 06:4724 ????????
    db   $73, $45, $cd, $e2, $5c, $fe, $1f, $30        ;; 06:472c ????????
    db   $14, $cd, $f8, $40, $cb, $c6, $3e, $16        ;; 06:4734 ????????
    db   $cd, $71, $5a, $3e, $0f, $cd, $71, $5a        ;; 06:473c ????????
    db   $3e, $34, $c3, $71, $5a, $cd, $29, $4a        ;; 06:4744 ????????
    db   $41, $cb, $38, $cb, $38, $cd, $df, $40        ;; 06:474c ????????
    db   $67, $68, $cd, $5f, $01, $06, $00, $5d        ;; 06:4754 ????????
    db   $cb, $3b, $09, $cd, $f5, $5c, $cd, $62        ;; 06:475c ????????
    db   $7f, $cd, $44, $41, $c3, $d6, $41, $cd        ;; 06:4764 ????????
    db   $1f, $42, $f5, $f0, $b1, $2e, $01, $ff        ;; 06:476c ????????
    db   $4f, $f1, $cd, $f3, $40, $a1, $ca, $73        ;; 06:4774 ????????
    db   $45, $18, $af, $cd, $1f, $42, $cd, $e4        ;; 06:477c ????????
    db   $40, $4f, $f0, $b1, $2e, $01, $ff, $a1        ;; 06:4784 ????????
    db   $c2, $82, $42, $cd, $49, $48, $cd, $cc        ;; 06:478c ????????
    db   $40, $4f, $41, $cb, $38, $cb, $38, $cd        ;; 06:4794 ????????
    db   $df, $40, $6f, $60, $cd, $5f, $01, $e5        ;; 06:479c ????????
    db   $79, $cd, $62, $7f, $d1, $cd, $f5, $5c        ;; 06:47a4 ????????
    db   $cb, $3f, $5f, $16, $00, $19, $e5, $d1        ;; 06:47ac ????????
    db   $21, $b4, $ff, $cd, $6e, $7f, $3e, $1c        ;; 06:47b4 ????????
    db   $cd, $71, $5a, $f7, $f0, $b0, $cd, $6b        ;; 06:47bc ????????
    db   $41, $cd, $51, $41, $cd, $d6, $41, $d0        ;; 06:47c4 ????????
    db   $c3, $fc, $45, $cd, $8e, $42, $f0, $b1        ;; 06:47cc ????????
    db   $2e, $0a, $ff, $4e, $cd, $cc, $40, $46        ;; 06:47d4 ????????
    db   $68, $cb, $3d, $cb, $3d, $cd, $df, $40        ;; 06:47dc ????????
    db   $67, $cd, $5f, $01, $5d, $cb, $3b, $cd        ;; 06:47e4 ????????
    db   $fd, $47, $cd, $62, $7f, $cd, $2c, $41        ;; 06:47ec ????????
    db   $e5, $d1, $c9, $cd, $f5, $5c, $c3, $62        ;; 06:47f4 ????????
    db   $7f, $cd, $f7, $47, $78, $cd, $62, $7f        ;; 06:47fc ????????
    db   $79, $c9, $cd, $cf, $47, $f0, $b1, $cd        ;; 06:4804 ????????
    db   $6b, $41, $cd, $cb, $41, $c3, $71, $42        ;; 06:480c ????????
    db   $f0, $b1, $2e, $09, $ff, $47, $cd, $7e        ;; 06:4814 ????????
    db   $7f, $cb, $5e, $28, $02, $cb, $38, $f0        ;; 06:481c ????????
    db   $b0, $2e, $09, $ff, $4f, $3e, $07, $cd        ;; 06:4824 ????????
    db   $64, $7f, $cb, $5e, $28, $02, $cb, $39        ;; 06:482c ????????
    db   $c9, $cd, $14, $48, $cd, $58, $45, $30        ;; 06:4834 ????????
    db   $07, $28, $05, $cd, $69, $45, $80, $47        ;; 06:483c ????????
    db   $78, $91, $d0, $97, $c9, $cd, $35, $48        ;; 06:4844 ????????
    db   $4f, $cd, $e2, $5c, $b9, $30, $04, $cd        ;; 06:484c ????????
    db   $bc, $40, $e1, $c9, $f0, $b1, $2e, $08        ;; 06:4854 ????????
    db   $ff, $4f, $3e, $06, $cd, $64, $7f, $cb        ;; 06:485c ????????
    db   $56, $28, $02, $cb, $39, $c9, $cd, $1f        ;; 06:4864 ????????
    db   $42, $cd, $49, $48, $cd, $58, $48, $f0        ;; 06:486c ????????
    db   $b0, $2e, $09, $ff, $47, $3e, $07, $cd        ;; 06:4874 ????????
    db   $64, $7f, $cb, $5e, $28, $02, $cb, $38        ;; 06:487c ????????
    db   $68, $cb, $3d, $cb, $3d, $cd, $df, $40        ;; 06:4884 ????????
    db   $67, $cd, $5f, $01, $5d, $cb, $3b, $cd        ;; 06:488c ????????
    db   $fd, $47, $cd, $64, $7f, $cd, $58, $45        ;; 06:4894 ????????
    db   $30, $0d, $c4, $1d, $5c, $e5, $cd, $c6        ;; 06:489c ????????
    db   $40, $e1, $cb, $77, $c4, $1d, $5c, $cd        ;; 06:48a4 ????????
    db   $2c, $41, $cd, $74, $7f, $30, $06, $cd        ;; 06:48ac ????????
    db   $c1, $40, $c3, $36, $46, $cd, $4e, $41        ;; 06:48b4 ????????
    db   $cd, $31, $42, $cd, $d6, $41, $c3, $fc        ;; 06:48bc ????????
    db   $45, $cd, $58, $45, $d0, $c4, $1d, $5c        ;; 06:48c4 ????????
    db   $c9, $cd, $1f, $42, $cd, $49, $48, $cd        ;; 06:48cc ????????
    db   $58, $48, $cd, $cc, $40, $46, $cd, $df        ;; 06:48d4 ????????
    db   $40, $68, $cb, $3d, $cb, $3d, $67, $cd        ;; 06:48dc ????????
    db   $5f, $01, $5d, $cb, $3b, $cd, $fd, $47        ;; 06:48e4 ????????
    db   $cd, $2c, $41, $cd, $64, $7f, $cd, $c5        ;; 06:48ec ????????
    db   $48, $cd, $74, $7f, $30, $06, $cd, $c1        ;; 06:48f4 ????????
    db   $40, $c3, $36, $46, $cd, $44, $41, $cd        ;; 06:48fc ????????
    db   $d6, $41, $c3, $fc, $45, $f5, $cd, $1f        ;; 06:4904 ????????
    db   $42, $cd, $ee, $40, $4f, $f1, $cd, $f3        ;; 06:490c ????????
    db   $40, $5f, $cd, $f5, $5c, $47, $f0, $b0        ;; 06:4914 ????????
    db   $2e, $07, $ff, $6f, $26, $00, $78, $cd        ;; 06:491c ????????
    db   $62, $7f, $79, $cd, $62, $7f, $cd, $2c        ;; 06:4924 ????????
    db   $41, $cd, $44, $41, $3e, $1e, $cd, $71        ;; 06:492c ????????
    db   $5a, $c3, $d6, $41, $79, $cd, $64, $7f        ;; 06:4934 ????????
    db   $cd, $c5, $48, $e5, $cd, $c6, $40, $e1        ;; 06:493c ????????
    db   $cb, $77, $c4, $1d, $5c, $cd, $74, $7f        ;; 06:4944 ????????
    db   $30, $05, $cd, $c1, $40, $e1, $c9, $c3        ;; 06:494c ????????
    db   $2c, $41, $cd, $c5, $48, $e5, $cd, $c6        ;; 06:4954 ????????
    db   $40, $e1, $cb, $77, $c4, $1d, $5c, $c3        ;; 06:495c ????????
    db   $2c, $41, $4f, $cd, $02, $41, $20, $37        ;; 06:4964 ????????
    db   $79, $f5, $f5, $cd, $1f, $42, $cd, $58        ;; 06:496c ????????
    db   $48, $f0, $b1, $2e, $07, $ff, $6f, $3e        ;; 06:4974 ????????
    db   $05, $cd, $64, $7f, $cb, $56, $28, $02        ;; 06:497c ????????
    db   $cb, $3d, $26, $00, $f1, $cd, $ee, $40        ;; 06:4984 ????????
    db   $cd, $62, $7f, $f1, $cd, $ee, $40, $5f        ;; 06:498c ????????
    db   $cd, $f7, $47, $cd, $2c, $41, $cd, $38        ;; 06:4994 ????????
    db   $49, $cd, $31, $42, $cd, $59, $41, $cd        ;; 06:499c ????????
    db   $62, $41, $7b, $b5, $c8, $cd, $4e, $41        ;; 06:49a4 ????????
    db   $c3, $d6, $41, $cd, $df, $40, $4f, $cd        ;; 06:49ac ????????
    db   $e4, $40, $5f, $cd, $f5, $5c, $81, $4f        ;; 06:49b4 ????????
    db   $cd, $1f, $42, $c5, $cd, $29, $4a, $59        ;; 06:49bc ????????
    db   $c1, $6b, $26, $00, $79, $cd, $62, $7f        ;; 06:49c4 ????????
    db   $cd, $44, $41, $c3, $d6, $41, $cd, $1f        ;; 06:49cc ????????
    db   $42, $f0, $b0, $2e, $07, $ff, $47, $cd        ;; 06:49d4 ????????
    db   $e4, $40, $90, $30, $01, $97, $4f, $cd        ;; 06:49dc ????????
    db   $e2, $5c, $b9, $da, $bc, $40, $cd, $58        ;; 06:49e4 ????????
    db   $48, $cd, $df, $40, $cd, $f8, $40, $cb        ;; 06:49ec ????????
    db   $76, $28, $02, $cb, $38, $cd, $58, $45        ;; 06:49f4 ????????
    db   $30, $04, $28, $02, $cb, $38, $78, $91        ;; 06:49fc ????????
    db   $30, $0c, $cd, $f8, $40, $cb, $c6, $3e        ;; 06:4a04 ????????
    db   $3d, $cd, $71, $5a, $f7, $c9, $cd, $c1        ;; 06:4a0c ????????
    db   $40, $cd, $58, $45, $d0, $cb, $4f, $c2        ;; 06:4a14 ????????
    db   $36, $46, $cb, $57, $c2, $71, $46, $cb        ;; 06:4a1c ????????
    db   $67, $c2, $d5, $46, $c9, $f0, $b0, $2e        ;; 06:4a24 ????????
    db   $07, $ff, $4f, $3e, $05, $cd, $64, $7f        ;; 06:4a2c ????????
    db   $cb, $56, $28, $02, $cb, $39, $c9, $cd        ;; 06:4a34 ????????
    db   $df, $40, $6f, $26, $00, $cb, $3f, $5f        ;; 06:4a3c ????????
    db   $cd, $f7, $47, $c3, $2c, $41, $cd, $3b        ;; 06:4a44 ????????
    db   $4a, $cd, $38, $49, $c3, $44, $41, $cd        ;; 06:4a4c ????????
    db   $1f, $42, $cd, $29, $4a, $cd, $e4, $40        ;; 06:4a54 ????????
    db   $47, $3e, $05, $cd, $62, $7f, $57, $78        ;; 06:4a5c ????????
    db   $92, $cb, $7f, $28, $01, $97, $47, $cd        ;; 06:4a64 ????????
    db   $e2, $5c, $b8, $da, $bc, $40, $cd, $58        ;; 06:4a6c ????????
    db   $48, $cd, $4a, $4a, $c3, $d6, $41, $f5        ;; 06:4a74 ????????
    db   $cd, $1f, $42, $f0, $b0, $2e, $09, $ff        ;; 06:4a7c ????????
    db   $4f, $3e, $07, $cd, $64, $7f, $cb, $5e        ;; 06:4a84 ????????
    db   $28, $02, $cb, $39, $f1, $cd, $f3, $40        ;; 06:4a8c ????????
    db   $91, $30, $01, $97, $4f, $cd, $e2, $5c        ;; 06:4a94 ????????
    db   $b9, $d2, $a4, $4a, $e1, $c3, $bc, $40        ;; 06:4a9c ????????
    db   $c9, $cd, $7b, $4a, $cd, $58, $48, $cd        ;; 06:4aa4 ????????
    db   $4a, $4a, $c3, $d6, $41, $f5, $cd, $1f        ;; 06:4aac ????????
    db   $42, $cd, $14, $48, $f1, $cd, $f3, $40        ;; 06:4ab4 ????????
    db   $81, $90, $4f, $cd, $e2, $5c, $b9, $d2        ;; 06:4abc ????????
    db   $bc, $40, $f0, $b1, $47, $21, $f2, $d3        ;; 06:4ac4 ????????
    db   $0e, $1f, $11, $04, $00, $7e, $bb, $28        ;; 06:4acc ????????
    db   $04, $19, $0d, $18, $f8, $2b, $2b, $2b        ;; 06:4ad4 ????????
    db   $36, $ff, $3e, $1f, $cd, $71, $5a, $cd        ;; 06:4adc ????????
    db   $58, $48, $cd, $4a, $4a, $c3, $d6, $41        ;; 06:4ae4 ????????
    db   $cd, $df, $40, $6f, $26, $00, $cd, $e4        ;; 06:4aec ????????
    db   $40, $5f, $cd, $f7, $47, $c3, $2c, $41        ;; 06:4af4 ????????
    db   $cd, $02, $41, $20, $10, $cd, $1f, $42        ;; 06:4afc ????????
    db   $f7, $cd, $58, $48, $cd, $ec, $4a, $cd        ;; 06:4b04 ????????
    db   $38, $49, $cd, $59, $41, $18, $24, $cd        ;; 06:4b0c ????????
    db   $7b, $4a, $cd, $3b, $4a, $cd, $44, $41        ;; 06:4b14 ????????
    db   $c3, $d6, $41, $cd, $02, $41, $20, $16        ;; 06:4b1c ????????
    db   $cd, $5f, $42, $f7, $cd, $ec, $4a, $29        ;; 06:4b24 ????????
    db   $cd, $2c, $41, $cd, $59, $41, $3e, $21        ;; 06:4b2c ????????
    db   $cd, $71, $5a, $cd, $55, $42, $cd, $62        ;; 06:4b34 ????????
    db   $41, $cd, $51, $41, $c3, $d6, $41, $cd        ;; 06:4b3c ????????
    db   $02, $41, $20, $04, $cd, $5f, $42, $f7        ;; 06:4b44 ????????
    db   $cd, $df, $40, $4f, $f0, $b1, $2e, $1f        ;; 06:4b4c ????????
    db   $ff, $b9, $38, $03, $c3, $82, $42, $cd        ;; 06:4b54 ????????
    db   $f8, $40, $cb, $c6, $3e, $01, $ea, $be        ;; 06:4b5c ????????
    db   $d4, $c9, $cd, $8e, $42, $cd, $3b, $4a        ;; 06:4b64 ????????
    db   $e5, $d1, $7b, $b2, $ca, $82, $42, $f0        ;; 06:4b6c ????????
    db   $b1, $cd, $6b, $41, $cd, $cb, $41, $c3        ;; 06:4b74 ????????
    db   $71, $42, $cd, $8e, $42, $cd, $df, $40        ;; 06:4b7c ????????
    db   $4f, $f0, $b1, $cd, $f8, $40, $5f, $a1        ;; 06:4b84 ????????
    db   $77, $f7, $c3, $6f, $5c, $cd, $02, $41        ;; 06:4b8c ????????
    db   $20, $26, $cd, $1f, $42, $cd, $58, $45        ;; 06:4b94 ????????
    db   $30, $1a, $cb, $5f, $28, $16, $f0, $b0        ;; 06:4b9c ????????
    db   $ea, $b7, $d4, $3e, $01, $ea, $b5, $d4        ;; 06:4ba4 ????????
    db   $3e, $0f, $cd, $71, $5a, $3e, $3c, $cd        ;; 06:4bac ????????
    db   $71, $5a, $18, $04, $97, $ea, $b5, $d4        ;; 06:4bb4 ????????
    db   $fa, $b5, $d4, $fe, $00, $28, $0c, $f0        ;; 06:4bbc ????????
    db   $b1, $e0, $b0, $fa, $b7, $d4, $e0, $b1        ;; 06:4bc4 ????????
    db   $cd, $e6, $42, $cd, $e4, $40, $4f, $cd        ;; 06:4bcc ????????
    db   $c6, $40, $a1, $c8, $e1, $cd, $02, $41        ;; 06:4bd4 ????????
    db   $c0, $c3, $78, $42, $cd, $91, $4b, $f0        ;; 06:4bdc ????????
    db   $b1, $2e, $0c, $ff, $a1, $28, $04, $06        ;; 06:4be4 ????????
    db   $00, $18, $06, $f0, $b1, $2e, $0a, $ff        ;; 06:4bec ????????
    db   $46, $cd, $cc, $40, $4f, $cb, $3f, $cb        ;; 06:4bf4 ????????
    db   $3f, $6f, $cd, $df, $40, $67, $cd, $5f        ;; 06:4bfc ????????
    db   $01, $5d, $79, $cd, $62, $7f, $cb, $3b        ;; 06:4c04 ????????
    db   $cd, $f7, $47, $e5, $78, $cd, $64, $7f        ;; 06:4c0c ????????
    db   $f7, $e5, $c1, $cb, $78, $20, $04, $78        ;; 06:4c14 ????????
    db   $b1, $20, $04, $e1, $c3, $c1, $40, $cd        ;; 06:4c1c ????????
    db   $a5, $42, $e1, $e5, $cd, $2c, $41, $d1        ;; 06:4c24 ????????
    db   $cd, $72, $7f, $f0, $b1, $18, $02, $e5        ;; 06:4c2c ????????
    db   $d1, $cd, $6b, $41, $cd, $31, $42, $cd        ;; 06:4c34 ????????
    db   $a5, $42, $c3, $d6, $41, $cd, $91, $4b        ;; 06:4c3c ????????
    db   $f0, $b1, $2e, $0c, $ff, $a1, $28, $05        ;; 06:4c44 ????????
    db   $11, $00, $00, $18, $10, $f0, $b1, $2e        ;; 06:4c4c ????????
    db   $0a, $ff, $c6, $14, $5f, $16, $00, $cd        ;; 06:4c54 ????????
    db   $cc, $40, $cd, $66, $7f, $cb, $7a, $20        ;; 06:4c5c ????????
    db   $0b, $7b, $b2, $28, $07, $cd, $e2, $5c        ;; 06:4c64 ????????
    db   $bb, $da, $82, $42, $cd, $df, $40, $4f        ;; 06:4c6c ????????
    db   $cd, $f8, $40, $5f, $b1, $77, $f7, $c3        ;; 06:4c74 ????????
    db   $6f, $5c, $cd, $02, $41, $20, $03, $cd        ;; 06:4c7c ????????
    db   $1f, $42, $f7, $cd, $e4, $40, $4f, $f0        ;; 06:4c84 ????????
    db   $b1, $2e, $01, $ff, $a1, $20, $05, $3e        ;; 06:4c8c ????????
    db   $23, $c3, $71, $5a, $cd, $cc, $40, $4f        ;; 06:4c94 ????????
    db   $69, $cb, $3d, $cb, $3d, $cd, $df, $40        ;; 06:4c9c ????????
    db   $67, $cd, $5f, $01, $79, $cd, $62, $7f        ;; 06:4ca4 ????????
    db   $59, $cd, $f7, $47, $c3, $27, $4c, $cd        ;; 06:4cac ????????
    db   $1f, $42, $cd, $14, $48, $cd, $07, $41        ;; 06:4cb4 ????????
    db   $cb, $7f, $28, $01, $97, $e0, $b9, $80        ;; 06:4cbc ????????
    db   $47, $cd, $58, $45, $30, $07, $28, $05        ;; 06:4cc4 ????????
    db   $cd, $69, $45, $80, $47, $78, $91, $38        ;; 06:4ccc ????????
    db   $04, $d6, $63, $30, $01, $97, $4f, $cd        ;; 06:4cd4 ????????
    db   $e2, $5c, $b9, $da, $bc, $40, $cd, $58        ;; 06:4cdc ????????
    db   $48, $41, $cd, $23, $48, $cd, $ec, $4a        ;; 06:4ce4 ????????
    db   $79, $cd, $62, $7f, $3e, $63, $cd, $62        ;; 06:4cec ????????
    db   $7f, $f0, $b9, $cd, $64, $7f, $f0, $b9        ;; 06:4cf4 ????????
    db   $fe, $00, $20, $06, $d5, $e5, $d1, $29        ;; 06:4cfc ????????
    db   $19, $d1, $78, $cd, $64, $7f, $cd, $56        ;; 06:4d04 ????????
    db   $49, $cb, $7c, $c2, $82, $42, $7c, $b5        ;; 06:4d0c ????????
    db   $ca, $82, $42, $cd, $44, $41, $cd, $d6        ;; 06:4d14 ????????
    db   $41, $d8, $c3, $fc, $45, $cd, $1f, $42        ;; 06:4d1c ????????
    db   $cd, $35, $48, $4f, $1e, $00, $cd, $e4        ;; 06:4d24 ????????
    db   $40, $57, $cd, $e2, $5c, $b9, $38, $01        ;; 06:4d2c ????????
    db   $1c, $15, $20, $f6, $7b, $fe, $00, $ca        ;; 06:4d34 ????????
    db   $bc, $40, $e0, $b6, $cd, $3e, $41, $3e        ;; 06:4d3c ????????
    db   $24, $cd, $71, $5a, $cd, $58, $48, $79        ;; 06:4d44 ????????
    db   $e0, $b8, $cd, $29, $4a, $78, $e0, $b7        ;; 06:4d4c ????????
    db   $69, $cb, $3d, $cb, $3d, $cd, $df, $40        ;; 06:4d54 ????????
    db   $67, $cd, $5f, $01, $e5, $d1, $01, $00        ;; 06:4d5c ????????
    db   $00, $f0, $b7, $6f, $26, $00, $19, $d5        ;; 06:4d64 ????????
    db   $cb, $3b, $cd, $f5, $5c, $16, $00, $19        ;; 06:4d6c ????????
    db   $d1, $f0, $b8, $cd, $64, $7f, $cb, $7c        ;; 06:4d74 ????????
    db   $20, $07, $d5, $cd, $74, $7f, $d1, $30        ;; 06:4d7c ????????
    db   $03, $21, $00, $00, $09, $e5, $c1, $f0        ;; 06:4d84 ????????
    db   $b6, $3d, $e0, $b6, $20, $d3, $c5, $e1        ;; 06:4d8c ????????
    db   $cd, $56, $49, $cd, $74, $7f, $30, $06        ;; 06:4d94 ????????
    db   $cd, $c1, $40, $c3, $36, $46, $cd, $44        ;; 06:4d9c ????????
    db   $41, $cd, $d6, $41, $d8, $c3, $fc, $45        ;; 06:4da4 ????????
    db   $cd, $e4, $40, $4f, $cd, $c6, $40, $a1        ;; 06:4dac ????????
    db   $c8, $e1, $c3, $82, $42, $cd, $1f, $42        ;; 06:4db4 ????????
    db   $cd, $ac, $4d, $cd, $14, $48, $cd, $58        ;; 06:4dbc ????????
    db   $45, $30, $07, $28, $05, $cd, $69, $45        ;; 06:4dc4 ????????
    db   $81, $4f, $78, $91, $30, $01, $97, $4f        ;; 06:4dcc ????????
    db   $cd, $e2, $5c, $b9, $da, $bc, $40, $f0        ;; 06:4dd4 ????????
    db   $b1, $2e, $0a, $ff, $4f, $cd, $cc, $40        ;; 06:4ddc ????????
    db   $c6, $32, $91, $30, $01, $97, $4f, $f0        ;; 06:4de4 ????????
    db   $b1, $2e, $0c, $ff, $47, $cd, $e4, $40        ;; 06:4dec ????????
    db   $a0, $28, $02, $cb, $21, $1e, $46, $cd        ;; 06:4df4 ????????
    db   $24, $5e, $b9, $30, $0d, $cd, $f8, $40        ;; 06:4dfc ????????
    db   $5f, $cd, $df, $40, $b3, $77, $f7, $c3        ;; 06:4e04 ????????
    db   $6f, $5c, $3e, $22, $cd, $71, $5a, $c3        ;; 06:4e0c ????????
    db   $15, $4a, $07, $09, $0a, $cd, $1f, $42        ;; 06:4e14 ????????
    db   $cd, $e4, $40, $4f, $cd, $df, $40, $21        ;; 06:4e1c ????????
    db   $16, $4e, $cd, $62, $7f, $e0, $b7, $6f        ;; 06:4e24 ????????
    db   $f0, $b1, $ff, $91, $30, $01, $97, $4f        ;; 06:4e2c ????????
    db   $cd, $e2, $5c, $b9, $da, $bc, $40, $f0        ;; 06:4e34 ????????
    db   $b7, $6f, $f0, $b1, $ff, $5f, $cb, $3b        ;; 06:4e3c ????????
    db   $cb, $3b, $cb, $3b, $93, $77, $7b, $cd        ;; 06:4e44 ????????
    db   $3e, $41, $cd, $df, $40, $c6, $25, $cd        ;; 06:4e4c ????????
    db   $71, $5a, $3e, $29, $cd, $71, $5a, $f7        ;; 06:4e54 ????????
    db   $c9, $cd, $02, $41, $c0, $cd, $5a, $42        ;; 06:4e5c ????????
    db   $3e, $19, $c3, $71, $5a, $cd, $02, $41        ;; 06:4e64 ????????
    db   $20, $04, $cd, $5f, $42, $f7, $cd, $ac        ;; 06:4e6c ????????
    db   $4d, $cd, $1a, $47, $20, $03, $97, $18        ;; 06:4e74 ????????
    db   $05, $f0, $b1, $2e, $0a, $ff, $4f, $cd        ;; 06:4e7c ????????
    db   $cc, $40, $47, $68, $cb, $3d, $cb, $3d        ;; 06:4e84 ????????
    db   $cd, $df, $40, $67, $cd, $5f, $01, $78        ;; 06:4e8c ????????
    db   $5d, $cb, $3b, $cd, $62, $7f, $cd, $f7        ;; 06:4e94 ????????
    db   $47, $79, $cd, $64, $7f, $cd, $74, $7f        ;; 06:4e9c ????????
    db   $da, $c1, $40, $c3, $27, $4c, $cd, $5f        ;; 06:4ea4 ????????
    db   $42, $cd, $df, $40, $47, $cd, $7a, $7f        ;; 06:4eac ????????
    db   $3e, $40, $cd, $71, $5a, $f7, $21, $1f        ;; 06:4eb4 ????????
    db   $d0, $11, $20, $00, $0e, $1b, $7e, $b9        ;; 06:4ebc ????????
    db   $20, $0e, $e5, $3e, $1d, $cd, $64, $7f        ;; 06:4ec4 ????????
    db   $cb, $47, $cc, $76, $7f, $cb, $c6, $e1        ;; 06:4ecc ????????
    db   $19, $0d, $20, $ea, $cd, $fc, $40, $cb        ;; 06:4ed4 ????????
    db   $c6, $f0, $b6, $fe, $00, $28, $05, $3e        ;; 06:4edc ????????
    db   $3f, $c3, $71, $5a, $3e, $41, $c3, $71        ;; 06:4ee4 ????????
    db   $5a, $cd, $23, $48, $51, $cd, $df, $40        ;; 06:4eec ????????
    db   $81, $4f, $cd, $e2, $5c, $b9, $d0, $21        ;; 06:4ef4 ????????
    db   $8d, $cc, $2a, $b6, $23, $b6, $fe, $00        ;; 06:4efc ????????
    db   $c8, $cd, $7a, $7f, $f0, $b0, $2e, $09        ;; 06:4f04 ????????
    db   $ff, $5f, $cd, $f5, $5c, $4f, $cd, $e4        ;; 06:4f0c ????????
    db   $40, $47, $80, $27, $30, $09, $f5, $f0        ;; 06:4f14 ????????
    db   $b6, $c6, $01, $27, $e0, $b6, $f1, $0d        ;; 06:4f1c ????????
    db   $20, $f0, $21, $02, $c4, $32, $f0, $b6        ;; 06:4f24 ????????
    db   $32, $36, $00, $21, $02, $c4, $11, $8f        ;; 06:4f2c ????????
    db   $cc, $a7, $cd, $4d, $4f, $cd, $4d, $4f        ;; 06:4f34 ????????
    db   $cd, $4d, $4f, $30, $07, $97, $21, $8d        ;; 06:4f3c ????????
    db   $cc, $22, $22, $22, $3e, $2a, $c3, $71        ;; 06:4f44 ????????
    db   $5a, $46, $2b, $1a, $98, $27, $12, $1b        ;; 06:4f4c ????????
    db   $c9, $f0, $b0, $2e, $05, $ff, $47, $23        ;; 06:4f54 ????????
    db   $4e, $2b, $2b, $71, $2b, $70, $3e, $42        ;; 06:4f5c ????????
    db   $cd, $71, $5a, $f7, $c9, $cd, $1f, $42        ;; 06:4f64 ????????
    db   $f0, $b1, $2e, $00, $ff, $e6, $c0, $c2        ;; 06:4f6c ????????
    db   $82, $42, $cd, $23, $48, $cd, $e4, $40        ;; 06:4f74 ????????
    db   $91, $30, $01, $97, $4f, $cd, $e2, $5c        ;; 06:4f7c ????????
    db   $b9, $da, $bc, $40, $cd, $3b, $4a, $c3        ;; 06:4f84 ????????
    db   $27, $4c, $cd, $7a, $7f, $ea, $aa, $d4        ;; 06:4f8c ????????
    db   $cd, $5f, $42, $f7, $cd, $df, $40, $e0        ;; 06:4f94 ????????
    db   $b7, $0e, $00, $f0, $b0, $b9, $28, $18        ;; 06:4f9c ????????
    db   $79, $e0, $b1, $2e, $02, $ff, $e6, $03        ;; 06:4fa4 ????????
    db   $20, $0e, $f0, $b7, $6f, $26, $00, $cd        ;; 06:4fac ????????
    db   $44, $41, $cd, $d6, $41, $cd, $76, $7f        ;; 06:4fb4 ????????
    db   $0c, $79, $fe, $1f, $20, $dd, $f0, $b6        ;; 06:4fbc ????????
    db   $6f, $f0, $b7, $67, $cd, $5f, $01, $cd        ;; 06:4fc4 ????????
    db   $2c, $41, $e5, $d1, $f0, $b0, $cd, $6b        ;; 06:4fcc ????????
    db   $41, $3e, $1c, $c3, $71, $5a, $cd, $df        ;; 06:4fd4 ????????
    db   $40, $47, $cd, $3e, $41, $f0, $b1, $2e        ;; 06:4fdc ????????
    db   $08, $ff, $c9, $cd, $87, $42, $cd, $da        ;; 06:4fe4 ????????
    db   $4f, $80, $77, $c3, $1e, $50, $cd, $02        ;; 06:4fec ????????
    db   $41, $28, $02, $e1, $c9, $cd, $87, $42        ;; 06:4ff4 ????????
    db   $f0, $b0, $e0, $b1, $c9, $cd, $f2, $4f        ;; 06:4ffc ????????
    db   $f0, $b0, $2e, $07, $ff, $cd, $df, $40        ;; 06:5004 ????????
    db   $77, $cd, $3e, $41, $3e, $25, $cd, $71        ;; 06:500c ????????
    db   $5a, $18, $0c, $cd, $f2, $4f, $cd, $da        ;; 06:5014 ????????
    db   $4f, $70, $3e, $28, $cd, $71, $5a, $3e        ;; 06:501c ????????
    db   $2b, $cd, $71, $5a, $f7, $c9, $f7, $cd        ;; 06:5024 ????????
    db   $58, $48, $cd, $ec, $4a, $79, $cd, $64        ;; 06:502c ????????
    db   $7f, $cd, $c5, $48, $c3, $a1, $4e, $cd        ;; 06:5034 ????????
    db   $1f, $42, $cd, $d2, $47, $e5, $3e, $1a        ;; 06:503c ????????
    db   $cd, $71, $5a, $cd, $4a, $41, $f7, $f0        ;; 06:5044 ????????
    db   $b0, $e1, $cd, $33, $4c, $f0, $b1, $2e        ;; 06:504c ????????
    db   $03, $ff, $cd, $d6, $41, $d8, $c3, $fc        ;; 06:5054 ????????
    db   $45, $e5, $cd, $2c, $41, $d1, $cd, $72        ;; 06:505c ????????
    db   $7f, $f0, $b1, $c3, $6b, $41, $cd, $02        ;; 06:5064 ????????
    db   $41, $c0, $cd, $1f, $42, $f7, $3e, $22        ;; 06:506c ????????
    db   $c3, $71, $5a, $cd, $02, $41, $c0, $cd        ;; 06:5074 ????????
    db   $df, $40, $4f, $f0, $b0, $e0, $b1, $2e        ;; 06:507c ????????
    db   $09, $ff, $81, $fe, $63, $38, $02, $3e        ;; 06:5084 ????????
    db   $63, $77, $cd, $5a, $42, $3e, $1b, $cd        ;; 06:508c ????????
    db   $71, $5a, $f7, $c9, $0e, $01, $fa, $e6        ;; 06:5094 ????????
    db   $d3, $fe, $00, $20, $0a, $0e, $ff, $3e        ;; 06:509c ????????
    db   $4f, $cd, $71, $5a, $f7, $18, $05, $3e        ;; 06:50a4 ????????
    db   $11, $cd, $71, $5a, $f0, $b0, $2e, $02        ;; 06:50ac ????????
    db   $ff, $71, $c9, $cd, $1f, $42, $f7, $cd        ;; 06:50b4 ????????
    db   $e4, $40, $4f, $cd, $c6, $40, $a1, $c2        ;; 06:50bc ????????
    db   $82, $42, $23, $7e, $a1, $20, $10, $3e        ;; 06:50c4 ????????
    db   $02, $cd, $64, $7f, $c6, $32, $4f, $cd        ;; 06:50cc ????????
    db   $cc, $40, $5f, $79, $93, $30, $01, $97        ;; 06:50d4 ????????
    db   $4f, $cd, $e2, $5c, $b9, $da, $82, $42        ;; 06:50dc ????????
    db   $cd, $df, $40, $57, $cd, $f8, $40, $5f        ;; 06:50e4 ????????
    db   $b2, $77, $c3, $6f, $5c                       ;; 06:50ec ?????

jp_06_50f1:
    ld   C, $00                                        ;; 06:50f1 $0e $00
    ld   B, $1f                                        ;; 06:50f3 $06 $1f
.jr_06_50f5:
    ld   A, C                                          ;; 06:50f5 $79
    ld   L, $02                                        ;; 06:50f6 $2e $02
    rst  rst_00_0038                                   ;; 06:50f8 $ff
    bit  0, A                                          ;; 06:50f9 $cb $47
    jr   NZ, .jr_06_5108                               ;; 06:50fb $20 $0b
    bit  1, A                                          ;; 06:50fd $cb $4f
    jr   NZ, .jr_06_510c                               ;; 06:50ff $20 $0b
    bit  4, A                                          ;; 06:5101 $cb $67
    call NZ, call_06_5111                              ;; 06:5103 $c4 $11 $51
    jr   .jr_06_510c                                   ;; 06:5106 $18 $04
.jr_06_5108:
    inc  HL                                            ;; 06:5108 $23
    sub  A, A                                          ;; 06:5109 $97
    ld   [HL+], A                                      ;; 06:510a $22
    ld   [HL+], A                                      ;; 06:510b $22
.jr_06_510c:
    inc  C                                             ;; 06:510c $0c
    dec  B                                             ;; 06:510d $05
    jr   NZ, .jr_06_50f5                               ;; 06:510e $20 $e5
    ret                                                ;; 06:5110 $c9

call_06_5111:
    push BC                                            ;; 06:5111 $c5
    push HL                                            ;; 06:5112 $e5
    ld   A, C                                          ;; 06:5113 $79
    ldh  [hFFB0], A                                    ;; 06:5114 $e0 $b0
    ldh  [hFFB1], A                                    ;; 06:5116 $e0 $b1
    ld   L, $0a                                        ;; 06:5118 $2e $0a
    rst  rst_00_0038                                   ;; 06:511a $ff
    ld   D, A                                          ;; 06:511b $57
    call call_06_5ce2                                  ;; 06:511c $cd $e2 $5c
    cp   A, D                                          ;; 06:511f $ba
    jr   NC, .jr_06_512d                               ;; 06:5120 $30 $0b
    pop  HL                                            ;; 06:5122 $e1
    ld   A, [HL]                                       ;; 06:5123 $7e
    ld   E, A                                          ;; 06:5124 $5f
    and  A, $ef                                        ;; 06:5125 $e6 $ef
    ld   [HL], A                                       ;; 06:5127 $77
    call call_06_5c8e                                  ;; 06:5128 $cd $8e $5c
    jr   .jr_06_5153                                   ;; 06:512b $18 $26
.jr_06_512d:
    pop  HL                                            ;; 06:512d $e1
    ld   A, $03                                        ;; 06:512e $3e $03
    call call_06_7f62                                  ;; 06:5130 $cd $62 $7f
    call call_06_7f6c                                  ;; 06:5133 $cd $6c $7f
    push DE                                            ;; 06:5136 $d5
    pop  HL                                            ;; 06:5137 $e1
    call call_06_5c11                                  ;; 06:5138 $cd $11 $5c
    call call_06_412c                                  ;; 06:513b $cd $2c $41
    call call_06_425a                                  ;; 06:513e $cd $5a $42
    ld   A, $02                                        ;; 06:5141 $3e $02
    call call_06_5a71                                  ;; 06:5143 $cd $71 $5a
    call call_06_4255                                  ;; 06:5146 $cd $55 $42
    ld   A, $20                                        ;; 06:5149 $3e $20
    ldh  [hFFB2], A                                    ;; 06:514b $e0 $b2
    call call_06_414a                                  ;; 06:514d $cd $4a $41
    call call_06_41d6                                  ;; 06:5150 $cd $d6 $41
.jr_06_5153:
    pop  BC                                            ;; 06:5153 $c1
    ret                                                ;; 06:5154 $c9

call_06_5155:
    push AF                                            ;; 06:5155 $f5
    push BC                                            ;; 06:5156 $c5
    push DE                                            ;; 06:5157 $d5
    push HL                                            ;; 06:5158 $e5
    ld   A, [wD4B2]                                    ;; 06:5159 $fa $b2 $d4
    inc  A                                             ;; 06:515c $3c
    ld   [wD4B2], A                                    ;; 06:515d $ea $b2 $d4
    cp   A, $01                                        ;; 06:5160 $fe $01
    jr   NZ, .jr_06_5170                               ;; 06:5162 $20 $0c
    ld   A, $1f                                        ;; 06:5164 $3e $1f
    call call_06_7f62                                  ;; 06:5166 $cd $62 $7f
    call call_06_5e15                                  ;; 06:5169 $cd $15 $5e
    sub  A, A                                          ;; 06:516c $97
    ld   [wD4AD], A                                    ;; 06:516d $ea $ad $d4
.jr_06_5170:
    jp   jp_06_7f7c                                    ;; 06:5170 $c3 $7c $7f

call_06_5173:
    ld   E, [HL]                                       ;; 06:5173 $5e
    ld   A, [BC]                                       ;; 06:5174 $0a
    dec  BC                                            ;; 06:5175 $0b
    adc  A, E                                          ;; 06:5176 $8b
    daa                                                ;; 06:5177 $27
    ld   [HL-], A                                      ;; 06:5178 $32
    ret                                                ;; 06:5179 $c9

call_06_517a:
    push AF                                            ;; 06:517a $f5
    call call_06_5c61                                  ;; 06:517b $cd $61 $5c
    jr   Z, .jr_06_51c7                                ;; 06:517e $28 $47
    ld   A, [HL]                                       ;; 06:5180 $7e
    and  A, $07                                        ;; 06:5181 $e6 $07
    jr   Z, .jr_06_518f                                ;; 06:5183 $28 $0a
    ld   C, A                                          ;; 06:5185 $4f
    ld   E, $07                                        ;; 06:5186 $1e $07
    call call_06_5505                                  ;; 06:5188 $cd $05 $55
    cp   A, C                                          ;; 06:518b $b9
    call C, call_06_5155                               ;; 06:518c $dc $55 $51
.jr_06_518f:
    ld   A, $1f                                        ;; 06:518f $3e $1f
    call call_06_7f62                                  ;; 06:5191 $cd $62 $7f
    ld   L, A                                          ;; 06:5194 $6f
    ld   H, $00                                        ;; 06:5195 $26 $00
    push HL                                            ;; 06:5197 $e5
    pop  DE                                            ;; 06:5198 $d1
    call call_06_5c09                                  ;; 06:5199 $cd $09 $5c
    add  HL, DE                                        ;; 06:519c $19
    ld   DE, data_06_6ae8                              ;; 06:519d $11 $e8 $6a
    add  HL, DE                                        ;; 06:51a0 $19
    ld   A, $06                                        ;; 06:51a1 $3e $06
    call call_06_7f62                                  ;; 06:51a3 $cd $62 $7f
    and  A, $0f                                        ;; 06:51a6 $e6 $0f
    add  A, A                                          ;; 06:51a8 $87
    ld   E, A                                          ;; 06:51a9 $5f
    ld   D, $00                                        ;; 06:51aa $16 $00
    ld   HL, data_06_72a4                              ;; 06:51ac $21 $a4 $72
    add  HL, DE                                        ;; 06:51af $19
    inc  HL                                            ;; 06:51b0 $23
    ld   E, [HL]                                       ;; 06:51b1 $5e
    dec  HL                                            ;; 06:51b2 $2b
    ldh  A, [hFFB8]                                    ;; 06:51b3 $f0 $b8
    add  A, E                                          ;; 06:51b5 $83
    daa                                                ;; 06:51b6 $27
    ldh  [hFFB8], A                                    ;; 06:51b7 $e0 $b8
    ld   E, [HL]                                       ;; 06:51b9 $5e
    ldh  A, [hFFB7]                                    ;; 06:51ba $f0 $b7
    adc  A, E                                          ;; 06:51bc $8b
    daa                                                ;; 06:51bd $27
    ldh  [hFFB7], A                                    ;; 06:51be $e0 $b7
    ldh  A, [hFFB6]                                    ;; 06:51c0 $f0 $b6
    adc  A, $00                                        ;; 06:51c2 $ce $00
    daa                                                ;; 06:51c4 $27
    ldh  [hFFB6], A                                    ;; 06:51c5 $e0 $b6
.jr_06_51c7:
    pop  AF                                            ;; 06:51c7 $f1
    ret                                                ;; 06:51c8 $c9

call_06_51c9:
    call call_06_5be8                                  ;; 06:51c9 $cd $e8 $5b
    ld   A, $00                                        ;; 06:51cc $3e $00
    ld   BC, wCC00                                     ;; 06:51ce $01 $00 $cc
.jr_06_51d1:
    call call_06_51e0                                  ;; 06:51d1 $cd $e0 $51
    ld   HL, $1f                                       ;; 06:51d4 $21 $1f $00
    add  HL, BC                                        ;; 06:51d7 $09
    push HL                                            ;; 06:51d8 $e5
    pop  BC                                            ;; 06:51d9 $c1
    inc  A                                             ;; 06:51da $3c
    cp   A, $04                                        ;; 06:51db $fe $04
    jr   NZ, .jr_06_51d1                               ;; 06:51dd $20 $f2
    ret                                                ;; 06:51df $c9

call_06_51e0:
    push AF                                            ;; 06:51e0 $f5
    push BC                                            ;; 06:51e1 $c5
    ld   L, $02                                        ;; 06:51e2 $2e $02
    rst  rst_00_0038                                   ;; 06:51e4 $ff
    push HL                                            ;; 06:51e5 $e5
    push BC                                            ;; 06:51e6 $c5
    pop  HL                                            ;; 06:51e7 $e1
    pop  BC                                            ;; 06:51e8 $c1
    ld   A, [BC]                                       ;; 06:51e9 $0a
    cp   A, $ff                                        ;; 06:51ea $fe $ff
    jr   Z, .jr_06_51f1                                ;; 06:51ec $28 $03
    and  A, $0f                                        ;; 06:51ee $e6 $0f
    ld   [BC], A                                       ;; 06:51f0 $02
.jr_06_51f1:
    inc  BC                                            ;; 06:51f1 $03
    ld   [HL], A                                       ;; 06:51f2 $77
    ld   A, $06                                        ;; 06:51f3 $3e $06
    call call_06_7f62                                  ;; 06:51f5 $cd $62 $7f
    ld   A, [BC]                                       ;; 06:51f8 $0a
    inc  BC                                            ;; 06:51f9 $03
    ld   [HL+], A                                      ;; 06:51fa $22
    ld   A, [BC]                                       ;; 06:51fb $0a
    ld   [HL], A                                       ;; 06:51fc $77
    ld   A, $0a                                        ;; 06:51fd $3e $0a
    call call_06_7f68                                  ;; 06:51ff $cd $68 $7f
    ld   A, $08                                        ;; 06:5202 $3e $08
    call call_06_7f62                                  ;; 06:5204 $cd $62 $7f
    ld   D, $08                                        ;; 06:5207 $16 $08
.jr_06_5209:
    call call_06_5212                                  ;; 06:5209 $cd $12 $52
    dec  D                                             ;; 06:520c $15
    jr   NZ, .jr_06_5209                               ;; 06:520d $20 $fa
    pop  BC                                            ;; 06:520f $c1
    pop  AF                                            ;; 06:5210 $f1
    ret                                                ;; 06:5211 $c9

call_06_5212:
    push DE                                            ;; 06:5212 $d5
    ld   A, [BC]                                       ;; 06:5213 $0a
    ld   [HL+], A                                      ;; 06:5214 $22
    push BC                                            ;; 06:5215 $c5
    ld   A, $08                                        ;; 06:5216 $3e $08
    call call_06_7f68                                  ;; 06:5218 $cd $68 $7f
    ld   A, [BC]                                       ;; 06:521b $0a
    ld   [HL+], A                                      ;; 06:521c $22
    pop  BC                                            ;; 06:521d $c1
    inc  BC                                            ;; 06:521e $03
    pop  DE                                            ;; 06:521f $d1
    ret                                                ;; 06:5220 $c9

call_06_5221:
    ld   C, $00                                        ;; 06:5221 $0e $00
.jr_06_5223:
    ld   A, D                                          ;; 06:5223 $7a
    ld   L, $02                                        ;; 06:5224 $2e $02
    rst  rst_00_0038                                   ;; 06:5226 $ff
    and  A, $03                                        ;; 06:5227 $e6 $03
    jr   Z, .jr_06_522c                                ;; 06:5229 $28 $01
    inc  C                                             ;; 06:522b $0c
.jr_06_522c:
    inc  D                                             ;; 06:522c $14
    dec  B                                             ;; 06:522d $05
    jr   NZ, .jr_06_5223                               ;; 06:522e $20 $f3
    ret                                                ;; 06:5230 $c9

jr_06_5231:
    call call_06_5be8                                  ;; 06:5231 $cd $e8 $5b
    ld   A, $0d                                        ;; 06:5234 $3e $0d
    ldh  [hFFE0], A                                    ;; 06:5236 $e0 $e0
    ld   A, $32                                        ;; 06:5238 $3e $32
    call call_06_5a71                                  ;; 06:523a $cd $71 $5a
    jp   jp_06_5e1b                                    ;; 06:523d $c3 $1b $5e

call_06_5240:
    call call_06_4219                                  ;; 06:5240 $cd $19 $42
    ld   B, $04                                        ;; 06:5243 $06 $04
    ld   D, $00                                        ;; 06:5245 $16 $00
    call call_06_5221                                  ;; 06:5247 $cd $21 $52
    ld   A, C                                          ;; 06:524a $79
    cp   A, $04                                        ;; 06:524b $fe $04
    jr   NZ, .jr_06_5251                               ;; 06:524d $20 $02
    jr   jr_06_5231                                    ;; 06:524f $18 $e0
.jr_06_5251:
    ld   B, $1b                                        ;; 06:5251 $06 $1b
    ld   D, $04                                        ;; 06:5253 $16 $04
    call call_06_5221                                  ;; 06:5255 $cd $21 $52
    ld   A, C                                          ;; 06:5258 $79
    cp   A, $1b                                        ;; 06:5259 $fe $1b
    ret  NZ                                            ;; 06:525b $c0
    call call_06_4423                                  ;; 06:525c $cd $23 $44
    ld   A, $0c                                        ;; 06:525f $3e $0c
    ldh  [hFFE0], A                                    ;; 06:5261 $e0 $e0
    ld   A, $31                                        ;; 06:5263 $3e $31
    call call_06_5a71                                  ;; 06:5265 $cd $71 $5a
    call call_06_51c9                                  ;; 06:5268 $cd $c9 $51
    sub  A, A                                          ;; 06:526b $97
    ldh  [hFFB6], A                                    ;; 06:526c $e0 $b6
    ldh  [hFFB7], A                                    ;; 06:526e $e0 $b7
    ldh  [hFFB8], A                                    ;; 06:5270 $e0 $b8
.jr_06_5272:
    call call_06_517a                                  ;; 06:5272 $cd $7a $51
    inc  A                                             ;; 06:5275 $3c
    cp   A, $1b                                        ;; 06:5276 $fe $1b
    jr   NZ, .jr_06_5272                               ;; 06:5278 $20 $f8
    ld   HL, hFFB6                                     ;; 06:527a $21 $b6 $ff
    ld   DE, wC400                                     ;; 06:527d $11 $00 $c4
    ld   B, $03                                        ;; 06:5280 $06 $03
    call call_00_008f                                  ;; 06:5282 $cd $8f $00
    ld   A, $30                                        ;; 06:5285 $3e $30
    call call_06_5a71                                  ;; 06:5287 $cd $71 $5a
    ld   HL, wCC8F                                     ;; 06:528a $21 $8f $cc
    ld   BC, hFFB8                                     ;; 06:528d $01 $b8 $ff
    and  A, A                                          ;; 06:5290 $a7
    call call_06_5173                                  ;; 06:5291 $cd $73 $51
    call call_06_5173                                  ;; 06:5294 $cd $73 $51
    call call_06_5173                                  ;; 06:5297 $cd $73 $51
    ld   A, [HL]                                       ;; 06:529a $7e
    adc  A, $00                                        ;; 06:529b $ce $00
    daa                                                ;; 06:529d $27
    ld   [HL], A                                       ;; 06:529e $77
    ld   A, $00                                        ;; 06:529f $3e $00
    ld   BC, wCC00                                     ;; 06:52a1 $01 $00 $cc
.jr_06_52a4:
    call call_06_539e                                  ;; 06:52a4 $cd $9e $53
    ld   HL, $1f                                       ;; 06:52a7 $21 $1f $00
    add  HL, BC                                        ;; 06:52aa $09
    push HL                                            ;; 06:52ab $e5
    pop  BC                                            ;; 06:52ac $c1
    inc  A                                             ;; 06:52ad $3c
    cp   A, $04                                        ;; 06:52ae $fe $04
    jr   NZ, .jr_06_52a4                               ;; 06:52b0 $20 $f2

jp_06_52b2:
    ld   HL, wD3EF                                     ;; 06:52b2 $21 $ef $d3
    ld   DE, wCC00                                     ;; 06:52b5 $11 $00 $cc
    call call_06_531f                                  ;; 06:52b8 $cd $1f $53
    call call_06_531f                                  ;; 06:52bb $cd $1f $53
    call call_06_531f                                  ;; 06:52be $cd $1f $53
    call call_06_531f                                  ;; 06:52c1 $cd $1f $53
    ld   [HL], $00                                     ;; 06:52c4 $36 $00
    inc  HL                                            ;; 06:52c6 $23
    ld   [HL], $01                                     ;; 06:52c7 $36 $01
    inc  HL                                            ;; 06:52c9 $23
    ld   [HL], $02                                     ;; 06:52ca $36 $02
    inc  HL                                            ;; 06:52cc $23
    ld   [HL], $03                                     ;; 06:52cd $36 $03
    inc  HL                                            ;; 06:52cf $23
    ld   B, $04                                        ;; 06:52d0 $06 $04
.jr_06_52d2:
    ld   C, $03                                        ;; 06:52d2 $0e $03
    ld   HL, wD3EF                                     ;; 06:52d4 $21 $ef $d3
.jr_06_52d7:
    ld   A, [HL+]                                      ;; 06:52d7 $2a
    ld   E, A                                          ;; 06:52d8 $5f
    ld   A, [HL]                                       ;; 06:52d9 $7e
    call call_06_5365                                  ;; 06:52da $cd $65 $53
    jr   C, .jr_06_52ed                                ;; 06:52dd $38 $0e
    push HL                                            ;; 06:52df $e5
    ld   [HL], E                                       ;; 06:52e0 $73
    dec  HL                                            ;; 06:52e1 $2b
    ld   [HL], A                                       ;; 06:52e2 $77
    ld   A, $04                                        ;; 06:52e3 $3e $04
    call call_06_7f62                                  ;; 06:52e5 $cd $62 $7f
    ld   A, [HL+]                                      ;; 06:52e8 $2a
    ld   E, [HL]                                       ;; 06:52e9 $5e
    ld   [HL-], A                                      ;; 06:52ea $32
    ld   [HL], E                                       ;; 06:52eb $73
    pop  HL                                            ;; 06:52ec $e1
.jr_06_52ed:
    dec  C                                             ;; 06:52ed $0d
    jr   NZ, .jr_06_52d7                               ;; 06:52ee $20 $e7
    dec  B                                             ;; 06:52f0 $05
    jr   NZ, .jr_06_52d2                               ;; 06:52f1 $20 $df
    ld   HL, wCC00                                     ;; 06:52f3 $21 $00 $cc
    ld   DE, wD000                                     ;; 06:52f6 $11 $00 $d0
    ld   B, $7c                                        ;; 06:52f9 $06 $7c
    call call_00_008f                                  ;; 06:52fb $cd $8f $00
    ld   A, [wCC8C]                                    ;; 06:52fe $fa $8c $cc
    ld   E, A                                          ;; 06:5301 $5f
    ld   HL, wD3F3                                     ;; 06:5302 $21 $f3 $d3
    ld   B, [HL]                                       ;; 06:5305 $46
    sub  A, A                                          ;; 06:5306 $97
    call call_06_5327                                  ;; 06:5307 $cd $27 $53
    ld   B, [HL]                                       ;; 06:530a $46
    ld   A, $01                                        ;; 06:530b $3e $01
    call call_06_5327                                  ;; 06:530d $cd $27 $53
    ld   B, [HL]                                       ;; 06:5310 $46
    ld   A, $02                                        ;; 06:5311 $3e $02
    call call_06_5327                                  ;; 06:5313 $cd $27 $53
    ld   B, [HL]                                       ;; 06:5316 $46
    ld   A, $03                                        ;; 06:5317 $3e $03
    call call_06_5327                                  ;; 06:5319 $cd $27 $53
    jp   jp_06_5ceb                                    ;; 06:531c $c3 $eb $5c

call_06_531f:
    ld   A, [DE]                                       ;; 06:531f $1a
    ld   [DE], A                                       ;; 06:5320 $12
    ld   [HL+], A                                      ;; 06:5321 $22
    ld   A, E                                          ;; 06:5322 $7b
    add  A, $1f                                        ;; 06:5323 $c6 $1f
    ld   E, A                                          ;; 06:5325 $5f
    ret                                                ;; 06:5326 $c9

call_06_5327:
    push HL                                            ;; 06:5327 $e5
    push DE                                            ;; 06:5328 $d5
    ld   D, A                                          ;; 06:5329 $57
    ld   A, [HL]                                       ;; 06:532a $7e
    cp   A, E                                          ;; 06:532b $bb
    jr   NZ, .jr_06_5332                               ;; 06:532c $20 $04
    ld   A, D                                          ;; 06:532e $7a
    ld   [wCC8C], A                                    ;; 06:532f $ea $8c $cc
.jr_06_5332:
    ld   A, D                                          ;; 06:5332 $7a
    ld   L, A                                          ;; 06:5333 $6f
    ld   H, $00                                        ;; 06:5334 $26 $00
    call call_06_5c07                                  ;; 06:5336 $cd $07 $5c
    call call_06_7f64                                  ;; 06:5339 $cd $64 $7f
    ld   DE, wCC00                                     ;; 06:533c $11 $00 $cc
    add  HL, DE                                        ;; 06:533f $19
    push HL                                            ;; 06:5340 $e5
    pop  DE                                            ;; 06:5341 $d1
    ld   A, B                                          ;; 06:5342 $78
    ld   L, A                                          ;; 06:5343 $6f
    ld   H, $00                                        ;; 06:5344 $26 $00
    call call_06_5c07                                  ;; 06:5346 $cd $07 $5c
    call call_06_7f64                                  ;; 06:5349 $cd $64 $7f
    ld   BC, wD000                                     ;; 06:534c $01 $00 $d0
    add  HL, BC                                        ;; 06:534f $09
    ld   B, $1f                                        ;; 06:5350 $06 $1f
    call call_00_008f                                  ;; 06:5352 $cd $8f $00
    pop  DE                                            ;; 06:5355 $d1
    pop  HL                                            ;; 06:5356 $e1
    inc  HL                                            ;; 06:5357 $23
    ret                                                ;; 06:5358 $c9

call_06_5359:
    push BC                                            ;; 06:5359 $c5
    ld   C, $08                                        ;; 06:535a $0e $08
.jr_06_535c:
    rla                                                ;; 06:535c $17
    rr   B                                             ;; 06:535d $cb $18
    dec  C                                             ;; 06:535f $0d
    jr   NZ, .jr_06_535c                               ;; 06:5360 $20 $fa
    ld   A, B                                          ;; 06:5362 $78
    pop  BC                                            ;; 06:5363 $c1
    ret                                                ;; 06:5364 $c9

call_06_5365:
    push BC                                            ;; 06:5365 $c5
    cp   A, E                                          ;; 06:5366 $bb
    jr   Z, .jr_06_5391                                ;; 06:5367 $28 $28
    cp   A, $ff                                        ;; 06:5369 $fe $ff
    jr   Z, .jr_06_5391                                ;; 06:536b $28 $24
    ld   C, A                                          ;; 06:536d $4f
    ld   A, E                                          ;; 06:536e $7b
    cp   A, $ff                                        ;; 06:536f $fe $ff
    ld   A, C                                          ;; 06:5371 $79
    jr   Z, .jr_06_5384                                ;; 06:5372 $28 $10
    ld   A, E                                          ;; 06:5374 $7b
    and  A, $0f                                        ;; 06:5375 $e6 $0f
    call call_06_5359                                  ;; 06:5377 $cd $59 $53
    ld   E, A                                          ;; 06:537a $5f
    ld   A, C                                          ;; 06:537b $79
    and  A, $0f                                        ;; 06:537c $e6 $0f
    call call_06_5359                                  ;; 06:537e $cd $59 $53
    cp   A, E                                          ;; 06:5381 $bb
    jr   NC, .jr_06_5391                               ;; 06:5382 $30 $0d
.jr_06_5384:
    call call_06_5359                                  ;; 06:5384 $cd $59 $53
    ld   C, A                                          ;; 06:5387 $4f
    ld   A, E                                          ;; 06:5388 $7b
    call call_06_5359                                  ;; 06:5389 $cd $59 $53
    ld   E, A                                          ;; 06:538c $5f
    ld   A, C                                          ;; 06:538d $79
    pop  BC                                            ;; 06:538e $c1
    and  A, A                                          ;; 06:538f $a7
    ret                                                ;; 06:5390 $c9
.jr_06_5391:
    call call_06_5359                                  ;; 06:5391 $cd $59 $53
    ld   C, A                                          ;; 06:5394 $4f
    ld   A, E                                          ;; 06:5395 $7b
    call call_06_5359                                  ;; 06:5396 $cd $59 $53
    ld   E, A                                          ;; 06:5399 $5f
    ld   A, C                                          ;; 06:539a $79
    pop  BC                                            ;; 06:539b $c1
    scf                                                ;; 06:539c $37
    ret                                                ;; 06:539d $c9

call_06_539e:
    push AF                                            ;; 06:539e $f5
    push BC                                            ;; 06:539f $c5
    ldh  [hFFB6], A                                    ;; 06:53a0 $e0 $b6
    ld   L, $02                                        ;; 06:53a2 $2e $02
    rst  rst_00_0038                                   ;; 06:53a4 $ff
    and  A, $03                                        ;; 06:53a5 $e6 $03
    jr   NZ, .jr_06_53c7                               ;; 06:53a7 $20 $1e
    dec  HL                                            ;; 06:53a9 $2b
    dec  HL                                            ;; 06:53aa $2b
    ld   A, [HL]                                       ;; 06:53ab $7e
    and  A, $c0                                        ;; 06:53ac $e6 $c0
    cp   A, $40                                        ;; 06:53ae $fe $40
    jr   NZ, .jr_06_53c7                               ;; 06:53b0 $20 $15
    ld   E, $ff                                        ;; 06:53b2 $1e $ff
    sub  A, A                                          ;; 06:53b4 $97
    call call_00_016b                                  ;; 06:53b5 $cd $6b $01
    ld   C, $08                                        ;; 06:53b8 $0e $08
    ld   B, $00                                        ;; 06:53ba $06 $00
    ld   HL, data_06_7f00                              ;; 06:53bc $21 $00 $7f
.jr_06_53bf:
    cp   A, [HL]                                       ;; 06:53bf $be
    jr   C, .jr_06_53ca                                ;; 06:53c0 $38 $08
    inc  HL                                            ;; 06:53c2 $23
    inc  B                                             ;; 06:53c3 $04
    dec  C                                             ;; 06:53c4 $0d
    jr   NZ, .jr_06_53bf                               ;; 06:53c5 $20 $f8
.jr_06_53c7:
    pop  BC                                            ;; 06:53c7 $c1
    pop  AF                                            ;; 06:53c8 $f1
    ret                                                ;; 06:53c9 $c9
.jr_06_53ca:
    sla  B                                             ;; 06:53ca $cb $20
    ld   L, B                                          ;; 06:53cc $68
    ld   H, $00                                        ;; 06:53cd $26 $00
    ld   DE, data_06_53de                              ;; 06:53cf $11 $de $53
    add  HL, DE                                        ;; 06:53d2 $19
    ld   E, [HL]                                       ;; 06:53d3 $5e
    inc  HL                                            ;; 06:53d4 $23
    ld   D, [HL]                                       ;; 06:53d5 $56
    push DE                                            ;; 06:53d6 $d5
    pop  HL                                            ;; 06:53d7 $e1
    call call_06_53dd                                  ;; 06:53d8 $cd $dd $53
    jr   .jr_06_53c7                                   ;; 06:53db $18 $ea

call_06_53dd:
    jp   HL                                            ;; 06:53dd $e9

data_06_53de:
    db   $ee, $53, $2f, $54, $6f, $54, $68, $54        ;; 06:53de ????????
    db   $5a, $54, $61, $54, $9a, $54, $04, $55        ;; 06:53e6 ????????
    db   $0e, $20, $06, $00, $97, $1e, $64, $cd        ;; 06:53ee ????????
    db   $6b, $01, $fe, $5a, $30, $06, $04, $0d        ;; 06:53f6 ????????
    db   $20, $f2, $18, $ec, $cb, $20, $68, $26        ;; 06:53fe ????????
    db   $00, $11, $0f, $7f, $19, $2a, $f5, $56        ;; 06:5406 ????????
    db   $f0, $b6, $2e, $0f, $cd, $88, $54, $1e        ;; 06:540e ????????
    db   $03, $97, $cd, $6b, $01, $87, $cd, $62        ;; 06:5416 ????????
    db   $7f, $f1, $22, $72, $c9, $f5, $e6, $0f        ;; 06:541e ????????
    db   $5f, $f1, $cb, $37, $e6, $0f, $c3, $6b        ;; 06:5426 ????????
    db   $01, $fa, $0a, $7f, $cd, $23, $54, $5f        ;; 06:542e ????????
    db   $16, $00, $f0, $b6, $6f, $26, $1f, $cd        ;; 06:5436 ????????
    db   $5f, $01, $01, $08, $cc, $09, $4e, $23        ;; 06:543e ????????
    db   $46, $e5, $c5, $e1, $19, $11, $e7, $03        ;; 06:5446 ????????
    db   $cd, $68, $01, $30, $02, $e5, $d1, $e1        ;; 06:544e ????????
    db   $72, $2b, $73, $c9, $2e, $0b, $fa, $0b        ;; 06:5456 ????????
    db   $7f, $18, $13, $2e, $0c, $fa, $0c, $7f        ;; 06:545e ????????
    db   $18, $0c, $2e, $0d, $fa, $0d, $7f, $18        ;; 06:5466 ????????
    db   $05, $2e, $0e, $fa, $0e, $7f, $cd, $23        ;; 06:546e ????????
    db   $54, $f5, $f0, $b6, $cd, $88, $54, $5e        ;; 06:5476 ????????
    db   $f1, $83, $fe, $63, $38, $02, $3e, $63        ;; 06:547e ????????
    db   $77, $c9, $d5, $5f, $cb, $37, $e6, $f0        ;; 06:5486 ????????
    db   $87, $93, $85, $5f, $16, $00, $21, $00        ;; 06:548e ????????
    db   $cc, $19, $d1, $c9, $f0, $b6, $2e, $10        ;; 06:5496 ????????
    db   $cd, $88, $54, $0e, $04, $e5, $cd, $ae        ;; 06:549e ????????
    db   $54, $e1, $23, $23, $0d, $20, $f6, $c9        ;; 06:54a6 ????????
    db   $7e, $fe, $fe, $c8, $fe, $ff, $c8, $1e        ;; 06:54ae ????????
    db   $03, $cd, $05, $55, $fe, $00, $28, $2c        ;; 06:54b6 ????????
    db   $fe, $01, $28, $17, $fe, $02, $28, $05        ;; 06:54be ????????
    db   $cd, $f5, $54, $77, $c9, $cd, $f5, $54        ;; 06:54c6 ????????
    db   $5f, $cd, $05, $55, $7e, $93, $30, $01        ;; 06:54ce ????????
    db   $97, $77, $c9, $cd, $f5, $54, $5f, $cd        ;; 06:54d6 ????????
    db   $05, $55, $7e, $83, $fe, $63, $38, $02        ;; 06:54de ????????
    db   $3e, $63, $77, $c9, $7e, $cb, $3f, $fe        ;; 06:54e6 ????????
    db   $00, $20, $02, $3e, $01, $77, $c9, $e5        ;; 06:54ee ????????
    db   $2b, $7e, $1e, $03, $cd, $f2, $5b, $5f        ;; 06:54f6 ????????
    db   $cb, $3b, $cb, $3b, $e1, $c9, $c9             ;; 06:54fe ???????

call_06_5505:
    sub  A, A                                          ;; 06:5505 $97
    jp   call_00_016b                                  ;; 06:5506 $c3 $6b $01

call_06_5509:
    ld   A, [HL+]                                      ;; 06:5509 $2a
    cp   A, $ff                                        ;; 06:550a $fe $ff
    jr   NZ, .jr_06_5510                               ;; 06:550c $20 $02
    ld   [HL+], A                                      ;; 06:550e $22
    ret                                                ;; 06:550f $c9
.jr_06_5510:
    ld   [HL], C                                       ;; 06:5510 $71
    inc  HL                                            ;; 06:5511 $23
    ret                                                ;; 06:5512 $c9

call_06_5513:
    push AF                                            ;; 06:5513 $f5
    push BC                                            ;; 06:5514 $c5
    push DE                                            ;; 06:5515 $d5
    push HL                                            ;; 06:5516 $e5
    ld   HL, wD3E9                                     ;; 06:5517 $21 $e9 $d3
    ld   C, $00                                        ;; 06:551a $0e $00
    call call_06_5509                                  ;; 06:551c $cd $09 $55
    call call_06_5509                                  ;; 06:551f $cd $09 $55
    call call_06_5509                                  ;; 06:5522 $cd $09 $55
    ld   HL, wD082                                     ;; 06:5525 $21 $82 $d0
    ld   C, $1b                                        ;; 06:5528 $0e $1b
.jr_06_552a:
    call call_06_5537                                  ;; 06:552a $cd $37 $55
    ld   DE, $20                                       ;; 06:552d $11 $20 $00
    add  HL, DE                                        ;; 06:5530 $19
    dec  C                                             ;; 06:5531 $0d
    jr   NZ, .jr_06_552a                               ;; 06:5532 $20 $f6
    jp   jp_06_7f7c                                    ;; 06:5534 $c3 $7c $7f

call_06_5537:
    ld   A, [HL]                                       ;; 06:5537 $7e
    and  A, $03                                        ;; 06:5538 $e6 $03
    ret  NZ                                            ;; 06:553a $c0
    push HL                                            ;; 06:553b $e5
    ld   DE, $1d                                       ;; 06:553c $11 $1d $00
    add  HL, DE                                        ;; 06:553f $19
    ld   A, [HL]                                       ;; 06:5540 $7e
    ld   E, A                                          ;; 06:5541 $5f
    ld   D, A                                          ;; 06:5542 $57
    ld   HL, wD3E9                                     ;; 06:5543 $21 $e9 $d3
    call call_06_555f                                  ;; 06:5546 $cd $5f $55
    jr   Z, .jr_06_555c                                ;; 06:5549 $28 $11
    ld   E, $ff                                        ;; 06:554b $1e $ff
    ld   HL, wD3E9                                     ;; 06:554d $21 $e9 $d3
    call call_06_555f                                  ;; 06:5550 $cd $5f $55
    jr   NZ, .jr_06_555d                               ;; 06:5553 $20 $08
    dec  HL                                            ;; 06:5555 $2b
    ld   [HL], D                                       ;; 06:5556 $72
    inc  HL                                            ;; 06:5557 $23
    ld   [HL], $01                                     ;; 06:5558 $36 $01
    jr   .jr_06_555d                                   ;; 06:555a $18 $01
.jr_06_555c:
    inc  [HL]                                          ;; 06:555c $34
.jr_06_555d:
    pop  HL                                            ;; 06:555d $e1
    ret                                                ;; 06:555e $c9

call_06_555f:
    ld   A, [HL+]                                      ;; 06:555f $2a
    cp   A, E                                          ;; 06:5560 $bb
    ret  Z                                             ;; 06:5561 $c8
    inc  HL                                            ;; 06:5562 $23
    ld   A, [HL+]                                      ;; 06:5563 $2a
    cp   A, E                                          ;; 06:5564 $bb
    ret  Z                                             ;; 06:5565 $c8
    inc  HL                                            ;; 06:5566 $23
    ld   A, [HL+]                                      ;; 06:5567 $2a
    cp   A, E                                          ;; 06:5568 $bb
    ret                                                ;; 06:5569 $c9

call_06_556a:
    sub  A, A                                          ;; 06:556a $97
    ld   BC, wCC00                                     ;; 06:556b $01 $00 $cc
    call call_06_5586                                  ;; 06:556e $cd $86 $55
    ld   A, $01                                        ;; 06:5571 $3e $01
    ld   BC, wCC1F                                     ;; 06:5573 $01 $1f $cc
    call call_06_5586                                  ;; 06:5576 $cd $86 $55
    ld   A, $02                                        ;; 06:5579 $3e $02
    ld   BC, wCC3E                                     ;; 06:557b $01 $3e $cc
    call call_06_5586                                  ;; 06:557e $cd $86 $55
    ld   A, $03                                        ;; 06:5581 $3e $03
    ld   BC, wCC5D                                     ;; 06:5583 $01 $5d $cc

call_06_5586:
    ldh  [hFFB8], A                                    ;; 06:5586 $e0 $b8
    ld   A, C                                          ;; 06:5588 $79
    ldh  [hFFB6], A                                    ;; 06:5589 $e0 $b6
    ld   A, B                                          ;; 06:558b $78
    ldh  [hFFB7], A                                    ;; 06:558c $e0 $b7
    ldh  A, [hFFB8]                                    ;; 06:558e $f0 $b8
    ld   L, $00                                        ;; 06:5590 $2e $00
    rst  rst_00_0038                                   ;; 06:5592 $ff
    ld   A, $05                                        ;; 06:5593 $3e $05
    call call_06_564d                                  ;; 06:5595 $cd $4d $56
    push HL                                            ;; 06:5598 $e5
    ld   BC, $1e                                       ;; 06:5599 $01 $1e $00
    add  HL, BC                                        ;; 06:559c $09
    ld   [HL], A                                       ;; 06:559d $77
    pop  HL                                            ;; 06:559e $e1
    push HL                                            ;; 06:559f $e5
    ld   HL, data_06_71f0                              ;; 06:55a0 $21 $f0 $71
    ld   E, A                                          ;; 06:55a3 $5f
    srl  A                                             ;; 06:55a4 $cb $3f
    call call_06_7f62                                  ;; 06:55a6 $cd $62 $7f
    bit  0, E                                          ;; 06:55a9 $cb $43
    jr   NZ, .jr_06_55af                               ;; 06:55ab $20 $02
    swap A                                             ;; 06:55ad $cb $37
.jr_06_55af:
    and  A, $0f                                        ;; 06:55af $e6 $0f
    pop  HL                                            ;; 06:55b1 $e1
    ld   [HL+], A                                      ;; 06:55b2 $22
    ld   A, $00                                        ;; 06:55b3 $3e $00
    call call_06_564d                                  ;; 06:55b5 $cd $4d $56
    ld   A, $06                                        ;; 06:55b8 $3e $06
    call call_06_564d                                  ;; 06:55ba $cd $4d $56
    inc  DE                                            ;; 06:55bd $13
    call call_06_560b                                  ;; 06:55be $cd $0b $56
    call call_06_560b                                  ;; 06:55c1 $cd $0b $56
    call call_06_560b                                  ;; 06:55c4 $cd $0b $56
    ld   A, [DE]                                       ;; 06:55c7 $1a
    inc  DE                                            ;; 06:55c8 $13
    swap A                                             ;; 06:55c9 $cb $37
    srl  A                                             ;; 06:55cb $cb $3f
    and  A, $07                                        ;; 06:55cd $e6 $07
    push HL                                            ;; 06:55cf $e5
    push HL                                            ;; 06:55d0 $e5
    ld   HL, .data_06_5603                             ;; 06:55d1 $21 $03 $56
    call call_06_7f62                                  ;; 06:55d4 $cd $62 $7f
    pop  HL                                            ;; 06:55d7 $e1
    ld   BC, hFFF9                                     ;; 06:55d8 $01 $f9 $ff
    add  HL, BC                                        ;; 06:55db $09
    ld   [HL], A                                       ;; 06:55dc $77
    pop  HL                                            ;; 06:55dd $e1
    call call_06_560b                                  ;; 06:55de $cd $0b $56
    call call_06_560b                                  ;; 06:55e1 $cd $0b $56
    call call_06_560b                                  ;; 06:55e4 $cd $0b $56
    call call_06_560b                                  ;; 06:55e7 $cd $0b $56
    push HL                                            ;; 06:55ea $e5
    inc  HL                                            ;; 06:55eb $23
    inc  HL                                            ;; 06:55ec $23
    inc  HL                                            ;; 06:55ed $23
    sub  A, A                                          ;; 06:55ee $97
    ldh  [hFFB9], A                                    ;; 06:55ef $e0 $b9
    ldh  [hFFBA], A                                    ;; 06:55f1 $e0 $ba
    ld   C, $08                                        ;; 06:55f3 $0e $08
.jr_06_55f5:
    call call_06_560f                                  ;; 06:55f5 $cd $0f $56
    dec  C                                             ;; 06:55f8 $0d
    jr   NZ, .jr_06_55f5                               ;; 06:55f9 $20 $fa
    pop  HL                                            ;; 06:55fb $e1
    ldh  A, [hFFB9]                                    ;; 06:55fc $f0 $b9
    ld   [HL+], A                                      ;; 06:55fe $22
    ldh  A, [hFFBA]                                    ;; 06:55ff $f0 $ba
    ld   [HL], A                                       ;; 06:5601 $77
    ret                                                ;; 06:5602 $c9
.data_06_5603:
    db   $00, $40, $80, $00, $00, $00, $00, $00        ;; 06:5603 ????????

call_06_560b:
    ld   A, [DE]                                       ;; 06:560b $1a
    inc  DE                                            ;; 06:560c $13
    ld   [HL+], A                                      ;; 06:560d $22
    ret                                                ;; 06:560e $c9

call_06_560f:
    push BC                                            ;; 06:560f $c5
    ld   A, [DE]                                       ;; 06:5610 $1a
    inc  DE                                            ;; 06:5611 $13
    push HL                                            ;; 06:5612 $e5
    ld   [HL], A                                       ;; 06:5613 $77
    ld   BC, $08                                       ;; 06:5614 $01 $08 $00
    add  HL, BC                                        ;; 06:5617 $09
    ld   A, [DE]                                       ;; 06:5618 $1a
    inc  DE                                            ;; 06:5619 $13
    ld   [HL], A                                       ;; 06:561a $77
    pop  HL                                            ;; 06:561b $e1
    push DE                                            ;; 06:561c $d5
    ld   A, [HL]                                       ;; 06:561d $7e
    cp   A, $fe                                        ;; 06:561e $fe $fe
    jr   NC, .jr_06_5649                               ;; 06:5620 $30 $27
    ld   E, $00                                        ;; 06:5622 $1e $00
    call call_06_5bf2                                  ;; 06:5624 $cd $f2 $5b
    ld   D, A                                          ;; 06:5627 $57
    bit  6, A                                          ;; 06:5628 $cb $77
    jr   Z, .jr_06_5638                                ;; 06:562a $28 $0c
    ld   A, [HL]                                       ;; 06:562c $7e
    ld   E, $05                                        ;; 06:562d $1e $05
    call call_06_5bf2                                  ;; 06:562f $cd $f2 $5b
    ld   C, A                                          ;; 06:5632 $4f
    ldh  A, [hFFB9]                                    ;; 06:5633 $f0 $b9
    or   A, C                                          ;; 06:5635 $b1
    ldh  [hFFB9], A                                    ;; 06:5636 $e0 $b9
.jr_06_5638:
    ld   A, D                                          ;; 06:5638 $7a
    bit  7, A                                          ;; 06:5639 $cb $7f
    jr   Z, .jr_06_5649                                ;; 06:563b $28 $0c
    ld   A, [HL]                                       ;; 06:563d $7e
    ld   E, $05                                        ;; 06:563e $1e $05
    call call_06_5bf2                                  ;; 06:5640 $cd $f2 $5b
    ld   C, A                                          ;; 06:5643 $4f
    ldh  A, [hFFBA]                                    ;; 06:5644 $f0 $ba
    or   A, C                                          ;; 06:5646 $b1
    ldh  [hFFBA], A                                    ;; 06:5647 $e0 $ba
.jr_06_5649:
    inc  HL                                            ;; 06:5649 $23
    pop  DE                                            ;; 06:564a $d1
    pop  BC                                            ;; 06:564b $c1
    ret                                                ;; 06:564c $c9

call_06_564d:
    push HL                                            ;; 06:564d $e5
    ld   HL, hFFB6                                     ;; 06:564e $21 $b6 $ff
    ld   E, [HL]                                       ;; 06:5651 $5e
    inc  HL                                            ;; 06:5652 $23
    ld   D, [HL]                                       ;; 06:5653 $56
    ld   L, A                                          ;; 06:5654 $6f
    ld   H, $00                                        ;; 06:5655 $26 $00
    add  HL, DE                                        ;; 06:5657 $19
    push HL                                            ;; 06:5658 $e5
    pop  DE                                            ;; 06:5659 $d1
    pop  HL                                            ;; 06:565a $e1
    ld   A, [DE]                                       ;; 06:565b $1a
    ld   [HL+], A                                      ;; 06:565c $22
    ret                                                ;; 06:565d $c9

call_06_565e:
    ld   HL, wD000                                     ;; 06:565e $21 $00 $d0
    sub  A, A                                          ;; 06:5661 $97
    ld   B, $0f                                        ;; 06:5662 $06 $0f
.jr_06_5664:
    ld   C, A                                          ;; 06:5664 $4f
.jr_06_5665:
    ld   [HL+], A                                      ;; 06:5665 $22
    dec  C                                             ;; 06:5666 $0d
    jr   NZ, .jr_06_5665                               ;; 06:5667 $20 $fc
    dec  B                                             ;; 06:5669 $05
    jr   NZ, .jr_06_5664                               ;; 06:566a $20 $f8
    ld   C, $1f                                        ;; 06:566c $0e $1f
    ld   DE, wD000                                     ;; 06:566e $11 $00 $d0
.jr_06_5671:
    ld   HL, .data_06_568d                             ;; 06:5671 $21 $8d $56
    ld   B, $20                                        ;; 06:5674 $06 $20
    call call_00_008f                                  ;; 06:5676 $cd $8f $00
    dec  C                                             ;; 06:5679 $0d
    jr   NZ, .jr_06_5671                               ;; 06:567a $20 $f5
    ld   A, $ff                                        ;; 06:567c $3e $ff
    ld   HL, wD3E9                                     ;; 06:567e $21 $e9 $d3
    ld   [HL+], A                                      ;; 06:5681 $22
    inc  A                                             ;; 06:5682 $3c
    ld   [HL+], A                                      ;; 06:5683 $22
    dec  A                                             ;; 06:5684 $3d
    ld   [HL+], A                                      ;; 06:5685 $22
    inc  A                                             ;; 06:5686 $3c
    ld   [HL+], A                                      ;; 06:5687 $22
    dec  A                                             ;; 06:5688 $3d
    ld   [HL+], A                                      ;; 06:5689 $22
    inc  A                                             ;; 06:568a $3c
    ld   [HL+], A                                      ;; 06:568b $22
    ret                                                ;; 06:568c $c9
.data_06_568d:
    db   $00, $00, $ff, $00, $00, $00, $00, $00        ;; 06:568d ????????
    db   $00, $00, $00, $00, $00, $00, $fe, $fe        ;; 06:5695 ????????
    db   $fe, $fe, $fe, $fe, $fe, $fe, $00, $00        ;; 06:569d ????????
    db   $00, $00, $00, $00, $00, $00, $00, $ff        ;; 06:56a5 ????????

call_06_56ad:
    ld   A, $04                                        ;; 06:56ad $3e $04
    ld   [wD3E7], A                                    ;; 06:56af $ea $e7 $d3
    ldh  A, [hFFBD]                                    ;; 06:56b2 $f0 $bd
    and  A, $7f                                        ;; 06:56b4 $e6 $7f
    ld   L, A                                          ;; 06:56b6 $6f
    ld   H, $00                                        ;; 06:56b7 $26 $00
    push HL                                            ;; 06:56b9 $e5
    pop  DE                                            ;; 06:56ba $d1
    call call_06_5c26                                  ;; 06:56bb $cd $26 $5c
    add  HL, DE                                        ;; 06:56be $19
    push HL                                            ;; 06:56bf $e5
    pop  DE                                            ;; 06:56c0 $d1
    ld   HL, data_06_6868                              ;; 06:56c1 $21 $68 $68
    add  HL, DE                                        ;; 06:56c4 $19
    push HL                                            ;; 06:56c5 $e5
    ldh  A, [hFFBD]                                    ;; 06:56c6 $f0 $bd
    bit  7, A                                          ;; 06:56c8 $cb $7f
    jr   Z, .jr_06_56cd                                ;; 06:56ca $28 $01
    inc  HL                                            ;; 06:56cc $23
.jr_06_56cd:
    inc  HL                                            ;; 06:56cd $23
    inc  HL                                            ;; 06:56ce $23
    inc  HL                                            ;; 06:56cf $23
    ld   A, [HL]                                       ;; 06:56d0 $7e
    bit  7, A                                          ;; 06:56d1 $cb $7f
    jr   Z, .jr_06_56d9                                ;; 06:56d3 $28 $04
    ld   HL, wD3E6                                     ;; 06:56d5 $21 $e6 $d3
    inc  [HL]                                          ;; 06:56d8 $34
.jr_06_56d9:
    and  A, $1f                                        ;; 06:56d9 $e6 $1f
    ld   E, A                                          ;; 06:56db $5f
    add  A, A                                          ;; 06:56dc $87
    add  A, E                                          ;; 06:56dd $83
    ld   E, A                                          ;; 06:56de $5f
    ld   D, $00                                        ;; 06:56df $16 $00
    ld   HL, data_06_72c4                              ;; 06:56e1 $21 $c4 $72
    add  HL, DE                                        ;; 06:56e4 $19
    push HL                                            ;; 06:56e5 $e5
    pop  BC                                            ;; 06:56e6 $c1
    pop  HL                                            ;; 06:56e7 $e1
    call call_06_56ee                                  ;; 06:56e8 $cd $ee $56
    call call_06_56ee                                  ;; 06:56eb $cd $ee $56

call_06_56ee:
    push BC                                            ;; 06:56ee $c5
    push HL                                            ;; 06:56ef $e5
    ld   A, [BC]                                       ;; 06:56f0 $0a
    ld   D, A                                          ;; 06:56f1 $57
    and  A, $0f                                        ;; 06:56f2 $e6 $0f
    ld   E, A                                          ;; 06:56f4 $5f
    ld   A, D                                          ;; 06:56f5 $7a
    swap A                                             ;; 06:56f6 $cb $37
    and  A, $0f                                        ;; 06:56f8 $e6 $0f
    call call_00_016b                                  ;; 06:56fa $cd $6b $01
    ld   D, A                                          ;; 06:56fd $57
    ld   A, [HL+]                                      ;; 06:56fe $2a
    ld   E, A                                          ;; 06:56ff $5f
    call call_06_5708                                  ;; 06:5700 $cd $08 $57
    pop  HL                                            ;; 06:5703 $e1
    pop  BC                                            ;; 06:5704 $c1
    inc  BC                                            ;; 06:5705 $03
    inc  HL                                            ;; 06:5706 $23
    ret                                                ;; 06:5707 $c9

call_06_5708:
    ld   A, D                                          ;; 06:5708 $7a
    cp   A, $00                                        ;; 06:5709 $fe $00
    ret  Z                                             ;; 06:570b $c8
.jr_06_570c:
    call call_06_5713                                  ;; 06:570c $cd $13 $57
    dec  D                                             ;; 06:570f $15
    jr   NZ, .jr_06_570c                               ;; 06:5710 $20 $fa
    ret                                                ;; 06:5712 $c9

call_06_5713:
    push DE                                            ;; 06:5713 $d5
    push HL                                            ;; 06:5714 $e5
    push BC                                            ;; 06:5715 $c5
    push DE                                            ;; 06:5716 $d5
    ld   D, $00                                        ;; 06:5717 $16 $00
    push DE                                            ;; 06:5719 $d5
    pop  HL                                            ;; 06:571a $e1
    call call_06_5c22                                  ;; 06:571b $cd $22 $5c
    add  HL, DE                                        ;; 06:571e $19
    ld   DE, data_06_6ae8                              ;; 06:571f $11 $e8 $6a
    add  HL, DE                                        ;; 06:5722 $19
    push HL                                            ;; 06:5723 $e5
    pop  BC                                            ;; 06:5724 $c1
    ld   A, [wD3E7]                                    ;; 06:5725 $fa $e7 $d3
    ld   L, $00                                        ;; 06:5728 $2e $00
    rst  rst_00_0038                                   ;; 06:572a $ff
    pop  DE                                            ;; 06:572b $d1
    ld   A, [BC]                                       ;; 06:572c $0a
    inc  BC                                            ;; 06:572d $03
    ld   [HL+], A                                      ;; 06:572e $22
    push HL                                            ;; 06:572f $e5
    push BC                                            ;; 06:5730 $c5
    push HL                                            ;; 06:5731 $e5
    push BC                                            ;; 06:5732 $c5
    ld   BC, $1e                                       ;; 06:5733 $01 $1e $00
    add  HL, BC                                        ;; 06:5736 $09
    ld   [HL], E                                       ;; 06:5737 $73
    pop  BC                                            ;; 06:5738 $c1
    pop  HL                                            ;; 06:5739 $e1
    push HL                                            ;; 06:573a $e5
    ld   HL, data_06_71f0                              ;; 06:573b $21 $f0 $71
    ld   A, E                                          ;; 06:573e $7b
    srl  A                                             ;; 06:573f $cb $3f
    call call_06_7f62                                  ;; 06:5741 $cd $62 $7f
    bit  0, E                                          ;; 06:5744 $cb $43
    jr   NZ, .jr_06_574a                               ;; 06:5746 $20 $02
    swap A                                             ;; 06:5748 $cb $37
.jr_06_574a:
    and  A, $0f                                        ;; 06:574a $e6 $0f
    pop  DE                                            ;; 06:574c $d1
    ld   [DE], A                                       ;; 06:574d $12
    pop  BC                                            ;; 06:574e $c1
    pop  HL                                            ;; 06:574f $e1
    inc  HL                                            ;; 06:5750 $23
    sub  A, A                                          ;; 06:5751 $97
    ld   [HL+], A                                      ;; 06:5752 $22
    ld   A, [BC]                                       ;; 06:5753 $0a
    inc  BC                                            ;; 06:5754 $03
    call call_06_57fa                                  ;; 06:5755 $cd $fa $57
    ld   A, E                                          ;; 06:5758 $7b
    ld   [HL+], A                                      ;; 06:5759 $22
    ld   A, D                                          ;; 06:575a $7a
    ld   [HL+], A                                      ;; 06:575b $22
    ld   A, E                                          ;; 06:575c $7b
    ld   [HL+], A                                      ;; 06:575d $22
    ld   A, D                                          ;; 06:575e $7a
    ld   [HL+], A                                      ;; 06:575f $22
    ld   A, [BC]                                       ;; 06:5760 $0a
    inc  BC                                            ;; 06:5761 $03
    ld   [HL+], A                                      ;; 06:5762 $22
    ld   A, [BC]                                       ;; 06:5763 $0a
    inc  BC                                            ;; 06:5764 $03
    ld   [HL+], A                                      ;; 06:5765 $22
    ld   A, [BC]                                       ;; 06:5766 $0a
    inc  BC                                            ;; 06:5767 $03
    ld   [HL+], A                                      ;; 06:5768 $22
    ld   A, [BC]                                       ;; 06:5769 $0a
    inc  BC                                            ;; 06:576a $03
    ld   [HL+], A                                      ;; 06:576b $22
    push BC                                            ;; 06:576c $c5
    push HL                                            ;; 06:576d $e5
    inc  HL                                            ;; 06:576e $23
    inc  HL                                            ;; 06:576f $23
    inc  HL                                            ;; 06:5770 $23
    inc  BC                                            ;; 06:5771 $03
    ld   A, [BC]                                       ;; 06:5772 $0a
    inc  BC                                            ;; 06:5773 $03
    ld   E, A                                          ;; 06:5774 $5f
    ld   A, [BC]                                       ;; 06:5775 $0a
    ld   D, A                                          ;; 06:5776 $57
    dec  BC                                            ;; 06:5777 $0b
    dec  BC                                            ;; 06:5778 $0b
    dec  BC                                            ;; 06:5779 $0b
    dec  BC                                            ;; 06:577a $0b
    dec  BC                                            ;; 06:577b $0b
    dec  BC                                            ;; 06:577c $0b
    dec  BC                                            ;; 06:577d $0b
    dec  BC                                            ;; 06:577e $0b
    ld   A, [BC]                                       ;; 06:577f $0a
    rra                                                ;; 06:5780 $1f
    rra                                                ;; 06:5781 $1f
    rra                                                ;; 06:5782 $1f
    and  A, $07                                        ;; 06:5783 $e6 $07
    inc  A                                             ;; 06:5785 $3c
    ldh  [hFFB6], A                                    ;; 06:5786 $e0 $b6
    sub  A, A                                          ;; 06:5788 $97
    ldh  [hFFB7], A                                    ;; 06:5789 $e0 $b7
    ldh  [hFFB8], A                                    ;; 06:578b $e0 $b8
.jr_06_578d:
    call call_06_57b6                                  ;; 06:578d $cd $b6 $57
    inc  DE                                            ;; 06:5790 $13
    inc  HL                                            ;; 06:5791 $23
    ldh  A, [hFFB6]                                    ;; 06:5792 $f0 $b6
    dec  A                                             ;; 06:5794 $3d
    ldh  [hFFB6], A                                    ;; 06:5795 $e0 $b6
    jr   NZ, .jr_06_578d                               ;; 06:5797 $20 $f4
    pop  HL                                            ;; 06:5799 $e1
    pop  BC                                            ;; 06:579a $c1
    ldh  A, [hFFB7]                                    ;; 06:579b $f0 $b7
    ld   [HL+], A                                      ;; 06:579d $22
    ldh  A, [hFFB8]                                    ;; 06:579e $f0 $b8
    ld   [HL+], A                                      ;; 06:57a0 $22
    ld   A, [BC]                                       ;; 06:57a1 $0a
    swap A                                             ;; 06:57a2 $cb $37
    and  A, $0f                                        ;; 06:57a4 $e6 $0f
    push HL                                            ;; 06:57a6 $e5
    ld   E, A                                          ;; 06:57a7 $5f
    ld   D, $00                                        ;; 06:57a8 $16 $00
    add  HL, DE                                        ;; 06:57aa $19
    ld   A, [HL]                                       ;; 06:57ab $7e
    pop  HL                                            ;; 06:57ac $e1
    ld   [HL], A                                       ;; 06:57ad $77
    ld   HL, wD3E7                                     ;; 06:57ae $21 $e7 $d3
    inc  [HL]                                          ;; 06:57b1 $34
    pop  BC                                            ;; 06:57b2 $c1
    pop  HL                                            ;; 06:57b3 $e1
    pop  DE                                            ;; 06:57b4 $d1
    ret                                                ;; 06:57b5 $c9

call_06_57b6:
    push BC                                            ;; 06:57b6 $c5
    push DE                                            ;; 06:57b7 $d5
    push HL                                            ;; 06:57b8 $e5
    ld   A, [DE]                                       ;; 06:57b9 $1a
    ld   [HL], A                                       ;; 06:57ba $77
    ld   DE, $08                                       ;; 06:57bb $11 $08 $00
    add  HL, DE                                        ;; 06:57be $19
    cp   A, $fe                                        ;; 06:57bf $fe $fe
    jr   NC, .jr_06_57f6                               ;; 06:57c1 $30 $33
    ld   D, A                                          ;; 06:57c3 $57
    ld   E, $00                                        ;; 06:57c4 $1e $00
    call call_06_5bf2                                  ;; 06:57c6 $cd $f2 $5b
    bit  6, A                                          ;; 06:57c9 $cb $77
    jr   Z, .jr_06_57d9                                ;; 06:57cb $28 $0c
    ld   A, D                                          ;; 06:57cd $7a
    ld   E, $05                                        ;; 06:57ce $1e $05
    call call_06_5bf2                                  ;; 06:57d0 $cd $f2 $5b
    ld   E, A                                          ;; 06:57d3 $5f
    ldh  A, [hFFB7]                                    ;; 06:57d4 $f0 $b7
    or   A, E                                          ;; 06:57d6 $b3
    ldh  [hFFB7], A                                    ;; 06:57d7 $e0 $b7
.jr_06_57d9:
    ld   A, D                                          ;; 06:57d9 $7a
    ld   E, $00                                        ;; 06:57da $1e $00
    call call_06_5bf2                                  ;; 06:57dc $cd $f2 $5b
    bit  7, A                                          ;; 06:57df $cb $7f
    jr   Z, .jr_06_57ef                                ;; 06:57e1 $28 $0c
    ld   A, D                                          ;; 06:57e3 $7a
    ld   E, $05                                        ;; 06:57e4 $1e $05
    call call_06_5bf2                                  ;; 06:57e6 $cd $f2 $5b
    ld   E, A                                          ;; 06:57e9 $5f
    ldh  A, [hFFB8]                                    ;; 06:57ea $f0 $b8
    or   A, E                                          ;; 06:57ec $b3
    ldh  [hFFB8], A                                    ;; 06:57ed $e0 $b8
.jr_06_57ef:
    ld   E, $03                                        ;; 06:57ef $1e $03
    ld   A, D                                          ;; 06:57f1 $7a
    call call_06_5bf2                                  ;; 06:57f2 $cd $f2 $5b
    ld   [HL], A                                       ;; 06:57f5 $77
.jr_06_57f6:
    pop  HL                                            ;; 06:57f6 $e1
    pop  DE                                            ;; 06:57f7 $d1
    pop  BC                                            ;; 06:57f8 $c1
    ret                                                ;; 06:57f9 $c9

call_06_57fa:
    push HL                                            ;; 06:57fa $e5
    add  A, A                                          ;; 06:57fb $87
    ld   L, A                                          ;; 06:57fc $6f
    ld   H, $00                                        ;; 06:57fd $26 $00
    ld   DE, data_06_7254                              ;; 06:57ff $11 $54 $72
    add  HL, DE                                        ;; 06:5802 $19
    ld   E, [HL]                                       ;; 06:5803 $5e
    inc  HL                                            ;; 06:5804 $23
    ld   A, [HL]                                       ;; 06:5805 $7e
    ld   D, A                                          ;; 06:5806 $57
    push DE                                            ;; 06:5807 $d5
    pop  HL                                            ;; 06:5808 $e1
    cp   A, $10                                        ;; 06:5809 $fe $10
    jr   NC, .jr_06_581b                               ;; 06:580b $30 $0e
    swap A                                             ;; 06:580d $cb $37
    and  A, $f0                                        ;; 06:580f $e6 $f0
    ld   D, A                                          ;; 06:5811 $57
    ld   A, E                                          ;; 06:5812 $7b
    swap A                                             ;; 06:5813 $cb $37
    and  A, $0f                                        ;; 06:5815 $e6 $0f
    or   A, D                                          ;; 06:5817 $b2
    ld   E, A                                          ;; 06:5818 $5f
    jr   .jr_06_581d                                   ;; 06:5819 $18 $02
.jr_06_581b:
    ld   E, $ff                                        ;; 06:581b $1e $ff
.jr_06_581d:
    sub  A, A                                          ;; 06:581d $97
    call call_00_016b                                  ;; 06:581e $cd $6b $01
    cpl                                                ;; 06:5821 $2f
    ld   E, A                                          ;; 06:5822 $5f
    ld   D, $ff                                        ;; 06:5823 $16 $ff
    inc  DE                                            ;; 06:5825 $13
    add  HL, DE                                        ;; 06:5826 $19
    push HL                                            ;; 06:5827 $e5
    pop  DE                                            ;; 06:5828 $d1
    pop  HL                                            ;; 06:5829 $e1
    ret                                                ;; 06:582a $c9

call_06_582b:
    sub  A, A                                          ;; 06:582b $97
.jp_06_582c:
    ld   [wD4A8], A                                    ;; 06:582c $ea $a8 $d4
.jr_06_582f:
    ld   A, [wD4A8]                                    ;; 06:582f $fa $a8 $d4
    call call_06_5c61                                  ;; 06:5832 $cd $61 $5c
    jp   Z, .jp_06_58cc                                ;; 06:5835 $ca $cc $58
    inc  HL                                            ;; 06:5838 $23
    inc  HL                                            ;; 06:5839 $23
    ld   A, [HL]                                       ;; 06:583a $7e
    and  A, $03                                        ;; 06:583b $e6 $03
    jp   NZ, .jp_06_58cc                               ;; 06:583d $c2 $cc $58
    bit  7, [HL]                                       ;; 06:5840 $cb $7e
    jp   NZ, .jp_06_58d6                               ;; 06:5842 $c2 $d6 $58
    bit  6, [HL]                                       ;; 06:5845 $cb $76
    jp   NZ, .jp_06_58dc                               ;; 06:5847 $c2 $dc $58
    ldh  A, [hFFBD]                                    ;; 06:584a $f0 $bd
    cp   A, $01                                        ;; 06:584c $fe $01
    jr   NZ, .jr_06_5855                               ;; 06:584e $20 $05
    call call_06_5daf                                  ;; 06:5850 $cd $af $5d
    jr   .jr_06_58b8                                   ;; 06:5853 $18 $63
.jr_06_5855:
    call call_06_5a37                                  ;; 06:5855 $cd $37 $5a
    jr   Z, .jr_06_58b8                                ;; 06:5858 $28 $5e
    ld   A, [wD4A8]                                    ;; 06:585a $fa $a8 $d4
    ld   C, A                                          ;; 06:585d $4f
    ld   B, $00                                        ;; 06:585e $06 $00
    push HL                                            ;; 06:5860 $e5
    ld   HL, wD48D                                     ;; 06:5861 $21 $8d $d4
    add  HL, BC                                        ;; 06:5864 $09
    push HL                                            ;; 06:5865 $e5
    pop  BC                                            ;; 06:5866 $c1
    pop  HL                                            ;; 06:5867 $e1
    ld   A, [BC]                                       ;; 06:5868 $0a
    push AF                                            ;; 06:5869 $f5
    inc  A                                             ;; 06:586a $3c
    and  A, $07                                        ;; 06:586b $e6 $07
    ld   [BC], A                                       ;; 06:586d $02
    pop  AF                                            ;; 06:586e $f1
    add  A, $0c                                        ;; 06:586f $c6 $0c
    call call_06_7f62                                  ;; 06:5871 $cd $62 $7f
    ld   A, L                                          ;; 06:5874 $7d
    ldh  [hFFB9], A                                    ;; 06:5875 $e0 $b9
    ld   A, H                                          ;; 06:5877 $7c
    ldh  [hFFBA], A                                    ;; 06:5878 $e0 $ba
    ld   A, [HL]                                       ;; 06:587a $7e
    cp   A, $ff                                        ;; 06:587b $fe $ff
    jr   NZ, .jr_06_5888                               ;; 06:587d $20 $09
    push HL                                            ;; 06:587f $e5
    ldh  A, [hFFB9]                                    ;; 06:5880 $f0 $b9
    ld   L, A                                          ;; 06:5882 $6f
    ldh  A, [hFFBA]                                    ;; 06:5883 $f0 $ba
    ld   H, A                                          ;; 06:5885 $67
    ld   A, [HL]                                       ;; 06:5886 $7e
    pop  HL                                            ;; 06:5887 $e1
.jr_06_5888:
    cp   A, $fe                                        ;; 06:5888 $fe $fe
    jr   NZ, .jr_06_5890                               ;; 06:588a $20 $04
    sub  A, A                                          ;; 06:588c $97
    ld   [BC], A                                       ;; 06:588d $02
    jr   .jr_06_582f                                   ;; 06:588e $18 $9f
.jr_06_5890:
    ldh  [hFFB6], A                                    ;; 06:5890 $e0 $b6
    ld   E, $00                                        ;; 06:5892 $1e $00
    call call_06_5bf2                                  ;; 06:5894 $cd $f2 $5b
    bit  0, A                                          ;; 06:5897 $cb $47
    jr   Z, .jr_06_582f                                ;; 06:5899 $28 $94
    ld   E, $01                                        ;; 06:589b $1e $01
    call call_06_5cf5                                  ;; 06:589d $cd $f5 $5c
    cp   A, $00                                        ;; 06:58a0 $fe $00
    jr   Z, .jr_06_582f                                ;; 06:58a2 $28 $8b
    push HL                                            ;; 06:58a4 $e5
    ld   DE, $08                                       ;; 06:58a5 $11 $08 $00
    add  HL, DE                                        ;; 06:58a8 $19
    ld   A, [HL]                                       ;; 06:58a9 $7e
    cp   A, $fe                                        ;; 06:58aa $fe $fe
    jr   Z, .jr_06_58b7                                ;; 06:58ac $28 $09
    dec  [HL]                                          ;; 06:58ae $35
    jr   NZ, .jr_06_58b7                               ;; 06:58af $20 $06
    call call_06_7f7e                                  ;; 06:58b1 $cd $7e $7f
    ld   A, $ff                                        ;; 06:58b4 $3e $ff
    ld   [HL], A                                       ;; 06:58b6 $77
.jr_06_58b7:
    pop  HL                                            ;; 06:58b7 $e1
.jr_06_58b8:
    ld   A, [wD4A8]                                    ;; 06:58b8 $fa $a8 $d4
    add  A, $04                                        ;; 06:58bb $c6 $04
    add  A, A                                          ;; 06:58bd $87
    add  A, A                                          ;; 06:58be $87
    ld   E, A                                          ;; 06:58bf $5f
    ld   D, $00                                        ;; 06:58c0 $16 $00
    ld   HL, wD3EF                                     ;; 06:58c2 $21 $ef $d3
    add  HL, DE                                        ;; 06:58c5 $19
    ldh  A, [hFFB6]                                    ;; 06:58c6 $f0 $b6
    ld   [HL+], A                                      ;; 06:58c8 $22
    call call_06_58e2                                  ;; 06:58c9 $cd $e2 $58
.jp_06_58cc:
    ld   A, [wD4A8]                                    ;; 06:58cc $fa $a8 $d4
    inc  A                                             ;; 06:58cf $3c
    cp   A, $1b                                        ;; 06:58d0 $fe $1b
    jp   NZ, .jp_06_582c                               ;; 06:58d2 $c2 $2c $58
    ret                                                ;; 06:58d5 $c9
.jp_06_58d6:
    ld   A, $fd                                        ;; 06:58d6 $3e $fd
    ldh  [hFFB6], A                                    ;; 06:58d8 $e0 $b6
    jr   .jr_06_58b8                                   ;; 06:58da $18 $dc
.jp_06_58dc:
    ld   A, $fe                                        ;; 06:58dc $3e $fe
    ldh  [hFFB6], A                                    ;; 06:58de $e0 $b6
    jr   .jr_06_58b8                                   ;; 06:58e0 $18 $d6

call_06_58e2:
    ldh  A, [hFFB6]                                    ;; 06:58e2 $f0 $b6
    cp   A, $fd                                        ;; 06:58e4 $fe $fd
    ret  NC                                            ;; 06:58e6 $d0
    push HL                                            ;; 06:58e7 $e5
    ld   E, $01                                        ;; 06:58e8 $1e $01
    call call_06_5bf2                                  ;; 06:58ea $cd $f2 $5b
    ld   C, A                                          ;; 06:58ed $4f
    ld   A, [wD4A8]                                    ;; 06:58ee $fa $a8 $d4
    call call_06_5c61                                  ;; 06:58f1 $cd $61 $5c
    bit  5, A                                          ;; 06:58f4 $cb $6f
    jp   NZ, jp_06_5993                                ;; 06:58f6 $c2 $93 $59
    ld   A, C                                          ;; 06:58f9 $79
    swap A                                             ;; 06:58fa $cb $37
    srl  A                                             ;; 06:58fc $cb $3f
    and  A, $07                                        ;; 06:58fe $e6 $07
    pop  HL                                            ;; 06:5900 $e1
    cp   A, $00                                        ;; 06:5901 $fe $00
    jr   Z, jp_06_591b                                 ;; 06:5903 $28 $16
    cp   A, $04                                        ;; 06:5905 $fe $04
    jr   Z, jr_06_5937                                 ;; 06:5907 $28 $2e
    cp   A, $05                                        ;; 06:5909 $fe $05
    jr   Z, jr_06_5952                                 ;; 06:590b $28 $45
    cp   A, $02                                        ;; 06:590d $fe $02
    jr   Z, jp_06_5916                                 ;; 06:590f $28 $05

jp_06_5911:
    inc  HL                                            ;; 06:5911 $23
    ld   A, $02                                        ;; 06:5912 $3e $02
    ld   [HL], A                                       ;; 06:5914 $77
    ret                                                ;; 06:5915 $c9

jp_06_5916:
    inc  HL                                            ;; 06:5916 $23
    ld   A, $22                                        ;; 06:5917 $3e $22
    ld   [HL], A                                       ;; 06:5919 $77
    ret                                                ;; 06:591a $c9

jp_06_591b:
    push HL                                            ;; 06:591b $e5
.jr_06_591c:
    ld   E, $1a                                        ;; 06:591c $1e $1a
    call call_06_5cf5                                  ;; 06:591e $cd $f5 $5c
    ld   E, A                                          ;; 06:5921 $5f
    call call_06_5c61                                  ;; 06:5922 $cd $61 $5c
    jr   Z, .jr_06_591c                                ;; 06:5925 $28 $f5
    inc  HL                                            ;; 06:5927 $23
    inc  HL                                            ;; 06:5928 $23
    ld   A, [HL]                                       ;; 06:5929 $7e
    and  A, $03                                        ;; 06:592a $e6 $03
    jr   NZ, .jr_06_591c                               ;; 06:592c $20 $ee
    ld   A, E                                          ;; 06:592e $7b
    pop  HL                                            ;; 06:592f $e1
    add  A, $04                                        ;; 06:5930 $c6 $04
    ld   [HL+], A                                      ;; 06:5932 $22
    ld   A, $10                                        ;; 06:5933 $3e $10
    ld   [HL], A                                       ;; 06:5935 $77
    ret                                                ;; 06:5936 $c9

jr_06_5937:
    push HL                                            ;; 06:5937 $e5
.jr_06_5938:
    sub  A, A                                          ;; 06:5938 $97
    ld   E, $03                                        ;; 06:5939 $1e $03
    call call_00_016b                                  ;; 06:593b $cd $6b $01
    ld   E, A                                          ;; 06:593e $5f
    call call_06_5c63                                  ;; 06:593f $cd $63 $5c
    jr   Z, .jr_06_5938                                ;; 06:5942 $28 $f4
    inc  HL                                            ;; 06:5944 $23
    inc  HL                                            ;; 06:5945 $23
    ld   A, [HL]                                       ;; 06:5946 $7e
    and  A, $03                                        ;; 06:5947 $e6 $03
    jr   NZ, .jr_06_5938                               ;; 06:5949 $20 $ed
    ld   A, E                                          ;; 06:594b $7b
    pop  HL                                            ;; 06:594c $e1
    ld   [HL+], A                                      ;; 06:594d $22
    ld   A, $01                                        ;; 06:594e $3e $01
    ld   [HL], A                                       ;; 06:5950 $77
    ret                                                ;; 06:5951 $c9

jr_06_5952:
    push HL                                            ;; 06:5952 $e5
.jr_06_5953:
    ld   C, $00                                        ;; 06:5953 $0e $00
    ld   E, $01                                        ;; 06:5955 $1e $01
    call call_06_597d                                  ;; 06:5957 $cd $7d $59
    jr   Z, .jr_06_5976                                ;; 06:595a $28 $1a
    inc  C                                             ;; 06:595c $0c
    ld   E, $02                                        ;; 06:595d $1e $02
    call call_06_597d                                  ;; 06:595f $cd $7d $59
    jr   Z, .jr_06_5976                                ;; 06:5962 $28 $12
    inc  C                                             ;; 06:5964 $0c
    ld   E, $02                                        ;; 06:5965 $1e $02
    call call_06_597d                                  ;; 06:5967 $cd $7d $59
    jr   Z, .jr_06_5976                                ;; 06:596a $28 $0a
    inc  C                                             ;; 06:596c $0c
    ld   E, $03                                        ;; 06:596d $1e $03
    call call_06_597d                                  ;; 06:596f $cd $7d $59
    jr   Z, .jr_06_5976                                ;; 06:5972 $28 $02
    jr   .jr_06_5953                                   ;; 06:5974 $18 $dd
.jr_06_5976:
    pop  HL                                            ;; 06:5976 $e1
    ld   A, C                                          ;; 06:5977 $79
    ld   [HL+], A                                      ;; 06:5978 $22
    ld   A, $01                                        ;; 06:5979 $3e $01
    ld   [HL], A                                       ;; 06:597b $77
    ret                                                ;; 06:597c $c9

call_06_597d:
    sub  A, A                                          ;; 06:597d $97
    call call_00_016b                                  ;; 06:597e $cd $6b $01
    cp   A, $00                                        ;; 06:5981 $fe $00
    ret  NZ                                            ;; 06:5983 $c0
    ld   A, C                                          ;; 06:5984 $79
    call call_06_5c63                                  ;; 06:5985 $cd $63 $5c
    jr   Z, .jr_06_5990                                ;; 06:5988 $28 $06
    inc  HL                                            ;; 06:598a $23
    inc  HL                                            ;; 06:598b $23
    ld   A, [HL]                                       ;; 06:598c $7e
    and  A, $03                                        ;; 06:598d $e6 $03
    ret                                                ;; 06:598f $c9
.jr_06_5990:
    or   A, $ff                                        ;; 06:5990 $f6 $ff
    ret                                                ;; 06:5992 $c9

jp_06_5993:
    ld   A, C                                          ;; 06:5993 $79
    swap A                                             ;; 06:5994 $cb $37
    srl  A                                             ;; 06:5996 $cb $3f
    and  A, $03                                        ;; 06:5998 $e6 $03
    pop  HL                                            ;; 06:599a $e1
    cp   A, $00                                        ;; 06:599b $fe $00
    jr   Z, jr_06_5937                                 ;; 06:599d $28 $98
    cp   A, $02                                        ;; 06:599f $fe $02
    jp   Z, jp_06_591b                                 ;; 06:59a1 $ca $1b $59
    cp   A, $01                                        ;; 06:59a4 $fe $01
    jp   Z, jp_06_5911                                 ;; 06:59a6 $ca $11 $59
    jp   jp_06_5916                                    ;; 06:59a9 $c3 $16 $59

call_06_59ac:
    ld   C, $32                                        ;; 06:59ac $0e $32
.jr_06_59ae:
    ld   A, [wD3E7]                                    ;; 06:59ae $fa $e7 $d3
    dec  A                                             ;; 06:59b1 $3d
    ld   E, A                                          ;; 06:59b2 $5f
    call call_06_5cf5                                  ;; 06:59b3 $cd $f5 $5c
    ld   B, A                                          ;; 06:59b6 $47
    ld   A, [wD3E7]                                    ;; 06:59b7 $fa $e7 $d3
    dec  A                                             ;; 06:59ba $3d
    ld   E, A                                          ;; 06:59bb $5f
    call call_06_5cf5                                  ;; 06:59bc $cd $f5 $5c
    call call_06_5a1c                                  ;; 06:59bf $cd $1c $5a
    push HL                                            ;; 06:59c2 $e5
    pop  DE                                            ;; 06:59c3 $d1
    ld   A, B                                          ;; 06:59c4 $78
    call call_06_5a1c                                  ;; 06:59c5 $cd $1c $5a
    call call_06_5a28                                  ;; 06:59c8 $cd $28 $5a
    dec  C                                             ;; 06:59cb $0d
    jr   NZ, .jr_06_59ae                               ;; 06:59cc $20 $e0
    ld   A, [wD3E7]                                    ;; 06:59ce $fa $e7 $d3
    srl  A                                             ;; 06:59d1 $cb $3f
    srl  A                                             ;; 06:59d3 $cb $3f
    ld   C, A                                          ;; 06:59d5 $4f
.jr_06_59d6:
    call call_06_59dd                                  ;; 06:59d6 $cd $dd $59
    dec  C                                             ;; 06:59d9 $0d
    jr   NZ, .jr_06_59d6                               ;; 06:59da $20 $fa
    ret                                                ;; 06:59dc $c9

call_06_59dd:
    push BC                                            ;; 06:59dd $c5
    ld   A, $1e                                        ;; 06:59de $3e $1e
    ldh  [hFFB7], A                                    ;; 06:59e0 $e0 $b7
    ld   BC, wD3F2                                     ;; 06:59e2 $01 $f2 $d3
.jr_06_59e5:
    ld   A, [BC]                                       ;; 06:59e5 $0a
    call call_06_5c63                                  ;; 06:59e6 $cd $63 $5c
    jr   Z, .jr_06_5a13                                ;; 06:59e9 $28 $28
    ld   DE, $09                                       ;; 06:59eb $11 $09 $00
    add  HL, DE                                        ;; 06:59ee $19
    push HL                                            ;; 06:59ef $e5
    pop  DE                                            ;; 06:59f0 $d1
    inc  BC                                            ;; 06:59f1 $03
    inc  BC                                            ;; 06:59f2 $03
    inc  BC                                            ;; 06:59f3 $03
    inc  BC                                            ;; 06:59f4 $03
    ld   A, [BC]                                       ;; 06:59f5 $0a
    call call_06_5c63                                  ;; 06:59f6 $cd $63 $5c
    jr   Z, .jr_06_5a13                                ;; 06:59f9 $28 $18
    ld   A, [DE]                                       ;; 06:59fb $1a
    ld   DE, $09                                       ;; 06:59fc $11 $09 $00
    add  HL, DE                                        ;; 06:59ff $19
    cp   A, [HL]                                       ;; 06:5a00 $be
    jr   NC, .jr_06_5a13                               ;; 06:5a01 $30 $10
    push BC                                            ;; 06:5a03 $c5
    dec  BC                                            ;; 06:5a04 $0b
    dec  BC                                            ;; 06:5a05 $0b
    dec  BC                                            ;; 06:5a06 $0b
    push BC                                            ;; 06:5a07 $c5
    pop  HL                                            ;; 06:5a08 $e1
    dec  BC                                            ;; 06:5a09 $0b
    dec  BC                                            ;; 06:5a0a $0b
    dec  BC                                            ;; 06:5a0b $0b
    dec  BC                                            ;; 06:5a0c $0b
    push BC                                            ;; 06:5a0d $c5
    pop  DE                                            ;; 06:5a0e $d1
    call call_06_5a28                                  ;; 06:5a0f $cd $28 $5a
    pop  BC                                            ;; 06:5a12 $c1
.jr_06_5a13:
    ldh  A, [hFFB7]                                    ;; 06:5a13 $f0 $b7
    dec  A                                             ;; 06:5a15 $3d
    ldh  [hFFB7], A                                    ;; 06:5a16 $e0 $b7
    jr   NZ, .jr_06_59e5                               ;; 06:5a18 $20 $cb
    pop  BC                                            ;; 06:5a1a $c1
    ret                                                ;; 06:5a1b $c9

call_06_5a1c:
    push DE                                            ;; 06:5a1c $d5
    add  A, A                                          ;; 06:5a1d $87
    add  A, A                                          ;; 06:5a1e $87
    ld   E, A                                          ;; 06:5a1f $5f
    ld   D, $00                                        ;; 06:5a20 $16 $00
    ld   HL, wD3EF                                     ;; 06:5a22 $21 $ef $d3
    add  HL, DE                                        ;; 06:5a25 $19
    pop  DE                                            ;; 06:5a26 $d1
    ret                                                ;; 06:5a27 $c9

call_06_5a28:
    push BC                                            ;; 06:5a28 $c5
    ld   C, $04                                        ;; 06:5a29 $0e $04
.jr_06_5a2b:
    ld   A, [HL]                                       ;; 06:5a2b $7e
    ld   B, A                                          ;; 06:5a2c $47
    ld   A, [DE]                                       ;; 06:5a2d $1a
    ld   [HL+], A                                      ;; 06:5a2e $22
    ld   A, B                                          ;; 06:5a2f $78
    ld   [DE], A                                       ;; 06:5a30 $12
    inc  DE                                            ;; 06:5a31 $13
    dec  C                                             ;; 06:5a32 $0d
    jr   NZ, .jr_06_5a2b                               ;; 06:5a33 $20 $f6
    pop  BC                                            ;; 06:5a35 $c1
    ret                                                ;; 06:5a36 $c9

call_06_5a37:
    push HL                                            ;; 06:5a37 $e5
    ld   A, $0c                                        ;; 06:5a38 $3e $0c
    call call_06_7f62                                  ;; 06:5a3a $cd $62 $7f
    ld   C, $08                                        ;; 06:5a3d $0e $08
    ld   B, $00                                        ;; 06:5a3f $06 $00
.jr_06_5a41:
    ld   A, [HL]                                       ;; 06:5a41 $7e
    cp   A, $fe                                        ;; 06:5a42 $fe $fe
    jr   NC, .jr_06_5a51                               ;; 06:5a44 $30 $0b
    push HL                                            ;; 06:5a46 $e5
    ld   E, $00                                        ;; 06:5a47 $1e $00
    call call_06_5bf2                                  ;; 06:5a49 $cd $f2 $5b
    pop  HL                                            ;; 06:5a4c $e1
    bit  0, A                                          ;; 06:5a4d $cb $47
    jr   NZ, .jr_06_5a54                               ;; 06:5a4f $20 $03
.jr_06_5a51:
    inc  B                                             ;; 06:5a51 $04
    jr   .jr_06_5a64                                   ;; 06:5a52 $18 $10
.jr_06_5a54:
    push HL                                            ;; 06:5a54 $e5
    ld   A, $08                                        ;; 06:5a55 $3e $08
    call call_06_7f62                                  ;; 06:5a57 $cd $62 $7f
    ld   A, [HL]                                       ;; 06:5a5a $7e
    pop  HL                                            ;; 06:5a5b $e1
    cp   A, $00                                        ;; 06:5a5c $fe $00
    jr   Z, .jr_06_5a51                                ;; 06:5a5e $28 $f1
    cp   A, $ff                                        ;; 06:5a60 $fe $ff
    jr   Z, .jr_06_5a51                                ;; 06:5a62 $28 $ed
.jr_06_5a64:
    inc  HL                                            ;; 06:5a64 $23
    dec  C                                             ;; 06:5a65 $0d
    jr   NZ, .jr_06_5a41                               ;; 06:5a66 $20 $d9
    ld   A, $fc                                        ;; 06:5a68 $3e $fc
    ldh  [hFFB6], A                                    ;; 06:5a6a $e0 $b6
    ld   A, $08                                        ;; 06:5a6c $3e $08
    cp   A, B                                          ;; 06:5a6e $b8
    pop  HL                                            ;; 06:5a6f $e1
    ret                                                ;; 06:5a70 $c9

call_06_5a71:
    push AF                                            ;; 06:5a71 $f5
    push BC                                            ;; 06:5a72 $c5
    push DE                                            ;; 06:5a73 $d5
    push HL                                            ;; 06:5a74 $e5
    push AF                                            ;; 06:5a75 $f5
    ld   A, [wD4AD]                                    ;; 06:5a76 $fa $ad $d4
    cp   A, $00                                        ;; 06:5a79 $fe $00
    call Z, call_06_5e18                               ;; 06:5a7b $cc $18 $5e
    ld   A, $01                                        ;; 06:5a7e $3e $01
    ld   [wD4AD], A                                    ;; 06:5a80 $ea $ad $d4
    pop  AF                                            ;; 06:5a83 $f1
    call call_06_5e0f                                  ;; 06:5a84 $cd $0f $5e
    jp   jp_06_7f7c                                    ;; 06:5a87 $c3 $7c $7f

call_06_5a8a:
    ldh  A, [hFFBC]                                    ;; 06:5a8a $f0 $bc
    cp   A, $01                                        ;; 06:5a8c $fe $01
    ret  Z                                             ;; 06:5a8e $c8
    sub  A, A                                          ;; 06:5a8f $97
    ld   [wD4AD], A                                    ;; 06:5a90 $ea $ad $d4
    call call_06_5e09                                  ;; 06:5a93 $cd $09 $5e
    jr   C, .jr_06_5a99                                ;; 06:5a96 $38 $01
    ret                                                ;; 06:5a98 $c9
.jr_06_5a99:
    ld   A, [wD3E6]                                    ;; 06:5a99 $fa $e6 $d3
    cp   A, $00                                        ;; 06:5a9c $fe $00
    jr   NZ, .jr_06_5aab                               ;; 06:5a9e $20 $0b
    ldh  A, [hFFBC]                                    ;; 06:5aa0 $f0 $bc
    cp   A, $02                                        ;; 06:5aa2 $fe $02
    jr   Z, .jr_06_5ab4                                ;; 06:5aa4 $28 $0e
    call call_06_5ac3                                  ;; 06:5aa6 $cd $c3 $5a
    jr   NC, .jr_06_5ab4                               ;; 06:5aa9 $30 $09
.jr_06_5aab:
    ld   A, $01                                        ;; 06:5aab $3e $01
    ldh  [hFFBC], A                                    ;; 06:5aad $e0 $bc
    ld   A, $46                                        ;; 06:5aaf $3e $46
    jp   call_06_5a71                                  ;; 06:5ab1 $c3 $71 $5a
.jr_06_5ab4:
    ld   A, $00                                        ;; 06:5ab4 $3e $00
    ldh  [hFFB0], A                                    ;; 06:5ab6 $e0 $b0
    ld   A, $4f                                        ;; 06:5ab8 $3e $4f
    call call_06_5a71                                  ;; 06:5aba $cd $71 $5a
    call call_06_51c9                                  ;; 06:5abd $cd $c9 $51
    jp   jp_06_52b2                                    ;; 06:5ac0 $c3 $b2 $52

call_06_5ac3:
    sub  A, A                                          ;; 06:5ac3 $97
    ld   E, $64                                        ;; 06:5ac4 $1e $64
    call call_00_016b                                  ;; 06:5ac6 $cd $6b $01
    cp   A, $32                                        ;; 06:5ac9 $fe $32
    ret                                                ;; 06:5acb $c9

call_06_5acc:
    ld   A, $ff                                        ;; 06:5acc $3e $ff
    ld   C, $00                                        ;; 06:5ace $0e $00
    ld   D, $1f                                        ;; 06:5ad0 $16 $1f
    ld   HL, wD3EF                                     ;; 06:5ad2 $21 $ef $d3
.jr_06_5ad5:
    ld   [HL+], A                                      ;; 06:5ad5 $22
    ld   [HL+], A                                      ;; 06:5ad6 $22
    ld   [HL+], A                                      ;; 06:5ad7 $22
    ld   [HL], C                                       ;; 06:5ad8 $71
    inc  HL                                            ;; 06:5ad9 $23
    inc  C                                             ;; 06:5ada $0c
    dec  D                                             ;; 06:5adb $15
    jr   NZ, .jr_06_5ad5                               ;; 06:5adc $20 $f7
    ldh  A, [hFFBC]                                    ;; 06:5ade $f0 $bc
    cp   A, $01                                        ;; 06:5ae0 $fe $01
    jr   Z, .jr_06_5aef                                ;; 06:5ae2 $28 $0b
    sub  A, A                                          ;; 06:5ae4 $97
    ld   [wD4AD], A                                    ;; 06:5ae5 $ea $ad $d4
    call call_06_5e0c                                  ;; 06:5ae8 $cd $0c $5e
    ret  C                                             ;; 06:5aeb $d8
    call call_06_5af1                                  ;; 06:5aec $cd $f1 $5a
.jr_06_5aef:
    and  A, A                                          ;; 06:5aef $a7
    ret                                                ;; 06:5af0 $c9

call_06_5af1:
    ld   HL, wD3EF                                     ;; 06:5af1 $21 $ef $d3
    ld   B, $0e                                        ;; 06:5af4 $06 $0e
    call call_06_5b0e                                  ;; 06:5af6 $cd $0e $5b
    ld   HL, wD3F3                                     ;; 06:5af9 $21 $f3 $d3
    ld   B, $2e                                        ;; 06:5afc $06 $2e
    call call_06_5b0e                                  ;; 06:5afe $cd $0e $5b
    ld   HL, wD3F7                                     ;; 06:5b01 $21 $f7 $d3
    ld   B, $4e                                        ;; 06:5b04 $06 $4e
    call call_06_5b0e                                  ;; 06:5b06 $cd $0e $5b
    ld   HL, wD3FB                                     ;; 06:5b09 $21 $fb $d3
    ld   B, $6e                                        ;; 06:5b0c $06 $6e

call_06_5b0e:
    push HL                                            ;; 06:5b0e $e5
    inc  HL                                            ;; 06:5b0f $23
    inc  HL                                            ;; 06:5b10 $23
    inc  HL                                            ;; 06:5b11 $23
    ld   A, [HL]                                       ;; 06:5b12 $7e
    ld   D, A                                          ;; 06:5b13 $57
    ld   L, $02                                        ;; 06:5b14 $2e $02
    rst  rst_00_0038                                   ;; 06:5b16 $ff
    pop  HL                                            ;; 06:5b17 $e1
    ld   E, A                                          ;; 06:5b18 $5f
    and  A, $03                                        ;; 06:5b19 $e6 $03
    ret  NZ                                            ;; 06:5b1b $c0
    bit  5, E                                          ;; 06:5b1c $cb $6b
    jr   Z, .jr_06_5b4f                                ;; 06:5b1e $28 $2f
    push HL                                            ;; 06:5b20 $e5
    sub  A, A                                          ;; 06:5b21 $97
    ld   E, $08                                        ;; 06:5b22 $1e $08
    call call_00_016b                                  ;; 06:5b24 $cd $6b $01
    inc  HL                                            ;; 06:5b27 $23
    ld   [HL-], A                                      ;; 06:5b28 $32
    sub  A, A                                          ;; 06:5b29 $97
    ld   E, $07                                        ;; 06:5b2a $1e $07
    call call_00_016b                                  ;; 06:5b2c $cd $6b $01
    ldh  [hFFB7], A                                    ;; 06:5b2f $e0 $b7
    add  A, $16                                        ;; 06:5b31 $c6 $16
    ld   L, A                                          ;; 06:5b33 $6f
    ld   A, D                                          ;; 06:5b34 $7a
    rst  rst_00_0038                                   ;; 06:5b35 $ff
    bit  7, A                                          ;; 06:5b36 $cb $7f
    jr   Z, .jr_06_5b3d                                ;; 06:5b38 $28 $03
    pop  HL                                            ;; 06:5b3a $e1
    jr   .jr_06_5b4c                                   ;; 06:5b3b $18 $0f
.jr_06_5b3d:
    call call_06_7f7e                                  ;; 06:5b3d $cd $7e $7f
    ld   E, $00                                        ;; 06:5b40 $1e $00
    call call_06_5bf2                                  ;; 06:5b42 $cd $f2 $5b
    bit  0, A                                          ;; 06:5b45 $cb $47
    pop  HL                                            ;; 06:5b47 $e1
    ldh  A, [hFFB7]                                    ;; 06:5b48 $f0 $b7
    jr   NZ, .jr_06_5b4e                               ;; 06:5b4a $20 $02
.jr_06_5b4c:
    ld   A, $ff                                        ;; 06:5b4c $3e $ff
.jr_06_5b4e:
    ld   [HL], A                                       ;; 06:5b4e $77
.jr_06_5b4f:
    ld   A, [HL]                                       ;; 06:5b4f $7e
    cp   A, $ff                                        ;; 06:5b50 $fe $ff
    ret  Z                                             ;; 06:5b52 $c8
    push HL                                            ;; 06:5b53 $e5
    ld   HL, wD000                                     ;; 06:5b54 $21 $00 $d0
    add  A, B                                          ;; 06:5b57 $80
    call call_06_7f62                                  ;; 06:5b58 $cd $62 $7f
    ld   [wD4BA], A                                    ;; 06:5b5b $ea $ba $d4
    pop  HL                                            ;; 06:5b5e $e1
    push HL                                            ;; 06:5b5f $e5
    ld   A, [wD4BA]                                    ;; 06:5b60 $fa $ba $d4
    ld   E, $07                                        ;; 06:5b63 $1e $07
    call call_06_5bf2                                  ;; 06:5b65 $cd $f2 $5b
    swap A                                             ;; 06:5b68 $cb $37
    srl  A                                             ;; 06:5b6a $cb $3f
    and  A, $04                                        ;; 06:5b6c $e6 $04
    ld   C, A                                          ;; 06:5b6e $4f
    ld   A, [wD4BA]                                    ;; 06:5b6f $fa $ba $d4
    ld   E, $01                                        ;; 06:5b72 $1e $01
    call call_06_5bf2                                  ;; 06:5b74 $cd $f2 $5b
    swap A                                             ;; 06:5b77 $cb $37
    srl  A                                             ;; 06:5b79 $cb $3f
    srl  A                                             ;; 06:5b7b $cb $3f
    and  A, $03                                        ;; 06:5b7d $e6 $03
    or   A, C                                          ;; 06:5b7f $b1
    ld   E, A                                          ;; 06:5b80 $5f
    ld   D, $00                                        ;; 06:5b81 $16 $00
    push HL                                            ;; 06:5b83 $e5
    ld   HL, data_06_5bcc                              ;; 06:5b84 $21 $cc $5b
    add  HL, DE                                        ;; 06:5b87 $19
    ld   A, [HL]                                       ;; 06:5b88 $7e
    pop  HL                                            ;; 06:5b89 $e1
    inc  HL                                            ;; 06:5b8a $23
    inc  HL                                            ;; 06:5b8b $23
    ld   [HL], A                                       ;; 06:5b8c $77
    pop  HL                                            ;; 06:5b8d $e1
    ret                                                ;; 06:5b8e $c9

call_06_5b8f:
    inc  HL                                            ;; 06:5b8f $23
    ld   A, [HL]                                       ;; 06:5b90 $7e
    cp   A, $04                                        ;; 06:5b91 $fe $04
    jr   C, .jr_06_5bca                                ;; 06:5b93 $38 $35
    sub  A, $04                                        ;; 06:5b95 $d6 $04
    add  A, A                                          ;; 06:5b97 $87
    push HL                                            ;; 06:5b98 $e5
    pop  DE                                            ;; 06:5b99 $d1
    push HL                                            ;; 06:5b9a $e5
    ld   HL, wD3E9                                     ;; 06:5b9b $21 $e9 $d3
    call call_06_7f62                                  ;; 06:5b9e $cd $62 $7f
    ld   B, [HL]                                       ;; 06:5ba1 $46
    pop  HL                                            ;; 06:5ba2 $e1
    ld   C, $04                                        ;; 06:5ba3 $0e $04
.jr_06_5ba5:
    ld   L, $02                                        ;; 06:5ba5 $2e $02
    ld   A, C                                          ;; 06:5ba7 $79
    rst  rst_00_0038                                   ;; 06:5ba8 $ff
    and  A, $03                                        ;; 06:5ba9 $e6 $03
    jr   NZ, .jr_06_5bb5                               ;; 06:5bab $20 $08
    ld   A, $1d                                        ;; 06:5bad $3e $1d
    call call_06_7f62                                  ;; 06:5baf $cd $62 $7f
    cp   A, B                                          ;; 06:5bb2 $b8
    jr   Z, .jr_06_5bc8                                ;; 06:5bb3 $28 $13
.jr_06_5bb5:
    inc  C                                             ;; 06:5bb5 $0c
    ld   A, C                                          ;; 06:5bb6 $79
    cp   A, $1f                                        ;; 06:5bb7 $fe $1f
    jr   NZ, .jr_06_5ba5                               ;; 06:5bb9 $20 $ea
    inc  DE                                            ;; 06:5bbb $13
    ld   A, [DE]                                       ;; 06:5bbc $1a
    and  A, $ee                                        ;; 06:5bbd $e6 $ee
    jr   NZ, .jr_06_5bca                               ;; 06:5bbf $20 $09
    dec  DE                                            ;; 06:5bc1 $1b
    dec  DE                                            ;; 06:5bc2 $1b
    ld   A, $ff                                        ;; 06:5bc3 $3e $ff
    ld   [DE], A                                       ;; 06:5bc5 $12
    scf                                                ;; 06:5bc6 $37
    ret                                                ;; 06:5bc7 $c9
.jr_06_5bc8:
    ld   A, C                                          ;; 06:5bc8 $79
    ld   [DE], A                                       ;; 06:5bc9 $12
.jr_06_5bca:
    and  A, A                                          ;; 06:5bca $a7
    ret                                                ;; 06:5bcb $c9

data_06_5bcc:
    db   $01, $02, $10, $20, $04, $04, $40, $40        ;; 06:5bcc ????????

call_06_5bd4:
    sub  A, A                                          ;; 06:5bd4 $97
    ld   [wD4AD], A                                    ;; 06:5bd5 $ea $ad $d4
    jp   jp_06_5e03                                    ;; 06:5bd8 $c3 $03 $5e

call_06_5bdb:
    push AF                                            ;; 06:5bdb $f5
    push BC                                            ;; 06:5bdc $c5
    push DE                                            ;; 06:5bdd $d5
    push HL                                            ;; 06:5bde $e5
    call call_06_5513                                  ;; 06:5bdf $cd $13 $55
    call call_06_5e12                                  ;; 06:5be2 $cd $12 $5e
    jp   jp_06_7f7c                                    ;; 06:5be5 $c3 $7c $7f

call_06_5be8:
    push AF                                            ;; 06:5be8 $f5
    push BC                                            ;; 06:5be9 $c5
    push DE                                            ;; 06:5bea $d5
    push HL                                            ;; 06:5beb $e5
    call call_06_5e21                                  ;; 06:5bec $cd $21 $5e
    jp   popAll                                        ;; 06:5bef $c3 $13 $00

call_06_5bf2:
    push HL                                            ;; 06:5bf2 $e5
    push DE                                            ;; 06:5bf3 $d5
    push DE                                            ;; 06:5bf4 $d5
    ld   E, A                                          ;; 06:5bf5 $5f
    ld   D, $00                                        ;; 06:5bf6 $16 $00
    call call_06_5c22                                  ;; 06:5bf8 $cd $22 $5c
    ld   HL, data_06_7700                              ;; 06:5bfb $21 $00 $77
    add  HL, DE                                        ;; 06:5bfe $19
    pop  DE                                            ;; 06:5bff $d1
    ld   D, $00                                        ;; 06:5c00 $16 $00
    add  HL, DE                                        ;; 06:5c02 $19
    ld   A, [HL]                                       ;; 06:5c03 $7e
    pop  DE                                            ;; 06:5c04 $d1
    pop  HL                                            ;; 06:5c05 $e1
    ret                                                ;; 06:5c06 $c9

call_06_5c07:
    add  HL, HL                                        ;; 06:5c07 $29
    add  HL, HL                                        ;; 06:5c08 $29

call_06_5c09:
    add  HL, HL                                        ;; 06:5c09 $29
    add  HL, HL                                        ;; 06:5c0a $29
    add  HL, HL                                        ;; 06:5c0b $29
    ret                                                ;; 06:5c0c $c9

call_06_5c0d:
    srl  H                                             ;; 06:5c0d $cb $3c
    rr   L                                             ;; 06:5c0f $cb $1d

call_06_5c11:
    srl  H                                             ;; 06:5c11 $cb $3c
    rr   L                                             ;; 06:5c13 $cb $1d
    srl  H                                             ;; 06:5c15 $cb $3c
    rr   L                                             ;; 06:5c17 $cb $1d
    srl  H                                             ;; 06:5c19 $cb $3c
    rr   L                                             ;; 06:5c1b $cb $1d
    sra  H                                             ;; 06:5c1d $cb $2c
    rr   L                                             ;; 06:5c1f $cb $1d
    ret                                                ;; 06:5c21 $c9

call_06_5c22:
    sla  E                                             ;; 06:5c22 $cb $23
    rl   D                                             ;; 06:5c24 $cb $12

call_06_5c26:
    sla  E                                             ;; 06:5c26 $cb $23
    rl   D                                             ;; 06:5c28 $cb $12
    sla  E                                             ;; 06:5c2a $cb $23
    rl   D                                             ;; 06:5c2c $cb $12
    ret                                                ;; 06:5c2e $c9

call_06_5c2f:
    push BC                                            ;; 06:5c2f $c5
    call call_06_5c61                                  ;; 06:5c30 $cd $61 $5c
    jr   Z, jr_06_5c44                                 ;; 06:5c33 $28 $0f
    ld   A, $0e                                        ;; 06:5c35 $3e $0e
    call call_06_7f62                                  ;; 06:5c37 $cd $62 $7f
    ld   C, $08                                        ;; 06:5c3a $0e $08
    ld   A, D                                          ;; 06:5c3c $7a
.jr_06_5c3d:
    cp   A, [HL]                                       ;; 06:5c3d $be
    jr   Z, jr_06_5c48                                 ;; 06:5c3e $28 $08
    inc  HL                                            ;; 06:5c40 $23
    dec  C                                             ;; 06:5c41 $0d
    jr   NZ, .jr_06_5c3d                               ;; 06:5c42 $20 $f9

jr_06_5c44:
    pop  BC                                            ;; 06:5c44 $c1
    or   A, $ff                                        ;; 06:5c45 $f6 $ff
    ret                                                ;; 06:5c47 $c9

jr_06_5c48:
    pop  BC                                            ;; 06:5c48 $c1
    ret                                                ;; 06:5c49 $c9

call_06_5c4a:
    push BC                                            ;; 06:5c4a $c5
    call call_06_5c63                                  ;; 06:5c4b $cd $63 $5c
    jr   Z, jr_06_5c44                                 ;; 06:5c4e $28 $f4
    ld   A, $0e                                        ;; 06:5c50 $3e $0e
    call call_06_7f62                                  ;; 06:5c52 $cd $62 $7f
    ld   C, $08                                        ;; 06:5c55 $0e $08
    ld   A, D                                          ;; 06:5c57 $7a
.jr_06_5c58:
    cp   A, [HL]                                       ;; 06:5c58 $be
    jr   Z, jr_06_5c48                                 ;; 06:5c59 $28 $ed
    inc  HL                                            ;; 06:5c5b $23
    dec  C                                             ;; 06:5c5c $0d
    jr   NZ, .jr_06_5c58                               ;; 06:5c5d $20 $f9
    jr   jr_06_5c44                                    ;; 06:5c5f $18 $e3

call_06_5c61:
    add  A, $04                                        ;; 06:5c61 $c6 $04

call_06_5c63:
    ld   HL, $00                                       ;; 06:5c63 $21 $00 $00
    rst  rst_00_0038                                   ;; 06:5c66 $ff
    push HL                                            ;; 06:5c67 $e5
    inc  HL                                            ;; 06:5c68 $23
    inc  HL                                            ;; 06:5c69 $23
    ld   A, [HL]                                       ;; 06:5c6a $7e
    pop  HL                                            ;; 06:5c6b $e1
    cp   A, $ff                                        ;; 06:5c6c $fe $ff
    ret                                                ;; 06:5c6e $c9
    db   $f5, $c5, $d5, $e5, $bb, $20, $06, $cd        ;; 06:5c6f ????????
    db   $82, $42, $c3, $7c, $7f, $6f, $f0, $b0        ;; 06:5c77 ????????
    db   $4f, $f0, $b1, $e0, $b0, $7d, $cd, $8e        ;; 06:5c7f ????????
    db   $5c, $79, $e0, $b0, $c3, $7c, $7f             ;; 06:5c87 ???????

call_06_5c8e:
    push AF                                            ;; 06:5c8e $f5
    push BC                                            ;; 06:5c8f $c5
    push DE                                            ;; 06:5c90 $d5
    push HL                                            ;; 06:5c91 $e5
    ld   D, A                                          ;; 06:5c92 $57
    ld   A, E                                          ;; 06:5c93 $7b
    cp   A, $ff                                        ;; 06:5c94 $fe $ff
    jr   Z, .jr_06_5cb0                                ;; 06:5c96 $28 $18
    cp   A, D                                          ;; 06:5c98 $ba
    jr   Z, .jr_06_5cb0                                ;; 06:5c99 $28 $15
    ld   C, $08                                        ;; 06:5c9b $0e $08
    ld   L, $00                                        ;; 06:5c9d $2e $00
.jr_06_5c9f:
    sub  A, A                                          ;; 06:5c9f $97
    ld   B, A                                          ;; 06:5ca0 $47
    sla  E                                             ;; 06:5ca1 $cb $23
    rl   B                                             ;; 06:5ca3 $cb $10
    sla  D                                             ;; 06:5ca5 $cb $22
    rla                                                ;; 06:5ca7 $17
    cp   A, B                                          ;; 06:5ca8 $b8
    call NZ, call_06_5cb3                              ;; 06:5ca9 $c4 $b3 $5c
    inc  L                                             ;; 06:5cac $2c
    dec  C                                             ;; 06:5cad $0d
    jr   NZ, .jr_06_5c9f                               ;; 06:5cae $20 $ef
.jr_06_5cb0:
    jp   jp_06_7f7c                                    ;; 06:5cb0 $c3 $7c $7f

call_06_5cb3:
    push AF                                            ;; 06:5cb3 $f5
    push BC                                            ;; 06:5cb4 $c5
    push DE                                            ;; 06:5cb5 $d5
    push HL                                            ;; 06:5cb6 $e5
    cp   A, $01                                        ;; 06:5cb7 $fe $01
    jr   Z, .jr_06_5cc0                                ;; 06:5cb9 $28 $05
    ld   DE, .data_06_5cda                             ;; 06:5cbb $11 $da $5c
    jr   .jr_06_5cc3                                   ;; 06:5cbe $18 $03
.jr_06_5cc0:
    ld   DE, .data_06_5cd2                             ;; 06:5cc0 $11 $d2 $5c
.jr_06_5cc3:
    ld   H, $00                                        ;; 06:5cc3 $26 $00
    add  HL, DE                                        ;; 06:5cc5 $19
    ld   A, $01                                        ;; 06:5cc6 $3e $01
    call call_06_5a71                                  ;; 06:5cc8 $cd $71 $5a
    ld   A, [HL]                                       ;; 06:5ccb $7e
    call call_06_5a71                                  ;; 06:5ccc $cd $71 $5a
    jp   jp_06_7f7c                                    ;; 06:5ccf $c3 $7c $7f
.data_06_5cd2:
    db   $3b, $3a, $38, $39, $37, $36, $35, $34        ;; 06:5cd2 ????????
.data_06_5cda:
    db   $4d, $4c, $4a, $4b, $49, $48, $0c, $0b        ;; 06:5cda ????????

call_06_5ce2:
    push DE                                            ;; 06:5ce2 $d5
    sub  A, A                                          ;; 06:5ce3 $97
    ld   E, $64                                        ;; 06:5ce4 $1e $64
    call call_06_5e24                                  ;; 06:5ce6 $cd $24 $5e
    pop  DE                                            ;; 06:5ce9 $d1
    ret                                                ;; 06:5cea $c9

jp_06_5ceb:
    ld   A, [wD4AB]                                    ;; 06:5ceb $fa $ab $d4
    ld   L, A                                          ;; 06:5cee $6f
    ld   A, [wD4AC]                                    ;; 06:5cef $fa $ac $d4
    ld   H, A                                          ;; 06:5cf2 $67
    ld   SP, HL                                        ;; 06:5cf3 $f9
    ret                                                ;; 06:5cf4 $c9

call_06_5cf5:
    sub  A, A                                          ;; 06:5cf5 $97
    jp   call_06_5e24                                  ;; 06:5cf6 $c3 $24 $5e

call_06_5cf9:
    sub  A, A                                          ;; 06:5cf9 $97
    ldh  [hFFBC], A                                    ;; 06:5cfa $e0 $bc
    ld   A, [wD48A]                                    ;; 06:5cfc $fa $8a $d4
    cp   A, $00                                        ;; 06:5cff $fe $00
    ret  NZ                                            ;; 06:5d01 $c0
    inc  A                                             ;; 06:5d02 $3c
    ld   [wD48A], A                                    ;; 06:5d03 $ea $8a $d4
    call call_06_7f7a                                  ;; 06:5d06 $cd $7a $7f
    ld   E, $f9                                        ;; 06:5d09 $1e $f9
    call call_06_5d6c                                  ;; 06:5d0b $cd $6c $5d
    ld   E, $f9                                        ;; 06:5d0e $1e $f9
    call call_06_5d7e                                  ;; 06:5d10 $cd $7e $5d
    ldh  A, [hFFB6]                                    ;; 06:5d13 $f0 $b6
    cp   A, $00                                        ;; 06:5d15 $fe $00
    ret  Z                                             ;; 06:5d17 $c8
    cp   A, $01                                        ;; 06:5d18 $fe $01
    jr   Z, .jr_06_5d45                                ;; 06:5d1a $28 $29
    call call_06_7f7a                                  ;; 06:5d1c $cd $7a $7f
    ld   E, $fa                                        ;; 06:5d1f $1e $fa
    call call_06_5d6c                                  ;; 06:5d21 $cd $6c $5d
    ldh  A, [hFFB6]                                    ;; 06:5d24 $f0 $b6
    cp   A, $01                                        ;; 06:5d26 $fe $01
    ret  Z                                             ;; 06:5d28 $c8
    ld   E, $fb                                        ;; 06:5d29 $1e $fb
    call call_06_5d6c                                  ;; 06:5d2b $cd $6c $5d
    ldh  A, [hFFB6]                                    ;; 06:5d2e $f0 $b6
    cp   A, $01                                        ;; 06:5d30 $fe $01
    ret  Z                                             ;; 06:5d32 $c8
    call call_06_5ce2                                  ;; 06:5d33 $cd $e2 $5c
    cp   A, $0a                                        ;; 06:5d36 $fe $0a
    ret  NC                                            ;; 06:5d38 $d0
    ld   A, $02                                        ;; 06:5d39 $3e $02
    ldh  [hFFBC], A                                    ;; 06:5d3b $e0 $bc
    ld   A, $43                                        ;; 06:5d3d $3e $43
    call call_06_5a71                                  ;; 06:5d3f $cd $71 $5a
    jp   call_06_5bd4                                  ;; 06:5d42 $c3 $d4 $5b
.jr_06_5d45:
    call call_06_7f7a                                  ;; 06:5d45 $cd $7a $7f
    ld   E, $fa                                        ;; 06:5d48 $1e $fa
    call call_06_5d7e                                  ;; 06:5d4a $cd $7e $5d
    ldh  A, [hFFB6]                                    ;; 06:5d4d $f0 $b6
    cp   A, $ff                                        ;; 06:5d4f $fe $ff
    ret  Z                                             ;; 06:5d51 $c8
    ld   E, $fb                                        ;; 06:5d52 $1e $fb
    call call_06_5d7e                                  ;; 06:5d54 $cd $7e $5d
    ldh  A, [hFFB6]                                    ;; 06:5d57 $f0 $b6
    cp   A, $ff                                        ;; 06:5d59 $fe $ff
    ret  Z                                             ;; 06:5d5b $c8
    call call_06_5ce2                                  ;; 06:5d5c $cd $e2 $5c
    cp   A, $0a                                        ;; 06:5d5f $fe $0a
    ret  NC                                            ;; 06:5d61 $d0
    ld   A, $01                                        ;; 06:5d62 $3e $01
    ldh  [hFFBC], A                                    ;; 06:5d64 $e0 $bc
    ld   A, $44                                        ;; 06:5d66 $3e $44
    call call_06_5a71                                  ;; 06:5d68 $cd $71 $5a
    ret                                                ;; 06:5d6b $c9

call_06_5d6c:
    ld   D, E                                          ;; 06:5d6c $53
    sub  A, A                                          ;; 06:5d6d $97
    ld   C, A                                          ;; 06:5d6e $4f
.jr_06_5d6f:
    push BC                                            ;; 06:5d6f $c5
    call call_06_5c2f                                  ;; 06:5d70 $cd $2f $5c
    pop  BC                                            ;; 06:5d73 $c1
    jp   Z, call_06_7f76                               ;; 06:5d74 $ca $76 $7f
    inc  C                                             ;; 06:5d77 $0c
    ld   A, C                                          ;; 06:5d78 $79
    cp   A, $1b                                        ;; 06:5d79 $fe $1b
    jr   NZ, .jr_06_5d6f                               ;; 06:5d7b $20 $f2
    ret                                                ;; 06:5d7d $c9

call_06_5d7e:
    ld   D, E                                          ;; 06:5d7e $53
    sub  A, A                                          ;; 06:5d7f $97
    ld   C, A                                          ;; 06:5d80 $4f
.jr_06_5d81:
    push BC                                            ;; 06:5d81 $c5
    call call_06_5c4a                                  ;; 06:5d82 $cd $4a $5c
    pop  BC                                            ;; 06:5d85 $c1
    jp   Z, jp_06_7f78                                 ;; 06:5d86 $ca $78 $7f
    inc  C                                             ;; 06:5d89 $0c
    ld   A, C                                          ;; 06:5d8a $79
    cp   A, $04                                        ;; 06:5d8b $fe $04
    jr   NZ, .jr_06_5d81                               ;; 06:5d8d $20 $f2
    ret                                                ;; 06:5d8f $c9

call_06_5d90:
    ld   A, $c3                                        ;; 06:5d90 $3e $c3
    ld   [wD3E0], A                                    ;; 06:5d92 $ea $e0 $d3
    ld   [wD3E3], A                                    ;; 06:5d95 $ea $e3 $d3
    ld   HL, data_06_7f60                              ;; 06:5d98 $21 $60 $7f
    ld   A, L                                          ;; 06:5d9b $7d
    ld   [wD3E1], A                                    ;; 06:5d9c $ea $e1 $d3
    ld   A, H                                          ;; 06:5d9f $7c
    ld   [wD3E2], A                                    ;; 06:5da0 $ea $e2 $d3
    ld   HL, data_06_4296                              ;; 06:5da3 $21 $96 $42
    ld   A, L                                          ;; 06:5da6 $7d
    ld   [wD3E4], A                                    ;; 06:5da7 $ea $e4 $d3
    ld   A, H                                          ;; 06:5daa $7c
    ld   [wD3E5], A                                    ;; 06:5dab $ea $e5 $d3
    ret                                                ;; 06:5dae $c9

call_06_5daf:
    ld   A, $ff                                        ;; 06:5daf $3e $ff
    ldh  [hFFB6], A                                    ;; 06:5db1 $e0 $b6
    ld   A, $04                                        ;; 06:5db3 $3e $04
    ld   L, $03                                        ;; 06:5db5 $2e $03
    rst  rst_00_0038                                   ;; 06:5db7 $ff
    call call_06_7f6a                                  ;; 06:5db8 $cd $6a $7f
    ld   HL, wD4BB                                     ;; 06:5dbb $21 $bb $d4
    call call_06_7f6c                                  ;; 06:5dbe $cd $6c $7f
    ld   [HL], C                                       ;; 06:5dc1 $71
    inc  HL                                            ;; 06:5dc2 $23
    ld   [HL], B                                       ;; 06:5dc3 $70
    call call_06_5df3                                  ;; 06:5dc4 $cd $f3 $5d
    jr   NZ, .jr_06_5dd8                               ;; 06:5dc7 $20 $0f
    ld   HL, wD4BD                                     ;; 06:5dc9 $21 $bd $d4
    inc  [HL]                                          ;; 06:5dcc $34
    ld   A, [HL]                                       ;; 06:5dcd $7e
    cp   A, $02                                        ;; 06:5dce $fe $02
    jr   C, .jr_06_5dd8                                ;; 06:5dd0 $38 $06
    ld   [HL], $00                                     ;; 06:5dd2 $36 $00
    ld   A, $13                                        ;; 06:5dd4 $3e $13
    jr   .jr_06_5dec                                   ;; 06:5dd6 $18 $14
.jr_06_5dd8:
    ld   HL, data_06_7f50                              ;; 06:5dd8 $21 $50 $7f
.jr_06_5ddb:
    call call_06_7f76                                  ;; 06:5ddb $cd $76 $7f
    call call_06_7f6c                                  ;; 06:5dde $cd $6c $7f
    inc  HL                                            ;; 06:5de1 $23
    inc  HL                                            ;; 06:5de2 $23
    call call_06_5df3                                  ;; 06:5de3 $cd $f3 $5d
    jr   C, .jr_06_5ddb                                ;; 06:5de6 $38 $f3
    ldh  A, [hFFB6]                                    ;; 06:5de8 $f0 $b6
    add  A, $0e                                        ;; 06:5dea $c6 $0e
.jr_06_5dec:
    ld   L, A                                          ;; 06:5dec $6f
    ld   A, $04                                        ;; 06:5ded $3e $04
    rst  rst_00_0038                                   ;; 06:5def $ff
    ldh  [hFFB6], A                                    ;; 06:5df0 $e0 $b6
    ret                                                ;; 06:5df2 $c9

call_06_5df3:
    push HL                                            ;; 06:5df3 $e5
    push BC                                            ;; 06:5df4 $c5
    pop  HL                                            ;; 06:5df5 $e1
    call call_00_0168                                  ;; 06:5df6 $cd $68 $01
    pop  HL                                            ;; 06:5df9 $e1
    ret                                                ;; 06:5dfa $c9
    db   $00, $80, $00, $10, $01                       ;; 06:5dfb ?????

call_06_5e00:
    jp   jp_06_5e35                                    ;; 06:5e00 $c3 $35 $5e

jp_06_5e03:
    jp   jp_06_604b                                    ;; 06:5e03 $c3 $4b $60
    db   $c3, $3c, $5e                                 ;; 06:5e06 ???

call_06_5e09:
    jp   jp_06_5ecd                                    ;; 06:5e09 $c3 $cd $5e

call_06_5e0c:
    jp   jp_06_6073                                    ;; 06:5e0c $c3 $73 $60

call_06_5e0f:
    jp   jp_06_6028                                    ;; 06:5e0f $c3 $28 $60

call_06_5e12:
    jp   jp_06_5e43                                    ;; 06:5e12 $c3 $43 $5e

call_06_5e15:
    jp   jp_06_5f31                                    ;; 06:5e15 $c3 $31 $5f

call_06_5e18:
    jp   jp_06_602c                                    ;; 06:5e18 $c3 $2c $60

jp_06_5e1b:
    jp   jp_06_6290                                    ;; 06:5e1b $c3 $90 $62

call_06_5e1e:
    jp   jp_06_5e2e                                    ;; 06:5e1e $c3 $2e $5e

call_06_5e21:
    jp   jp_06_5e27                                    ;; 06:5e21 $c3 $27 $5e

call_06_5e24:
    jp   jp_06_5eb7                                    ;; 06:5e24 $c3 $b7 $5e

jp_06_5e27:
    call call_00_0180                                  ;; 06:5e27 $cd $80 $01
    add  HL, BC                                        ;; 06:5e2a $09
    ld   L, [HL]                                       ;; 06:5e2b $6e
    rlca                                               ;; 06:5e2c $07
    ret                                                ;; 06:5e2d $c9

jp_06_5e2e:
    call call_00_0180                                  ;; 06:5e2e $cd $80 $01
    ld   B, $6e                                        ;; 06:5e31 $06 $6e
    rlca                                               ;; 06:5e33 $07
    ret                                                ;; 06:5e34 $c9

jp_06_5e35:
    call call_00_0180                                  ;; 06:5e35 $cd $80 $01
    nop                                                ;; 06:5e38 $00
    ld   L, [HL]                                       ;; 06:5e39 $6e
    rlca                                               ;; 06:5e3a $07
    ret                                                ;; 06:5e3b $c9
    db   $cd, $80, $01, $03, $6e, $07, $c9             ;; 06:5e3c ???????

jp_06_5e43:
    call call_00_0180                                  ;; 06:5e43 $cd $80 $01
    inc  C                                             ;; 06:5e46 $0c
    ld   L, [HL]                                       ;; 06:5e47 $6e
    rlca                                               ;; 06:5e48 $07
    ret                                                ;; 06:5e49 $c9

call_06_5e4a:
    ld   HL, wCC00                                     ;; 06:5e4a $21 $00 $cc
    ld   DE, wDF00                                     ;; 06:5e4d $11 $00 $df
    call call_06_5e85                                  ;; 06:5e50 $cd $85 $5e
    ld   BC, $400                                      ;; 06:5e53 $01 $00 $04
.jr_06_5e56:
    push BC                                            ;; 06:5e56 $c5
    ld   A, C                                          ;; 06:5e57 $79
    call call_00_01b9                                  ;; 06:5e58 $cd $b9 $01
    push HL                                            ;; 06:5e5b $e5
    ld   L, C                                          ;; 06:5e5c $69
    ld   DE, wD002                                     ;; 06:5e5d $11 $02 $d0
    call call_00_01d4                                  ;; 06:5e60 $cd $d4 $01
    pop  DE                                            ;; 06:5e63 $d1
    ld   A, [HL+]                                      ;; 06:5e64 $2a
    ld   [DE], A                                       ;; 06:5e65 $12
    ld   A, E                                          ;; 06:5e66 $7b
    add  A, $06                                        ;; 06:5e67 $c6 $06
    ld   E, A                                          ;; 06:5e69 $5f
    ld   B, $04                                        ;; 06:5e6a $06 $04
    call call_00_008f                                  ;; 06:5e6c $cd $8f $00
    ld   A, E                                          ;; 06:5e6f $7b
    sub  A, $05                                        ;; 06:5e70 $d6 $05
    ld   E, A                                          ;; 06:5e72 $5f
    ld   A, L                                          ;; 06:5e73 $7d
    or   A, $1f                                        ;; 06:5e74 $f6 $1f
    ld   L, A                                          ;; 06:5e76 $6f
    ld   A, [HL]                                       ;; 06:5e77 $7e
    ld   [DE], A                                       ;; 06:5e78 $12
    pop  BC                                            ;; 06:5e79 $c1
    inc  C                                             ;; 06:5e7a $0c
    dec  B                                             ;; 06:5e7b $05
    jr   NZ, .jr_06_5e56                               ;; 06:5e7c $20 $d8
    ret                                                ;; 06:5e7e $c9

call_06_5e7f:
    ld   DE, wDF00                                     ;; 06:5e7f $11 $00 $df
    ld   HL, wCC00                                     ;; 06:5e82 $21 $00 $cc

call_06_5e85:
    ld   B, $80                                        ;; 06:5e85 $06 $80
    jp   call_00_008f                                  ;; 06:5e87 $c3 $8f $00

call_06_5e8a:
    ld   B, $03                                        ;; 06:5e8a $06 $03
    ld   DE, wD3EA                                     ;; 06:5e8c $11 $ea $d3
    ld   HL, wD825                                     ;; 06:5e8f $21 $25 $d8
.jr_06_5e92:
    ld   A, [DE]                                       ;; 06:5e92 $1a
    inc  DE                                            ;; 06:5e93 $13
    inc  DE                                            ;; 06:5e94 $13
    and  A, A                                          ;; 06:5e95 $a7
    jr   Z, .jr_06_5e9c                                ;; 06:5e96 $28 $04
    cp   A, $ff                                        ;; 06:5e98 $fe $ff
    jr   NZ, .jr_06_5e9e                               ;; 06:5e9a $20 $02
.jr_06_5e9c:
    ld   A, $ff                                        ;; 06:5e9c $3e $ff
.jr_06_5e9e:
    ld   [HL+], A                                      ;; 06:5e9e $22
    dec  B                                             ;; 06:5e9f $05
    jr   NZ, .jr_06_5e92                               ;; 06:5ea0 $20 $f0
    ret                                                ;; 06:5ea2 $c9

call_06_5ea3:
    push HL                                            ;; 06:5ea3 $e5
    ld   HL, wD3EF                                     ;; 06:5ea4 $21 $ef $d3
    add  A, A                                          ;; 06:5ea7 $87
    add  A, A                                          ;; 06:5ea8 $87
    rst  add_hl_a                                      ;; 06:5ea9 $c7
    ld   E, L                                          ;; 06:5eaa $5d
    ld   D, H                                          ;; 06:5eab $54
    pop  HL                                            ;; 06:5eac $e1
    ret                                                ;; 06:5ead $c9

call_06_5eae:
    push HL                                            ;; 06:5eae $e5
    call call_00_01b6                                  ;; 06:5eaf $cd $b6 $01
    ld   A, [HL]                                       ;; 06:5eb2 $7e
    and  A, $e3                                        ;; 06:5eb3 $e6 $e3
    pop  HL                                            ;; 06:5eb5 $e1
    ret                                                ;; 06:5eb6 $c9

jp_06_5eb7:
    push BC                                            ;; 06:5eb7 $c5
    push DE                                            ;; 06:5eb8 $d5
    push HL                                            ;; 06:5eb9 $e5
    push AF                                            ;; 06:5eba $f5
    ld   HL, wCA00                                     ;; 06:5ebb $21 $00 $ca
    ldh  A, [hFFB2]                                    ;; 06:5ebe $f0 $b2
    rst  add_hl_a                                      ;; 06:5ec0 $c7
    inc  [HL]                                          ;; 06:5ec1 $34
    ld   L, [HL]                                       ;; 06:5ec2 $6e
    ld   H, $cb                                        ;; 06:5ec3 $26 $cb
    pop  AF                                            ;; 06:5ec5 $f1
    call call_00_016e                                  ;; 06:5ec6 $cd $6e $01
    pop  HL                                            ;; 06:5ec9 $e1
    pop  DE                                            ;; 06:5eca $d1
    pop  BC                                            ;; 06:5ecb $c1
    ret                                                ;; 06:5ecc $c9

jp_06_5ecd:
    call call_06_63ed                                  ;; 06:5ecd $cd $ed $63
    ld   HL, wC700                                     ;; 06:5ed0 $21 $00 $c7
    ld   BC, $703                                      ;; 06:5ed3 $01 $03 $07
    call call_00_01bf                                  ;; 06:5ed6 $cd $bf $01
    ld   A, $09                                        ;; 06:5ed9 $3e $09
    ld   E, $04                                        ;; 06:5edb $1e $04
    ld   HL, wC70A                                     ;; 06:5edd $21 $0a $c7
    rst  rst_00_0008                                   ;; 06:5ee0 $cf
    ld   DE, wC66C                                     ;; 06:5ee1 $11 $6c $c6
    ld   BC, $905                                      ;; 06:5ee4 $01 $05 $09
    call call_06_63ca                                  ;; 06:5ee7 $cd $ca $63
    call call_00_0183                                  ;; 06:5eea $cd $83 $01
    ld   DE, $e09                                      ;; 06:5eed $11 $09 $0e
    call call_00_01a1                                  ;; 06:5ef0 $cd $a1 $01
    call call_06_63de                                  ;; 06:5ef3 $cd $de $63
.jr_06_5ef6:
    call call_00_019b                                  ;; 06:5ef6 $cd $9b $01
    bit  7, A                                          ;; 06:5ef9 $cb $7f
    call NZ, call_06_5f13                              ;; 06:5efb $c4 $13 $5f
    bit  6, A                                          ;; 06:5efe $cb $77
    call NZ, call_06_5f22                              ;; 06:5f00 $c4 $22 $5f
    bit  0, A                                          ;; 06:5f03 $cb $47
    jr   NZ, .jr_06_5f0c                               ;; 06:5f05 $20 $05
    call call_00_01a4                                  ;; 06:5f07 $cd $a4 $01
    jr   .jr_06_5ef6                                   ;; 06:5f0a $18 $ea
.jr_06_5f0c:
    ldh  A, [hFF92]                                    ;; 06:5f0c $f0 $92
    cp   A, $0e                                        ;; 06:5f0e $fe $0e
    ret  Z                                             ;; 06:5f10 $c8
    scf                                                ;; 06:5f11 $37
    ret                                                ;; 06:5f12 $c9

call_06_5f13:
    push AF                                            ;; 06:5f13 $f5
    ldh  A, [hFF92]                                    ;; 06:5f14 $f0 $92
    add  A, $02                                        ;; 06:5f16 $c6 $02
    cp   A, $12                                        ;; 06:5f18 $fe $12
    jr   C, .jr_06_5f1e                                ;; 06:5f1a $38 $02
    ld   A, $0e                                        ;; 06:5f1c $3e $0e
.jr_06_5f1e:
    ldh  [hFF92], A                                    ;; 06:5f1e $e0 $92
    pop  AF                                            ;; 06:5f20 $f1
    ret                                                ;; 06:5f21 $c9

call_06_5f22:
    push AF                                            ;; 06:5f22 $f5
    ldh  A, [hFF92]                                    ;; 06:5f23 $f0 $92
    sub  A, $02                                        ;; 06:5f25 $d6 $02
    cp   A, $0e                                        ;; 06:5f27 $fe $0e
    jr   Z, .jr_06_5f2d                                ;; 06:5f29 $28 $02
    ld   A, $10                                        ;; 06:5f2b $3e $10
.jr_06_5f2d:
    ldh  [hFF92], A                                    ;; 06:5f2d $e0 $92
    pop  AF                                            ;; 06:5f2f $f1
    ret                                                ;; 06:5f30 $c9

jp_06_5f31:
    ld   [wC3C8], A                                    ;; 06:5f31 $ea $c8 $c3
    ld   A, $e4                                        ;; 06:5f34 $3e $e4
    ldh  [rOBP1], A                                    ;; 06:5f36 $e0 $49
    ld   A, $fa                                        ;; 06:5f38 $3e $fa
    ld   C, $10                                        ;; 06:5f3a $0e $10
    ld   DE, $2848                                     ;; 06:5f3c $11 $48 $28
    ld   HL, wC100                                     ;; 06:5f3f $21 $00 $c1
    call call_00_018f                                  ;; 06:5f42 $cd $8f $01
    call call_06_601a                                  ;; 06:5f45 $cd $1a $60
    rst  rst_00_0010                                   ;; 06:5f48 $d7
    rst  rst_00_0018                                   ;; 06:5f49 $df
    ld   E, $2e                                        ;; 06:5f4a $1e $2e
    call call_00_01c2                                  ;; 06:5f4c $cd $c2 $01
    call call_06_5ff4                                  ;; 06:5f4f $cd $f4 $5f
    call call_00_0177                                  ;; 06:5f52 $cd $77 $01
.jr_06_5f55:
    call call_06_6008                                  ;; 06:5f55 $cd $08 $60
    call call_06_5f8d                                  ;; 06:5f58 $cd $8d $5f
    jr   NC, .jr_06_5f66                               ;; 06:5f5b $30 $09
    call call_06_6008                                  ;; 06:5f5d $cd $08 $60
    call call_06_601a                                  ;; 06:5f60 $cd $1a $60
    jp   call_06_63de                                  ;; 06:5f63 $c3 $de $63
.jr_06_5f66:
    call call_06_6365                                  ;; 06:5f66 $cd $65 $63
.jr_06_5f69:
    call call_06_6252                                  ;; 06:5f69 $cd $52 $62
    jr   C, .jr_06_5f55                                ;; 06:5f6c $38 $e7
    ld   [wC3AC], A                                    ;; 06:5f6e $ea $ac $c3
    call call_06_5eae                                  ;; 06:5f71 $cd $ae $5e
    jr   NZ, .jr_06_5f69                               ;; 06:5f74 $20 $f3
    call call_00_01c8                                  ;; 06:5f76 $cd $c8 $01
    ld   E, $22                                        ;; 06:5f79 $1e $22
    jr   NC, .jr_06_5f7f                               ;; 06:5f7b $30 $02
    ld   E, $2f                                        ;; 06:5f7d $1e $2f
.jr_06_5f7f:
    push DE                                            ;; 06:5f7f $d5
    call call_06_6008                                  ;; 06:5f80 $cd $08 $60
    call call_06_601a                                  ;; 06:5f83 $cd $1a $60
    call call_06_63de                                  ;; 06:5f86 $cd $de $63
    pop  DE                                            ;; 06:5f89 $d1
    jp   call_00_01c2                                  ;; 06:5f8a $c3 $c2 $01

call_06_5f8d:
    call call_06_63ed                                  ;; 06:5f8d $cd $ed $63
    call call_06_601a                                  ;; 06:5f90 $cd $1a $60
    ld   HL, wC700                                     ;; 06:5f93 $21 $00 $c7
    ld   BC, $804                                      ;; 06:5f96 $01 $04 $08
    call call_00_01bf                                  ;; 06:5f99 $cd $bf $01
    ld   A, $0a                                        ;; 06:5f9c $3e $0a
    ld   E, $09                                        ;; 06:5f9e $1e $09
    ld   HL, wC715                                     ;; 06:5fa0 $21 $15 $c7
    rst  rst_00_0008                                   ;; 06:5fa3 $cf
    ld   DE, wC658                                     ;; 06:5fa4 $11 $58 $c6
    ld   BC, $a06                                      ;; 06:5fa7 $01 $06 $0a
    call call_06_63ca                                  ;; 06:5faa $cd $ca $63
    call call_00_0183                                  ;; 06:5fad $cd $83 $01
    ld   DE, $e09                                      ;; 06:5fb0 $11 $09 $0e
    call call_00_01a1                                  ;; 06:5fb3 $cd $a1 $01
    call call_06_63de                                  ;; 06:5fb6 $cd $de $63
.jr_06_5fb9:
    call call_00_019b                                  ;; 06:5fb9 $cd $9b $01
    bit  7, A                                          ;; 06:5fbc $cb $7f
    call NZ, call_06_5fd6                              ;; 06:5fbe $c4 $d6 $5f
    bit  6, A                                          ;; 06:5fc1 $cb $77
    call NZ, call_06_5fe5                              ;; 06:5fc3 $c4 $e5 $5f
    bit  0, A                                          ;; 06:5fc6 $cb $47
    jr   NZ, .jr_06_5fcf                               ;; 06:5fc8 $20 $05
    call call_00_01a4                                  ;; 06:5fca $cd $a4 $01
    jr   .jr_06_5fb9                                   ;; 06:5fcd $18 $ea
.jr_06_5fcf:
    ldh  A, [hFF92]                                    ;; 06:5fcf $f0 $92
    cp   A, $0e                                        ;; 06:5fd1 $fe $0e
    ret  Z                                             ;; 06:5fd3 $c8
    scf                                                ;; 06:5fd4 $37
    ret                                                ;; 06:5fd5 $c9

call_06_5fd6:
    push AF                                            ;; 06:5fd6 $f5
    ldh  A, [hFF92]                                    ;; 06:5fd7 $f0 $92
    add  A, $02                                        ;; 06:5fd9 $c6 $02
    cp   A, $12                                        ;; 06:5fdb $fe $12
    jr   C, .jr_06_5fe1                                ;; 06:5fdd $38 $02
    ld   A, $0e                                        ;; 06:5fdf $3e $0e
.jr_06_5fe1:
    ldh  [hFF92], A                                    ;; 06:5fe1 $e0 $92
    pop  AF                                            ;; 06:5fe3 $f1
    ret                                                ;; 06:5fe4 $c9

call_06_5fe5:
    push AF                                            ;; 06:5fe5 $f5
    ldh  A, [hFF92]                                    ;; 06:5fe6 $f0 $92
    sub  A, $02                                        ;; 06:5fe8 $d6 $02
    cp   A, $0e                                        ;; 06:5fea $fe $0e
    jr   Z, .jr_06_5ff0                                ;; 06:5fec $28 $02
    ld   A, $10                                        ;; 06:5fee $3e $10
.jr_06_5ff0:
    ldh  [hFF92], A                                    ;; 06:5ff0 $e0 $92
    pop  AF                                            ;; 06:5ff2 $f1
    ret                                                ;; 06:5ff3 $c9

call_06_5ff4:
    ld   HL, $9900                                     ;; 06:5ff4 $21 $00 $99
    ld   DE, wDE00                                     ;; 06:5ff7 $11 $00 $de
    ld   C, $0a                                        ;; 06:5ffa $0e $0a
.jr_06_5ffc:
    ld   B, $14                                        ;; 06:5ffc $06 $14
    call call_00_00b5                                  ;; 06:5ffe $cd $b5 $00
    ld   A, $0c                                        ;; 06:6001 $3e $0c
    rst  add_hl_a                                      ;; 06:6003 $c7
    dec  C                                             ;; 06:6004 $0d
    jr   NZ, .jr_06_5ffc                               ;; 06:6005 $20 $f5
    ret                                                ;; 06:6007 $c9

call_06_6008:
    push AF                                            ;; 06:6008 $f5
    push BC                                            ;; 06:6009 $c5
    push DE                                            ;; 06:600a $d5
    push HL                                            ;; 06:600b $e5
    ld   HL, wDE00                                     ;; 06:600c $21 $00 $de
    ld   DE, wC600                                     ;; 06:600f $11 $00 $c6
    ld   B, $00                                        ;; 06:6012 $06 $00
    call call_00_008f                                  ;; 06:6014 $cd $8f $00
    jp   popAll                                        ;; 06:6017 $c3 $13 $00

call_06_601a:
    call call_00_018c                                  ;; 06:601a $cd $8c $01
    ld   HL, wC100                                     ;; 06:601d $21 $00 $c1
    ld   DE, wC080                                     ;; 06:6020 $11 $80 $c0
    ld   B, $10                                        ;; 06:6023 $06 $10
    jp   call_00_008f                                  ;; 06:6025 $c3 $8f $00

jp_06_6028:
    ld   E, A                                          ;; 06:6028 $5f
    jp   call_00_01c2                                  ;; 06:6029 $c3 $c2 $01

jp_06_602c:
    ld   HL, hFFD8                                     ;; 06:602c $21 $d8 $ff
    ld   DE, $9941                                     ;; 06:602f $11 $41 $99
    ld   [HL], E                                       ;; 06:6032 $73
    inc  HL                                            ;; 06:6033 $23
    ld   [HL], D                                       ;; 06:6034 $72
    inc  HL                                            ;; 06:6035 $23
    ld   [HL], E                                       ;; 06:6036 $73
    inc  HL                                            ;; 06:6037 $23
    ld   [HL], D                                       ;; 06:6038 $72
    call call_00_018c                                  ;; 06:6039 $cd $8c $01
    call call_00_01a7                                  ;; 06:603c $cd $a7 $01
    ld   HL, wC600                                     ;; 06:603f $21 $00 $c6
    ld   BC, $1208                                     ;; 06:6042 $01 $08 $12
    call call_00_01bf                                  ;; 06:6045 $cd $bf $01
    jp   call_06_63de                                  ;; 06:6048 $c3 $de $63

jp_06_604b:
    call call_00_018c                                  ;; 06:604b $cd $8c $01
    call call_00_01a7                                  ;; 06:604e $cd $a7 $01
    call call_06_5e8a                                  ;; 06:6051 $cd $8a $5e
    call call_06_629b                                  ;; 06:6054 $cd $9b $62
    ld   DE, wC608                                     ;; 06:6057 $11 $08 $c6
    ld   BC, $c08                                      ;; 06:605a $01 $08 $0c
    call call_06_63ca                                  ;; 06:605d $cd $ca $63
    ld   A, $01                                        ;; 06:6060 $3e $01
    ldh  [hFFD2], A                                    ;; 06:6062 $e0 $d2
    call call_06_62f3                                  ;; 06:6064 $cd $f3 $62
    ld   DE, wC600                                     ;; 06:6067 $11 $00 $c6
    ld   BC, $90a                                      ;; 06:606a $01 $0a $09
    call call_06_63ca                                  ;; 06:606d $cd $ca $63
    jp   call_06_63de                                  ;; 06:6070 $c3 $de $63

jp_06_6073:
    call call_06_5e8a                                  ;; 06:6073 $cd $8a $5e
    ld   HL, wD3EF                                     ;; 06:6076 $21 $ef $d3
    ld   A, $ff                                        ;; 06:6079 $3e $ff
    ld   B, $04                                        ;; 06:607b $06 $04
.jr_06_607d:
    ld   [HL+], A                                      ;; 06:607d $22
    ld   [HL+], A                                      ;; 06:607e $22
    inc  HL                                            ;; 06:607f $23
    inc  HL                                            ;; 06:6080 $23
    dec  B                                             ;; 06:6081 $05
    jr   NZ, .jr_06_607d                               ;; 06:6082 $20 $f9
    ld   A, $ff                                        ;; 06:6084 $3e $ff
    ld   [wC3AC], A                                    ;; 06:6086 $ea $ac $c3
.jp_06_6089:
    ld   HL, wC3AC                                     ;; 06:6089 $21 $ac $c3
.jr_06_608c:
    inc  [HL]                                          ;; 06:608c $34
    ld   A, [HL]                                       ;; 06:608d $7e
    cp   A, $04                                        ;; 06:608e $fe $04
    jr   NC, .jr_06_6099                               ;; 06:6090 $30 $07
    call call_06_5eae                                  ;; 06:6092 $cd $ae $5e
    jr   Z, .jp_06_609b                                ;; 06:6095 $28 $04
    jr   .jr_06_608c                                   ;; 06:6097 $18 $f3
.jr_06_6099:
    and  A, A                                          ;; 06:6099 $a7
    ret                                                ;; 06:609a $c9
.jp_06_609b:
    call call_06_618b                                  ;; 06:609b $cd $8b $61
    jr   C, .jr_06_6108                                ;; 06:609e $38 $68
    ld   C, A                                          ;; 06:60a0 $4f
    cp   A, $ff                                        ;; 06:60a1 $fe $ff
    jr   Z, .jp_06_6089                                ;; 06:60a3 $28 $e4
    ld   HL, wC3DA                                     ;; 06:60a5 $21 $da $c3
    rst  add_hl_a                                      ;; 06:60a8 $c7
    ld   A, [HL]                                       ;; 06:60a9 $7e
    cp   A, $ff                                        ;; 06:60aa $fe $ff
    jr   Z, .jp_06_6089                                ;; 06:60ac $28 $db
    ld   A, C                                          ;; 06:60ae $79
    ld   HL, wC3D0                                     ;; 06:60af $21 $d0 $c3
    rst  add_hl_a                                      ;; 06:60b2 $c7
    ld   A, [HL]                                       ;; 06:60b3 $7e
    call call_00_01d1                                  ;; 06:60b4 $cd $d1 $01
    inc  HL                                            ;; 06:60b7 $23
    ld   A, [HL]                                       ;; 06:60b8 $7e
    bit  6, A                                          ;; 06:60b9 $cb $77
    jr   NZ, .jp_06_6089                               ;; 06:60bb $20 $cc
    bit  7, A                                          ;; 06:60bd $cb $7f
    jr   NZ, .jr_06_60d7                               ;; 06:60bf $20 $16
    jr   .jr_06_60c3                                   ;; 06:60c1 $18 $00
.jr_06_60c3:
    call call_06_6365                                  ;; 06:60c3 $cd $65 $63
    call call_06_6252                                  ;; 06:60c6 $cd $52 $62
    push AF                                            ;; 06:60c9 $f5
    ld   A, [wC3AC]                                    ;; 06:60ca $fa $ac $c3
    call call_06_5ea3                                  ;; 06:60cd $cd $a3 $5e
    inc  DE                                            ;; 06:60d0 $13
    pop  AF                                            ;; 06:60d1 $f1
    ld   [DE], A                                       ;; 06:60d2 $12
    jr   C, .jp_06_609b                                ;; 06:60d3 $38 $c6
    jr   .jp_06_6089                                   ;; 06:60d5 $18 $b2
.jr_06_60d7:
    call call_00_018c                                  ;; 06:60d7 $cd $8c $01
    ld   A, $03                                        ;; 06:60da $3e $03
    ldh  [hFF92], A                                    ;; 06:60dc $e0 $92
    xor  A, A                                          ;; 06:60de $af
    ld   HL, wD831                                     ;; 06:60df $21 $31 $d8
    ld   [HL], A                                       ;; 06:60e2 $77
.jr_06_60e3:
    call call_06_6172                                  ;; 06:60e3 $cd $72 $61
    jr   NZ, .jr_06_60eb                               ;; 06:60e6 $20 $03
    inc  [HL]                                          ;; 06:60e8 $34
    jr   .jr_06_60e3                                   ;; 06:60e9 $18 $f8
.jr_06_60eb:
    call call_06_617c                                  ;; 06:60eb $cd $7c $61
    call call_00_019e                                  ;; 06:60ee $cd $9e $01
    call call_06_629b                                  ;; 06:60f1 $cd $9b $62
    ld   DE, wC600                                     ;; 06:60f4 $11 $00 $c6
    ld   BC, $c08                                      ;; 06:60f7 $01 $08 $0c
    call call_06_63ca                                  ;; 06:60fa $cd $ca $63
    call call_06_63de                                  ;; 06:60fd $cd $de $63
    call call_06_611b                                  ;; 06:6100 $cd $1b $61
    jr   C, .jp_06_609b                                ;; 06:6103 $38 $96
    jp   .jp_06_6089                                   ;; 06:6105 $c3 $89 $60
.jr_06_6108:
    ld   HL, wC3AC                                     ;; 06:6108 $21 $ac $c3
.jr_06_610b:
    dec  [HL]                                          ;; 06:610b $35
    ld   A, [HL]                                       ;; 06:610c $7e
    cp   A, $ff                                        ;; 06:610d $fe $ff
    jr   Z, .jr_06_6119                                ;; 06:610f $28 $08
    call call_06_5eae                                  ;; 06:6111 $cd $ae $5e
    jp   Z, .jp_06_609b                                ;; 06:6114 $ca $9b $60
    jr   .jr_06_610b                                   ;; 06:6117 $18 $f2
.jr_06_6119:
    scf                                                ;; 06:6119 $37
    ret                                                ;; 06:611a $c9

call_06_611b:
    call call_00_019b                                  ;; 06:611b $cd $9b $01
    bit  5, A                                          ;; 06:611e $cb $6f
    jr   NZ, .jr_06_6144                               ;; 06:6120 $20 $22
    bit  4, A                                          ;; 06:6122 $cb $67
    jr   NZ, .jr_06_615b                               ;; 06:6124 $20 $35
    bit  1, A                                          ;; 06:6126 $cb $4f
    jr   NZ, .jr_06_6142                               ;; 06:6128 $20 $18
    bit  0, A                                          ;; 06:612a $cb $47
    jr   NZ, .jr_06_6133                               ;; 06:612c $20 $05
    call call_00_01a4                                  ;; 06:612e $cd $a4 $01
    jr   call_06_611b                                  ;; 06:6131 $18 $e8
.jr_06_6133:
    ld   A, [wC3AC]                                    ;; 06:6133 $fa $ac $c3
    call call_06_5ea3                                  ;; 06:6136 $cd $a3 $5e
    inc  DE                                            ;; 06:6139 $13
    ld   A, [wD831]                                    ;; 06:613a $fa $31 $d8
    add  A, $04                                        ;; 06:613d $c6 $04
    ld   [DE], A                                       ;; 06:613f $12
    and  A, A                                          ;; 06:6140 $a7
    ret                                                ;; 06:6141 $c9
.jr_06_6142:
    scf                                                ;; 06:6142 $37
    ret                                                ;; 06:6143 $c9
.jr_06_6144:
    ld   HL, wD831                                     ;; 06:6144 $21 $31 $d8
.jr_06_6147:
    ld   A, [HL]                                       ;; 06:6147 $7e
    and  A, A                                          ;; 06:6148 $a7
    jr   Z, .jr_06_614e                                ;; 06:6149 $28 $03
    dec  A                                             ;; 06:614b $3d
    jr   .jr_06_6150                                   ;; 06:614c $18 $02
.jr_06_614e:
    ld   A, $02                                        ;; 06:614e $3e $02
.jr_06_6150:
    ld   [HL], A                                       ;; 06:6150 $77
    call call_06_6172                                  ;; 06:6151 $cd $72 $61
    jr   Z, .jr_06_6147                                ;; 06:6154 $28 $f1
    call call_06_617c                                  ;; 06:6156 $cd $7c $61
    jr   call_06_611b                                  ;; 06:6159 $18 $c0
.jr_06_615b:
    ld   HL, wD831                                     ;; 06:615b $21 $31 $d8
.jr_06_615e:
    ld   A, [HL]                                       ;; 06:615e $7e
    cp   A, $02                                        ;; 06:615f $fe $02
    jr   Z, .jr_06_6166                                ;; 06:6161 $28 $03
    inc  A                                             ;; 06:6163 $3c
    jr   .jr_06_6167                                   ;; 06:6164 $18 $01
.jr_06_6166:
    xor  A, A                                          ;; 06:6166 $af
.jr_06_6167:
    ld   [HL], A                                       ;; 06:6167 $77
    call call_06_6172                                  ;; 06:6168 $cd $72 $61
    jr   Z, .jr_06_615e                                ;; 06:616b $28 $f1
    call call_06_617c                                  ;; 06:616d $cd $7c $61
    jr   call_06_611b                                  ;; 06:6170 $18 $a9

call_06_6172:
    push HL                                            ;; 06:6172 $e5
    ld   HL, wD825                                     ;; 06:6173 $21 $25 $d8
    call call_06_6185                                  ;; 06:6176 $cd $85 $61
    inc  A                                             ;; 06:6179 $3c
    pop  HL                                            ;; 06:617a $e1
    ret                                                ;; 06:617b $c9

call_06_617c:
    ld   HL, wD82E                                     ;; 06:617c $21 $2e $d8
    call call_06_6185                                  ;; 06:617f $cd $85 $61
    ldh  [hFF93], A                                    ;; 06:6182 $e0 $93
    ret                                                ;; 06:6184 $c9

call_06_6185:
    ld   A, [wD831]                                    ;; 06:6185 $fa $31 $d8
    rst  add_hl_a                                      ;; 06:6188 $c7
    ld   A, [HL]                                       ;; 06:6189 $7e
    ret                                                ;; 06:618a $c9

call_06_618b:
    call call_00_018c                                  ;; 06:618b $cd $8c $01
    call call_00_01a7                                  ;; 06:618e $cd $a7 $01
    call call_06_633f                                  ;; 06:6191 $cd $3f $63
    call call_06_637e                                  ;; 06:6194 $cd $7e $63
    ld   HL, wC3DA                                     ;; 06:6197 $21 $da $c3
    ld   BC, $800                                      ;; 06:619a $01 $00 $08
.jr_06_619d:
    ld   A, [HL+]                                      ;; 06:619d $2a
    inc  A                                             ;; 06:619e $3c
    jr   Z, .jr_06_61a2                                ;; 06:619f $28 $01
    inc  C                                             ;; 06:61a1 $0c
.jr_06_61a2:
    dec  B                                             ;; 06:61a2 $05
    jr   NZ, .jr_06_619d                               ;; 06:61a3 $20 $f8
    inc  C                                             ;; 06:61a5 $0c
    dec  C                                             ;; 06:61a6 $0d
    jr   NZ, .jr_06_61bb                               ;; 06:61a7 $20 $12
    call call_06_63bf                                  ;; 06:61a9 $cd $bf $63
.jr_06_61ac:
    call call_00_019b                                  ;; 06:61ac $cd $9b $01
    bit  1, A                                          ;; 06:61af $cb $4f
    jr   NZ, .jr_06_621d                               ;; 06:61b1 $20 $6a
    bit  0, A                                          ;; 06:61b3 $cb $47
    jr   Z, .jr_06_61ac                                ;; 06:61b5 $28 $f5
    ld   C, $ff                                        ;; 06:61b7 $0e $ff
    jr   .jr_06_6213                                   ;; 06:61b9 $18 $58
.jr_06_61bb:
    ld   A, [wC3AC]                                    ;; 06:61bb $fa $ac $c3
    push AF                                            ;; 06:61be $f5
    ld   HL, wD836                                     ;; 06:61bf $21 $36 $d8
    rst  add_hl_a                                      ;; 06:61c2 $c7
    ld   A, [HL]                                       ;; 06:61c3 $7e
    ld   [wC424], A                                    ;; 06:61c4 $ea $24 $c4
    call call_06_63a6                                  ;; 06:61c7 $cd $a6 $63
    pop  AF                                            ;; 06:61ca $f1
    ld   HL, wD832                                     ;; 06:61cb $21 $32 $d8
    rst  add_hl_a                                      ;; 06:61ce $c7
    ld   A, [HL]                                       ;; 06:61cf $7e
    ld   D, A                                          ;; 06:61d0 $57
    ld   E, $08                                        ;; 06:61d1 $1e $08
    call call_00_01a1                                  ;; 06:61d3 $cd $a1 $01
.jp_06_61d6:
    call call_00_019b                                  ;; 06:61d6 $cd $9b $01
    bit  7, A                                          ;; 06:61d9 $cb $7f
    jr   NZ, .jr_06_621f                               ;; 06:61db $20 $42
    bit  6, A                                          ;; 06:61dd $cb $77
    jr   NZ, .jr_06_6236                               ;; 06:61df $20 $55
    bit  1, A                                          ;; 06:61e1 $cb $4f
    jr   NZ, .jr_06_621d                               ;; 06:61e3 $20 $38
    bit  0, A                                          ;; 06:61e5 $cb $47
    jr   NZ, .jr_06_61ee                               ;; 06:61e7 $20 $05
    call call_00_01a4                                  ;; 06:61e9 $cd $a4 $01
    jr   .jp_06_61d6                                   ;; 06:61ec $18 $e8
.jr_06_61ee:
    ld   HL, wC424                                     ;; 06:61ee $21 $24 $c4
    ld   L, [HL]                                       ;; 06:61f1 $6e
    ldh  A, [hFF92]                                    ;; 06:61f2 $f0 $92
    sub  A, $0a                                        ;; 06:61f4 $d6 $0a
    srl  A                                             ;; 06:61f6 $cb $3f
    add  A, L                                          ;; 06:61f8 $85
    ld   C, A                                          ;; 06:61f9 $4f
    ld   HL, wC3DA                                     ;; 06:61fa $21 $da $c3
    rst  add_hl_a                                      ;; 06:61fd $c7
    ld   A, [HL]                                       ;; 06:61fe $7e
    inc  A                                             ;; 06:61ff $3c
    jr   Z, .jp_06_61d6                                ;; 06:6200 $28 $d4
    ld   A, [wC3AC]                                    ;; 06:6202 $fa $ac $c3
    ld   HL, wD832                                     ;; 06:6205 $21 $32 $d8
    rst  add_hl_a                                      ;; 06:6208 $c7
    ldh  A, [hFF92]                                    ;; 06:6209 $f0 $92
    ld   [HL], A                                       ;; 06:620b $77
    ld   A, $04                                        ;; 06:620c $3e $04
    rst  add_hl_a                                      ;; 06:620e $c7
    ld   A, [wC424]                                    ;; 06:620f $fa $24 $c4
    ld   [HL], A                                       ;; 06:6212 $77
.jr_06_6213:
    ld   A, [wC3AC]                                    ;; 06:6213 $fa $ac $c3
    call call_06_5ea3                                  ;; 06:6216 $cd $a3 $5e
    ld   A, C                                          ;; 06:6219 $79
    ld   [DE], A                                       ;; 06:621a $12
    and  A, A                                          ;; 06:621b $a7
    ret                                                ;; 06:621c $c9
.jr_06_621d:
    scf                                                ;; 06:621d $37
    ret                                                ;; 06:621e $c9
.jr_06_621f:
    ldh  A, [hFF92]                                    ;; 06:621f $f0 $92
    add  A, $02                                        ;; 06:6221 $c6 $02
    cp   A, $12                                        ;; 06:6223 $fe $12
    jr   C, .jr_06_6232                                ;; 06:6225 $38 $0b
    ld   HL, wC424                                     ;; 06:6227 $21 $24 $c4
    ld   A, [HL]                                       ;; 06:622a $7e
    cp   A, $04                                        ;; 06:622b $fe $04
    jr   Z, .jp_06_61d6                                ;; 06:622d $28 $a7
    inc  [HL]                                          ;; 06:622f $34
    jr   .jr_06_624c                                   ;; 06:6230 $18 $1a
.jr_06_6232:
    ldh  [hFF92], A                                    ;; 06:6232 $e0 $92
    jr   .jp_06_61d6                                   ;; 06:6234 $18 $a0
.jr_06_6236:
    ldh  A, [hFF92]                                    ;; 06:6236 $f0 $92
    sub  A, $02                                        ;; 06:6238 $d6 $02
    cp   A, $0a                                        ;; 06:623a $fe $0a
    jr   NC, .jr_06_6248                               ;; 06:623c $30 $0a
    ld   HL, wC424                                     ;; 06:623e $21 $24 $c4
    ld   A, [HL]                                       ;; 06:6241 $7e
    and  A, A                                          ;; 06:6242 $a7
    jr   Z, .jp_06_61d6                                ;; 06:6243 $28 $91
    dec  [HL]                                          ;; 06:6245 $35
    jr   .jr_06_624c                                   ;; 06:6246 $18 $04
.jr_06_6248:
    ldh  [hFF92], A                                    ;; 06:6248 $e0 $92
    jr   .jp_06_61d6                                   ;; 06:624a $18 $8a
.jr_06_624c:
    call call_06_63a6                                  ;; 06:624c $cd $a6 $63
    jp   .jp_06_61d6                                   ;; 06:624f $c3 $d6 $61

call_06_6252:
    call call_00_019b                                  ;; 06:6252 $cd $9b $01
    bit  7, A                                          ;; 06:6255 $cb $7f
    jr   NZ, .jr_06_6274                               ;; 06:6257 $20 $1b
    bit  6, A                                          ;; 06:6259 $cb $77
    jr   NZ, .jr_06_6282                               ;; 06:625b $20 $25
    bit  1, A                                          ;; 06:625d $cb $4f
    jr   NZ, .jr_06_6272                               ;; 06:625f $20 $11
    bit  0, A                                          ;; 06:6261 $cb $47
    jr   NZ, .jr_06_626a                               ;; 06:6263 $20 $05
    call call_00_01a4                                  ;; 06:6265 $cd $a4 $01
    jr   call_06_6252                                  ;; 06:6268 $18 $e8
.jr_06_626a:
    ldh  A, [hFF92]                                    ;; 06:626a $f0 $92
    sub  A, $09                                        ;; 06:626c $d6 $09
    srl  A                                             ;; 06:626e $cb $3f
    and  A, A                                          ;; 06:6270 $a7
    ret                                                ;; 06:6271 $c9
.jr_06_6272:
    scf                                                ;; 06:6272 $37
    ret                                                ;; 06:6273 $c9
.jr_06_6274:
    ldh  A, [hFF92]                                    ;; 06:6274 $f0 $92
    add  A, $02                                        ;; 06:6276 $c6 $02
    cp   A, $11                                        ;; 06:6278 $fe $11
    jr   C, .jr_06_627e                                ;; 06:627a $38 $02
    ld   A, $09                                        ;; 06:627c $3e $09
.jr_06_627e:
    ldh  [hFF92], A                                    ;; 06:627e $e0 $92
    jr   call_06_6252                                  ;; 06:6280 $18 $d0
.jr_06_6282:
    ldh  A, [hFF92]                                    ;; 06:6282 $f0 $92
    sub  A, $02                                        ;; 06:6284 $d6 $02
    cp   A, $09                                        ;; 06:6286 $fe $09
    jr   NC, .jr_06_628c                               ;; 06:6288 $30 $02
    ld   A, $0f                                        ;; 06:628a $3e $0f
.jr_06_628c:
    ldh  [hFF92], A                                    ;; 06:628c $e0 $92
    jr   call_06_6252                                  ;; 06:628e $18 $c2

jp_06_6290:
    call call_00_0177                                  ;; 06:6290 $cd $77 $01
.jr_06_6293:
    ldh  A, [hFF8D]                                    ;; 06:6293 $f0 $8d
    and  A, A                                          ;; 06:6295 $a7
    jr   Z, .jr_06_6293                                ;; 06:6296 $28 $fb
    jp   jp_00_0101                                    ;; 06:6298 $c3 $01 $01

call_06_629b:
    call call_06_63ed                                  ;; 06:629b $cd $ed $63
    ld   HL, wC700                                     ;; 06:629e $21 $00 $c7
    ld   BC, $a06                                      ;; 06:62a1 $01 $06 $0a
    call call_00_01bf                                  ;; 06:62a4 $cd $bf $01
    ld   A, $ff                                        ;; 06:62a7 $3e $ff
    ld   HL, wC3C8                                     ;; 06:62a9 $21 $c8 $c3
    ld   B, $08                                        ;; 06:62ac $06 $08
    call call_00_007c                                  ;; 06:62ae $cd $7c $00
    ld   HL, wC3AD                                     ;; 06:62b1 $21 $ad $c3
    ld   B, $03                                        ;; 06:62b4 $06 $03
    call call_00_007c                                  ;; 06:62b6 $cd $7c $00
    ld   H, $d3                                        ;; 06:62b9 $26 $d3
    ld   DE, wC3C8                                     ;; 06:62bb $11 $c8 $c3
    ld   A, $e9                                        ;; 06:62be $3e $e9
    ldh  [hFFD0], A                                    ;; 06:62c0 $e0 $d0
    call call_06_62d8                                  ;; 06:62c2 $cd $d8 $62
    ld   DE, wC3AD                                     ;; 06:62c5 $11 $ad $c3
    ld   A, $ea                                        ;; 06:62c8 $3e $ea
    ldh  [hFFD0], A                                    ;; 06:62ca $e0 $d0
    call call_06_62d8                                  ;; 06:62cc $cd $d8 $62
    ld   A, $0c                                        ;; 06:62cf $3e $0c
    ld   E, $03                                        ;; 06:62d1 $1e $03
    ld   HL, wC719                                     ;; 06:62d3 $21 $19 $c7
    rst  rst_00_0008                                   ;; 06:62d6 $cf
    ret                                                ;; 06:62d7 $c9

call_06_62d8:
    ld   BC, $300                                      ;; 06:62d8 $01 $00 $03
.jr_06_62db:
    ld   A, $25                                        ;; 06:62db $3e $25
    add  A, C                                          ;; 06:62dd $81
    ld   L, A                                          ;; 06:62de $6f
    ld   A, [HL]                                       ;; 06:62df $7e
    inc  A                                             ;; 06:62e0 $3c
    jr   Z, .jr_06_62ed                                ;; 06:62e1 $28 $0a
    ldh  A, [hFFD0]                                    ;; 06:62e3 $f0 $d0
    sla  C                                             ;; 06:62e5 $cb $21
    add  A, C                                          ;; 06:62e7 $81
    srl  C                                             ;; 06:62e8 $cb $39
    ld   L, A                                          ;; 06:62ea $6f
    ld   A, [HL]                                       ;; 06:62eb $7e
    ld   [DE], A                                       ;; 06:62ec $12
.jr_06_62ed:
    inc  DE                                            ;; 06:62ed $13
    inc  C                                             ;; 06:62ee $0c
    dec  B                                             ;; 06:62ef $05
    jr   NZ, .jr_06_62db                               ;; 06:62f0 $20 $e9
    ret                                                ;; 06:62f2 $c9

call_06_62f3:
    call call_06_63ed                                  ;; 06:62f3 $cd $ed $63
    ld   HL, wC700                                     ;; 06:62f6 $21 $00 $c7
    ld   BC, $708                                      ;; 06:62f9 $01 $08 $07
    call call_00_01bf                                  ;; 06:62fc $cd $bf $01
    call call_06_5e4a                                  ;; 06:62ff $cd $4a $5e
    ld   B, $08                                        ;; 06:6302 $06 $08
    ldh  A, [hFFD2]                                    ;; 06:6304 $f0 $d2
    ld   C, A                                          ;; 06:6306 $4f
    ld   A, $09                                        ;; 06:6307 $3e $09
    ld   E, $02                                        ;; 06:6309 $1e $02
    ld   HL, wC70A                                     ;; 06:630b $21 $0a $c7
    rst  rst_00_0008                                   ;; 06:630e $cf
    ld   BC, $400                                      ;; 06:630f $01 $00 $04
    ld   DE, $8000                                     ;; 06:6312 $11 $00 $80
.jr_06_6315:
    push BC                                            ;; 06:6315 $c5
    ld   A, C                                          ;; 06:6316 $79
    call call_00_01b9                                  ;; 06:6317 $cd $b9 $01
    ld   C, $00                                        ;; 06:631a $0e $00
    ld   A, [HL]                                       ;; 06:631c $7e
    inc  A                                             ;; 06:631d $3c
    jr   Z, .jr_06_632e                                ;; 06:631e $28 $0e
    dec  A                                             ;; 06:6320 $3d
    jr   Z, .jr_06_6324                                ;; 06:6321 $28 $01
    inc  C                                             ;; 06:6323 $0c
.jr_06_6324:
    ld   A, L                                          ;; 06:6324 $7d
    add  A, $05                                        ;; 06:6325 $c6 $05
    ld   L, A                                          ;; 06:6327 $6f
    ld   A, [HL]                                       ;; 06:6328 $7e
    call call_00_0189                                  ;; 06:6329 $cd $89 $01
    jr   .jr_06_6337                                   ;; 06:632c $18 $09
.jr_06_632e:
    ld   L, E                                          ;; 06:632e $6b
    ld   H, D                                          ;; 06:632f $62
    ld   B, $40                                        ;; 06:6330 $06 $40
    call call_00_00a3                                  ;; 06:6332 $cd $a3 $00
    ld   E, L                                          ;; 06:6335 $5d
    ld   D, H                                          ;; 06:6336 $54
.jr_06_6337:
    pop  BC                                            ;; 06:6337 $c1
    inc  C                                             ;; 06:6338 $0c
    dec  B                                             ;; 06:6339 $05
    jr   NZ, .jr_06_6315                               ;; 06:633a $20 $d9
    jp   call_06_5e7f                                  ;; 06:633c $c3 $7f $5e

call_06_633f:
    call call_06_63ed                                  ;; 06:633f $cd $ed $63
    ld   HL, wC700                                     ;; 06:6342 $21 $00 $c7
    ld   BC, $704                                      ;; 06:6345 $01 $04 $07
    call call_00_01bf                                  ;; 06:6348 $cd $bf $01
    call call_06_5e4a                                  ;; 06:634b $cd $4a $5e
    ld   A, $09                                        ;; 06:634e $3e $09
    ld   E, $06                                        ;; 06:6350 $1e $06
    ld   BC, $a01                                      ;; 06:6352 $01 $01 $0a
    ld   HL, wC713                                     ;; 06:6355 $21 $13 $c7
    rst  rst_00_0008                                   ;; 06:6358 $cf
    call call_06_5e7f                                  ;; 06:6359 $cd $7f $5e
    ld   DE, wC600                                     ;; 06:635c $11 $00 $c6
    ld   BC, $906                                      ;; 06:635f $01 $06 $09
    jp   call_06_63ca                                  ;; 06:6362 $c3 $ca $63

call_06_6365:
    ld   DE, $900                                      ;; 06:6365 $11 $00 $09
    call call_00_01a1                                  ;; 06:6368 $cd $a1 $01
    ld   A, $02                                        ;; 06:636b $3e $02
    ldh  [hFFD2], A                                    ;; 06:636d $e0 $d2
    call call_06_62f3                                  ;; 06:636f $cd $f3 $62
    ld   DE, wC601                                     ;; 06:6372 $11 $01 $c6
    ld   BC, $90a                                      ;; 06:6375 $01 $0a $09
    call call_06_63ca                                  ;; 06:6378 $cd $ca $63
    call call_06_63de                                  ;; 06:637b $cd $de $63

call_06_637e:
    call call_06_63ed                                  ;; 06:637e $cd $ed $63
    ld   HL, wC700                                     ;; 06:6381 $21 $00 $c7
    ld   BC, $a08                                      ;; 06:6384 $01 $08 $0a
    call call_00_01bf                                  ;; 06:6387 $cd $bf $01
    ld   DE, wC608                                     ;; 06:638a $11 $08 $c6
    ld   BC, $c0a                                      ;; 06:638d $01 $0a $0c
    call call_06_63ca                                  ;; 06:6390 $cd $ca $63
    ld   HL, wC3AC                                     ;; 06:6393 $21 $ac $c3
    ld   L, [HL]                                       ;; 06:6396 $6e
    call call_00_01ce                                  ;; 06:6397 $cd $ce $01
    call call_06_63ed                                  ;; 06:639a $cd $ed $63
    ld   A, $09                                        ;; 06:639d $3e $09
    ld   E, $05                                        ;; 06:639f $1e $05
    ld   HL, wC709                                     ;; 06:63a1 $21 $09 $c7
    rst  rst_00_0008                                   ;; 06:63a4 $cf
    ret                                                ;; 06:63a5 $c9

call_06_63a6:
    ld   A, [wC424]                                    ;; 06:63a6 $fa $24 $c4
    ld   L, A                                          ;; 06:63a9 $6f
    ld   H, $12                                        ;; 06:63aa $26 $12
    call call_00_015f                                  ;; 06:63ac $cd $5f $01
    ld   DE, wC700                                     ;; 06:63af $11 $00 $c7
    add  HL, DE                                        ;; 06:63b2 $19
    ld   DE, wC61E                                     ;; 06:63b3 $11 $1e $c6
    ld   BC, $908                                      ;; 06:63b6 $01 $08 $09
    call call_06_63cd                                  ;; 06:63b9 $cd $cd $63
    jp   call_06_63de                                  ;; 06:63bc $c3 $de $63

call_06_63bf:
    ld   A, $14                                        ;; 06:63bf $3e $14
    ld   E, $08                                        ;; 06:63c1 $1e $08
    ld   HL, wC631                                     ;; 06:63c3 $21 $31 $c6
    rst  rst_00_0008                                   ;; 06:63c6 $cf
    jp   call_06_63de                                  ;; 06:63c7 $c3 $de $63

call_06_63ca:
    ld   HL, wC700                                     ;; 06:63ca $21 $00 $c7

call_06_63cd:
    push BC                                            ;; 06:63cd $c5
.jr_06_63ce:
    ld   A, [HL+]                                      ;; 06:63ce $2a
    ld   [DE], A                                       ;; 06:63cf $12
    inc  DE                                            ;; 06:63d0 $13
    dec  B                                             ;; 06:63d1 $05
    jr   NZ, .jr_06_63ce                               ;; 06:63d2 $20 $fa
    pop  BC                                            ;; 06:63d4 $c1
    ld   A, $14                                        ;; 06:63d5 $3e $14
    sub  A, B                                          ;; 06:63d7 $90
    add  A, E                                          ;; 06:63d8 $83
    ld   E, A                                          ;; 06:63d9 $5f
    dec  C                                             ;; 06:63da $0d
    jr   NZ, call_06_63cd                              ;; 06:63db $20 $f0
    ret                                                ;; 06:63dd $c9

call_06_63de:
    ld   HL, wC600                                     ;; 06:63de $21 $00 $c6
    ld   DE, $9900                                     ;; 06:63e1 $11 $00 $99
    ld   BC, $140a                                     ;; 06:63e4 $01 $0a $14
    call call_00_0186                                  ;; 06:63e7 $cd $86 $01
    rst  rst_00_0010                                   ;; 06:63ea $d7
    rst  rst_00_0018                                   ;; 06:63eb $df
    ret                                                ;; 06:63ec $c9

call_06_63ed:
    ld   HL, wC700                                     ;; 06:63ed $21 $00 $c7
    ld   BC, $100                                      ;; 06:63f0 $01 $00 $01
    ld   A, $7f                                        ;; 06:63f3 $3e $7f
    jp   call_00_0082                                  ;; 06:63f5 $c3 $82 $00
    db   $62, $fb, $68, $ff, $ae, $ff, $ba, $ef        ;; 06:63f8 ????????
    db   $18, $10, $11, $12, $15, $13, $93, $16        ;; 06:6400 ????????
    db   $16, $11, $12, $15, $13, $93, $16, $94        ;; 06:6408 ????????
    db   $18, $12, $15, $13, $93, $16, $94, $95        ;; 06:6410 ????????
    db   $0a, $15, $13, $93, $16, $94, $95, $92        ;; 06:6418 ????????
    db   $0a, $13, $93, $16, $94, $95, $92, $17        ;; 06:6420 ????????
    db   $18, $93, $16, $94, $95, $92, $17, $91        ;; 06:6428 ????????
    db   $14, $94, $95, $92, $17, $91, $96, $90        ;; 06:6430 ????????
    db   $0a, $92, $17, $91, $96, $90, $14, $97        ;; 06:6438 ????????
    db   $0e, $18, $19, $1a, $1d, $1e, $1f, $9b        ;; 06:6440 ????????
    db   $06, $19, $1a, $1d, $1e, $1f, $9b, $1b        ;; 06:6448 ????????
    db   $0e, $1a, $1d, $1e, $1f, $9b, $1b, $9a        ;; 06:6450 ????????
    db   $06, $1d, $1e, $1f, $9b, $1b, $9a, $9c        ;; 06:6458 ????????
    db   $0e, $1e, $1f, $9b, $1b, $9a, $9c, $98        ;; 06:6460 ????????
    db   $06, $1f, $9b, $1b, $9a, $9c, $98, $99        ;; 06:6468 ????????
    db   $0e, $1b, $9a, $9c, $98, $99, $1c, $20        ;; 06:6470 ????????
    db   $06, $9c, $98, $99, $1c, $20, $a0, $9d        ;; 06:6478 ????????
    db   $0e, $99, $1c, $20, $a0, $9d, $9e, $9f        ;; 06:6480 ????????
    db   $18, $21, $23, $22, $26, $27, $a1, $24        ;; 06:6488 ????????
    db   $18, $23, $22, $26, $27, $a1, $24, $a3        ;; 06:6490 ????????
    db   $18, $22, $26, $27, $a1, $24, $a3, $a2        ;; 06:6498 ????????
    db   $16, $26, $27, $a1, $24, $a3, $a2, $28        ;; 06:64a0 ????????
    db   $0a, $27, $a1, $24, $a3, $a2, $28, $2b        ;; 06:64a8 ????????
    db   $18, $a1, $24, $a3, $a2, $28, $2b, $a8        ;; 06:64b0 ????????
    db   $18, $24, $a3, $a2, $28, $2b, $a8, $29        ;; 06:64b8 ????????
    db   $18, $a3, $a2, $28, $2b, $a8, $29, $ab        ;; 06:64c0 ????????
    db   $18, $a2, $28, $2b, $a8, $29, $ab, $a9        ;; 06:64c8 ????????
    db   $18, $28, $2b, $a8, $29, $ab, $a9, $aa        ;; 06:64d0 ????????
    db   $18, $2b, $a8, $29, $ab, $a9, $aa, $25        ;; 06:64d8 ????????
    db   $18, $a8, $29, $ab, $a9, $aa, $25, $a7        ;; 06:64e0 ????????
    db   $0a, $29, $ab, $a9, $aa, $25, $a7, $2a        ;; 06:64e8 ????????
    db   $0a, $ab, $a9, $aa, $25, $a7, $2a, $a5        ;; 06:64f0 ????????
    db   $06, $aa, $25, $a7, $2a, $a5, $a6, $a4        ;; 06:64f8 ????????
    db   $0e, $2d, $2c, $2e, $31, $32, $33, $2f        ;; 06:6500 ????????
    db   $06, $2c, $2e, $31, $32, $33, $2f, $af        ;; 06:6508 ????????
    db   $0e, $2e, $31, $32, $33, $2f, $af, $b0        ;; 06:6510 ????????
    db   $06, $31, $32, $33, $2f, $af, $b0, $ae        ;; 06:6518 ????????
    db   $0e, $32, $33, $2f, $af, $b0, $ae, $ac        ;; 06:6520 ????????
    db   $06, $33, $2f, $af, $b0, $ae, $ac, $b4        ;; 06:6528 ????????
    db   $0e, $2f, $af, $b0, $ae, $ac, $b4, $ad        ;; 06:6530 ????????
    db   $06, $af, $b0, $ae, $ac, $b4, $ad, $34        ;; 06:6538 ????????
    db   $0e, $b0, $ae, $ac, $b4, $ad, $34, $30        ;; 06:6540 ????????
    db   $06, $ae, $ac, $b4, $ad, $34, $30, $b1        ;; 06:6548 ????????
    db   $0e, $b4, $ad, $34, $30, $b1, $b2, $b3        ;; 06:6550 ????????
    db   $18, $35, $36, $b5, $b7, $3a, $38, $b6        ;; 06:6558 ????????
    db   $16, $36, $b5, $b7, $3a, $38, $b6, $39        ;; 06:6560 ????????
    db   $14, $b5, $b7, $3a, $38, $b6, $39, $ba        ;; 06:6568 ????????
    db   $14, $3a, $38, $b6, $39, $ba, $b9, $b8        ;; 06:6570 ????????
    db   $0e, $3b, $3c, $3d, $40, $41, $bd, $bf        ;; 06:6578 ????????
    db   $06, $3c, $3d, $40, $41, $bd, $bf, $3e        ;; 06:6580 ????????
    db   $0e, $3d, $40, $41, $bd, $bf, $3e, $bb        ;; 06:6588 ????????
    db   $06, $40, $41, $bd, $bf, $3e, $bb, $bc        ;; 06:6590 ????????
    db   $0e, $41, $bd, $bf, $3e, $bb, $bc, $42        ;; 06:6598 ????????
    db   $06, $bd, $bf, $3e, $bb, $bc, $42, $43        ;; 06:65a0 ????????
    db   $0e, $bf, $3e, $bb, $bc, $42, $43, $44        ;; 06:65a8 ????????
    db   $06, $3e, $bb, $bc, $42, $43, $44, $45        ;; 06:65b0 ????????
    db   $0e, $bb, $bc, $42, $43, $44, $45, $c4        ;; 06:65b8 ????????
    db   $06, $bc, $42, $43, $44, $45, $c4, $c1        ;; 06:65c0 ????????
    db   $0e, $42, $43, $44, $45, $c4, $c1, $c2        ;; 06:65c8 ????????
    db   $06, $43, $44, $45, $c4, $c1, $c2, $c3        ;; 06:65d0 ????????
    db   $0e, $45, $c4, $c1, $c2, $c3, $3f, $c5        ;; 06:65d8 ????????
    db   $0e, $c1, $c2, $c3, $3f, $c5, $be, $c0        ;; 06:65e0 ????????
    db   $02, $00, $00, $00, $00, $00, $00, $00        ;; 06:65e8 ????????
    db   $18, $47, $48, $ca, $46, $4d, $c9, $4b        ;; 06:65f0 ????????
    db   $18, $48, $ca, $46, $4d, $c9, $4b, $cb        ;; 06:65f8 ????????
    db   $18, $ca, $46, $4d, $c9, $4b, $cb, $d0        ;; 06:6600 ????????
    db   $0e, $46, $4d, $c9, $4b, $cb, $d0, $d4        ;; 06:6608 ????????
    db   $0e, $4d, $c9, $4b, $cb, $d0, $d4, $4c        ;; 06:6610 ????????
    db   $18, $c9, $4b, $cb, $d0, $d4, $4c, $49        ;; 06:6618 ????????
    db   $0e, $4b, $cb, $d0, $d4, $4c, $49, $cd        ;; 06:6620 ????????
    db   $0e, $cb, $d0, $d4, $4c, $49, $cd, $d7        ;; 06:6628 ????????
    db   $0e, $d0, $d4, $4c, $49, $cd, $d7, $52        ;; 06:6630 ????????
    db   $0e, $d4, $4c, $49, $cd, $d7, $52, $d5        ;; 06:6638 ????????
    db   $0e, $4c, $49, $cd, $d7, $52, $d5, $53        ;; 06:6640 ????????
    db   $0e, $49, $cd, $d7, $52, $d5, $53, $51        ;; 06:6648 ????????
    db   $0e, $cd, $d7, $52, $d5, $53, $51, $5d        ;; 06:6650 ????????
    db   $0e, $d7, $52, $d5, $53, $51, $5d, $4f        ;; 06:6658 ????????
    db   $0e, $52, $d5, $53, $51, $5d, $4f, $4a        ;; 06:6660 ????????
    db   $18, $d5, $53, $51, $5d, $4f, $4a, $d8        ;; 06:6668 ????????
    db   $14, $53, $51, $5d, $4f, $4a, $d8, $50        ;; 06:6670 ????????
    db   $18, $51, $5d, $4f, $4a, $d8, $50, $d9        ;; 06:6678 ????????
    db   $16, $5d, $4f, $4a, $d8, $50, $d9, $4e        ;; 06:6680 ????????
    db   $16, $4f, $4a, $d8, $50, $d9, $4e, $57        ;; 06:6688 ????????
    db   $10, $4a, $d8, $50, $d9, $4e, $57, $d3        ;; 06:6690 ????????
    db   $18, $d8, $50, $d9, $4e, $57, $d3, $da        ;; 06:6698 ????????
    db   $18, $50, $d9, $4e, $57, $d3, $da, $db        ;; 06:66a0 ????????
    db   $18, $d9, $4e, $57, $d3, $da, $db, $e0        ;; 06:66a8 ????????
    db   $18, $4e, $57, $d3, $da, $db, $e0, $df        ;; 06:66b0 ????????
    db   $18, $57, $d3, $da, $db, $e0, $df, $dd        ;; 06:66b8 ????????
    db   $18, $d3, $da, $db, $e0, $df, $dd, $59        ;; 06:66c0 ????????
    db   $18, $da, $db, $e0, $df, $dd, $59, $5b        ;; 06:66c8 ????????
    db   $18, $db, $e0, $df, $dd, $59, $5b, $58        ;; 06:66d0 ????????
    db   $18, $e0, $df, $dd, $59, $5b, $58, $de        ;; 06:66d8 ????????
    db   $18, $df, $dd, $59, $5b, $58, $de, $5c        ;; 06:66e0 ????????
    db   $10, $dd, $59, $5b, $58, $de, $5c, $60        ;; 06:66e8 ????????
    db   $18, $59, $5b, $58, $de, $5c, $60, $dc        ;; 06:66f0 ????????
    db   $18, $5b, $58, $de, $5c, $60, $dc, $5f        ;; 06:66f8 ????????
    db   $18, $de, $5c, $60, $dc, $5f, $ce, $5e        ;; 06:6700 ????????
    db   $18, $60, $dc, $5f, $ce, $5e, $cc, $d1        ;; 06:6708 ????????
    db   $18, $5f, $ce, $5e, $cc, $d1, $55, $56        ;; 06:6710 ????????
    db   $18, $5e, $cc, $d1, $55, $56, $54, $c8        ;; 06:6718 ????????
    db   $18, $d1, $55, $56, $54, $c8, $c6, $c7        ;; 06:6720 ????????
    db   $18, $56, $54, $c8, $c6, $c7, $cf, $d2        ;; 06:6728 ????????
    db   $18, $c8, $c6, $c7, $cf, $d2, $5a, $d6        ;; 06:6730 ????????
    db   $0e, $61, $62, $63, $66, $68, $67, $64        ;; 06:6738 ????????
    db   $06, $62, $63, $66, $68, $67, $64, $e3        ;; 06:6740 ????????
    db   $0e, $63, $66, $68, $67, $64, $e3, $e1        ;; 06:6748 ????????
    db   $06, $66, $68, $67, $64, $e3, $e1, $e2        ;; 06:6750 ????????
    db   $0e, $68, $67, $64, $e3, $e1, $e2, $69        ;; 06:6758 ????????
    db   $06, $67, $64, $e3, $e1, $e2, $69, $6a        ;; 06:6760 ????????
    db   $0e, $64, $e3, $e1, $e2, $69, $6a, $65        ;; 06:6768 ????????
    db   $06, $e3, $e1, $e2, $69, $6a, $65, $e8        ;; 06:6770 ????????
    db   $0e, $e1, $e2, $69, $6a, $65, $e8, $e7        ;; 06:6778 ????????
    db   $06, $e2, $69, $6a, $65, $e8, $e7, $e9        ;; 06:6780 ????????
    db   $0e, $69, $6a, $65, $e8, $e7, $e9, $ea        ;; 06:6788 ????????
    db   $06, $6a, $65, $e8, $e7, $e9, $ea, $eb        ;; 06:6790 ????????
    db   $18, $65, $e8, $e7, $e9, $ea, $eb, $6b        ;; 06:6798 ????????
    db   $0e, $e8, $e7, $e9, $ea, $eb, $6b, $e4        ;; 06:67a0 ????????
    db   $0e, $e9, $ea, $eb, $6b, $e4, $e5, $e6        ;; 06:67a8 ????????
    db   $18, $6c, $6d, $6e, $71, $72, $73, $6f        ;; 06:67b0 ????????
    db   $18, $6d, $6e, $71, $72, $73, $6f, $ef        ;; 06:67b8 ????????
    db   $18, $6e, $71, $72, $73, $6f, $ef, $f0        ;; 06:67c0 ????????
    db   $18, $71, $72, $73, $6f, $ef, $f0, $74        ;; 06:67c8 ????????
    db   $18, $72, $73, $6f, $ef, $f0, $74, $ed        ;; 06:67d0 ????????
    db   $18, $73, $6f, $ef, $f0, $74, $ed, $70        ;; 06:67d8 ????????
    db   $18, $ef, $f0, $74, $ed, $70, $ec, $ee        ;; 06:67e0 ????????
    db   $18, $74, $ed, $70, $ec, $ee, $f4, $f1        ;; 06:67e8 ????????
    db   $18, $70, $ec, $ee, $f4, $f1, $f2, $f3        ;; 06:67f0 ????????
    db   $18, $75, $76, $77, $f5, $ff, $7a, $7c        ;; 06:67f8 ????????
    db   $18, $76, $77, $f5, $ff, $7a, $7c, $78        ;; 06:6800 ????????
    db   $18, $77, $f5, $ff, $7a, $7c, $78, $f6        ;; 06:6808 ????????
    db   $18, $f5, $ff, $7a, $7c, $78, $f6, $f7        ;; 06:6810 ????????
    db   $18, $ff, $7a, $7c, $78, $f6, $f7, $f8        ;; 06:6818 ????????
    db   $18, $7a, $7c, $78, $f6, $f7, $f8, $7b        ;; 06:6820 ????????
    db   $18, $7c, $78, $f6, $f7, $f8, $7b, $7f        ;; 06:6828 ????????
    db   $18, $78, $f6, $f7, $f8, $7b, $7f, $7d        ;; 06:6830 ????????
    db   $18, $f6, $f7, $f8, $7b, $7f, $7d, $7e        ;; 06:6838 ????????
    db   $18, $f7, $f8, $7b, $7f, $7d, $7e, $79        ;; 06:6840 ????????
    db   $18, $f8, $7b, $7f, $7d, $7e, $79, $fc        ;; 06:6848 ????????
    db   $18, $7b, $7f, $7d, $7e, $79, $fc, $fd        ;; 06:6850 ????????
    db   $18, $7d, $7e, $79, $fc, $fd, $fe, $f9        ;; 06:6858 ????????
    db   $02, $79, $fc, $fd, $fe, $f9, $fa, $fb        ;; 06:6860 ????????

data_06_6868:
    db   $c5, $ac, $00, $00, $81, $c7, $c6, $00        ;; 06:6868 ????????
    db   $80, $81, $bd, $c1, $00, $80, $81, $be        ;; 06:6870 ????????
    db   $c2, $00, $80, $81, $bf, $c3, $00, $80        ;; 06:6878 ????????
    db   $81, $c0, $c4, $00, $80, $81, $a0, $48        ;; 06:6880 ????????
    db   $78, $80, $8b, $a6, $60, $9b, $80, $8b        ;; 06:6888 ????????
    db   $43, $42, $00, $80, $86, $36, $55, $a2        ;; 06:6890 ????????
    db   $87, $8b, $19, $03, $00, $80, $86, $0e        ;; 06:6898 ????????
    db   $20, $3d, $83, $00, $6d, $00, $00, $80        ;; 06:68a0 ????????
    db   $8a, $6d, $9c, $00, $8d, $90, $20, $15        ;; 06:68a8 ????????
    db   $00, $87, $86, $5e, $6c, $00, $80, $86        ;; 06:68b0 ????????
    db   $42, $96, $12, $00, $08, $12, $4e, $9b        ;; 06:68b8 ????????
    db   $01, $12, $00, $96, $78, $02, $09, $42        ;; 06:68c0 ????????
    db   $60, $9b, $02, $06, $42, $78, $48, $10        ;; 06:68c8 ????????
    db   $07, $00, $60, $8a, $02, $0d, $48, $24        ;; 06:68d0 ????????
    db   $4e, $01, $13, $24, $8a, $4e, $11, $0f        ;; 06:68d8 ????????
    db   $66, $7e, $06, $00, $14, $30, $1e, $3c        ;; 06:68e0 ????????
    db   $01, $08, $66, $43, $30, $02, $0b, $7e        ;; 06:68e8 ????????
    db   $01, $2a, $03, $0c, $1e, $79, $06, $12        ;; 06:68f0 ????????
    db   $0d, $3c, $43, $4f, $05, $0e, $2a, $6c        ;; 06:68f8 ????????
    db   $66, $06, $0f, $79, $4f, $01, $07, $10        ;; 06:6900 ????????
    db   $1e, $4f, $6c, $13, $11, $7f, $44, $07        ;; 06:6908 ????????
    db   $00, $0b, $07, $5a, $54, $01, $0c, $7f        ;; 06:6910 ????????
    db   $18, $97, $02, $0d, $5a, $1f, $25, $03        ;; 06:6918 ????????
    db   $0e, $25, $54, $07, $16, $0f, $36, $61        ;; 06:6920 ????????
    db   $49, $05, $10, $0c, $a1, $a7, $06, $11        ;; 06:6928 ????????
    db   $97, $44, $1f, $17, $12, $18, $36, $0c        ;; 06:6930 ????????
    db   $08, $13, $a1, $97, $49, $18, $14, $18        ;; 06:6938 ????????
    db   $61, $a7, $17, $15, $08, $31, $02, $00        ;; 06:6940 ????????
    db   $09, $0d, $84, $08, $01, $14, $31, $55        ;; 06:6948 ????????
    db   $8b, $02, $0b, $19, $72, $4a, $03, $0c        ;; 06:6950 ????????
    db   $2b, $37, $a2, $12, $0d, $0d, $19, $02        ;; 06:6958 ????????
    db   $05, $0e, $0d, $72, $2b, $06, $0f, $19        ;; 06:6960 ????????
    db   $2b, $84, $07, $10, $72, $55, $8b, $13        ;; 06:6968 ????????
    db   $09, $3d, $73, $13, $00, $06, $03, $0e        ;; 06:6970 ????????
    db   $3d, $01, $0d, $20, $6d, $13, $02, $07        ;; 06:6978 ????????
    db   $0e, $20, $9c, $03, $0e, $73, $9c, $90        ;; 06:6980 ????????
    db   $0c, $09, $03, $6d, $90, $05, $0b, $32        ;; 06:6988 ????????
    db   $67, $14, $00, $0b, $3e, $5b, $2c, $01        ;; 06:6990 ????????
    db   $0c, $14, $67, $98, $02, $07, $32, $26        ;; 06:6998 ????????
    db   $5b, $03, $0e, $3e, $38, $a8, $16, $07        ;; 06:69a0 ????????
    db   $5b, $1a, $2c, $05, $10, $91, $67, $50        ;; 06:69a8 ????????
    db   $06, $11, $98, $a8, $26, $17, $12, $1a        ;; 06:69b0 ????????
    db   $85, $38, $08, $13, $2c, $26, $91, $09        ;; 06:69b8 ????????
    db   $14, $50, $85, $98, $0a, $15, $3f, $5c        ;; 06:69c0 ????????
    db   $80, $00, $1b, $68, $9d, $5c, $01, $1c        ;; 06:69c8 ????????
    db   $15, $80, $7a, $02, $1d, $15, $5c, $0f        ;; 06:69d0 ????????
    db   $03, $05, $09, $86, $33, $17, $01, $33        ;; 06:69d8 ????????
    db   $4b, $62, $05, $07, $68, $74, $9d, $06        ;; 06:69e0 ????????
    db   $1a, $09, $1b, $a3, $07, $03, $2d, $15        ;; 06:69e8 ????????
    db   $21, $08, $18, $33, $56, $1b, $09, $1c        ;; 06:69f0 ????????
    db   $80, $39, $8c, $0a, $06, $4b, $92, $3f        ;; 06:69f8 ????????
    db   $0b, $19, $09, $62, $27, $0c, $1b, $15        ;; 06:6a00 ????????
    db   $51, $6e, $0d, $09, $39, $a9, $21, $0e        ;; 06:6a08 ????????
    db   $06, $2d, $45, $9d, $0f, $0b, $21, $62        ;; 06:6a10 ????????
    db   $74, $10, $1e, $0f, $62, $7a, $11, $0d        ;; 06:6a18 ????????
    db   $4b, $99, $1b, $12, $08, $0f, $56, $a3        ;; 06:6a20 ????????
    db   $13, $08, $62, $6e, $21, $1d, $09, $2d        ;; 06:6a28 ????????
    db   $27, $45, $15, $08, $39, $4b, $51, $16        ;; 06:6a30 ????????
    db   $12, $0f, $86, $8c, $17, $13, $92, $1b        ;; 06:6a38 ????????
    db   $8c, $18, $14, $39, $86, $92, $19, $15        ;; 06:6a40 ????????
    db   $56, $6e, $86, $1a, $16, $69, $81, $5d        ;; 06:6a48 ????????
    db   $00, $0b, $69, $a4, $81, $01, $17, $5d        ;; 06:6a50 ????????
    db   $63, $9e, $02, $0d, $69, $75, $57, $03        ;; 06:6a58 ????????
    db   $0e, $6f, $9e, $a4, $16, $0f, $63, $75        ;; 06:6a60 ????????
    db   $57, $05, $10, $7b, $93, $aa, $06, $11        ;; 06:6a68 ????????
    db   $75, $a4, $8d, $07, $12, $57, $93, $7b        ;; 06:6a70 ????????
    db   $08, $13, $aa, $6f, $8d, $09, $14, $87        ;; 06:6a78 ????????
    db   $8d, $93, $18, $15, $16, $40, $0a, $00        ;; 06:6a80 ????????
    db   $12, $34, $1c, $16, $01, $0a, $28, $16        ;; 06:6a88 ????????
    db   $40, $02, $13, $34, $3a, $10, $03, $0c        ;; 06:6a90 ????????
    db   $0a, $4c, $46, $12, $0d, $10, $9a, $46        ;; 06:6a98 ????????
    db   $05, $0e, $2e, $9a, $22, $06, $0f, $04        ;; 06:6aa0 ????????
    db   $1c, $3a, $07, $10, $10, $22, $4c, $08        ;; 06:6aa8 ????????
    db   $11, $82, $52, $6a, $00, $06, $76, $ab        ;; 06:6ab0 ????????
    db   $5e, $01, $0b, $6a, $7c, $a5, $02, $0c        ;; 06:6ab8 ????????
    db   $64, $ab, $7c, $03, $0d, $76, $a5, $9f        ;; 06:6ac0 ????????
    db   $14, $0e, $7c, $58, $9f, $05, $0f, $76        ;; 06:6ac8 ????????
    db   $ab, $70, $17, $10, $64, $a5, $88, $07        ;; 06:6ad0 ????????
    db   $11, $94, $52, $70, $08, $16, $58, $88        ;; 06:6ad8 ????????
    db   $8e, $09, $13, $82, $8e, $94, $17, $05        ;; 06:6ae0 ????????

data_06_6ae8:
    db   $93, $00, $06, $08, $09, $05, $a1, $21        ;; 06:6ae8 ????????
    db   $73, $9b, $03, $0c, $11, $12, $0b, $83        ;; 06:6af0 ????????
    db   $24, $73, $a3, $05, $12, $19, $1a, $11        ;; 06:6af8 ????????
    db   $74, $28, $73, $ab, $06, $16, $1e, $1f        ;; 06:6b00 ????????
    db   $15, $74, $2d, $73, $ab, $11, $46, $58        ;; 06:6b08 ????????
    db   $59, $45, $29, $33, $73, $bb, $13, $52        ;; 06:6b10 ????????
    db   $63, $63, $50, $29, $39, $73, $93, $02        ;; 06:6b18 ????????
    db   $09, $06, $0b, $05, $92, $41, $73, $93        ;; 06:6b20 ????????
    db   $03, $0b, $09, $0e, $06, $92, $44, $73        ;; 06:6b28 ????????
    db   $9b, $07, $17, $15, $1e, $0e, $74, $47        ;; 06:6b30 ????????
    db   $73, $9b, $0c, $2a, $28, $36, $1c, $47        ;; 06:6b38 ????????
    db   $4b, $73, $ab, $12, $47, $45, $58, $34        ;; 06:6b40 ????????
    db   $29, $4f, $73, $bb, $14, $52, $50, $63        ;; 06:6b48 ????????
    db   $3e, $29, $55, $73, $8b, $06, $0f, $10        ;; 06:6b50 ????????
    db   $08, $09, $83, $5d, $73, $93, $07, $12        ;; 06:6b58 ????????
    db   $13, $0a, $0b, $74, $5f, $73, $9b, $09        ;; 06:6b60 ????????
    db   $19, $1a, $0f, $10, $65, $62, $73, $a3        ;; 06:6b68 ????????
    db   $0d, $29, $2a, $1b, $1c, $47, $66, $73        ;; 06:6b70 ????????
    db   $ab, $13, $46, $47, $33, $34, $29, $6b        ;; 06:6b78 ????????
    db   $73, $bb, $15, $51, $52, $3d, $3e, $29        ;; 06:6b80 ????????
    db   $71, $73, $8b, $00, $04, $09, $07, $06        ;; 06:6b88 ????????
    db   $a1, $79, $73, $9b, $08, $13, $28, $26        ;; 06:6b90 ????????
    db   $1d, $65, $7b, $73, $a3, $09, $16, $2d        ;; 06:6b98 ????????
    db   $2b, $21, $56, $7f, $73, $ab, $0b, $1c        ;; 06:6ba0 ????????
    db   $37, $35, $29, $47, $84, $73, $b3, $11        ;; 06:6ba8 ????????
    db   $34, $59, $57, $46, $29, $8a, $73, $bb        ;; 06:6bb0 ????????
    db   $13, $3e, $63, $63, $51, $29, $91, $73        ;; 06:6bb8 ????????
    db   $93, $04, $0d, $16, $08, $06, $83, $99        ;; 06:6bc0 ????????
    db   $73, $9b, $06, $12, $20, $0c, $0a, $74        ;; 06:6bc8 ????????
    db   $9c, $73, $a3, $0b, $25, $3d, $1a, $18        ;; 06:6bd0 ????????
    db   $56, $a0, $73, $ab, $0c, $29, $43, $1d        ;; 06:6bd8 ????????
    db   $1b, $47, $a5, $73, $b3, $12, $46, $63        ;; 06:6be0 ????????
    db   $35, $33, $29, $ab, $73, $bb, $14, $51        ;; 06:6be8 ????????
    db   $63, $3f, $3d, $29, $b2, $73, $83, $02        ;; 06:6bf0 ????????
    db   $0c, $08, $0a, $05, $92, $ba, $73, $8b        ;; 06:6bf8 ????????
    db   $04, $12, $0c, $10, $07, $83, $bb, $73        ;; 06:6c00 ????????
    db   $93, $08, $23, $19, $21, $10, $65, $bd        ;; 06:6c08 ????????
    db   $73, $a3, $0d, $3d, $2e, $3b, $20, $47        ;; 06:6c10 ????????
    db   $c0, $73, $ab, $12, $59, $46, $57, $34        ;; 06:6c18 ????????
    db   $29, $c5, $73, $bb, $14, $63, $51, $63        ;; 06:6c20 ????????
    db   $3e, $29, $cb, $73, $8b, $02, $08, $07        ;; 06:6c28 ????????
    db   $05, $04, $a1, $d3, $73, $93, $06, $15        ;; 06:6c30 ????????
    db   $10, $0e, $09, $83, $d5, $73, $93, $0b        ;; 06:6c38 ????????
    db   $31, $26, $24, $19, $56, $d8, $73, $9b        ;; 06:6c40 ????????
    db   $0e, $3c, $2f, $2d, $20, $47, $db, $73        ;; 06:6c48 ????????
    db   $ab, $13, $58, $47, $45, $34, $29, $df        ;; 06:6c50 ????????
    db   $73, $bb, $15, $63, $52, $50, $3e, $29        ;; 06:6c58 ????????
    db   $e5, $73, $8b, $03, $0b, $06, $0e, $09        ;; 06:6c60 ????????
    db   $92, $ed, $73, $93, $06, $13, $0b, $19        ;; 06:6c68 ????????
    db   $11, $74, $ef, $73, $9b, $09, $1e, $13        ;; 06:6c70 ????????
    db   $27, $1c, $65, $f2, $73, $a3, $0d, $2f        ;; 06:6c78 ????????
    db   $20, $3c, $2d, $47, $f6, $73, $ab, $12        ;; 06:6c80 ????????
    db   $47, $34, $58, $45, $29, $fb, $73, $bb        ;; 06:6c88 ????????
    db   $14, $52, $3e, $63, $50, $29, $01, $74        ;; 06:6c90 ????????
    db   $8b, $02, $09, $0b, $07, $05, $92, $09        ;; 06:6c98 ????????
    db   $74, $93, $05, $10, $15, $0e, $09, $83        ;; 06:6ca0 ????????
    db   $0b, $74, $9b, $09, $1e, $27, $1c, $13        ;; 06:6ca8 ????????
    db   $65, $0e, $74, $a3, $0e, $33, $41, $31        ;; 06:6cb0 ????????
    db   $23, $38, $12, $74, $ab, $12, $47, $58        ;; 06:6cb8 ????????
    db   $45, $34, $29, $17, $74, $bb, $14, $52        ;; 06:6cc0 ????????
    db   $63, $50, $3e, $29, $1d, $74, $93, $05        ;; 06:6cc8 ????????
    db   $0d, $0b, $0c, $07, $83, $25, $74, $9b        ;; 06:6cd0 ????????
    db   $09, $1a, $18, $19, $10, $65, $28, $74        ;; 06:6cd8 ????????
    db   $a3, $0b, $22, $20, $21, $16, $56, $2c        ;; 06:6ce0 ????????
    db   $74, $ab, $0e, $33, $31, $32, $23, $38        ;; 06:6ce8 ????????
    db   $31, $74, $b3, $12, $47, $45, $46, $34        ;; 06:6cf0 ????????
    db   $29, $37, $74, $bb, $14, $52, $50, $51        ;; 06:6cf8 ????????
    db   $3e, $29, $3e, $74, $8b, $03, $09, $05        ;; 06:6d00 ????????
    db   $04, $08, $92, $46, $74, $9b, $09, $1a        ;; 06:6d08 ????????
    db   $10, $0f, $19, $65, $48, $74, $a3, $0c        ;; 06:6d10 ????????
    db   $26, $19, $18, $25, $56, $4c, $74, $a3        ;; 06:6d18 ????????
    db   $0f, $33, $23, $22, $32, $38, $51, $74        ;; 06:6d20 ????????
    db   $b3, $13, $47, $34, $33, $46, $29, $56        ;; 06:6d28 ????????
    db   $74, $bb, $15, $52, $3e, $3d, $51, $29        ;; 06:6d30 ????????
    db   $5d, $74, $8b, $01, $05, $07, $04, $02        ;; 06:6d38 ????????
    db   $a1, $65, $74, $97, $03, $08, $0b, $06        ;; 06:6d40 ????????
    db   $04, $92, $67, $74, $9b, $04, $0c, $0e        ;; 06:6d48 ????????
    db   $07, $05, $92, $6a, $74, $a3, $10, $37        ;; 06:6d50 ????????
    db   $47, $28, $26, $38, $6e, $74, $ab, $13        ;; 06:6d58 ????????
    db   $46, $58, $35, $33, $29, $73, $74, $bb        ;; 06:6d60 ????????
    db   $15, $51, $63, $3f, $3d, $29, $79, $74        ;; 06:6d68 ????????
    db   $83, $01, $08, $04, $05, $07, $a1, $81        ;; 06:6d70 ????????
    db   $74, $8b, $04, $11, $07, $0b, $0d, $83        ;; 06:6d78 ????????
    db   $82, $74, $93, $07, $1e, $0e, $15, $17        ;; 06:6d80 ????????
    db   $74, $84, $74, $9b, $0f, $47, $27, $36        ;; 06:6d88 ????????
    db   $38, $38, $87, $74, $a3, $12, $58, $34        ;; 06:6d90 ????????
    db   $45, $47, $29, $8b, $74, $bb, $14, $63        ;; 06:6d98 ????????
    db   $3e, $50, $52, $29, $90, $74, $83, $00        ;; 06:6da0 ????????
    db   $09, $06, $04, $03, $a1, $98, $74, $8b        ;; 06:6da8 ????????
    db   $02, $0e, $09, $07, $05, $92, $99, $74        ;; 06:6db0 ????????
    db   $93, $0a, $37, $22, $20, $16, $56, $9b        ;; 06:6db8 ????????
    db   $74, $9b, $0f, $57, $38, $36, $27, $38        ;; 06:6dc0 ????????
    db   $9e, $74, $ab, $13, $63, $4c, $4a, $38        ;; 06:6dc8 ????????
    db   $1a, $a2, $74, $bb, $14, $63, $52, $50        ;; 06:6dd0 ????????
    db   $3e, $1a, $a8, $74, $93, $04, $0f, $0e        ;; 06:6dd8 ????????
    db   $15, $16, $83, $b0, $74, $9b, $06, $16        ;; 06:6de0 ????????
    db   $15, $1e, $1f, $74, $b3, $74, $a3, $0a        ;; 06:6de8 ????????
    db   $25, $24, $31, $32, $56, $b7, $74, $ab        ;; 06:6df0 ????????
    db   $0e, $37, $36, $47, $48, $38, $bc, $74        ;; 06:6df8 ????????
    db   $b3, $12, $4b, $4a, $5e, $5f, $1a, $c2        ;; 06:6e00 ????????
    db   $74, $bb, $13, $52, $50, $63, $63, $1a        ;; 06:6e08 ????????
    db   $c9, $74, $8b, $03, $08, $0c, $06, $16        ;; 06:6e10 ????????
    db   $83, $d1, $74, $93, $08, $14, $1d, $12        ;; 06:6e18 ????????
    db   $31, $65, $d3, $74, $9b, $0b, $1d, $29        ;; 06:6e20 ????????
    db   $1b, $43, $47, $d6, $74, $a3, $0f, $2c        ;; 06:6e28 ????????
    db   $3c, $2a, $5e, $29, $da, $74, $ab, $12        ;; 06:6e30 ????????
    db   $39, $4b, $37, $63, $1a, $df, $74, $bb        ;; 06:6e38 ????????
    db   $13, $3f, $51, $3d, $63, $1a, $e5, $74        ;; 06:6e40 ????????
    db   $93, $00, $05, $02, $04, $07, $a1, $ed        ;; 06:6e48 ????????
    db   $74, $9b, $04, $0c, $06, $08, $11, $83        ;; 06:6e50 ????????
    db   $f0, $74, $a3, $0d, $2e, $1f, $21, $3c        ;; 06:6e58 ????????
    db   $47, $f4, $74, $ab, $10, $3c, $2a, $2c        ;; 06:6e60 ????????
    db   $4d, $29, $f9, $74, $bb, $13, $4b, $37        ;; 06:6e68 ????????
    db   $39, $5e, $1a, $ff, $74, $bb, $14, $51        ;; 06:6e70 ????????
    db   $3d, $3f, $63, $1a, $07, $75, $93, $02        ;; 06:6e78 ????????
    db   $05, $04, $03, $08, $a1, $0f, $75, $a3        ;; 06:6e80 ????????
    db   $0b, $17, $16, $15, $2c, $a1, $12, $75        ;; 06:6e88 ????????
    db   $a3, $0f, $24, $23, $22, $41, $56, $17        ;; 06:6e90 ????????
    db   $75, $ab, $11, $2c, $2b, $2a, $4d, $29        ;; 06:6e98 ????????
    db   $1c, $75, $b3, $14, $39, $38, $37, $5e        ;; 06:6ea0 ????????
    db   $1a, $22, $75, $bb, $15, $3f, $3e, $3d        ;; 06:6ea8 ????????
    db   $63, $1a, $29, $75, $83, $03, $0b, $08        ;; 06:6eb0 ????????
    db   $09, $0c, $92, $31, $75, $93, $08, $1a        ;; 06:6eb8 ????????
    db   $17, $18, $1b, $65, $32, $75, $a3, $0f        ;; 06:6ec0 ????????
    db   $38, $35, $36, $39, $38, $35, $75, $ab        ;; 06:6ec8 ????????
    db   $10, $3d, $3a, $3b, $3e, $29, $3a, $75        ;; 06:6ed0 ????????
    db   $b3, $13, $4c, $49, $4a, $4d, $1a, $40        ;; 06:6ed8 ????????
    db   $75, $bb, $14, $52, $4f, $50, $53, $1a        ;; 06:6ee0 ????????
    db   $47, $75, $8b, $05, $0b, $11, $13, $19        ;; 06:6ee8 ????????
    db   $74, $4f, $75, $93, $06, $0e, $15, $17        ;; 06:6ef0 ????????
    db   $1e, $74, $51, $75, $a3, $0e, $27, $36        ;; 06:6ef8 ????????
    db   $38, $47, $38, $54, $75, $ab, $0f, $2b        ;; 06:6f00 ????????
    db   $3b, $3d, $4d, $29, $59, $75, $b3, $12        ;; 06:6f08 ????????
    db   $38, $4a, $4c, $5e, $1a, $5f, $75, $bb        ;; 06:6f10 ????????
    db   $13, $3e, $50, $52, $63, $1a, $66, $75        ;; 06:6f18 ????????
    db   $93, $02, $09, $04, $03, $06, $a1, $6e        ;; 06:6f20 ????????
    db   $75, $9b, $04, $0f, $06, $05, $0a, $92        ;; 06:6f28 ????????
    db   $71, $75, $a3, $0c, $32, $19, $18, $25        ;; 06:6f30 ????????
    db   $56, $75, $75, $ab, $12, $54, $2f, $2e        ;; 06:6f38 ????????
    db   $41, $29, $7a, $75, $b3, $14, $5f, $38        ;; 06:6f40 ????????
    db   $37, $4b, $1a, $80, $75, $bb, $15, $63        ;; 06:6f48 ????????
    db   $3e, $3d, $52, $1a, $87, $75, $93, $00        ;; 06:6f50 ????????
    db   $04, $03, $08, $09, $a1, $8f, $75, $a3        ;; 06:6f58 ????????
    db   $03, $06, $05, $0e, $0f, $92, $92, $75        ;; 06:6f60 ????????
    db   $b3, $0b, $1c, $1b, $36, $37, $47, $97        ;; 06:6f68 ????????
    db   $75, $ab, $10, $2f, $2e, $53, $54, $29        ;; 06:6f70 ????????
    db   $9e, $75, $b3, $12, $38, $37, $5e, $5f        ;; 06:6f78 ????????
    db   $1a, $a4, $75, $bb, $13, $3f, $3d, $63        ;; 06:6f80 ????????
    db   $63, $1a, $ab, $75, $8b, $06, $1a, $12        ;; 06:6f88 ????????
    db   $0b, $18, $74, $b3, $75, $9b, $0b, $32        ;; 06:6f90 ????????
    db   $25, $19, $30, $56, $b5, $75, $a3, $0c        ;; 06:6f98 ????????
    db   $37, $29, $1c, $35, $47, $b9, $75, $ab        ;; 06:6fa0 ????????
    db   $11, $54, $41, $2f, $52, $29, $be, $75        ;; 06:6fa8 ????????
    db   $b3, $13, $5f, $4b, $38, $5d, $1a, $c4        ;; 06:6fb0 ????????
    db   $75, $bb, $14, $63, $51, $3e, $63, $1a        ;; 06:6fb8 ????????
    db   $cb, $75, $8b, $00, $06, $03, $09, $04        ;; 06:6fc0 ????????
    db   $a1, $d3, $75, $9b, $06, $17, $0e, $26        ;; 06:6fc8 ????????
    db   $15, $74, $d5, $75, $a3, $0c, $2f, $20        ;; 06:6fd0 ????????
    db   $4a, $2d, $47, $d9, $75, $ab, $10, $42        ;; 06:6fd8 ????????
    db   $2f, $63, $40, $29, $de, $75, $b3, $12        ;; 06:6fe0 ????????
    db   $4c, $38, $63, $4a, $1a, $e4, $75, $bb        ;; 06:6fe8 ????????
    db   $13, $52, $3e, $63, $50, $1a, $eb, $75        ;; 06:6ff0 ????????
    db   $93, $08, $1e, $1c, $13, $27, $65, $f3        ;; 06:6ff8 ????????
    db   $75, $9b, $0a, $26, $24, $19, $31, $56        ;; 06:7000 ????????
    db   $f6, $75, $a3, $0d, $33, $31, $23, $41        ;; 06:7008 ????????
    db   $38, $fa, $75, $ab, $10, $42, $40, $2f        ;; 06:7010 ????????
    db   $53, $29, $ff, $75, $b3, $12, $4c, $4a        ;; 06:7018 ????????
    db   $38, $5e, $1a, $05, $76, $bb, $13, $63        ;; 06:7020 ????????
    db   $50, $3e, $63, $1a, $0c, $76, $00, $02        ;; 06:7028 ????????
    db   $07, $04, $05, $02, $a1, $14, $76, $08        ;; 06:7030 ????????
    db   $05, $0e, $07, $0a, $05, $a1, $15, $76        ;; 06:7038 ????????
    db   $10, $0b, $27, $14, $1d, $12, $65, $17        ;; 06:7040 ????????
    db   $76, $20, $10, $41, $24, $32, $22, $38        ;; 06:7048 ????????
    db   $1a, $76, $28, $14, $58, $35, $46, $33        ;; 06:7050 ????????
    db   $1a, $1f, $76, $00, $00, $05, $06, $08        ;; 06:7058 ????????
    db   $03, $a1, $25, $76, $10, $08, $19, $21        ;; 06:7060 ????????
    db   $23, $10, $65, $26, $76, $18, $0a, $21        ;; 06:7068 ????????
    db   $2b, $2d, $16, $56, $29, $76, $60, $10        ;; 06:7070 ????????
    db   $3c, $4c, $4e, $2b, $29, $2d, $76, $30        ;; 06:7078 ????????
    db   $13, $4b, $5d, $5f, $38, $1a, $32, $76        ;; 06:7080 ????????
    db   $00, $04, $0c, $0c, $0c, $0c, $03, $39        ;; 06:7088 ????????
    db   $76, $08, $04, $0a, $08, $15, $1b, $83        ;; 06:7090 ????????
    db   $3a, $76, $10, $06, $0f, $0d, $1e, $26        ;; 06:7098 ????????
    db   $74, $3c, $76, $20, $0c, $21, $1f, $3c        ;; 06:70a0 ????????
    db   $4a, $47, $3f, $76, $28, $0f, $2c, $2a        ;; 06:70a8 ????????
    db   $4d, $5e, $29, $44, $76, $b0, $12, $39        ;; 06:70b0 ????????
    db   $37, $5e, $63, $1a, $4a, $76, $00, $00        ;; 06:70b8 ????????
    db   $01, $01, $01, $01, $04, $51, $76, $08        ;; 06:70c0 ????????
    db   $06, $16, $15, $09, $08, $83, $52, $76        ;; 06:70c8 ????????
    db   $18, $0b, $2d, $2c, $16, $15, $06, $54        ;; 06:70d0 ????????
    db   $76, $58, $0f, $42, $41, $23, $22, $38        ;; 06:70d8 ????????
    db   $58, $76, $68, $12, $54, $53, $2f, $2e        ;; 06:70e0 ????????
    db   $29, $5c, $76, $70, $14, $5f, $5e, $38        ;; 06:70e8 ????????
    db   $37, $1a, $62, $76, $b8, $18, $46, $46        ;; 06:70f0 ????????
    db   $46, $00, $00, $69, $76, $00, $01, $07        ;; 06:70f8 ????????
    db   $00, $03, $00, $00, $71, $76, $00, $01        ;; 06:7100 ????????
    db   $03, $00, $07, $00, $00, $72, $76, $60        ;; 06:7108 ????????
    db   $00, $07, $00, $03, $05, $00, $73, $76        ;; 06:7110 ????????
    db   $60, $00, $03, $00, $07, $05, $00, $78        ;; 06:7118 ????????
    db   $76, $08, $02, $08, $01, $04, $00, $00        ;; 06:7120 ????????
    db   $7d, $76, $08, $02, $04, $01, $08, $00        ;; 06:7128 ????????
    db   $00, $7f, $76, $60, $01, $08, $00, $04        ;; 06:7130 ????????
    db   $06, $00, $81, $76, $60, $01, $04, $00        ;; 06:7138 ????????
    db   $08, $06, $00, $86, $76, $00, $0a, $27        ;; 06:7140 ????????
    db   $00, $13, $00, $00, $8b, $76, $00, $0a        ;; 06:7148 ????????
    db   $13, $00, $27, $00, $00, $8c, $76, $58        ;; 06:7150 ????????
    db   $09, $27, $04, $13, $1d, $00, $8d, $76        ;; 06:7158 ????????
    db   $58, $09, $13, $04, $27, $1d, $00, $91        ;; 06:7160 ????????
    db   $76, $00, $0d, $36, $00, $1c, $00, $00        ;; 06:7168 ????????
    db   $95, $76, $00, $0d, $1c, $00, $36, $00        ;; 06:7170 ????????
    db   $00, $96, $76, $58, $0c, $36, $10, $1c        ;; 06:7178 ????????
    db   $29, $00, $97, $76, $58, $0c, $1c, $0e        ;; 06:7180 ????????
    db   $36, $29, $00, $9b, $76, $a0, $16, $0c        ;; 06:7188 ????????
    db   $0b, $0c, $0c, $06, $9f, $76, $a7, $17        ;; 06:7190 ????????
    db   $1b, $19, $1b, $1b, $0c, $a4, $76, $a0        ;; 06:7198 ????????
    db   $18, $32, $2d, $32, $32, $0d, $a9, $76        ;; 06:71a0 ????????
    db   $a7, $19, $55, $4d, $55, $55, $0e, $ae        ;; 06:71a8 ????????
    db   $76, $af, $1a, $5a, $64, $5a, $5a, $00        ;; 06:71b0 ????????
    db   $b3, $76, $b7, $1b, $64, $5a, $5a, $64        ;; 06:71b8 ????????
    db   $00, $b9, $76, $b7, $1c, $64, $5a, $64        ;; 06:71c0 ????????
    db   $64, $00, $c0, $76, $b7, $1d, $64, $64        ;; 06:71c8 ????????
    db   $64, $64, $00, $c7, $76, $58, $1f, $55        ;; 06:71d0 ????????
    db   $ff, $55, $55, $00, $ce, $76, $b8, $1e        ;; 06:71d8 ????????
    db   $5a, $5a, $5a, $5a, $0f, $d2, $76, $b8        ;; 06:71e0 ????????
    db   $1f, $63, $c8, $63, $5a, $00, $da, $76        ;; 06:71e8 ????????

data_06_71f0:
    db   $00, $00, $00, $11, $11, $11, $00, $00        ;; 06:71f0 ????????
    db   $00, $00, $00, $00, $11, $11, $11, $00        ;; 06:71f8 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 06:7200 ????????
    db   $44, $44, $44, $11, $11, $11, $00, $00        ;; 06:7208 ????????
    db   $00, $44, $44, $44, $00, $00, $00, $22        ;; 06:7210 ????????
    db   $22, $22, $44, $44, $44, $00, $00, $00        ;; 06:7218 ????????
    db   $88, $88, $88, $00, $00, $00, $88, $88        ;; 06:7220 ????????
    db   $88, $44, $44, $44, $88, $88, $88, $88        ;; 06:7228 ????????
    db   $88, $88, $00, $00, $00, $00, $00, $00        ;; 06:7230 ????????
    db   $44, $44, $44, $22, $22, $22, $22, $22        ;; 06:7238 ????????
    db   $22, $22, $28, $20, $00, $00, $00, $00        ;; 06:7240 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 06:7248 ????????
    db   $08, $88, $80, $80                            ;; 06:7250 ????

data_06_7254:
    db   $14, $00, $28, $00, $3c, $00, $52, $00        ;; 06:7254 ????????
    db   $67, $00, $7e, $00, $96, $00, $af, $00        ;; 06:725c ????????
    db   $ca, $00, $e7, $00, $06, $01, $27, $01        ;; 06:7264 ????????
    db   $4a, $01, $70, $01, $99, $01, $c6, $01        ;; 06:726c ????????
    db   $f5, $01, $27, $02, $5e, $02, $9a, $02        ;; 06:7274 ????????
    db   $d9, $02, $1b, $03, $fa, $00, $58, $02        ;; 06:727c ????????
    db   $e8, $03, $dc, $05, $dc, $05, $d6, $06        ;; 06:7284 ????????
    db   $d0, $07, $c4, $09, $d0, $07, $88, $13        ;; 06:728c ????????
    db   $00, $05, $0a, $0f, $14, $19, $1e, $23        ;; 06:7294 ????????
    db   $28, $2d, $32, $3c, $46, $50, $5a, $64        ;; 06:729c ????????

data_06_72a4:
    db   $00, $00, $00, $40, $01, $20, $02, $40        ;; 06:72a4 ????????
    db   $04, $00, $06, $00, $09, $00, $12, $00        ;; 06:72ac ????????
    db   $16, $00, $20, $00, $24, $00, $40, $00        ;; 06:72b4 ????????
    db   $48, $00, $55, $00, $65, $00, $99, $99        ;; 06:72bc ????????

data_06_72c4:
    db   $11, $00, $00, $00, $11, $00, $00, $00        ;; 06:72c4 ????????
    db   $11, $11, $11, $11, $99, $99, $99, $00        ;; 06:72cc ????????
    db   $00, $13, $00, $13, $00, $13, $00, $00        ;; 06:72d4 ????????
    db   $00, $00, $35, $00, $35, $00, $35, $00        ;; 06:72dc ????????
    db   $00, $00, $12, $02, $12, $00, $02, $12        ;; 06:72e4 ????????
    db   $02, $00, $00, $24, $24, $24, $00, $24        ;; 06:72ec ????????
    db   $24, $24, $00, $00, $02, $24, $00, $24        ;; 06:72f4 ????????
    db   $02, $02, $00, $24, $24, $00, $02, $02        ;; 06:72fc ????????
    db   $24, $00, $24, $02, $00, $12, $02, $02        ;; 06:7304 ????????
    db   $02, $02, $24, $02, $24, $02, $24, $02        ;; 06:730c ????????
    db   $02, $02, $24, $24, $24, $02, $24, $24        ;; 06:7314 ????????
    db   $24, $02, $24, $24, $24, $95, $d8, $e1        ;; 06:731c ????????
    db   $95, $fa, $d8, $e1, $8c, $9b, $80, $d8        ;; 06:7324 ????????
    db   $e1, $95, $8c, $e4, $f9, $d8, $e1, $95        ;; 06:732c ????????
    db   $8c, $e4, $ab, $e1, $d8, $9d, $99, $af        ;; 06:7334 ????????
    db   $c8, $f9, $fa, $d4, $d8, $8d, $d1, $e0        ;; 06:733c ????????
    db   $9d, $d1, $e0, $9d, $87, $d1, $e0, $8c        ;; 06:7344 ????????
    db   $be, $d1, $e0, $8c, $8d, $b3, $c8, $d1        ;; 06:734c ????????
    db   $d3, $8d, $8c, $ac, $b3, $c8, $c2, $d8        ;; 06:7354 ????????
    db   $d1, $c4, $9b, $c4, $e6, $a3, $c4, $88        ;; 06:735c ????????
    db   $b0, $80, $c4, $8c, $e4, $9f, $d4, $c4        ;; 06:7364 ????????
    db   $88, $d0, $c6, $d1, $e1, $88, $e4, $a3        ;; 06:736c ????????
    db   $ca, $a9, $d2, $d4, $d6, $89, $e1, $8c        ;; 06:7374 ????????
    db   $92, $d8, $e1, $95, $9d, $b1, $a4, $e1        ;; 06:737c ????????
    db   $95, $8c, $bd, $c5, $d1, $e1, $93, $9d        ;; 06:7384 ????????
    db   $9b, $eb, $bc, $86, $e1, $8c, $bd, $91        ;; 06:738c ????????
    db   $b0, $85, $86, $d4, $d8, $95, $d1, $e0        ;; 06:7394 ????????
    db   $93, $8c, $d1, $e0, $89, $95, $a4, $d1        ;; 06:739c ????????
    db   $e0, $93, $8c, $ce, $ba, $d2, $e0, $93        ;; 06:73a4 ????????
    db   $8c, $9e, $c8, $d5, $d1, $e0, $93, $8c        ;; 06:73ac ????????
    db   $9e, $c8, $c2, $d4, $d5, $d1, $8c, $95        ;; 06:73b4 ????????
    db   $8c, $95, $97, $f9, $9d, $95, $ba, $df        ;; 06:73bc ????????
    db   $d2, $95, $8c, $a8, $ca, $f9, $fa, $95        ;; 06:73c4 ????????
    db   $9d, $b9, $a1, $86, $d4, $d1, $83, $a7        ;; 06:73cc ????????
    db   $e1, $a7, $87, $e1, $98, $91, $e1, $8c        ;; 06:73d4 ????????
    db   $ac, $91, $e1, $95, $f0, $88, $ed, $86        ;; 06:73dc ????????
    db   $e1, $88, $9d, $91, $bc, $ed, $a8, $86        ;; 06:73e4 ????????
    db   $f8, $8a, $d8, $95, $8a, $d8, $95, $8c        ;; 06:73ec ????????
    db   $ab, $d8, $8a, $8b, $c7, $c0, $d8, $95        ;; 06:73f4 ????????
    db   $8a, $a4, $c8, $c0, $d8, $8f, $c8, $a4        ;; 06:73fc ????????
    db   $f3, $a9, $c0, $fa, $d8, $8c, $e1, $8c        ;; 06:7404 ????????
    db   $9c, $e1, $8c, $9c, $9f, $e1, $ac, $94        ;; 06:740c ????????
    db   $bc, $d7, $df, $9d, $9f, $9c, $ba, $d7        ;; 06:7414 ????????
    db   $d4, $8c, $9f, $bf, $a1, $86, $da, $d8        ;; 06:741c ????????
    db   $83, $c4, $a6, $e0, $96, $e3, $a6, $e0        ;; 06:7424 ????????
    db   $e9, $b4, $c1, $d1, $e0, $8c, $e3, $a6        ;; 06:742c ????????
    db   $96, $d1, $e0, $8c, $a6, $9f, $96, $bc        ;; 06:7434 ????????
    db   $c8, $d1, $8c, $96, $a6, $9f, $c8, $bc        ;; 06:743c ????????
    db   $c2, $d1, $8c, $e1, $8c, $b5, $cf, $e1        ;; 06:7444 ????????
    db   $8c, $ac, $b5, $ce, $e1, $ac, $d0, $b9        ;; 06:744c ????????
    db   $d1, $e1, $8c, $ac, $b1, $bf, $d8, $e1        ;; 06:7454 ????????
    db   $f9, $8c, $ac, $9f, $c6, $c0, $86, $d8        ;; 06:745c ????????
    db   $d1, $8c, $e1, $8c, $cf, $e1, $95, $9d        ;; 06:7464 ????????
    db   $ac, $e1, $95, $8c, $ac, $d7, $e1, $95        ;; 06:746c ????????
    db   $9d, $d0, $b9, $d1, $e1, $95, $8c, $9c        ;; 06:7474 ????????
    db   $ce, $bc, $ad, $da, $fa, $9d, $9d, $d7        ;; 06:747c ????????
    db   $95, $9d, $d7, $a7, $cc, $d7, $fa, $9d        ;; 06:7484 ????????
    db   $c6, $c7, $f3, $d7, $95, $9d, $c7, $eb        ;; 06:748c ????????
    db   $ef, $84, $85, $83, $95, $95, $a7, $8b        ;; 06:7494 ????????
    db   $8c, $cb, $8b, $b8, $c8, $c7, $b8, $8f        ;; 06:749c ????????
    db   $cb, $c6, $81, $86, $8f, $c8, $c7, $d0        ;; 06:74a4 ????????
    db   $c0, $83, $86, $db, $95, $8a, $d8, $95        ;; 06:74ac ????????
    db   $9d, $9b, $d8, $95, $9d, $f7, $b9, $d8        ;; 06:74b4 ????????
    db   $95, $8c, $ac, $9e, $bc, $d8, $95, $9d        ;; 06:74bc ????????
    db   $c6, $81, $aa, $fa, $d8, $95, $a7, $c8        ;; 06:74c4 ????????
    db   $81, $c0, $86, $85, $db, $a2, $d8, $e8        ;; 06:74cc ????????
    db   $fa, $d8, $f6, $e8, $fa, $d8, $a2, $a8        ;; 06:74d4 ????????
    db   $e8, $fa, $d8, $a5, $e8, $f6, $ad, $fa        ;; 06:74dc ????????
    db   $d8, $e8, $c5, $a9, $ad, $ae, $fa, $d9        ;; 06:74e4 ????????
    db   $d8, $8e, $f8, $df, $8e, $9b, $f8, $df        ;; 06:74ec ????????
    db   $8e, $eb, $a4, $f8, $df, $8e, $cc, $8f        ;; 06:74f4 ????????
    db   $92, $f8, $df, $8f, $c8, $c6, $c7, $ca        ;; 06:74fc ????????
    db   $d7, $da, $df, $c8, $c7, $ca, $c9, $86        ;; 06:7504 ????????
    db   $d2, $d7, $da, $e9, $f8, $df, $e9, $b4        ;; 06:750c ????????
    db   $f8, $d8, $df, $e9, $b4, $f8, $d8, $df        ;; 06:7514 ????????
    db   $e9, $b4, $f9, $f8, $d8, $df, $e9, $b4        ;; 06:751c ????????
    db   $cf, $bc, $f9, $f8, $d8, $e9, $b4, $ed        ;; 06:7524 ????????
    db   $f1, $bc, $f9, $f8, $d8, $95, $95, $c6        ;; 06:752c ????????
    db   $d8, $95, $cb, $c6, $d1, $d8, $95, $cb        ;; 06:7534 ????????
    db   $c6, $c7, $d1, $d8, $95, $cb, $c6, $c7        ;; 06:753c ????????
    db   $86, $d1, $d8, $8f, $a8, $c9, $ca, $85        ;; 06:7544 ????????
    db   $86, $db, $d8, $9c, $ad, $ac, $f5, $ab        ;; 06:754c ????????
    db   $ac, $9f, $af, $c6, $a9, $ac, $9f, $9c        ;; 06:7554 ????????
    db   $c6, $81, $a9, $ac, $94, $9c, $c7, $c6        ;; 06:755c ????????
    db   $c2, $a9, $ac, $9a, $9f, $c8, $b9, $a9        ;; 06:7564 ????????
    db   $bf, $db, $95, $d6, $df, $95, $9e, $d6        ;; 06:756c ????????
    db   $df, $95, $9c, $9e, $d6, $df, $95, $b6        ;; 06:7574 ????????
    db   $f9, $d6, $d2, $df, $95, $9c, $b0, $b6        ;; 06:757c ????????
    db   $d2, $d6, $df, $95, $9c, $b0, $ce, $b6        ;; 06:7584 ????????
    db   $82, $d2, $d6, $e5, $d6, $df, $e5, $df        ;; 06:758c ????????
    db   $d7, $da, $d8, $e5, $b2, $df, $d2, $d7        ;; 06:7594 ????????
    db   $da, $d8, $cb, $c7, $b6, $d7, $da, $d8        ;; 06:759c ????????
    db   $cb, $c7, $dc, $b6, $d7, $da, $d8, $af        ;; 06:75a4 ????????
    db   $a8, $ca, $b6, $85, $d7, $da, $d8, $8b        ;; 06:75ac ????????
    db   $df, $8b, $bc, $e1, $d6, $b8, $91, $bc        ;; 06:75b4 ????????
    db   $bf, $da, $b8, $91, $b9, $bc, $da, $db        ;; 06:75bc ????????
    db   $b8, $91, $b9, $d0, $c0, $da, $db, $8f        ;; 06:75c4 ????????
    db   $91, $b9, $e8, $bf, $fa, $da, $db, $8a        ;; 06:75cc ????????
    db   $d8, $8a, $fa, $f9, $d8, $8a, $bb, $fa        ;; 06:75d4 ????????
    db   $f9, $d8, $95, $a0, $cd, $d8, $fa, $f9        ;; 06:75dc ????????
    db   $95, $8a, $a4, $c0, $f9, $fa, $d8, $95        ;; 06:75e4 ????????
    db   $8a, $b9, $d0, $83, $fa, $d8, $d1, $95        ;; 06:75ec ????????
    db   $b9, $d8, $95, $9d, $b9, $d8, $95, $9d        ;; 06:75f4 ????????
    db   $b9, $a4, $d8, $95, $9d, $b9, $a4, $d1        ;; 06:75fc ????????
    db   $d8, $95, $9d, $b9, $ba, $a4, $d1, $d8        ;; 06:7604 ????????
    db   $9b, $94, $bb, $bc, $ba, $b9, $d8, $db        ;; 06:760c ????????
    db   $73, $c3, $2d, $90, $87, $91, $cc, $9b        ;; 06:7614 ????????
    db   $41, $42, $f9, $22, $41, $43, $44, $3f        ;; 06:761c ????????
    db   $45, $24, $24, $3a, $3e, $24, $a4, $eb        ;; 06:7624 ????????
    db   $c6, $32, $ec, $f2, $ed, $f3, $24, $99        ;; 06:762c ????????
    db   $25, $2a, $33, $34, $37, $11, $6f, $02        ;; 06:7634 ????????
    db   $6a, $6f, $02, $6c, $6a, $02, $6d, $68        ;; 06:763c ????????
    db   $6b, $6a, $6d, $02, $70, $71, $ce, $b6        ;; 06:7644 ????????
    db   $a9, $b7, $82, $dd, $df, $3d, $21, $4b        ;; 06:764c ????????
    db   $e8, $c5, $42, $d6, $b8, $e7, $e8, $f8        ;; 06:7654 ????????
    db   $8b, $b8, $47, $2f, $d7, $66, $8b, $b8        ;; 06:765c ????????
    db   $46, $2f, $49, $d6, $fa, $91, $e8, $c5        ;; 06:7664 ????????
    db   $49, $46, $47, $48, $da, $20, $2d, $fe        ;; 06:766c ????????
    db   $fe, $fe, $fe, $20, $fe, $fe, $fe, $fe        ;; 06:7674 ????????
    db   $2d, $21, $5e, $2e, $5e, $f9, $fe, $fe        ;; 06:767c ????????
    db   $fe, $21, $f9, $fe, $fe, $fe, $2e, $23        ;; 06:7684 ????????
    db   $2e, $b9, $82, $fe, $fe, $9e, $f2, $fe        ;; 06:768c ????????
    db   $fe, $25, $2f, $ee, $ec, $f1, $fe, $86        ;; 06:7694 ????????
    db   $82, $ed, $fe, $9d, $bc, $e2, $d4, $d6        ;; 06:769c ????????
    db   $8c, $9f, $bb, $d3, $d6, $8f, $ba, $ea        ;; 06:76a4 ????????
    db   $d2, $d6, $8a, $a4, $b9, $d1, $d6, $9d        ;; 06:76ac ????????
    db   $bc, $e2, $91, $bf, $da, $8c, $9f, $bb        ;; 06:76b4 ????????
    db   $ac, $c2, $db, $d6, $8f, $ba, $2b, $a5        ;; 06:76bc ????????
    db   $c0, $db, $d6, $8a, $b9, $c0, $a4, $d0        ;; 06:76c4 ????????
    db   $db, $d6, $8a, $b9, $a4, $de, $9a, $f7        ;; 06:76cc ????????
    db   $a8, $c9, $a4, $82, $db, $da, $ff, $1c        ;; 06:76d4 ????????
    db   $7e, $7f, $1d, $c9, $83, $de, $00, $00        ;; 06:76dc ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 06:76e4 ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 06:76ec ????????
    db   $00, $00, $00, $00, $00, $00, $00, $00        ;; 06:76f4 ????????
    db   $00, $00, $00, $00                            ;; 06:76fc ????

data_06_7700:
    db   $03, $00, $18, $03, $1e, $14, $30, $11        ;; 06:7700 ????????
    db   $03, $00, $18, $03, $5a, $3c, $30, $11        ;; 06:7708 ????????
    db   $03, $00, $0a, $1e, $04, $00, $30, $11        ;; 06:7710 ????????
    db   $03, $00, $0a, $1e, $05, $04, $30, $11        ;; 06:7718 ????????
    db   $02, $00, $19, $03, $fd, $00, $00, $11        ;; 06:7720 ????????
    db   $03, $00, $19, $03, $fb, $00, $30, $11        ;; 06:7728 ????????
    db   $03, $00, $19, $03, $f7, $00, $30, $11        ;; 06:7730 ????????
    db   $02, $00, $00, $01, $fe, $00, $00, $11        ;; 06:7738 ????????
    db   $02, $00, $00, $03, $01, $00, $00, $11        ;; 06:7740 ????????
    db   $02, $00, $00, $01, $00, $00, $00, $11        ;; 06:7748 ????????
    db   $02, $00, $00, $01, $00, $00, $00, $11        ;; 06:7750 ????????
    db   $02, $00, $00, $03, $00, $00, $00, $15        ;; 06:7758 ????????
    db   $02, $00, $00, $01, $02, $14, $00, $11        ;; 06:7760 ????????
    db   $02, $00, $00, $01, $02, $14, $00, $11        ;; 06:7768 ????????
    db   $02, $00, $00, $01, $14, $0f, $00, $11        ;; 06:7770 ????????
    db   $02, $00, $00, $01, $28, $0f, $00, $11        ;; 06:7778 ????????
    db   $02, $00, $00, $01, $3c, $0f, $00, $11        ;; 06:7780 ????????
    db   $03, $a0, $07, $fe, $08, $ff, $01, $18        ;; 06:7788 ????????
    db   $4a, $00, $00, $fe, $14, $ff, $00, $11        ;; 06:7790 ????????
    db   $03, $41, $04, $fe, $32, $ff, $00, $01        ;; 06:7798 ????????
    db   $02, $00, $00, $fe, $00, $00, $00, $11        ;; 06:77a0 ????????
    db   $02, $00, $00, $fe, $16, $00, $00, $11        ;; 06:77a8 ????????
    db   $02, $00, $00, $fe, $15, $00, $00, $11        ;; 06:77b0 ????????
    db   $02, $00, $00, $fe, $00, $00, $00, $11        ;; 06:77b8 ????????
    db   $02, $00, $00, $fe, $00, $00, $00, $11        ;; 06:77c0 ????????
    db   $02, $00, $00, $fe, $00, $00, $00, $11        ;; 06:77c8 ????????
    db   $02, $00, $00, $fe, $00, $00, $00, $11        ;; 06:77d0 ????????
    db   $01, $80, $11, $10, $64, $46, $03, $08        ;; 06:77d8 ????????
    db   $01, $c0, $30, $fe, $08, $e0, $a0, $0f        ;; 06:77e0 ????????
    db   $01, $c0, $30, $fe, $20, $20, $a0, $0e        ;; 06:77e8 ????????
    db   $02, $00, $00, $fe, $00, $00, $00, $11        ;; 06:77f0 ????????
    db   $02, $00, $00, $fe, $00, $00, $00, $11        ;; 06:77f8 ????????
    db   $01, $a0, $06, $32, $02, $00, $03, $18        ;; 06:7800 ????????
    db   $01, $a0, $06, $32, $03, $00, $01, $18        ;; 06:7808 ????????
    db   $01, $a0, $06, $32, $04, $00, $01, $18        ;; 06:7810 ????????
    db   $01, $a0, $06, $32, $05, $00, $01, $18        ;; 06:7818 ????????
    db   $01, $a0, $06, $32, $06, $00, $01, $18        ;; 06:7820 ????????
    db   $01, $a0, $06, $32, $09, $00, $01, $18        ;; 06:7828 ????????
    db   $01, $a0, $08, $32, $08, $01, $01, $18        ;; 06:7830 ????????
    db   $01, $a0, $08, $32, $08, $02, $01, $18        ;; 06:7838 ????????
    db   $01, $a0, $08, $32, $0b, $04, $01, $18        ;; 06:7840 ????????
    db   $01, $a0, $08, $32, $0d, $08, $01, $18        ;; 06:7848 ????????
    db   $01, $a0, $07, $32, $0a, $01, $01, $18        ;; 06:7850 ????????
    db   $01, $a0, $07, $32, $0a, $02, $01, $18        ;; 06:7858 ????????
    db   $01, $a0, $07, $32, $0a, $04, $01, $18        ;; 06:7860 ????????
    db   $01, $a0, $0b, $32, $02, $00, $01, $18        ;; 06:7868 ????????
    db   $01, $a0, $0b, $32, $06, $00, $01, $18        ;; 06:7870 ????????
    db   $01, $a0, $0b, $32, $09, $00, $01, $18        ;; 06:7878 ????????
    db   $01, $a0, $0b, $32, $0b, $00, $01, $18        ;; 06:7880 ????????
    db   $01, $a0, $0c, $32, $07, $00, $01, $18        ;; 06:7888 ????????
    db   $01, $a0, $0c, $32, $0c, $00, $01, $18        ;; 06:7890 ????????
    db   $01, $c2, $05, $32, $00, $00, $01, $18        ;; 06:7898 ????????
    db   $01, $a0, $09, $1e, $04, $08, $01, $18        ;; 06:78a0 ????????
    db   $01, $a1, $06, $32, $0c, $32, $01, $18        ;; 06:78a8 ????????
    db   $01, $a8, $06, $1e, $07, $00, $01, $18        ;; 06:78b0 ????????
    db   $01, $80, $0e, $fe, $c8, $64, $21, $98        ;; 06:78b8 ????????
    db   $01, $a0, $0d, $01, $ff, $ff, $31, $01        ;; 06:78c0 ????????
    db   $01, $a0, $0f, $fe, $96, $96, $91, $18        ;; 06:78c8 ????????
    db   $01, $80, $12, $32, $14, $21, $02, $13        ;; 06:78d0 ????????
    db   $01, $80, $12, $32, $78, $29, $02, $13        ;; 06:78d8 ????????
    db   $01, $80, $12, $32, $fa, $3a, $02, $13        ;; 06:78e0 ????????
    db   $01, $80, $11, $1e, $28, $23, $03, $14        ;; 06:78e8 ????????
    db   $01, $80, $11, $1e, $82, $2e, $03, $14        ;; 06:78f0 ????????
    db   $01, $80, $11, $1e, $fa, $41, $03, $14        ;; 06:78f8 ????????
    db   $01, $a0, $13, $32, $0f, $21, $01, $1e        ;; 06:7900 ????????
    db   $01, $a0, $13, $32, $46, $31, $01, $1e        ;; 06:7908 ????????
    db   $01, $a0, $10, $1e, $3c, $63, $01, $09        ;; 06:7910 ????????
    db   $01, $80, $14, $19, $32, $19, $0a, $8d        ;; 06:7918 ????????
    db   $01, $80, $14, $14, $64, $32, $09, $85        ;; 06:7920 ????????
    db   $01, $80, $14, $14, $96, $64, $09, $85        ;; 06:7928 ????????
    db   $01, $80, $14, $14, $c8, $96, $0a, $8d        ;; 06:7930 ????????
    db   $01, $c0, $16, $05, $64, $64, $2c, $08        ;; 06:7938 ????????
    db   $01, $c0, $16, $01, $fa, $c8, $9e, $1d        ;; 06:7940 ????????
    db   $01, $80, $15, $1e, $64, $32, $04, $03        ;; 06:7948 ????????
    db   $01, $c0, $17, $03, $c4, $00, $0f, $19        ;; 06:7950 ????????
    db   $01, $41, $03, $32, $00, $1e, $00, $01        ;; 06:7958 ????????
    db   $01, $41, $03, $32, $00, $28, $00, $01        ;; 06:7960 ????????
    db   $01, $41, $03, $32, $00, $32, $00, $01        ;; 06:7968 ????????
    db   $01, $41, $04, $32, $01, $3c, $00, $01        ;; 06:7970 ????????
    db   $01, $41, $04, $32, $02, $3c, $00, $01        ;; 06:7978 ????????
    db   $01, $41, $04, $32, $0f, $50, $00, $01        ;; 06:7980 ????????
    db   $01, $41, $04, $32, $f0, $64, $00, $01        ;; 06:7988 ????????
    db   $04, $00, $00, $fe, $03, $00, $00, $01        ;; 06:7990 ????????
    db   $04, $00, $00, $fe, $05, $00, $00, $01        ;; 06:7998 ????????
    db   $04, $00, $00, $fe, $08, $00, $00, $01        ;; 06:79a0 ????????
    db   $04, $00, $00, $fe, $11, $00, $00, $01        ;; 06:79a8 ????????
    db   $44, $00, $00, $fe, $19, $ff, $00, $01        ;; 06:79b0 ????????
    db   $44, $00, $00, $fe, $16, $f0, $00, $01        ;; 06:79b8 ????????
    db   $08, $00, $00, $fe, $04, $00, $00, $01        ;; 06:79c0 ????????
    db   $08, $00, $00, $fe, $08, $00, $00, $01        ;; 06:79c8 ????????
    db   $08, $00, $00, $fe, $0d, $00, $00, $01        ;; 06:79d0 ????????
    db   $48, $00, $00, $fe, $13, $0f, $00, $01        ;; 06:79d8 ????????
    db   $48, $00, $00, $fe, $19, $40, $00, $01        ;; 06:79e0 ????????
    db   $48, $00, $00, $fe, $26, $30, $00, $01        ;; 06:79e8 ????????
    db   $10, $00, $00, $fe, $01, $00, $00, $01        ;; 06:79f0 ????????
    db   $10, $00, $00, $fe, $03, $00, $00, $01        ;; 06:79f8 ????????
    db   $10, $00, $00, $fe, $04, $00, $00, $01        ;; 06:7a00 ????????
    db   $10, $00, $00, $fe, $06, $01, $00, $01        ;; 06:7a08 ????????
    db   $10, $00, $00, $fe, $0f, $02, $00, $01        ;; 06:7a10 ????????
    db   $20, $00, $00, $fe, $07, $02, $00, $01        ;; 06:7a18 ????????
    db   $20, $00, $00, $fe, $07, $01, $00, $01        ;; 06:7a20 ????????
    db   $20, $00, $00, $fe, $0a, $03, $00, $01        ;; 06:7a28 ????????
    db   $3c, $00, $00, $fe, $46, $04, $00, $01        ;; 06:7a30 ????????
    db   $01, $80, $1a, $1e, $07, $01, $07, $8c        ;; 06:7a38 ????????
    db   $01, $80, $1b, $14, $20, $20, $0d, $82        ;; 06:7a40 ????????
    db   $01, $80, $1c, $14, $0a, $08, $0d, $96        ;; 06:7a48 ????????
    db   $01, $80, $1a, $14, $06, $01, $07, $8c        ;; 06:7a50 ????????
    db   $01, $80, $1a, $14, $06, $02, $08, $a2        ;; 06:7a58 ????????
    db   $01, $80, $1a, $14, $06, $04, $06, $a1        ;; 06:7a60 ????????
    db   $01, $80, $1a, $14, $06, $08, $0d, $9c        ;; 06:7a68 ????????
    db   $01, $c0, $22, $14, $0a, $00, $9c, $02        ;; 06:7a70 ????????
    db   $01, $80, $1b, $14, $80, $20, $0d, $9c        ;; 06:7a78 ????????
    db   $01, $80, $1b, $14, $02, $10, $0d, $a0        ;; 06:7a80 ????????
    db   $01, $80, $1b, $14, $01, $20, $05, $8b        ;; 06:7a88 ????????
    db   $01, $a0, $1d, $63, $05, $05, $0b, $07        ;; 06:7a90 ????????
    db   $01, $a0, $1d, $58, $06, $06, $0b, $07        ;; 06:7a98 ????????
    db   $01, $a0, $1d, $42, $07, $07, $0b, $07        ;; 06:7aa0 ????????
    db   $01, $a0, $1d, $2c, $08, $08, $0b, $07        ;; 06:7aa8 ????????
    db   $01, $a0, $1d, $16, $09, $09, $0b, $06        ;; 06:7ab0 ????????
    db   $01, $a0, $1d, $0b, $0a, $0a, $0b, $04        ;; 06:7ab8 ????????
    db   $01, $80, $1b, $1e, $20, $20, $0d, $8b        ;; 06:7ac0 ????????
    db   $01, $42, $05, $14, $00, $00, $0b, $06        ;; 06:7ac8 ????????
    db   $01, $00, $19, $03, $ef, $00, $30, $11        ;; 06:7ad0 ????????
    db   $01, $00, $19, $03, $7f, $00, $30, $1b        ;; 06:7ad8 ????????
    db   $01, $00, $19, $03, $df, $00, $30, $07        ;; 06:7ae0 ????????
    db   $01, $00, $19, $03, $bf, $00, $30, $11        ;; 06:7ae8 ????????
    db   $01, $c0, $2b, $fe, $96, $64, $30, $10        ;; 06:7af0 ????????
    db   $01, $c0, $22, $fe, $06, $00, $30, $04        ;; 06:7af8 ????????
    db   $03, $00, $18, $0a, $1e, $14, $30, $0a        ;; 06:7b00 ????????
    db   $03, $00, $0a, $0a, $04, $00, $30, $11        ;; 06:7b08 ????????
    db   $03, $00, $0a, $0a, $04, $00, $30, $11        ;; 06:7b10 ????????
    db   $03, $40, $25, $03, $00, $00, $30, $11        ;; 06:7b18 ????????
    db   $03, $00, $19, $05, $03, $00, $30, $11        ;; 06:7b20 ????????
    db   $02, $00, $00, $03, $fe, $00, $30, $11        ;; 06:7b28 ????????
    db   $02, $00, $00, $05, $00, $00, $30, $15        ;; 06:7b30 ????????
    db   $01, $a0, $06, $05, $08, $00, $0b, $06        ;; 06:7b38 ????????
    db   $01, $a0, $06, $0f, $06, $00, $01, $06        ;; 06:7b40 ????????
    db   $01, $a0, $06, $14, $05, $00, $01, $18        ;; 06:7b48 ????????
    db   $01, $a0, $0b, $19, $04, $00, $03, $0b        ;; 06:7b50 ????????
    db   $01, $a0, $06, $19, $03, $00, $0b, $07        ;; 06:7b58 ????????
    db   $01, $a0, $06, $14, $04, $00, $01, $06        ;; 06:7b60 ????????
    db   $01, $a0, $06, $1e, $02, $00, $0b, $06        ;; 06:7b68 ????????
    db   $01, $a0, $06, $19, $03, $00, $01, $06        ;; 06:7b70 ????????
    db   $01, $a0, $06, $0f, $06, $00, $01, $18        ;; 06:7b78 ????????
    db   $01, $a0, $06, $05, $08, $00, $0b, $06        ;; 06:7b80 ????????
    db   $01, $a0, $06, $03, $09, $00, $0b, $06        ;; 06:7b88 ????????
    db   $01, $a0, $10, $14, $1e, $2d, $01, $09        ;; 06:7b90 ????????
    db   $01, $a0, $1e, $0a, $04, $02, $01, $18        ;; 06:7b98 ????????
    db   $01, $a0, $1e, $05, $04, $04, $0b, $06        ;; 06:7ba0 ????????
    db   $01, $a0, $06, $1e, $02, $00, $01, $18        ;; 06:7ba8 ????????
    db   $01, $a0, $1e, $05, $01, $08, $0b, $06        ;; 06:7bb0 ????????
    db   $01, $a0, $1e, $0a, $04, $02, $01, $0b        ;; 06:7bb8 ????????
    db   $01, $a0, $1e, $0a, $04, $03, $03, $07        ;; 06:7bc0 ????????
    db   $01, $a0, $1e, $0a, $06, $02, $01, $18        ;; 06:7bc8 ????????
    db   $01, $a0, $1e, $05, $04, $06, $0b, $06        ;; 06:7bd0 ????????
    db   $01, $a0, $1f, $19, $10, $08, $03, $0b        ;; 06:7bd8 ????????
    db   $01, $a0, $1f, $19, $10, $08, $01, $0b        ;; 06:7be0 ????????
    db   $01, $a0, $06, $0a, $06, $00, $01, $0b        ;; 06:7be8 ????????
    db   $01, $a0, $1f, $14, $40, $20, $01, $0b        ;; 06:7bf0 ????????
    db   $01, $a0, $1f, $14, $40, $20, $0b, $06        ;; 06:7bf8 ????????
    db   $01, $a0, $1f, $05, $02, $10, $03, $06        ;; 06:7c00 ????????
    db   $01, $a0, $1f, $05, $01, $20, $01, $06        ;; 06:7c08 ????????
    db   $01, $80, $1b, $14, $80, $20, $30, $8b        ;; 06:7c10 ????????
    db   $01, $a0, $1b, $14, $80, $20, $0d, $8a        ;; 06:7c18 ????????
    db   $01, $a0, $1b, $0a, $08, $20, $0d, $8a        ;; 06:7c20 ????????
    db   $01, $80, $1b, $0a, $08, $20, $30, $8b        ;; 06:7c28 ????????
    db   $01, $80, $1b, $0a, $08, $20, $0d, $8a        ;; 06:7c30 ????????
    db   $01, $a0, $06, $0a, $07, $00, $03, $06        ;; 06:7c38 ????????
    db   $01, $80, $1b, $0a, $04, $20, $05, $8b        ;; 06:7c40 ????????
    db   $01, $80, $1b, $05, $20, $20, $10, $8b        ;; 06:7c48 ????????
    db   $01, $c0, $30, $03, $20, $20, $50, $1a        ;; 06:7c50 ????????
    db   $01, $c0, $30, $03, $20, $20, $60, $90        ;; 06:7c58 ????????
    db   $01, $a0, $0b, $0a, $06, $00, $01, $1e        ;; 06:7c60 ????????
    db   $01, $80, $1b, $05, $02, $10, $30, $8b        ;; 06:7c68 ????????
    db   $01, $80, $1b, $05, $01, $20, $05, $8b        ;; 06:7c70 ????????
    db   $01, $80, $20, $0a, $00, $10, $0d, $8a        ;; 06:7c78 ????????
    db   $01, $80, $20, $0a, $00, $14, $0d, $8a        ;; 06:7c80 ????????
    db   $01, $80, $20, $0a, $01, $14, $0d, $9f        ;; 06:7c88 ????????
    db   $01, $80, $20, $0a, $01, $0a, $0d, $84        ;; 06:7c90 ????????
    db   $01, $80, $20, $0a, $01, $1e, $06, $a1        ;; 06:7c98 ????????
    db   $01, $a0, $20, $0a, $01, $0f, $0d, $86        ;; 06:7ca0 ????????
    db   $01, $80, $20, $0a, $01, $14, $0d, $a3        ;; 06:7ca8 ????????
    db   $01, $a0, $09, $05, $05, $08, $0b, $0a        ;; 06:7cb0 ????????
    db   $01, $a0, $09, $05, $08, $08, $0b, $0a        ;; 06:7cb8 ????????
    db   $01, $a0, $06, $14, $04, $00, $0b, $07        ;; 06:7cc0 ????????
    db   $01, $80, $1a, $0a, $04, $01, $07, $8c        ;; 06:7cc8 ????????
    db   $01, $80, $1a, $0a, $04, $02, $08, $a2        ;; 06:7cd0 ????????
    db   $01, $80, $1a, $0a, $04, $04, $06, $a1        ;; 06:7cd8 ????????
    db   $01, $80, $1a, $0a, $04, $08, $0d, $84        ;; 06:7ce0 ????????
    db   $01, $80, $1a, $0a, $04, $00, $0d, $84        ;; 06:7ce8 ????????
    db   $01, $80, $1a, $0a, $04, $02, $04, $8a        ;; 06:7cf0 ????????
    db   $01, $c0, $22, $03, $04, $80, $20, $1f        ;; 06:7cf8 ????????
    db   $01, $c0, $22, $03, $04, $02, $50, $24        ;; 06:7d00 ????????
    db   $01, $c0, $22, $03, $04, $08, $40, $04        ;; 06:7d08 ????????
    db   $01, $c0, $22, $03, $04, $00, $50, $24        ;; 06:7d10 ????????
    db   $01, $c0, $24, $05, $14, $08, $0d, $0a        ;; 06:7d18 ????????
    db   $01, $a0, $0b, $19, $05, $00, $01, $1e        ;; 06:7d20 ????????
    db   $01, $80, $26, $0a, $64, $1e, $04, $03        ;; 06:7d28 ????????
    db   $01, $80, $1a, $0a, $04, $01, $07, $8c        ;; 06:7d30 ????????
    db   $01, $80, $1a, $0a, $04, $02, $08, $a2        ;; 06:7d38 ????????
    db   $01, $80, $1a, $0a, $04, $04, $06, $a1        ;; 06:7d40 ????????
    db   $01, $c0, $22, $03, $08, $00, $0c, $02        ;; 06:7d48 ????????
    db   $01, $80, $1b, $05, $01, $20, $05, $8b        ;; 06:7d50 ????????
    db   $01, $80, $1b, $0a, $80, $20, $0d, $9c        ;; 06:7d58 ????????
    db   $01, $a0, $06, $0a, $07, $00, $01, $18        ;; 06:7d60 ????????
    db   $01, $44, $05, $05, $02, $10, $0d, $20        ;; 06:7d68 ????????
    db   $01, $44, $05, $14, $40, $20, $0d, $06        ;; 06:7d70 ????????
    db   $01, $44, $05, $19, $10, $08, $0d, $06        ;; 06:7d78 ????????
    db   $01, $50, $05, $19, $64, $01, $07, $0c        ;; 06:7d80 ????????
    db   $40, $00, $00, $fe, $00, $01, $00, $01        ;; 06:7d88 ????????
    db   $40, $00, $00, $fe, $00, $02, $00, $01        ;; 06:7d90 ????????
    db   $40, $00, $00, $fe, $00, $04, $00, $01        ;; 06:7d98 ????????
    db   $40, $00, $00, $fe, $00, $08, $00, $01        ;; 06:7da0 ????????
    db   $40, $00, $00, $fe, $00, $10, $00, $01        ;; 06:7da8 ????????
    db   $40, $00, $00, $fe, $00, $20, $00, $01        ;; 06:7db0 ????????
    db   $40, $00, $00, $fe, $00, $40, $00, $01        ;; 06:7db8 ????????
    db   $40, $00, $00, $fe, $00, $80, $00, $01        ;; 06:7dc0 ????????
    db   $01, $c0, $23, $01, $c4, $00, $0f, $1d        ;; 06:7dc8 ????????
    db   $40, $00, $00, $fe, $00, $70, $00, $01        ;; 06:7dd0 ????????
    db   $40, $00, $00, $fe, $00, $0f, $00, $01        ;; 06:7dd8 ????????
    db   $01, $80, $1b, $05, $02, $10, $30, $a0        ;; 06:7de0 ????????
    db   $40, $00, $00, $fe, $00, $42, $00, $01        ;; 06:7de8 ????????
    db   $40, $00, $00, $fe, $00, $ff, $00, $01        ;; 06:7df0 ????????
    db   $80, $00, $00, $fe, $00, $01, $00, $01        ;; 06:7df8 ????????
    db   $80, $00, $00, $fe, $00, $04, $00, $01        ;; 06:7e00 ????????
    db   $80, $00, $00, $fe, $00, $02, $00, $01        ;; 06:7e08 ????????
    db   $01, $41, $03, $19, $00, $28, $00, $01        ;; 06:7e10 ????????
    db   $01, $41, $03, $19, $00, $32, $00, $01        ;; 06:7e18 ????????
    db   $01, $a0, $2c, $0a, $04, $00, $03, $0a        ;; 06:7e20 ????????
    db   $01, $a0, $07, $0a, $08, $02, $0b, $06        ;; 06:7e28 ????????
    db   $01, $80, $1b, $14, $10, $08, $0d, $8a        ;; 06:7e30 ????????
    db   $01, $80, $11, $0a, $64, $00, $0b, $08        ;; 06:7e38 ????????
    db   $01, $80, $15, $0a, $64, $1e, $04, $83        ;; 06:7e40 ????????
    db   $01, $a0, $2c, $0a, $04, $00, $0d, $0a        ;; 06:7e48 ????????
    db   $01, $c0, $2d, $fe, $00, $00, $a0, $01        ;; 06:7e50 ????????
    db   $01, $c0, $2e, $0a, $14, $00, $30, $07        ;; 06:7e58 ????????
    db   $01, $80, $1b, $0a, $40, $20, $08, $83        ;; 06:7e60 ????????
    db   $01, $c0, $22, $05, $04, $00, $04, $03        ;; 06:7e68 ????????
    db   $01, $c0, $27, $05, $0a, $00, $70, $03        ;; 06:7e70 ????????
    db   $01, $80, $1c, $0a, $0a, $08, $0d, $96        ;; 06:7e78 ????????
    db   $01, $c1, $21, $19, $00, $1e, $00, $01        ;; 06:7e80 ????????
    db   $01, $80, $1b, $05, $20, $20, $0d, $8b        ;; 06:7e88 ????????
    db   $01, $40, $28, $05, $0a, $00, $00, $01        ;; 06:7e90 ????????
    db   $01, $c8, $03, $03, $00, $00, $00, $01        ;; 06:7e98 ????????
    db   $01, $c0, $29, $03, $63, $00, $30, $02        ;; 06:7ea0 ????????
    db   $01, $c0, $2a, $03, $63, $00, $30, $01        ;; 06:7ea8 ????????
    db   $01, $80, $1b, $0a, $40, $20, $30, $8b        ;; 06:7eb0 ????????
    db   $01, $a0, $1e, $0a, $0c, $03, $0b, $06        ;; 06:7eb8 ????????
    db   $40, $00, $00, $fe, $00, $60, $00, $01        ;; 06:7ec0 ????????
    db   $00, $00, $00, $fe, $00, $00, $00, $01        ;; 06:7ec8 ????????
    db   $00, $00, $00, $fe, $00, $00, $00, $01        ;; 06:7ed0 ????????
    db   $00, $00, $00, $fe, $00, $00, $00, $01        ;; 06:7ed8 ????????
    db   $00, $00, $2f, $fe, $00, $00, $00, $01        ;; 06:7ee0 ????????
    db   $00, $00, $02, $fe, $28, $7f, $00, $01        ;; 06:7ee8 ????????
    db   $00, $00, $01, $fe, $14, $bf, $00, $01        ;; 06:7ef0 ????????
    db   $00, $00, $00, $fe, $00, $00, $00, $01        ;; 06:7ef8 ????????

data_06_7f00:
    db   $23, $45, $63, $75, $87, $8f, $93, $ff        ;; 06:7f00 ????????
    db   $ff, $ff, $af, $15, $13, $15, $15, $f0        ;; 06:7f08 ????????
    db   $19, $f2, $05, $fb, $fe, $b3, $0a, $b0        ;; 06:7f10 ????????
    db   $0a, $b9, $0a, $eb, $0a, $f5, $03, $ba        ;; 06:7f18 ????????
    db   $0a, $f9, $fe, $ec, $0a, $bb, $0a, $f4        ;; 06:7f20 ????????
    db   $03, $82, $0a, $bc, $0a, $df, $fe, $d1        ;; 06:7f28 ????????
    db   $fe, $d0, $19, $a2, $14, $86, $05, $9e        ;; 06:7f30 ????????
    db   $14, $f1, $05, $ee, $05, $ed, $05, $f8        ;; 06:7f38 ????????
    db   $fe, $f3, $03, $ad, $05, $a9, $05, $bf        ;; 06:7f40 ????????
    db   $03, $ae, $05, $db, $fe, $da, $fe, $00        ;; 06:7f48 ????????

data_06_7f50:
    db   $a0, $0f, $80, $0c, $60, $09, $a4, $06        ;; 06:7f50 ????????
    db   $e8, $03, $f4, $01, $01, $00, $00, $00        ;; 06:7f58 ????????

data_06_7f60:
    db   $18, $1e                                      ;; 06:7f60 ??

call_06_7f62:
    jr   jr_06_7f93                                    ;; 06:7f62 $18 $2f

call_06_7f64:
    jr   jr_06_7f9c                                    ;; 06:7f64 $18 $36
    db   $18, $3f                                      ;; 06:7f66 ??

call_06_7f68:
    jr   jr_06_7fb1                                    ;; 06:7f68 $18 $47

call_06_7f6a:
    jr   jr_06_7fb6                                    ;; 06:7f6a $18 $4a

call_06_7f6c:
    jr   jr_06_7fbb                                    ;; 06:7f6c $18 $4d

call_06_7f6e:
    jr   jr_06_7fc0                                    ;; 06:7f6e $18 $50
    db   $18, $56                                      ;; 06:7f70 ??

call_06_7f72:
    jr   jr_06_7fde                                    ;; 06:7f72 $18 $6a
    db   $18, $4f                                      ;; 06:7f74 ??

call_06_7f76:
    jr   jr_06_7fe8                                    ;; 06:7f76 $18 $70

jp_06_7f78:
    jr   jr_06_7fef                                    ;; 06:7f78 $18 $75

call_06_7f7a:
    jr   jr_06_7ff6                                    ;; 06:7f7a $18 $7a

jp_06_7f7c:
    jr   jr_06_7ffa                                    ;; 06:7f7c $18 $7c

call_06_7f7e:
    jr   jr_06_7f9a                                    ;; 06:7f7e $18 $1a
    db   $c5, $26, $00, $e5, $6f, $29, $29, $29        ;; 06:7f80 ????????
    db   $29, $29, $01, $00, $d0, $09, $c1, $09        ;; 06:7f88 ????????
    db   $c1, $7e, $c9                                 ;; 06:7f90 ???

jr_06_7f93:
    add  A, L                                          ;; 06:7f93 $85
    ld   L, A                                          ;; 06:7f94 $6f
    jr   NC, .jr_06_7f98                               ;; 06:7f95 $30 $01
    inc  H                                             ;; 06:7f97 $24
.jr_06_7f98:
    ld   A, [HL]                                       ;; 06:7f98 $7e
    ret                                                ;; 06:7f99 $c9

jr_06_7f9a:
    ld   A, $08                                        ;; 06:7f9a $3e $08

jr_06_7f9c:
    push DE                                            ;; 06:7f9c $d5
    ld   E, A                                          ;; 06:7f9d $5f
    ld   A, L                                          ;; 06:7f9e $7d
    sub  A, E                                          ;; 06:7f9f $93
    ld   L, A                                          ;; 06:7fa0 $6f
    jr   NC, .jr_06_7fa4                               ;; 06:7fa1 $30 $01
    dec  H                                             ;; 06:7fa3 $25
.jr_06_7fa4:
    pop  DE                                            ;; 06:7fa4 $d1
    ld   A, [HL]                                       ;; 06:7fa5 $7e
    ret                                                ;; 06:7fa6 $c9
    db   $e5, $6f, $7b, $95, $5f, $30, $01, $15        ;; 06:7fa7 ????????
    db   $e1, $c9                                      ;; 06:7faf ??

jr_06_7fb1:
    add  A, C                                          ;; 06:7fb1 $81
    ld   C, A                                          ;; 06:7fb2 $4f
    ret  NC                                            ;; 06:7fb3 $d0
    inc  B                                             ;; 06:7fb4 $04
    ret                                                ;; 06:7fb5 $c9

jr_06_7fb6:
    ld   C, [HL]                                       ;; 06:7fb6 $4e
    inc  HL                                            ;; 06:7fb7 $23
    ld   B, [HL]                                       ;; 06:7fb8 $46
    dec  HL                                            ;; 06:7fb9 $2b
    ret                                                ;; 06:7fba $c9

jr_06_7fbb:
    ld   E, [HL]                                       ;; 06:7fbb $5e
    inc  HL                                            ;; 06:7fbc $23
    ld   D, [HL]                                       ;; 06:7fbd $56
    dec  HL                                            ;; 06:7fbe $2b
    ret                                                ;; 06:7fbf $c9

jr_06_7fc0:
    ld   [HL], E                                       ;; 06:7fc0 $73
    inc  HL                                            ;; 06:7fc1 $23
    ld   [HL], D                                       ;; 06:7fc2 $72
    dec  HL                                            ;; 06:7fc3 $2b
    ret                                                ;; 06:7fc4 $c9
    db   $11, $01, $00, $cb, $7c, $28, $09, $cb        ;; 06:7fc5 ????????
    db   $7a, $c2, $68, $01, $1f, $17, $37, $c9        ;; 06:7fcd ????????
    db   $cb, $7a, $ca, $68, $01, $1f, $17, $a7        ;; 06:7fd5 ????????
    db   $c9                                           ;; 06:7fdd ?

jr_06_7fde:
    push AF                                            ;; 06:7fde $f5
    ld   A, E                                          ;; 06:7fdf $7b
    cpl                                                ;; 06:7fe0 $2f
    ld   E, A                                          ;; 06:7fe1 $5f
    ld   A, D                                          ;; 06:7fe2 $7a
    cpl                                                ;; 06:7fe3 $2f
    ld   D, A                                          ;; 06:7fe4 $57
    inc  DE                                            ;; 06:7fe5 $13
    pop  AF                                            ;; 06:7fe6 $f1
    ret                                                ;; 06:7fe7 $c9

jr_06_7fe8:
    push HL                                            ;; 06:7fe8 $e5
    ld   HL, hFFB6                                     ;; 06:7fe9 $21 $b6 $ff
    inc  [HL]                                          ;; 06:7fec $34
    pop  HL                                            ;; 06:7fed $e1
    ret                                                ;; 06:7fee $c9

jr_06_7fef:
    push HL                                            ;; 06:7fef $e5
    ld   HL, hFFB6                                     ;; 06:7ff0 $21 $b6 $ff
    dec  [HL]                                          ;; 06:7ff3 $35
    pop  HL                                            ;; 06:7ff4 $e1
    ret                                                ;; 06:7ff5 $c9

jr_06_7ff6:
    sub  A, A                                          ;; 06:7ff6 $97
    ldh  [hFFB6], A                                    ;; 06:7ff7 $e0 $b6
    ret                                                ;; 06:7ff9 $c9

jr_06_7ffa:
    pop  HL                                            ;; 06:7ffa $e1
    pop  DE                                            ;; 06:7ffb $d1
    pop  BC                                            ;; 06:7ffc $c1
    pop  AF                                            ;; 06:7ffd $f1
    ret                                                ;; 06:7ffe $c9
    db   $02                                           ;; 06:7fff ?
