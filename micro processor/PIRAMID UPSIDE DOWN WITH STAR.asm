.MODEL SMALL
.STACK 100H 

.DATA 
STAR DB ?
SPACE DB ?


.CODE
MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX
    
    
    MOV CX,3
    MOV BH ,5
    MOV BL,0   
    
    MOV STAR , BH   ; HERE STAR IS 5 
    MOV SPACE, BL   ; HERE SPACE IS 0
    
    L1:
    CMP SPACE,0     ; COMPARE 0, 0
    JE L2
    
    MOV AH,2
    MOV DL,32
    INT 21H
    DEC SPACE
    JMP L1
    
    L2: 
    MOV AH,2
    MOV DL,"*"       ; PRINT *
    INT 21H
    DEC STAR         ; 4 /3//2/1
    CMP STAR ,0      ; COMPARE 4, 0
    JNE L2           ; NOT EQUAL THEN PRINT * AGAIN
    
    MOV AH,2
    MOV DL,10
    INT 21H          ; NEW LINE
    MOV DL,13
    INT 21H
    
    DEC BH           ; HERE BH 4
    DEC BH           ; HERE BH 3
    MOV STAR, BH     ; HERE START IS 3
    
    INC BL           ; BL IS 1
    MOV SPACE, BL    ; SPACE IS 1
    LOOP L1
    
    
    EXIT: 
    MOV AH,4CH
    INT 21H
    
    
    MAIN ENDP
END MAIN
