INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
 
MSG1 DW "ENTER FISRT NUMBER = $" 
MSG2 DW "ENTER SECOND NUMBER = $"
MSG3 DW "THE PRODUCT IS = $" 

VAR1 DB ?
VAR2 DB ? 

.CODE    


MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX      ; DATA INITIALIZATION
    
    LEA DX,MSG1
    MOV AH,9       ; FIRST NUMBER MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO BH & BL
    SUB AL,48
    MOV BH,AL     
    INT 21H
    SUB AL,48
    MOV BL,AL
    
    ;PRINTN ""
    MOV AH,2
    MOV DL,10      ; NEW LINE  
    INT 21H
    MOV DL,13
    INT 21H  
    
    LEA DX,MSG2
    MOV AH,9       ; SECOND NUMBER MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H        ; TAKING INPUT AND MOVING TO CH & CL
    SUB AL,48
    MOV CH,AL
    INT 21H
    SUB AL,48
    MOV CL,AL
    
    ;GUN SURU HOBW 
    MOV AL, BL
    MUL CL
    AAM   
    MOV VAR1, AH
    MOV VAR2, AL
    
    
    MOV AL, BH
    MUL CL
    AAM 
    
    MOV CL, AH
    MOV AH, 0
    ADD AL, VAR1
    AAA
    MOV VAR1, AL
    ADD CL, AH
            
    ;2ND DIGIT GUN SHURU
    MOV AX, 0
    MOV AL, BL
    MUL CH
    AAM
    MOV BL, AH
    MOV AH,0
    ADD AL, VAR1
    AAA
    
    MOV VAR1, AL
    ADD BL,AH
    MOV AX, 0
    MOV AL, BH
    MUL CH
    AAM
    
    MOV BH, AH
    MOV AH, 0
    ADD AL, BL
    AAA
    ADD BH, AH
    MOV AH, 0
    ADD AL, CL
    AAA
    MOV CL, AL
    MOV AL, BH
    ADD AL,AH
    AAA
    MOV CH, AL      
    
    ;PRINTN ""
    MOV AH,2
    MOV DL,10      ; NEW LINE  
    INT 21H
    MOV DL,13
    INT 21H
    
        
    LEA DX,MSG3
    MOV AH,9       ; OUTPUT  MESSAGE
    INT 21H
    
    MOV AH,2
    ADD CH,48   
    MOV DL,CH
    INT 21H
    
    
    MOV AH,2
    ADD CL,48   
    MOV DL,CL
    INT 21H
    
    MOV AH,2
    ADD VAR1,48   
    MOV DL,VAR1
    INT 21H
    
    MOV AH,2
    ADD VAR2,48   
    MOV DL,VAR2
    INT 21H
        
   

    
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN