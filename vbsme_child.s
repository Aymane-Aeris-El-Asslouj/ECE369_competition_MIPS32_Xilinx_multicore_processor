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

    # load window
    SAD_A $zero, 12($a2)
    SAD_A $zero, 8($a2)
    SAD_A $zero, 4($a2)
    SAD_A $zero, 0($a2)

    # load end of last subframe for column 1
    SAD_B $zero, 252($a1)
    SAD_B $zero, 248($a1)
    SAD_B $zero, 244($a1)

    # load subframes and compute SAD min for column 1
    SAD_C $zero, 240($a1)
    SAD_C $zero, 236($a1)
    SAD_C $zero, 232($a1)
    SAD_C $zero, 228($a1)
    SAD_C $zero, 224($a1)
    SAD_C $zero, 220($a1)
    SAD_C $zero, 216($a1)
    SAD_C $zero, 212($a1)
    SAD_C $zero, 208($a1)
    SAD_C $zero, 204($a1)
    SAD_C $zero, 200($a1)
    SAD_C $zero, 196($a1)
    SAD_C $zero, 192($a1)
    SAD_C $zero, 188($a1)
    SAD_C $zero, 184($a1)
    SAD_C $zero, 180($a1)
    SAD_C $zero, 176($a1)
    SAD_C $zero, 172($a1)
    SAD_C $zero, 168($a1)
    SAD_C $zero, 164($a1)
    SAD_C $zero, 160($a1)
    SAD_C $zero, 156($a1)
    SAD_C $zero, 152($a1)
    SAD_C $zero, 148($a1)
    SAD_C $zero, 144($a1)
    SAD_C $zero, 140($a1)
    SAD_C $zero, 136($a1)
    SAD_C $zero, 132($a1)
    SAD_C $zero, 128($a1)
    SAD_C $zero, 124($a1)
    SAD_C $zero, 120($a1)
    SAD_C $zero, 116($a1)
    SAD_C $zero, 112($a1)
    SAD_C $zero, 108($a1)
    SAD_C $zero, 104($a1)
    SAD_C $zero, 100($a1)
    SAD_C $zero, 96($a1)
    SAD_C $zero, 92($a1)
    SAD_C $zero, 88($a1)
    SAD_C $zero, 84($a1)
    SAD_C $zero, 80($a1)
    SAD_C $zero, 76($a1)
    SAD_C $zero, 72($a1)
    SAD_C $zero, 68($a1)
    SAD_C $zero, 64($a1)
    SAD_C $zero, 60($a1)
    SAD_C $zero, 56($a1)
    SAD_C $zero, 52($a1)
    SAD_C $zero, 48($a1)
    SAD_C $zero, 44($a1)
    SAD_C $zero, 40($a1)
    SAD_C $zero, 36($a1)
    SAD_C $zero, 32($a1)
    SAD_C $zero, 28($a1)
    SAD_C $zero, 24($a1)
    SAD_C $zero, 20($a1)
    SAD_C $zero, 16($a1)
    SAD_C $zero, 12($a1)
    SAD_C $zero, 8($a1)
    SAD_C $zero, 4($a1)
    SAD_C $zero, 0($a1)

    
    lmin $s0, 0($zero)
    ltag $v0, 0($zero)

    buf $v0, $s0

    jr $ra
                nop


   
