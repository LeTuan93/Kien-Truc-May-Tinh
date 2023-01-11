.model small
.stack 100h
.data
    crlf db 13,10,'$'
    str db 'KTMT la KTMT KTMTKTMT chu khong phai KTMT hieu chua$'
    str1 db 'KTMT$' 
    check db ?
.code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    lea si,str
    mov cx,0
    
    lapI:
        cmp [si], '$'
        je xong
        
        mov bx,si
        lea di,str1
        lapJ:
            cmp [di], '$'
            je Co
            mov al, [bx]
            cmp [di],al
            jne Khong
            inc di
            inc bx
            jmp lapJ
        Co:
            inc cx
        Khong:
        inc si
        jmp lapI
    xong:
    
    mov ax,cx
    call inSo
    
    mov ah,4ch
    int 21h
MAIN endp

endl proc
    push ax
    push dx
    
    lea dx, crlf
    mov ah,9
    int 21h
    
    pop dx
    pop ax
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