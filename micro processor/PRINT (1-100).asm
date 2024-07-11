.MODEL SMALL
.STACK 100H
.DATA
NUM DW ?
lbk    db 13,10,'$'   ;LINE BREAK.
numstr db '$$$$$'     ;STRING FOR 4 DIGITS.
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV NUM, 0
    START:
         CMP NUM, 100       
         JBE PRINT                    
         JMP END_

     PRINT:
;         MOV AH,2            
;         MOV DL,NUM         
;         INT 21H            

    
         mov  si, offset numstr
         mov  ax, num
         call number2string    

     
         mov  ah, 9
         mov  dx, offset numstr
         int 21h     

     
         mov  ah, 9
         mov  dx, offset lbk
         int 21h     

         INC NUM              
         JMP START

     END_:
         MOV Ax,4C00H
         int 21h
         MAIN ENDP



number2string proc 
  call dollars 
  mov  bx, 10  
  mov  cx, 0   
cycle1:       
  mov  dx, 0   
  div  bx      
  push dx     
  inc  cx      
  cmp  ax, 0  
  jne  cycle1  
cycle2:  
  pop  dx        
  add  dl, 48  
  mov  [ si ], dl
  inc  si
  loop cycle2  

  ret
number2string endp       

proc dollars                 
  mov  cx, 5
  mov  di, offset numstr
dollars_loop:      
  mov  bl, '$'
  mov  [ di ], bl
  inc  di
  loop dollars_loop

  ret
endp