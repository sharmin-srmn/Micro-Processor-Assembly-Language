.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER THE OCTAL VALUE = $"
MSG2 DB 10,13,"DECIMAL VALUE OF "
TEMP1 DB ?
TEMP2 DB ?
MSG4 DB " IS = "
MSG5 DB "$"
MSG3 DB 10,13,"DO YOU WANT TO CHECK AGAIN ?(Y/N) = $"  
MSG6 DB 10,13,"INVALID INPUT.$"

NASCII DB ?
OCT DB 8
ONE DB 1


.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    OUTER:    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    MOV NASCII,48    
    
    MOV AH,1
    INT 21H
    MOV TEMP1,AL
    
    MOV CX,0    
    MOV CL,8
    
    FOR_DIGIT1:    
    CMP AL,NASCII
    JE L1
    INC NASCII       
    LOOP FOR_DIGIT1      
    JMP INVALID
    
    L1:    
    SUB AL,48
    MOV BL,AL    
    JMP SECOND_DIGIT                      
     
    
    SECOND_DIGIT:
    MOV NASCII, 48
        
    INT 21H 
    MOV TEMP2,AL
    
    MOV CX,0    
    MOV CL,10
    
    FOR_DIGIT2:    
    CMP AL,NASCII
    JE L3
    INC NASCII   
    LOOP FOR_DIGIT2
    JMP INVALID 
    
    
    L3:    
    SUB AL,48
    MOV CL,AL    
    JMP CALCULATION
    
    CALCULATION:
    MOV AX,0
    MOV AL,BL
    MUL OCT
    AAM
    MOV BX,AX
    
    MOV AL,CL                   ; CONVERTING IN DECIMAL
    MUL ONE
    AAM
    MOV CX,0
    MOV CX,AX
    MOV AX,0
    
    ADD BL,CL       ; ADDITION
    MOV AL,BL
    AAA
    MOV CL,AL       ;LAST DIGIT
    MOV BL,AH 
    MOV AX,0                  
    
    ADD BH,BL
    ADD BH,CH
    MOV AL, BH
    AAA
    MOV BL,AL
    MOV BH,AH
    
    
   
    
    SHOW:
    LEA DX, MSG2
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
    JMP YES_NO
    
    YES_NO:
    LEA DX, MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL, 'Y'
    JE OUTER
    CMP AL,'y'
    JE OUTER
    JMP EXIT 
    
    INVALID:
    LEA DX, MSG6
    MOV AH,9
    INT 21H 
    JMP YES_NO  
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN