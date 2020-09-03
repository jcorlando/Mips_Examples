.data
	prompt: .asciiz "Enter your age: "
	message: .asciiz "\nYour age is "
.text
.globl main
	main:
		# Prompt the user to enter age
		li $v0, 4
		la $a0, prompt
		syscall
		
		# Get the user's input
		li $v0, 5
		syscall

		# Store the results in t0
		move $t0, $v0

		# Print out user's age
		li $v0, 4
		la $a0, message
		syscall

		# Print or show the age
		li $v0, 1
		move $a0, $t0
		syscall


		# All programs must end like this
		li $v0, 10
		syscall
