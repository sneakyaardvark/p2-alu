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

wire WireCarry[6:0];
assign WireCarryIn = S1 & ~S0 | CarryIn;

ALU1 ALU1_0(F[0], WireCarry[0], S1, S0, A[0], B[0], WireCarryIn);
ALU1 ALU1_1(F[1], WireCarry[1], S1, S0, A[1], B[1], WireCarry[0]);
ALU1 ALU1_2(F[2], WireCarry[2], S1, S0, A[2], B[2], WireCarry[1]);
ALU1 ALU1_3(F[3], WireCarry[3], S1, S0, A[3], B[3], WireCarry[2]);
ALU1 ALU1_4(F[4], WireCarry[4], S1, S0, A[4], B[4], WireCarry[3]);
ALU1 ALU1_5(F[5], WireCarry[5], S1, S0, A[5], B[5], WireCarry[4]);
ALU1 ALU1_6(F[6], WireCarry[6], S1, S0, A[6], B[6], WireCarry[5]);
ALU1 ALU1_7(F[7], CarryOut, S1, S0, A[7], B[7], WireCarry[6]);
endmodule
