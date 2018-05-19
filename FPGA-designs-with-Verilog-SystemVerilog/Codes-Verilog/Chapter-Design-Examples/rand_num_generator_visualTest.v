// rand_num_generator_visualTest.v
// created by : Meher Krishna Patel
// date : 22-Dec-16
// if parameter value is changed e.g. N = 5
// then go to rand_num_generator for further modification

module rand_num_generator_visualTest
#(
	parameter N = 3
)
(
	input wire CLOCK_50, reset,
	output wire [N:0] LEDR
);

wire clk_Pulse1s;

// clock 1 s
clockTick #(.M(50000000), .N(26))
		clock_1s (.clk(CLOCK_50), .reset(reset), .clkPulse(clk_Pulse1s));


// rand_num_generator testing with 1 sec clock pulse
rand_num_generator rand_num_generator_1s 
	(	.clk(clk_Pulse1s), 
		.reset(reset),
		.q(LEDR)		
	);

endmodule 