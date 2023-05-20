.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC 
    
    MOV AL,77
    MOV BL,66
    MOV AH,2
    CMP AL,BL ;AL<=BL ?
    JNBE ELSE_
    MOV DL,AL
    INT 21H
    JMP EXIT
    ELSE_:
    MOV DL,BL
    INT 21H    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN