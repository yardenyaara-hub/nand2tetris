/// This file is an example from nand2tetris courese.

// Finds the maximum of R1 and R2 and store the result in R0.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
// if (R1>R2) R0=R1; else R0=R2;
// The algorithm is based on the following observation: if R1-R2 is positive, then R1 is greater than R2; otherwise, R2 is greater than or equal to R1.

// if (R1>R2) goto FIRST
@R2
D=M
@R1
D=M-D
@FIRST
D;JGT
// R0=R2
@R2
D=M
@R0
M=D
@END
0;JMP
(FIRST)
// R0=R1
@R1
D=M
@R0
M=D
(END)
@END
0;JMP
