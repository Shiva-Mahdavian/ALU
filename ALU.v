`include "adder_subtractor.v"
`include "comparator.v"
`include "mux_6to1.v"



module ALU( A, B, OP, Z, OV);
	
	input [8-1:0] A;
	input [8-1:0] B;
	input [3-1:0] OP;
	output [8-1:0] Z;
	output OV;
	
	
	wire [8-1:0] add;
	wire [8-1:0] sub;
	wire [8-1:0] max;
	wire [8-1:0] min;
	wire [8-1:0] leftShift;
	wire [8-1:0] rightShift;
	wire OVAdd;
	wire OVSub;
	
	assign leftShift = A<<<2;
	assign rightShift = B>>>3;
	assign OV = (~OP[2] && ~OP[1] ) ? (OP[0] ? OVSub : OVAdd) : 1'bz;
	

	
	adder_subtractor
		adder
	(
		.sub(1'b0),
		.a(A),
		.b(B),
		.s(add),
		.carry(),
		.OV(OVAdd)
	);
	
	adder_subtractor
		subtractor
	(
		.sub(1'b1),
		.a(A),
		.b(B),
		.s(sub),
		.carry(),
		.OV(OVSub)
	);	
	
	comparator
		compare
	(
		.a(A),
		.b(B),
		.GT(max),
		.LT(min)
	);
	
	mux_6to1
		mux
	(
		.i0(add),
		.i1(sub),
		.i2(max),
		.i3(min),
		.i4(leftShift),
		.i5(rightShift),
		.s(OP),
		.res(Z)
	);
	
	
	
	
endmodule
