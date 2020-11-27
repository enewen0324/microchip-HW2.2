ORG 0
main:
    ACALL reset
    MOV SP,#04FH
    MOV 20H,#20H
    MOV R0,20H
    INC R0
    MOV @R0,#05H ;first number
    INC R0
    MOV @R0,#04H ;second number
    INC R0
    MOV @R0,#03H ;third number
    INC R0
    MOV @R0,#02H ;fourth number
    INC R0
    MOV @R0,#01H ;fiveth number
    INC R0
    MOV @R0,#00H ;sixth number
    INC R0
    MOV @R0,#00H ;module pattarn. If it is #0FFH, 1-6 number is dont care; 
    MOV 20H,R0
    ACALL seven_level

    MOV R0,20H
    INC R0 ;first number, dont care
    INC R0 ; dont care
    INC R0 ; dont care
    INC R0 ; dont care
    INC R0 ; dont care
    INC R0 ; dont care
    INC R0 ; dont care
    MOV @R0,#0FFH
    MOV 20H,R0
    ACALL seven_level
    LJMP endl

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
    MOV 1,@R0 ;7th varible, module pattarn
    DEC R0
    MOV 2,@R0 ;6th varible, 6th number
    DEC R0
    MOV 3,@R0 ;5th varible, 5th number
    DEC R0
    MOV 4,@R0 ;4th varible, 4th number
    DEC R0
    MOV 5,@R0 ;3rd varible, 3rd number
    DEC R0
    MOV 6,@R0 ;2nd varible, 2nd number
    DEC R0
    MOV 7,@R0 ;1st varible, 1st number
    DEC R0
    MOV 20H,R0 ;restore self stack pointer

    MOV R0,#080H ; repeate times
kama:
    PUSH 0
    MOV R0,#006H 
action:
    PUSH 0
    MOV A,R1
    ANL A,#0FEH
loop:
    djnz R0,fi_rotate
    RL A
    AJMP loop
fi_rotate:
    POP 0
    INC R0
    MOV P1,A
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
    RET
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
reset:  
    CLR A
    CLR c
    MOV R0,#00H
    MOV R1,#00H
    MOV R2,#00H
    MOV R3,#00H
    MOV R4,#00H
    MOV R5,#00H
    MOV R6,#00H
    MOV R7,#00H
    RET
endl:
    END 