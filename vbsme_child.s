.data
window0: .word    0, 0, 0, 0
frame0:  .word    0

.text
.globl main
main: 
    la      $a1, frame0
    la      $a2, window0
    jal     vbsme
                nop
    self: j self
                nop

.text
.globl  vbsme
vbsme:

    addi $s1, $zero, 244 #61*4

    addi $t8, $zero, 300

    SAD_A $zero, 0($a2)
    SAD_A $zero, 4($a2)
    SAD_A $zero, 8($a2)
    SAD_A $zero, 12($a2)

    sll $s0, $s1, 16
    add $s1, $s1, $a1

    add $t9, $zero, $zero

    BACK_START:
    add $s2, $a1, $t9
    add $s1, $s1, $t9

    SAD_B $zero, 0($s2)
    SAD_B $zero, 4($s2)
    SAD_B $zero, 8($s2)

    SAD_B $t0, 12($s2)
    SAD_B $t1, 16($s2)
    SAD_B $t2, 20($s2)

    FRAME_Y1:
        
        blt $s0, $t0, SKIPA1
                SAD_B $t3, 24($s2)
            addi $s0, $t0, 0
            addi $v0, $s2, 0
        SKIPA1:

        blt $s0, $t1, SKIPA2
                SAD_B $t0, 28($s2)
            addi $s0, $t1, 0
            addi $v0, $s2, 4
        SKIPA2:

        blt $s0, $t2, SKIPA3
                SAD_B $t1, 32($s2)
            addi $s0, $t2, 0
            addi $v0, $s2, 8
        SKIPA3:

        blt $s0, $t3, SKIPA4
                SAD_B $t2, 36($s2)
            addi $s0, $t3, 0
            addi $v0, $s2, 12
        SKIPA4:

    blt $s2, $s1, FRAME_Y1
            addi $s2, $s2, 16


    blt $s0, $t0, SKIPA5
            addi $t9, $t9, 256
        addi $s0, $t0, 0
        addi $v0, $s2, -12
    SKIPA5:

    

    blt $t9, $t8, BACK_START
            nop


    sub $v0, $v0, $a1
    srl $v0, $v0, 2
    buf $s0, $v0

    jr $ra
                nop


   
