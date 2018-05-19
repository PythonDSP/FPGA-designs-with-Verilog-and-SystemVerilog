// half_adder_verilog.v

module half_adder_verilog(
	input wire a, b, 
	output wire sum, carry
);
	
assign sum = a ^ b; 
assign carry = a & b; 

endmodule

