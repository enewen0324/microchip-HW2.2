;; pause time = 16*255 
short_pause:
    PUSH 0
    PUSH 1
s_pause2:
	MOV R0,#010H
    MOV R1,#0FFH
s_pause:
    PUSH 1
    DJNZ R1, $
    POP 1
    DJNZ R0 , s_pause
    POP 1
    POP 0
    RET