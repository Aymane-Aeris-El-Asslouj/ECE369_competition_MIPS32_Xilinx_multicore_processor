.data
window0: .word    0, 0, 0, 0
frame0:  .word    0

.text
.globl main
main: 
    la      $a2, window0
    la      $a1, frame0
    jal     vbsme
    self: j self

.text
.globl  vbsme
vbsme:

    addi $t0, $zero, 256

    # load window
    SAD_A $zero, 12($a2)
    SAD_A $zero, 8($a2)
    SAD_A $zero, 4($a2)
    SAD_A $zero, 0($a2)

    # load end of last subframe for column 1
    SAD_B $t0, 252($a1)
    SAD_B $t0, 248($a1)
    SAD_B $t0, 244($a1)

    # load subframes and compute SAD min for column 1
    SAD_C $t0, 244($a1)
    SAD_C $t0, 240($a1)
    SAD_C $t0, 236($a1)
    SAD_C $t0, 232($a1)
    SAD_C $t0, 228($a1)
    SAD_C $t0, 224($a1)
    SAD_C $t0, 220($a1)
    SAD_C $t0, 216($a1)
    SAD_C $t0, 212($a1)
    SAD_C $t0, 208($a1)
    SAD_C $t0, 204($a1)
    SAD_C $t0, 200($a1)
    SAD_C $t0, 196($a1)
    SAD_C $t0, 192($a1)
    SAD_C $t0, 188($a1)
    SAD_C $t0, 184($a1)
    SAD_C $t0, 180($a1)
    SAD_C $t0, 176($a1)
    SAD_C $t0, 172($a1)
    SAD_C $t0, 168($a1)
    SAD_C $t0, 164($a1)
    SAD_C $t0, 160($a1)
    SAD_C $t0, 156($a1)
    SAD_C $t0, 152($a1)
    SAD_C $t0, 148($a1)
    SAD_C $t0, 144($a1)
    SAD_C $t0, 140($a1)
    SAD_C $t0, 136($a1)
    SAD_C $t0, 132($a1)
    SAD_C $t0, 128($a1)
    SAD_C $t0, 124($a1)
    SAD_C $t0, 120($a1)
    SAD_C $t0, 116($a1)
    SAD_C $t0, 112($a1)
    SAD_C $t0, 108($a1)
    SAD_C $t0, 104($a1)
    SAD_C $t0, 100($a1)
    SAD_C $t0, 96($a1)
    SAD_C $t0, 92($a1)
    SAD_C $t0, 88($a1)
    SAD_C $t0, 84($a1)
    SAD_C $t0, 80($a1)
    SAD_C $t0, 76($a1)
    SAD_C $t0, 72($a1)
    SAD_C $t0, 68($a1)
    SAD_C $t0, 64($a1)
    SAD_C $t0, 60($a1)
    SAD_C $t0, 56($a1)
    SAD_C $t0, 52($a1)
    SAD_C $t0, 48($a1)
    SAD_C $t0, 44($a1)
    SAD_C $t0, 40($a1)
    SAD_C $t0, 36($a1)
    SAD_C $t0, 32($a1)
    SAD_C $t0, 28($a1)
    SAD_C $t0, 24($a1)
    SAD_C $t0, 20($a1)
    SAD_C $t0, 16($a1)
    SAD_C $t0, 12($a1)
    SAD_C $t0, 8($a1)
    SAD_C $t0, 4($a1)

    lmin $s0, 0($zero)
    ltag $v0, 0($zero)

    
    jr $ra
                buf $v0, $s0


   
