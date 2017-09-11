// parameterEx.v

module parameterEx
#(
	parameter N = 2, M = 3	//parameter
)

(
	input wire [N-1:0] a, b, 
	output reg [N-1:0] z
);

always @(a,b)
begin	
	if (a==b)
		z = 1;
	else 
		z = 0;
end
endmodule