.data
# x^y
x:
        .space 4
y:
        .space 4
scanf_block:
        .string "%f"
printf_block:
        .string "%.2f\n"
        .text



math:
        flds y
        flds x
        fyl2x
        frndint
        fld1
        fscale
        flds y
        flds x
        fyl2x        #2^(y*log2(x))

        frndint
        flds y
        flds x
        fyl2x
        fsubp      #y*log2(x)-round(y*log2(x))
        f2xm1      #2^(y*log2(x)-round(y*log2(x)))-1
        fld1       #+1
        faddp
        fmulp
        jmp back_to_main    #st(0)=2^(y*log2(x))=x^y
        .globl main

main:
        pushl %ebp
        movl %esp, %ebp

        pushl $x
        pushl $scanf_block
        call scanf
        pushl $y
        pushl $scanf_block
        call scanf
        addl $12, %esp
        jmp math
	
	back_to_main:
        fstpl (%esp)
        pushl $printf_block   #printf_result
        call printf
        addl $4, %esp

        movl $0, %eax           #epilog
        movl %ebp, %esp
        popl %ebp
        ret
