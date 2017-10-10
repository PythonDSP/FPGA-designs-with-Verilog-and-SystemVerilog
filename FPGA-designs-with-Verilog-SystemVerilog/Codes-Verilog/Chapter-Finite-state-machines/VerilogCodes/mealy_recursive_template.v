// mealy_recursive_template.v

module mealy_recursive_template is 
#( parameter
		param1 : <value>,
		param2 : <value>
)
(
	input wire clk, reset,
	input wire [<size>] input1, input2, ...,
	output reg [<size>] output1, output2, new_output1, new_output2
);

	localparam [<size_state>] // for 4 states : size_state = 1:0
		s0 = 0,
		s1 = 1,
		s2 = 2,
		... ;
		
		reg[<size_state>] state_reg, state_next;  
	
	// timer (optional)
	localparam T1 = <value>;
	localparam T2 = <value>;
	localparam T3 = <value>;
	...
	reg [<size>] t; //<size> should be able to store max(T1, T2, T3) 
	
	// recursive : feedback register
	reg [<size>] r1_reg, r1_next;
	reg [<size>] r2_reg, r2_next;
	...

	// state register : state_reg
	// This process contains sequential part & all the D-FF are 
	// included in this process. Hence, only 'clk' and 'reset' are 
	// required for this process. 
	always(posedge clk, posedge reset)
	begin
		if (reset) begin
			state_reg = s1;
		end
		else begin
			state_reg = state_next;
		end
	end 
	
	// timer (optional)
    always @(clk, reset) begin 
        if (reset) begin
            t = 0;
        end
        else begin
            if state_reg != state_next then  // state is changing
                t = 0;
            else
                t = t + 1;  
        end
    end
	
	// feedback registers: to feedback the outputs
	always @(posedge clk, posedge reset)
	begin
		if (reset) begin
			r1_reg = <initial_value>;
			r2_reg = <initial_value>;
			...
		end
		else begin
			r1_reg = r1_next;
			r2_reg = r2_next;
			...
		end
	end
	
	// next state logic and outputs
	// This is combinational of the sequential design, 
	// which contains the logic for next-state and outputs
	// include all signals and input in sensitive-list except state_next
	always @(input1, input2, ..., state_reg) begin 
		state_next = state_reg; // default state_next
		// default outputs
		output1 = <value>;
		output2 = <value>;
		...
		// default next-states
		r1_next = r1_reg;
		r2_next = r2_reg;
		...
		case (state_reg)
			s0 : begin
				if (<condition> & r1_reg == <value> & t >= T1-1) begin // if (input1 = 2'b01) then
					output1 = <value>;
					output2 = <value>;
					...
					r1_next = <value>;
					r2_next = <value>;
					...
					state_next = s1; 
				end
				else if (<condition> & r2_reg == <value> & t >= T2-1) begin // add all the required coditions
					output1 = <value>;
					output2 = <value>;
					...
					r1_next = <value>;
					...
					state_next = ...; 
				end
				else begin // remain in current state
					output1 = <value>;
					output2 = <value>;
					...
					r2_next = <value>;
					...
					state_next = s0; 
				end
			end
			s1 : begin
				...
			end
		endcase
	end  
		
	// optional D-FF to remove glitches
	always @(posedge clk, posedge reset)
	begin 
		if (reset) begin 
			new_output1 = ... ;
			new_output2 = ... ;
		end
		else begin
			new_output1 = output1; 
			new_output2 = output2; 
		end
	end
endmodule  