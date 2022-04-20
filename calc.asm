.model small
.stack 64h
print macro string
    mov dx,offset string
    mov ah,09h
    int 21h
endm

read macro num
    mov ah,01h
    int 21h
    sub al,30h

    mov num,al
endm

printal macro

    mov dx,offset msgres
    mov ah,09H
    int 21H

    add al,30h
    mov dl,al
    mov ah,02h
    int 21h

    jmp mainloop
endm
.data
    msg1 db 0ah,0ah,"1.Addition$"
    msg2 db 0ah,"2.Subtraction$"
    msg3 db 0ah,"3.Division$"
    msg4 db 0ah,"4.Multiplication$"
    msg5 db 0ah,"Enter your choice:$"
    msgnum1 db 0ah,"Enter num1:$"
    msgnum2 db 0ah,"Enter num2:$"
    msgres db 0ah,"Result is $"
    num1 db ?
    num2 db ?
.code

    mov ax,@data
    mov ds,ax

    mainloop:
    mov al,00h
    print msgnum1
    read num1

    print msgnum2
    read num2

    print msg1
    print msg2
    print msg3
    print msg4
    print msg5

    mov ah,01h
    int 21h
    sub al,30h

    cmp al,01h
    je addition

    cmp al,02h
    je subtraction

    cmp al,03h
    je division

    cmp al,04h
    je multiplication

    cmp al,05h
    je exit

    addition:
    mov al,num1
    mov bl,num2
    add al,bl
    printal

    subtraction:
    mov al,num1
    sub al,num2
    printal

    division:
    mov ah,00h
    mov al,num1
    div num2
    printal

    multiplication:
    mov al,num1
    mul num2
    printal

    exit:
    mov ah,4ch
    int 21h
end