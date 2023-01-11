.model small
.stack 100h
.data
    crlf db 13,10,'$' 
    x dw ?
    y dw ?
    z dw ?
.code
MAIN proc
    mov ax,@data
    mov ds,ax
    
    call nhapSo
     
    mov cx,ax
    mov ax,1
  
    lap1:
       mul cx
    loop lap1
    
    call endl
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

endl Proc
    push dx
    push ax
    lea dx,crlf
    
    mov ah,9
    int 21h
    
    
    pop ax
    pop dx
    ret
endl Endp
inSo ProC
    push ax
    push bx
    push cx
    mov bx,10
    mov cx,0
    lap2:
        mov z,dx
        div bx
        push dx
        mov dx,z
        inc cx
        
        cmp ax,0
        jg lap2
        
    hienthi:
        pop dx 
        add dl,'0'
        mov ah,2
        int 21h
    loop hienthi
    
    pop cx
    pop bx
    pop ax        
    ret
inSo Endp  

END MAIN