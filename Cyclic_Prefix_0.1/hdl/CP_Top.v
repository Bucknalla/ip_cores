`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.03.2018 15:04:08
// Design Name: 
// Module Name: CP_Top
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


module CP_Top(
    input clk,
    input rst, // Active High
    input [31:0] signal_in, 
    input [31:0] cp_length,
    input [5:0] frame_length,
    output [31:0] signal_out,
    output reg ready,
    output reg valid,
    output reg error,
    output reg cp_flag
);

reg [31:0] din;
wire [31:0] dout;
reg [31:0] out_data;
reg wr_en, rd_en = 0;
reg rst_fifo = 0;

wire full, empty;

wire [13:0] data_count;
wire [31:0] cp_length_link;

assign signal_out = out_data;
assign cp_length_link = cp_length;

always @ (posedge clk) begin
   if(rst) begin
       ready <= 0;
       valid <= 0;
       error <= 0;
       wr_en <= 0;
       rd_en <= 0;
       rst_fifo <= 1;
       cp_flag <= 0;
       din <= signal_in;
   end
   else begin
       valid <= 1;
       
       if(cp_flag) begin
           out_data <= dout;
           ready <= 0;
       end
       else begin
           out_data <= signal_in;
       end
       
       if((data_count == (frame_length - 2)) & !cp_flag) begin
           rd_en <= 1;
           wr_en <= 0;
       end
       
       if (data_count > ((frame_length - cp_length) + 1) & cp_flag) begin
           out_data <= dout;
       end
       
       if (data_count == ((frame_length - cp_length) + 1) & cp_flag) begin
           rst_fifo <= 1;
           cp_flag <= 0;
       end
       
       if(data_count == (frame_length - 2)) begin
           cp_flag <= 1;
       end
       else if (!cp_flag) begin
           rd_en <= 0;
           wr_en <= 1;
           cp_flag <= 0;
           
           ready <= 1;
           rst_fifo <= 0;
           
           din <= signal_in;
           out_data <= signal_in;

       end
    end
end

fifo_generator_0 fifo(
  .clk (clk),
  .srst (rst_fifo),
  .din (din),
  .wr_en (wr_en),
  .rd_en (rd_en),
  .dout (dout),
  .full (full),
  .empty (empty),
  .wr_ack (wr_ack),
  .data_count (data_count)
);

endmodule