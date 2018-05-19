// always_latch_error_ex.sv
module always_latch_error_ex
(
    input logic a, b,
    output logic y, z
);

// Error (10165): SystemVerilog RTL Coding error at always_latch_error_ex.sv(11): 
// always_latch construct does not infer latched logic
always_latch begin 
    if (a > b) begin 
        y = 1;
        z = 0;
    end
    else if (a < b) begin
        y = 0;  // missing output will create latch
        z = 1;
    end
    else begin   // missing 'else' block will create latch
        y = 1;
        z = 1;
    end
end 

endmodule 