.data

.comm str_1,200,32
.comm str_2,200,32
len_1:  #dlina pervoi str
.space 4
len_2: #dlina vtori str
.space 4
val:
.space 4
frmt_scanf:
.string "%s"
print:
.string "%d\n"

.text
.globl main
main:

        pushl %ebp
        movl %esp, %ebp #prolog

        pushl $str_1
        pushl $frmt_scanf
        call scanf
        pushl $str_2
        pushl $frmt_scanf
        call scanf
        addl $16, %esp
        movl $-1, val

        movl $str_1, %esi
        movl $0, %ecx
lb1: #length(str_1)
        lodsb
        cmp $0, %al
        je break_1
        addl $1, %ecx
        jmp lb1
        break_1:
        movl %ecx, len_1

        movl $str_2, %esi
        movl $0, %ecx
lb2: #length(str_2)
        lodsb
        cmp $0, %al
        je break_2
        addl $1, %ecx
        jmp lb2
break_2:
        movl %ecx, len_2

        movl len_2, %ecx
        movl len_1, %eax
        subl %eax, %ecx
        cmp $0, %ecx #len_2<len_1
        jl finish
        addl $1, %ecx

loop_label:
        subl $1, %ecx
        pushl %ecx
        movl $str_2, %esi
        movl $str_1, %edi
        addl %ecx, %esi
        movl len_1, %ecx
loop_in:
        pushl %ecx
        cmpsb
        popl %ecx
        jne break_in
loop loop_in
        popl %ecx
        movl %ecx, val
        pushl val
        break_in:
        popl %ecx
        addl $1, %ecx
        loop loop_label

finish:
        addl $1, val
        pushl val
        pushl $print
        call printf #print
        addl $8, %esp

        movl %ebp, %esp #epilog
        popl %ebp
        movl $0, %eax
        ret
