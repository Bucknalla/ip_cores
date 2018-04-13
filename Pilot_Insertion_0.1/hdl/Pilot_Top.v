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
    input [12:0] frame_length,
    input [12:0] pilot_interval,
    input [31:0] pilot_value,
    output reg [31:0] signal_out,
    
    output reg ready_out,
    input ready_in,
    output reg valid_out,
    input valid_in,
    
    output reg error = 0,
    output reg pilot_inserted,
    output reg frame_end = 0
);

reg [12:0] cnt_frame = 0;
reg [12:0] cnt_pilot = 0;

always @ (posedge clk) begin
    if(!rst) begin
        cnt_pilot <= 0;
        cnt_frame <= 0;
        pilot_inserted <= 0;
        frame_end <= 1;
        ready_out <= 0;
        valid_out <= 0;
        error <= 0;
    end 
    else if (ready_in & valid_in) begin
        valid_out <= 1;
        error <= 0;

        if(cnt_frame >= (frame_length - 1)) begin
            cnt_frame <= 0;
            frame_end <= 1;
        end
        else if(cnt_frame == 0) begin
            cnt_frame <= cnt_frame + 1;
//            frame_end <= 1;
        end
        else begin
            cnt_frame <= cnt_frame + 1;
            frame_end <= 0;
        end
        

        if(cnt_pilot >= (pilot_interval - 1)) begin
            cnt_pilot <= 0;
        end
        else if((cnt_pilot % pilot_interval) == 0 ) begin
            ready_out <= 0;
            signal_out <= pilot_value;
            pilot_inserted <= 1;
            cnt_pilot <= cnt_pilot + 1;
        end
        else begin
            pilot_inserted <= 0;
            ready_out <= 1;
            cnt_pilot <= cnt_pilot + 1;
            signal_out <= signal_in;
        end

        // if(cnt_pilot >= (pilot_interval - 1)) begin
        //     cnt_pilot <= 0;
        //     ready_out <= 0;
        //     signal_out <= pilot_value;
        //     pilot_inserted <= 1;
        // end
        // else if(cnt_pilot == 0) begin
        //     cnt_pilot <= cnt_pilot + 1;
        //     ready_out <= 0;
        //     signal_out <= pilot_value;
        //     pilot_inserted <= 1;
        // end
        // else begin
        //     pilot_inserted <= 0;
        //     ready_out <= 1;
        //     cnt_pilot <= cnt_pilot + 1;
        //     signal_out <= signal_in;
        // end
        
    end
    else begin
//        error <= 1;
        ready_out <= 1;
//        valid_out <= 0;
    end
end


endmodule
