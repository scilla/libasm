;void	ft_list_sort(t_list **begin_list, int (*cmp)())

section .text
	global _ft_list_sort
	extern _malloc
	extern _ft_list_size

; rdi = begin_list
; r9  = *begin_list
; r11 = rsi = cmp
; rcx = previous
; rdx = list_len
; r8  = origin

_ft_list_sort:
	cmp		QWORD [rdi], 0
	je		return
	mov		r11, rsi
	mov		r8, rdi
	
	push	r8
	push	r11
	push	rdi

	mov		rdi, [rdi]
	call	_ft_list_size
	mov		rdx, rax

	pop		rdi
	pop		r11
	pop		r8
start:
	mov		r9, [rdi]
	mov		rcx, rdi
compare:
	mov		r10, [r9 + 8]
	cmp		r10, 0
	je		is_last

	mov		rsi, [r10]
	mov		rdi, [r9]

	push	r8
	push	r9
	push	r11
	push	rcx
	push	rdx

	call	r11

	pop		rdx
	pop		rcx
	pop		r11
	pop		r9
	pop		r8

	cmp		rax, 0
	jl		next
swap:
	mov		r13, [r9 + 8]
	mov		[rcx], r13
	mov		r12, [r13 + 8]
	mov		[r13 + 8], r9
	mov		[r9 + 8], r12
	mov		rcx, r13
	add		rcx, 8
	mov		r9, [rcx]
	jmp		compare
next:
	mov		rcx, r9
	add		rcx, 8
	cmp		QWORD [rcx], 0
	je		is_last
	mov		r9, [rcx]
	cmp		QWORD [r9 + 8], 0
	je		is_last
	jmp 	compare
is_last:
	mov		rdi, r8
	dec		rdx
	cmp		rdx, 0
	jne		start
return:
	ret