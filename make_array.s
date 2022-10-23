        .file   "make_array.c"
        .intel_syntax noprefix
        .text
        .section        .rodata
.LC0:
        .string "%d"
        .text
        .globl  array_input
        .type   array_input, @function
array_input:
.LFB5:
        .cfi_startproc
        push    rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        mov     rbp, rsp
        .cfi_def_cfa_register 6
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax
        xor     eax, eax
        lea     rax, -16[rbp]
        mov     rsi, rax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        mov     DWORD PTR -12[rbp], 0
        jmp     .L2
.L3:
        mov     eax, DWORD PTR -12[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     rsi, rax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        add     DWORD PTR -12[rbp], 1
.L2:
        mov     eax, DWORD PTR -16[rbp]
        cmp     DWORD PTR -12[rbp], eax
        jl      .L3
        mov     eax, DWORD PTR -16[rbp]
        mov     rcx, QWORD PTR -8[rbp]
        xor     rcx, QWORD PTR fs:40
        je      .L5
        call    __stack_chk_fail@PLT
.L5:
        leave
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE5:
        .size   array_input, .-array_input
        .globl  create_b_by_a
        .type   create_b_by_a, @function
create_b_by_a:
.LFB6:
        .cfi_startproc
        push    rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        mov     rbp, rsp
        .cfi_def_cfa_register 6
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     QWORD PTR -40[rbp], rdx
        cmp     DWORD PTR -28[rbp], 0
        jne     .L7
        mov     eax, 0
        jmp     .L8
.L7:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR -12[rbp], eax
        mov     rax, QWORD PTR -40[rbp]
        mov     edx, DWORD PTR -12[rbp]
        mov     DWORD PTR [rax], edx
        mov     DWORD PTR -8[rbp], 1
        mov     DWORD PTR -4[rbp], 1
        jmp     .L9
.L11:
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        cmp     DWORD PTR -12[rbp], eax
        jg      .L10
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     edx, DWORD PTR -8[rbp]
        movsx   rdx, edx
        lea     rcx, 0[0+rdx*4]
        mov     rdx, QWORD PTR -40[rbp]
        add     rdx, rcx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR [rdx], eax
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR -12[rbp], eax
        add     DWORD PTR -8[rbp], 1
.L10:
        add     DWORD PTR -4[rbp], 1
.L9:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp]
        jl      .L11
        mov     eax, DWORD PTR -8[rbp]
.L8:
        pop     rbp
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE6:
        .size   create_b_by_a, .-create_b_by_a
        .section        .rodata
.LC1:
        .string "%d\n"
.LC2:
        .string "%d "
        .text
        .globl  array_output
        .type   array_output, @function
array_output:
.LFB7:
        .cfi_startproc
        push    rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        mov     rbp, rsp
        .cfi_def_cfa_register 6
        sub     rsp, 32
        mov     QWORD PTR -24[rbp], rdi
        mov     DWORD PTR -28[rbp], esi
        mov     eax, DWORD PTR -28[rbp]
        mov     esi, eax
        lea     rdi, .LC1[rip]
        mov     eax, 0
        call    printf@PLT
        mov     DWORD PTR -4[rbp], 0
        jmp     .L13
.L14:
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     esi, eax
        lea     rdi, .LC2[rip]
        mov     eax, 0
        call    printf@PLT
        add     DWORD PTR -4[rbp], 1
.L13:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp]
        jl      .L14
        mov     edi, 10
        call    putchar@PLT
        nop
        leave
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE7:
        .size   array_output, .-array_output
        .globl  main
        .type   main, @function
main:
.LFB8:
        .cfi_startproc
        push    rbp
        .cfi_def_cfa_offset 16
        .cfi_offset 6, -16
        mov     rbp, rsp
        .cfi_def_cfa_register 6
        sub     rsp, 832
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax
        xor     eax, eax
        lea     rax, -832[rbp]
        mov     rsi, rax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT
        mov     edi, 0
        call    time@PLT
        mov     edi, eax
        call    srand@PLT
        mov     eax, DWORD PTR -832[rbp]
        test    eax, eax
        je      .L16
        call    rand@PLT
        mov     ecx, eax
        mov     edx, 1374389535
        mov     eax, ecx
        imul    edx
        sar     edx, 5
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        mov     DWORD PTR -828[rbp], eax
        mov     eax, DWORD PTR -828[rbp]
        imul    eax, eax, 100
        sub     ecx, eax
        mov     eax, ecx
        mov     DWORD PTR -828[rbp], eax
        mov     DWORD PTR -824[rbp], 0
        jmp     .L17
.L18:
        call    rand@PLT
        mov     ecx, eax
        mov     edx, 1374389535
        mov     eax, ecx
        imul    edx
        sar     edx, 5
        mov     eax, ecx
        sar     eax, 31
        sub     edx, eax
        mov     eax, edx
        imul    eax, eax, 100
        sub     ecx, eax
        mov     eax, ecx
        mov     edx, DWORD PTR -824[rbp]
        movsx   rdx, edx
        mov     DWORD PTR -816[rbp+rdx*4], eax
        add     DWORD PTR -824[rbp], 1
.L17:
        mov     eax, DWORD PTR -824[rbp]
        cmp     eax, DWORD PTR -828[rbp]
        jl      .L18
        mov     edx, DWORD PTR -828[rbp]
        lea     rax, -816[rbp]
        mov     esi, edx
        mov     rdi, rax
        call    array_output
        jmp     .L19
.L16:
        lea     rax, -816[rbp]
        mov     rdi, rax
        call    array_input
        mov     DWORD PTR -828[rbp], eax
.L19:
        lea     rdx, -416[rbp]
        mov     ecx, DWORD PTR -828[rbp]
        lea     rax, -816[rbp]
        mov     esi, ecx
        mov     rdi, rax
        call    create_b_by_a
        mov     DWORD PTR -820[rbp], eax
        mov     edx, DWORD PTR -820[rbp]
        lea     rax, -416[rbp]
        mov     esi, edx
        mov     rdi, rax
        call    array_output
        mov     eax, 0
        mov     rsi, QWORD PTR -8[rbp]
        xor     rsi, QWORD PTR fs:40
        je      .L21
        call    __stack_chk_fail@PLT
.L21:
        leave
        .cfi_def_cfa 7, 8
        ret
        .cfi_endproc
.LFE8:
        .size   main, .-main
        .ident  "GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
        .section        .note.GNU-stack,"",@progbits
