//`include "ALU.v"

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
		begin
		$dumpfile("tb5.vcd");
	        $dumpvars(0, B, res);
		for ( i = 0; i < num_tests; i = i + 1 )
			begin
				B = $random;
			
			
				#10;
				
	
				$monitor("shifted to right : %b (%d) => %b (%d)", B, B, res, res);
				#3;	
			end
		#15 $finish;
		end
endmodule
