; This code will print hello world 4 times
; simple x86 linux asm loop

section .data
    msg db "Hello World", 0xA
    len equ $ - msg
    arr db 1,2,3,4
section .text
    global _start
    
_start:
    mov esi, 0
    
    
print_hello:
    cmp esi, 4    
    je end           ; jump to end if cmp is 1
    mov edx, len     ; moves length of the string to edx
    mov ecx, msg     ; moves string to ecx
    mov ebx, 1       ; moves file descriptor to ebx 1 means output
    mov eax, 4       ; moves id 4 to eax
    int 0x80         ; invoke sys call
    inc esi          ; increment esi
    jmp print_hello  ; jump to print_hello
    
end:
    mov eax, 1 ; moves id 1 in eax register 
    mov ebx, 0 ; moves exit code in ebx register 
    int 0x80 ; invoke kernel sys call
