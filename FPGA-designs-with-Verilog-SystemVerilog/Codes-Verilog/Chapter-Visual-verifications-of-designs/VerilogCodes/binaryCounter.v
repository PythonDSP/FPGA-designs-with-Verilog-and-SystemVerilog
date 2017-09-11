// binaryCounter.v

module binaryCounter
#(
	parameter N = 3 //N bit binary counter
)
(
	input wire clk, reset, 
	output wire complete_tick, 
	output wire[N-1:0] count
);

localparam MAX_COUNT = 2**N-1; // maximum value for N-bit

reg[N-1:0] count_reg;
wire[N-1:0] count_next;

always @(posedge clk, posedge reset)
begin
	if (reset == 1)
		count_reg = 0;  // set count to 0 if reset
	else
		count_reg = count_next; // assign next value of count
end

assign count_next = count_reg + 1;  // increase the count

// generate tick on each maximum count 
assign complete_tick = (count_reg == MAX_COUNT) ? 1 : 0;

assign count = count_reg; // assign value to output port
endmodule