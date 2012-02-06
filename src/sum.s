	.file	"sum.c"
	.text
	.p2align 4,,15
	.globl	sum
	.type	sum, @function
sum:
.LFB0:
	.cfi_startproc
	pushl	%esi				# 函数用到 esi寄存器，先压栈保存esi寄存器
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx				# 保存上一栈帧顶地址
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	subl	$20, %esp			# 分配栈帧 20 bytes
	.cfi_def_cfa_offset 32
	movl	36(%esp), %esi		# 取end参数
	movl	32(%esp), %eax		# 取start参数，sum = start
	testl	%esi, %esi			#
	js	.L2						# 当满足SF=1时，转移到目标地址, esi寄存器的值为负数
	xorl	%ebx, %ebx			# i 局部变量
	.p2align 4,,7
	.p2align 3
.L3:
	movl	%ebx, 4(%esp)		# i 入栈
	addl	$1, %ebx
	movl	%eax, (%esp)		# sum 入栈
	call	add
	cmpl	%ebx, %esi
	jge	.L3						# 如果 %esi (end) >= %ebx (i) 继续循环
.L2:							# 循环结束
	addl	$20, %esp			# 丢弃当前栈帧
	.cfi_def_cfa_offset 12
	popl	%ebx				# 恢复ebx寄存器，上一个栈帧
	.cfi_def_cfa_offset 8
	.cfi_restore 3
	popl	%esi				# 恢复esi寄存器
	.cfi_def_cfa_offset 4
	.cfi_restore 6
	ret							# 函数返回，弹出 eip
	.cfi_endproc
.LFE0:
	.size	sum, .-sum
	.ident	"GCC: (GNU) 4.6.1 20110908 (Red Hat 4.6.1-9)"
	.section	.note.GNU-stack,"",@progbits
