// comparator2BitProcedure.sv
// Meher Krishna Patel 
// Date : 04-Sep-17

module comparator2BitProcedure
(   input logic[1:0] a, b,
    output logic eq
);
 
always @(a,b) begin
    if (a[0]==b[0] && a[1]==b[1]) 
        eq = 1;
    else
        eq = 0;
end

endmodule
    