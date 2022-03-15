/*
  An 8-bit ALU that performs:
    F = A + ~B
    F = ~A
    F = A plus 1
    F = A plus B plus CarryIn
  Params:
  Select bit 1, Select bit 2, Input A, Input B, Carry In, Carry Out, Function Output
*/

module ALU8Bit (S1, S0, A, B, CarryIn, CarryOut, F);
input [7:0] A, B;
input S1, S0, CarryIn;
output [7:0] F;
output CarryOut;

wire WireCarry[8:0];
genvar i;
assign CarryOut = WireCarry[8];
assign WireCarry[0] = S1 & ~S0 | CarryIn;

generate
  for (i=0; i < 8; i = i+1)
  begin:ALU
    ALU1 a(F[i], WireCarry[i+1], S1, S0, A[i], B[i], WireCarry[i]);
  end
endgenerate
endmodule
