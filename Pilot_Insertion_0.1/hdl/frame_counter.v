`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.04.2018 13:02:14
// Design Name: 
// Module Name: frame_counter
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


module frame_counter 
    (
    input clk,
    input rst,
    input ready,
    input pilot_flag,
    input [12:0] frame_length,
    output reg end_frame,
    output reg start_frame
    );
        
    reg [12:0] counter = 0;
    
    always @ (posedge clk) begin
        if(!rst) begin
            end_frame <= 0;
            start_frame <= 0;
            counter <= 0;
        end
        else if (ready || pilot_flag) begin
            if(counter == 0) begin
                start_frame <= 1;
                end_frame <= 0;
                counter <= counter + 1;
            end
            else if(counter == (frame_length + 1)) begin
                end_frame <= 1;
                start_frame <= 0;
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
                end_frame <= 0;
                start_frame <= 0;
            end
        end
    end
endmodule
