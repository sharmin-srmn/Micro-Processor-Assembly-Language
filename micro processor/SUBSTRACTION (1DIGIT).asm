INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DW "ENTER FIRST NUMBER = $" 
MSG2 DW "ENTER SECOND NUMBER = $" 
MSG3 DW "THE SUBSTRACTION RESULT IS = $"
MSG4 DW "FIRST INPUT SHOULD BE GREATER.$"
MSG5 DW "INVALID INPUT. ENTER NUMBER BETWEEN (0-9).$" 

.CODE

MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX    
    
    OUTER:    
    FIRST_INPUT:     
    LEA DX, MSG1  ; FIRST NUMBER MEASSAGE
    MOV AH,9
    INT 21H     
       
    MOV AH,1      ; TAKING FIRST NUMBER INPUT
    INT 21H
    SUB AL,48
    MOV BL,AL 
    
    MOV AH,2
    MOV DL,10
    INT 21H        ;NEW LINE
    MOV DL,13
    INT 21H     
    
    CMP BL,0
    JGE CHECK_LESS1
    
    CHECK_LESS1:
    CMP BL,9
    JLE SECOND_INPUT    
    
    JMP INVALID1
    
    SECOND_INPUT:    
    LEA DX, MSG2
    MOV AH,9        ; SECOND NUMBER MEASSAGE
    INT 21H
    
    MOV AH,1 
    INT 21H 
    SUB AL,48        ; TAKING SECOND NUMBER INPUT
    MOV CL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H        ;NEW LINE
    MOV DL,13
    INT 21H   
    
    CMP CL,0
    JGE CHECK_LESS2
    
    CHECK_LESS2:
    CMP CL,9
    JLE SUBSTRACTION
    
    JMP INVALID2        
    
    SUBSTRACTION:    
    CMP BL,CL
    JL INVALID       
    
    SUB BL,CL      ; SUBSTRACTION OPERATION
    ADD BL,48
    
    MOV AH,2
    MOV DL,10
    INT 21H        ;NEW LINE
    MOV DL,13
    INT 21H
    JMP SHOW 

    SHOW:
    LEA DX, MSG3
    MOV AH,9        ; RESULT MEASSAGE
    INT 21H
    
    MOV AH,2
    MOV BH,0
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H   
    
    
    MOV DL,10
    INT 21H        ;NEW LINE
    MOV DL,13
    INT 21H 
    
    JMP OUTER
    
    
    INVALID1:    
    LEA DX, MSG5                     ; ENTER DIGIT MESSAGE FOR FIRST INPUT
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H        ;NEW LINE
    MOV DL,13
    INT 21H
      
    JMP FIRST_INPUT 
    
    
    INVALID2:    
    LEA DX, MSG5                     ; ENTER DIGIT MESSAGE FOR DECOND INPUT
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H        ;NEW LINE
    MOV DL,13
    INT 21H
      
    JMP SECOND_INPUT 

    INVALID:   
    LEA DX, MSG4                     ; FIRST INPUT SHOULD BE GREATER MESSAGE
    MOV AH,9
    INT 21H  
    JMP EXIT  
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
