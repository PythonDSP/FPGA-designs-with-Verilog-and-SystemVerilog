// parameterInstantEx.v

module parameterInstantEx
(
	input wire [4:0] a, b, 
	output wire [4:0] z
);

parameterEx #(.N(5)) compare4bit ( .a(a), .b(b), .z(z));

endmodule