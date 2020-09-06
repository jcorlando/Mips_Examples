.data
    prompt:  .asciiz "Enter a number to find its factorial : "
    message: .asciiz "\nThe factorial of the number is : "
    number: .word 0
    answer: .word 0

.text
    .globl main
    main:
        # read the number from the user
        li $v0, 4
        la $a0, prompt
        syscall

        li $v0, 5
        syscall

        sw $v0, number

        # Call the factorial function
        lw $a0, number
        jal fact
        sw $v0, answer

        # Display the results
        li $v0, 4
        la $a0, message
        syscall

        li $v0, 1
        lw $a0, answer
        syscall

        # End of program
        li $v0, 10  
        syscall     # End of program



        
        fact:

            subu $sp, $sp, 8
            sw $ra, ($sp)
            sw $s0, 4($sp)

            # Base Case
            li $v0, 1
            beq $a0, 0, Done

            # fact(number - 1)
            move $s0, $a0
            sub $a0, $a0, 1
            jal fact

            # The stack starts popping off
            mul $v0, $s0, $v0

            Done:
                lw $ra, ($sp)
                lw $s0, 4($sp)
                addu $sp, $sp, 8
                jr $ra
                
