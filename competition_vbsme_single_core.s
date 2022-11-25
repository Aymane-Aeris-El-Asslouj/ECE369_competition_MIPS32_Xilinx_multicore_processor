.data
window0: .word    0, 0, 0, 0
frame0:  .word    0

.text
.globl main
main: 
    la      $a1, frame0
    la      $a2, window0
    jal     vbsme
    self: j self

.text
.globl  vbsme
vbsme:

    addi $t7, $zero, 244 #61*4

    SAD_A $zero, 0($a2)
    SAD_A $zero, 4($a2)
    SAD_A $zero, 8($a2)
    SAD_A $zero, 12($a2)

    sll $s0, $t7, 16
    addi $s3, $zero, 0

    SAD_B $zero, 0($a1)
    SAD_B $zero, 4($a1)
    SAD_B $zero, 8($a1)

    FRAME_Y:

        add $t8, $a1, $s3
        SAD_B $t0, 12($t8)

        sub $t9, $t0, $s0
        bgez $t9, SKIP
        addi $s0, $t0, 0
        addi $v0, $s3, 0
        SKIP:

        addi $s3, $s3, 4
    bne $s3, $t7, FRAME_Y

    buf $s0, $v0

    jr $ra


   
