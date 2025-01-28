sys_exit equ 60
stdin equ 0
stdout equ 1
sys_write equ 1
sys_read equ 0
sys_nanosleep equ 35
section .data
        numb dq 2, 0
        msg db "Before drugs", 10
        msg.g equ $ - msg
        msg2 db "After drugs", 10
        msg2.g equ $ - msg2
%macro printf 1
        mov rax, sys_write
        mov rdi, stdout
        mov rsi, %1
        mov rdx, %1.g
        syscall
%endmacro
%macro sleep 1
        mov rax, sys_nanosleep
        mov rdi, %1
        mov rsi, 0
        syscall
%endmacro
%macro exit 0
        mov rax, sys_exit
        mov rdi, stdin
        syscall
%endmacro
section .text
        global _start
_start:
        printf msg
        sleep numb
        syscall
        printf msg2
        exit
