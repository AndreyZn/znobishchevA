.data
        /*like z5 but we need 64 bit (double) with 32-bits syntax*/
int1:
        .space 8

frmt_print:
        .string "%d"

frmt_string:
        .string "%lf"

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp   /*prolog*/

        pushl $int1
        pushl $frmt_string
        call scanf
        addl $12, %esp    /*scanf*/

        movl $4, %eax
        addl $int1, %eax
        movl (%eax), %ebx
        movl %ebx, %eax
        movl $64, %ecx

lb:                      /*loop cycle*/
        cmpl $32, %ecx
        je function
to_main:
        shll $1, %eax
        movl $0, %ebx
        jnb print
        incl %ebx
print:
        pushl %ecx
        pushl %eax
        pushl %ebx
        pushl $frmt_print
        call printf
        addl $8, %esp
        popl %eax
        popl %ecx
        loop lb
        movl int1, %eax
        movl $32, %ecx
        jmp finish

function:
        movl $int1, %eax
        movl (%eax), %ebx
        movl %ebx, %eax
        jmp to_main

finish:
        movl %ebp, %esp   /*epilog*/
        popl %ebp
        ret
