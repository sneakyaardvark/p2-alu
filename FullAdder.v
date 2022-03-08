/*
  ECE 171 Project 2
  March 2022
  Andrew Stanton

  Full Adder
  Params:
  Solution, Carry Out, Input A, Input B, Carry In
*/

module FullAdder(S, CO, A, B, CI);
input A,B, CI;
output S, CO;

assign S = A ^ B ^ CI;
assign CO = A & B | A & CI | B & CI;
endmodule
