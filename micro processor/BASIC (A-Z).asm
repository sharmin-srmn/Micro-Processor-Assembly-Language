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
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    PRINTN ""
    
    CMP BL,'A'
    JGE LEVEL1
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    JMP EXIT    
    
    LEVEL1:
    CMP BL,'Z'
    JLE PRINT
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    JMP EXIT
    
    PRINT:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT
      
    
     
    
    
    
    EXIT:   
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 