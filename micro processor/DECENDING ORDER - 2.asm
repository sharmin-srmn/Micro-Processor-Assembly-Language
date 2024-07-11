.MODEL SMALL
.STACK 100H
.DATA
    MSG DB "ENTER THREE CHARACTERS $"

.CODE 

MAIN PROC
    MOV AX, @DATA
    MOV DS, AX                    
 
    MOV AH, 9
    LEA DX, MSG
    INT 21H
 
    MOV AH,1
    INT 21H
    MOV BH, AL
    INT 21H
    MOV BL, AL
    INT 21H
    MOV CH, AL
    
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

COMP1:
    CMP BH, BL
    JGE COMP2
    JLE COMP4 

COMP2:
    CMP BH, CH
    JGE COMP3
    JLE PRINT

COMP3:
    CMP CH, BL
    JGE DIS1
    JLE DIS2

COMP4:
    CMP BL, CH
    JGE COMP5
    JLE DIS4

COMP5:
    CMP CH, BH
    JGE PRINT6
    JLE PRINT5

DIS1:
    MOV AH, 2
    MOV DL, BH
    INT 21H
    MOV DL, CH
    INT 21H
    MOV DL, BL
    INT 21H
    JMP EXIT

DIS2:
    MOV AH, 2
    MOV DL, BH
    INT 21H
    MOV DL, BL
    INT 21H
    MOV DL, CH
    INT 21H
    JMP EXIT

PRINT:
    MOV AH, 2
    MOV DL, CH
    INT 21H
    MOV DL, BH
    INT 21H
    MOV DL, BL
    INT 21H
    JMP EXIT

DIS4:
    MOV AH, 2
    MOV DL, CH
    INT 21H
    MOV DL, BL
    INT 21H
    MOV DL, BH
    INT 21H
    JMP EXIT

PRINT5:
    MOV AH, 2
    MOV DL, BL
    INT 21H
    MOV DL, BH
    INT 21H
    MOV DL, CH
    INT 21H
    JMP EXIT

PRINT6:
    MOV AH, 2
    MOV DL, BL
    INT 21H
    MOV DL, CH
    INT 21H
    MOV DL, BH
    INT 21H
    JMP EXIT    
 
EXIT:
 
    MOV AH,4CH
    INT 21H
 
    MAIN ENDP
END MAIN