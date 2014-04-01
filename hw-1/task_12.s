.data
        .globl main
/*This program we have done in the class*/

int1:
        .space 4
int2:
        .space 4

input_string:
        .string "%d"
sum_string:
        .string "a + b = %d\n"
sub_string:
        .string "a - b = %d\n"
mul_string:
        .string "a * b = %d\n"
div_string:
        .string "a / b = %d\n"

        .text
main:
/*Prolog*/
        pushl %ebp
        movl %esp, %ebp

        pushl $int1
        pushl $input_string
        call scanf
        addl $8, %esp/*scan*/
        pushl $int2
        pushl $input_string
        call scanf/*scan2*/
        addl $8, %esp

/*Sum*/
        movl int1, %eax
        addl int2, %eax
        pushl %eax
        pushl $sum_string
        call printf
        addl $8, %esp
/*Sub*/ movl int1, %eax
        subl int2, %eax
        pushl %eax
        pushl $sub_string
        call printf
        addl $8, %esp

/*Mul*/
        movl int1, %eax
        mull int2
        pushl %eax
        pushl $mul_string
        call printf
        addl $8, %esp

/*Div*/
        movl int1, %eax
        movl int1, %edx
        sarl $31, %edx
        idivl int2
        pushl %eax
        pushl $div_string
        call printf
        addl $8, %esp

/*Epilog*/
        movl $0, %eax
        popl %ebp
        ret
