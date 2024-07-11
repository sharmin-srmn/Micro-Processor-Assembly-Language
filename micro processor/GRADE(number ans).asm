.MODEL SMALL
.STACK 100H
.DATA 

MSG1 DB "ENTER THE STUDENT'S ROLL = $"
MSG2 DB 10,13,"ENTER THE GRADE OF 1ST SUB (A, B, C, D) = $"
MSG3 DB 10,13,"ENTER THE GRADE OF 2ND SUB (A, B, C, D) = $"
MSG4 DB 10,13,"ENTER THE GRADE OF 3RD SUB (A, B, C, D) = $"
MSG5 DB 10,13,"ENTER THE GRADE OF 4TH SUB (A, B, C, D) = $"
MSG6 DB 10,13,"INVALID INPUT $"  
MSG7 DB 10,13,"YOUR RESULT IS =  $"
.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
               
    
    
    
    LEVEL1:
    LEA DX,MSG2
    MOV AH,9    ; PRINTING FIRST INPUT MSG
    INT 21H
    
    MOV AH,1
    INT 21H     ; TAKING INPUT
    
    SUB AL,64   ;
    MOV BL,AL
  
    LEA DX,MSG3
    MOV AH,9    ; PRINTING SECOND INPUT MSG
    INT 21H
    
    MOV AH,1    ; TAKING INPUT
    INT 21H 
    
    SUB AL,64
    ADD BL,AL 
    
    LEA DX,MSG4
    MOV AH,9    ; PRINTING THIRD INPUT MSG
    INT 21H
    
    MOV AH,1    ; TAKING INPUT
    INT 21H 
    
    SUB AL,64
    ADD BL,AL  
    
    LEA DX,MSG5
    MOV AH,9    ; PRINTING FOURTH INPUT MSG
    INT 21H
    
    MOV AH,1    ; TAKING INPUT
    INT 21H 
    
    SUB AL,64
    ADD BL,AL
    
    MOV AL,BL
    MOV BH,4
    DIV BH 
    MOV BL,AL
    
    LEA DX,MSG7
    MOV AH,9    ; PRINTING RESULT INPUT MSG
    INT 21H
    
    MOV AH,2 
    SUB BL,16   ; 
    MOV DL,BL
    INT 21H 
    
    
    
    INVALID:
    LEA DX,MSG6
    MOV AH,9     ; PRINTING THIRD INPUT MSG
    INT 21H
    JMP EXIT    
    
    EXIT:    
    MOV AH,4CH
    INT 21H
  
    
    
    
    
    MAIN ENDP
END MAIN