.model small
.stack 64h
.data
    msg db "Enter the string:$"
    string db 20 dup(?)
    yespalmsg db "Palindrome$"
    nopalmsg db "Not Palindrome$"
.code
    mov ax,@data
    mov ds,ax

    mov dx,offset msg
    mov ah,09H
    int 21H

    mov di,offset string 
    readloop:
    mov ah,01h
    int 21H
    mov [di],al
    inc di
    cmp al,0dh
    jnz readloop
    dec di
    mov [di],'$'
    dec di

    mov si,offset string

    paloop:
    mov al,[di]
    cmp [si],al
    jne notpal
    inc si
    dec di
    cmp si,di
    jl paloop

    mov dx,offset yespalmsg
    mov ah,09H
    int 21H
    jmp exit

    notpal:
    mov dx,offset nopalmsg
    mov ah,09H
    int 21H

    exit:
    mov ah,4ch
    int 21H
end