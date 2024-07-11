.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "HOW MANY TIME YOU WANT TO ITERATE THE LOOP? = $"
MSG2 DB 10,13,"LOOP END.$" 
NUM DB ?
.CODE 
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H   
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV CX, 0
    MOV NUM,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    MOV BH,1
    OUTER:    
    CMP BH,NUM
    JG OUTER_EXIT
    
    MOV BL,1
        
    INNER:
    CMP BL,NUM
    JG INNER_EXIT
    
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
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    
     
    
    
    
    
    
    
    
    EXIT: 
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN