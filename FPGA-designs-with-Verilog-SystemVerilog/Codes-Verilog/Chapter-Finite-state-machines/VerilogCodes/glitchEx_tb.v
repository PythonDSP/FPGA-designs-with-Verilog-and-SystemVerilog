// glitchEx_tb.v

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module glitchEx_tb;

    reg in0, in1, sel;
    wire z;

    localparam period = 20;  

    glitchEx UUT (.in0(in0), .in1(in1), .sel(sel), .z(z));

    // initial // initial block executes only once
    //     begin
    //         // values for a and b
    //         in0 = 1;
    //         in1 = 1;
    //         sel = 0;
    //         #period; // wait for period 

    //         in0 = 1;
    //         in1 = 1;
    //         sel = 0;
    //         #period;

    //         in0 = 1;
    //         in1 = 1;
    //         sel = 0;
    //         #period;

    //         in0 = 1;
    //         in1 = 1;
    //         sel = 0;
    //         #period;
    //     end

    always 
    begin
    in0 = 1;
    in1 = 1;
    sel = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    sel = 1'b0;
    #20; // low for 20 * timescale = 20 ns
end
endmodule