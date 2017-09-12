	.file	1 "tp0.c"
	.section .mdebug.abi32
	.previous
	.abicalls
	.text
	.align	2
	.globl	toLowerCase
	.ent	toLowerCase
toLowerCase:
	.frame	$fp,56,$ra		# vars= 16, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,56
	.cprestore 16
	sw	$ra,48($sp)
	sw	$fp,44($sp)
	sw	$gp,40($sp)
	move	$fp,$sp
	sw	$a0,56($fp)
	sw	$a1,60($fp)
	lw	$a0,60($fp)
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L18
	sw	$zero,28($fp)
$L19:
	lw	$v0,28($fp)
	lw	$v1,60($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L22
	b	$L20
$L22:
	lw	$v1,56($fp)
	lw	$v0,28($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,32($fp)
	lb	$v0,32($fp)
	slt	$v0,$v0,65
	bne	$v0,$zero,$L23
	lb	$v0,32($fp)
	slt	$v0,$v0,91
	beq	$v0,$zero,$L23
	lbu	$v0,32($fp)
	addu	$v0,$v0,32
	sb	$v0,32($fp)
$L23:
	lw	$v1,24($fp)
	lw	$v0,28($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,32($fp)
	sb	$v0,0($v1)
	lw	$v0,28($fp)
	addu	$v0,$v0,1
	sw	$v0,28($fp)
	b	$L19
$L20:
	lw	$v0,24($fp)
	lw	$v1,60($fp)
	addu	$v0,$v0,$v1
	sb	$zero,0($v0)
$L18:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,48($sp)
	lw	$fp,44($sp)
	addu	$sp,$sp,56
	j	$ra
	.end	toLowerCase
	.size	toLowerCase, .-toLowerCase
	.rdata
	.align	2
$LC0:
	.ascii	"[Error] Hubo un error en memoria \n\000"
	.text
	.align	2
	.globl	verifyPalindromic
	.ent	verifyPalindromic
verifyPalindromic:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$v0,76($fp)
	addu	$v0,$v0,-1
	sw	$v0,24($fp)
	lw	$v0,72($fp)
	beq	$v0,$zero,$L26
	lw	$v0,24($fp)
	blez	$v0,$L26
	b	$L25
$L26:
	li	$v0,1			# 0x1
	sw	$v0,52($fp)
	b	$L24
$L25:
	lw	$v0,72($fp)
	beq	$v0,$zero,$L27
	lw	$v0,76($fp)
	beq	$v0,$zero,$L27
	lw	$v1,24($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L27
	sw	$zero,52($fp)
	b	$L24
$L27:
	lw	$a0,76($fp)
	la	$t9,malloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L28
	li	$v0,4			# 0x4
	sw	$v0,52($fp)
	b	$L24
$L28:
	lw	$v0,24($fp)
	addu	$v0,$v0,-1
	sw	$v0,32($fp)
	sw	$zero,36($fp)
$L29:
	lw	$v0,36($fp)
	lw	$v1,24($fp)
	slt	$v0,$v0,$v1
	bne	$v0,$zero,$L32
	b	$L30
$L32:
	lw	$v1,28($fp)
	lw	$v0,36($fp)
	addu	$a0,$v1,$v0
	lw	$v1,72($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	lbu	$v0,0($v0)
	sb	$v0,0($a0)
	lw	$v0,32($fp)
	addu	$v0,$v0,-1
	sw	$v0,32($fp)
	lw	$v0,36($fp)
	addu	$v0,$v0,1
	sw	$v0,36($fp)
	b	$L29
$L30:
	lw	$v1,28($fp)
	lw	$v0,24($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	lw	$a0,72($fp)
	lw	$a1,76($fp)
	la	$t9,toLowerCase
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$a0,28($fp)
	lw	$a1,76($fp)
	la	$t9,toLowerCase
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v0,40($fp)
	beq	$v0,$zero,$L34
	lw	$v0,44($fp)
	bne	$v0,$zero,$L33
$L34:
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,4			# 0x4
	sw	$v0,52($fp)
	b	$L24
$L33:
	li	$v0,1			# 0x1
	sw	$v0,48($fp)
	lw	$a0,40($fp)
	lw	$a1,44($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L35
	sw	$zero,48($fp)
$L35:
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,28($fp)
	lw	$a0,40($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,40($fp)
	lw	$a0,44($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,44($fp)
	lw	$v0,48($fp)
	sw	$v0,52($fp)
$L24:
	lw	$v0,52($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	verifyPalindromic
	.size	verifyPalindromic, .-verifyPalindromic
	.align	2
	.globl	isKeywords
	.ent	isKeywords
isKeywords:
	.frame	$fp,24,$ra		# vars= 8, regs= 2/0, args= 0, extra= 8
	.mask	0x50000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,24
	.cprestore 0
	sw	$fp,20($sp)
	sw	$gp,16($sp)
	move	$fp,$sp
	move	$v0,$a0
	sb	$v0,8($fp)
	lb	$v0,8($fp)
	slt	$v0,$v0,65
	bne	$v0,$zero,$L39
	lb	$v0,8($fp)
	slt	$v0,$v0,91
	bne	$v0,$zero,$L38
$L39:
	lb	$v0,8($fp)
	slt	$v0,$v0,97
	bne	$v0,$zero,$L40
	lb	$v0,8($fp)
	slt	$v0,$v0,123
	bne	$v0,$zero,$L38
$L40:
	lb	$v0,8($fp)
	slt	$v0,$v0,48
	bne	$v0,$zero,$L41
	lb	$v0,8($fp)
	slt	$v0,$v0,58
	bne	$v0,$zero,$L38
$L41:
	lb	$v1,8($fp)
	li	$v0,45			# 0x2d
	beq	$v1,$v0,$L38
	lb	$v1,8($fp)
	li	$v0,95			# 0x5f
	beq	$v1,$v0,$L38
	b	$L37
$L38:
	sw	$zero,12($fp)
	b	$L36
$L37:
	li	$v0,1			# 0x1
	sw	$v0,12($fp)
$L36:
	lw	$v0,12($fp)
	move	$sp,$fp
	lw	$fp,20($sp)
	addu	$sp,$sp,24
	j	$ra
	.end	isKeywords
	.size	isKeywords, .-isKeywords
	.rdata
	.align	2
$LC1:
	.ascii	"[Error] Error al escribir en el archivo output la palabr"
	.ascii	"a %s\000"
	.align	2
$LC2:
	.ascii	"[Error] Error al escribir en el archivo output el salto "
	.ascii	"de l\303\255nea.\000"
	.text
	.align	2
	.globl	executeProcess
	.ent	executeProcess
executeProcess:
	.frame	$fp,72,$ra		# vars= 32, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,72
	.cprestore 16
	sw	$ra,64($sp)
	sw	$fp,60($sp)
	sw	$gp,56($sp)
	move	$fp,$sp
	sw	$a0,72($fp)
	sw	$a1,76($fp)
	lw	$a0,72($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,24($fp)
	sw	$zero,28($fp)
	sw	$zero,32($fp)
$L43:
	lw	$v1,24($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L45
	b	$L44
$L45:
	lbu	$v0,24($fp)
	sb	$v0,36($fp)
	lb	$v0,36($fp)
	move	$a0,$v0
	la	$t9,isKeywords
	jal	$ra,$t9
	bne	$v0,$zero,$L46
	lw	$a0,28($fp)
	li	$a1,1			# 0x1
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L47
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,4			# 0x4
	sw	$v0,48($fp)
	b	$L42
$L47:
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	addu	$v1,$v1,$v0
	lbu	$v0,36($fp)
	sb	$v0,0($v1)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	b	$L48
$L46:
	lw	$a0,28($fp)
	li	$a1,1			# 0x1
	la	$t9,realloc
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L49
	la	$a0,__sF+176
	la	$a1,$LC0
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,4			# 0x4
	sw	$v0,48($fp)
	b	$L42
$L49:
	lw	$v1,28($fp)
	lw	$v0,32($fp)
	addu	$v0,$v1,$v0
	sb	$zero,0($v0)
	lw	$v0,32($fp)
	addu	$v0,$v0,1
	sw	$v0,32($fp)
	lw	$a0,28($fp)
	lw	$a1,32($fp)
	la	$t9,verifyPalindromic
	jal	$ra,$t9
	sw	$v0,40($fp)
	lw	$v1,40($fp)
	li	$v0,4			# 0x4
	beq	$v1,$v0,$L50
	lw	$v0,40($fp)
	bne	$v0,$zero,$L54
	lw	$a0,28($fp)
	lw	$a1,76($fp)
	la	$t9,fputs
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v1,44($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L52
	la	$a0,__sF+176
	la	$a1,$LC1
	lw	$a2,28($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,48($fp)
	b	$L42
$L52:
	li	$a0,10			# 0xa
	lw	$a1,76($fp)
	la	$t9,fputc
	jal	$ra,$t9
	sw	$v0,44($fp)
	lw	$v1,44($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L54
	la	$a0,__sF+176
	la	$a1,$LC2
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,48($fp)
	b	$L42
$L50:
	li	$v0,4			# 0x4
	sw	$v0,48($fp)
	b	$L42
$L54:
	lw	$a0,28($fp)
	la	$t9,free
	jal	$ra,$t9
	sw	$zero,28($fp)
	sw	$zero,32($fp)
$L48:
	lw	$a0,72($fp)
	la	$t9,fgetc
	jal	$ra,$t9
	sw	$v0,24($fp)
	b	$L43
$L44:
	sw	$zero,48($fp)
$L42:
	lw	$v0,48($fp)
	move	$sp,$fp
	lw	$ra,64($sp)
	lw	$fp,60($sp)
	addu	$sp,$sp,72
	j	$ra
	.end	executeProcess
	.size	executeProcess, .-executeProcess
	.align	2
	.globl	executeWithDefaultParameters
	.ent	executeWithDefaultParameters
executeWithDefaultParameters:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	la	$v0,__sF
	sw	$v0,24($fp)
	la	$v0,__sF+88
	sw	$v0,28($fp)
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,executeProcess
	jal	$ra,$t9
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	executeWithDefaultParameters
	.size	executeWithDefaultParameters, .-executeWithDefaultParameters
	.rdata
	.align	2
$LC3:
	.ascii	"Usage: \n\000"
	.align	2
$LC4:
	.ascii	"\ttp0 -h \n\000"
	.align	2
$LC5:
	.ascii	"\ttp0 -V \n\000"
	.align	2
$LC6:
	.ascii	"\ttp0 [options] \n\000"
	.align	2
$LC7:
	.ascii	"Options: \n\000"
	.align	2
$LC8:
	.ascii	"\t-V, --version\tPrint version and quit. \n\000"
	.align	2
$LC9:
	.ascii	"\t-h, --help\tPrint this information. \n\000"
	.align	2
$LC10:
	.ascii	"\t-i, --input\tLocation of the input file. \n\000"
	.align	2
$LC11:
	.ascii	"\t-o, --output\tLocation of the output file. \n\000"
	.text
	.align	2
	.globl	executeHelp
	.ent	executeHelp
executeHelp:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,__sF+88
	la	$a1,$LC3
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC4
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC5
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC6
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC7
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC8
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC9
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC10
	la	$t9,fprintf
	jal	$ra,$t9
	la	$a0,__sF+88
	la	$a1,$LC11
	la	$t9,fprintf
	jal	$ra,$t9
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	executeHelp
	.size	executeHelp, .-executeHelp
	.rdata
	.align	2
$LC12:
	.ascii	"Version: \"%s\" \n\000"
	.align	2
$LC13:
	.ascii	"1.1\000"
	.text
	.align	2
	.globl	executeVersion
	.ent	executeVersion
executeVersion:
	.frame	$fp,40,$ra		# vars= 0, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,40
	.cprestore 16
	sw	$ra,32($sp)
	sw	$fp,28($sp)
	sw	$gp,24($sp)
	move	$fp,$sp
	la	$a0,__sF+88
	la	$a1,$LC12
	la	$a2,$LC13
	la	$t9,fprintf
	jal	$ra,$t9
	move	$v0,$zero
	move	$sp,$fp
	lw	$ra,32($sp)
	lw	$fp,28($sp)
	addu	$sp,$sp,40
	j	$ra
	.end	executeVersion
	.size	executeVersion, .-executeVersion
	.rdata
	.align	2
$LC14:
	.ascii	"r\000"
	.align	2
$LC15:
	.ascii	"[Error] El archivo de input no pudo ser abierto para lec"
	.ascii	"tura: %s \n\000"
	.align	2
$LC16:
	.ascii	"[Warning] El archivo de input no pudo ser cerrado correc"
	.ascii	"tamente: %s \n\000"
	.text
	.align	2
	.globl	executeWithDefaultOutput
	.ent	executeWithDefaultOutput
executeWithDefaultOutput:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	lw	$a0,64($fp)
	la	$a1,$LC14
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L59
	la	$a0,__sF+176
	la	$a1,$LC15
	lw	$a2,64($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L58
$L59:
	la	$v0,__sF+88
	sw	$v0,28($fp)
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,executeProcess
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L60
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v1,36($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L60
	la	$a0,__sF+176
	la	$a1,$LC16
	lw	$a2,64($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L58
$L60:
	lw	$v0,32($fp)
	sw	$v0,40($fp)
$L58:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	executeWithDefaultOutput
	.size	executeWithDefaultOutput, .-executeWithDefaultOutput
	.rdata
	.align	2
$LC17:
	.ascii	"w\000"
	.align	2
$LC18:
	.ascii	"[Error] El archivo de output no pudo ser abierto para es"
	.ascii	"critura: %s \n\000"
	.align	2
$LC19:
	.ascii	"[Warning] El archivo de output no pudo ser cerrado corre"
	.ascii	"ctamente: %s \n\000"
	.text
	.align	2
	.globl	executeWithDefaultInput
	.ent	executeWithDefaultInput
executeWithDefaultInput:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	la	$v0,__sF
	sw	$v0,24($fp)
	lw	$a0,64($fp)
	la	$a1,$LC17
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L63
	la	$a0,__sF+176
	la	$a1,$LC18
	lw	$a2,64($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L62
$L63:
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,executeProcess
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,28($fp)
	beq	$v0,$zero,$L64
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v1,36($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L64
	la	$a0,__sF+176
	la	$a1,$LC19
	lw	$a2,64($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L62
$L64:
	lw	$v0,32($fp)
	sw	$v0,40($fp)
$L62:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	executeWithDefaultInput
	.size	executeWithDefaultInput, .-executeWithDefaultInput
	.align	2
	.globl	executeWithParameters
	.ent	executeWithParameters
executeWithParameters:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	lw	$a0,64($fp)
	la	$a1,$LC14
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,24($fp)
	lw	$v0,24($fp)
	bne	$v0,$zero,$L67
	la	$a0,__sF+176
	la	$a1,$LC15
	lw	$a2,64($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L66
$L67:
	lw	$a0,68($fp)
	la	$a1,$LC17
	la	$t9,fopen
	jal	$ra,$t9
	sw	$v0,28($fp)
	lw	$v0,28($fp)
	bne	$v0,$zero,$L68
	la	$a0,__sF+176
	la	$a1,$LC18
	lw	$a2,68($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L66
$L68:
	lw	$a0,24($fp)
	lw	$a1,28($fp)
	la	$t9,executeProcess
	jal	$ra,$t9
	sw	$v0,32($fp)
	lw	$v0,24($fp)
	beq	$v0,$zero,$L69
	lw	$a0,24($fp)
	la	$t9,fclose
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v1,36($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L69
	la	$a0,__sF+176
	la	$a1,$LC16
	lw	$a2,64($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L66
$L69:
	lw	$v0,28($fp)
	beq	$v0,$zero,$L71
	lw	$a0,28($fp)
	la	$t9,fclose
	jal	$ra,$t9
	sw	$v0,36($fp)
	lw	$v1,36($fp)
	li	$v0,-1			# 0xffffffffffffffff
	bne	$v1,$v0,$L71
	la	$a0,__sF+176
	la	$a1,$LC19
	lw	$a2,68($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,3			# 0x3
	sw	$v0,40($fp)
	b	$L66
$L71:
	lw	$v0,32($fp)
	sw	$v0,40($fp)
$L66:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	executeWithParameters
	.size	executeWithParameters, .-executeWithParameters
	.rdata
	.align	2
$LC20:
	.ascii	"-h\000"
	.align	2
$LC21:
	.ascii	"--help\000"
	.align	2
$LC22:
	.ascii	"-V\000"
	.align	2
$LC23:
	.ascii	"--version\000"
	.align	2
$LC24:
	.ascii	"-i\000"
	.align	2
$LC25:
	.ascii	"--input\000"
	.align	2
$LC26:
	.ascii	"-\000"
	.align	2
$LC27:
	.ascii	"-o\000"
	.align	2
$LC28:
	.ascii	"--output\000"
	.text
	.align	2
	.globl	executeByMenu
	.ent	executeByMenu
executeByMenu:
	.frame	$fp,64,$ra		# vars= 24, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,64
	.cprestore 16
	sw	$ra,56($sp)
	sw	$fp,52($sp)
	sw	$gp,48($sp)
	move	$fp,$sp
	sw	$a0,64($fp)
	sw	$a1,68($fp)
	lw	$v1,64($fp)
	li	$v0,1			# 0x1
	bne	$v1,$v0,$L74
	la	$t9,executeWithDefaultParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L74:
	lw	$v1,64($fp)
	li	$v0,2			# 0x2
	bne	$v1,$v0,$L75
	lw	$v0,68($fp)
	addu	$v0,$v0,4
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	la	$a0,$LC20
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L77
	la	$a0,$LC21
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L76
$L77:
	la	$t9,executeHelp
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L76:
	la	$a0,$LC22
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L79
	la	$a0,$LC23
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L78
$L79:
	la	$t9,executeVersion
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L78:
	li	$v0,2			# 0x2
	sw	$v0,40($fp)
	b	$L73
$L75:
	lw	$v1,64($fp)
	li	$v0,3			# 0x3
	bne	$v1,$v0,$L80
	lw	$v0,68($fp)
	addu	$v0,$v0,4
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$v0,68($fp)
	addu	$v0,$v0,8
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	la	$a0,$LC24
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L82
	la	$a0,$LC25
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L81
$L82:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L83
	la	$t9,executeWithDefaultParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L83:
	lw	$a0,28($fp)
	la	$t9,executeWithDefaultOutput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L81:
	la	$a0,$LC27
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L86
	la	$a0,$LC28
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L85
$L86:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L87
	la	$t9,executeWithDefaultParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L87:
	lw	$a0,28($fp)
	la	$t9,executeWithDefaultInput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L85:
	li	$v0,2			# 0x2
	sw	$v0,40($fp)
	b	$L73
$L80:
	lw	$v1,64($fp)
	li	$v0,4			# 0x4
	bne	$v1,$v0,$L89
	lw	$v0,68($fp)
	addu	$v0,$v0,4
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$v0,68($fp)
	addu	$v0,$v0,8
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$v0,68($fp)
	addu	$v0,$v0,12
	lw	$v0,0($v0)
	sw	$v0,32($fp)
	la	$a0,$LC24
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L91
	la	$a0,$LC25
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L90
$L91:
	la	$a0,$LC27
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L92
	la	$a0,$LC28
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L90
$L92:
	la	$a0,$LC26
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L93
	la	$t9,executeWithDefaultParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L93:
	lw	$a0,24($fp)
	la	$t9,executeWithDefaultOutput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L90:
	la	$a0,$LC24
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L96
	la	$a0,$LC25
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L95
$L96:
	la	$a0,$LC27
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L97
	la	$a0,$LC28
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L95
$L97:
	la	$a0,$LC26
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L98
	la	$t9,executeWithDefaultParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L98:
	lw	$a0,24($fp)
	la	$t9,executeWithDefaultInput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L95:
	li	$v0,2			# 0x2
	sw	$v0,40($fp)
	b	$L73
$L89:
	lw	$v1,64($fp)
	li	$v0,5			# 0x5
	bne	$v1,$v0,$L100
	lw	$v0,68($fp)
	addu	$v0,$v0,4
	lw	$v0,0($v0)
	sw	$v0,32($fp)
	lw	$v0,68($fp)
	addu	$v0,$v0,8
	lw	$v0,0($v0)
	sw	$v0,28($fp)
	lw	$v0,68($fp)
	addu	$v0,$v0,12
	lw	$v0,0($v0)
	sw	$v0,24($fp)
	lw	$v0,68($fp)
	addu	$v0,$v0,16
	lw	$v0,0($v0)
	sw	$v0,36($fp)
	la	$a0,$LC24
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L102
	la	$a0,$LC25
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L101
$L102:
	la	$a0,$LC27
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L103
	la	$a0,$LC28
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L101
$L103:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L104
	la	$a0,$LC26
	lw	$a1,36($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L104
	la	$t9,executeWithDefaultParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L104:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L105
	la	$a0,$LC26
	lw	$a1,36($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L105
	lw	$a0,36($fp)
	la	$t9,executeWithDefaultInput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L105:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L106
	la	$a0,$LC26
	lw	$a1,36($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L106
	lw	$a0,28($fp)
	la	$t9,executeWithDefaultOutput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L106:
	lw	$a0,28($fp)
	lw	$a1,36($fp)
	la	$t9,executeWithParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L101:
	la	$a0,$LC24
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L108
	la	$a0,$LC25
	lw	$a1,24($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L107
$L108:
	la	$a0,$LC27
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L109
	la	$a0,$LC28
	lw	$a1,32($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L107
$L109:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L110
	la	$a0,$LC26
	lw	$a1,36($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L110
	la	$t9,executeWithDefaultParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L110:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L111
	la	$a0,$LC26
	lw	$a1,36($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L111
	lw	$a0,36($fp)
	la	$t9,executeWithDefaultOutput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L111:
	la	$a0,$LC26
	lw	$a1,28($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	beq	$v0,$zero,$L112
	la	$a0,$LC26
	lw	$a1,36($fp)
	la	$t9,strcmp
	jal	$ra,$t9
	bne	$v0,$zero,$L112
	lw	$a0,28($fp)
	la	$t9,executeWithDefaultInput
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L112:
	lw	$a0,36($fp)
	lw	$a1,28($fp)
	la	$t9,executeWithParameters
	jal	$ra,$t9
	sw	$v0,40($fp)
	b	$L73
$L107:
	li	$v0,2			# 0x2
	sw	$v0,40($fp)
	b	$L73
$L100:
	li	$v0,2			# 0x2
	sw	$v0,40($fp)
$L73:
	lw	$v0,40($fp)
	move	$sp,$fp
	lw	$ra,56($sp)
	lw	$fp,52($sp)
	addu	$sp,$sp,64
	j	$ra
	.end	executeByMenu
	.size	executeByMenu, .-executeByMenu
	.rdata
	.align	2
$LC29:
	.ascii	"[Error] Cantidad m\303\241xima de par\303\241metros inco"
	.ascii	"rrecta: %d \n\000"
	.text
	.align	2
	.globl	main
	.ent	main
main:
	.frame	$fp,48,$ra		# vars= 8, regs= 3/0, args= 16, extra= 8
	.mask	0xd0000000,-8
	.fmask	0x00000000,0
	.set	noreorder
	.cpload	$t9
	.set	reorder
	subu	$sp,$sp,48
	.cprestore 16
	sw	$ra,40($sp)
	sw	$fp,36($sp)
	sw	$gp,32($sp)
	move	$fp,$sp
	sw	$a0,48($fp)
	sw	$a1,52($fp)
	lw	$v0,48($fp)
	slt	$v0,$v0,6
	bne	$v0,$zero,$L114
	la	$a0,__sF+176
	la	$a1,$LC29
	lw	$a2,48($fp)
	la	$t9,fprintf
	jal	$ra,$t9
	li	$v0,1			# 0x1
	sw	$v0,24($fp)
	b	$L113
$L114:
	lw	$a0,48($fp)
	lw	$a1,52($fp)
	la	$t9,executeByMenu
	jal	$ra,$t9
	sw	$v0,24($fp)
$L113:
	lw	$v0,24($fp)
	move	$sp,$fp
	lw	$ra,40($sp)
	lw	$fp,36($sp)
	addu	$sp,$sp,48
	j	$ra
	.end	main
	.size	main, .-main
	.ident	"GCC: (GNU) 3.3.3 (NetBSD nb3 20040520)"
