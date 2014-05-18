.data
#the program use all necessary functions: movs cmps scas lods stos
#the program scans str_in, saves only 3 letters of str_in, print it, if there isn't letter "a"
printf_format:
        .string "%s\n"
scan_format:
        .string "%s"
str_in:
        .string "str in"
        .set str_in_length, .-str_in
bukva:
        .string "a"
stroka:
        .string "bukva a"
.bss
str_out:
        .space str_in_length

.text
.globl main
main:
        pushl %ebp
        movl  %esp, %ebp

        pushl $str_in
        pushl $scan_format
        call scanf

        movl  $str_in, %esi
        movl  $str_out, %edi
#ecx for cycle with saving only 2+1 letters
        movl  $2, %ecx
#cycle
1:
        lodsb

        stosb
        loop  1b

        movsb
#check letter a
        movl bukva, %eax
        subl $1, %edi
        scasb
        je print_stroka
        subl $2, %edi
        scasb
        je print_stroka
        subl $2, %edi
        scasb
        jne print_first_3_letters
#there is a letter 'a' in the first 3 letters:
print_stroka:
        cmpsb
        pushl $stroka
        pushl $printf_format
        call printf
        jmp finish
#there isn't:
print_first_3_letters:

        pushl $str_out
        pushl $printf_format
        call  printf

finish:
        movl  $0, %eax

        movl  %ebp, %esp
        popl  %ebp
        ret
