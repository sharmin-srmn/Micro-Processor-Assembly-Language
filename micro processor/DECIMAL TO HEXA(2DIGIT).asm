.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER THE DECIMAL VALUE = $"
MSG2 DB 10,13,"HEXA VALUE OF "
TEMP1 DB ?
TEMP2 DB ?
MSG4 DB " IS = "
MSG5 DB "$"
MSG3 DB 10,13,"DO YOU WANT TO CHECK AGAIN ?(Y/N) = $"  

HEXA DB 16
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
    
    DIV HEXA
    MOV BL,AH    
    DIV HEXA
    MOV BH,AH
    
    FOR_BH:
    CMP BH,TEN
    JL L1    
    CMP BH,TEN
    JGE L2    
    L1:
    ADD BH,48
    JMP FOR_BL 
    
    L2:
    ADD BH,55
    JMP FOR_BL
    
    
    FOR_BL:
    CMP BL,TEN
    JL L3    
    CMP BL,TEN
    JGE L4    
    L3:
    ADD BL,48
    JMP SHOW    
    L4:
    ADD BL,55
    JMP SHOW
    
    
    
    
    SHOW:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
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