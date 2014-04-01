.data
frmt_string:
        .string "%d"
int_label:
        .space 4
str1:
        .string "equal with 1"
str2:
        .string "not equal with 1"
frmt_print:
        .string "%s\n"
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
        movl $1, %ebx

        cmpl %ebx, %eax
        je l1

        pushl $str2
        pushl $frmt_print
        call  printf
        addl  $8, %esp
        jmp finish

l1:
        pushl $str1
        pushl $frmt_print
        call printf
        addl $8, %esp

finish:
        movl $0, %eax
        movl $0, %ebx
        addl $4, %esp
        movl $0, %eax
//epilog
        movl %ebp, %esp
        popl %ebp
        ret
