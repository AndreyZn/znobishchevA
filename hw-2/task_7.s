.data

printf_format:
        .string "%s"
print_f:
        .string "%d"
str_in:
        .string "abcabc"
        .set str_in_length, .-str_in

.bss
str_out:
        .space str_in_length

.text

my_strlen:
        pushl %ebp
        movl  %esp, %ebp

        pushl %edi

        movl  8(%ebp), %edi

        movl  $0xffffffff, %ecx
        xorl  %eax, %eax

        repne scasb

        notl  %ecx
        decl  %ecx

        movl  %ecx, %eax

        popl  %edi

        movl  %ebp, %esp
        popl  %ebp
        ret
.globl main
main:
        pushl %ebp
        movl  %esp, %ebp

        pushl $str_in
        pushl $printf_format
        call scanf
        addl $8, %esp

        movl  $str_in, %esi
        movl  $str_out, %edi

        pushl $str_in
        call  my_strlen

        movl  %eax, %ecx

check_first_letter:
        movl %eax, %edx
        movl $0, %ebx
        lodsb
        cmpb $65, %al
        jl label
        cmpb $122, %al
        jg label
        jmp check_last_letter
label:
        movl $1, %ebx

check_last_letter:
        subl $2, %edx
        addl %edx, %esi
        lodsb
        cmpb $65, %al
        jl label2
        cmpb $122, %al
        jg label2
        jmp check
label2:
        movl $1, %ebx
check:
        cmpl $1, %ebx
        je pravilo2
subl %ecx, %esi
1:      lodsb
        cmpb $65, %al
        jl lb
        cmpb $90, %al
        jg lb

        addb $32, %al

lb:      stosb
        loop  1b

        movsb


        pushl $str_out
        pushl $printf_format
        call  printf
        addl $8, %esp
pravilo2:
        movl  $0, %eax

        movl  %ebp, %esp
        popl  %ebp
        ret
