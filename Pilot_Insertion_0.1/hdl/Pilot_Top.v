`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2018 17:10:31
// Design Name: 
// Module Name: Pilot_Top
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


module Pilot_Top(
    input clk,
    input rst, // Active High
    input [31:0] signal_in, 
    input [4:0] frame_size,
    input [3:0] pilot_interval,
    output [31:0] signal_out,
    output reg ready,
    output reg valid,
    output reg error
);



endmodule
