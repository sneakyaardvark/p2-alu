module Golden8Bit (S1, S0, A, B, CI, CO, F);
input [7:0] A, B;
input S1, S0;
input CI;
output reg CO;
output reg [7:0] F;

always@(S1, S0, A, B, CI)
begin
	case ({S1, S0})
	2'b00: begin F=A & ~B; CO=1'bz; end
	2'b01: begin F=~A; CO=1'bz; end
	2'b10: begin {CO, F}= A + 1'b1; end	
	2'b11: begin {CO, F}=A+B+CI; end
	endcase
end

endmodule



module testALU8bit();
reg [7:0] A, B;
reg S1, S0;
reg CI;
wire CO, GCO;
wire [7:0] F, GF;

integer stimulus;
reg error;
parameter stimulusmax = 131072; //2^17



task ReportError;
begin
$display("\n***Error.  S1=%b S0=%b A=%b B=%b CarryIn=%b | Expected F=%b CarryOut=%b | Returned F=%b Carryout=%b", S1, S0, A, B, CI, GF, GCO, F, CO);
end
endtask



initial
begin
	error = 0;
	$display ("\n ALU8Bit Test\n");
  
  
  //00 
    {S1, S0} = 2'b00;
    for (stimulus=0; stimulus < stimulusmax; stimulus = stimulus +1)
    begin
      {A, B, CI} = stimulus[16:0];
      #100
      if(F !== GF)
      begin
        ReportError;
        error=1;
      end
    end
  
  //01 
    {S1, S0} = 2'b01;
    for (stimulus=0; stimulus < stimulusmax; stimulus = stimulus +1)
    begin
      {A, B, CI} = stimulus[16:0];
      #100
      if(F !== GF)
      begin
        ReportError;
        error=1;
      end
    end
  
  //10 
    {S1, S0} = 2'b10;
    for (stimulus=0; stimulus < stimulusmax ; stimulus = stimulus +1)
    begin
      {A, B, CI} = stimulus[16:0];
      #100
      if({CO, F} !== {GCO, GF})
      begin
        ReportError;
        error=1;
      end
    end
  
  //11 
    {S1, S0} = 2'b11;
    for (stimulus=0; stimulus < stimulusmax ; stimulus = stimulus +1)
    begin
      {A, B, CI} = stimulus[16:0];
      #100
      if({CO, F} !== {GCO, GF})
      begin
        ReportError;
        error=1;
      end
    end

	
  
  if (!error)
	  $display("*** Congratulations!	 No errors detected\n");
  else
	  $display("*** Sorry.	Try again.\n");
	
  $finish();
end



//Device under Test
ALU8Bit A1 (S1, S0, A, B, CI, CO, F);
Golden8Bit G1 (S1, S0, A, B, CI, GCO, GF);

endmodule
