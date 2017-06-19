
cseg at 0h
ajmp init
cseg at 100h


ORG 0bh



ORG 20h
init:
mov IE, #10010010b
mov tmod, #00000010b
mov P0, #00h
mov P1, #00010001b
mov r7, #00h
mov r6, #00h

meme:
acall zeigen
JB P0.1, increaseleft
JB P0.0, increaseright
sjmp meme

increaseleft:
JB P1.6, display40left
JB P1.5, display30left
JB P1.4, display15left
acall meme


increaseright:
JB P1.2, display40right
JB P1.1, display30right
JB P1.0, display15right
acall meme

zeigen:
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
call display
ret

display:
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

display15right:
SETB P1.1
clr P0.0
mov R6, #0fh
acall meme

display30right:
SETB P1.2
clr P0.0
mov R6, #1eh
acall meme

display40right:
SETB P1.3
clr P0.0
mov R6, #28h
acall meme


display15left:
SETB P1.5
clr P0.1
mov R7, #0fh
acall meme

display30left:
SETB P1.6
clr P0.1
mov R7, #1eh
acall meme

display40left:
SETB P1.7
clr P0.1
mov R7, #28h
acall meme


org 300h
table:
db 11000000b
db 11111001b, 10100100b, 10110000b
db 10011001b, 10010010b, 10000010b
db 11111000b, 10000000b, 10010000b

end
