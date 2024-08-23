;EXCHANGE INPUT 
INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H
.DATA 
MSG1 DW "ENTER THE FIRST INPUT = $"
MSG2 DW "ENTER THE SECOND INPUT = $"
MSG3 DW "AFTER SWAPPING FIRST VALUE = $"
MSG4 DW "AFTER SWAPPING SECOND VALUE = $"


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
    INT 21H
    MOV BH,AL 
    
    PRINTN ""
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    INT 21H
    MOV CH,AL
    
    XCHG BL,CL
    XCHG BH,CH
    
    PRINTN ""
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    MOV DL,BH
    INT 21H
     
    PRINTN ""
    
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    MOV DL,CH
    INT 21H
     
     
    
     
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN