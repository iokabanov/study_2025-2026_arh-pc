; ----------------------------------------------------
; Программа вычисляющая (10x-5)^2
; ----------------------------------------------------

%include 'in_out.asm'

SECTION .data
    msg: DB 'Введите x: ',0
    div: DB 'Результат: ',0

SECTION .bss
    rez: RESB 80
    x: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, msg
    call sprint

    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi

    mov ebx, 10
    mul ebx
    sub eax, 5
    mul eax
    mov [rez], eax

    mov eax, div
    call sprint
    mov eax, [rez]
    call iprintLF
    call quit