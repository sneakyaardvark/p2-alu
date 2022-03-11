/*
  ECE 171 Project 2
  March 2022
  Andrew Stanton

  Testbench
  A 1-bit ALU that performs:
    F = A + ~B
    F = ~A
    F = A plus 1
    F = A plus B plus CarryIn
*/

`timescale 1ns/1ns
module TestBenchALU1();
reg S1, S0, A, B, CarryIn; //inputs
wire CarryOut, F; //outputs

ALU1 ALU(F, CarryOut, S1, S0, A, B, CarryIn);

integer i;
initial
begin
  //dump data for use with GTKWave
  $dumpfile("TestBenchALU1.vcd");
  $dumpvars(0,TestBenchALU1);
for (i = 0; i <= 31; i = i + 1)
  begin
    #10 {S1, S0, A, B, CarryIn} = i;
  end
$finish();
end
endmodule
