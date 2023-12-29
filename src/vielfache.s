    .global _start

    .text
_start:
    movq    $4, %rax    # 4 (coede for "write" syscall) -> EAX register
    movq    $1, %rbx    # 1 (file descriptor for stdout) -> EBX
    movq    $msg, %rcx  # address of msg string -> ECX
    movq    $len, %rdx  # len -> EDX
    int     $0x80       # interrupt

    movq    $555, %rbx
    movq    %rbx,%rax
    andq    $0x0000000F, %rax
    addq    $0x30, %rax
    movq    %rax, ziffer

    movq    $4, %rax    # 4 (coede for "write" syscall) -> EAX register
    movq    $1, %rbx    # 1 (file descriptor for stdout) -> EBX
    movq    $ziffer, %rcx # address of msg string -> ECX
    movq    $1, %rdx    # len -> EDX
    int     $0x80       # interrupt

    movq    $zahl, %rbx
    ror     %rbx
    movq    %rbx,%rax
    andq    $0x0000000F, %rax
    addq    $0x30, %rax
    movq    %rax, ziffer

    movq    $4, %rax    # 4 (coede for "write" syscall) -> EAX register
    movq    $1, %rbx    # 1 (file descriptor for stdout) -> EBX
    movq    $ziffer, %rcx # address of msg string -> ECX
    movq    $1, %rdx    # len -> EDX
    int     $0x80       # interrupt

    movq    $zahl, %rbx
    ror     %rbx
    movq    %rbx,%rax
    andq    $0x0000000F, %rax
    addq    $0x30, %rax
    movq    %rax, ziffer

    movq    $4, %rax    # 4 (coede for "write" syscall) -> EAX register
    movq    $1, %rbx    # 1 (file descriptor for stdout) -> EBX
    movq    $ziffer, %rcx # address of msg string -> ECX
    movq    $1, %rdx    # len -> EDX
    int     $0x80       # interrupt

    movq    $10, %rax
    movq    %rax, ziffer

    movq    $4, %rax    # 4 (coede for "write" syscall) -> EAX register
    movq    $1, %rbx    # 1 (file descriptor for stdout) -> EBX
    movq    $ziffer, %rcx # address of msg string -> ECX
    movq    $1, %rdx    # len -> EDX
    int     $0x80       # interrupt

    movq    $1, %rax    # 1 ("exit") -> EAX
    movq    $0, %rbx    # 0 0> EBX
    int     $0x80       # see previous

.data
msg:
    .ascii  "Hallo Welt!\n" # inline ascii string
    len =   . -msg
ziffer:
    .ascii   "0"

zahl:
    .quad 671
