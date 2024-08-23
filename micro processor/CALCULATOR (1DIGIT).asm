.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER FIRST NUMBER = $"
MSG2 DB 10,13,"ENTER SECOND NUMBER = $"
MSG3 DB 10,13,"WHAT DO YOU WANT TO DO? CHOOSE ONE (+, -, *, /, %) = $" 
MSG4 DB 10,13,"THE RESULT IS = $"

STAR DB 10
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    OUTER:    
    LEA DX, MSG1
    MOV AH,9       ; FIRST INPUT MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO BH
    SUB AL,48
    MOV BH,AL
    
    LEA DX, MSG2   ; SECOND INPUT MESSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO BL
    SUB AL,48
    MOV BL,AL
    
    
    
    LEA DX, MSG3   ; OPERATION MESSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL, "+"
    JE ADDITION
    
    CMP AL, "-"
    JE SUBSTRACTION
    
    CMP AL, "*"
    JE MULTIPLICATION
    
    CMP AL, "/"
    JE DIVISION 
    
    CMP AL, "%"
    JE MODULUS 
    
    
    ADDITION:
    ADD BL,BH 
    MOV AX,0
    MOV AL,BL
    AAA
    MOV BH,AH
    ADD BH,48
    MOV BL,AL
    ADD BL,48    
    JMP SHOW
    
    SUBSTRACTION:
    SUB BH,BL
    MOV AX,0
    MOV AL,BH
    AAA
    MOV BH,AH
    ADD BH,48
    MOV BL,AL
    ADD BL,48    
    JMP SHOW 
    
    MULTIPLICATION:
    MOV AX,0
    MOV AL,BH
    MUL BL
    AAM
    MOV BH,AH
    ADD BH,48
    MOV BL,AL
    ADD BL,48    
    JMP SHOW 
    
    DIVISION: 
    MOV AX,0
    MOV AL,BH
    DIV BL
    MOV AH,0 
    MOV BH,AH
    ADD BH,48
    MOV BL,AL
    ADD BL,48    
    JMP SHOW
    
    MODULUS:
    MOV AX,0
    MOV AL,BH
    DIV BL
    MOV AL,AH
    MOV AH,0 
    MOV BH,AH
    ADD BH,48
    MOV BL,AL
    ADD BL,48    
    JMP SHOW
    
    SHOW:
    LEA DX, MSG4   ; RESULT MESSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    JE EXIT
    
    LOOP OUTER  
    
         
    
    
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN