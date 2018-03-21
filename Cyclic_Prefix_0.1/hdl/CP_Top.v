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
    output reg [31:0] signal_out,
    output reg ready,
    output reg valid,
    output reg error,
    output reg cp_flag
);

reg [4:0] cnt = 0;
reg ena, enb = 0;
reg [31:0] cp_load;
reg [31:0] cp_unload;
reg [12:0] addr = 0;

wire [31:0] cp_length_link;
wire [31:0] cp_unload_bram;

assign cp_length_link = cp_length;
assign cp_unload_bram = cp_unload;

always @ (posedge clk) begin
   if(rst) begin
       cnt <= 0;
       ready <= 0;
       valid <= 0;
       error <= 0;
       ena <= 0;
       enb <= 0;
       cp_load <= signal_in;
       cp_unload <= 0;
       addr <= 0;
   end
   else begin
       valid <= 1;
       if(cnt >= frame_length) begin
           // Begin CP
           ready <= 0;
           addr <= 0;
           
           signal_out <= cp_unload_bram;
           cp_flag <= 1;
           
           ena <= 0;
           
//           if (addr == 0) begin
//                enb <= 1;                
//           end
//           else if (addr >= cp_length_link) begin
//                cnt <= 0;
//                addr <= 0;
//           end
//           else begin
//                addr <= addr + 1;
//           end

       end
       else
           cp_flag <= 0;
           ready <= 1;
           cnt <= cnt + 1;
           
           addr <= addr + 1;
           cp_load <= signal_in;
           signal_out <= signal_in;
           
           ena <= 1;
           enb <= 0;
       end
end


blk_mem_gen_0 bram (
    .clka (clk),
    .ena (ena),
    .addra (addr),
    .dina (cp_load),
    .wea (1'b1),
    .clkb (clk),
    .enb (enb),
    .addrb (addr),
    .doutb (cp_unload_bram)
);


endmodule