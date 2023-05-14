INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA  
EQUMSG DW "CALCULATE THE EQUATION= A + 4B -C $"
MSG1 DW "ENTER THE VALUE OF A = $"
MSG2 DW "ENTER THE VALUE OF B = $"
MSG3 DW "ENTER THE VALUE OF C = $"  

.CODE   
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,EQUMSG
    MOV AH,9
    INT 21H
    
    PRINTN ""
    PRINTN ""
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    SUB BL,48
    
    PRINTN ""
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV BH,4
    
    MOV AH,1
    INT 21H 
    SUB AL,48
    
    MUL BH
    MOV BH,AL
    
    PRINTN ""
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    SUB CL,48  
    
    PRINTN ""
    
    ADD BL,BH
    SUB BL,CL
    ADD BL,48
    MOV AH,2 
    MOV DL,BL
    INT 21H
    
        
    
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 