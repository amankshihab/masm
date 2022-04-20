.model small
.stack 100
.data
        msg1 db 'Enter number:$'
        msg2 db 0ah, 'Sum is $'
read macro
		mov dx, offset msg1
        mov ah,09
        int 21h

        mov ah,01h
        int 21h
        sub al,30h
endm
.code
        mov ax,@data
        mov ds,ax

        read
        mov bl,al

        read
        add bl,al
        add bl,30h

        mov dx, offset msg2
        mov ah,09
        int 21h

        mov ah,02h
        mov dl,bl
        int 21h

        mov ah,4ch
        int 21h

end
