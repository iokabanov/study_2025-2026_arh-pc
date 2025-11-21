%include 'in_out.asm'

section .data
    msg2 db "Наименьшее число: ",0h
    A dd 44
    B dd 74
    C dd 17

section .bss
    min resd 1  ; Резервируем место под переменную min (32 бита)

section .text
    global _start

_start:
; ---------- Записываем 'A' в переменную 'min' как начальное значение
    mov ecx, [A]    ; ecx = 44
    mov [min], ecx  ; min = 44

; ---------- Сравниваем текущий 'min' (A) и 'B'
    cmp ecx, [B]    ; Сравниваем 44 и 74
    jle check_C     ; Если ecx <= B, то ecx остается минимумом, переходим к проверке C
    mov ecx, [B]    ; Иначе (если B меньше), то ecx = B
    mov [min], ecx  ; Сохраняем новый минимум

; ---------- Сравниваем текущий 'min' и 'C'
check_C:
    cmp ecx, [C]    ; Сравниваем текущий минимум и 17
    jle fin         ; Если текущий минимум <= C, то идем на вывод
    mov ecx, [C]    ; Иначе (если C меньше), то ecx = C
    mov [min], ecx  ; Сохраняем C как итоговый минимум

; ---------- Вывод результата
fin:
    mov eax, msg2
    call sprint     ; Вывод сообщения 'Наименьшее число: '
    
    mov eax, [min]
    call iprintLF   ; Вывод числа из переменной min
    
    call quit       ; Выход