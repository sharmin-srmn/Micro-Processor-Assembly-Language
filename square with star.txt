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
    
    MOV CX ,0
    MOV CL, AL 
    
    MOV BX,0
    MOV BL,AL
    
    MOV VAR, AL
    
    PRINTN "" 
    
    TOP:
     MOV AH,2
     MOV DL,"*"
     INT 21H
     
     DEC BL 
     CMP BL,0
     JE EXIT
     JMP TOP
    
    
    EXIT:
    PRINTN ""
    
    MOV BL,VAR 
    LOOP TOP 
    
    
       
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN 