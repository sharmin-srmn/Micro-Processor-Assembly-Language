.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER THE DECIMAL VALUE = $"
MSG2 DB 10,13,"OCTAL VALUE OF "
TEMP1 DB ?
TEMP2 DB ?
MSG4 DB " IS = "
MSG5 DB "$"

MSG3 DB 10,13,"DO YOU WANT TO CHECK AGAIN ?(Y/N) = $"  

OCT DB 8
TEN DB 10


.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX  
    
    OUTER:    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV TEMP1,AL
    
    SUB AL,48
    MOV BH,AL
    
    INT 21H 
    MOV TEMP2,AL 
    SUB AL,48
    MOV BL,AL
    
    
    MOV AL,BH
    MUL TEN
    ADD AL,BL 
    
    DIV OCT
    MOV BL,AH    
    DIV OCT
    MOV BH,AH
    
       
    L1:
    ADD BH,48
    L2:
    ADD BL,48
    JMP SHOW
    
    
    
    SHOW:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
     
    MOV AH,2
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV DL,BL
    INT 21H 
    
    
    JMP YES_NO
    
    YES_NO:    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL, 'Y'
    JE OUTER
    CMP AL, 'y'
    JE OUTER
    
    JMP EXIT
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN