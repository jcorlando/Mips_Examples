.data
    array: .word 88, 66, 97, 91, 90, 64, 71, 77, 75, 85, 58, 99, 83, 78, 48
.text
.globl main
    main:

        la $s0, array # put address of array into $so

        # End of program
		li $v0, 10  
		syscall     # End of program


