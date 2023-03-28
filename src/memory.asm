;; Disassembled with BadBoy Disassembler: https://github.com/daid/BadBoy

INCLUDE "include/hardware.inc"
INCLUDE "include/macros.inc"
INCLUDE "include/charmaps.inc"
INCLUDE "include/constants.inc"

SECTION "wram0", WRAM0[$c000]

wC000:
    ds 2                                               ;; c000

wC002:
    ds 1                                               ;; c002

wC003:
    ds 8                                               ;; c003

wC00B:
    ds 5                                               ;; c00b

wC010:
    ds 3                                               ;; c010

wC013:
    ds 93                                              ;; c013

wC070:
    ds 16                                              ;; c070

wC080:
    ds 16                                              ;; c080

wC090:
    ds 112                                             ;; c090

wC100:
    ds 2                                               ;; c100

wC102:
    ds 510                                             ;; c102

wC300:
    ds 128                                             ;; c300

wC380:
    ds 1                                               ;; c380

wC381:
    ds 4                                               ;; c381

wC385:
    ds 1                                               ;; c385

wC386:
    ds 5                                               ;; c386

wC38B:
    ds 1                                               ;; c38b

wC38C:
    ds 3                                               ;; c38c

wC38F:
    ds 11                                              ;; c38f

wVBlankHandler:
    ds 3                                               ;; c39a

wLCDCHandler:
    ds 3                                               ;; c39d

wC3A0:
    ds 1                                               ;; c3a0

wC3A1:
    ds 3                                               ;; c3a1

wC3A4:
    ds 1                                               ;; c3a4

wC3A5:
    ds 1                                               ;; c3a5

wC3A6:
    ds 1                                               ;; c3a6

wC3A7:
    ds 1                                               ;; c3a7

wC3A8:
    ds 1                                               ;; c3a8

wC3A9:
    ds 1                                               ;; c3a9

wC3AA:
    ds 1                                               ;; c3aa

wC3AB:
    ds 1                                               ;; c3ab

wC3AC:
    ds 1                                               ;; c3ac

wC3AD:
    ds 27                                              ;; c3ad

wC3C8:
    ds 8                                               ;; c3c8

wC3D0:
    ds 10                                              ;; c3d0

wC3DA:
    ds 10                                              ;; c3da

wC3E4:
    ds 28                                              ;; c3e4

wC400:
    ds 2                                               ;; c400

wC402:
    ds 30                                              ;; c402

wC420:
    ds 2                                               ;; c420

wC422:
    ds 2                                               ;; c422

wC424:
    ds 1                                               ;; c424

wC425:
    ds 219                                             ;; c425

wC500:
    ds 44                                              ;; c500

wC52C:
    ds 1                                               ;; c52c

wC52D:
    ds 2                                               ;; c52d

wC52F:
    ds 3                                               ;; c52f

wC532:
    ds 1                                               ;; c532

wC533:
    ds 3                                               ;; c533

wC536:
    ds 3                                               ;; c536

wC539:
    ds 1                                               ;; c539

wC53A:
    ds 3                                               ;; c53a

wC53D:
    ds 31                                              ;; c53d

wC55C:
    ds 4                                               ;; c55c

wC560:
    ds 76                                              ;; c560

wC5AC:
    ds 1                                               ;; c5ac

wC5AD:
    ds 1                                               ;; c5ad

wC5AE:
    ds 1                                               ;; c5ae

wC5AF:
    ds 1                                               ;; c5af

wC5B0:
    ds 1                                               ;; c5b0

wC5B1:
    ds 1                                               ;; c5b1

wC5B2:
    ds 1                                               ;; c5b2

wC5B3:
    ds 1                                               ;; c5b3

wC5B4:
    ds 1                                               ;; c5b4

wC5B5:
    ds 1                                               ;; c5b5

wC5B6:
    ds 1                                               ;; c5b6

wC5B7:
    ds 1                                               ;; c5b7

wC5B8:
    ds 1                                               ;; c5b8

wC5B9:
    ds 1                                               ;; c5b9

wC5BA:
    ds 1                                               ;; c5ba

wC5BB:
    ds 1                                               ;; c5bb

wC5BC:
    ds 1                                               ;; c5bc

wC5BD:
    ds 1                                               ;; c5bd

wC5BE:
    ds 1                                               ;; c5be

wC5BF:
    ds 1                                               ;; c5bf

wC5C0:
    ds 1                                               ;; c5c0

wC5C1:
    ds 1                                               ;; c5c1

wC5C2:
    ds 1                                               ;; c5c2

wC5C3:
    ds 3                                               ;; c5c3

wC5C6:
    ds 1                                               ;; c5c6

wC5C7:
    ds 1                                               ;; c5c7

wC5C8:
    ds 1                                               ;; c5c8

wC5C9:
    ds 1                                               ;; c5c9

wC5CA:
    ds 1                                               ;; c5ca

wC5CB:
    ds 1                                               ;; c5cb

wC5CC:
    ds 1                                               ;; c5cc

wC5CD:
    ds 1                                               ;; c5cd

wC5CE:
    ds 1                                               ;; c5ce

wC5CF:
    ds 1                                               ;; c5cf

wC5D0:
    ds 1                                               ;; c5d0

wC5D1:
    ds 1                                               ;; c5d1

wC5D2:
    ds 16                                              ;; c5d2

wC5E2:
    ds 30                                              ;; c5e2

wC600:
    ds 1                                               ;; c600

wC601:
    ds 7                                               ;; c601

wC608:
    ds 1                                               ;; c608

wC609:
    ds 1                                               ;; c609

wC60A:
    ds 3                                               ;; c60a

wC60D:
    ds 3                                               ;; c60d

wC610:
    ds 1                                               ;; c610

wC611:
    ds 3                                               ;; c611

wC614:
    ds 1                                               ;; c614

wC615:
    ds 2                                               ;; c615

wC617:
    ds 3                                               ;; c617

wC61A:
    ds 3                                               ;; c61a

wC61D:
    ds 1                                               ;; c61d

wC61E:
    ds 3                                               ;; c61e

wC621:
    ds 1                                               ;; c621

wC622:
    ds 3                                               ;; c622

wC625:
    ds 1                                               ;; c625

wC626:
    ds 3                                               ;; c626

wC629:
    ds 1                                               ;; c629

wC62A:
    ds 1                                               ;; c62a

wC62B:
    ds 1                                               ;; c62b

wC62C:
    ds 5                                               ;; c62c

wC631:
    ds 4                                               ;; c631

wC635:
    ds 19                                              ;; c635

wC648:
    ds 8                                               ;; c648

wC650:
    ds 8                                               ;; c650

wC658:
    ds 12                                              ;; c658

wC664:
    ds 2                                               ;; c664

wC666:
    ds 6                                               ;; c666

wC66C:
    ds 14                                              ;; c66c

wC67A:
    ds 24                                              ;; c67a

wC692:
    ds 25                                              ;; c692

wC6AB:
    ds 85                                              ;; c6ab

wC700:
    ds 9                                               ;; c700

wC709:
    ds 1                                               ;; c709

wC70A:
    ds 9                                               ;; c70a

wC713:
    ds 2                                               ;; c713

wC715:
    ds 4                                               ;; c715

wC719:
    ds 8                                               ;; c719

wC721:
    ds 71                                              ;; c721

wC768:
    ds 20                                              ;; c768

wC77C:
    ds 4                                               ;; c77c

wC780:
    ds 128                                             ;; c780

wC800:
    ds 96                                              ;; c800

wC860:
    ds 160                                             ;; c860

wC900:
    ds 1                                               ;; c900

wC901:
    ds 3                                               ;; c901

wC904:
    ds 252                                             ;; c904

wCA00:
    ds 512                                             ;; ca00

wCC00:
    ds 5                                               ;; cc00

wCC05:
    ds 26                                              ;; cc05

wCC1F:
    ds 31                                              ;; cc1f

wCC3E:
    ds 31                                              ;; cc3e

wCC5D:
    ds 31                                              ;; cc5d

wCC7C:
    ds 1                                               ;; cc7c

wCC7D:
    ds 15                                              ;; cc7d

wCC8C:
    ds 1                                               ;; cc8c

wCC8D:
    ds 2                                               ;; cc8d

wCC8F:
    ds 1                                               ;; cc8f

wCC90:
    ds 1                                               ;; cc90

wCC91:
    ds 8                                               ;; cc91

wCC99:
    ds 12                                              ;; cc99

wCCA5:
    ds 28                                              ;; cca5

wCCC1:
    ds 1                                               ;; ccc1

wCCC2:
    ds 1                                               ;; ccc2

wCCC3:
    ds 1                                               ;; ccc3

wCCC4:
    ds 1                                               ;; ccc4

wCCC5:
    ds 1                                               ;; ccc5

wCCC6:
    ds 1                                               ;; ccc6

wCCC7:
    ds 1                                               ;; ccc7

wCCC8:
    ds 1                                               ;; ccc8

wCCC9:
    ds 1                                               ;; ccc9

wCCCA:
    ds 50                                              ;; ccca

wCCFC:
    ds 2                                               ;; ccfc

wCCFE:
    ds 258                                             ;; ccfe

wCE00:
    ds 1                                               ;; ce00

wCE01:
    ds 1                                               ;; ce01

wCE02:
    ds 2                                               ;; ce02

wCE04:
    ds 10                                              ;; ce04

wCE0E:
    ds 6                                               ;; ce0e

wCE14:
    ds 3                                               ;; ce14

wCE17:
    ds 1                                               ;; ce17

wCE18:
    ds 8                                               ;; ce18

wCE20:
    ds 1                                               ;; ce20

wCE21:
    ds 1                                               ;; ce21

wCE22:
    ds 2                                               ;; ce22

wCE24:
    ds 10                                              ;; ce24

wCE2E:
    ds 6                                               ;; ce2e

wCE34:
    ds 3                                               ;; ce34

wCE37:
    ds 9                                               ;; ce37

wCE40:
    ds 1                                               ;; ce40

wCE41:
    ds 1                                               ;; ce41

wCE42:
    ds 2                                               ;; ce42

wCE44:
    ds 10                                              ;; ce44

wCE4E:
    ds 6                                               ;; ce4e

wCE54:
    ds 3                                               ;; ce54

wCE57:
    ds 4                                               ;; ce57

wCE5B:
    ds 5                                               ;; ce5b

wCE60:
    ds 96                                              ;; ce60

wCEC0:
    ds 1                                               ;; cec0

wCEC1:
    ds 1                                               ;; cec1

wCEC2:
    ds 1                                               ;; cec2

wCEC3:
    ds 1                                               ;; cec3

wCEC4:
    ds 1                                               ;; cec4

wCEC5:
    ds 1                                               ;; cec5

wCEC6:
    ds 1                                               ;; cec6

wCEC7:
    ds 313                                             ;; cec7

wD000:
    ds 2                                               ;; d000

wD002:
    ds 12                                              ;; d002

wD00E:
    ds 114                                             ;; d00e

wD080:
    ds 2                                               ;; d080

wD082:
    ds 862                                             ;; d082

wD3E0:
    ds 1                                               ;; d3e0

wD3E1:
    ds 1                                               ;; d3e1

wD3E2:
    ds 1                                               ;; d3e2

wD3E3:
    ds 1                                               ;; d3e3

wD3E4:
    ds 1                                               ;; d3e4

wD3E5:
    ds 1                                               ;; d3e5

wD3E6:
    ds 1                                               ;; d3e6

wD3E7:
    ds 2                                               ;; d3e7

wD3E9:
    ds 1                                               ;; d3e9

wD3EA:
    ds 5                                               ;; d3ea

wD3EF:
    ds 3                                               ;; d3ef

wD3F2:
    ds 1                                               ;; d3f2

wD3F3:
    ds 4                                               ;; d3f3

wD3F7:
    ds 4                                               ;; d3f7

wD3FB:
    ds 143                                             ;; d3fb

wD48A:
    ds 3                                               ;; d48a

wD48D:
    ds 27                                              ;; d48d

wD4A8:
    ds 2                                               ;; d4a8

wD4AA:
    ds 1                                               ;; d4aa

wD4AB:
    ds 1                                               ;; d4ab

wD4AC:
    ds 1                                               ;; d4ac

wD4AD:
    ds 1                                               ;; d4ad

wD4AE:
    ds 2                                               ;; d4ae

wD4B0:
    ds 1                                               ;; d4b0

wD4B1:
    ds 1                                               ;; d4b1

wD4B2:
    ds 4                                               ;; d4b2

wD4B6:
    ds 3                                               ;; d4b6

wD4B9:
    ds 1                                               ;; d4b9

wD4BA:
    ds 1                                               ;; d4ba

wD4BB:
    ds 2                                               ;; d4bb

wD4BD:
    ds 1                                               ;; d4bd

wD4BE:
    ds 871                                             ;; d4be

wD825:
    ds 9                                               ;; d825

wD82E:
    ds 3                                               ;; d82e

wD831:
    ds 1                                               ;; d831

wD832:
    ds 4                                               ;; d832

wD836:
    ds 273                                             ;; d836

wD947:
    ds 64                                              ;; d947

wD987:
    ds 1145                                            ;; d987

wDE00:
    ds 256                                             ;; de00

wDF00:
    ds 128                                             ;; df00

wDF80:
    ds 62                                              ;; df80

wDFBE:
    ds 1                                               ;; dfbe

wDFBF:
    ds 65                                              ;; dfbf

SECTION "hram", HRAM[$ff80]

hFF80:
    ds 8                                               ;; ff80

hFF88:
    ds 1                                               ;; ff88

hFF89:
    ds 1                                               ;; ff89

hFF8A:
    ds 1                                               ;; ff8a

hCurrentBank:
    ds 2                                               ;; ff8b

hFF8D:
    ds 1                                               ;; ff8d

hFF8E:
    ds 4                                               ;; ff8e

hFF92:
    ds 1                                               ;; ff92

hFF93:
    ds 1                                               ;; ff93

hFF94:
    ds 1                                               ;; ff94

hFF95:
    ds 2                                               ;; ff95

hFF97:
    ds 2                                               ;; ff97

hFF99:
    ds 2                                               ;; ff99

hFF9B:
    ds 1                                               ;; ff9b

hFF9C:
    ds 20                                              ;; ff9c

hFFB0:
    ds 1                                               ;; ffb0

hFFB1:
    ds 1                                               ;; ffb1

hFFB2:
    ds 1                                               ;; ffb2

hFFB3:
    ds 1                                               ;; ffb3

hFFB4:
    ds 1                                               ;; ffb4

hFFB5:
    ds 1                                               ;; ffb5

hFFB6:
    ds 1                                               ;; ffb6

hFFB7:
    ds 1                                               ;; ffb7

hFFB8:
    ds 1                                               ;; ffb8

hFFB9:
    ds 1                                               ;; ffb9

hFFBA:
    ds 1                                               ;; ffba

hFFBB:
    ds 1                                               ;; ffbb

hFFBC:
    ds 1                                               ;; ffbc

hFFBD:
    ds 1                                               ;; ffbd

hFFBE:
    ds 1                                               ;; ffbe

hFFBF:
    ds 1                                               ;; ffbf

hFFC0:
    ds 1                                               ;; ffc0

hFFC1:
    ds 1                                               ;; ffc1

hFFC2:
    ds 1                                               ;; ffc2

hFFC3:
    ds 1                                               ;; ffc3

hFFC4:
    ds 1                                               ;; ffc4

hFFC5:
    ds 2                                               ;; ffc5

hFFC7:
    ds 1                                               ;; ffc7

hFFC8:
    ds 5                                               ;; ffc8

hFFCD:
    ds 1                                               ;; ffcd

hFFCE:
    ds 1                                               ;; ffce

hFFCF:
    ds 1                                               ;; ffcf

hFFD0:
    ds 1                                               ;; ffd0

hFFD1:
    ds 1                                               ;; ffd1

hFFD2:
    ds 1                                               ;; ffd2

hFFD3:
    ds 5                                               ;; ffd3

hFFD8:
    ds 6                                               ;; ffd8

hFFDE:
    ds 2                                               ;; ffde

hCurrentMusic:
    ds 1                                               ;; ffe0

hPlayingMusic:
    ds 1                                               ;; ffe1

hFFE2:
    ds 1                                               ;; ffe2

hFFE3:
    ds 1                                               ;; ffe3

hSFX:
    ds 2                                               ;; ffe4

hFFE6:
    ds 1                                               ;; ffe6

hFFE7:
    ds 1                                               ;; ffe7

hFFE8:
    ds 1                                               ;; ffe8

hFFE9:
    ds 1                                               ;; ffe9

hFFEA:
    ds 1                                               ;; ffea

hFFEB:
    ds 1                                               ;; ffeb

hFFEC:
    ds 1                                               ;; ffec

hFFED:
    ds 1                                               ;; ffed

hFFEE:
    ds 2                                               ;; ffee

hFFF0:
    ds 1                                               ;; fff0

hFFF1:
    ds 1                                               ;; fff1

hFFF2:
    ds 1                                               ;; fff2

hFFF3:
    ds 1                                               ;; fff3

hFFF4:
    ds 1                                               ;; fff4

hFFF5:
    ds 1                                               ;; fff5

hFFF6:
    ds 1                                               ;; fff6

hFFF7:
    ds 1                                               ;; fff7

hFFF8:
    ds 1                                               ;; fff8

hFFF9:
    ds 1                                               ;; fff9

hFFFA:
    ds 1                                               ;; fffa

hFFFB:
    ds 1                                               ;; fffb

hFFFC:
    ds 1                                               ;; fffc

hFFFD:
    ds 1                                               ;; fffd

hFFFE:
    ds 1                                               ;; fffe

SECTION "vram", VRAM[$8000]
    ds 8192                                            ;; 8000

SECTION "sram", SRAM[$a000]

sA000:
    ds 8192                                            ;; a000
