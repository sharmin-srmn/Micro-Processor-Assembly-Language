.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC
    
    ;USING JUMP IF NOT ZERO STATEMENT
    MOV AH,2
    MOV DL,0    
    PRINT_LOOP:
    
    INT 21H
    INC DL
    JNZ PRINT_LOOP 
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    
    ;USING LOOP
    MOV CX,256
    MOV AH,2
    
    MOV DL,0
    TOP1:
    INT 21H
    INC DL
    LOOP TOP1
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
     
    
    
    ; USING JMP AND JNZ STATEMENT
    MOV CX,5
    MOV AH,2
    
    MOV DL,0
    TOP:
    INT 21H
    INC DL
    DEC CX
    JNZ BOTTOM
    JMP EXIT
    
    BOTTOM:
    JMP TOP 
    
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN