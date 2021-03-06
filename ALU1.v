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
  Function Output, Carry Out, Select bit 1, Select bit 2, Input A, Input B, Carry In
*/

module ALU1(F, CarryOut, S1, S0, A, B, CarryIn);
input S1, S0, A, B, CarryIn;
output CarryOut, F;

wire WireCarryIn;
wire [3:0] wireOutput; //outputs for HA, FA, and gate functions
wire [3:0] wireCarryOut; //carry outs for HA and FA


HalfAdder HA1(wireOutput[2], wireCarryOut[2], WireCarryIn, A);
FullAdder FA1(wireOutput[3], wireCarryOut[3], A, B, WireCarryIn);
assign wireOutput[0] = A & ~B;
assign wireOutput[1] = ~A;

assign wireCarryOut[1:0] = 0; // set remaining entries to 0, similar to connecting MUX in's to GND

/* makes the HA carry in 1 so A plus 1 ALWAYS happens when S1=1 & S0=0, but ONLY for the 1-bit. Commented out for 8-bit. With more time you could make this a seperate module -> add it to ALU1 and ALU8. */
assign WireCarryIn = S1 & ~S0 | CarryIn;
//assign WireCarryIn = CarryIn;

Dual4to1Mux Mux1(F, CarryOut, {S1, S0}, wireOutput, wireCarryOut);
endmodule
