SYS_EXIT  equ 1
SYS_READ  equ 3
SYS_WRITE equ 4
STDIN     equ 0
STDOUT    equ 1
 
segment .data 
 
   msg1 db "Введите цифру " 
   len1 equ $- msg1 
 
   msg2 db "Введите вторую цифру "
   len2 equ $- msg2 
 
   msg3 db "Сумма равна: "
   len3 equ $- msg3
 
segment .bss
 
   num1 resb 512 
   num2 resb 512
   res resb 1024  
 
section .text
   global _start

_start:
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg1         
   mov edx, len1 
   int 0x80                
 
   mov eax, SYS_READ 
   mov ebx, STDIN  
   mov ecx, num1 
   mov edx, 512
   int 0x80            
 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT         
   mov ecx, msg2          
   mov edx, len2         
   int 0x80
 
   mov eax, SYS_READ  
   mov ebx, STDIN  
   mov ecx, num2 
   mov edx, 512
   int 0x80        
 
   mov eax, SYS_WRITE         
   mov ebx, STDOUT         
   mov ecx, msg3          
   mov edx, len3         
   int 0x80
 
   mov eax, [num1]
   sub eax, '00'
     
   mov ebx, [num2]
   sub ebx, '00'
 
   add eax, ebx
   aaa
   add eax, '00'
 
   mov [res], eax
 
   mov eax, SYS_WRITE        
   mov ebx, STDOUT
   mov ecx, res         
   mov edx, 2
   int 0x80
 
exit:    
    
   mov eax, SYS_EXIT   
   xor ebx, ebx 
   int 0x80
