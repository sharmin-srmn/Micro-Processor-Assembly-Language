.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "ENTER ANY DIGIT = $ "
MSG2 DB "WRONG INPUT =  $ "
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
    SUB AL,48
    MOV NUM1,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    CMP NUM1,1
    JE LEVEL1 
    
    CMP NUM1,2
    JE LEVEL2
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    JMP EXIT 
    
    
    LEVEL1:
    CMP NUM1,3
    JE ODD
    
    ODD:   
    MOV AH,2
    MOV DL,'O'
    INT 21H
    JMP EXIT
    
      
    LEVEL2:
    CMP NUM1,4
    JE EVEN
    
    EVEN:   
    MOV AH,2
    MOV DL,'E'
    INT 21H
    JMP EXIT
       
            
            
       
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN