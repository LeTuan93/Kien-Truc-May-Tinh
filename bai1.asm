.Model small
.Stack 100h
.Data
    Xuongdong DB 13,10,'$'
    ChaoTay DB 'Hello$'
    ChaoTa DB 'Chao ban!$'
.Code
MAIN Proc
     MOV AX,@Data 
     MOV DS,AX
    
     MOV AH,9
     LEA DX,ChaoTay
     INT 21H
                   
     call endl
     MOV CX,6
LAP: INT 21H 
     LOOP LAP
     
     LEA DX,ChaoTa
     INT 21H
     
     MOV AH,4CH
     INT 21H 

MAIN Endp


endl Proc
    
    lea dx,Xuongdong
    mov ah,9
    int 21h
      
    ret     
endl Endp
    END MAIN
    
    