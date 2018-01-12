`include "ALU.v"

`timescale 1ns/1ns

module ALU_tb1 ;
	
	parameter num_tests = 20;
	parameter nIO = 8;
	
	
	integer i;
	reg signed [nIO-1:0] A;
	reg signed [nIO-1:0] B;
	wire signed [nIO-1:0] res;
	wire ovrflow;
	
	
	ALU
		uut
	(
		.A(A),
		.B(B),
		.OP(3'b001),
		.Z(res),
		.OV(ovrflow)
	);
	
	initial
		for ( i = 0; i < num_tests; i = i + 1 )
		begin
			A = $random;
			B = $random;
			
			#10;
				
	
			$display("%b (%d) - %b (%d) = %b (%d), %0s", A, A, B, B, res, res, !uut.OV ? "OK" : "Overflown");
			#3;	
		end
endmodule
