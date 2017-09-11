// ROM_sevenSegment_visualTest.v
// created by : Meher Krishna Patel
// date : 25-Dec-16

// Functionality:
	// retrieve data from ROM and display on seven-segment device and LEDs
// ports:
	// SW : address in binary format
	// HEX0 : display data on seven segment device
	// LEDR : display data on LEDs

module ROM_sevenSegment_visualTest
(
	input wire [3:0] SW,
	output wire [6:0] HEX0,
	output wire [6:0] LEDR
);

// signal to store received data, so that it can be displayed on
// two devices i.e. seven segment display and LEDs
wire [6:0] data;

ROM_sevenSegment seven_segment_ROM(
	.addr(SW), .data(data)
);

assign HEX0 = data; // display on seven segment devices
assign LEDR = data; // display on LEDs

endmodule 