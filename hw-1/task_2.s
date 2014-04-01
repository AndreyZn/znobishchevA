.data
frmt_string:
        .string "%d"
int_label:
        .space 4
frmt_print:
        .string "\n"
.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp
        //prol

        pushl $int_label
        pushl $frmt_string
        call scanf
        addl $8, %esp

//main:

        movl int_label, %eax
        movl $32, %ecx
        movl $0, %edx

shift:

        shll $1, %eax
        movl $0, %ebx
        jnb label
        movl $1, %edx
        incl %ebx
label:

        cmp $1, %edx
        jne notprt
//print:
        pushl %ecx
        pushl %eax
        pushl %edx
        pushl %ebx
        pushl $frmt_string
        call printf
        addl $8, %esp
        popl %edx
        popl %eax
        popl %ecx
notprt:
 loop shift
        pushl $frmt_string

        addl $4, %esp
        movl $0, %eax
//epilog
        movl %ebp, %esp
        popl %ebp
        ret
