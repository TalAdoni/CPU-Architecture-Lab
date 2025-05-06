LAB 1 

In the following files we implemented ALU using 3 units (Shifter, Boolean and Arithmetic).


The system is based on 3 optional operation code: 

01 - Arithmetic:

01000 - result = Y + X
01001 - result = Y - X
01010 - result = -X
01011 - result = Y + 1
01100 - result = Y - 1 

control signal `ALUFN` where `ALUFN[4:3]` choose the selected module (`01 -> AdderSub`, `10 -> Shifter`, `11 -> Logic`), and each module act differently with control of `ALUFN[2:0]`.

10 - Shifter:

10000 - result is shift Y left  by k X LSB's 
10001 - result is shift Y right by k X LSB's 

11 - Boolean:

11000 - NOT Y
11001 - X OR Y
11010 - X AND Y
11011 - X XOR Y
11100 - X NOR X 
11101 - X NAND X
11111 - X XNOR Y 

INPUTS:

input X signal

input Y signal 

control signal ALUFN where ALUFN[4:3] choose the selected module (01 -> AdderSub, 10 -> Shifter, 11 -> Logic), and each module act differently with control of ALUFN[2:0].

OUTPUT:

- FLAGS -   Zero, Carry, Negative, Overflow.
- ALUout -  The system output according to the module selected.

#The lab created by Omri Aviram and Tal Adoni.#