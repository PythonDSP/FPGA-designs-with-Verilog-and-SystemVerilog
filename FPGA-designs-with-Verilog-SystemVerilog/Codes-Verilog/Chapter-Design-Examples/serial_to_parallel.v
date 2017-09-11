// serial_to_parallel.v

// converts serial data to parallel

module serial_to_parallel
#(	
	parameter N = 8
)
(
	input wire clk, reset,
	input wire data_in, // serial data
	output wire full_tick,  // for external control
	output reg [N-1:0] data_out  // parallel data
);

reg [N-1:0] data_reg, data_next;
reg [N-1:0] count_reg, count_next;
reg full_reg, full_next;

// register is full i.e. parallel data is ready to read
assign full_tick = full_reg;  

// save initial and next value in register
always @(posedge clk, posedge reset) begin
	if(reset) begin
		count_reg = 0;
		full_reg = 0;
		data_reg = 0;
	end
	else begin
		count_reg = count_next;
		full_reg = full_next;
		data_reg = data_next;
	end
end

always @* begin
	count_next = count_reg;
	full_next = full_reg;
	data_next = data_reg;
	data_next[count_reg] = data_in;

	// coversion completed , send data to output
	if (count_reg == N-1) begin
		count_next = 0;
		full_next = 1;
		// conversion completed, send data to output
		data_out = data_reg;
	end
	else begin  // else continue count
		count_next = count_reg + 1;
		full_next = 0;
	end
end
endmodule 
