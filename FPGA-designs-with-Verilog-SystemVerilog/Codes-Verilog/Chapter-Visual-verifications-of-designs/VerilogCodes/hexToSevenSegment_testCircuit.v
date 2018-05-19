// hexToSevenSegment_testCircuit
// testing circuit for hexToSevenSegment.vhd

module hexToSevenSegment_testCircuit
(
	input wire[3:0] SW, 
	output wire[6:0] HEX0, HEX1
);

hexToSevenSegment hexToSevenSegment0 (
						.hexNumber(SW), .sevenSegmentActiveLow(HEX0));
						
hexToSevenSegment hexToSevenSegment1 (
						.hexNumber(SW), .sevenSegmentActiveHigh(HEX1));
						
endmodule						