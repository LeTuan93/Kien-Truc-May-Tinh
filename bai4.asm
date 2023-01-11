.Model Small
.Stack 100
.Code
MAIN Proc
    MOV CL, 4
    ROL BX, Cl
    
    MOV CL, 4  
    ROR BH, CL
     
    MOV AH, 4CH
    INT 21H
    
MAIN Endp
END MAIN