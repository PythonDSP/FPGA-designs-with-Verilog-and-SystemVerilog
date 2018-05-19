// conditionalEx.v

module conditionalEx(
	input wire[1:0] s,
	input wire i0, i1, i2, i3, 
	output wire y
);

assign y = (s == 2'b00) ? i0 : // y = i0 if s=00
			     (s == 2'b01) ? i1 : // y = i1 if s=01
			     (s == 2'b10) ? i2 : // y = i2 if s=10
			     (s == 2'b11) ? i3 : // y = i3 if s=11
			     y; // else y = y i.e. no change
endmodule