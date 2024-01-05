    .include "linux.s"

    .section .data

    .equ    SMALL_NUMBER, 3
    .equ    BIG_NUMBER, 5
    .equ    MAX_MULTIPLE, 512

tmp_buffer:
    .ascii "\0\0\0\0\0\0\0\0\0\0\0"

multiple_small_number:
    .long 0
multiple_big_number:
    .long 0
sum_of_multiples:
    .long 0

    .section .text

    .globl _start
_start:
    movl    %esp, %ebp

    movl    $SMALL_NUMBER, %eax
    movl    %eax, multiple_small_number
    movl    $BIG_NUMBER, %eax
    movl    %eax, multiple_big_number

compare_multiples:
    movl    multiple_small_number, %eax
    movl    multiple_big_number, %ecx
    cmp     %eax, %ecx
    je      multiples_are_equal
    jg      small_multiple_is_smaller
    jl      big_multiple_is_smaller

multiples_are_equal:
    addl    $SMALL_NUMBER, %eax
    movl    %eax, multiple_small_number
    jmp     compare_multiples

small_multiple_is_smaller:
#    pushl   %eax
    pushl   $tmp_buffer
    pushl   %eax
    call    print_integer
    addl    $8, %esp
    addl    %eax, sum_of_multiples
    addl    $SMALL_NUMBER, %eax
    movl    %eax, multiple_small_number
    cmp     $MAX_MULTIPLE, %eax
    jg      compare_multiples

big_multiple_is_smaller:
#    pushl   %ecx
    pushl   $tmp_buffer
    pushl   %ecx
    call    print_integer
    addl    $8, %esp
    addl    %ecx, sum_of_multiples
    addl    $BIG_NUMBER, %ecx
    movl    %ecx, multiple_big_number
    cmp     $MAX_MULTIPLE, %ecx
    jg      compare_multiples

    call    write_newline

    pushl   $tmp_buffer
    pushl   sum_of_multiples
    call    print_integer
    addl    $8, %esp

    # Exit
    movl    $SYS_EXIT, %eax
    movl    $0, %ebx
    int     $LINUX_SYSCALL
