.data
.word 0x3 0x3 0x4 0x3
base: .word 0x10000000
str1: .string "IIT Tirupati\n"
str2: .string "Value of i is "

.text
addi x10 x0 3 #k=3
addi x11 x0 0 #i=0
lw x12 base

loop:
    lw x13 0(x12) #x13=save[0]
    bne x10 x13 exit
    addi x11 x11 2
    addi x12 x12 8

exit:
    nop
    
    la a0 str1
    li a7 4
    ecall
    
    la a0 str2
    li a7 4
    ecall
    mv a0 x11
    li a7 1
    ecall