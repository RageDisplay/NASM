
section .text
	global _start

_start:

	mov eax,4
	mov ebx,1
	mov ecx, userMsg
	mov edx, len3
	int 0x80

	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 0x80

	mov ax, num
	and ax, 1
	jz evnn
	mov eax, 4
	mov ebx, 1
	mov ecx, odd_msg
	mov edx, len2
	int  0x80
	jmp outprog

evnn:

	mov ah, 09h
	mov eax, 4
	mov ebx, 1
	mov ecx, even_msg
	mov edx, len1
	int 0x80

outprog:

	mov eax,1
	int 0x80

section .data
        userMsg db 'Enter the num'
        len3 equ $ - userMsg
        even_msg db 'Chetnoe!'
        len1 equ $ - even_msg

        odd_msg db 'NeChetnoe!'
        len2 equ $ - odd_msg

section .bss
        num resb 5

