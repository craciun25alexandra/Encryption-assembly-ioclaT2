%include "../include/io.mac"

section .text
    global spiral
    extern printf
section .data
   top dd 0
   bottom dd 0
   left dd 0
   right dd 0
   contor dd 0
   n dd 0
   i dd 0
; void spiral(int N, char *plain, int key[N][N], char *enc_string);
spiral:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; N (size of key line)
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; key (address of first element in matrix)
    mov edx, [ebp + 20] ; enc_string (address of first element in string)
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
   mov dword [top], 0 ; topul 0*
   mov dword [left], 0
   dec eax ; indexarea pana la n-1 coloane/ randuri
   mov [bottom], eax
   mov [right], eax
   inc eax ; restabileste N
   mov [n], eax ; nr coloanelor
   imul eax, eax ; nr de caractere 
   mov [contor], eax
   mov edi, 0 ; primul indice
   push edi
while:
   mov edi, [left] ;  i din primul for pt parcurgerea de la stanga la dreapta
   mov [i], edi ; ia valoarea lui left
l1:
   xor eax, eax
   xor esi, esi
   xor edi, edi
   mov edi, [n]
   imul edi, [top]
   add edi, [i] ; indicele corespunzator elementului cautat in matrice
   mov esi, [ecx + 4*edi] ; elementul din matrice, matrice de int uri (4 octeti)
   pop edi ; in stiva sunt indicii stringului
   add [ebx + edi], esi ; este adaugata valoarea elementului
   mov al, [ebx + edi] ; rezultatul se muta in al(1 octet) pt a se copia la adresa data
   mov [edx + edi], eax
   inc edi
   push edi ; indicele urmator
   mov edi, [i] ; i++
   inc edi
   mov [i], edi
   cmp edi, [right] ; verifica capul forului, daca se mai poate merge in dreapta
   jle l1
   add dword [top], 1 ; incrementeaza top ul, a fost afisata prima linie
   mov edi , [top]
   mov [i], edi ; se verifica daca sunt elemente pentru parcurgerea in jos
   cmp edi, [bottom]
   jg end
l2:
   xor eax, eax
   xor esi, esi
   xor edi, edi
   mov edi, [n]
   imul edi, [i]
   add edi, [right]
   mov esi, [ecx + 4*edi] ; calculeaza indicele pt matrice
   pop edi ; ia indicele caracterului in string
   add [ ebx + edi], esi
   mov al, [ebx + edi]
   mov [edx + edi], eax
   inc edi
   push edi
   mov edi, [i]
   inc edi
   mov [i], edi
   cmp edi, [bottom] ; daca se mai poate merge in jos
   jle l2
   sub dword [right], 1 ; decrementeaza right ul, a fost afisata ultima col
   mov edi, [right]
   mov [i], edi
   cmp edi, [left] ; verifica daca se poate merge in stanga
   jl end
l3:
   xor eax, eax
   xor edi, edi
   xor esi, esi
   mov edi, [n]
   imul edi, [bottom]
   add edi, [i]
   mov esi, [ecx + 4*edi]
   pop edi
   add [ebx + edi], esi
   mov al, [ebx + edi]
   mov [edx + edi], eax
   inc edi
   push edi
   mov edi, [i]
   dec edi
   mov [i], edi
   cmp edi, [left]
   jge l3
   sub dword [bottom], 1
   mov edi, [bottom]
   mov [i], edi
   cmp edi, [top]
   jl end
l4:

   xor eax,eax
   xor edi, edi
   xor esi, esi
   mov edi, [n]
   imul edi, [i]
   add edi, [left]
   mov esi, [ecx + 4*edi]
   pop edi
   add [ebx + edi] , esi
   mov al, [ebx + edi]
   mov [edx + edi], eax
   inc edi
   push edi
   mov edi, [i]
   dec edi
   mov [i], edi
   cmp edi, [top]
   jge l4
   add dword [left],1
   pop edi
   push edi
   cmp edi, [contor]
   jne while   
end:
   pop edi ; nr de popuri = pushuri
    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY

