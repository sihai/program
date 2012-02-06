	.file	"add.c"
	.text
	.p2align 4,,15
	.globl	add
	.type	add, @function
add:
.LFB0:
	.cfi_startproc
	movl	8(%esp), %eax		# n 加载到 eax寄存器,sum局部变量存储在eax寄存器,相当于sum=n
	addl	4(%esp), %eax		# sum = m + n
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.ident	"GCC: (GNU) 4.6.1 20110908 (Red Hat 4.6.1-9)"
	.section	.note.GNU-stack,"",@progbits


