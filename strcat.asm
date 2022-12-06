section .data
	   s1 TIMES 30 db 0
	   s2 db "Hello ", 0
	   s3 db "World", 10, 13, 0

section .text
	   global _start

_concat:   push ebx
	   push esi
.next:     cmp byte[ebx], 0
	   je .end_loop
	   inc ebx
	   jmp .next
.end_loop: mov al, [esi]
	   mov [ebx], al
	   inc esi
	   inc ebx
	   cmp al, 0
	   jne .end_loop
	   mov eax, ebx
	   pop esi
	   pop ebx
	   sub eax, ebx
           dec eax
	   ret

_start:    mov ebx, s1
	   mov esi, s2
	   call _concat
	   mov ebx, s1
	   mov esi, s3
	   call _concat
	   mov edx, eax
	   mov eax, 4
	   mov ebx, 1
	   mov ecx, s1
	   mov edx, 30
	   int 0x80
	   xor eax, eax
	   xor ebx, ebx	
	   mov eax, 1
	   mov ebx, 0
	   int 0x80
