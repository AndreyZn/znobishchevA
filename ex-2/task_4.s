.data

printf_format:
        .string "%s"
print_f:
        .string "%d"
p:
        .long 0x00000000


str_in1:
        .string "abcabc"
        .set str_in_length, .-str_in1
str_in2:
        .string "abc"
.bss
str_out:
        .space str_in_length

.text

my_strlen:
        pushl %ebp
        movl %esp, %ebp

        pushl %edi

        movl 8(%ebp), %edi

        movl $0xffffffff, %ecx
        xorl %eax, %eax

        repne scasb

        notl %ecx
        decl %ecx

        movl %ecx, %eax

        popl %edi

        movl %ebp, %esp
        popl %ebp
        ret
.globl main
main:
        pushl %ebp
        movl %esp, %ebp

        movl $0, p

        movl $str_out, %edi

        pushl $p
        pushl $printf_format
        call scanf
        addl $8, %esp

//      subl $48, p

        pushl $str_in1
        pushl $printf_format
        call scanf
        addl $8, %esp

        pushl $str_in2
        pushl $printf_format
        call scanf
        addl $8, %esp

        pushl $str_in1
        call my_strlen
        movl %eax, %ebx

        pushl $str_in2
        call my_strlen
        movl %eax, %edx


        movl $2, %ecx
        subl $2, %ecx
        movl $str_in2, %esi
1:
        lodsb
        stosb #kopiruem p simvolov vtoroi stroki
        loop 1b

        movl %ebx, %ecx #v ecx dlina pervoi stroki
        subl $1, %ecx
        subl $2-1, %edx #novaya dlina vtoroi stroki
//      movl %edx, %esi
        addl %edx, %esi
        movl $str_in1, %esi

lb2:
        lodsb
        stosb
        loop lb2

        movl $str_in2, %esi
//      subl $2, %edx
        movl %edx, %ecx
//      shrl $2, %edx
//      shrl $2, %edx
//      addl %edx, %esi

3:
        lodsb
        stosb
        loop 3b

        pushl $str_out
        pushl $printf_format
        call printf
        addl $8, %esp

        movl $0, %eax

        movl %ebp, %esp
        popl %ebp
        ret