// always_ff_ex.sv

module always_ff_ex
(
    input logic clk, reset,
    output logic y, z
);

always_ff @(posedge clk, posedge reset) begin
    if (reset) begin
        y <= 0;
        z <= 0;
    end
    else begin
        y <= 1;
        z <= 1;
    end
end

endmodule 