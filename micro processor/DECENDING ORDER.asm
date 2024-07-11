.MODEL SMALL
.STACK 100H
.DATA
MSG DB 'ENTER FIRST CAPITAL LETTER: $'
MSG1 DB 'ENTER SECOND CAPITAL LETTER: $'
MSG2 DB 'ENTER THIRD CAPITAL LETTER: $'
MSG3 DB 'THE DESENDING ORDER IS: $'
NEXT_LINE DB 0DH,0AH,'$'

.CODE 

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,2
    MOV DL,'?'
    INT 21H
    
    LEA DX,NEXT_LINE
    MOV AH,9
    INT 21H
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
 
    MOV AH,1
    INT 21H
    MOV BH, AL
    
     LEA DX,NEXT_LINE
    MOV AH,9
    INT 21H 
    
     LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL, AL
    
    
      
    LEA DX,NEXT_LINE
    MOV AH,9
    INT 21H
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV CH, AL
    
    LEA DX,NEXT_LINE
    MOV AH,9
    INT 21H  
    
    LEA DX,MSG3
    MOV AH,9
    INT 21H
    
   

TOP1:
    CMP BH, BL
    JGE TOP2
    JLE TOP4 

TOP2:
    CMP BH, CH
    JGE TOP3
    JLE OUT3

TOP3:
    CMP CH, BL
    JGE OUT1
    JLE OUT2

TOP4:
    CMP BL, CH
    JGE TOP5
    JLE OUT4

TOP5:
    CMP CH, BH
    JGE OUT6
    JLE OUT5

OUT1:
    MOV AH, 2
    MOV DL, BH
    INT 21H
    MOV DL, CH
    INT 21H
    MOV DL, BL
    INT 21H
    JMP END

OUT2:
    MOV AH, 2
    MOV DL, BH
    INT 21H
    MOV DL, BL
    INT 21H
    MOV DL, CH
    INT 21H
    JMP END

OUT3:
    MOV AH, 2
    MOV DL, CH
    INT 21H
    MOV DL, BH
    INT 21H
    MOV DL, BL
    INT 21H
    JMP END

OUT4:
    MOV AH, 2
    MOV DL, CH
    INT 21H
    MOV DL, BL
    INT 21H
    MOV DL, BH
    INT 21H
    JMP END

OUT5:
    MOV AH, 2
    MOV DL, BL
    INT 21H
    MOV DL, BH
    INT 21H
    MOV DL, CH
    INT 21H
    JMP END

OUT6:
    MOV AH, 2
    MOV DL, BL
    INT 21H
    MOV DL, CH
    INT 21H
    MOV DL, BH
    INT 21H
    JMP END    
 
END:
 
    MOV AH,4CH
    INT 21H
 
    MAIN ENDP
END MAIN