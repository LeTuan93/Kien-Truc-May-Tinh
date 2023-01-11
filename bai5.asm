.Model Small
.Stack 100h
.Data
    CRLF db 13,10,'$' 
    xau db 50 dup('$')
    str db 'CHAO$'
    cnt db ?
    tmpxau db 50 dup('$') 
.Code
MAIN Proc
    MOV AX, @Data
    MOV DS, AX
    
    MOV cnt,0
    
    nhaptiep:
        mov ah,1
        int 21h
            
        
        cmp al,13
        je nhapXong
      
        inc cnt
        
        cmp al, 'a'
        jl continue
        
        cmp al,'z'
        jg continue
        
        sub al,32
               
        push ax
        continue:
        jmp nhaptiep
     nhapXong:
     
     
     mov ah,9
     lea dx,crlf
     int 21h
     
     lap:
        pop ax
        cmp cnt,0
        je break
        dec cnt
        mov ah,2
        mov dl,al
        int 21h
        jmp lap
     break:    
    
    
    MOV AH,4CH
    INT 21H
MAIN Endp
END MAIN