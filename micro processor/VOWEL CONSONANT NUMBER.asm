.MODEL SMALL
.STACK 100H

.DATA 
STR1 DB 'ENTER A CHARACTER: $'
STR2 DB 10,13, 'ITS A VOWEL $'
STR3 DB 10,13, 'ITS A CONSONANT $'
STR4 DB 10,13, 'ITS A NUMBER $'
STR5 DB 10,13, 'INVALID INPUT $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,STR1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CMP BL,'A'
    JE VOWEL
    
    CMP BL,'E'
    JE VOWEL
    
    CMP BL,'I'
    JE VOWEL
    
    CMP BL,'O'
    JE VOWEL
    
    CMP BL,'U'
    JE VOWEL
    
    CMP BL,'a'
    JE VOWEL
    
    CMP BL,'e'
    JE VOWEL
    
    CMP BL,'i'
    JE VOWEL
    
    CMP BL,'o'
    JE VOWEL
    
    CMP BL,'u'
    JE VOWEL
    
    CMP BL,'A'
    JGE CONSONANT
    
    CMP BL,'z'
    JLE CONSONANT 
    
    CMP BL,0
    JGE NUMBER
    
    CMP BL,9
    JLE NUMBER
    
    JMP INVALID
    
     
    VOWEL:
    MOV AH,9
    LEA DX,STR2
    INT 21H
    JMP EXIT  
    
    CONSONANT:
    MOV AH,9
    LEA DX,STR3
    INT 21H
    JMP EXIT
    
    NUMBER:
    MOV AH,9
    LEA DX,STR4
    INT 21H
    JMP EXIT
    
    INVALID:
    MOV AH,9
    LEA DX,STR5
    INT 21H
    JMP EXIT
    
  
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN

