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
    output wire [31:0] signal_out,
    output reg ready_out,
    input ready_in,
    input valid_in,
    output reg valid_out,
    output reg error
);
    
reg [2:0] qam_state = 0;    
reg [31:0] signal_in_mod;
reg select_qam_2, select_qam_4, select_qam_16 = 1'b0;
reg [2:0] bit_shift = 1;
reg [5:0] bit_counter = 0;

wire [31:0] signal_out_2, signal_out_4, signal_out_16;

assign signal_out = (qam == 0) ? signal_out_2 : 
                    (qam == 1) ? signal_out_4 : 
                    (qam == 2) ? signal_out_16 : 
                                            0;
                    
always @ (posedge clk) begin
    if (!rst) begin
        ready_out <= 0;
        valid_out <= 0;
        bit_counter <= 0;
        error <= 0;
        signal_in_mod <= signal_in;
        {select_qam_2,select_qam_4,select_qam_16, bit_shift} <= 6'b100001; 
    end
    else if (ready_in & valid_in) begin
        error <= 0;
        if (bit_counter >= 32) begin
            ready_out <= 1;   
            bit_counter <= 1;
            valid_out <= 1;
            signal_in_mod <= signal_in;
        end
        else if(bit_counter == 0) begin
            signal_in_mod <= signal_in;
            bit_counter <= 1;
            ready_out <= 0;   
            valid_out <= 0;
        end
        else begin
            ready_out <= 0;
            bit_counter <= bit_counter + bit_shift;
            valid_out <= 1;
            signal_in_mod <= signal_in_mod >> bit_shift;
        end
        
        case (qam)
            0 : {select_qam_2, select_qam_4, select_qam_16, bit_shift} <= 6'b100001; 
            1 : {select_qam_2, select_qam_4, select_qam_16, bit_shift} <= 6'b010010; 
            2 : {select_qam_2, select_qam_4, select_qam_16, bit_shift} <= 6'b001100;
            default : {select_qam_2, select_qam_4, select_qam_16, bit_shift} <= 6'b100001;
        endcase
        
    end
//    else begin
//        valid_out <= 0;
        ready_out <= 0;
//        error <= 1;
//    end
end
    
    
qam_2 qam2 (
    .clk (clk),
    .rst (rst),
    .select (select_qam_2),
    .ready (mod_ready),
    .signal_in (signal_in_mod[0]),
    .signal_out (signal_out_2)
);
    
qam_4 qam4 (
    .clk (clk),
    .rst (rst),
    .select (select_qam_4),
    .ready (mod_ready),
    .signal_in (signal_in_mod[1:0]),
    .signal_out (signal_out_4)
);

//qam_16 qam16 (
//    .clk (clk),
//    .rst (rst),
//    .select (select_qam_16),
//    .ready (mod_ready),
//    .signal_in (signal_in_mod[31:28]),
//    .signal_out (signal_out_16)
//);   
    
endmodule
