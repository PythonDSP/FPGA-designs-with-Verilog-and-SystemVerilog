// edgeDetector_VisualTest.v

module edgeDetector_VisualTest
(
	input wire CLOCK_50, reset, 
	input wire[1:0] SW,
	output wire[1:0] LEDR
);

wire clk_Pulse1s;

// clock 1 s
clockTick #(.M(50000000), .N(26)) 
	clock_1s (.clk(CLOCK_50), .reset(reset), 
					.clkPulse(clk_Pulse1s));

					
// edge detector
edgeDetector edgeDetector_VisualTest(.clk(clk_Pulse1s), .reset(reset), 
			.level(SW[1]), .Moore_tick(LEDR[0]) , .Mealy_tick(LEDR[1]));
			
endmodule