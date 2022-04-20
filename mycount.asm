.model small
.stack 64h
.data
    msg1 db 0ah,"Enter the number of elements: $"
    msg2 db 0ah,"Enter the numbers: $"
    msg3 db 0ah,"Sum of the elements is $"

    arr db 9 dup(?)
.code

    mov ax,@data
    mov ds,ax

    mov dx,offset msg1
    mov ah,09h
    int 21h

    mov ah,01h
    int 21h
    sub al,30h

    mov cl,al
    mov ch,cl

    mov dx,offset msg2
    mov ah,09h
    int 21h

    mov si,offset arr

    readloop: mov ah,01h
              int 21h

              sub al,30h

              mov [si],al
              inc si

              dec cl

              cmp cl,00h

              jnz readloop
              
              mov si,offset arr
              mov al,[si]
              inc si
              dec ch

    addloop:  add al,[si]
              inc si

              dec ch
              cmp ch,00h
              jnz addloop

              mov dl,al

              mov ah,02h
              int 21h

              mov ah,4ch
              int 21h
end