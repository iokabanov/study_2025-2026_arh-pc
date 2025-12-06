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
    
    call _calc_f 
    add esi, eax 
    loop next    

_end:
    mov eax, msg 
    call sprint
    mov eax, esi 
    call iprintLF
    
    call quit

; -----------------------------------------------------------------
; Подпрограмма вычисления функции f(x) = 30x - 11
; -----------------------------------------------------------------
_calc_f:
    imul eax, 30 ; Умножаем x на 30
    sub eax, 11  ; Вычитаем 11
    ret          ; Возврат управления в основную программу
