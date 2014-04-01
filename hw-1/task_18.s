.data
frmt_string:
        .string "%d"
int_label:
        .space 4
str1:
        .string "1"
str:
        .string "(While like FOR) Napishite skolko raz vyvesti 1?"
frmt_print:
        .string "%s\n"
frmt_print_int:
        .string "%d\n"
.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp
        //prol

// printf "Napishite skolko raz..."
        pushl $str
        pushl $frmt_print
        call printf
        addl $8, %esp

        pushl $int_label
        pushl $frmt_string
        call scanf
        addl $8, %esp

//main:
        movl $0, %ebx
        movl int_label, %eax
while:
        cmp %eax, %ebx
        je finish
        pushl %eax
        pushl %ebx
        pushl $str1
        pushl $frmt_print
        call printf

        addl $8, %esp
        popl %ebx
        popl %eax
        incl %ebx
        jmp while
finish:
        movl $0, %eax
        movl $0, %ebx
        addl $4, %esp
        movl $0, %eax
//epilog
        movl %ebp, %esp
        popl %ebp
        ret
