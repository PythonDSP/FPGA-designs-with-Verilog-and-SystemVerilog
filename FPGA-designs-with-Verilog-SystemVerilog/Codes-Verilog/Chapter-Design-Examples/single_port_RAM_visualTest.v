// single_port_RAM_visualTest.v
// created by : Meher Krishna Patel
// date : 26-Dec-16

// Functionality:
	// store and retrieve data from single port RAM
// ports:
	// Write Enable (we) : SW[16]
	// Address (addr) : SW[15-14]
	// din : SW[2:0]
	// dout : LEDR

module single_port_RAM_visualTest
#(
	parameter ADDR_WIDTH = 2,
	parameter DATA_WIDTH = 3
)
(
	input wire CLOCK_50,
	input wire [16:0] SW,
	output wire [DATA_WIDTH-1:0] LEDR
);

single_port_RAM single_port_RAM_test( 
		.clk(CLOCK_50),
		.we(SW[16]),
		.addr(SW[15:14]),
		.din(SW[2:0]),	
		.dout(LEDR)
);

endmodule 