.model small
.stack 64h
.code
    INCLUDE 'testp.inc'
    call he

    mov ah,4ch
    int 21h
end