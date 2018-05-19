// parallel_and_serial_top_visual.v

// visual test for parallel_and_serial_top.v

module parallel_and_serial_top_visual(
  reset,
  CLOCK_50,
  LEDG
);

input wire  reset;
input wire  CLOCK_50;
output wire[3:0] LEDG;

wire  clk1ms;

// parallel_and_serial_top
parallel_and_serial_top  unit_p_s_top(
  .reset(reset),
  .clk(clk1ms),
  .out_count(LEDG));

// 1 ms clock
clockTick  unit_clk1ms(
  .clk(CLOCK_50),
  .reset(reset),
  .clkPulse(clk1ms));
  defparam  unit_clk1ms.M = 5000000;
  defparam  unit_clk1ms.N = 23;

endmodule
