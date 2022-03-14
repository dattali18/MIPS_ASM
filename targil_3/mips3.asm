.text
Main:
	j Ex_3.2		# choosing which program to run
	
	
Ex_3.1:
	li $a0, 0		# a0: is the a0 of an arithmetic series
	li $a1, 2		# a1: is the d in the series (difference)
	li $v0, 0		# v0: is used as the container of the summation
	li $t0, 11		# t0: is used as the counter (or i in a for loop)
				# to sum 10 element the counter need to start at 11
Loop_1:
	add $v0, $v0, $a0	# adding the current element a(n) to the sum 
	add $a0, $a0, $a1	# moving a0 to the next element in the series a(n+1)
	addi $t0, $t0, -1	# decrementing the counter by one
	bne $t0, $zero, Loop_1	# while( t0 != 0) jump back to the start of the loop
	j Exit
	
	# in the case of X being 0 we evaluate to be 1 like in calc 2
	# in the case of n being 0 we evaluate to be 0
	
Ex_3.2:
	li $a0, 6		# a0 : is the number of elements (n) in the series
	li $a1, 0		# a1 : is the var X
	li $v0, 1		# v0 : is the container for the summation starting from 1 because the first element is always 1
	li $t0, 1		# t0 : is used as the container to calculate  X^n
	add $t1, $zero, $a0	# t1 : is used as the first counter i
	addi $t2, $t1, -1	# t2 : is used as the second counter j 
	beq $a0, $zero, case_0	# if a0 (n) = 0 so the result is 0
Loop_2.0:
	j Loop_2.1
Continue:
	mult $t0, $t1		# getting the element n*X^(n-1), after t1 := X^(n-1)
	mflo $t3 		# t3 : is used for the element n*X^(n-1)
	add $v0, $v0, $t3	# adding the element n*X^(n-1) to the summation
	addi $t1, $t1, -1	# updating the counter (i--)
	addi $t2, $t1, -1	# setting j = i - 1
	addi $t0, $zero, 1	# reputing 1 in t0 for the next calcule of X^n
	bne $t1, $zero, Loop_2.0# while( t1 != 0) jump back to the start of the outer loop
	j Exit

Loop_2.1:
	mult $t0, $a1		# t0 * a1 -> hi,lo
	mflo $t0		# putting the result back in t0
	addi $t2, $t2, -1	# updating the counter (j--)
	bne $t2, $zero, Loop_2.1# while( t2 !=) jump back to the start of the inner loop
	j Continue		# jumping back to the outer loop

case_0:
	add $v0, $zero,$zero	# if n = 0 so the sum = 0
	j Exit

Exit:
	nop
