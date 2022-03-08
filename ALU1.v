/*
  ECE 171 Project 2
  March 2022
  Andrew Stanton

  A 1-bit ALU that performs:
    F = A + ~B
    F = ~A
    F = A plus 1
    F = A plus B plus CarryIn
  Params:
  Select bit 1, Select bit 2, Input A, Input B, Carry In, Carry Out, Function Output
*/

module ALU1(S1, S0, A, B, CarryIn, CarryOut, F);
input S1, S0, A, B, CarryIn;
output CarryOut, F;

wire [3:0] wireOutput; //outputs for HA, FA, and gate functions
wire [3:0] wireCarryOut;

HalfAdder HA1(wireOutput[0], wireCarryOut[0], A, CarryIn);
FullAdder FA1(wireOutput[1], wireCarryOut[1], A, B, CarryIn)
assign wireOutput[2] = A & ~B;
assign wireOutput[3] = ~A;

assign wireCarryOut[3:2] = 0; // set remaining entries to 0, similar to connecting MUX in's to GND
Dual4to1Mux Mux1(F, CarryOut, {S1, S0}, wireOutput, wireCarryOut);
endmodule
