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

    addi $t6, $zero, 63

    # get minimum of child core computations
    lbufc $zero, 0($zero)
    lbufc $zero, 1($zero)
    lbufc $zero, 2($zero)
    lbufc $zero, 3($zero)
    lbufc $zero, 4($zero)
    lbufc $zero, 5($zero)
    lbufc $zero, 6($zero)
    lbufc $zero, 7($zero)
    lbufc $zero, 8($zero)
    lbufc $zero, 9($zero)
    lbufc $zero, 10($zero)
    lbufc $zero, 11($zero)
    lbufc $zero, 12($zero)
    lbufc $zero, 13($zero)
    lbufc $zero, 14($zero)
    lbufc $zero, 15($zero)
    lbufc $zero, 16($zero)
    lbufc $zero, 17($zero)
    lbufc $zero, 18($zero)
    lbufc $zero, 19($zero)
    lbufc $zero, 20($zero)
    lbufc $zero, 21($zero)
    lbufc $zero, 22($zero)
    lbufc $zero, 23($zero)
    lbufc $zero, 24($zero)
    lbufc $zero, 25($zero)
    lbufc $zero, 26($zero)
    lbufc $zero, 27($zero)
    lbufc $zero, 28($zero)
    lbufc $zero, 29($zero)
    lbufc $zero, 30($zero)


    ltag $v0, 0($zero)  # load half of main column

    lmin $s0, 0($zero)  # load sum

    lbufa $v1, 0($v0)  # load row with subcolumn with frame and byte offset

    sll $v0, $v0, 1  # get main column

    sub $v1, $v1, $a1  # get row with subcolumn part 1 (accounts for frame-offset)

    srl $v1, $v1, 2  # get row with subcolumn part 2 (accounts for byte-offset)
    srl $t9, $v1, 6  # select subcolumn

    add $v0, $v0, $t9  # add subcolumn to columns
    

    jr $ra
          and $v1, $v1, $t6  # subtract subcolumn from row
