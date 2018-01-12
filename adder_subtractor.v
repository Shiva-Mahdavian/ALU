module adder_subtractor
	#(
		parameter nIO = 8
	)
	(
		input sub,
		input signed [nIO-1:0] a,
		input signed [nIO-1:0] b,
		output signed [nIO-1:0] s,
		output carry,
		output OV
	);
	
	wire signed [nIO-1:0] bb;
	
	
	assign bb = b ^ {nIO{sub}};
	assign {carry, s} = a + bb + sub;
	assign OV = sub ? 
	( a[nIO-1] != b[nIO-1] && s[nIO-1] != a[nIO-1] )
	: ( a[nIO-1] == b[nIO-1] && s[nIO-1] != a[nIO-1] );	

		
endmodule
