%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
    dec ecx ; ultimul indice
for:
    xor edx, edx
    mov dx, word [eax + (ecx-1)*point_size +point.x] ; cel mai din dreapta elem
    cmp dx, word [eax + ecx*point_size + point.x] ; precedentul lui
    jg xfirst ; algoritmul de la 2.1
    cmp dx, word [eax + ecx*point_size + point.x]
    jl xlast
    mov dx, word [eax + (ecx-1)*point_size +point.y]
    cmp dx, word [eax + ecx*point_size + point.y]
    jg yfirst
    mov dx, word [ eax + ecx*point_size + point.y]
    sub dx, word [eax + (ecx-1)*point_size +point.y]
    jmp finish

xfirst:
   sub dx, word [eax + ecx*point_size + point.x]
   jmp finish
xlast:
   mov dx, word [ eax + ecx*point_size + point.x]
   sub dx, word [ eax + (ecx-1)*point_size + point.x]
   jmp finish
yfirst:
   sub dx, word[ eax + ecx*point_size + point.y]
   jmp finish
finish:

    mov [ebx + 4*(ecx-1)], edx
    loop for


    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
