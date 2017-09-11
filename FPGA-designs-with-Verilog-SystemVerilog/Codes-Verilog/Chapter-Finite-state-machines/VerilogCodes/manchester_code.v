// manchester_code.vhd

module manchester_code
(
	input wire clk, din,
	output wire dout
);

// glitch will occure on transition of signal din
assign dout = clk ^ din; 

endmodule  
