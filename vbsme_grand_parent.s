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


    ltag $v0, 0($zero)  # load half of main column


    lbufa $v1, 0($v0)  # load row with subcolumn with frame and byte offset


    srl $t8, $v1, 16  # load child core number
    sll $t8, $t8, 1
    andi $v1, $v1, 32767  # load child core number

    srl $t9, $v1, 8  # select subcolumn
    srl $v1, $v1, 2  # get row with subcolumn part 2 (accounts for byte-offset)

    sll $t3, $v0, 2
    sll $t4, $v0, 3
    add $v0, $t3, $t4  # get main column

    andi $v1, $v1, 63  # subtract subcolumn from row
    add $v0, $v0, $t8

    jr $ra
                add $v0, $v0, $t9  # add subcolumn to columns


   
