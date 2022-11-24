.data

window0: .word    0, 0, 0, 0,
frame0:  .word    126


.text

.globl main

main: 
    la      $a1, frame0
    la      $a2, window0
    jal     vbsme

    self: j self

.text
.globl  vbsme


# Begin subroutine
vbsme:  

    addi $t7, $zero, 61
    sll $s0, $t7, 18

    SAD_A $zero, 0($a2)
    SAD_A $zero, 4($a2)
    SAD_A $zero, 8($a2)
    SAD_A $zero, 12($a2)

    addi $s2, $zero, 0
    FRAME_X:

        add $s6, $a1, $s2

        SAD_B $zero, 0($s6)
        SAD_B $zero, 64($s6)
        SAD_B $zero, 128($s6)

        addi $s3, $zero, 0
        FRAME_Y:

            sll $t9, $s3, 6
            add $t8, $s6, $t9
            SAD_B $t0, 192($t8)

            sub $t9, $t0, $s0
            bgez $t9, SKIP
                addi $s0, $t0, 0
                addi $v0, $s3, 0
                addi $v1, $s2, 0
            SKIP:
            
            addi $s3, $s3, 1
        bne $s3, $t7, FRAME_Y
        addi $s2, $s2, 1
    bne $s2, $t7, FRAME_X

    jr $ra


   
