	.file	"main.c"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushl	%ebp				# 保存当前栈帧(系统为main分配的栈帧)地址
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp			# 为sum分配栈帧
	.cfi_def_cfa_register 5
	andl	$-16, %esp			# 等价于 andl $0xfffffff0 %esp，干掉%esp的底8位，网络上有人说是为内存对齐
	subl	$16, %esp			# 分配栈帧,栈帧的大小16 bytes
	movl	$100, 4(%esp)			# sum的end参数入栈
	movl	$0, (%esp)			# sum的start参数入栈
	call	sum				# 将%eip(下一条指令地址入栈[函数返回地址])，还有一种远程过程调用  call segment:offset
	xorl	%eax, %eax			# main 返回的是0，所以将eax寄存器清零
	leave					# movl %ebp, %esp popl %ebp 
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (GNU) 4.6.1 20110908 (Red Hat 4.6.1-9)"
	.section	.note.GNU-stack,"",@progbits

##################################################################
#						说明
##################################################################
# C函数调用通过栈传递参数，通过eax寄存器返回值(函数返回值)，调用时的栈如下图
#				-----------------		stack top			PAGE_OFFSET
#				|				|
#				-----------------
#				|		.		|
#				-----------------
#				|	ebx(old).	|
#				-----------------
#				|	.			|
#				-----------------		总共14 bytes
#				|	.			|
#				-----------------		<--- 				ebx	栈帧顶
#				|	start		|		<--- start 参数		8(%esp)
#				-----------------
#				|	end			|		<--- end 参数		4(%esp)
#				-----------------
#				| 	eip			|		<--- eip			代码段下一条指令地址	call 压入的函数返回地址
#				-----------------		<---esp				stack
#
#
#

