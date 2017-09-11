// comparator2BitMixed.v

module comparator2BitMixed(
	input wire[1:0] a, b,
	output wire eq
	);

reg[1:0] s0, s1;

always @(a,b)
begin
	if (a[0]==b[0]) 
		s0 = 1;
	else
		s0 = 0;
end

always @(a,b)
begin
	if (a[1]==b[1]) 
		s1 = 1;
	else
		s1 = 0;
end

assign eq = s0 & s1;
endmodule
	