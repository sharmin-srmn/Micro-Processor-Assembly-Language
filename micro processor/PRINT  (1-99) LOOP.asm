.MODEL SMALL
.STACK 100H
.DATA
MSG DB "LOOP 1- 99 :$"
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H             ;NEW LINE
    MOV DL,13
    INT 21H  
    
    MOV BH,'0'
    MOV BL,'0'
    
    MOV CX,99
                                              
    
    LEVEL1:
    MOV AH,2
    MOV DL,BH           ;Print: BL and BH
    INT 21H                          
    MOV DL,BL
    INT 21H 
                                     ;Con: BL = '9' then level 2
    INC BL 
    CMP BL,58 
    JE  LEVEL2  
    
    MOV AH,2
    MOV DL,10                        ;New Line
    INT 21H
    MOV DL,13
    INT 21H
      
    LOOP LEVEL1                                 
    
    LEVEL2:
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    INC BH 
    CMP BH,58                         ; INCREASE BH then go lev1
    JE  EXIT 
    MOV BL,48       
    JMP LEVEL1
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN     

