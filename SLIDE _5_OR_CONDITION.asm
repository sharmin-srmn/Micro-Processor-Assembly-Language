.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "ENTER ANY CHARACTER BETWEEN ( A TO Z ) = $ "
MSG2 DB 10,13,"WRONG INPUT ONLY (A-Z) NOT (a -z)  $ "
MSG3 DB "AX IS GREATER THAN ZERO. SO BX UPDATED WITH (1)= $ "
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
    MOV BL,AL 
              
    CMP BL ,'y'
    JE CHARACTER
    
    CMP BL ,'Y'
    JE CHARACTER 
       LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    JMP EXIT
    
    CHARACTER:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    MOV DL,BL
    INT 21H
    JMP EXIT       
    
    EXIT:             
 
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN