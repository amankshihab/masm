.model small
.stack 64h
.data
    string db "Hello World$"
    msg db 0ah,"Enter the character:$"
.code
    mov ax,@data
    mov ds,ax

    mov cl,00h
    mov si,offset string
    lenloop:
    cmp [si],'$'
    jz disp
    inc si
    inc cl
    jmp lenloop

    disp:
    mov dx,offset msg
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h

    mov dl,00h
    mov si,offset string
    comploop:
    cmp [si],al
    jz count
    comeback:
    inc si
    dec cl
    cmp cl,00h
    jz exit
    jnz comploop

    count:
    inc dl
    jmp comeback

    exit:
    mov ah,02h
    add dl,30h
    int 21h
    mov dl,09h
    mov ah,02h
    int 21h
    mov dx,offset string
    mov ah,09h
    int 21h
    mov ah,4ch
    int 21h
               
end