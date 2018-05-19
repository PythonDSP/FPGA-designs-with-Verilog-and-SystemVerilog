// caseEx2.v

module caseEx2(
	input wire[2:0] s,
	input wire [1:0] i0, i1, i2,
	output reg [1:0] y
	);

always @(s)
begin
	case (s)
		7 : y = i0; // 7
		3 : y = i1;	// 3
		default : y = i2; // 0, 1, 3, 4, 5
	endcase
end
endmodule