.model small
.stack

read macro str
mov si,offset str
re:       
        mov ah,01h
        int 21h
        mov [si],al
        inc si
        inc cl
        cmp al,0dh
        jnz re
endm

print macro msg
mov dx,offset msg
mov ah,09
int 21h
endm

.data
msg1 db 0ah,0dh,"Enter a string: $"
msg2 db 0ah,0dh,"String is palindrome $"
msg3 db 0ah,0dh,"String is not palindrome $"
str db 20h dup ('$')

.code
mov ax,@data
mov ds,ax
mov es,ax

print msg1
mov cl,00h
read str
dec si
mov di,offset str
mov al,cl
mov cl,02h
div cl
mov cl,al

loop1:
        cmp cl,00h
        jz pal
        mov ah,[si]
        cmp ah,[di]
        jnz notpal
        dec si
        inc di
        dec cl
        jmp loop1
pal:    print msg2
        jmp exit
notpal: print msg3
exit:   mov ah,4ch
        int 21h
end