.MODEL SMALL
.STACK 100H

.DATA 
MSG1 DB 10,13,'ENTER A CHARACTER = $'
MSG2 DB 10,13, 'ITS A VOWEL $'
MSG3 DB 10,13, 'ITS A CONSONANT $'
MSG4 DB 10,13, 'ITS A NUMBER $'
MSG5 DB 10,13, 'INVALID INPUT $' 
MSG6 DB 10,13, 'YOU HAVE ENTERED = $' 
MSG7 DB 10,13, 'DO YOU WANT TO CHECK AGAIN? (Y/N)= $'

NUMASCII DB ?
CAPCONASCII DB ?
SMALLCONASCII DB ?

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    OUTER: 
    MOV NUMASCII, 48
    MOV CAPCONASCII, 65
    MOV SMALLCONASCII,97    
    MOV AH,9
    LEA DX,MSG1     ; PRINTING MESSAGE
    INT 21H
    
    MOV AH,1        ; TAKING INPUT
    INT 21H
    MOV BL,AL       ; MOVING INTO BL
    
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
    
    MOV CX,0        ; MOVING 0 TO CX
    MOV CL,10       ; LOOP 10 TIMES FOR CHECKING NUMBER 
    
    CMP BL, 48    
    JGE NM
    NM:     
      CMP BL,NUMASCII   ; NUMASCII = 48
      JE NUMBER
      INC NUMASCII
    LOOP NM 
     
    
    MOV CX, 26      ; LOOP 26 TIMES FOR CHECKING CAPITAL LETTER
    CMP BL,65    
    JGE CAPCON
    CAPCON:
      CMP BL, CAPCONASCII   ; CAPCONASCII = 65
      JE CONSONANT
      INC CAPCONASCII
    LOOP CAPCON
    
    
    MOV CX, 26      ; LOOP 26 TIMES FOR CHECKING SMALL LETTER
    CMP BL,97    
    JGE SMALLCON
    SMALLCON:
      CMP BL, SMALLCONASCII   ; SMALLCONASCII = 65
      JE CONSONANT
      INC SMALLCONASCII
    LOOP SMALLCON    
    
    
    
    
    JMP INVALID
    
     
    VOWEL:
    MOV AH,9
    LEA DX,MSG6
    INT 21H 
    MOV AH,2
    MOV DL, BL
    INT 21H
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    JMP YES_NO  
    
    CONSONANT:
    MOV AH,9
    LEA DX,MSG6
    INT 21H 
    MOV AH,2
    MOV DL, BL
    INT 21H
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    JMP YES_NO
    
    NUMBER:
    MOV AH,9
    LEA DX,MSG6
    INT 21H 
    MOV AH,2
    MOV DL, BL
    INT 21H 
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    JMP YES_NO
    
    INVALID:
    MOV AH,9
    LEA DX,MSG5
    INT 21H
    JMP YES_NO 
    
    YES_NO:
    MOV AH,9
    LEA DX,MSG7
    INT 21H
    
    MOV AH,1
    INT 21H
    
    MOV BL,AL
    CMP BL,'Y'
    JE OUTER
    CMP BL,'y'
    JE OUTER 
    JMP EXIT
    
    
  
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN

