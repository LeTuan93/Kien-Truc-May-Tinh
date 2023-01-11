.MODEL SMALL
.STACK 100H
.DATA              
    CRLF DB 13,10,'$'
    ChaoTay DB 'Hello$'
    ChaoTa DB 'Chao ban!$'
    Thongbao DB 'go vao so dong cach:$'
    SoCRLF DB ?
    Thongbaonhaplai DB 'Nhap sai , xin moi nhap lai:$' 
    TMP DB ?          
             
    X DW ?
    Y DW ?
.CODE
MAIN Proc
    MOV AX,@Data
    MOV DS,AX 
    
    MOV AH,9
    LEA DX,Thongbao
    INT 21H
     
Nhaplai:     
    call nhapSo
    
    CMP AX,10
    JL ra
    
        
    MOV AH,9
    LEA DX,CRLF
    INT 21H
        
    MOV AH,9
    LEA DX,Thongbaonhaplai
    INT 21H
        
    
    JMP Nhaplai 
        
     
    ra:

    MOV TMP,AL
    INC TMP
   
    MOV AH, 9
    LEA DX, CRLF
    INT 21H
    
    
    MOV AH,9
    LEA DX,ChaoTay
    INT 21H
    
    LEA DX,CRLF
    
    XOR CX, CX
    MOV CL, TMP
Lap: INT 21H
   LOOP LAP

   LEA DX,ChaoTa
   INT 21H
    
    MOV AH,4CH
    INT 21H
Main Endp

nhapSo Proc
    MOV x,0
    MOV y,0
    MOV bx,10
    nhap:
        MOV ah,1
        INT 21H
        
        CMP AL,13
        JE nhapXong
        
        SUB AL,'0'
        MOV AH,0
        MOV y,AX
        
        MOV AX,X
        MUL BX
        ADD AX,y
        
        MOV X,AX
        JMP nhap
     nhapXong:
     mov ax,x
     ret
nhapSo Endp

END MAIN  
                             
