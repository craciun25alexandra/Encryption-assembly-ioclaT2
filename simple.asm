 %include "../include/io.mac"

section .text
    global simple
    extern printf

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY

    ;; Your code starts here
    cmp edx, 26 ; daca trebuie adunat cu 26, stringul nu se va schimba
    jge label_end
    cmp edx, 0 ; daca trebuie mutat cu 0 pozitii, nu se executa nimic
    je label_end
    mov ebx, ecx ; copiaza len ul in ebx
label_again:
    mov ecx, ebx
    cmp edx, 0 ; daca nu mai sunt pasi de scazut
    je label_end
    dec edx ; se scade cu cate o unitate
label_start:
    cmp byte [esi + ecx -1], 'Z' ; caz special pt Z
    je inc_z
    jmp inc_basic

inc_z:
    mov byte [esi +ecx -1], 'A' ; schimba Z ul din string in A
    dec ecx   ; trece la litera precedenta, procesul incepand de la ultima lit
    jmp cont
inc_basic:
    inc byte [esi + ecx -1] ; creste cu o unitate litera
    dec ecx   ; trece la lit precedenta
cont:
    cmp ecx, 0 ; daca mai sunt litere in string, se verifica
    jne label_start
    jmp label_again  ; daca mai sunt pasi de scazut
label_end:

    mov al, [esi + ecx-1] ; copiaza caracterul in al(un byte)
    mov [edi + ecx-1], al ; copiaza in adresa data caracterul
    loop label_end        ; tot esi ul

    ;; Your code ends here
    
    ;; DO NOT MODIFY

    popa
    leave
    ret
    
    ;; DO NOT MODIFY
