.MODEL SMALL
.STACK 100H
.DATA 
MSG1 DB "HOW MANY LOOP DO YOU WANT TO ITERATE ? = $"
MSG2 DB 10,13,"LOOP END.$"
SPACE DB 17
STAR DB 1

.CODE
MAIN PROC  
    
    MOV AX,@DATA
    MOV DS, AX
    
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    
    MOV CX,0  
    MOV CL,AL
    
    MOV AH,2    
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
    MOV DL,10
    INT 21H
    
    OUTER:
    MOV BL,CL
    
    MOV CL,SPACE
    
    SPACE_PRINT:
    MOV AH,2
    MOV DL," "
    INT 21H
    
    LOOP SPACE_PRINT 
    
    DEC SPACE 
    DEC SPACE   
    MOV CL,STAR
    
    STAR_PRINT:
    MOV AH,2
    MOV DL,"*"
    INT 21H
    MOV DL," "
    INT 21H
     
     
    
    LOOP STAR_PRINT
    
    INC STAR
    INC STAR
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV CL,BL   
    
    LOOP OUTER 
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN