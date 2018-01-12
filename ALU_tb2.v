`include "ALU.v"

`timescale 1ns/1ns

module ALU_tb2 ;
	
	parameter num_tests = 20;
	parameter nIO = 8;
	
	
	integer i;
	reg signed [nIO-1:0] A;
	reg signed [nIO-1:0] B;
	wire signed [nIO-1:0] res;
	
	
	ALU
		uut
	(
		.A(A),
		.B(B),
		.OP(3'b010),
		.Z(res),
		.OV()
	);
	
	initial
		for ( i = 0; i < num_tests; i = i + 1 )
		begin
			A = $random;
			B = $random;
			
			#10;
				
	
			$display("max( %b (%d), %b (%d)) = %b (%d)", A, A, B, B, res, res);
			#3;	
		end
endmodule
