//`include "ALU.v"

`timescale 1ns/1ns

module ALU_tb3 ;
	
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
		.OP(3'b011),
		.Z(res),
		.OV()
	);
	
	initial
		begin
		$dumpfile("tb3.vcd");
	        $dumpvars(0, A, B, res);
		for ( i = 0; i < num_tests; i = i + 1 )
			begin
			#5 A = $random;
			#5 B = $random;
			
			#20;
				
	
			$monitor("min( %b (%d), %b (%d)) = %b (%d)", A, A, B, B, res, res);	
			end
		#30$finish;
		end
endmodule
