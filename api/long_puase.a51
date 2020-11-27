;; pause time = 10*255*255 
long_pause:
    PUSH 0
    PUSH 1
	PUSH 2
	MOV R2,#10H
l_pause2:
	MOV R0,#0FFH
    MOV R1,#0FFH
l_pause:
    PUSH 1
    DJNZ R1, $
    POP 1
    DJNZ R0 , l_pause
	DJNZ R2 , l_pause2
	POP 2
    POP 1
    POP 0
    RET