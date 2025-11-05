[org 0x7c00]
mov bp, 0x8000 ; BASE POINTER: endereço da base da pilha
mov sp, bp ; SP: STACK POINTER ponteiro do topo da pilha
; no início, a pilha está vazia, então o topo é igual à base

mov bx, 0x9000 ; posição da memória onde ficarão os
; setores lidos no disco (ES:BX 0x0000:0x9000)
mov dh, 2 ; queremos ler dois setores
; BIOS vai setar auotmaticamente DL para o dispositivo de boot
mov dl, 0x80 ; número do hd

call ler_disco

mov dx, [0x9000] ; começo do setor 2
call imprime_hexa
call imprime_quebra

mov dx, [0x9000 + 512] ; começo do setor 3
call imprime_hexa
call imprime_quebra

jmp $

%include "imprime.asm"
%include "imprime_hexa.asm"
%include "ler_disco.asm"

; preenche o setor de boot e no final coloca o magic number
times 510-($-$$) db 0
dw 0xaa55

; conteúdo para o segundo setor
times 256 dw 0xcafe
; conteúdo para o terceiro setor
times 256 dw 0xfada