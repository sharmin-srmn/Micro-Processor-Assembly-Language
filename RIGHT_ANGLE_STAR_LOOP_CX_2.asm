INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA 

NUM1 DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV NUM1,AL 
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV CX,0
    MOV BL,NUM1
    OUTER_LOOP:
    
    MOV CX,BX
        INNER_LOOP:
        CMP BL,0
        JE EXIT
        
        MOV AH,2
        MOV DL, "*"
        INT 21H
             
        LOOP INNER_LOOP
        DEC BL
        
        MOV DL,10
        INT 21H
        MOV DL,13
        INT 21H
    LOOP OUTER_LOOP     
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN