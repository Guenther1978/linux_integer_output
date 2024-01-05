# PURPOSE:  Calls functios to print an integer
#
# INPUT:    A buffer large enough to hold the largest
#           possible number
#           An integer to convert
#
# OUTPUT:   The buffer will be overwritten with the
#           decimal string
#
    .include "linux.s"

    .equ ST_VALUE, 8
    .equ ST_BUFFER, 12

#tmp_buffer:
#    .ascii "\0\0\0\0\0\0\0\0\0\0\0"

    .globl print_integer
    .type print_integer, @function
print_integer:
    pushl   %ebp
    movl    %esp, %ebp

    # Storage for the result
    pushl   %ebx #$tmp_buffer

    # Push the number to convert
    pushl   ST_BUFFER(%ebp)
    pushl   ST_VALUE(%ebp)
    call    integer2string
    addl    $8, %esp

    # Get the character count for our system call
    pushl   ST_BUFFER(%ebp) #$tmp_buffer
    call    count_chars
    addl    $4, %esp

    # The count goes in %edx for SYS_WRITE
    movl    %eax, %edx

    # Make the system call
    movl    $SYS_WRITE, %eax
    movl    $STDOUT, %ebx
    movl    ST_BUFFER(%ebp), %ecx
    int     $LINUX_SYSCALL

    # Write a carriage return
    pushl   $STDOUT
    call    write_newline

    movl    %ebp, %esp
    popl    %ebp
    ret
