;int	ft_strcmp(char *s1, char *s2)
;{
;	int i;
;
;	i = 0;
;	while (s1[i] == s2[i] && s1[i] != 0)
;		i++;
;	return ((unsigned char)s1[i] - (unsigned char)s2[i]);
;}

section .text
	global _ft_strcmp

_ft_strcmp:
	mov		r10, 0						; i = 0
	mov		rax, 0
	mov		r12, 0
	jmp		compare
increse:
	inc		r10
compare:
	mov		r11b, BYTE [rdi + r10]		; s1[i] != s2[i]
	cmp		r11b, BYTE [rsi + r10]
	jne		return_diff
	cmp		BYTE [rsi + r10], 0			; s1[i] == 0
	je		return
	jmp		increse
return_diff:
	mov		al, BYTE [rdi + r10]		; (unsigned char)s1[i] - (unsigned char)s2[i]
	mov		r12b, BYTE [rsi + r10]
	sub		rax, r12
return:
	ret