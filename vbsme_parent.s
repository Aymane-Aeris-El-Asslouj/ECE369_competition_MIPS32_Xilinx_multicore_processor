.data
window0: .word    0, 0, 0, 0
frame0:  .word    0

.text
.globl main
main: 
    la      $a2, window0
    la      $a1, frame0
    jal     vbsme_master
    self: j self

.text
.globl  vbsme_master
vbsme_master:

    # get minimum of child core computations
    lbufc $zero, 0($zero)
    lbufc $zero, 1($zero)
    lbufc $zero, 2($zero)
    lbufc $zero, 3($zero)
    lbufc $zero, 4($zero)
    lbufc $zero, 5($zero)

    ltag $v0, 0($zero)  # load child core number with min SAD

    lbufa $v1, 0($v0)  # load row with subcolumn with frame and byte offset

    lmin $s0, 0($zero)

    sub $v1, $v1, $a1  # get row with subcolumn part 1 (accounts for frame-offset)

    sll $v0, $v0, 16

    add $v0, $v0, $v1

    
    jr $ra
                buf $v0, $s0


   
