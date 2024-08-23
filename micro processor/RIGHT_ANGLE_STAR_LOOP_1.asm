;LEFT SIDED RIGHT ANGLE WITH SPACE USING INNER OUTER 
INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA

MSG1 DB 10,13,"ENTER THE NUMBER BETWEEN 1 - 9 = $"
NUM1 DB ?
.CODE
MAIN PROC   
    
    MOV AX,@DATA
    MOV DS, AX
    
    LEA DX,MSG1
    MOV AH,9          ;PRINTNG MSG
    INT 21H
    
    MOV AH,1          ;TAKING INPUT
    INT 21H    
    
    SUB AL,48         ;MOVING IN NUM1
    MOV NUM1,AL
    
    MOV AH,2 
    MOV DL,10
    INT 21H
    MOV DL,13         ;PRINTING NEW LINE
    INT 21H
    
    MOV BH,1
    
    OUTER_LOOP:
    CMP BH,NUM1
    JG OUTER_LOOP_EXIT
        MOV BL,0
        INNER_LOOP:
        CMP BL,BH
        JE INNER_LOOP_EXIT
        
        MOV AH,2
        MOV DL, "*"
        INT 21H
        PRINT " "
        
        INC BL
        LOOP INNER_LOOP
        
        INNER_LOOP_EXIT:
        PRINTN        
    
    INC BH
    LOOP OUTER_LOOP
    
    OUTER_LOOP_EXIT:
    PRINT
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
