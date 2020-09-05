.data
    prompt1: .asciiz  "Enter the number of integers you will be entering : "
    prompt2: .asciiz  "\nEnter an integer : "
    prompt3: .asciiz  "\nThe sum of the numbers is : "
.text
.globl main
	main:
        # Prompt the user to enter the number of integers
		li $v0, 4
		la $a0, prompt1
		syscall
		
		# Get the user's input
		li $v0, 5
		syscall

		# Store the results in t0
		move $t0, $v0

        # Allocate enough space for the stack
        sll $t0, $t0, 2     # This is to multiply t0 by 4 to get memory allocation size
                            # t0 now has the amount of memory needed for stack
        move $t3, $t0		# $t3 = $t0
        
        # Allocate stack space
        sub	$sp, $sp, $t0		# $sp = $sp - $t0
        move $t1, $sp		    # $t1 = $sp; t1 also gets the stack pointer address

        j	while               # jump to while
        

        while:      # Beginning while loop
            ble	$t0, $0, sum	    # if $t0 <= $0 then go to sum

            # Prompt the user to enter an integer number
		    li $v0, 4
	    	la $a0, prompt2
	    	syscall
		
	    	# Get the user's input
	    	li $v0, 5
	    	syscall


    		# Store the results in t2
	    	move $t2, $v0

            sw	$t2, ($t1)	        # Store number on stack
            add	$t1, $t1, 4		    # $t1 = $t1 + 4; increment stack address by 1 word
            
            
            sub	$t0, $t0, 4			# $t0 = $t0 - 4: decrement
            
            j while				    # jump to while

        sum:
            ble	$t3, $0, end        # if $t3 <= $0 then go to end
            lw $s1, ($sp)		    # load int into register
            add	$s0, $s0, $s1		# $s0 = $s0 + $s1; s0 is running total
            sub	$t3, $t3, 4		    # $t3 = $t3 - 4; stack counter
            add	$sp, $sp, 4		    # $sp = $sp + 4; popping stack
            j sum
        end:


        # Print out prompt3
		li $v0, 4
		la $a0, prompt3
		syscall

		# Print or show the sum
		li $v0, 1
		move $a0, $s0
		syscall

		# End of program
		li $v0, 10  
		syscall     # End of program
