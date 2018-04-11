`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.04.2018 10:52:19
// Design Name: 
// Module Name: pilot_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pilot_tb();

reg clk;
reg rst;
reg [31:0] signal_in; 
reg [12:0] frame_length;
reg [12:0] pilot_interval;
reg [31:0] pilot_value;
wire [31:0] signal_out;

wire ready_out;
reg ready_in;
wire valid_out;
reg valid_in;

wire error;
wire pilot_inserted;
wire frame_end;
    

Pilot_Top dut (
    .clk (clk),
    .rst (rst),

    .signal_in (signal_in),
    .signal_out(signal_out),

    .frame_length(frame_length),
    .pilot_interval(pilot_interval),
    .pilot_value(pilot_value),

    .ready_in (ready_in),
    .ready_out (ready_out),
    .valid_out (valid_out),
    .valid_in (valid_in),

    .error (error),
    .pilot_inserted (pilot_inserted),
    .frame_end(frame_end)
);
    
// Setup CLK

always begin
  #5 clk = ~clk;
end

initial begin
    clk = 0;
end

// Setup RST

initial begin
    rst = 0;
    frame_length = 64;
    pilot_interval = 8;
    pilot_value = 32'b0;
    ready_in = 1;
    valid_in = 1;
    signal_in = 32'b11101010111010110001010100011100;
    #20 rst = 1;
    #100 valid_in = 0;
    #30 valid_in = 1;
end

 always begin
     #10 if(ready_out) begin
         signal_in = signal_in - 1;
     end
 end

// Main Functionality

initial begin
    #1500 $finish;
end
   
    
endmodule
