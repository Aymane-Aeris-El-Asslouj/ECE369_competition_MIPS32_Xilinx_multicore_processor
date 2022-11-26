.data
window0: .word    0, 0, 0, 0
frame0:  .word    0

.text
.globl main
main: 
    la      $a1, frame0
    la      $a2, window0
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
    addi $t6, $zero, 30



    START:
    
    lbufa $t1, 0($t5)
    blt $t0, $t1, NOTMIN1
                nop
        addi $t0, $t1, 0
        addi $v0, $t5, 0
    NOTMIN1:
    addi $t5, $t5, 1
    blt $t5, $t6, START
                nop
            


    lbufb $v1, 0($v0)
    sub $v1, $v1, $a1
    addi $v1, $v1, -12
    srl $v1, $v1, 2


    sll $v0, $v0, 1

    srl $t9, $v1, 6
    add $v0, $v0, $t9
    sll $t9, $t9, 6
    sub $v1, $v1, $t9



    jr $ra
                nop


   
