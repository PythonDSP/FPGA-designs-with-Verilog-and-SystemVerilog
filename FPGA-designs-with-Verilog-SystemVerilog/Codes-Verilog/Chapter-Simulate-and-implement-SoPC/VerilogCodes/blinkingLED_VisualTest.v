// blinkingLED_VisualTest.v
module blinkingLED_VisualTest
(	
	input wire CLOCK_50, reset,
	output wire[1:0] LEDR
);

nios_blinkingLED u0 (
	  .clk_clk                        (CLOCK_50), // clk.clk
	  .reset_reset_n                  (reset), // reset.reset_n
	  .led_external_connection_export (LEDR[0])  // led_external_connection.export
 );
 
endmodule