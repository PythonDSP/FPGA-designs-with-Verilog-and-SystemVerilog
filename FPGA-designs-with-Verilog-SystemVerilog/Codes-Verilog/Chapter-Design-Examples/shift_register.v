// shift_register.v
// created by : Meher Krishna Patel
// date : 22-Dec-16
// Functionality:
// load data and shift it data to left and right
// parallel to serial conversion (i.e. first load, then shift)
// serial to parallel conversion (i.e. first shift, then read)
// inputs:
// ctrl : to load-data and shift operations (right and left shift)
// data : it is the data to be shifted
// q_reg : store the outputs

module shift_register 
#(
	parameter N = 8
)
(
	input wire clk, reset,
	input wire [1:0] ctrl,
	input wire [N-1:0] data,
	output wire [N-1:0] q_reg
);

reg [N-1:0] s_reg, s_next;
always @(posedge clk, posedge reset)
begin
	if(reset)
		s_reg = 0; // clear the content
	else if (clk == 1'b1)
		s_reg = s_next; // otherwise save the next state
end

always @(ctrl, s_reg)
begin
	case (ctrl)
		0 : s_next = s_reg; // no operation (to read data for serial to parallel)
		1 : s_next = {data[N-1], s_reg[N-1:1]}; // right shift
		2 : s_next = {s_reg[N-2:0], data[0]}; // left shift
		3 : s_next = data; // load data (for parallel to serial)
	endcase
end

assign q_reg = s_reg;
endmodule 