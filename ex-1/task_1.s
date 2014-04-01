.data

/*task_1*/
/*space - end of the line!*/
frmt_scan:
        .string "%c"

frmt_print:
        .string "%d\n"

int:
        .long 0x00000000

ch:
        .long 0x00000000

.text
.globl main

main:
//prolog
        pushl %ebp
        movl %esp, %ebp

        movl $0, int
label:
//scan:
        pushl $ch
        pushl $frmt_scan
        call scanf
        addl $8, %esp
        cmp $32, ch /*space - end of the line*/
        je exit
        addl $1, int/*if not equal - int++ - counter*/
        jmp label
exit:
        pushl int
        pushl $frmt_print
        call printf
        addl $8, %esp

        movl %ebp, %esp   /*epilog*/
        popl %ebp
        movl $0, %eax
        ret
