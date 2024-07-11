INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
 
MSG1 DW "ENTER 4 LOWER CAHARACTERS = $"
MSG4 DW "THE UPPER CASE OF THE CHARACTERS = $"

.CODE    


MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX      ; DATA INITIALIZATION
    
    LEA DX,MSG1
    MOV AH,9       ; FIRST MESSAGE
    INT 21H
    
    MOV AH,1  
    INT 21H        ; TAKING INPUT OF FIRST NUMBER 
    MOV BL,AL
    SUB BL,32
    INT 21H
    MOV BH,AL
    SUB BH,32
    INT 21H
    MOV CL,AL
    SUB CL,32
    INT 21H
    MOV CH,AL
    SUB CH,32     
    
   
    
    PRINTN ""
    
    LEA DX,MSG4
    MOV AH,9
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    MOV DL,BH
    INT 21H
    MOV DL,CL
    INT 21H
    MOV DL,CH
    INT 21H
    
    
    
    
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
