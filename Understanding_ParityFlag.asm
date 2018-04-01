org 100h

;mov al,10110101b 
mov al,10101010b
mov cx,8                      
mov bx,0

;10110101  -> başla
;0110101-0 -> cf=1
;110101-00 -> cf=0
                      
paritymethod:
            shl al,1 
            jae devam;cf=0 atla
            jmp tek_say;cf=1 ise atla
                tek_say:
                      INC BX
            devam:
loop paritymethod


mov ax,bx
mov bx,2

div bl
    
clc
  mov cl,11
  mov SI,offset tek_string

cmp ah,0
    je  cift_yazana_git;ah=0 ise cift adet 1 rakami icerir de cift yaz
    jmp devam_son;ah=1 ise tek adet 1 rakami icerir de tek yaz


tek_yazana_git PROC        
    mov SI,offset tek_string
    mov cl,11
   
tek_yazana_git ENDP

cift_yazana_git PROC
    mov SI,offset cift_string 
    mov cl,11
    
cift_yazana_git ENDP

devam_son:
  
PRINTSCREEN:

MOV AH,2H; INT 21, AH=2, PRINT CHAR TO SCREEN 

MOV AL,[SI]

MOV DL,AL

INC SI
INT 21H

loop PRINTSCREEN 

tek_string DB 'odd parity '
cift_string DB 'even parity '




            
