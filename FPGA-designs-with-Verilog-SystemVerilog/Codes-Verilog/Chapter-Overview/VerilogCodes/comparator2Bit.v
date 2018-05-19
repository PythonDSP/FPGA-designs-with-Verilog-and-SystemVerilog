// comparator2Bit.v

module comparator2Bit(
	input wire[1:0] a, b,
	output wire eq
	);

wire[3:0] s;

assign s[0] = ~a[1] & ~a[0] & ~b[1] & ~b[0];
assign s[1] = ~a[1] &  a[0] & ~b[1] &  b[0];
assign s[2] =  a[1] & ~a[0] &  b[1] & ~b[0];
assign s[3] =  a[1] &  a[0] &  b[1] &  b[0];

assign eq = s[0] | s[1] | s[2] | s[3];
endmodule
	