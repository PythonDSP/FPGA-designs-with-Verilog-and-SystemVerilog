// square_wave_ex.vhd

module square_wave_ex
#( parameter 
		N = 4, // Number of bits to represent the time
		on_time = 3'd5,
		off_time = 3'd3
)
(
	input wire clk, reset,
	output reg s_wave
);

	localparam 
		onState = 0, 
		offState = 1;
	reg state_reg, state_next;
	reg[N-1:0] t = 0;

	always @(posedge clk, posedge reset) begin 
		if (reset == 1'b1)
			state_reg = offState; 
		else
			state_reg = state_next;
	end
	
	always @(clk, reset) begin 
		if (state_reg != state_next)
			t = 0;
		else
			t = t + 1;
	end

	always @(state_reg, t) begin
		case (state_reg)
			offState : begin
				s_wave = 1'b0; 
				if (t == off_time - 1) 
					state_next = onState;
				else
					state_next = offState; 
			end
			onState : begin
				s_wave = 1'b1; 
				if (t == on_time - 1)
					state_next = offState;
				else
					state_next = onState;
			end
		endcase
	end
endmodule 
