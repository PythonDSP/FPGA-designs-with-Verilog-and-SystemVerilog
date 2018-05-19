// shift_register_visualTest.v
// created by : Meher Krishna Patel
// date : 22-Dec-16
// SW[16:15] : used for control

module shift_register_visualTest
#(
	parameter N =8 
)
(
	input wire CLOCK_50, reset,
	input wire [16:0] SW,
	output wire [N-1:0] LEDR
);

wire clk_Pulse1s;

// clock 1 s
clockTick #(.M(50000000), .N(26))
		clock_1s (.clk(CLOCK_50), .reset(reset), .clkPulse(clk_Pulse1s));
		
// shift_register testing with 1 sec clock pulse
shift_register #(.N(N))
shift_register_1s (
		.clk(clk_Pulse1s), .reset(reset),
		.data(SW[N-1:0]), .ctrl(SW[16:15]),
		.q_reg(LEDR)
);

endmodule 