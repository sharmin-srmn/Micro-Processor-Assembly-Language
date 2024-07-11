.MODEL SMALL
.STACK 100H
.DATA 
MSG1 DB "HOW MANY TIME DO YOU WANT TO ITTERATE THE LOOP ? = $"
MSG2 DB 10,13,"LOOP END .$"
NUM1 DB ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    MOV NUM1,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV BH,1
    OUTER:
    CMP BH,NUM1
    JG OUTER_EXIT
    
    MOV BL,0
    INNER:
    CMP BL,BH
    JE INNER_EXIT 
    
    MOV AH,2
    MOV DL,"*"
    INT 21H 
    MOV DL, " "
    INT 21H
    
    INC BL
    LOOP INNER
    
    INNER_EXIT:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    
    INC BH
    LOOP OUTER
    
    OUTER_EXIT:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN