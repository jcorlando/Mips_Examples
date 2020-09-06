.data
    array: .word 88, 66, 97, 91, 90, 64, 71, 77, 75, 85, 58, 99, 83, 78, 48
    length: .word 15
    sum:    .word 0
    average: .word 0
    message1: .asciiz "\nThe sum of the array is : "
    message2: .asciiz "\nThe average of the array is : "
.text
.globl main
    main:
        add	$t0, $0, 0      # t0 is the index of array
        lw	$t1, length		# t1 is the length of array
        add $t5, $0, 0      # t5 is used to calcualte the sum
        add	$t6, $0, 0      # t6 is the running sum of all array elements
        add	$t7, $0, 0      # t7 is the average of all array elements

        move $a0, $t1	    # $a0 = $t1
        sll $a0, $a0, 2     # multiply length by 4 to get relative address; pass to function

        jal	calc_Sum    # jump to calc_Sum and save position to $ra

        move $a0, $t6   # a0 = the total of all the elements
        
        jal calc_Avg    # jump to calc_Avg and save position to $ra

        move $t7, $v0		# $t7 = $v0

        # Print first message
		li $v0, 4
		la $a0, message1
		syscall

        # Display sum
        li $v0, 1
        move $a0, $t6
        syscall

        # Print second message
		li $v0, 4
		la $a0, message2
		syscall

        # Display average
        li $v0, 1
        move $a0, $t7
        syscall

        # End of program
		li $v0, 10  
		syscall     # End of program

        calc_Sum:
            beq $t0, $a0, exit_Sum
            lw $t5, array($t0)  # Load array[i] into t5
            add	$t6, $t6, $t5	# add to the running total
            add	$t0, $t0, 4		# increment index
            j calc_Sum	        # jump to calc_Sum
            
        exit_Sum:
            sw $t6, sum
            jr $ra

        calc_Avg:
            div	$v0, $a0, $t1		# $v0 = $a0 / $t1; return value has been set
            sw $v0, average                 
            jr $ra					# jump to $ra