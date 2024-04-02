%INCLUDE "io.inc"
SECTION .text
global CMAIN
CMAIN:
   MOV EAX, [num1]  
   MOV EDX, [num1]
   MOV ECX, [num1]
   SUB ECX, 1   
 
   label:
    SUB EDX, 1
    IMUL EAX, EDX  
   LOOP label
   
   PRINT_UDEC 4, EAX     
   
   MOV [res], EAX   
   MOV EAX, 0    
      
   RET              

SECTION .data
num1 DD 3 
res  DD 0