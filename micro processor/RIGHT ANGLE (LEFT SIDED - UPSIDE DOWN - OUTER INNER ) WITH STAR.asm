 ; LEFT SIDED UPSIDE DOWN RIGHT ANGLE WITH SPACE USING INNER OUTER
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
    
    MOV BH,NUM1
    OUTER:
    CMP BH,1
    JL OUTER_EXIT
    
    MOV BL,BH
    INNER:
    CMP BL,1
    JL INNER_EXIT 
    
    MOV AH,2
    MOV DL,"*"
    INT 21H 
    MOV DL, " "
    INT 21H
    
    DEC BL
    LOOP INNER
    
    INNER_EXIT:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    DEC BH
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
