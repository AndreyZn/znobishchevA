.data
/*task 28*/
frmt_scan:
        .string "%d"

frmt_print:
        .string "%d\n"

int:
        .long 0x00000000

.text
.globl main

main:
//prolog:
        pushl %ebp
        movl %esp, %ebp
//scan:
        pushl $int
        pushl $frmt_scan
        call scanf
        addl $8, %esp
        movl int, %ebx
//scan2:
        pushl $int
        pushl $frmt_scan
        call scanf
        addl $8, %esp
        movl int, %eax

        addl %eax, %ebx

        pushl %ebx
        pushl $frmt_print
        call printf
        addl $8, %esp
//epilog:
        movl %ebp, %esp
        popl %ebp
        movl $0, %eax
        ret
