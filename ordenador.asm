.model small
.data 
   arr db "043112$"    
   pulalinha db 0Ah, 0Dh, "$"
.code
    lea ax, @data
    mov ds, ax
printStr MACRO str
    lea dx, str
    mov ah, 09h
    int 21h
endm
INICIO:
    cmp arr[si+1], "$"
    je FIM
    mov al, arr[si + 1]
    cmp arr[si], al
    ja SWAP
    inc si 
    jmp inicio
SWAP:
    mov ah, arr[si]    
    mov al, arr[si + 1]      
    mov arr[si + 1], ah      
    mov arr[si], al
    mov si, 00h  
    printStr arr  
    printStr pulalinha      
    jmp INICIO 
FIM:
    printStr arr
    mov ah, 4ch
    int 21h
end