// hexToSevenSegment.v

module hexToSevenSegment
(
	input wire[3:0] hexNumber,
	output wire[6:0] sevenSegmentActiveLow, sevenSegmentActiveHigh
);

reg[6:0] sevenSegment;

always @*
begin
	case(hexNumber)
		4'b0000 : sevenSegment = 7'b1000000; // 0
		4'b0001 : sevenSegment = 7'b1111001; // 1
		4'b0010 : sevenSegment = 7'b0100100; // 2
		4'b0011 : sevenSegment = 7'b0110000; // 3 
		4'b0100 : sevenSegment = 7'b0011001; // 4
		4'b0101 : sevenSegment = 7'b0010010; // 5
		4'b0110 : sevenSegment = 7'b0000010; // 6
		4'b0111 : sevenSegment = 7'b1111000; // 7
		4'b1000 : sevenSegment = 7'b0000000; // 8
		4'b1001 : sevenSegment = 7'b0010000; // 9
		4'b1010 : sevenSegment = 7'b0001000; // a
		4'b1011 : sevenSegment = 7'b0000011; // b
		4'b1100 : sevenSegment = 7'b1000110; // c
		4'b1101 : sevenSegment = 7'b0100001; // d
		4'b1110 : sevenSegment = 7'b0000110; // e
		default : sevenSegment = 7'b0001110; // f
	endcase;
end

assign sevenSegmentActiveLow = sevenSegment;
assign sevenSegmentActiveHigh = ~sevenSegment;

endmodule
