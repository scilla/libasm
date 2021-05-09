; read(int fildes, void *buf, size_t nbyte);
; fildes = rdi, buf = rsi, nbyte = rdx

section	.text
	global	_ft_read
	extern	___error

_ft_read:								; fd = rdi, buffer = rsi, bytes = rdx
	mov		rax, 0x2000003
	syscall
	jc		iserror
	jmp		return
iserror:
	push	rax
	call	___error
	pop		r10
	mov		[rax], r10
	mov		rax, -1
return:
	ret