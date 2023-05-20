.MODEL SMALL
.STACK 100H
.DATA  
MSG1 DB "HOW MANY TIME WNAT TO EXECUTE THE LOOP ? = $"

NUM1 DW ?
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
   
   MOV CX,0
   MOV AH,2
   MOV DL,"*"
   JCXZ EXIT
   TOP:
   INT 21H
   LOOP TOP
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
     
     
