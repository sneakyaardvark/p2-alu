/*
  ECE 171 Project 2
  March 2022
  Andrew Stanton

  Dual 4 to 1 Multiplexer
  Params:
  Output of mux A, Output of mux B, Select bits, inputs for mux A, inputs for mux B
*/

module Dual4to1Mux(OutA, OutB, S, A, B);
input [1:0] S;
input [3:0] A, B;
output OutA, OutB;

assign OutA = A[S];
assign OutB = B[S];
endmodule
