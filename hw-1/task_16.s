.data
frmt_string:
        .string "%d"
int_label:
        .space 4
str:
        .string "Print 1, 2 or 3: 1-Monday, 2-Tuesday, 3-Wednesday, other numbers - exit"

str1:
        .string "Monday"
str2:
        .string "Tuesday"
str3:
        .string "Wednesday"

frmt_print:
        .string "%s\n"
.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp
        //prol

// printf "print a number..."
        pushl $str
        pushl $frmt_print
        call printf
        addl $8, %esp


        pushl $int_label
        pushl $frmt_string
        call scanf
        addl $8, %esp

//main:

        movl int_label, %eax
        movl $1, %ebx

        cmpl %ebx, %eax
        je l1

        movl $2, %ebx
        cmpl %ebx, %eax
        je l2
 movl $3, %ebx
        cmpl %ebx, %eax
        je l3

        jmp finish

l1:
        pushl $str1
        pushl $frmt_print
        call printf
        addl $8, %esp
        jmp finish
l2:
        pushl $str2
        pushl $frmt_print
        call printf
        addl $8, %esp
        jmp finish

l3:
        pushl $str3
        pushl $frmt_print
        call printf
        addl $8, %esp
        jmp finish


finish:
        movl $0, %eax
        movl $0, %ebx
        addl $4, %esp
        movl $0, %eax
//epilog
        movl %ebp, %esp
        popl %ebp
        ret

