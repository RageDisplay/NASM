section .data
	   m1  db 1, 2, 3, 4
	   m2  db 5, 6, 7, 8
	   res TIMES 4 db 0
section .text
	   global _start

movMatrix: push rsi
	   push rdi
	   push rcx
	   push rbx
	   mov r8, 0  ;столбец
	   mov r15, 0 ;строка
.loop:     cmp r8, rcx
	   je .end1
	   mov rax, [rsi]
	   add rdi, r8
	   mov r9, [rdi]
	   mul r9
	   mov r9 , rax
	   add rsi, r15
	   inc rsi
	   mov rax, [rsi]
	   add rdi, rcx
	   mov r9, [rdi]
	   mul r9
	   add rax, r9
	   mov [rbx], rax
	   inc rbx
	   inc r8
	   jmp .loop
.end1:     add r15, rcx
	   xor r8, r8
	   cmp r15, rcx
	   je .end2
	   jmp .loop
.end2:	   pop rbx
	   pop rcx
	   pop rdi
	   pop rsi
	   ret

_start:    mov rsi, m1
	   mov rdi, m2
	   mov rcx, 2
	   mov rbx, res
	   call movMatrix
	   mov rax, 1
	   mov rbx, 0
	   int 0x80
