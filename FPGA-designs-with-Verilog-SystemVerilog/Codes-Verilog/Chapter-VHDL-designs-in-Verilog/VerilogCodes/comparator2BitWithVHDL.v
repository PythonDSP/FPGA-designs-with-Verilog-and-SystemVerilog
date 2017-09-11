// comparator2BitWithVHDL.v
module comparator2BitWithVHDL(
input wire[1:0] a, b,
	output wire eq
	);

wire s0, s1;

// instantiate 1 bit comparator
comparator1BitVHDL eq_bit0 (.x(a[0]), .y(b[0]), .eq(s0));
comparator1BitVHDL eq_bit1 (.x(a[1]), .y(b[1]), .eq(s1));

assign eq = s0 & s1;
endmodule