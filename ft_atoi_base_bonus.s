section .text
	global _ft_atoi_base
	extern _ft_strlen

_ft_atoi_base:
	push	rdi				; str
	push	rsi				; base
	mov		rdi, rsi
	call	_ft_strlen
	pop		rsi
	pop		rdi
	mov		r12, rax		; base_len
	cmp		r12, 2			; base_len >= 2
	jl		wrong_base
	mov		rcx, r12		; set loop counters to check duplicates
	mov		r13, r12
	dec		rcx
	dec		r13
check_duplicates:
	dec		r13
	mov		dl, BYTE [rsi + r13]
	cmp		BYTE [rsi + rcx], dl
	je		wrong_base
	cmp		r13, 0
	jg		check_duplicates
	cmp		BYTE [rsi + rcx], 9
	je		wrong_base
	cmp		BYTE [rsi + rcx], 10
	je		wrong_base
	cmp		BYTE [rsi + rcx], 11
	je		wrong_base
	cmp		BYTE [rsi + rcx], 12
	je		wrong_base
	cmp		BYTE [rsi + rcx], 13
	je		wrong_base
	cmp		BYTE [rsi + rcx], 32
	je		wrong_base
	cmp		BYTE [rsi + rcx], 45
	je		wrong_base
	cmp		BYTE [rsi + rcx], 43
	je		wrong_base
	dec		rcx
	mov		r13, rcx
	cmp		rcx, 0
	jne		check_duplicates
first_chr_check:
	xor		rcx, rcx
	cmp		BYTE [rsi + rcx], 0
	je		wrong_base
	cmp		BYTE [rsi + rcx], 9
	je		wrong_base
	cmp		BYTE [rsi + rcx], 10
	je		wrong_base
	cmp		BYTE [rsi + rcx], 11
	je		wrong_base
	cmp		BYTE [rsi + rcx], 12
	je		wrong_base
	cmp		BYTE [rsi + rcx], 13
	je		wrong_base
	cmp		BYTE [rsi + rcx], 32
	je		wrong_base
	cmp		BYTE [rsi + rcx], 45
	je		wrong_base
	cmp		BYTE [rsi + rcx], 43
	je		wrong_base
	xor		rax, rax
	jmp		check_spaces
skip_spaces:
	inc		rcx
check_spaces:
	cmp		BYTE [rdi + rcx], 0
	je		return
	cmp		BYTE [rdi + rcx], 9
	je		skip_spaces
	cmp		BYTE [rdi + rcx], 10
	je		skip_spaces
	cmp		BYTE [rdi + rcx], 11
	je		skip_spaces
	cmp		BYTE [rdi + rcx], 12
	je		skip_spaces
	cmp		BYTE [rdi + rcx], 13
	je		skip_spaces
	cmp		BYTE [rdi + rcx], 32
	je		skip_spaces
	xor		rdx, rdx				; is_neg
	jmp		check_sign
invert_sign:
	xor		rdx, 1
skip_sign:
	inc		rcx
check_sign:
	cmp		BYTE [rdi + rcx], 0
	je		return
	cmp		BYTE [rdi + rcx], 45
	je		invert_sign
	cmp		BYTE [rdi + rcx], 43
	je		skip_sign
	xor		rax, rax				; result
	xor		r13, r13				; r13 = base index ; rcx = str index
	jmp		loop_add
next_add:
	inc		rcx
	xor		r13, r13
	jmp		loop_add
incr_add:
	inc		r13
loop_add:
	cmp		r13, r12				; end of base
	je		return
	mov		r14b, BYTE [rsi + r13]
	cmp		BYTE [rdi + rcx], r14b
	jne		incr_add
	cmp		rdx, 0
	je		add_pos
	jmp		add_neg
add_pos:
	imul	rax, r12
	add		rax, r13
	jmp		next_add
add_neg:
	imul	rax, r12
	sub		rax, r13
	jmp		next_add
wrong_base:
	mov		rax, 0
return:
	ret