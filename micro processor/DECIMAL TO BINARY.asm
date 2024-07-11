.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER THE DECIMAL VALUE = $"
MSG2 DB 10,13,"BINARY VALUE OF "
TEMP1 DB ?
TEMP2 DB ?
MSG4 DB " IS = "
MSG5 DB "$"
MSG3 DB 10,13,"DO YOU WANT TO CHECK AGAIN ?(Y/N) = $"  
COUNT DB 0
BINARY DB 2
TEN DB 10  
BARRAY DB ?,?,?,?,?,?,?,? 



.CODE
MAIN PROC 
    MOV AX,@DATA        ;INITIALIZING DATA
    MOV DS,AX  
    
    OUTER:    
    LEA DX, MSG1
    MOV AH,9            ; PRINT MESSAGE
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV TEMP1,AL        ; FOR SHOWING ONLY
    
    SUB AL,48
    MOV BH,AL
    
    INT 21H
    MOV TEMP2,AL        ; FOR SHOWING ONLY 
    
    SUB AL,48
    MOV BL,AL 
    
    MOV AL,BH
    MUL TEN             ;ADDING BH,BL
    ADD AL,BL
    MOV BL,AL    
    
    
    CALCULATION:
    LEA DX,MSG2
    MOV AH,9
    INT 21H             
    MOV AX,0       
    MOV AL,BL
    MOV SI, OFFSET BARRAY
    
            
    BINARY_DIVISION:    
    DIV BINARY 
    MOV [SI],AH    
    INC SI
    INC COUNT 
    MOV AH,0    
    CMP AL, 0
    JE SHOW 
    JMP BINARY_DIVISION
    
    SHOW:  
    MOV CX,0
    MOV CL,COUNT
    SUB SI,1
    
    L1:
    MOV AH,2
    MOV DL, [SI]
    ADD DL,48 
    INT 21H
    DEC SI
    LOOP L1 
    
    
    YES_NO:
    MOV COUNT,0    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL, 'Y'
    JE OUTER
    CMP AL, 'y'
    JE OUTER
    
    JMP EXIT
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN