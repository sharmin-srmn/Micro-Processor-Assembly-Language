;RIGHT SIDED RIGHT ANGLE WITH SPACE USING OUTER STAR_PRINT
.MODEL SMALL
.STACK 100H
.DATA 

MSG1 DB "HOW MANY LOOP DO YOU WANT TO ITERATE ? = $"
MSG2 DB 10,13,"LOOP END.$"
SPACE DB 13
STAR DB 1
.CODE
MAIN PROC     
    MOV AX, @DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9         ; PRINTING MSG
    INT 21H  
    
    MOV AH,1         ; TAKING INPUT
    INT 21H
    SUB AL,48
    
    MOV CX,0
    MOV CL,AL        ; MOVING INPUT TO CL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,10        ; NEW LINE
    INT 21H
    MOV DL,13
    INT 21H 
    
    OUTER:     
    MOV BL,CL        ; STORING CL VALUE INTO BL FOR OUTER LOOP
    MOV CL,SPACE     ; HERE SPACE = 13 
        
    SPACE_PRINT:
    MOV AH,2
    MOV DL," "       ; SPACE WILL PRINT 13 TIMES
    INT 21H    
    LOOP SPACE_PRINT 
    
    DEC SPACE        ; THEN DECREASE 2 TIMES
    DEC SPACE    
    MOV CL,STAR      ; MOVING STAR = 1 TO CL FOR STAR PRINTING 
       
    STAR_PRINT:     
    MOV AH,2
    MOV DL,"*"
    INT 21H          ; PRINT * 
    MOV DL," "
    INT 21H       
    LOOP STAR_PRINT
    
    INC STAR         ; STAR = 2
    
    MOV DL,10
    INT 21H
    MOV DL,13        ; NEW LINE
    INT 21H
    
    MOV CL,BL        ; MOVING INPUT BL TO CL  
    LOOP OUTER  
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
