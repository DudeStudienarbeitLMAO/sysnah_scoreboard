include displays.asm
org 0000h



repeat:
acall display_0_0
acall display_0_1
acall display_0_2
acall display_0_3
acall display_0_4
acall display_0_5
acall display_0_6
acall display_0_7
acall display_0_8
acall display_0_9
delay:
;mov r3,#010h
;l3:mov r2,#0ffh
;l2:mov r1,#0ffh
mov r1,#010h
l1:djnz r1,l1
;djnz r2,l2
;djnz r3,l3
ret 