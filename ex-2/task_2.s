.data

x:
	.space 4
y:
	.space 4
str_fmt:
	.string "%f"
str_fmto:
	.string "%.2lf"
str_ent:
	.string "\n"
.text
.globl main

main:
#prolog	
	pushl %ebp
	movl %esp, %ebp
#scan x
	pushl $x
	pushl $str_fmt
	call scanf
	addl $8, %esp
#scan y
	pushl $y
	pushl $str_fmt
	call scanf
	addl $8, %esp
#like in homework:
	fld1
	flds y
	flds x
	fsubp
	fyl2x

	fldlg2
	flds y
	flds  x
	faddp
	fyl2x
	faddp


	fstpl -4(%esp)
	subl $4, %esp
	pushl $str_fmto
	call printf
	addl $8, %esp
#print
	pushl $str_ent
	call printf
	addl $4, %esp

	movl $0, %eax
	movl %ebp, %esp
	popl %ebp
	ret