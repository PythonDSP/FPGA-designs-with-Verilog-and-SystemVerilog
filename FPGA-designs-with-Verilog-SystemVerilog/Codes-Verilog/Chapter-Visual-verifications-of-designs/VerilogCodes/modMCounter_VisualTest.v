// modMCounter_VisualTest.v


module modMCounter_VisualTest
#(parameter M = 12, // count from 0 to M-1
				N = 4  // N bits required to count upto M i.e. 2**N >= M
)

(	input wire CLOCK_50, reset,
	output wire[6:0] HEX0,
	output wire [1:0] LEDR,
	output wire[N-1:0] LEDG
);


wire clk_Pulse1s;
wire[N-1:0] count;

// clock 1 s
clockTick #(.M(50000000), .N(26))
	clock_1s (.clk(CLOCK_50), .reset(reset), 
					.clkPulse(clk_Pulse1s));

assign LEDR[0] = clk_Pulse1s; // display clock pulse of 1 s

// modMCounter with 1 sec clock pulse
modMCounter #(.M(M), .N(N)) 
		modMCounter1s (.clk(clk_Pulse1s), .reset(reset), 
					.complete_tick(LEDR[1]), .count(count));

assign LEDG = count; // display count on green LEDs

// display count on seven segment
hexToSevenSegment hexToSevenSegment0 (
						.hexNumber(count), .sevenSegmentActiveLow(HEX0));
						
						
endmodule