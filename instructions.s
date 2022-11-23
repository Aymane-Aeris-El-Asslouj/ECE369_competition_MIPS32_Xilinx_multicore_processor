34040000	//	main:		ori	$a0, $zero, 0 ->	main:		ori	$a0, $zero, 0
2008000a	//			addi	$t0, $zero, 10 ->			addi	$t0, $zero, 10
20090006	//			addi	$t1, $zero, 6 ->			addi	$t1, $zero, 6
01095022	//			sub	$t2, $t0, $t1 ->			sub	$t2, $t0, $t1
71495802	//			mul	$t3, $t2, $t1 ->			mul	$t3, $t2, $t1
012b6020	//			add	$t4, $t1, $t3 ->			add	$t4, $t1, $t3
200d7fff	//			addi	$t5, $zero, 32767 ->			addi	$t5, $zero, 32767
21ad7fff	//			addi	$t5, $t5, 32767 ->			addi	$t5, $t5, 32767
21ad2347	//			addi	$t5, $t5, 9031 ->			addi	$t5, $t5, 9031
ac8d0010	//			sw	$t5, 16($a0) ->			sw	$t5, 16($a0)
a48d0014	//			sh	$t5, 20($a0) ->			sh	$t5, 20($a0)
a08d0018	//			sb	$t5, 24($a0) ->			sb	$t5, 24($a0)
808e0018	//			lb	$t6, 24($a0) ->			lb	$t6, 24($a0)
848e0014	//			lh	$t6, 20($a0) ->			lh	$t6, 20($a0)
8c8e0010	//			lw	$t6, 16($a0) ->			lw	$t6, 16($a0)
392d0001	//			xori	$t5, $t1, 1 ->			xori	$t5, $t1, 1
01ab6826	//			xor	$t5, $t5, $t3 ->			xor	$t5, $t5, $t3
316d7fff	//			andi	$t5, $t3, 32767 ->			andi	$t5, $t3, 32767
01896824	//			and	$t5, $t4, $t1 ->			and	$t5, $t4, $t1
350d0001	//			ori	$t5, $t0, 1 ->			ori	$t5, $t0, 1
01096825	//			or	$t5, $t0, $t1 ->			or	$t5, $t0, $t1
01096827	//			nor	$t5, $t0, $t1 ->			nor	$t5, $t0, $t1
296d03e8	//			slti	$t5, $t3, 1000 ->			slti	$t5, $t3, 1000
018b602a	//			slt	$t4, $t4, $t3 ->			slt	$t4, $t4, $t3
000d6a00	//			sll	$t5, $t5, 8 ->			sll	$t5, $t5, 8
000d6882	//			srl	$t5, $t5, 2 ->			srl	$t5, $t5, 2
1d000001	//			bgtz	$t0, b1 ->			bgtz	$t0, b1
2008ffff	//			addi	$t0, $zero, -1 ->			addi	$t0, $zero, -1
20080001	//	b1:		addi	$t0, $zero, 1 ->	b1:		addi	$t0, $zero, 1
2008ffff	//			addi	$t0, $zero, -1 ->			addi	$t0, $zero, -1
05010001	//			bgez	$t0, b2 ->			bgez	$t0, b2
20080005	//			addi	$t0, $zero, 5 ->			addi	$t0, $zero, 5
21080007	//	b2:		addi	$t0, $t0, 7 ->	b2:		addi	$t0, $t0, 7
11080001	//			beq	$t0, $t0, b3 ->			beq	$t0, $t0, b3
2009000a	//			addi	$t1, $zero, 10 ->			addi	$t1, $zero, 10
2129000f	//	b3:		addi	$t1, $t1, 15 ->	b3:		addi	$t1, $t1, 15
15090001	//			bne	$t0, $t1, b4 ->			bne	$t0, $t1, b4
20090014	//			addi	$t1, $zero, 20 ->			addi	$t1, $zero, 20
2129001e	//	b4:		addi	$t1, $t1, 30 ->	b4:		addi	$t1, $t1, 30
19200001	//			blez	$t1, b5 ->			blez	$t1, b5
20090028	//			addi	$t1, $zero, 40 ->			addi	$t1, $zero, 40
21290032	//	b5:		addi	$t1, $t1, 50 ->	b5:		addi	$t1, $t1, 50
200d0003	//			addi	$t5, $zero, 3 ->			addi	$t5, $zero, 3
05a00004	//	b6:		bltz	$t5, exit ->	b6:		bltz	$t5, exit
0c00002e	//			jal	dummy_func ->			jal	dummy_func
0800002b	//			j	b6 ->			j	b6
21adffff	//	dummy_func:	addi	$t5, $t5, -1 ->	dummy_func:	addi	$t5, $t5, -1
03e00008	//			jr	$ra ->			jr	$ra
08000000	//	exit:		j	main ->	exit:		j	main
