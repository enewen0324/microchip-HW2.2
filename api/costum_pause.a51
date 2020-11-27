;; pause time = varible1*varilbe2*varilble3
costum_pause:
    PUSH 0
    PUSH 1
    PUSH 2
    PUSH 3
    PUSH 4
    PUSH 5

    MOV R0,20H
    MOV R3,@R0
    DEC R0
    MOV R4,@R0
    DEC R0
    MOV R5,@R0
    DEC R0
    MOV 20H,R0

	MOV R2,R5
c_pause2:
	MOV R0,R4
    MOV R1,R3
c_pause:
    PUSH 1
    DJNZ R1, $
    POP 1
    DJNZ R0 , c_pause
    DJNZ R2 , c_pause2
    POP 5
    POP 4
    POP 3
	POP 2
    POP 1
    POP 0
    RET