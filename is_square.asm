%include "../include/io.mac"

section .text
    global is_square
    extern printf
is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
   
    ;; Your code starts here
for:
   mov edx, -1
label:
   inc edx
   mov esi, edx ; pt a calcula patratul in esi
   imul esi, esi
   cmp esi, [ebx + 4*(eax-1)] ; compara patratul cu valoarea din vector
   jl label ; cauta un patrat perfect mai mare
   cmp esi, [ebx + 4*(eax-1)] ; compara patratul cu valoarea
   jne not_square ; daca nu sunt egale, patratul e mai mare, deci nu e pp
   mov [ecx+ 4 * (eax-1)], dword 1 ; daca e pp, pune 1 in vector
   jmp repet
not_square:
   mov [ecx + 4*(eax-1)], dword 0
repet:
   dec eax ; treci la elementul precedent din vector
   cmp eax, 0 ; daca nu s a terminat vectorul, repeta procesul
   jg for



    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
