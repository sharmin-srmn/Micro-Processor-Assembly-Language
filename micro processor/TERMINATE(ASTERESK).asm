INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA  

MSG1 DW "ENTER Y or y =  $"
MSG2 DW "YOU HAVE ENTERED = $" 
MSG3 DW "YOU HAVE INVALID INPUT $" 

.CODE   
MAIN PROC 
    
    LEVEL:
    MOV AH,1
    INT 21H 
    MOV BL,AL
    
    CMP BL, '*'
    JE EXIT
    
    JMP LEVEL  
    
    
    
    EXIT:   
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 