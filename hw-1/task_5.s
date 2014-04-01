.data


int1:
        .long 0x00000000

frmt_print:
        .string "%d"

frmt_string:
        .string "%f"

.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp   /*prolog*/

        pushl $int1
        pushl $frmt_string
        call scanf
        addl $8, %esp   /*scanf*/

        movl int1, %eax
        movl $32, %ecx
label:
        shll $1, %eax   /*left shift*/
        movl $0, %ebx
        jnb next
        incl %ebx

next:
        pushl %ecx    /*save*/
        pushl %eax
        pushl %ebx
        pushl $frmt_print
        call printf
        addl $8, %esp
        popl %eax
        popl %ecx     /*end*/
        loop label

        movl %ebp, %esp   /*epilog*/
        popl %ebp
        ret
