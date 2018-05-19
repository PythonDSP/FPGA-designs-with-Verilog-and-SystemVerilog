// ifEx.v

module ifEx(
	input wire[1:0] s,
	input wire i0, i1, i2, i3, 
	output reg y
	);

always @(s)
begin
	if (s==2'b00)
		begin //begin-end is required for more than one statements
			y = i0;
			// more statements
		end
	else if (s==2'b01)
			y = i1;
	else if (s==2'b10)
			y = i2;
	else if (s==2'b11)
			y = i3;
	else
		y = y; // no change
end

endmodule