.data
.word 5 
.word 10 
.word -15 
.word 123456 
.word -123456 
.word 0 
.word 1
.text		
main: 	
lw $1, 8($0)
lh $1, 16($0)
lh $1, 18($0)
lb $1, 16($0)
lb $1, 17($0)
lb $1, 18($0)
lb $1, 19($0)
lb $1, 20($0)
addi $2, $0, -6
addi $3, $1, 8
andi $4, $3, -18
ori $5, $3, 18
xori $6, $3, 18
slti $7, $3, -2
mul $8, $3, $2
add $9, $1, $2
sub $10, $1, $2
and $11, $1, $2
or $12, $1, $2
nor $13, $1, $2
xor $14, $1, $2
slt $15, $1, $2
sll $16, $1, 17
srl $17, $8, 3
addi $18, $0, 17
sw $18, 0($0)
sw $17, 4($4)
lw $1, 4($4)
lb $5, 4($4)
lb $6, 5($4)
lb $7, 6($4)
lb $8, 7($4)
lh $9, 4($4)
lh $10, 6($4)
sh $1, 4($4)
sh $2, 6($4)
sb $3, 4($4)
sb $4, 5($4)
sb $5, 6($4)
sb $6, 7($4)
lw $1, 4($4)
j   skip1
addi $1, $0, 0
skip1: beq $6, $7, skip2
addi $1, $0, 0
skip2: beq $6, $8, skip3
bgtz $6, skip4
skip3: bgtz $15, skip5
skip4: bgtz $11, skip6
skip5: addi $1, $0, 0
skip6: bgez $6, skip7
bgez $15, skip7
addi $1, $0, 0
skip7: bgez $11, superskip
back2: j forward1
back1: j back2
superskip: bgez $11, back1
forward1: bne $6, $7, skip8
bne $6, $8, skip9
skip8: addi $1, $0, 0
skip9: bltz $6, skip10
addi $1, $0, 0
skip10: bltz $15, skip11
bltz $11, skip12
skip11: blez $6, skip13
skip12: addi $1, $0, 0
skip13: blez $15, skip14
addi $1, $0, 0
skip14: blez $11, skip15
addi $1, $0, 2
skip15: addi $1, $0, 1
jal func
addi $1, $0, 4
addi $1, $31, 16 
jr $1
addi $1, $0, 0
self: j self
func: addi $1, $0, 2
addi $1, $0, 3
jr $31
.end
