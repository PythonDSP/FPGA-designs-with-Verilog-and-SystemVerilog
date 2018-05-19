// blockAssignment.v

module blockAssignment(
	input wire x, y, 
	output reg z
	);

always @(x,y)  
begin
	z = x;  // since z = x
	z = z & y;  // therefore, z = x + y;
end
endmodule