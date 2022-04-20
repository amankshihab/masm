.model small
.stack 100h
.data
    msg db "Enter the string: $"
    string db 20 dup(?)
    strrev db ?
.code
    mov ax,@data
    mov ds,ax

    mov dx,offset msg
    mov ah,09H
    int 21H

    mov si,offset string
    readloop:
    mov ah,01h
    int 21H
    mov [si],al
    inc si
    cmp al,0dh
    jnz readloop
    dec si
    mov [si],'$'

    mov dx,offset string
    mov ah,09h
    int 21h

    mov dx,0ah
    mov ah,02h
    int 21h

    mov cl,00h
    mov si,offset string
    pushloop:
    cmp [si],'$'
    jz poploopstart
    push [si]
    inc si
    inc cl
    jmp pushloop

    poploopstart:
    mov di,offset strrev
    poploop:
    pop dx
    ;xor dh,dh
    mov [di],dx
    inc di
    dec cl
    cmp cl,00h
    jnz poploop
    mov [di],'$'

    mov dx,offset strrev
    mov ah,09h
    int 21h

    mov ah,4ch
    int 21h
end