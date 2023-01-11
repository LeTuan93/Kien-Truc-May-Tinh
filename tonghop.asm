.model small
.stack 100h
.Data         
    crlf db 13,10,'$'
    y dw ?
    x dw ? 
.code
MAIN ProC
    mov ax,@data
    mov ds,ax
    
    call nhapSo ; nhap 1 so he 10
    call endl
    call inSo
    call endl
    call dectoBin  ; chuyen 10 sang 2
    call endl
    call dectoHex ; chuyen 10 sang 16
    call endl
    call bintoDex ; nhap 1 so he 2
    call endl
    call inSo
    
    mov ah,4ch
    int 21h
MAIN Endp

endl Proc
    push ax
    push dx
    
    mov ah,9
    lea dx,crlf
    int 21h
    
    pop dx
    pop ax
    ret
endl Endp 

nhapSo ProC 
    mov x,0
    mov y,0
    mov bx,10
    lap:
        mov ah,1
        int 21h
        
        cmp al,13
        je break
        
        sub al,'0'
        mov ah,0
        mov y,ax
        
        mov ax,x
        mul bx
        
        add ax,y
        
        mov x,ax
    jmp lap
break:
    mov ax,x    
    ret
nhapSo Endp
     
dectoBin ProC
    push ax
    mov bx,2
    mov cx,0
    lap3:  
        mov dx,0
        div bx
        push dx
        inc cx
        
        cmp ax,0
        jg lap3
        
     hienthiBin:
        pop dx
        add dl,'0'
        mov ah,2
        int 21h
     loop hienthiBin 
     pop ax
     ret
dectoBin EndP

dectoHex Proc
    mov cx,0
    mov bx,16
    lap4:
        mov dx,0
        div bx
        cmp dl,10
        jge lonHon
        jl  nhoHon
        
        lonHon:
            sub dl,10
            add dl,'A'
            jmp break1
        nhoHon:
            add dl,'0'       
    break1:
        push dx
        inc cx
        
        cmp ax,0
        jg lap4
    
    hienthiHex:
        pop dx
        mov ah,2
        int 21h
        
    loop hienthiHex
    ret
dectoHex endp

bintoDex Proc
    mov bx,2
    mov cx,0
    mov x,0
    lap5:
        mov ah,1
        int 21h
        
        cmp al,13
        je break2
        
        mov ah,0 
        sub al,'0'
        mov y,ax
    
        mov ax,x
        mul bx
        add ax,y
        mov x,ax
        
    jmp lap5
break2:
    mov  ax,x    
    ret
bintoDex Endp

inSo ProC
    push ax
    push bx
    push cx
    push dx
    mov bx,10
    mov cx,0
    lap2:
        mov dx,0
        div bx
        push dx
        inc cx
        
        cmp ax,0
        jg lap2
        
    hienthi:
        pop dx 
        add dl,'0'
        mov ah,2
        int 21h
    loop hienthi
    
    pop dx
    pop cx
    pop bx
    pop ax        
    ret
inSo Endp  
END MAIN