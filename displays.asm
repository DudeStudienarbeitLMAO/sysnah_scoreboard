; Add 'ret' to each display to stop looping
display_0_0:
mov p0,#10000001b ; Die Null
acall delay
display_0_1:
mov p0,#11001111b ; Die Oins
acall delay
display_0_2:
mov p0,#10010010b ; Die Zwo
acall delay
display_0_3:
mov p0,#10000110b ; Die Drey
acall delay
display_0_4:
mov p0,#11001100b ; Die Vier
acall delay
display_0_5:
mov p0,#10100100b ; Die Fümf
acall delay
display_0_6:
mov p0,#10100000b ; Die Serks
acall delay
display_0_7:
mov p0,#10001111b ; Die Sieben
acall delay
display_0_8:
mov p0,#10000000b ; Die Agt
acall delay
display_0_9:
mov p0,#10000100b ; Die Noin
acall delay
sjmp repeat ; remove to stop looping