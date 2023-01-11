.Model Small
.Stack 100h
.Data
    TBao DB 'Go vao 1 so he hai:$'
    x DW ?
    Y DW ?
.Code
MAIN Proc       
    MOV AX, @Data
    MOV DS, AX
    
    MOV AH, 9
    LEA DX, TBao
    INT 21H 
    
    
    CALL nhapSo
    
    MOV CX,0
    MOV BX,2
    lap:
        MOV DX,0 ; SO BI CHIA LA DXAX , minh chi can AX thoi ,DX=0
        DIV BX
        PUSH DX
        INC CX
        
        CMP AX,0
        JG lap
     
     laptiep:
        CMP CX,16
        JGE ra
        INC CX
        mov DX,0
        PUSH DX
        jmp laptiep
      ra:
        
   XOR BX, BX
     
TIEP:
    Pop DX
    MOV AX,DX
    AND AL, 0FH
    SHL BX, 1
    OR BL, AL
    LOOP TIEP

THOIDOC:
    MOV CX, 16
    MOV AH, 2
HIEN:
    XOR DL, DL
    ROL BX, 1
    ADC DL, 30H
    INT 21H
LOOP HIEN
    MOV AH, 4CH
    INT 21H
MAIN Endp

nhapSo Proc
    MOV x,0
    MOV y,0
    MOV BX,10
    nhap:    
        MOV AH,1
        INT 21H
    
        CMP AL,13
        JE nhapXong
    
        SUB AL,'0'
        MOV AH,0
        MOV y,AX
    
        MOV AX,x
        MUL BX
        ADD AX,y
      
        MOV x,AX 
        
        JMP nhap
    nhapXong:
        MOV AX,x
        ret    
nhapSo Endp  
    
END MAIN