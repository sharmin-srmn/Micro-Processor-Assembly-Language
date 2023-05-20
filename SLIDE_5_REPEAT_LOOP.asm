.MODEL SMALL
.STACK 100H
.DATA  
MSG1 DB "HOW MANY TIME WNAT TO EXECUTE THE LOOP ? = $"

NUM1 DW ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV BL,AL
    
    MOV AH,2
    MOV DL,0
     
    
    REPEAT:
    INT 21H
    CMP BL,0
    INC DL
    DEC BL
    JNE REPEAT
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
     
     
