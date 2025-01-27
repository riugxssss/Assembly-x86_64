section .data
        msg db "Loop to 10", 10
        msg.lenght equ $ - msg
;constant
write equ 1
sys_exit equ 60
stdout equ 1
; 
%macro printf 1
        mov rax, stdout
        mov rdi, write
        mov rsi, %1
        mov rdx, %1.lenght
        syscall
%endmacro
;exit macro
%macro exit 1
        mov rax, sys_exit
        mov rdi, %1
        syscall
%endmacro
  
section .text
        global _start
_start: 
        xor rbx, rbx
        call loop
        exit 0
loop:
        printf msg
        inc rbx
        cmp rbx, 10
        jl loop
        ret
