// comparator2BitStruct.v

module comparator2BitStruct(
input wire[1:0] a, b,
	output wire eq
	);

wire s0, s1;

comparator1Bit eq_bit0 (.x(a[0]), .y(b[0]), .eq(s0));
comparator1Bit eq_bit1 (.x(a[1]), .y(b[1]), .eq(s1));

assign eq = s0 & s1;
endmodule