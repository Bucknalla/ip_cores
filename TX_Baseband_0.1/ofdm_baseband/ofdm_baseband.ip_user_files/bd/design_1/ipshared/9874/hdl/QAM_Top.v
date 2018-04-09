`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2018 09:21:58
// Design Name: 
// Module Name: qam_top
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

module qam_top(
    input clk,
    input rst, // Active High
    input [31:0] signal_in, 
    input [2:0] qam,
    output [31:0] signal_out,
    output reg ready,
    output reg valid,
    output reg error
);
    
reg [31:0] signal_in_mod;
wire mod_ready;
reg select_qam_2, select_qam_4, select_qam_16 = 1'b0;
reg [2:0] bit_shift = 1;
reg [4:0] bit_counter = 0;

//always @ (posedge ready) begin
//    case (qam)
//        0 : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b100001; 
//        1 : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b010010; 
//        2 : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b001100; 
//        default : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b100001; 
//    endcase
//end

always @ (posedge clk) begin
    if (rst) begin
        ready <= 0;
        valid <= 0;
        error <= 0;
        signal_in_mod <= signal_in;
        {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b100001; 
    end
    else begin
        if (mod_ready) begin
            if ((bit_counter > 31) | (bit_counter == 0)) begin
                ready <= 1;   
                bit_counter <= 1;
                valid <= 0;
                signal_in_mod <= signal_in;
            end
            else begin
                ready <= 0;
                bit_counter <= bit_counter + bit_shift;
                valid <= 1;
                signal_in_mod <= signal_in_mod >> bit_shift;
            end
        end
        else begin
            valid <= 0;
            error <= 1;
        end
        if (ready) begin
        case (qam)
            0 : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b100001; 
            1 : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b010010; 
            2 : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b001100; 
            default : {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b100001; 
        endcase
        end
    end
end
    
qam_2 qam2 (
    .clk (clk),
    .rst (rst),
    .select (select_qam_2),
    .ready (mod_ready),
    .signal_in (signal_in_mod[0]),
    .signal_out (signal_out)
);
    
//  qam_4 qam4 (
//      .clk (clk),
//      .rst (rst),
//      .select (select_qam_4),
//      .ready (mod_ready),
//      .signal_in (signal_in_mod[31:30]),
//      .signal_out (signal_out)
//  );

//  qam_16 qam16 (
//      .clk (clk),
//      .rst (rst),
//      .select (select_qam_16),
//      .ready (mod_ready),
//      .signal_in (signal_in_mod[31:28]),
//      .signal_out (signal_out)
//  );   
    
endmodule
