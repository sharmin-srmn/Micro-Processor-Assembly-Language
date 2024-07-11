INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA  

MSG1 DW "ENTER ANY CHARACTER ( A-Z ) =  $"
MSG2 DW "YOU HAVE ENTERED = $" 
MSG3 DW "YOU HAVE ENTERED INVALID INPUT $" 

.CODE   
MAIN PROC
    
    MOV AX,@DATA
    MOV DS, AX
    
    MOV CX,5
    
    MOV AH,2
    MOV DL, '*'
    
    LEVEL:
    INT 21H
    
    LOOP LEVEL
    
   
    
    
    EXIT:   
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 