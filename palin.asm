.model small
.stack 64h
.data
    msg1 db "Enter the string:$"
    yespal db "Palindrome$"
    nopal db "Not Palindrome$"
    string db 20 dup(?)
.code
    mov ax,@data
    mov ds,ax

    mov dx,offset msg1
    mov ah,09h
    int 21h

    mov si,offset string;

    read:
    mov ah,01h
    int 21h
    mov [si],al
    inc si
    cmp al,0dh
    jne read
    dec si
    mov [si],'$'

    dec si

    mov di,offset string

    paloop:
    mov bh,[di]
    mov bl,[si]
    cmp bh,bl
    jne nope
    dec si
    inc di
    cmp di,si
    jl paloop
    jmp yes

    yes:
    mov dx, offset yespal
    mov ah,09h
    int 21h
    jmp exit

    nope:
    mov dx,offset nopal
    mov ah,09h
    int 21h
    jmp exit

    exit:
    mov ah,4ch
    int 21h
end