.data


frmt_string:
        .string "%c"

frmt_print:
        .string "%x"

int1:   .long 0x00000000

.text
.globl main

main:
/*prolog*/
        pushl %ebp
        movl %esp, %ebp

        movl $0, int1
        movl $32, %edi

scan:
        cmp $0, %edi
        jng finish
        pushl $int1
        pushl $frmt_string   /*scanf*/
        call scanf
        addl $8, %esp

        subl $48, int1
        cmp $0, int1
        jl finish
        shll $1, %esi
        addl int1, %esi
        decl %edi
        jmp scan

finish:
        pushl %esi
        pushl $frmt_print
        call printf
        addl $8, %esp          /*printf*/

        movl %ebp, %esp   /*epilog*/
        popl %ebp
        ret
