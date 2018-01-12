module mux_6to1
	#(
		parameter nIO = 8
		
	)
	(
		input [nIO-1:0] i0,
		input [nIO-1:0] i1,
		input [nIO-1:0] i2,
		input [nIO-1:0] i3,
		input [nIO-1:0] i4,
		input [nIO-1:0] i5,
		input [2:0] s,
		output [nIO-1:0] res
	);
	
	assign res = s[2] ?
	(s[0] ? i5 : i4)
	:(s[1] ?
		(s[0] ? i3 : i2)
		:(s[0] ? i1 : i0)
	);
		
endmodule

