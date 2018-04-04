`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.03.2018 14:19:57
// Design Name: 
// Module Name: qam_mod_tb
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


module qam_mod_tb();

reg clk, rst;
reg [31:0] signal_in;
reg [2:0] qam;
wire [31:0] signal_out;
wire ready;
wire valid;
wire error;

qam_top qam_dut (
    .clk (clk),
    .rst (rst), 
    .signal_in (signal_in), 
    .qam (qam),
    .signal_out (signal_out),
    .ready (ready),
    .valid (valid),
    .error (error)
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
    rst = 1;
    signal_in = 32'b11111111111111111111111111111111;
    #20 rst = 0;
end

always begin
    #10 signal_in = signal_in - 1;
end

// Main Functionality

initial begin
    qam = 0;
    #800 $finish;
end

endmodule
