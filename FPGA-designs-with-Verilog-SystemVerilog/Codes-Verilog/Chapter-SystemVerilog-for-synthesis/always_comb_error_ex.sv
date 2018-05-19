// always_comb_error_ex.sv
module always_comb_error_ex
(
    input logic a, b,
    output logic y, z
);

// Error (10166): SystemVerilog RTL Coding error at always_comb_error_ex.sv(13): always_comb 
// construct does not infer purely combinational logic
// Info (10041): Inferred latch for "z" at always_comb_error_ex.sv(17)
// Info (10041): Inferred latch for "y" at always_comb_error_ex.sv(17)
always_comb begin 
    if (a > b) begin 
        y = 1;
        z = 0;
    end
    else if (a < b) begin
        // y = 0;  // missing output will create latch
        z = 1;
    end
    // else begin   // missing 'else' block will create latch
        // y = 1;
        // z = 1;
    // end
end 

endmodule 