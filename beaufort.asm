%include "../include/io.mac"

section .text
    global beaufort
    extern printf
section .data
    i dd 0 ; contor pt primul string
    j dd 0 ; contor pt al 2 lea 
; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
    mov [i], eax
    mov [j], ecx
    xor ecx, ecx ; incepe de la inceputul lui key, deci ecx, contorul, e 0
    xor edi, edi ; idem pentru plain
for:
    xor eax, eax
    mov al, [edx + ecx] ; muta in al caracterul din key
    sub al, byte [ebx + edi] ; scade caracterul din plain
    cmp al, 0
    jge l1
    add al, 26 ; daca diferenta e negativa, se adauga 26
l1:
    add eax, 65 ; se adauga 65, codul ascii al lui A, pt a forma litera
    mov [esi + edi], eax ; se pune in adresa data
    inc edi ; trece la caracterul urmator din plain
    inc ecx ; trece la caracterul urmatorul din key
    mov eax, [j]
    cmp ecx, eax ; compara len ul lui key cu al sau contor
    jl compare_lenP
    mov ecx, 0 ; daca e mai mare contorul, se reseteaza indicele la 0
compare_lenP:
    mov eax, [i]
    cmp edi, eax
    jl for ; daca mai sunt litere in string, se reia pt urm caracter
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
