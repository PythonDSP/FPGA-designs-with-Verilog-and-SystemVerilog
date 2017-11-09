// enum_typedef_example.sv

module enum_typedef_example
#( parameter 
        N = 4, // Number of bits to represent the time
        on_time = 3'd5,
        off_time = 3'd3
)
(
    input logic clk, reset,
    output logic s_wave
);


//    use below line for more than two states, and change
//    [1:0] to desired size e.g if state_t has 12 values then 
//    use [3:0] etc.
//    typedef enum logic[1:0] {onState, offState} state_t;
    typedef enum logic {onState, offState} state_t;
    state_t state_reg, state_next;

    logic [N-1:0] t = 0;
    
    always_ff @(posedge clk, posedge reset) begin 
        if (reset == 1'b1)
            state_reg <= offState; 
        else
            state_reg <= state_next;
    end
    
    always_ff @(posedge clk, posedge reset) begin 
        if (state_reg != state_next)
            t <= 0;
        else
            t <= t + 1;
    end

    always_comb begin
        case (state_reg)
            offState : begin
                s_wave = 1'b0; 
                if (t == off_time - 1) 
                    state_next = onState;
                else
                    state_next = offState; 
            end
            onState : begin
                s_wave = 1'b1; 
                if (t == on_time - 1)
                    state_next = offState;
                else
                    state_next = onState;
            end
        endcase
    end
endmodule 
