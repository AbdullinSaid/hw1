        .file   "make_array.c"
        .intel_syntax noprefix
        .text                                    
        .section        .rodata                  # секция .rodata
.LC0:
        .string "%d"                             # чтение типа int
        .text                                    
        .globl  array_input                      # символ array_input
        .type   array_input, @function           # указание, что array_input это функция
array_input:                                     # метка array_input
        push    rbp                              # добавление rbp на вершину стека
        mov     rbp, rsp                         
        sub     rsp, 32                          # выделение памяти локальным переменным
        mov     QWORD PTR -24[rbp], rdi          # в rbp[-24] записывается значение регистра rdi(через регистр rdi передан int* a)
        mov     rax, QWORD PTR fs:40
        mov     QWORD PTR -8[rbp], rax           # scanf("%d", &length)
        xor     eax, eax                         
        lea     rax, -16[rbp]
        mov     rsi, rax
        lea     rdi, .LC0[rip]
        mov     eax, 0
        call    __isoc99_scanf@PLT               # макрос для чтения
        mov     DWORD PTR -12[rbp], 0            # i = 0
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
        add     DWORD PTR -12[rbp], 1           #i++
.L2:
        mov     eax, DWORD PTR -16[rbp]
        cmp     DWORD PTR -12[rbp], eax
        jl      .L3
        mov     eax, DWORD PTR -16[rbp]
        mov     rcx, QWORD PTR -8[rbp]
        xor     rcx, QWORD PTR fs:40    # scanf("%d", &length)
        je      .L5
        call    __stack_chk_fail@PLT
.L5:
        leave
        ret
        .size   array_input, .-array_input
        .globl  create_b_by_a
        .type   create_b_by_a, @function
create_b_by_a:                              # метка create_b_by_a
        push    rbp
        mov     rbp, rsp
        mov     QWORD PTR -24[rbp], rdi     # в rbp[-24] записывается значение регистра rdi(через регистр rdi передан int* a)
        mov     DWORD PTR -28[rbp], esi     # в rbp[-28] записывается значение регистра esi(через регистр esi передан length - длина массива)
        mov     QWORD PTR -40[rbp], rdx     # в rbp[-40] записывается значение регистра rdx(через регистр rdx передан int* b)
        cmp     DWORD PTR -28[rbp], 0       # проверка, что длина length не 0
        jne     .L7
        mov     eax, 0
        jmp     .L8
.L7:
        mov     rax, QWORD PTR -24[rbp]
        mov     eax, DWORD PTR [rax]        
        mov     DWORD PTR -12[rbp], eax     # last = a[0]
        mov     rax, QWORD PTR -40[rbp]
        mov     edx, DWORD PTR -12[rbp]
        mov     DWORD PTR [rax], edx        # b[0] = last
        mov     DWORD PTR -8[rbp], 1        # b_length = 1
        mov     DWORD PTR -4[rbp], 1
        jmp     .L9
.L11:
        mov     eax, DWORD PTR -4[rbp]      # переменная i
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        cmp     DWORD PTR -12[rbp], eax     # сравнение a[i] >= last
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
        add     rdx, rcx                     #b[b_length] = a[i]
        mov     eax, DWORD PTR [rax] 
        mov     DWORD PTR [rdx], eax
        mov     eax, DWORD PTR -4[rbp]
        cdqe
        lea     rdx, 0[0+rax*4]
        mov     rax, QWORD PTR -24[rbp]
        add     rax, rdx
        mov     eax, DWORD PTR [rax]
        mov     DWORD PTR -12[rbp], eax     #last = a[i]
        add     DWORD PTR -8[rbp], 1        #b_length++
.L10:
        add     DWORD PTR -4[rbp], 1
.L9:
        mov     eax, DWORD PTR -4[rbp]
        cmp     eax, DWORD PTR -28[rbp]
        jl      .L11
        mov     eax, DWORD PTR -8[rbp]
.L8:
        pop     rbp
        ret
        .size   create_b_by_a, .-create_b_by_a
        .section        .rodata
.LC1:
        .string "%d\n"
.LC2:
        .string "%d "
        .text
        .globl  array_output
        .type   array_output, @function
array_output:                                  # метка array_output
        push    rbp
        mov     rbp, rsp
        sub     rsp, 32                            # выделение памяти
        mov     QWORD PTR -24[rbp], rdi            # в rbp[-24] записывается значение регистра rdi(через регистр rdi передан int* a)
        mov     DWORD PTR -28[rbp], esi            # в rbp[-28] записывается значение регистра esi(через регистр esi передан length - длина массива)
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
        lea     rdx, 0[0+rax*4]                    # присваиваю регистру rdx значение 4 * rax
        mov     rax, QWORD PTR -24[rbp]            # присваиваю регистру rax значение из массива a
        add     rax, rdx
        mov     eax, DWORD PTR [rax]               # присваиваю регистру eax значение *rax
        mov     esi, eax                           # присваиваю регистру esi значение eax  
        lea     rdi, .LC2[rip]
        mov     eax, 0                            # присваиваю регистру eax значение 0
        call    printf@PLT                        # вызывается макрос для вывода символов
        add     DWORD PTR -4[rbp], 1              # прибавляю к rbp[-4] значение 1 (rbp[-4] аналог переменной i)
.L13:
        mov     eax, DWORD PTR -4[rbp]            # присваиваю eax rbp[-4](аналог переменной i)
        cmp     eax, DWORD PTR -28[rbp]           # cравнение с длиной length
        jl      .L14
        mov     edi, 10
        call    putchar@PLT
        nop
        leave
        ret
        .size   array_output, .-array_output
        .globl  main
        .type   main, @function
main:
        push    rbp
        mov     rbp, rsp
        sub     rsp, 832
        mov     rax, QWORD PTR fs:40   #scanf("%d", &is_random_input);
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
        add     DWORD PTR -824[rbp], 1          # i++
.L17:
        mov     eax, DWORD PTR -824[rbp]
        cmp     eax, DWORD PTR -828[rbp]        # i < length
        jl      .L18
        mov     edx, DWORD PTR -828[rbp]        # length
        lea     rax, -816[rbp]
        mov     esi, edx
        mov     rdi, rax
        call    array_output  # ввод рандомизированного массива a
        jmp     .L19
.L16:
        lea     rax, -816[rbp]
        mov     rdi, rax
        call    array_input    # ввод массива a
        mov     DWORD PTR -828[rbp], eax  # array_output(a, length)
.L19:
        lea     rdx, -416[rbp] # a
        mov     ecx, DWORD PTR -828[rbp] # length
        lea     rax, -816[rbp] # b
        mov     esi, ecx
        mov     rdi, rax
        call    create_b_by_a  # вызов создание массива b по массиву a
        mov     DWORD PTR -820[rbp], eax #length_b = create_b_by_a(a, length, b)
        mov     edx, DWORD PTR -820[rbp]
        lea     rax, -416[rbp]
        mov     esi, edx
        mov     rdi, rax
        call    array_output # вывод массива b
        mov     eax, 0
        mov     rsi, QWORD PTR -8[rbp]
        xor     rsi, QWORD PTR fs:40
        je      .L21
        call    __stack_chk_fail@PLT
.L21:
        leave
        ret
        .size   main, .-main
        .ident  "GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
        .section        .note.GNU-stack,"",@progbits
