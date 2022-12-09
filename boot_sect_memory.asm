mov ah, 0x0e

; fails because tries to print pointer
mov al, "1"
int 0x10
mov al, the_secret
int 0x10

; triest to print memory addres, but it overlaps with bootsector
mov al, "2"
int 0x10
mov al, [the_secret]
int 0x10

;add bios starting offset of 0x7c00 to the mem address of the_secret
;dereference the contents of pointer
;need to use a different regiser since al is used for printing, and source and destination cannot be the same
mov al, "3"
int 0x10
mov bx, the_secret
add bx, 0x7c00
mov al, [bx]
int 0x10

;shortcut since we know that the_secret is at 0x2d
;bad because we don't want to hardcode addresses/offsets
mov al, "4"
int 0x10
mov al, [0x7c2d]
int 0x10

jmp $ ;inf loop

the_secret:
	db "X"

;pad zeros and bios num
times 510-($-$$) db 0
dw 0xaa55
