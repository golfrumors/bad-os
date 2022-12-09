; infinite loop (e9 fd ff)
loop:
	jmp loop

; fill with 510 zeros - prev
times 510-($-$$) db 0
;magic!
dw 0xaa55
