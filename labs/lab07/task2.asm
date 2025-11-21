%include 'in_out.asm'

section .data
    msg_x db 'Введите x: ', 0h
    msg_a db 'Введите a: ', 0h
    msg_res db 'Результат f(x): ', 0h

section .bss
    x resd 1        ; Переменная для x
    a resd 1        ; Переменная для a
    res resd 1      ; Переменная для результата
    buffer resb 20  ; Буфер для ввода строк

section .text
    global _start

_start:
    ; --- Ввод x ---
    mov eax, msg_x
    call sprint     ; Вывод "Введите x: "
    
    mov ecx, buffer
    mov edx, 20
    call sread      ; Ввод строки
    
    mov eax, buffer
    call atoi       ; Преобразование строки в число
    mov [x], eax    ; Сохраняем x

    ; --- Ввод a ---
    mov eax, msg_a
    call sprint     ; Вывод "Введите a: "
    
    mov ecx, buffer
    mov edx, 20
    call sread      ; Ввод строки
    
    mov eax, buffer
    call atoi       ; Преобразование строки в число
    mov [a], eax    ; Сохраняем a

    ; --- Вычисление функции ---
    ; Сравниваем x и 4
    mov ecx, [x]
    cmp ecx, 4
    jge greater_or_equal ; Если x >= 4, прыгаем на метку умножения

    ; --- Ветка: x < 4 (Результат = x + 4) ---
    add ecx, 4       ; ecx = x + 4
    mov [res], ecx   ; Сохраняем результат
    jmp print_res    ; Пропускаем ветку умножения и идем к выводу

    ; --- Ветка: x >= 4 (Результат = a * x) ---
greater_or_equal:
    mov eax, [x]     ; Загружаем x в eax
    mov ebx, [a]     ; Загружаем a в ebx
    mul ebx          ; eax = eax * ebx (x * a)
    mov [res], eax   ; Сохраняем результат

    ; --- Вывод результата ---
print_res:
    mov eax, msg_res
    call sprint      ; Вывод "Результат f(x): "
    
    mov eax, [res]
    call iprintLF    ; Вывод числа
    
    call quit        ; Выход