// constantEx.v

module constantEx(
	input wire [3:0] a, b, 
	output wire [3:0] z
);

localparam N = 3, M = 2; //localparam

wire [N:0] x;
wire [2**N:0] y;

// use x and y here
assign z = a & b;

endmodule