// counterEx.v
// count upto M

module counterEx 
#( parameter 
		M = 6,
		N = 4 // N bits are required for M
	)
(
	input wire clk, reset,
	output wire out_moore
);

	localparam
		start_moore = 0,
		count_moore = 1;
		
	reg state_moore_reg, state_moore_next;
	reg[N-1:0] count_moore_reg, count_moore_next;

	always @(posedge clk, posedge reset) begin 
		if (reset == 1'b1) begin
			state_moore_reg = start_moore;
			count_moore_reg = 0;
		end
		else begin
			state_moore_reg = state_moore_next;
			count_moore_reg = count_moore_next;
		end
	end
	
	always @(count_moore_reg, state_moore_reg)
	begin 
		case (state_moore_reg) 
			start_moore : begin 
				count_moore_next = 0;
				state_moore_next = count_moore;
			end
			count_moore : begin
				count_moore_next = count_moore_reg  + 1;
				if ((count_moore_reg  + 1) == M - 1)
					state_moore_next = start_moore;
				else
					state_moore_next = count_moore;
			end
		endcase
	end 
	
	
	assign out_moore = count_moore_reg;
endmodule
