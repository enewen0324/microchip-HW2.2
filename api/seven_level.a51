seven_level:
    PUSH 0
    PUSH 1
    PUSH 2
    PUSH 3
    PUSH 4
    PUSH 5
    PUSH 6
    PUSH 7

    MOV R0,20H
    MOV R1,@R0
    DEC R0
    MOV R2,@R0
    DEC R0
    MOV R3,@R0
    DEC R0
    MOV R4,@R0
    DEC R0
    MOV R5,@R0
    DEC R0
    MOV R6,@R0
    DEC R0
    MOV R7,@R0
    DEC R0
    MOV 20H,R0

    MOV R0,#080H
kama:
    PUSH 0
    MOV R0,#006H
action:
    INC R0
    MOV P0,R1
    MOV P2,@R0
    ACALL short_pause
    DEC R0
    djnz R0,action
    POP 0
    djnz R0,kama

    POP 7
    POP 6
    POP 5
    POP 4
    POP 3
    POP 2
    POP 1
    POP 0