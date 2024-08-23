INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
 
MSG1 DW "ENTER FISRT NUMBER = $" 
MSG2 DW "ENTER SECOND NUMBER = $"
MSG3 DW "THE QUOTIENT IS = $" 

VAR1 DB ?
 

.CODE    


MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX           ; DATA INITIALIZATION
    
    LEA DX,MSG1
    MOV AH,9            ; FIRST NUMBER MESSAGE
    INT 21H
    
    MOV AH,1  
    INT 21H
    SUB AL,48           ; TAKING INPUT OF FIRST NUMBER 
    MOV VAR1,AL
    
    ;PRINTN ""
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    LEA DX,MSG2
    MOV AH,9            ; SECOND NUMBER MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H              ; TAKING INPUT OF SECOND NUMBER
    SUB AL,48
    
    MOV BL,AL
    MOV AX,0
    MOV AL,VAR1   
    DIV BL
    MOV AH,0    
    MOV BX,AX
   
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    LEA DX,MSG3
    MOV AH,9       ; OUTPUT  MESSAGE
    INT 21H
    
    MOV AH,2
    ADD BH,48   
    MOV DL,BH
    INT 21H
    
    
    MOV AH,2
    ADD BL,48   
    MOV DL,BL
    INT 21H   
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN