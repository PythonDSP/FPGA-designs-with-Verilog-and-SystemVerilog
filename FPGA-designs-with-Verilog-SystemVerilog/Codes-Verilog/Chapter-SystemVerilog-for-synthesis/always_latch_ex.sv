// always_latch_ex.sv
module always_latch_ex
(
    input logic a, b,
    output logic y, z
);

always_latch begin 
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