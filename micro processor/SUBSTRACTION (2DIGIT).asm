INCLUDE "EMU8086.INC"

.MODEL SMALL
.STACK 100H
.DATA

MSG1 DW "ENTER FIRST NUMBER = $" 
MSG2 DW "ENTER SECOND NUMBER = $" 
MSG3 DW "THE SUBSTRACTION RESULT IS = $" 

.CODE

MAIN PROC  
    MOV AX,@DATA
    MOV DS,AX 
    
    OUTER:
    MOV AH,2
    MOV DL,13
    INT 21H
    MOV DL,10
    INT 21H
        
    LEA DX, MSG1  ; FIRST NUMBER MEASSAGE
    MOV AH,9
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV BH,AL
    SUB BH,48
    INT 21H       ; TAKING FIRST NUMBER INPUT
    MOV BL,AL 
    SUB BL,48
    
    ;PRINTN ""
    MOV AH, 2       ;NEW LINE
    MOV DL, 10
    INT 21H
    MOV DL ,13
    INT 21H
    
    
    
    LEA DX, MSG2
    MOV AH,9        ; SECOND NUMBER MEASSAGE
    INT 21H
    
    MOV AH,1 
    INT 21H
    MOV CH,AL
    SUB CH,48
    INT 21H         ; TAKING SECOND NUMBER INPUT
    MOV CL,AL
    SUB CL,48  
    
    MOV AH, 2       ;NEW LINE
    MOV DL, 10
    INT 21H
    MOV DL ,13
    INT 21H 
    
    ;SUB SURU 
    ;CASE1 BH, BL BORO
    CMP BL,CL
    JGE CASE1BH ; BL BORO HOLE 
    
    JMP CASE2CL ; CL BORO HOLE
    
    CASE1BH:
    CMP BH,CH
    JGE CASE1BHBL ; BH, BL BORO HOLE
    
    ;CASE2 BH,CL BORO 
    CASE2CL: 
    
    
    CASE2BH:
    CMP BH,CH
    JGE CASE2BHCL ;BH, CL BORO HOLE
    
    JMP CASE3CHCL ;CH, CL BORO HOLE
    CASE1BHBL:
    SUB BL,CL
    ADD BL,48
    
    SUB BH,CH
    ADD BH,48     
    
    JMP RESULT_CASE1_BHBL 
    
    
    
    CASE2BHCL:
    ADD BL,10
    SUB BL,CL
    ADD BL,48
    
    ADD CH,1
    SUB BH,CH
    ADD BH, 48
    
    JMP RESULT_CASE2_BHCL 
    
    
    CASE3CHCL:
    SUB CL, BL
    ADD CL, 48
    
    SUB CH, BH
    ADD CH,48
    
    JMP RESULT_CASE3_CHCL 
    
    RESULT_CASE1_BHBL:    
    LEA DX, MSG3
    MOV AH,9        ; OUTPUT MEASSAGE
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    JMP OUTER
    
    RESULT_CASE2_BHCL:    
    LEA DX, MSG3
    MOV AH,9        ; OUTPUT MEASSAGE
    INT 21H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    MOV DL,BL
    INT 21H
    JMP OUTER 
    
    RESULT_CASE3_CHCL:    
    LEA DX, MSG3
    MOV AH,9        ; OUTPUT MEASSAGE
    INT 21H
    
    MOV AH,2
    MOV DL, 45
    INT 21H
    MOV DL,CH
    INT 21H
    MOV DL,CL
    INT 21H
    JMP OUTER
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
