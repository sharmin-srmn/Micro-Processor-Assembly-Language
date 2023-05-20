.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "AX IS LESS THAN ZERO. SO BX UPDATED WITH (-1) =  $ "
MSG2 DB "AX IS EQUAL TO ZERO. SO BX UPDATED WITH (0) =  $ "
MSG3 DB "AX IS GREATER THAN ZERO. SO BX UPDATED WITH (1)= $ "
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AX,0
    CMP AX,0
    JL NEGATIVE
    JE ZERO
    JG POSITIVE
    
    
    NEGATIVE:
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    MOV AH,2
    MOV BX,1
    NEG BX
    MOV DX,BX
    INT 21H
    JMP EXIT
    
    ZERO:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV BX,0
    ADD BX,48
    MOV DX,BX
    INT 21H
    JMP EXIT
    
    POSITIVE:
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV BX,1
    ADD BX,48
    MOV DX,BX
    INT 21H
    JMP EXIT        
               
               
       
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN