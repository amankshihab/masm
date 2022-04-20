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

    mov si,offset string
    mov cl,00h
    pushloop:
    push [si]
    inc si
    inc cl
    cmp [si],'$'
    jnz pushloop

    mov di,offset strrev
    poploop:
    pop [di]
    inc di
    dec cl
    jnz poploop
    mov [di],'$'

    mov dx,offset strrev
    mov ah,09H
    int 21H
end