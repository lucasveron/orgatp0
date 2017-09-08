	.file	"tp0.c"
	.text
	.globl	toLowerCase
	.type	toLowerCase, @function
toLowerCase:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L2
	movl	$0, -12(%rbp)
	jmp	.L3
.L5:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -13(%rbp)
	cmpb	$64, -13(%rbp)
	jle	.L4
	cmpb	$90, -13(%rbp)
	jg	.L4
	movzbl	-13(%rbp), %eax
	addl	$32, %eax
	movb	%al, -13(%rbp)
.L4:
	movl	-12(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-13(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -12(%rbp)
.L3:
	movl	-12(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L5
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
.L2:
	movq	-8(%rbp), %rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	toLowerCase, .-toLowerCase
	.section	.rodata
	.align 8
.LC0:
	.string	"[Error] Hubo un error en memoria \n"
	.text
	.globl	verifyPalindromic
	.type	verifyPalindromic, @function
verifyPalindromic:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$64, %rsp
	movq	%rdi, -56(%rbp)
	movl	%esi, -60(%rbp)
	movl	-60(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -28(%rbp)
	cmpq	$0, -56(%rbp)
	je	.L8
	cmpl	$0, -28(%rbp)
	jg	.L9
.L8:
	movl	$1, %eax
	jmp	.L10
.L9:
	cmpq	$0, -56(%rbp)
	je	.L11
	cmpl	$0, -60(%rbp)
	je	.L11
	cmpl	$1, -28(%rbp)
	jne	.L11
	movl	$0, %eax
	jmp	.L10
.L11:
	movl	-60(%rbp), %eax
	cltq
	movq	%rax, %rdi
	call	malloc
	movq	%rax, -24(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$4, %al
	jne	.L12
	movl	$4, %eax
	jmp	.L10
.L12:
	movl	-28(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -40(%rbp)
	movl	$0, -36(%rbp)
	jmp	.L13
.L14:
	movl	-36(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movl	-40(%rbp), %eax
	movslq	%eax, %rcx
	movq	-56(%rbp), %rax
	addq	%rcx, %rax
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	subl	$1, -40(%rbp)
	addl	$1, -36(%rbp)
.L13:
	movl	-36(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L14
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	movl	-60(%rbp), %edx
	movq	-56(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	toLowerCase
	movq	%rax, -16(%rbp)
	movl	-60(%rbp), %edx
	movq	-24(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	toLowerCase
	movq	%rax, -8(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L15
	cmpq	$0, -8(%rbp)
	jne	.L16
.L15:
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$4, %eax
	jmp	.L10
.L16:
	movl	$1, -32(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp
	testl	%eax, %eax
	jne	.L17
	movl	$0, -32(%rbp)
.L17:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -24(%rbp)
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -16(%rbp)
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -8(%rbp)
	movl	-32(%rbp), %eax
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	verifyPalindromic, .-verifyPalindromic
	.globl	isKeywords
	.type	isKeywords, @function
isKeywords:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movl	%edi, %eax
	movb	%al, -4(%rbp)
	cmpb	$64, -4(%rbp)
	jle	.L19
	cmpb	$90, -4(%rbp)
	jle	.L20
.L19:
	cmpb	$96, -4(%rbp)
	jle	.L21
	cmpb	$122, -4(%rbp)
	jle	.L20
.L21:
	cmpb	$47, -4(%rbp)
	jle	.L22
	cmpb	$57, -4(%rbp)
	jle	.L20
.L22:
	cmpb	$45, -4(%rbp)
	je	.L20
	cmpb	$95, -4(%rbp)
	jne	.L23
.L20:
	movl	$0, %eax
	jmp	.L24
.L23:
	movl	$1, %eax
.L24:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	isKeywords, .-isKeywords
	.section	.rodata
	.align 8
.LC1:
	.string	"[Error] Error al escribir en el archivo output la palabra %s"
	.align 8
.LC2:
	.string	"[Error] Error al escribir en el archivo output el salto de l\303\255nea."
	.text
	.globl	executeProcess
	.type	executeProcess, @function
executeProcess:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movl	%eax, -24(%rbp)
	movq	$0, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L26
.L36:
	movl	-24(%rbp), %eax
	movb	%al, -25(%rbp)
	movsbl	-25(%rbp), %eax
	movl	%eax, %edi
	call	isKeywords
	testl	%eax, %eax
	jne	.L27
	movq	-8(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L28
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$4, %eax
	jmp	.L29
.L28:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-25(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -20(%rbp)
	jmp	.L30
.L27:
	movq	-8(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	realloc
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L31
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$34, %edx
	movl	$1, %esi
	movl	$.LC0, %edi
	call	fwrite
	movl	$4, %eax
	jmp	.L29
.L31:
	movl	-20(%rbp), %eax
	movslq	%eax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	movb	$0, (%rax)
	addl	$1, -20(%rbp)
	movl	-20(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	verifyPalindromic
	movl	%eax, -16(%rbp)
	cmpl	$4, -16(%rbp)
	je	.L32
	cmpl	$0, -16(%rbp)
	jne	.L33
	movq	-48(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fputs
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L34
	movq	stderr(%rip), %rax
	movq	-8(%rbp), %rdx
	movl	$.LC1, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L29
.L34:
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$10, %edi
	call	fputc
	movl	%eax, -12(%rbp)
	cmpl	$-1, -12(%rbp)
	jne	.L33
	movq	stderr(%rip), %rax
	movq	%rax, %rcx
	movl	$66, %edx
	movl	$1, %esi
	movl	$.LC2, %edi
	call	fwrite
	movl	$3, %eax
	jmp	.L29
.L33:
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free
	movq	$0, -8(%rbp)
	movl	$0, -20(%rbp)
	jmp	.L30
.L32:
	movl	$4, %eax
	jmp	.L29
.L30:
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fgetc
	movl	%eax, -24(%rbp)
.L26:
	cmpl	$-1, -24(%rbp)
	jne	.L36
	movl	$0, %eax
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	executeProcess, .-executeProcess
	.globl	executeWithDefaultParameters
	.type	executeWithDefaultParameters, @function
executeWithDefaultParameters:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	stdin(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	stdout(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	executeProcess
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	executeWithDefaultParameters, .-executeWithDefaultParameters
	.section	.rodata
.LC3:
	.string	"Usage: \n"
.LC4:
	.string	"\ttp0 -h \n"
.LC5:
	.string	"\ttp0 -V \n"
.LC6:
	.string	"\ttp0 [options] \n"
.LC7:
	.string	"Options: \n"
	.align 8
.LC8:
	.string	"\t-V, --version\tPrint version and quit. \n"
	.align 8
.LC9:
	.string	"\t-h, --help\tPrint this information. \n"
	.align 8
.LC10:
	.string	"\t-i, --input\tLocation of the input file. \n"
	.align 8
.LC11:
	.string	"\t-o, --output\tLocation of the output file. \n"
	.text
	.globl	executeHelp
	.type	executeHelp, @function
executeHelp:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$8, %edx
	movl	$1, %esi
	movl	$.LC3, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	movl	$.LC4, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$9, %edx
	movl	$1, %esi
	movl	$.LC5, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$16, %edx
	movl	$1, %esi
	movl	$.LC6, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$10, %edx
	movl	$1, %esi
	movl	$.LC7, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$40, %edx
	movl	$1, %esi
	movl	$.LC8, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$37, %edx
	movl	$1, %esi
	movl	$.LC9, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$42, %edx
	movl	$1, %esi
	movl	$.LC10, %edi
	call	fwrite
	movq	stdout(%rip), %rax
	movq	%rax, %rcx
	movl	$44, %edx
	movl	$1, %esi
	movl	$.LC11, %edi
	call	fwrite
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	executeHelp, .-executeHelp
	.section	.rodata
.LC12:
	.string	"1.1"
.LC13:
	.string	"Version: \"%s\" \n"
	.text
	.globl	executeVersion
	.type	executeVersion, @function
executeVersion:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	stdout(%rip), %rax
	movl	$.LC12, %edx
	movl	$.LC13, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$0, %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	executeVersion, .-executeVersion
	.section	.rodata
.LC14:
	.string	"r"
	.align 8
.LC15:
	.string	"[Error] El archivo de input no pudo ser abierto para lectura: %s \n"
	.align 8
.LC16:
	.string	"[Warning] El archivo de input no pudo ser cerrado correctamente: %s \n"
	.text
	.globl	executeWithDefaultOutput
	.type	executeWithDefaultOutput, @function
executeWithDefaultOutput:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	-40(%rbp), %rax
	movl	$.LC14, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L44
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	movl	$.LC15, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L45
.L44:
	movq	stdout(%rip), %rax
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	executeProcess
	movl	%eax, -24(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L46
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L46
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	movl	$.LC16, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L45
.L46:
	cmpl	$4, -24(%rbp)
	jne	.L47
	movl	$4, %eax
	jmp	.L45
.L47:
	movl	$0, %eax
.L45:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	executeWithDefaultOutput, .-executeWithDefaultOutput
	.section	.rodata
.LC17:
	.string	"w"
	.align 8
.LC18:
	.string	"[Error] El archivo de output no pudo ser abierto para escritura: %s \n"
	.align 8
.LC19:
	.string	"[Warning] El archivo de output no pudo ser cerrado correctamente: %s \n"
	.text
	.globl	executeWithDefaultInput
	.type	executeWithDefaultInput, @function
executeWithDefaultInput:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	stdin(%rip), %rax
	movq	%rax, -16(%rbp)
	movq	-40(%rbp), %rax
	movl	$.LC17, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L49
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	movl	$.LC18, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L50
.L49:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	executeProcess
	movl	%eax, -24(%rbp)
	cmpq	$0, -8(%rbp)
	je	.L51
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L51
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	movl	$.LC19, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L50
.L51:
	cmpl	$4, -24(%rbp)
	jne	.L52
	movl	$4, %eax
	jmp	.L50
.L52:
	movl	$0, %eax
.L50:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	executeWithDefaultInput, .-executeWithDefaultInput
	.globl	executeWithParameters
	.type	executeWithParameters, @function
executeWithParameters:
.LFB11:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	movq	-40(%rbp), %rax
	movl	$.LC14, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -16(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L54
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	movl	$.LC15, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L55
.L54:
	movq	-48(%rbp), %rax
	movl	$.LC17, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -8(%rbp)
	cmpq	$0, -8(%rbp)
	jne	.L56
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	movl	$.LC18, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L55
.L56:
	movq	-8(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	executeProcess
	movl	%eax, -28(%rbp)
	cmpq	$0, -16(%rbp)
	je	.L57
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	%eax, -24(%rbp)
	cmpl	$-1, -24(%rbp)
	jne	.L57
	movq	stderr(%rip), %rax
	movq	-40(%rbp), %rdx
	movl	$.LC16, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L55
.L57:
	cmpq	$0, -8(%rbp)
	je	.L58
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	%eax, -20(%rbp)
	cmpl	$-1, -20(%rbp)
	jne	.L58
	movq	stderr(%rip), %rax
	movq	-48(%rbp), %rdx
	movl	$.LC19, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$3, %eax
	jmp	.L55
.L58:
	cmpl	$4, -28(%rbp)
	jne	.L59
	movl	$4, %eax
	jmp	.L55
.L59:
	movl	$0, %eax
.L55:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE11:
	.size	executeWithParameters, .-executeWithParameters
	.section	.rodata
.LC20:
	.string	"-h"
.LC21:
	.string	"--help"
.LC22:
	.string	"-V"
.LC23:
	.string	"--version"
.LC24:
	.string	"-i"
.LC25:
	.string	"--input"
.LC26:
	.string	"-"
.LC27:
	.string	"-o"
.LC28:
	.string	"--output"
	.text
	.globl	executeByMenu
	.type	executeByMenu, @function
executeByMenu:
.LFB12:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	movl	%edi, -84(%rbp)
	movq	%rsi, -96(%rbp)
	cmpl	$1, -84(%rbp)
	jne	.L61
	movl	$0, %eax
	call	executeWithDefaultParameters
	jmp	.L62
.L61:
	cmpl	$2, -84(%rbp)
	jne	.L63
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -80(%rbp)
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC20, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L64
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC21, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L65
.L64:
	movl	$0, %eax
	call	executeHelp
	jmp	.L62
.L65:
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC22, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L66
	movq	-80(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC23, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L67
.L66:
	movl	$0, %eax
	call	executeVersion
	jmp	.L62
.L67:
	movl	$2, %eax
	jmp	.L62
.L63:
	cmpl	$3, -84(%rbp)
	jne	.L68
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -72(%rbp)
	movq	-96(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -64(%rbp)
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC24, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L69
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L70
.L69:
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L71
	movl	$0, %eax
	call	executeWithDefaultParameters
	jmp	.L62
.L71:
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultOutput
	jmp	.L62
.L70:
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC27, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L72
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC28, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L73
.L72:
	movq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L74
	movl	$0, %eax
	call	executeWithDefaultParameters
	jmp	.L62
.L74:
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultInput
	jmp	.L62
.L73:
	movl	$2, %eax
	jmp	.L62
.L68:
	cmpl	$4, -84(%rbp)
	jne	.L75
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-96(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -48(%rbp)
	movq	-96(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC24, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L76
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L77
.L76:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC27, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L78
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC28, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L77
.L78:
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L79
	movl	$0, %eax
	call	executeWithDefaultParameters
	jmp	.L62
.L79:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultOutput
	jmp	.L62
.L77:
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC24, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L80
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L81
.L80:
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC27, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L82
	movq	-56(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC28, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L81
.L82:
	movq	-48(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L83
	movl	$0, %eax
	call	executeWithDefaultParameters
	jmp	.L62
.L83:
	movq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultInput
	jmp	.L62
.L81:
	movl	$2, %eax
	jmp	.L62
.L75:
	cmpl	$5, -84(%rbp)
	jne	.L84
	movq	-96(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -32(%rbp)
	movq	-96(%rbp), %rax
	movq	16(%rax), %rax
	movq	%rax, -24(%rbp)
	movq	-96(%rbp), %rax
	movq	24(%rax), %rax
	movq	%rax, -16(%rbp)
	movq	-96(%rbp), %rax
	movq	32(%rax), %rax
	movq	%rax, -8(%rbp)
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC24, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L85
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L86
.L85:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC27, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L87
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC28, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L86
.L87:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L88
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L88
	movl	$0, %eax
	call	executeWithDefaultParameters
	jmp	.L62
.L88:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L89
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L89
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultInput
	jmp	.L62
.L89:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L90
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L90
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultOutput
	jmp	.L62
.L90:
	movq	-8(%rbp), %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	executeWithParameters
	jmp	.L62
.L86:
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC24, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L91
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC25, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L92
.L91:
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC27, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L93
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC28, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L92
.L93:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L94
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L94
	movl	$0, %eax
	call	executeWithDefaultParameters
	jmp	.L62
.L94:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L95
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L95
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultOutput
	jmp	.L62
.L95:
	movq	-24(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	je	.L96
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC26, %edi
	call	strcmp
	testl	%eax, %eax
	jne	.L96
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	executeWithDefaultInput
	jmp	.L62
.L96:
	movq	-24(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	executeWithParameters
	jmp	.L62
.L92:
	movl	$2, %eax
	jmp	.L62
.L84:
	movl	$2, %eax
.L62:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE12:
	.size	executeByMenu, .-executeByMenu
	.section	.rodata
	.align 8
.LC29:
	.string	"[Error] Cantidad m\303\241xima de par\303\241metros incorrecta: %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB13:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movq	%rsi, -16(%rbp)
	cmpl	$5, -4(%rbp)
	jle	.L98
	movq	stderr(%rip), %rax
	movl	-4(%rbp), %edx
	movl	$.LC29, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	fprintf
	movl	$1, %eax
	jmp	.L99
.L98:
	movq	-16(%rbp), %rdx
	movl	-4(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	executeByMenu
.L99:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE13:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
