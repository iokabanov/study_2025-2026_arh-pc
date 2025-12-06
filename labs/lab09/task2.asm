%include 'in_out.asm'

SECTION .data
div: DB 'Результат: ',0

SECTION .text
GLOBAL _start
_start:

; ---- Вычисление выражения (3+2)*4+5
    mov eax,3    ; загружаем первое число в EAX (для будущей работы с mul)
    mov ebx,2    ; второе число в EBX
    add eax,ebx 
    mov ecx,4
    mul ecx      
    add eax,5    ; прибавляем 5 к EAX. EAX = 20 + 5 = 25
    mov edi,eax  ; сохраняем результат в EDI для вывода
    
; ---- Вывод результата на экран
mov eax,div
call sprint
mov eax,edi
call iprintLF

call quit
