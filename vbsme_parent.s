.data
.word    0

.text
.globl main
main: 
    jal     vbsme_master
                nop
    self: j self
                nop

.text
.globl  vbsme_master
vbsme_master:

    abuf $zero

    addi $v0, $zero, 0

    lbufa $t0, 0($zero)

    addi $t5, $zero, 0
    addi $t6, $zero, 20


    lbufa $t1, 0($t5)
    lbufa $t2, 1($t5)
    lbufa $t3, 2($t5)

    START:
    

    blt $t0, $t1, NOTMIN1
                lbufa $t4, 3($t5)
        addi $t0, $t1, 0
        addi $v0, $t5, 0
    NOTMIN1:

    blt $t0, $t2, NOTMIN2
                lbufa $t1, 4($t5)
        addi $t0, $t2, 0
        addi $v0, $t5, 1
    NOTMIN2:

    blt $t0, $t3, NOTMIN3
                lbufa $t2, 5($t5)
        addi $t0, $t3, 0
        addi $v0, $t5, 2
    NOTMIN3:

    blt $t0, $t4, NOTMIN4
                lbufa $t3, 6($t5)
        addi $t0, $t4, 0
        addi $v0, $t5, 3
    NOTMIN4:

    blt $t5, $t6, START
            addi $t5, $t5, 4

    blt $t0, $t1, NOTMIN5
                nop
        addi $t0, $t1, 0
        addi $v0, $t5, 0
    NOTMIN5:

    blt $t0, $t2, NOTMIN6
                nop
        addi $t0, $t2, 0
        addi $v0, $t5, 1
    NOTMIN6:

    lbufb $v1, 0($v0)
    sll $v0, $v0, 1

    srl $t9, $v1, 6
    add $v0, $v0, $t9
    sll $t9, $t9, 6
    sub $v1, $v1, $t9



    jr $ra
                nop


   
