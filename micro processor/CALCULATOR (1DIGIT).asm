.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER FIRST NUMBER = $"
MSG2 DB 10,13,"ENTER SECOND NUMBER = $"
MSG3 DB 10,13,"WHAT DO YOU WANT TO DO? CHOOSE ONE (+, -, *, /, %) = $" 
MSG4 DB 10,13,"THE RESULT IS = $"
MSG5 DB 10,13,"INVALID FIRST INPUT. ENTER WITHIN (1- 9)$" 
MSG6 DB 10,13,"INVALID SECOND INPUT. ENTER WITHIN (1- 9)$"
MSG7 DB 10,13,"FIRST INPUT SHOULD BE GREATER.$"

TEMP DB ? 
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    OUTER:  
    FIRST_INPUT:  
    LEA DX, MSG1
    MOV AH,9       ; FIRST INPUT MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO BH
    SUB AL,48
    MOV BH,AL
        
    IS_EQUAL_MORE1:
    CMP BH,0            ; CHECKING VALID NUMBER 
    JGE IS_EQUAL_LESS1
    
    IS_EQUAL_LESS1:     
    CMP BH,9        
    JG INVALID_INPUT1
    
    JMP SECOND_INPUT   
    
    SECOND_INPUT:
    LEA DX, MSG2   ; SECOND INPUT MESSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO BL
    SUB AL,48
    MOV BL,AL  
    
    IS_EQUAL_MORE2:
    CMP BL,0       ; CHECKING VALID NUMBER 
    JGE IS_EQUAL_LESS2
    
    IS_EQUAL_LESS2:     
    CMP BL,9
    JG INVALID_INPUT2   
    
    
    
    JLE CALCULATION    
        
        
    
    CALCULATION:
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
    CMP BH,BL
    JL INVALID_MESSAGE
    
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
    CMP BH,BL
    JL INVALID_MESSAGE
     
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
    LEA DX, MSG4                     ; RESULT MESSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    JMP FIRST_INPUT
    
    INVALID_INPUT1:
    LEA DX, MSG5                     ; FIRST INPUT INVALID MESSAGE
    MOV AH,9
    INT 21H  
    JMP FIRST_INPUT
    
    INVALID_INPUT2:
    LEA DX, MSG6                     ; SECOND INPUT INVALID MESSAGE
    MOV AH,9
    INT 21H  
    JMP SECOND_INPUT 
    
    
    INVALID_MESSAGE:
    LEA DX, MSG7                     ; FIRST INPUT SHOULD BE GREATER MESSAGE
    MOV AH,9
    INT 21H  
    JMP FIRST_INPUT      
    
    LOOP OUTER 
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
