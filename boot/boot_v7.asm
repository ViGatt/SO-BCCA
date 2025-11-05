mov ah, 0x0e ; rotina de impressão na tela
mov al, [letra]
int 0x10 ; interrupção da bios

mov bx, 0x7c0 ; posição do boot sector na memória (???)
mov ds, bx;
mov al, [letra]
int 0x10

mov al, [es:letra]
int 0x10

mov bx, 0x7c0
mov es, bx
mov al, [es:letra]
int 0x10

jmp $

letra:
    db "U"

times 510-($-$$) db 0
dw 0xaa55