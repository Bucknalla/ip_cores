`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.03.2018 09:28:50
// Design Name: 
// Module Name: qam_2
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


module qam_16(
    input clk,
    input rst,
    input select,
    input [2:0] signal_in,
    output wire [31:0] signal_out,
    output reg ready
    );
    
reg [31:0] signal_out_mod;
assign signal_out = signal_out_mod;

always @ (posedge clk) begin
    if (rst) begin
        signal_out_mod <= 0;
        ready <= 1'b1;
    end
    if (select == 1) begin
        case (signal_in) 
            0 : signal_out_mod <= 32'b00000000000000000000000000000001; // 1 + 0j
            1 : signal_out_mod <= 32'b00000000000000000000111111111111; // -1 + 0j
            2 : signal_out_mod <= 32'b00000000000000000000000000000001; // 1 + 0j
            3 : signal_out_mod <= 32'b00000000000000000000111111111111; // -1 + 0j
            4 : signal_out_mod <= 32'b00000000000000000000000000000001; // 1 + 0j
            5 : signal_out_mod <= 32'b00000000000000000000111111111111; // -1 + 0j
            6 : signal_out_mod <= 32'b00000000000000000000000000000001; // 1 + 0j
            7 : signal_out_mod <= 32'b00000000000000000000111111111111; // -1 + 0j
        endcase 
        ready <= 1'b1;
    end
    else begin
        ready <= 1'b0;
    end
end
    
endmodule
