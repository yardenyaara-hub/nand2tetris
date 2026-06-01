// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

// Main loop: check keyboard and decide on color
(LOOP)
@KBD
D=M
@FILL_BLACK
D;JNE         // if keyboard != 0, fill with black

// No key pressed: fill with white (0)
@color
M=0           // set color to 0
@SWEEP
0;JMP

(FILL_BLACK)
// Key pressed: fill with black (-1)
@color
M=-1          // set color to -1

// Sweep the screen with the chosen color
(SWEEP)
@24576
D=A
@address
M=D           // address = 24576

(WRITE)
// First, decrement address
@address
M=M-1
// Check if we're still within bounds:
// if address < SCREEN, done with sweep, return to LOOP
D=M
@SCREEN
D=D-A
@LOOP
D;JLT 

// Write the color
@color
D=M
@address
A=M
M=D

@WRITE
0;JMP
