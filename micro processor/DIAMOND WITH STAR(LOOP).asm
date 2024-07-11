.MODEL SMALL
.STACK 100H
.DATA 
MSG1 DB "HOW MANY LOOP DO YOU WANT TO ITERATE ?= $"
MSG2 DB "LOOP END. $"
SPACE1 DB ?
STAR1 DB 1
TEMP DB ?

SPACE2 DB 1
STAR2 DB ?

.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    SUB AL,48
    MOV CX,0
    MOV CL,AL 
    MOV SPACE1, AL
    MOV TEMP, AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    OUTER1: 
    MOV BL,CL
    MOV CL,SPACE1 
    
    SPACE_PRINT1:
    MOV AH,2
    MOV DL, " "
    INT 21H    
    LOOP SPACE_PRINT1
    DEC SPACE1
    
    MOV CL,STAR1
    STAR_PRINT1:
    MOV DL, "*"
    INT 21H    
    LOOP STAR_PRINT1
    INC STAR1
    INC STAR1 
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV CL,BL 
    
    LOOP OUTER1
    
       
    MOV CL,TEMP
    MOV BL,STAR1
      
    MOV STAR2,BL
    DEC STAR2
    DEC STAR2
    
    OUTER2: 
    MOV BL,CL
    MOV CL,SPACE2 
    
    SPACE_PRINT2:
    MOV AH,2
    MOV DL, " "
    INT 21H    
    LOOP SPACE_PRINT2
    INC SPACE2
    
    MOV CL,STAR2
    STAR_PRINT2:
    MOV DL, "*"
    INT 21H    
    LOOP STAR_PRINT2
    DEC STAR2
    DEC STAR2 
    
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV CL,BL 
    
    LOOP OUTER2
    
    
    
    
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