; int studentStrncmp(char *str1, char *str2, int n)
; calling convention: x64 Linux (MEMORIZE THE FIRST FOUR FOR BOARD!!)

section .text
global studentStrncmp

; Implement your own version of strncmp
; Compare two strings up to n characters

; int studentStrncmp(char *str1, char *str2, int n)
; calling convention: x64 Linux


studentStrncmp:
    ; Your implementation goes here
    test rdx, rdx ;thinking rdx = n 
    je match
    mov al, [rdi]
    cmp al, [rsi]
    jne noMatch

    inc rdi
    inc rsi
    dec rdx 
    jmp studentStrncmp

match:
    mov rax, 0
    ret 

noMatch:
    mov rax, 1
    ret 


