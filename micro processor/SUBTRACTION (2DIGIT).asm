INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DW "ENTER FIRST NUMBER = $" 
MSG2 DW "ENTER SECOND NUMBER = $" 
MSG3 DW "THE SUBSTRACTION RESULT IS = $" 

.CODE

MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, MSG1  ; FIRST NUMBER MEASSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV BL,AL
    INT 21H       ; TAKING FIRST NUMBER INPUT
    MOV BH,AL
    
    PRINTN ""
    
    
    LEA DX, MSG2
    MOV AH,9        ; SECOND NUMBER MEASSAGE
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV CL,AL
    INT 21H         ; TAKING SECOND NUMBER INPUT
    MOV CH,AL 
    
    SUB BH,CH
    ADD BH,48
    
    SUB BL,CL
    ADD BL,48
    
    
    PRINTN ""
    
    LEA DX, MSG3
    MOV AH,9        ; THIRD NUMBER MEASSAGE
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    MOV DL,BH
    INT 21H
    
    
    
        
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN