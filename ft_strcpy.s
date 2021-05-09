
;char	*ft_strcpy(char *dest, char *src)
;{
;	int i;
;
;	i = 0;
;	while (src[i] != '\0')
;	{
;		dest[i] = src[i];
;		i++;
;	}
;	dest[i] = '\0';
;	return (dest);
;}

section .text
	global _ft_strcpy

_ft_strcpy:
	xor		r10, r10						; i = 0
copy:
	mov		r11b, BYTE [rsi + r10]		; dest[i] = src[i];
	mov		BYTE [rdi + r10], r11b
	inc		r10							; i++
	cmp		BYTE [rsi + r10], 0
	jne		copy
return:
	mov		BYTE [rdi + r10], 0			; dest[i] = '\0';
	mov		rax, rdi
	ret