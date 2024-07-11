.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER THE HEXA NUMBER = $"
MSG2 DB 10,13,"DECIMAL VALUE OF = $"
MSG3 DB 10,13,"INVALID INPUT .$"
MSG4 DB 10,13,"DO YOU WANT TO CHECK AGAIN ? (Y/N) = $"

NUMASCII DB ?
LETTERASCII DB ?
HEXA DB 16

.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
      
    
    OUTER:
    MOV NUMASCII , 48
    MOV LETTERASCII,65
    
        
    LEA DX, MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    MOV CX,0
    MOV CL,10
    
    FOR_NUMBER:    
    CMP BL,NUMASCII
    JE SHOWNUMBER
    INC NUMASCII   
    LOOP FOR_NUMBER
    
    
    MOV CL,6    
    FOR_LETTER:    
    CMP BL,LETTERASCII
    JE SHOWLETTER
    INC LETTERASCII   
    LOOP FOR_LETTER 
    
    INVALID:
    LEA DX, MSG3
    MOV AH,9
    INT 21H
    JMP YES_NO
    
    SHOWNUMBER:
    LEA DX, MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,2    
    MOV DL,48
    INT 21H
    
    MOV DL,BL
    INT 21H
    JMP YES_NO 
    
    SHOWLETTER:
    SUB BL,17
   
    
    LEA DX, MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,2    
    MOV DL,049
    INT 21H
    
    MOV DL,BL
    INT 21H
    JMP YES_NO
    
    
    YES_NO:
    LEA DX, MSG4
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'Y'
    JE OUTER
    
    CMP AL,'y'
    JE OUTER
    
    JMP EXIT 
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN