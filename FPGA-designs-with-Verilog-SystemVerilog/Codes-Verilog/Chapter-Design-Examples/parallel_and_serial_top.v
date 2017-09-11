// parallel_and_serial_top.v

// test parallel_to_serial.v and serial_to_parallel.v
// parallel data (i.e. count from modMCounter) is converted into 
// serial data using parallel_to_serial.v then tranmitted. 
// Next,  transmitted data is received at serial_to_parallel.v and 
// converted back to parallel. If everything  is working properly then 
//  count should be displayed on 'out_count'. 

module parallel_and_serial_top(
	reset,
	clk,
	out_count
);

input wire	reset;
input wire	clk;
output wire	[3:0] out_count;

wire	eclk;
wire	[3:0] parallel_count;
wire	serial_count;

// count from modMCounter
modMCounter	unit_counter(
	.clk(eclk),
	.reset(reset),
	
	.count(parallel_count));
	defparam	unit_counter.M = 12;
	defparam	unit_counter.N = 4;


// count converted into serial data
parallel_to_serial	unit_p_s(
	.clk(clk),
	.reset(reset),
	.data_in(parallel_count),
	.empty_tick(eclk),
	.data_out(serial_count));
	defparam	unit_p_s.N = 4;


// serial data converted back to parallel data
serial_to_parallel	unit_s_p(
	.clk(clk),
	.reset(reset),
	.data_in(serial_count),
	
	.data_out(out_count));
	defparam	unit_s_p.N = 4;


endmodule
