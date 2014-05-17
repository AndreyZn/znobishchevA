.data
array:
.space 24

str_fmt:
        .string "%f"
str_fmto:
        .string "%.2f"
str_ent:
        .string "\n"
.text
.globl main

main:
        pushl %ebp
        movl %esp, %ebp

        subl $8, %esp
        xorl %eax, %eax #eax=0
        movl %eax, -4(%ebp)
        movl $5, %ecx

arrread:
        movl %ecx, -8(%ebp)
        movl $array, %ebx
        movl %ecx, %edx

        imull $4, %edx
        addl %edx, %ebx
        pushl %ebx
        pushl $str_fmt
        call scanf
        addl $8, %esp

        flds (%ebx)
        flds -4(%ebp)
        faddp %st, %st(1)
        fstps -4(%ebp)

        movl -8(%ebp), %ecx
        loop arrread
 	
	flds -4(%ebp)
        fstpl (%esp)
        pushl $str_fmto
        call printf
        addl $8, %esp
        pushl $str_ent
        call printf
        addl $8, %esp

        movl $0, %eax
        movl %ebp, %esp
        popl %ebp
        ret
