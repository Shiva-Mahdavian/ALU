module comparator
	#(
		parameter nIO = 8
	)
	(
		input signed [nIO-1:0] a,
		input signed [nIO-1:0] b,
		output [nIO-1:0] GT,
		output [nIO-1:0] LT
	);
	
	assign GT = (a > b) ? a : b;
	assign LT = (a < b) ? a : b;
	
endmodule
