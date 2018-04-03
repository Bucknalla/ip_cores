`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.03.2018 17:54:51
// Design Name: 
// Module Name: preamble
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


module preamble(
    input               clk,
    input               rst,
    
    input       [31:0]  preamble_value,
    input       [31:0]  preamble_length,
    input       [31:0]  frame_length,

    input               valid_in,   // VALID on AXIS_S
    input               ready_out,  // READY on AXIS_M (TX)

    output  reg         ready_in,   // READY on AXIS_S (RX)
    output  reg         valid_out,  // VALID on AXIS_M

    input       [31:0]  signal_in,
    output  reg [31:0]  signal_out,

    output  reg         error,
    output              preamble_flag);

reg [13:0]  cnt             = 0;
reg         new_frame       = 0;
reg         rst_state       = 0;
reg         preamble_flag   = 0;

always @ (posedge clk) begin

    if (rst) begin
        cnt             <= 0;
        new_frame       <= 1;
        ready_in        <= 0;
        valid_out       <= 0;
        preamble_flag   <= 0;
        error           <= 0;
        rst_state       <= 1;
    end

    else begin
        if (new_frame == 1) begin

            valid_out   <= 1;
 
            if (cnt <= preamble_length - 1) begin
                cnt             <= cnt + 1;
                preamble_flag   <= 1;
                signal_out      <= preamble_value;
                preamble_flag   <= 1;
                ready_in        <= 0;
            end

            else begin
                new_frame       <= 0;
                preamble_flag   <= 0;
                signal_out      <= signal_in;
                ready_in        <= 1;
                cnt             <= 0;
            end

        end

        else if (new_frame == 0) begin

            valid_out   <= 1;


            if (cnt >= frame_length - 1) begin
                new_frame       <= 1;
                preamble_flag   <= 1;
                cnt             <= 1;
                ready_in        <= 0;
                signal_out      <= preamble_value;
            end

            else begin
                ready_in        <= 1;
                cnt             <= cnt + 1;
                signal_out      <= signal_in;
            end

        end

        else begin

            valid_out   <= 0;
            error       <= 1;

        end

    end

end 


endmodule
