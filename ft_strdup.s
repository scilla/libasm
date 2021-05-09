	global _ft_strdup
	
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy

	section .text
_ft_strdup:
	cmp		rdi, 0				; check NULL str
	jz		iserror
	push	rdi					; store pointer
	call	_ft_strlen			; str_size = ft_strlen(src);
	inc		rax					; dup = malloc(sizeof(char) * (str_size + 1));
	mov		rdi, rax
	call	_malloc
	pop		rsi
	mov		rdi, rax
	call	_ft_strcpy
	jmp		return
iserror:
	xor		rax, rax
return:
	ret