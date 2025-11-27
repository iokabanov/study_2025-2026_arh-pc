%include 'in_out.asm'

SECTION .data
msg db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx 
    pop edx 
    sub ecx, 1 
    
    mov esi, 0 

next:
    cmp ecx, 0h 
    jz _end     
    
    pop eax      
    call atoi   
    
    imul eax, 30 ; Умножаем x на 30. Теперь eax = 30*x
    sub eax, 11  ; Вычитаем 11. Теперь eax = 30*x - 11
    add esi, eax ; Добавляем результат функции f(x) к общей сумме
                 ; esi = esi + (30x - 11)
    loop next    

_end:
    mov eax, msg 
    call sprint
    mov eax, esi ; Переносим накопленную сумму в eax для вывода
    call iprintLF
    
    call quit
