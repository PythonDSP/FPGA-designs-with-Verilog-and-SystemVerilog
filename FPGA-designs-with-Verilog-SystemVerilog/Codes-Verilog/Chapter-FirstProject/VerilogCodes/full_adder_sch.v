// Copyright (C) 1991-2011 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II 32-bit"
// VERSION		"Version 11.1 Build 259 01/25/2012 Service Pack 2 SJ Web Edition"
// CREATED		"Tue Jun 13 17:42:53 2017"

module full_adder_sch(
	a,
	b,
	c,
	sum,
	carry
);


input wire	a;
input wire	b;
input wire	c;
output wire	sum;
output wire	carry;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;





half_adder_verilog	b2v_inst(
	.a(a),
	.b(b),
	.sum(SYNTHESIZED_WIRE_0),
	.carry(SYNTHESIZED_WIRE_1));


half_adder_verilog	b2v_inst2(
	.a(c),
	.b(SYNTHESIZED_WIRE_0),
	.sum(sum),
	.carry(SYNTHESIZED_WIRE_2));

assign	carry = SYNTHESIZED_WIRE_1 | SYNTHESIZED_WIRE_2;


endmodule
