# <i>👉Series-Analyzer-and-Generator-Using-8086-Microprocessor.</i>

##  *✅ Project Overview*

In this project, there are two sections: **Series Analyzer** and **Series Generator**. Let’s discuss both sections:<br>

**🚩The formula for the Nth element of a series is given by:** <br>
*Tn = a + ( n - 1 ) x d* <br><br>
Where:
-  Tn  = Nth element of the series
-  a  = First element of the series
-  n = Number of elements in the series
-  d  = Difference between two consecutive elements in the series

**🚩The sum of the first \( n \) elements of a series is given by:** <br>
*Sn=n × ( 2a + ( n − 1 ) × d ) / 2* <br><br>
Where:
-  Sn  = Sum of the first n elements
-  n  = Number of elements
-  a  = First element
-  d  = Difference between consecutive elements<br>

**Series analyzer:** For a given series it will find the difference by which the series was built and store the result in a location. Then find the sum of the n element and store into the next element.
<br><br>
**Series Generator:** IF the data like difference between two respective elements and the first element is given then the series can be built. The Nth element of the series and sum of N element can be found.

<br><br>
## *✅ASSEMBLY CODE*.
```c
 ;// Memory initializiantion 
MOV AX, 900H;
####  MOV DS, AX;
 MOV SI, 400H;
 MOV DI, 500H;
 ;// CHECKING (ANALYZER OR GENERATOR)
 MOV AL, [SI]; 9400>>AL
 CMP AL, 01H;
 JE L1;
 L0: ;//Analzer
  INC SI;
  MOV CL, [SI]; //1st term>>cL
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
 ```
