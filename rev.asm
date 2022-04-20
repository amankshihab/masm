.model small
.stack 64h
.data
    msg db "Enter the number$"
.code
    mov ax,@data
    mov ds,ax

    mov dx,offset msg
    mov ah,09H
    int 21H

    mov ah,01h
    int 21H

    sub al,30h
    mov bh,10
    mul bh
    mov bl,al

    mov ah,01h
    int 21H

    sub al,30h
    add bl,al

    mov bh,04
    ror al

    mov bh,0ah

    div bh

    add bh,30h
    mov dl,bh
    mov ah,02h
    int 21H

    add al,30h
    mov dl,al
    mov ah,02h
    int 21H

    mov ah,4ch
    int 21H
end