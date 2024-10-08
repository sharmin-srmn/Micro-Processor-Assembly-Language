INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
 
MSG1 DW "ENTER FISRT NUMBER/CHARACTER = $" 
MSG2 DW "ENTER SECOND NUMBER/CHARACTER  = $"
MSG3 DW "ENTER THIRD NUMBER/CHARACTER  = $"
MSG4 DW "THE GREATER VALUE IS = $"

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX      ; DATA INITIALIZATION
    
    LEA DX,MSG1
    MOV AH,9       ; FIRST NUMBER MESSAGE
    INT 21H
    
    MOV AH,1  
    INT 21H        ; TAKING INPUT OF FIRST NUMBER 
    MOV BL,AL
    
    PRINTN "" 
    
    LEA DX,MSG2
    MOV AH,9       ; SECOND NUMBER MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H     
    MOV BH, AL   ; TAKING INPUT OF SECOND NUMBER
        
    PRINTN ""
    
    
    LEA DX,MSG3
    MOV AH,9       ; SECOND NUMBER MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H     
    MOV CL, AL   ; TAKING INPUT OF THIRD NUMBER
        
    PRINTN "" 
    
    CMP BL,BH    
    JG LEVEL1
    
    CMP BH,CL
    JG LEVEL3
   
    LEA DX,MSG4
    MOV AH,9       ; FIRST NUMBER MESSAGE
    INT 21H
    
    MOV AH,2
    MOV DL,CL 
    INT 21H    
    JMP EXIT           
           
    LEVEL1:
    CMP BL,CL
    JG LEVEL2
    
    LEA DX,MSG4
    MOV AH,9       ; FIRST NUMBER MESSAGE
    INT 21H
    
    MOV AH,2
    MOV DL,CL 
    INT 21H
    JMP EXIT    
    
    LEVEL2:     
    LEA DX,MSG4
    MOV AH,9       ; FIRST NUMBER MESSAGE
    INT 21H
    
    MOV AH,2
    MOV DL,BL 
    INT 21H 
    JMP EXIT 
    
    LEVEL3:
    LEA DX,MSG4
    MOV AH,9       ; FIRST NUMBER MESSAGE
    INT 21H
    
    MOV AH,2
    MOV DL,BH 
    INT 21H 
    JMP EXIT
    
           
           
    
    
  
    
    

   

    
    
    EXIT:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
