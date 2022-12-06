section .data
	  hello db "Hello World", 0
	  new TIMES 12 db 0

section .text
	  global _start

_reverse: push ebx
	  push esi
	  mov ecx, edx
	  dec ecx
.rev:     mov eax, [ebx + ecx]
	  mov [esi], eax
	  inc esi
	  loop .rev
	  mov eax, [ebx]
	  mov [esi], eax
	  pop esi
	  pop ebx
	  ret

_strlen:  push ebx
	  mov edx, 0
.count:   inc edx
	  inc ebx
	  cmp byte[ebx], 0
	  jne .count
	  inc edx
	  pop ebx
	  ret

_start:   mov ebx, hello
	  call _strlen
	  mov esi, new
	  call _reverse
	  mov eax, 4
	  mov ebx, 1
	  mov ecx, new
	  int 0x80
	  mov eax, 1
	  mov ebx, 0
	  int 0x80
