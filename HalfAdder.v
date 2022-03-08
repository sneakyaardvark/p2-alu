/*
  ECE 171 Project 2
  March 2022
  Andrew Stanton

  Half Adder
  Params:
  Solution, Carry Out, input A, input B
*/

module HalfAdder(S, CO, A, B);
input A,B;
output S, CO;

assign S = A ^ B;
assign CO = A & B;
endmodule
