;RIGHT ANGLE LEFT SIDED WITHOUT SPACE USING CX
INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA  

MSG1 DW "ENTER between ( 1 -9)=  $"
MSG2 DW "YOU HAVE ENTERED = $" 
MSG3 DW "YOU HAVE INVALID INPUT $" 
VAR DB ?


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
    
    MOV VAR,AL
    
    PRINTN ""
    
    MOV CX,0
    MOV CL,VAR
    MOV BL,1
    
    TOP:
    MOV CX,BX
    
    LEVEL1:
    CMP BL,VAR
    JG EXIT
    
    MOV AH,2
    MOV DL,"*"
    INT 21H
    
    LOOP LEVEL1
    INC BL
    
    PRINTN ""
    
    LOOP TOP
    
    
    
    
    EXIT: 
    
    
       
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 
