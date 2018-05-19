// modMCounter_tb.v

// note that the counter starts the count from 1 after reset (not from 0),
// therefore file "mod_m_counter_desired.txt" starts with 1 (not from 0), 
// also one entry in the file is incorrect i.e. Line 10, where '1' is written
// instead of 'a'. 

`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module modMCounter_tb;

localparam M = 12, N=4, period=20;

reg clk, reset;
wire complete_tick; 

// desired_count is read from file
// count is count provided by modMCounter.v
wire[N-1:0] count;
reg[N-1:0] desired_count;

reg[39:0] error_msg; // message = error

// [3:0] = 4 bit data
// [0:M-1] = 12 rows  in the file mod_m_counter_desired.txt
reg[3:0] read_data [0:M-1];

integer counter_data; // for saving counter-data on file
integer i  = 0, j = 0, total_cycle = M; // used for ending the simulation after M cycle

// unit under test
modMCounter #(.M(M), .N(N)) UUT (.clk(clk), .reset(reset), .complete_tick(complete_tick), .count(count));

// read the data from file
always @(posedge clk)
begin 
    $readmemh("input_output_files/mod_m_counter_desired.txt", read_data);
    if (reset)
        desired_count = 0;
    else 
    begin     
            desired_count = read_data[j];
            j = j+1;
    end    
end

// open csv-file for writing
initial
begin
	counter_data = $fopen("input_output_files/counter_output.csv"); // open file
end

// note that sensitive list is omitted in always block
// therefore always-block run forever
// clock period = 2 ns
always 
begin
    clk = 1'b1; 
    #20; // high for 20 * timescale = 20 ns

    clk = 1'b0;
    #20; // low for 20 * timescale = 20 ns
end

// reset
initial 
begin 
	reset = 1;
	#(period);
	reset = 0;
end


// stop the simulation total_cycle and close the file
// i.e. store only total_cycle values in file
always @(posedge clk)
begin
    if (total_cycle == i) 
    begin
    	$stop;
    	$fclose(counter_data);  // close the file
	end	
    i = i+1;
end

// note that, the comparison is made at negative edge, 
// when all the transition are settled. 
// if we use 'posedge', then result will not be in correct form
always @(negedge clk)
begin
    if (desired_count == count)
        error_msg = "    ";
    else 
        error_msg = "error"; 
end

// print the values on terminal and file
initial
begin
    // write on terminal
    $display("    time, desired_count, count, complete_tick, error_msg");
    // monitors checks and print the transitions
    $monitor("%6d, %10b, %7x, %5b,  %15s", $time, desired_count, count, complete_tick,  error_msg);
    
    // write on the file
    $fdisplay(counter_data, "time, desired_count, count, complete_tick, error_msg");
    $fmonitor(counter_data, "%d,%b,%x,%b,%s", $time, desired_count, count, complete_tick,  error_msg);
end

// // print the values on terminal and file
// // header line
// initial
// begin
//     $fdisplay(counter_data,"time,desired_count,count,complete_tick,error_msg");
// end
// // negative edge is used here, as error values are updated on negedge
// always @(negedge clk)
// begin
//     // write on terminal
//     $display("%6d, %10b, %7x, %5b,  %15s", $time, desired_count, count, complete_tick,  error_msg);
    
//     // write on the file
//     $fdisplay(counter_data, "%d, %d, %x, %b,  %s", $time, desired_count, count, complete_tick,  error_msg);
// end

endmodule