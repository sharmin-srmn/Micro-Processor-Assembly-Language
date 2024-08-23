;LEFT SIDED UPSIDE DOWN RIGHT ANGLE WITH SPACE USING INNER OUTER
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
    
    LEA DX,MSG1  ;PRINTING MSG
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,48
    MOV NUM1,AL
    
    PRINTN 
    
    MOV BH,NUM1             ;3
    OUTER_LOOP:             ;3>1
    CMP BH,1
    JL OUTER_LOOP_EXIT
        MOV BL,BH         ;BL-3
        INNER_LOOP:
        CMP BL,0
        JE INNER_LOOP_EXIT
        
        MOV AH,2
        MOV DL, "*"
        INT 21H
        PRINT " "
        
        DEC BL
        LOOP iNNER_LOOP
        
        INNER_LOOP_EXIT:
        PRINTN        
    
    DEC BH
    LOOP OUTER_LOOP
    
    OUTER_LOOP_EXIT:
    PRINT 
    
     
    
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
