// caseEx.v

module caseEx(
	input wire[1:0] s,
	input wire i0, i1, i2, i3, 
	output reg y
	);

always @(s)
begin
	case (s)
		0 : y = i0;
		2'b01 : y = i1;
		2 : y = i2;
		3 : y = i3;	
	endcase
end
endmodule