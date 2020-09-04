.data
	prompt1: .asciiz "Enter first Number: "
	prompt2: .asciiz "\nEnter second number: "
	prompt3: .asciiz "\nEnter third number: "
	message: .asciiz "\nThe sum is : "
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

		# Compute the sum
		add $t3, $t0, $t1
		add $t0, $t3, $t2


		# Print out message
		li $v0, 4
		la $a0, message
		syscall

		# Print or show the sum
		li $v0, 1
		move $a0, $t0
		syscall


		# All programs must end like this
		li $v0, 10
		syscall
