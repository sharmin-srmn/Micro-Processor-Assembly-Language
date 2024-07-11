.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "ENTER A HEX DIGIT CHARACTER (0-9 OR A-F) $"
    MSG2 DB "DO YOU WANT TO INPUT AGAIN? (y OR Y FOR YES, ANYTHING ELSE FOR NO) $" 
    MSG3 DB "ILLEGAL CHARACTER, PLEASE TRY AGAIN $"
    MSG4 DB "IN DECIMAL IT IS: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV CL, 1
START:

    MOV AH, 9
    LEA DX, MSG
    INT 21H
     
    MOV AH, 1
    INT 21H 
    
    MOV BL, AL
0TOF:    
    CMP BL, 048
    JL ILLEGAL
    CMP BL, 070
    JG ILLEGAL 
    
0TO9:
    CMP BL, 057
    JLE PRINT
    
    
       

ILL:
    CMP BL, 058
    JGE A
    A:
    CMP BL, 064
    JLE ILLEGAL
    
ATOF:
    CMP BL, 065
    JGE B
    B:
    CMP BL, 070
    JLE PRINTDIGIT 

ILLEGAL:
    INC CL
    CMP CL, 3
    JG EX
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    MOV AH, 9
    LEA DX, MSG3
    INT 21H
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    JMP START



PRINT:
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    MOV AH, 9
    LEA DX, MSG4
    INT 21H 
    MOV AH, 2
    MOV DL, BL
    INT 21H
    JMP YESORNO 
    
PRINTDIGIT:
    SUB BL, 17
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    MOV AH, 9
    LEA DX, MSG4
    INT 21H
    MOV AH, 2
    MOV DL,049
    INT 21H 
    MOV AH, 2
    MOV DL, BL
    INT 21H 
    
    
YESORNO:
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
     
    MOV AH, 9
    LEA DX, MSG2
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    MOV BH, AL
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H
    
    CMP BH, 'y'
    JE START
    CMP BH, 'Y'
    JE START    
    
    
    
EX:    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN