  .data
        
enter:
        .string "\n"

block_d:
        .string "%d"

block_c:
        .string "%c"

value:
        .space 4

value_space:
        .space 4
.text
.globl main

main:
        pushl %ebp
        movl %esp, %ebp  /*prolog*/

        pushl $value
        pushl $block_c
        call scanf      /*scanf type of value*/
        addl $8, %esp

        pushl $value_space
        pushl $block_c    
        call scanf
        addl $8, %esp

        cmp $100, value   /*'d'=100*/
        je label_d
        cmp $99, value    /*'c'=99*/
        je label_c
        jmp finish

label_d:
        pushl $value
        pushl $block_d
        movl $0, value
        call scanf
        pushl value
        pushl $block_d
        call printf
        addl $16, %esp
        jmp finish
label_c:
        pushl $value
        pushl $block_c
        movl $0, value
        call scanf
        pushl value
        pushl $block_c
        call printf
        addl $16, %esp
        jmp finish

finish:
        pushl $enter
        call printf
        addl $4, %esp
        movl %ebp, %esp  /*epilog*/
        popl %ebp
        movl $0, %eax
        ret
