;LEFT SIDED UPSIDE DOWN RIGHT ANGLE WITH SPACE USING OUTER STAR_PRINT
.MODEL SMALL
.STACK 100H
.DATA
MSG1 DB "HOW MANY LOOP DO YOU WANT TO ITERATE ? = $"
MSG2 DB "END LOOP.$"
STAR DB ?

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
    MOV CX,0
    MOV CL,AL
    MOV STAR,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H 
    MOV DL,10
    INT 21H
    MOV DL, 13
    INT 21H
    
    OUTER:     
    MOV BL,CL
    MOV CL, STAR
    
    STAR_PRINT:
    MOV AH,2
    MOV DL,"*"
    INT 21H 
    MOV DL," "
    INT 21H
    LOOP STAR_PRINT  
    DEC STAR    
   
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV CL,BL    
    LOOP OUTER
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    LEA DX, MSG2
    MOV AH,9
    INT 21H   
     
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
