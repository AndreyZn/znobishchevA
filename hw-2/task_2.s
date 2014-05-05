.data

printf_format:
        .string "%s"

str_in:
        .string "max length of string = length of this string"
        .set str_in_length, .-str_in

.bss
str_out:
        .space str_in_length

.text
.globl main
main:
        pushl %ebp
        movl  %esp, %ebp

        pushl $str_in
        pushl $printf_format
        call scanf

        movl  $str_in, %esi
        movl  $str_out, %edi

        movl  $2, %ecx

1:
        lodsb

        stosb
        loop  1b

        movsb

        pushl $str_out
        pushl $printf_format
        call  printf

        movl  $0, %eax

        movl  %ebp, %esp
        popl  %ebp
        ret