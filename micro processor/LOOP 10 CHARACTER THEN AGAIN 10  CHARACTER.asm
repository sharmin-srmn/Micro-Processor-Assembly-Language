.MODEL SMALL
.STACK 100H

.CODE

MAIN PROC

    MOV BL,80H
    MOV CL,0
   start:
        CMP CL,10
        JE NEWLINE
     
        INC CL
     
        MOV AH,2
        MOV DL,BL
        INT 21H
        INC BL
     
        CMP BL,0FFH
        JE END_
     
        JMP start      ;loop continue
    NEWLINE:           ;for new line
        MOV AH,2
        MOV DL,0AH
        INT 21H
        MOV DL,0DH
        INT 21H
        MOV CL,0
        JMP start     ;loop continue
    END_:
 
    MOV AH,4CH
    INT 21H
         
    MAIN ENDP
END MAIN
    
    