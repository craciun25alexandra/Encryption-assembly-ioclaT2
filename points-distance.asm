%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

points_distance:
    ;; DO NOT MODIFY
    
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    xor edx, edx
    mov dx, word [ebx + point.x] ; ia val lui xA
    cmp dx, word [ebx + point_size + point.x] ; ; compara cu val lui xB
    jg xfirst ; daca xA > xB
    cmp dx, word [ebx + point_size + point.x] ; compara
    jl xlast ; daca xB > xA
    mov dx, word [ebx + point.y] ; altfel, trebuie comparate y -urile
    cmp dx, word [ebx + point_size + point.y]
    jg yfirst ; daca yA > yB
    mov dx, word [ ebx + point_size + point.y]
    sub dx, word [ebx + point.y]
    jmp finish 

xfirst:
   sub dx, word [ebx + point_size + point.x] ; scade din cel mai mare pe cel mai mic
   jmp finish
xlast:
   mov dx, word [ ebx + point_size + point.x] ; muta val celui mai mare
   sub dx, word [ ebx + point.x] ; scade val mai mica
   jmp finish
yfirst:
   sub dx, word[ ebx + point_size + point.y] ; scade Y mic din Y mare
   jmp finish
finish:
  
    mov [eax], edx ; copiaza in adresa ceruta
    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY
