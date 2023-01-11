.model small
.stack 100h
.data
    crlf db 13,10,'$'
    x dw ?
    y dw ?
    
.code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    
    sub al,'0'
    mov bl,al
    mov bh,0
    
    call endl
    
    push bx
    call nhapSo
    pop bx
    
    call endl
    
    mov cx,ax
    mov ax,1
    mov dx,0
    lap3:
        mul bx
    loop lap3
    
    call inSo
    mov ah,4ch
    int 21h
MAIN endp 

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

endl proc
    push dx
    push ax
    
    lea dx,crlf
    mov ah,9
    int 21h
    
    pop ax
    pop dx
    ret
endl endp

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