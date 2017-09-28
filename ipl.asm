ORG 0x7c00

jmp entry
db 0x90

db "HELLOIPL"
dw 512
db 1
dw 1
db 2
dw 224
dw 2880
db 0xf0
dw 9
dw 18
dw 2
dd 0
dd 2880
db 0, 0, 0x29
dd 0xffffffff
db "HELLO-OS   "
db "FAT12   "
RESB 18

entry:
    mov ax, 0
    mov ss, ax
    mov sp, 0x7c00
    mov ds, ax
    mov es, ax

    mov si, msg

putloop:
    mov al, [si]
    add si, 1
    cmp al, 0
    je fin

    mov AH, 0x0e
    mov bx, 15
    int 0x10
    jmp putloop

fin:
    hlt
    jmp fin

msg:
    db 0x0a, 0x0a
    db "This is bootloader!!"
    db 0x0a
    db 0

    resb 510 - ($ - $$)
    
    db 0x55, 0xaa