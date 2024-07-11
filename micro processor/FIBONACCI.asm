
.MODEL SMALL
.STACK 100H
.DATA 
 
FIRST DB 0  ; 0
SECOND DB 1     ; 1 
TEMP DB ?


.CODE
MAIN PROC 
    
    MOV AX, @DATA
    MOV DS,AX    
    
    MOV BH, FIRST   ; 0
    MOV BL, SECOND  ; 1
    
    LOOP_1:     
    ADD BH,48       ; ASCII CODE ADDING NOT VALUE
    ADD BL,48
     
    MOV AH,2 
    MOV DL,BH       ; PRINT ASCII VALUE NOT CODE
    INT 21H 
    
    MOV DL,' '
    INT 21H
    
    SUB BH,48       ; ASCII CODE SUBSTRACTION NOT VALUE
    SUB BL,48
    
    ADD BH,BL     
                         
    MOV TEMP,BH     ;SWAPPING OPERATION
    MOV BH,BL            
    MOV BL,TEMP     ;SWAPPING END 
    
    CMP TEMP,13
    JG EXIT   
    JMP LOOP_1
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
   
    

