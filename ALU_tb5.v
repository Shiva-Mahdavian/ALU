`include "ALU.v"

`timescale 1ns/1ns

module ALU_tb5 ;
	
	parameter num_tests = 20;
	parameter nIO = 8;
	
	
	integer i;
	reg signed [nIO-1:0] B;
	wire signed [nIO-1:0] res;
	
	
	ALU
		uut
	(
		.A(),
		.B(B),
		.OP(3'b101),
		.Z(res),
		.OV()
	);
	
	initial
		for ( i = 0; i < num_tests; i = i + 1 )
		begin
			B = $random;
			
			
			#10;
				
	
			$display("shifted to right : %b (%d) => %b (%d)", B, B, res, res);
			#3;	
		end
endmodule
