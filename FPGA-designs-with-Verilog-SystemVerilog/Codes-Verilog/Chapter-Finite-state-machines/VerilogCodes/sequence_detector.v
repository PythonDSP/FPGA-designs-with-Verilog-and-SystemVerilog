// sequence_detector.v
// non-overlap detection : 110

module sequence_detector
(
	input wire clk, reset,
	input wire x,
	output wire z_mealy_glitch, z_moore_glitch,
	output reg z_mealy_glitch_free, z_moore_glitch_free
);

	// Moore
	localparam [1:0]
		zero_moore = 0,
		one_moore = 1,
		two_moore = 2, 
		three_moore = 3;
	
	// size is [1:0] to store 4 states
	reg[1:0] state_reg_moore, state_next_moore;
	
	// Mealy
	localparam [1:0]
		zero_mealy = 0,
		one_mealy = 1,
		two_mealy = 2, 
		three_mealy = 3;
		
	// size is [1:0] to store 4 states
	reg[1:0] state_reg_mealy, state_next_mealy;

	reg z_moore, z_mealy;
	
	always @(posedge clk, posedge reset) begin 
		if (reset) begin 
			state_reg_moore = zero_moore; 
			state_reg_mealy = zero_mealy; 
		end
		else begin
			state_reg_moore = state_next_moore;
			state_reg_mealy = state_next_mealy;
		end
	end 
	
	// Moore
	always @(state_reg_moore, x) begin 
		z_moore = 1'b0; 
		state_next_moore = state_reg_moore; // default 'next state' is 'current state'
		case(state_reg_moore)  
			zero_moore : 
				if (x == 1'b1 )
					state_next_moore = one_moore;
			one_moore : begin
				if (x == 1'b1)
					state_next_moore = two_moore;
				else 
					state_next_moore = zero_moore;
			end
			two_moore :
				if (x == 1'b0)
					state_next_moore = three_moore; 
			three_moore : begin
				z_moore = 1'b1;
				if (x == 1'b0)
					state_next_moore = zero_moore; 
				else
					state_next_moore = one_moore;
			end
		endcase
	end 
	
	// Mealy
	always @(state_reg_mealy, x) begin 
		z_mealy = 1'b0; 
		state_next_mealy = state_reg_mealy; // default 'next state' is 'current state'
		case (state_reg_mealy) 
			zero_mealy :
				if (x == 1'b1)
					state_next_mealy = one_mealy;
			one_mealy :
				if (x == 1'b1) 
					state_next_mealy = two_mealy;
				else
					state_next_mealy = zero_mealy;
			two_mealy : begin
				state_next_mealy = zero_mealy;
				if (x == 1'b0)
					z_mealy <= 1'b1;
				else 
					state_next_mealy = two_mealy;
			end
		endcase
	end 
	
	// D-FF to remove glitches
	always @(posedge clk, posedge reset) begin
		if (reset == 1'b1) begin
			z_mealy_glitch_free = 1'b0;
			z_moore_glitch_free = 1'b0;
		end
		else begin
			z_mealy_glitch_free = z_mealy; 
			z_moore_glitch_free = z_moore;
		end
	end 
	
assign z_mealy_glitch = z_mealy; 
assign z_moore_glitch = z_moore;

endmodule 
	
			