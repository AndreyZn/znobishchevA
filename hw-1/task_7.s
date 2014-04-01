.data
        /*like z6 but we need 80 bits (long double)*/
int1:
        .space 10

frmt_print:
        .string "%d"

frmt_string:
        .string "%Lf"

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp        /*prolog*/

        pushl $int1
        pushl $frmt_string
        call scanf          /*scanf*/
        addl $8, %esp
        movl $6, %eax
        addl $int1, %eax
        movl (%eax), %ebx
        movl %ebx, %eax
        movl $80, %ecx

lb:
        cmpl $48, %ecx
        je function1
        cmpl $16, %ecx
        je function2
to_main:
        shll $1, %eax
        movl $0, %ebx
        jnb next
        incl %ebx
next:
        pushl %ecx   /*save*/
        pushl %eax
        pushl %ebx
        pushl $frmt_print
        call printf
        addl $8, %esp
        popl %eax
        popl %ecx    /*end*/
        loop lb
        jmp finish

function1:
        movl $2, %eax
        addl $int1, %eax
        movl (%eax), %ebx
        movl %ebx, %eax
        jmp to_main
function2:
        movl $int1, %eax
        movl (%eax), %ebx
        movl %ebx, %eax
        jmp to_main

finish:
        movl %ebp, %esp     /*epilog*/
        popl %ebp
        ret
