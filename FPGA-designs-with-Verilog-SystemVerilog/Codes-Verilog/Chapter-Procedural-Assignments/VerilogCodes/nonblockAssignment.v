// nonblockAssignment.v

module nonblockAssignment(
	input wire x, y, 
	output reg z
	);

always @(x,y)  
begin
	z <= x; // z_new = x
	z <= z & y; // z_new = z_entry + y (not z = z_new + y)
end
endmodule