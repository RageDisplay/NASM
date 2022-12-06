section .data
	a2i_table db '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ'

segment .bss
	str_tmp resb 32

section .text
	global _start

_i2a:   mov ecx, str_tmp+31
.loop:  xor edx, edx
	div r8d
	mov dl, [a2i_table + edx]
	mov [ecx], dl
	dec ecx
	or eax, eax
	jnz .loop
	inc ecx
	mov edx, str_tmp + 32
	sub edx, ecx
	retn

_start: mov eax, 558
	mov r8d, 10
	call _i2a
	mov eax, 4
	mov ebx, 1
	int 0x80
	mov eax, 1
	mov ebx, 0
	int 0x80
