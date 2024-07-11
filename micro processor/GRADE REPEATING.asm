.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'ENTER STUDENT NUMBER: $'
MSG1 DB 'ENTER GRADE(A,B,C,D): $'
NEXT_LINE DB 0DH,0AH,'$'
X DB ?
SUM DB 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    
     LEA DX,NEXT_LINE
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    MOV AH, 1
    INT 21H
    MOV BL, AL
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
ST:
    MOV CL, 0
    MOV CH, 0
    
START:

    LEA DX,NEXT_LINE
    MOV AH,9
    INT 21H
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H    
    MOV AH, 1
    INT 21H
    MOV BH, AL
    INC CL
    
    CMP BH, 'A'
    JE SETA
    CMP BH, 'B'
    JE SETB
    CMP BH, 'C'
    JE SETC
    CMP BH, 'D'
    JE SETD
    JMP EXIT

AVG:
    SUB SUM, 4
    INC CH
    CMP SUM, 4
    JL PRINT
    JMP AVG

SETA:
    ADD SUM, 4
    CMP CL, 4
    JE AVG
    JMP START

SETB:
    ADD SUM, 3
    CMP CL, 4
    JE AVG
    JMP START

SETC:
    ADD SUM, 2
    CMP CL, 4
    JE AVG
    JMP START

SETD:
    ADD SUM, 1
    CMP CL, 4
    JE AVG
    JMP START

PRINT:
    ADD CH, 48
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    MOV DL, CH
    INT 21H
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    DEC BL
    CMP BL, '0'
    JE EXIT
    JMP ST    
    
EXIT:    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN
