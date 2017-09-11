// parameterInstantEx2.v

module parameterInstantEx2
(
    input wire [4:0] a, b, 
    output wire [4:0] z
);

parameterEx compare4bit ( .a(a), .b(b), .z(z));
    defparam compare4bit.N = 5;  // 'defparam' to set the value of parameter

endmodule