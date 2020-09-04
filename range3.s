.data
	prompt1: .asciiz "Enter first Number: "
	prompt2: .asciiz "\nEnter second number: "
	prompt3: .asciiz "\nEnter third number: "
	message: .asciiz "\nThe range of these numbers is : "
	minimum: .asciiz "\nThe minimum is : "
	maximum: .asciiz "\nThe maximum is : "
.text
.globl main
	main:
		# Prompt the user to enter first number
		li $v0, 4
		la $a0, prompt1
		syscall
		
		# Get the user's input (First Number)
		li $v0, 5
		syscall

		# Store the results in t0
		move $t0, $v0


		# Prompt the user to enter Second number
		li $v0, 4
		la $a0, prompt2
		syscall


		# Get the user's input (Second Number)
		li $v0, 5
		syscall

		# Store the results in t1
		move $t1, $v0


		# Prompt the user to enter Third number
		li $v0, 4
		la $a0, prompt3
		syscall


		# Get the user's input (Third Number)
		li $v0, 5
		syscall

		# Store the results in t2
		move $t2, $v0


		# Find the range procedures

		jal find_min		# jump to find_min and save position to $ra


		jal	find_max		# jump to find_max and save position to $ra
		
		# Compute range
		sub	$t4, $t9, $t8		# $t7 = $t9 - $t8
		

		# Print out message
		li $v0, 4
		la $a0, message
		syscall

		# Print or show the range of these numbers
		li $v0, 1
		move $a0, $t4
		syscall


		# All programs must end like this
		li $v0, 10
		syscall

	find_max:
		bgt		$t0, $t1, find_max_2		# if $t0 > $t1 then find_max_2
											# t0 < t1
		bgt		$t1, $t2, find_max_t1		# if $t1 > $t2 then find_max_t1
											# t1 < t2
		j find_max_t2						# jump to find_max_t2
		
	find_max_2:
		bgt		$t0, $t2, find_max_t0		# if $t0 > $t2 then find_max_t0
											# t0 < t2
		j find_max_t2						# jump to find_max_t2

	
		

	find_max_t0:

		# Print out maximum message	 # t0 is the maximum
		li $v0, 4
		la $a0, maximum
		syscall

		# Print the maximum value  # t0 is the maximum
		li $v0, 1
		move $t9, $t0
		move $a0, $t0
		syscall
		jr $ra

	find_max_t1:

		# Print out maximum message	 # t1 is the maximum
		li $v0, 4
		la $a0, maximum
		syscall

		# Print the maximum value  # t1 is the maximum
		li $v0, 1
		move $t9, $t1
		move $a0, $t1
		syscall
		jr $ra

	find_max_t2:

		# Print out maximum message	 # t2 is the maximum
		li $v0, 4
		la $a0, maximum
		syscall

		# Print the maximum value  # t2 is the maximum
		li $v0, 1
		move $t9, $t2
		move $a0, $t2
		syscall
		jr $ra


	find_min:
			
		slt $t7, $t0, $t1
		beq $t7, $0, find_min2 	   # t0 > t1
								   # t0 < t1
		slt $t7, $t0, $t2
		beq $t7, $0, find_min_t2   # t0 > t2
								   # t0 < t2
		

		# Print out minimum message	 # t0 is the minimum
		li $v0, 4
		la $a0, minimum
		syscall

		# Print the minimum value  # t0 is the minimum
		li $v0, 1
		move $t8, $t0
		move $a0, $t0
		syscall
		jr $ra
	
	find_min2:
		slt $t7, $t1, $t2
		beq $t7, $0, find_min_t2  # t1 > t2
								  # t1 < t2

		# Print out minimum message	 # t1 is the minimum
		li $v0, 4
		la $a0, minimum
		syscall

		# Print the minimum value  # t1 is the minimum
		li $v0, 1
		move $t8, $t1
		move $a0, $t1
		syscall
		jr $ra


	find_min_t2:
		# Print out minimum message	 # t2 is the minimum
		li $v0, 4
		la $a0, minimum
		syscall

		# Print the minimum value  # t2 is the minimum
		li $v0, 1
		move $t8, $t2
		move $a0, $t2
		syscall
		jr $ra

