.data
    prompt1: .asciiz  "Enter the number of integers you will be entering : "
    prompt2: .asciiz  "Enter an integer : "
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
        move $t1, $t0		# $t1 = $t0; both t1 and t0 have stack pointer
        
        # Allocate stack space
        sub	$sp, $sp, $t0		# $sp = $sp - $t0

        j	while               # jump to while
        

        while:      # Beginning while loop
            ble	$t0, $0, exit	    # if $t0 <= $0 then exit

            # Prompt the user to enter an integer number
		    li $v0, 4
	    	la $a0, prompt2
	    	syscall
		
	    	# Get the user's input
	    	li $v0, 5
	    	syscall


    		# Store the results in t2
	    	move $t2, $v0

            sw	$t2, 0($sp)	  # Store variable on stack
            add	$sp, $sp, 4		# $sp = $sp + 4
            
            sub	$t0, $t0, 4			# $t0 = $t0 - 4
            
            j while				    # jump to while
        
        exit:



		# End of program
		li $v0, 10  
		syscall     # End of program




