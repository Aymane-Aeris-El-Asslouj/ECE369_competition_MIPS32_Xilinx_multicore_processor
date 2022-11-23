.text
.main
loop: add $t0, $zero, $zero
addi $t1, $zero, 6
addi $t2, $zero, 10
sw $t1, 0($t0)
sw $t2, 4($t0)
lw $s0, 0($t0)
lw $s1, 4($t0)
sub $t3, $s1, $s0
sll $t4, $t3, 3
srl $t5, $t4, 2
j loop
