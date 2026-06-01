// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// The algorithm is based on repetitive addition.

//// Replace this comment with your code.

// R2=0
@R2
M=0
// add R0 to R2, R1 times
// R1 serves as the counter, meaning the number of iterations left to go,
// and R2 serves as the accumulator, meaning the current value of the product.
(LOOP)
// if (R1==0) goto END
@R1
D=M
@END
D;JEQ
// R2=R2+R0
@R0
D=M
@R2
M=D+M
// update R1
// R1=R1-1
@R1
M=M-1
// goto LOOP
@LOOP
0;JMP
(END)
@END
0;JMP

