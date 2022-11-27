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
    SAD_A $zero, 0($a2)
    SAD_A $zero, 4($a2)
    SAD_A $zero, 8($a2)
    SAD_A $zero, 12($a2)

    # preload frame column 1
    SAD_B $zero, 0($a1)
    SAD_B $zero, 4($a1)
    SAD_B $zero, 8($a1)

    # load and compute SAD min for column 1
    SAD_C $zero, 12($a1)
    SAD_C $zero, 16($a1)
    SAD_C $zero, 20($a1)
    SAD_C $zero, 24($a1)
    SAD_C $zero, 28($a1)
    SAD_C $zero, 32($a1)
    SAD_C $zero, 36($a1)
    SAD_C $zero, 40($a1)
    SAD_C $zero, 44($a1)
    SAD_C $zero, 48($a1)
    SAD_C $zero, 52($a1)
    SAD_C $zero, 56($a1)
    SAD_C $zero, 60($a1)
    SAD_C $zero, 64($a1)
    SAD_C $zero, 68($a1)
    SAD_C $zero, 72($a1)
    SAD_C $zero, 76($a1)
    SAD_C $zero, 80($a1)
    SAD_C $zero, 84($a1)
    SAD_C $zero, 88($a1)
    SAD_C $zero, 92($a1)
    SAD_C $zero, 96($a1)
    SAD_C $zero, 100($a1)
    SAD_C $zero, 104($a1)
    SAD_C $zero, 108($a1)
    SAD_C $zero, 112($a1)
    SAD_C $zero, 116($a1)
    SAD_C $zero, 120($a1)
    SAD_C $zero, 124($a1)
    SAD_C $zero, 128($a1)
    SAD_C $zero, 132($a1)
    SAD_C $zero, 136($a1)
    SAD_C $zero, 140($a1)
    SAD_C $zero, 144($a1)
    SAD_C $zero, 148($a1)
    SAD_C $zero, 152($a1)
    SAD_C $zero, 156($a1)
    SAD_C $zero, 160($a1)
    SAD_C $zero, 164($a1)
    SAD_C $zero, 168($a1)
    SAD_C $zero, 172($a1)
    SAD_C $zero, 176($a1)
    SAD_C $zero, 180($a1)
    SAD_C $zero, 184($a1)
    SAD_C $zero, 188($a1)
    SAD_C $zero, 192($a1)
    SAD_C $zero, 196($a1)
    SAD_C $zero, 200($a1)
    SAD_C $zero, 204($a1)
    SAD_C $zero, 208($a1)
    SAD_C $zero, 212($a1)
    SAD_C $zero, 216($a1)
    SAD_C $zero, 220($a1)
    SAD_C $zero, 224($a1)
    SAD_C $zero, 228($a1)
    SAD_C $zero, 232($a1)
    SAD_C $zero, 236($a1)
    SAD_C $zero, 240($a1)
    SAD_C $zero, 244($a1)
    SAD_C $zero, 248($a1)
    SAD_C $zero, 252($a1)

    # preload frame column 2
    SAD_B $zero, 256($a1)
    SAD_B $zero, 260($a1)
    SAD_B $zero, 264($a1)

    # load and compute SAD min for column 2
    SAD_C $zero, 268($a1)
    SAD_C $zero, 272($a1)
    SAD_C $zero, 276($a1)
    SAD_C $zero, 280($a1)
    SAD_C $zero, 284($a1)
    SAD_C $zero, 288($a1)
    SAD_C $zero, 292($a1)
    SAD_C $zero, 296($a1)
    SAD_C $zero, 300($a1)
    SAD_C $zero, 304($a1)
    SAD_C $zero, 308($a1)
    SAD_C $zero, 312($a1)
    SAD_C $zero, 316($a1)
    SAD_C $zero, 320($a1)
    SAD_C $zero, 324($a1)
    SAD_C $zero, 328($a1)
    SAD_C $zero, 332($a1)
    SAD_C $zero, 336($a1)
    SAD_C $zero, 340($a1)
    SAD_C $zero, 344($a1)
    SAD_C $zero, 348($a1)
    SAD_C $zero, 352($a1)
    SAD_C $zero, 356($a1)
    SAD_C $zero, 360($a1)
    SAD_C $zero, 364($a1)
    SAD_C $zero, 368($a1)
    SAD_C $zero, 372($a1)
    SAD_C $zero, 376($a1)
    SAD_C $zero, 380($a1)
    SAD_C $zero, 384($a1)
    SAD_C $zero, 388($a1)
    SAD_C $zero, 392($a1)
    SAD_C $zero, 396($a1)
    SAD_C $zero, 400($a1)
    SAD_C $zero, 404($a1)
    SAD_C $zero, 408($a1)
    SAD_C $zero, 412($a1)
    SAD_C $zero, 416($a1)
    SAD_C $zero, 420($a1)
    SAD_C $zero, 424($a1)
    SAD_C $zero, 428($a1)
    SAD_C $zero, 432($a1)
    SAD_C $zero, 436($a1)
    SAD_C $zero, 440($a1)
    SAD_C $zero, 444($a1)
    SAD_C $zero, 448($a1)
    SAD_C $zero, 452($a1)
    SAD_C $zero, 456($a1)
    SAD_C $zero, 460($a1)
    SAD_C $zero, 464($a1)
    SAD_C $zero, 468($a1)
    SAD_C $zero, 472($a1)
    SAD_C $zero, 476($a1)
    SAD_C $zero, 480($a1)
    SAD_C $zero, 484($a1)
    SAD_C $zero, 488($a1)
    SAD_C $zero, 492($a1)
    SAD_C $zero, 496($a1)
    SAD_C $zero, 500($a1)
    SAD_C $zero, 504($a1)
    SAD_C $zero, 508($a1)
    
    lmin $s0, 0($zero)
    ltag $v0, 0($zero)

    buf $v0, $s0

    jr $ra
                nop


   
