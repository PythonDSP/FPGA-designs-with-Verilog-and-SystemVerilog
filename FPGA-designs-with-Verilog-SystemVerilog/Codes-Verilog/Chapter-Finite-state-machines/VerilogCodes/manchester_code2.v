// manchester_code2.vhd

module manchester_code2
(
	input wire clk, din,
	output reg dout
);

// glitch will occure on transition of signal din
always @(posedge clk, negedge clk)
	dout = clk ^ din; 

endmodule  
