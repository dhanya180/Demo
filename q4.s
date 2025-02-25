.data
num:    .word 0xA12EC465   # Example 32-bit number
str1:   .string "\nNumber of Ones: "
str2:   .string "\nNumber of Zeros: "

.text

main:
    la x10 num
    lw x10 0(x10)
    li x11 32            # Loop counter (for 32 bits)
    li x12 0             # Count of ones
    li x13 0             # Count of zeros

    jal count    
    jal print 

    li a7 10             # Syscall for exit
    ecall

count:
    beqz x11 exit 

    andi x14 x10 1       # Extract the least significant bit (LSB)
    beqz x14 count_zero  # If LSB is 0, go to count_zero
    addi x12 x12 1
    j shift              # Jump to shifting step

count_zero:
    addi x13 x13 1
shift:
    srli x10 x10 1
    addi x11 x11 -1      # Decrease loop counter
    j count
exit:
    jr ra

print:
    la a0 str1
    li a7 4
    ecall
    mv a0 x12
    li a7 1
    ecall

    la a0 str2
    li a7 4
    ecall
    mv a0 x13
    li a7 1
    ecall

    jr ra
