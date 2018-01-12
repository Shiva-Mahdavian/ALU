`include "ALU.v"

`timescale 1ns/1ns

module ALU_tb4 ;
	
	parameter num_tests = 20;
	parameter nIO = 8;
	
	
	integer i;
	reg signed [nIO-1:0] A;
	wire signed [nIO-1:0] res;
	
	
	ALU
		uut
	(
		.A(A),
		.B(),
		.OP(3'b100),
		.Z(res),
		.OV()
	);
	
	initial
		for ( i = 0; i < num_tests; i = i + 1 )
		begin
			A = $random;
			
			
			#10;
				
	
			$display("shifted to left : %b (%d) => %b (%d)", A, A, res, res);
			#3;	
		end
endmodule
