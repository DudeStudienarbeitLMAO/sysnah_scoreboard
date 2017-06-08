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