[org 0x7c00]

[section .text]
[bits 16]

global _start
_start:

    mov ax, 3
    int 0x10

    xchg bx, bx

    mov ah, 0x0e
    mov bl, 0x01
    mov al, 'l'
    int 0x10

    ;如果不写个循环，那么输出 “hello，world” ，就要一个个的写，很麻烦。

    mov si, msg
    call print

    jmp $

print:
    mov ah, 0x0e
    mov bl, 0x01
.loop:
    mov al, [si]
    cmp al, 0
    jz .done    ;判断si指向的msg地址，地址中的字符为0,如果相等就跳出print，结束
    int 0x10

    inc si
    jmp .loop

.done:
    ret

msg:
    db "hello, world", 10, 13, 0

times 510 - ($ - $$) db 0
db 0x55, 0xaa