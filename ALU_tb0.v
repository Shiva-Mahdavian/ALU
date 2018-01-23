//`include "ALU.v"

`timescale 1ns/1ns

module ALU_tb0 ;
	
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
		.OP(3'b000),
		.Z(res),
		.OV(ovrflow)
	);
	
	initial
		begin
		$dumpfile("tb0.vcd");
	        $dumpvars(0, A, B, res, ovrflow);
		for ( i = 0; i < num_tests; i = i + 1 )
			begin
				#5 A = $random;
				#5 B = $random;
			
				#20;
				
	
				$monitor("%b (%d) + %b (%d) = %b (%d), overflow = %b", A, A, B, B, res, res, ovrflow);
				#5;	
			end
		#15 $finish;
		end
endmodule
