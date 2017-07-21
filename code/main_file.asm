
cseg at 0h
ajmp init
cseg at 100h


ORG 0bh



ORG 20h
init:
mov IE, #10010010b
mov tmod, #00000010b
mov P1, #00010001b
mov r7, #00h
mov r6, #00h
mov P0, #00h

checkPorts:
acall show
JB F0, buttonpressed
MOV C,P0.1
JC increaseleft
MOV C,P0.0
JC increaseright
MOV C, P0.2
JC resetgame
sjmp checkPorts

buttonpressed:
acall show
MOV C, P0.0
JC buttonpressed
MOV C, P0.1
JC buttonpressed
MOV C, P0.2
JC buttonpressed
CLR F0
JMP checkports

resetgame:
MOV R6, #00h
MOV R7, #00h
mov P1, #00010001b
SETB F0
acall checkPorts

show:
mov DPTR, #table
mov a, R6
mov b, #0ah
div ab
mov R0, a
movc a,@a+dptr
mov r3, a
mov a, r0
xch a,b
movc a, @a+dptr
mov r2, a
;----------------
mov a, R7
mov b, #0ah
div ab
mov R0, a
movc a,@a+dptr
mov r5, a
mov a, r0
xch a,b
movc a, @a+dptr
mov r4, a
call ledmulti
ret

ledmulti:
mov P3, R2
clr P2.0
setb P2.0

mov P3, R3
clr P2.1
setb P2.1

mov P3, R4
clr P2.2
setb P2.2

mov P3, R5
clr P2.3
setb P2.3

ret

increaseleft:
JB P1.7, ledmultiwinleft
JB P1.6, ledmulti40left
JB P1.5, ledmulti30left
JB P1.4, ledmulti15left
acall checkPorts


increaseright:
JB P1.3, ledmultiwinright
JB P1.2, ledmulti40right
JB P1.1, ledmulti30right
JB P1.0, ledmulti15right
acall checkPorts

ledmulti15right:
SETB P1.1
mov R6, #0fh
SETB F0
acall checkPorts

ledmulti30right:
SETB P1.2
mov R6, #1eh
SETB F0
acall checkPorts

ledmulti40right:
SETB P1.3
mov R6, #28h
SETB F0
acall checkPorts

ledmultiwinright:
JNB P1.7, RIGHTWIN ;es steht x-40 mit x<=30
acall checkPorts

RIGHTWIN:
SETB P0.6 ;satzpunkt für rechts in port0 schieben
acall checkPorts

ledmulti15left:
SETB P1.5
mov R7, #0fh
SETB F0
acall checkPorts

ledmulti30left:
SETB P1.6
mov R7, #1eh
SETB F0
acall checkPorts

ledmulti40left:
SETB P1.7
mov R7, #28h
SETB F0
acall checkPorts

ledmultiwinleft:
JNB P1.3, WINLEFT
acall checkPorts

WINLEFT:
SETB P0.7
acall checkPorts

org 300h
table:
db 11000000b
db 11111001b, 10100100b, 10110000b
db 10011001b, 10010010b, 10000010b
db 11111000b, 10000000b, 10010000b

end

