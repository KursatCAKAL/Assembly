org 0100h

data_set db 'kursatcakal '


INDEX dw 11 ; 

mov dx,INDEX ; eleman sayisi-1

call ekranayazdir
while: ; toplam eleman sayisi kadar tekrar
mov cx,0 ; siralanmamis eleman sayisi
    icdongu: ; kalan eleman sayisi kadar tekrar

    mov si,cx
    mov al,[data_set+si] 
    mov bl,[data_set+si+1] 
    cmp al,bl ; kontrol yapisi (compare al,bl) 
    jbe devam ; jump below or equal if(al>bl){devam modulune atla}  degilse devam et
    call swap ; jump below or equal if(al<bl){devam modulune atla}  
    devam:
        inc cx 
        cmp cx,dx 
        jnb icdongusonu 
    jmp icdongu 
    icdongusonu: 
    dec dx 
    cmp dx,0 
    je bitir 
    jmp while 
bitir:


call ekranayazdir ; bubble sort sonucunu 
hlt ; program bitisi


;ALT MODULLER
        ;ALT MODUL 1
        ekranayazdir proc
            push dx ; 1-iceride dx registerini kullanacagim benim kisitli sayida registerim var
                    ; 2-bu sebeple "ekranayazdir" methodum sonrasinda kullanacak oldugum dx registerinin asil degerini muhafaza ediyorum
                    
            mov cx, 0 ;sayac
            mov ah,2  ;int 21, ah=2, ekrana karakter yazdir
            ;mov ah,1  ; int 21, ah=1, karakter girdisi al
            ;1:int 21h degeri bizim icin ekran ile ilgili islemleri gerceklestirir bu emu8086 icin boyle belirlenmistir.
            ;1_devam:bu islemleri gerceklestirirken "ah" register bolumunun sahip oldugu ic degere gore farkli islemler gerceklestirir.
            ;1_devam:ornegin ah=2 icin ekrana dl'deki degeri yazdirir
            ;1_devam:ornegin ah=1 icin klavyeden girdi alir
            tekrar:
                mov si,cx
                mov dl, [data_set+si]
                int 21h 
                inc cx
                cmp cx, INDEX
                ja cikis
            jmp tekrar
            cikis:
            mov dl, 0Dh ; int21h dl deki degeri ekrana yaziyor demistik. { "0DH"=CRET }
            int 21h
            mov dl, 0Ah ; int21h dl deki degeri ekrana yaziyor demistik. { "0AH"=newline }
            int 21h
            pop dx ; data registerin stack'de muhafaza edilen degeri almis olduk.
            ret
        ekranayazdir endp   
        ;ALT MODUL 1 BİTİS
        ;ALT MODUL 2
        swap proc ;oteleme islemi yapiyoruz
            mov [data_set+si],bl
            mov [data_set+si+1],al
        ret
        swap endp    
        ;ALT MODUL 2 BİTİS
;ALT MODULLER BITIS
