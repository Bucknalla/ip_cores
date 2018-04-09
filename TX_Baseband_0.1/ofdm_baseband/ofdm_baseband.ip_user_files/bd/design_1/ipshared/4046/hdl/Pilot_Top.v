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
    input [31:0] pilot_value,
    output reg [31:0] signal_out,
    output reg ready,
    output reg valid,
    output reg error,
    output reg pilot_inserted
);

reg [4:0] cnt = 0;

always @ (posedge clk) begin
    if(rst) begin
        cnt <= 0;
        ready <= 0;
        valid <= 0;
        error <= 0;
    end
    else begin
        valid <= 1;
        if(cnt >= pilot_interval) begin
            cnt <= 0;
            ready <= 0;
            signal_out <= pilot_value;
            pilot_inserted <= 1;
        end
        else
            pilot_inserted <= 0;
            ready <= 1;
            cnt <= cnt + 1;
            signal_out <= signal_in;
        end


end


endmodule
