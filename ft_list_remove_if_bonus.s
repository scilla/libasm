;void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)())

section .text
	global _ft_list_remove_if
	extern _malloc
	extern _free

; rdi = begin_list
; r9  = *begin_list
; rsi = data_ref
; rdx = cmp
; rcx = precedent

_ft_list_remove_if:
	cmp		QWORD [rdi], 0
	je		return
	mov		r9, [rdi]
	mov		rcx, rdi
compare:
	push	r9
	push	rsi
	push	rdx
	push	rcx
	mov		rdi, [r9]
	call	rdx
	pop		rcx
	pop		rdx
	pop		rsi
	pop		r9
	cmp		rax, 0
	jne		next
remove:
	mov		r10, [r9 + 8]
	mov		r11, r9
	mov		[rcx], r10
	mov		r9, [r9 + 8]

	push	r9
	push	rsi
	push	rdx
	push	rcx

	mov		rdi, r11
	call	_free

	pop		rcx
	pop		rdx
	pop		rsi
	pop		r9

	cmp		QWORD r9, 0
	je		return
	jmp		compare
next:
	mov		rcx, r9
	add		rcx, 8
	cmp		QWORD [rcx], 0
	je		return
	mov		r9, [rcx]
	jmp 	compare
return:
	ret