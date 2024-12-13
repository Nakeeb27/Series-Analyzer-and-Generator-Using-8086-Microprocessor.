
org 000h

; Memory initializiantion
MOV AX, 900H;
MOV DS, AX;
MOV SI, 400H;
MOV DI, 500H;
; CHECKING (ANALYZER OR GENERATOR)
MOV AL, [SI]; 9400>>AL
CMP AL, 01H;
JE L1;


L0: ;Analzer
  INC SI;
  MOV CL, [SI]; 1st term>>cL
  MOV CH, 00H;
  INC SI;
  MOV BX, [SI]; 2nd term>>BX
  ADD SI, 02H;
  MOV AX, [SI]; 3rd term>>AX
  SUB AX, BX; 2nd Difference
  SUB BX, CX; 1st Difference
  CMP AX, BX; comparing the two differences 
  JNE L3;
  MOV [DI], AL; Storing difference 9500
  ADD SI, 02H;
  MOV AL, [SI];Loading vale of n for finding the term
  MOV AH, 00H;    
  ;Tn=(n-1)*d + a
  DEC AL;
  MUL BL;
  ADD AX, CX;
  ADD DI, 01H;
  MOV [DI], AX;Storing nth term 9501-9502
  
  INC SI;
  MOV AL, [SI];Loading value of n 
  MOV AH, 00H;
  ;Sn=( (n-1)*d + 2a )/2*n
  DEC AL;
  MUL BL;
  ADD AX, CX;
  ADD AX, CX;
  MOV BX, 0002H;
  DIV BX;
  MOV BL, [SI];
  MUL BX;
  ADD DI, 02H;
  MOV [DI], AX;Storing lower of SUM 9503-9504
  MOV [DI+2], DX;Storing Higher of SUM 9505-9506 
  JMP L3: ;going to halt the programm.
  
  
L1: ;GENERATOR
  INC SI;
  MOV AL, [SI];Loading 1st term
  MOV AH, 00H;
  INC SI;
  MOV BL,[SI];Loading difference
  MOV BH, 00H;
  MOV [DI], AX;storing first term
  MOV CX, 0004H;
  L2:
     ADD AX, BX;
     ADD DI, 02H;
     MOV [DI], AX;
     LOOP L2; Loop for storing 4 terms
     
  INC SI;
  MOV AL, [SI];Loading vale of n for finding the term
  MOV AH, 00H;    
  ;Tn=(n-1)*d+a
  DEC AL;
  MUL BL;
  MOV CL, [401H];
  MOV CH, 00H;
  ADD AX, CX;
  ADD DI, 02H;
  MOV [DI], AX;Storing nth term 9501-9502  
  INC SI;
  MOV AL, [SI];Loading value of n 
  MOV AH, 00H;
  ;Sn=((n-1)*d+2a)/2*n
  DEC AL;
  MUL BL;
  ADD AX, CX;
  ADD AX, CX;
  MOV BX, 0002H;
  DIV BX;
  MOV BL, [SI];
  MUL BX;
  ADD DI, 02H;
  MOV [DI], AX;Storing lower of SUM 9503-9504
  MOV [DI+2], DX;Storing Higher of SUM 9505-9506
L3:HLT;        

ret;