ekrantemizle macro  
    MOV AX,0600H
    MOV BH,07
    MOV CX,0
    MOV DX,184FH
    INT 10H   
ENDM
ekranbaslat macro    
MOV AX,0013H
int 10h     
ENDM    

Yukle macro a, b
    MOV AX, [b]
    MOV [a], AX    
ENDM

Eksi macro a
    MOV AX, [a]
    NEG AX
    MOV [a], AX    
ENDM
Arttir macro a
    MOV AX, [a]
    INC AX
    MOV [a], AX    
ENDM

Azalt macro a
    MOV AX, [a]
    DEC AX
    MOV [a], AX    
ENDM

CMP_VarToVar macro a, b
    MOV CX, [a]
    CMP CX, [b]
ENDM

CMP_VarToNum macro a, b
    MOV CX, [a]
    CMP CX, b
ENDM

ToplaYukle macro c, a, b
    MOV AX, [a]
    ADD AX, [b]
    MOV [c], AX
ENDM 

CikarYukle macro c, a, b
    MOV AX, [a]
    SUB AX, [b]
    MOV [c], AX
ENDM

Ovallestir_X macro d, a, b, c
    MOV AX, [a]
    ADD AX, [b]
    ADD AX, [c]
    MOV [d], AX
ENDM 

Ovallestir_Y macro d, a, b, c
    MOV AX, [a]
    SUB AX, [b]
    SUB AX, [c]
    MOV [d], AX
ENDM

Pixel macro x, y
    
    MOV CX, [x]   
    MOV DX, [y]   
    MOV AX, 0C02H
    int 10h     
ENDM 

PixelKirmizi macro x,y
    
    MOV CX,[x]
    MOV DX,[y]
    MOV AL,12
    MOV AH,0ch
    int 10h
ENDM    

Cember macro X, Y, R
LOCAL cember_dongu,denge_faktor,x_bosluk,y_bosluk,denge_faktor_ters,cember_bitir,xx,xx2,yy,yy2,xy,yx,xy2,yx2,denge_faktor,x_bosluk,y_bosluk
    denge_faktor dw 0
    x_bosluk dw 0
    y_bosluk dw 0 
    
    xx dw 0
    xx2 dw 0
    yy dw 0
    yy2 dw 0
    
    xy dw 0
    xy2 dw 0
    yx dw 0
    yx2 dw 0
         
    Yukle y_bosluk, R
    Yukle denge_faktor, R
    
    Eksi denge_faktor
    
       
    cember_dongu:
     
          ToplaYukle xx, X, x_bosluk
          CikarYukle xx2, X, x_bosluk 
          ToplaYukle yy, Y, y_bosluk
          CikarYukle yy2, Y, y_bosluk
          
          ToplaYukle xy, X, y_bosluk
          CikarYukle xy2, X, y_bosluk       
          ToplaYukle yx, Y, x_bosluk
          CikarYukle yx2, Y, x_bosluk
 
         
          Pixel xx, yy;270-315 
          Pixel xx, yy2;90-45   
          Pixel xx2, yy;270-225   
          Pixel xx2, yy2;90-135 
          
          Pixel xy, yx;360-315      
          Pixel xy, yx2;0-45 
          Pixel xy2, yx;180-225  
          Pixel xy2, yx2;180-135 
          
           
         
    Ovallestir_X denge_faktor, denge_faktor, x_bosluk, x_bosluk; OVALLÝGÝ SAGLAR
    
    CMP_VarToNum denge_faktor, 0     
    JL denge_faktor_ters   
    Azalt y_bosluk
   
    
    Ovallestir_Y denge_faktor, denge_faktor, y_bosluk, y_bosluk;OVALLIGI SAGLAR
    
    denge_faktor_ters: 
    Arttir x_bosluk
    CMP_VarToVar x_bosluk, y_bosluk
    JG cember_bitir
    JMP cember_dongu
    
    
    cember_bitir:
    
ENDM 

Dudak macro X, Y, R

    denge_faktor dw 0 
    
    x_bosluk dw 0
    y_bosluk dw 0 
    
    xx dw 0
    xx2 dw 0
    yy dw 0
     
    Yukle y_bosluk, R
    Yukle denge_faktor, R
    
    Eksi denge_faktor
    
       
    dudak_dongu:
    
            ToplaYukle xx, X, x_bosluk 
            CikarYukle xx2, X, x_bosluk
            ToplaYukle yy, Y, y_bosluk
                    
            PixelKirmizi xx, yy;270-315
            PixelKirmizi xx2, yy;270-225
            
    
    
    Ovallestir_X denge_faktor, denge_faktor, x_bosluk, x_bosluk
    
    
    CMP_VarToNum denge_faktor, 0
    JL denge_faktor_ters_dudak    
    Azalt y_bosluk
    
    
    Ovallestir_Y denge_faktor, denge_faktor, y_bosluk, y_bosluk
    
    denge_faktor_ters_dudak:
    Arttir x_bosluk    
    CMP_VarToVar x_bosluk, y_bosluk
    JG dudak_bitis
    JMP dudak_dongu
 
    dudak_bitis:
    
ENDM

ORG 100H

ekranbaslat 

Cember xgoz1, ygoz1, rgoz1
Cember xgoz2, ygoz2, rgoz2
Cember xkafa, ykafa, rkafa 
Dudak xdudak,ydudak,rdudak

xkafa dw 84h
ykafa dw 90
rkafa dw 50h

xgoz1 dw 71h
ygoz1 dw 70
rgoz1 dw 10h

xgoz2 dw 99h
ygoz2 dw 70
rgoz2 dw 10h

xdudak dw 84h
ydudak dw 100
rdudak dw 22h


RET 
