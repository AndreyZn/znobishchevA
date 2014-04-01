.data
        
        .comm array,40004,32

value1:
        .long 0x00000000

value2:
        .long 0x00000000

scanf_block:
        .string "%d"

printf_block:
        .string "%d\n"

.text
.globl main

main:
        pushl %ebp
        movl %esp, %ebp  #prolog

        pushl $value1
        pushl $scanf_block
        call scanf
        addl $8, %esp  #scanf number of strings

        pushl $value2
        pushl $scanf_block
        call scanf
        addl $8, %esp   #scanf number of colunms

        movl value1, %eax
        mulw value2
        movl %eax, %ecx #%ecx = value1 x value2
metka:
        pushl %ecx
        movl $array, %ebx
        addl %ecx, %ebx
        addl %ecx, %ebx
        addl %ecx, %ebx
        addl %ecx, %ebx
        pushl %ebx
        pushl $scanf_block
        call scanf
        addl $8, %esp
        popl %ecx
        loop metka    #scanf all elements

        movl $array+4, %ebx
        movl (%ebx), %eax
        movl $array, %ebx
        movl value1, %eax
        mulw value2
        movl %eax, %ecx #%ecx = value1 x value2
metka_search:
        addl $4, %ebx
        cmp %eax, (%ebx)
        jle less
next:
        loop metka_search  #again
        jmp finish

less:
        movl (%ebx), %eax #new minimal
        jmp next

finish:
        pushl %eax  #printf(min)
        pushl $printf_block
        call printf
        addl $8, %esp

        movl %ebp, %esp   #epilog
        popl %ebp
        movl $0, %eax
        ret