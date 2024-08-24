INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
 
MSG1 DW "ENTER FISRT NUMBER = $" 
MSG2 DW "ENTER SECOND NUMBER = $"
MSG3 DW "THE QUOTIENT IS = $"
MSG4 DW "AND THE REMAINDER IS = $" 

VAR1 DB ?
TEN DB 10

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
    MOV BH,AL
    INT 21H
    SUB AL,48
    MOV BL, AL
    
    
    ;PRINTN ""
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    LEA DX,MSG2
    MOV AH,9             ; SECOND NUMBER MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H              ; TAKING INPUT OF SECOND NUMBER
    SUB AL,48    
    MOV CH,AL
    INT 21H             
    SUB AL,48    
    MOV CL,AL 
    
    ;DIV SURU
               
    MOV AL, CH
    MUL TEN
    ADD AL,CL    
    MOV CL,AL
    
    MOV AL,BH
    MUL TEN
    ADD AL, BL
    
    DIV CL 
    
    
    MOV CH, AH 
    AAA 
    
    MOV BH,AL       ; ANS OF THE DIVISION
    MOV AH,0
             
             
    MOV AL,CH 
    DIV TEN
    
    MOV CH, AL
    MOV CL,AH
    
    
    
   
   
    MOV AH,2
    MOV DL,10            ; NEW LINE
    INT 21H
    MOV DL,13
    INT 21H
    
    RESULT:    
    LEA DX,MSG3
    MOV AH,9             ; OUTPUT  MESSAGE FOR QUOTIENT
    INT 21H     
    
    MOV AH,2
    ADD BH,48   
    MOV DL,BH
    INT 21H
    
    MOV AH,2
    MOV DL,10            ; NEW LINE
    INT 21H
    MOV DL,13
    INT 21H  
    
    LEA DX,MSG4
    MOV AH,9             ; OUTPUT  MESSAGE FOR REMAINDER
    INT 21H    
    
    MOV AH,2
    ADD CH,48   
    MOV DL,CH
    INT 21H
    ADD CL,48   
    MOV DL,CL
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN