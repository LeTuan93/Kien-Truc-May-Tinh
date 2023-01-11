.model small
.stack 100h
.data
    crlf db 13,10,'$'
    day db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20  
    tong db ?
.code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    lea si,day
    mov cx,20
    mov tong,0
    mov bl,7
    mov ah,0
    lap3:
        mov ah,0
        mov al,[si]
        div bl
        cmp ah,0
        jne khongcong
        mov al,[si]
        add tong,al
    khongcong:
        inc si
        loop lap3
    mov ah,0
    mov al,tong
    call inSo
    
    mov ah,4ch
    int 21h
MAIN endp

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
inSo endp    
END MAIN