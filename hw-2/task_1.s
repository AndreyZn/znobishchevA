.data

# and or xor shl

frmt_string:
        .string "%d"
int_label1:
      .long 0x00000000
int_label2:
      .long 0x00000000

frmt_print:
        .string "%d\n"
.text
.globl main
main:
        pushl %ebp
        movl %esp, %ebp

#scanf a:
        pushl $int_label1
        pushl $frmt_string
        call scanf
        addl $8, %esp
        movl int_label1, %eax
#scanf b:
        pushl %eax
        pushl $int_label2
        pushl $frmt_string
        call scanf
        addl $8, %esp
        popl %eax
        movl int_label2, %ebx

#and: logic mul, result in %ebx
        andl %eax, %ebx
#or: result in %ebx
        orl %eax, %ebx
#xor:
        xor %eax, %ebx

#shl:
        shll %eax

        pushl %ebx
        pushl %eax
        pushl $frmt_print
#print a:
        call printf
        addl $8, %esp

        pushl $frmt_print
#print b:
        call printf
        addl $8, %esp

#epilog:
        movl %ebp, %esp
        popl %ebp
        ret
