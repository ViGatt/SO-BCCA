[org 0x7c00]

mov bx, mensagem1
call imprime
call imprime_quebra

mov bx, mensagem2
call imprime
call imprime_quebra

mov dx, 0xcafe
call imprime_hexa
call imprime_quebra

mov dx, 0x1a3b
call imprime_hexa
call imprime_quebra

jmp $

%include "imprime.asm"
%include "imprime_hexa.asm"

mensagem1:
    db "Bem-vindo(a) ao UNimarIX 0.1", 0

mensagem2:
    db "Sistema Operacional do 6B BCC", 0

mensagem3:
    db "Teste"

times 510-($-$$) db 0
dw 0xaa55