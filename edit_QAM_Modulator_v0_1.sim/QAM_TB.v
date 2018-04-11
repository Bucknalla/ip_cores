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
reg [2:0] qam = 3;
wire [31:0] signal_out;
wire ready_out;
wire valid_out;
reg ready_in;
reg valid_in;
wire error;

qam_top qam_dut (
    .clk (clk),
    .rst (rst), 
    .signal_in (signal_in), 
    .qam (qam),
    .signal_out (signal_out),
    .ready_in (ready_in),
    .valid_in (valid_in),
    .valid_out (valid_out),
    .ready_out (ready_out),
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
    rst = 0;
    ready_in = 1;
    valid_in = 1;
    signal_in = 32'b11101010101010101010101010101010;
    #20 rst = 1;
end

always begin
    #10 if(ready_out) begin
        signal_in = signal_in + 1;
    end
end

// Main Functionality

initial begin
    qam = 0;
    #1500 $finish;
end

endmodule
