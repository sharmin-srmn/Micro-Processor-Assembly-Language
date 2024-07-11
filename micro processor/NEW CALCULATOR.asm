.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER FIRST NUMBER = $"
MSG2 DB 10,13,"ENTER SECOND NUMBER = $"
MSG3 DB 10,13,"WHAT DO YOU WANT TO DO? CHOOSE ONE (+, -, *, /, %) = $" 
MSG4 DB 10,13,"THE RESULT IS = $"  

TEMP1 DB ?
TEMP2 DB ?
TEN DB 10

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    OUTER:    
    LEA DX, MSG1
    MOV AH,9       ; FIRST INPUT MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO BH & BL
    SUB AL,48
    MOV BH,AL     
    INT 21H
    SUB AL,48
    MOV BL,AL
    
    LEA DX, MSG2   ; SECOND INPUT MESSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO CH & CL
    SUB AL,48
    MOV CH,AL
    INT 21H
    SUB AL,48
    MOV CL,AL
    
    
    
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
    ADD BL,CL
    MOV AX,0
    MOV AL,BL
    AAA
    MOV CL,AL
    MOV BL,AH
    
    ADD BL,BH
    ADD BL,CH
    
    MOV AX,0
    MOV AL,BL
    AAA
    MOV BX,AX        
    JMP SHOW
    
    SUBSTRACTION:
    CMP BL,CL       
    JG L1           ; BL GREATER THAN CL
                    
    CMP BL,CL
    JL L3           ; BL LESS THAN CL
    
    L1:
    CMP BH,CH
    JG L2
    ADD CL,10
    SUB CL,BL
    ADD BH,1
    SUB CH,BH
    MOV BL,CH
    MOV BH,0
    SUB BH,3        
    JMP SHOW
    
    
    L2:
    SUB BL,CL
    MOV CL,BL
    SUB BH,CH
    MOV BL,BH
    MOV BH,0
    JMP SHOW       
    
    
    L3:
    CMP BH,CH
    JL L4
    ADD BL,10
    SUB BL,CL
    MOV CL,BL
    ADD CH,1
    SUB BH,CH
    MOV BL,BH
    MOV BH,0        
    JMP SHOW
    
    L4:
    SUB CL,BL
    SUB CH,BH
    MOV BL,CH
    MOV BH,0
    SUB BH,3
    JMP SHOW
    
    
     
    
    MULTIPLICATION:
    MOV AX,0  
    MOV AL,BL
    MUL CL
    AAM
    MOV TEMP1, AL
    MOV TEMP2,AH
    MOV AL, BH
    MUL CL
    ADD TEMP2,AL
    MOV AL,BL
    MUL CH
    ADD AL,TEMP2
    AAA
    MOV TEMP2,AL
    MOV AL,BH
    MUL CH
    AAA
    MOV CL,TEMP1
    MOV BL,TEMP2
    MOV BH,AL       
    JMP SHOW
     
    
    DIVISION:
    MOV AX,0
    MOV AL,CH
    MUL TEN
    ADD CL,AL
     
    MOV AL,BH
    MUL TEN
    ADD AL,BL
    DIV CL
    MOV CL,AL
    MOV BL,0
    MOV BH,0       
    JMP SHOW
    
    MODULUS:
    MOV AX,0
    MOV AL,CH
    MUL TEN
    ADD CL,AL
     
    MOV AL,BH
    MUL TEN
    ADD AL,BL
    DIV CL
    MOV BL,AH
    MOV AX,0
    
    MOV CL,BL
    MOV BL,0
    MOV BH,0    
    JMP SHOW
    
    SHOW:
    LEA DX, MSG4   ; RESULT MESSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    ADD DL,48
    INT 21H
    MOV DL,BL
    ADD DL,48
    INT 21H 
    MOV DL,CL 
    ADD DL,48
    INT 21H
    JE EXIT
    
    LOOP OUTER  
    
         
    
    
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN