// dual_port_RAM.v
// created by : Meher Krishna Patel
// date : 26-Dec-16

// Functionality:
	// store and retrieve data from dual port RAM
// ports:
	// we : write enable
	// addr_wr : address for writing data
	// addr_rd : address for reading
	// din : input data to be stored in RAM
	// data : output data read from RAM
	// addr_width : total number of elements to store (put exact number)
	// addr_bits : bits requires to store elements specified by addr_width
	// data_width : number of bits in each elements

module dual_port_RAM
#(
	parameter addr_width = 2,
				 data_width = 3
)
(
	input wire clk,
	input wire we,
	input wire [addr_width-1:0] addr_wr, addr_rd,
	input wire [data_width-1:0] din,
	output wire [data_width-1:0] dout
);

reg [data_width-1:0] ram_dual_port[2**addr_width-1:0];

always @(posedge clk)
begin
	if (we == 1) // write data to address 'addr_wr'
		ram_dual_port[addr_wr] = din;
end

// read data from address 'addr_rd'
assign dout = ram_dual_port[addr_rd];

endmodule 