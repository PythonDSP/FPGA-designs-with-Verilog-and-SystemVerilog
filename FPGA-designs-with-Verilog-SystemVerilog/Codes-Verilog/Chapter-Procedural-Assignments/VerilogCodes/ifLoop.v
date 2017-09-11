// ifLoop.v (-- This code is for simulation purpose only)
// ideally positive or negative clock edge must be used; which will be discussed later.
module ifLoop
	#(
		parameter N = 3, 
					 M = 2 //not used
	)
	(
	input wire clk,
	input wire[N:0] x, 
	output wire[N:0] z
	);
localparam 
	continueState = 1'b0,
	stopState = 1'b1;

reg currentState;
reg [N:0] count = 0; 

always @(clk, currentState, count)
begin
	if(count<=x)
		currentState = continueState;
	else
		currentState = stopState;
end

// simulation and synthesis difference in verilog: 
// if count is added to sensitivity list i.e. always @(clk, currentState, count) 
// then always block must create an infinite loop (see exaplation)
// but this simulator will work fine for this case
// such error can not be detected in verilog.
always @(clk, currentState) 
begin
	if(currentState==continueState)
		count = count+1;
	else
		count = 0;
end

assign z = count;
endmodule