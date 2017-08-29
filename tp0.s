	.file   1 "tp0.c"
        .section .mdebug.abi32
        .previous
        .abicalls
        .text
        .align  2
        .globl  toLowerCase
        .ent    toLowerCase
toLowerCase:
        .frame  $fp,56,$ra              # vars= 16, regs= 3/0, args= 16, extra= 8
        .mask   0xd0000000,-8
        .fmask  0x00000000,0
        .set    noreorder
        .cpload $t9
        .set    reorder
        subu    $sp,$sp,56
        .cprestore 16
        sw      $ra,48($sp)
        sw      $fp,44($sp)
        sw      $gp,40($sp)
        move    $fp,$sp
        sw      $a0,56($fp)
        sw      $a1,60($fp)
        lw      $a0,60($fp)
        la      $t9,malloc
        jal     $ra,$t9
        sw      $v0,24($fp)
        sw      $zero,28($fp)
$L18:
        lw      $v0,28($fp)
        lw      $v1,60($fp)
        slt     $v0,$v0,$v1
        bne     $v0,$zero,$L21
        b       $L19
$L21:
        lw      $v1,56($fp)
        lw      $v0,28($fp)
        addu    $v0,$v1,$v0
        lbu     $v0,0($v0)
        sb      $v0,32($fp)
        lb      $v0,32($fp)
        slt     $v0,$v0,65
        bne     $v0,$zero,$L22
        lb      $v0,32($fp)
        slt     $v0,$v0,91
        beq     $v0,$zero,$L22
        lb      $v0,32($fp)
        addu    $v0,$v0,-65
        sw      $v0,36($fp)
        lw      $v1,36($fp)
        sltu    $v0,$v1,26
        beq     $v0,$zero,$L22
        lw      $v0,36($fp)
        sll     $v1,$v0,2
        la      $v0,$L51
        addu    $v0,$v1,$v0
        lw      $v0,0($v0)
        .cpadd  $v0
        j       $v0
        .rdata
        .align  2
$L51:
        .gpword $L24
        .gpword $L25
        .gpword $L26
