//`include "ALU.v"

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
		begin
		$dumpfile("tb1.vcd");
	        $dumpvars(0, A, B, res, ovrflow);
		for ( i = 0; i < num_tests; i = i + 1 )
			begin
				#5 A = $random;
				#5 B = $random;
			
				#20;
	
				$monitor("%b (%d) - %b (%d) = %b (%d), overflow = %b", A, A, B, B, res, res, ovrflow);
				#3;	
			end
		#30 $finish;
		end
endmodule
