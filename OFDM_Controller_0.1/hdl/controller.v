`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.03.2018 10:59:50
// Design Name: 
// Module Name: controller
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


module controller #
(
    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH    = 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH    = 6
)
(
    input clk,
    input rst,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg0,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg1,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg2,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg3,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg4,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg5,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg6,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg7,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg8,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg9,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg10,
    input [C_S_AXI_DATA_WIDTH-1:0]    reg11,

    output reg [C_S_AXI_DATA_WIDTH-1:0]   qam_reg0, // QAM Scheme

    output reg [C_S_AXI_DATA_WIDTH-1:0]   pre_reg0, // Preamble Symbol
    output reg [C_S_AXI_DATA_WIDTH-1:0]   pre_reg1, // Preamble Config

    output reg [C_S_AXI_DATA_WIDTH-1:0]   pil_reg0, // Location of Pilot
    output reg [C_S_AXI_DATA_WIDTH-1:0]   pil_reg1, // Value of Pilot

    output reg [C_S_AXI_DATA_WIDTH-1:0]   fft_reg0, // {N Samples of FFT [4:0], FWD/INV* [0], CP?} *Per number of FFT Channels
    output reg [C_S_AXI_DATA_WIDTH-1:0]   fft_reg1, 

    output reg [C_S_AXI_DATA_WIDTH-1:0]   cyc_reg0, // Length of Cyclic Prefix
    output reg [C_S_AXI_DATA_WIDTH-1:0]   cyc_reg1,
    output reg [C_S_AXI_DATA_WIDTH-1:0]   cyc_reg2,
       
    output reg [C_S_AXI_DATA_WIDTH-1:0]   config_reg0, 
    output reg [C_S_AXI_DATA_WIDTH-1:0]   error_reg0 // Error Register for Processing System 32'b{qam_error, pre_error, pil_error, fft_error, cyclic_error, data_error}
         
);
    
reg [C_S_AXI_DATA_WIDTH-1:0]	slv_reg0;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg1;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg2;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg3;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg4;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg5;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg6;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg7;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg8;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg9;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg10;
reg [C_S_AXI_DATA_WIDTH-1:0]    slv_reg11;    

always @ (posedge clk) begin
    if(rst) begin
        slv_reg0 <= 0;
        slv_reg1 <= 0;
        slv_reg2 <= 0;
        slv_reg3 <= 0;
        slv_reg4 <= 0;
        slv_reg5 <= 0;
        slv_reg6 <= 0;
        slv_reg7 <= 0;
        slv_reg8 <= 0;
        slv_reg9 <= 0;
        slv_reg10 <= 0;
        slv_reg11 <= 0;
    end
    else begin
        slv_reg0 <= reg0;
        slv_reg1 <= reg1;
        slv_reg2 <= reg2;
        slv_reg3 <= reg3;
        slv_reg4 <= reg4;
        slv_reg5 <= reg5;
        slv_reg6 <= reg6;
        slv_reg7 <= reg7;
        slv_reg8 <= reg8;
        slv_reg9 <= reg9;
        slv_reg10 <= reg10;
        slv_reg11 <= reg11;
    end
end


always @ (posedge clk) begin
// QAM Modulation Controller

    case (slv_reg0)
        0 : qam_reg0 <= 1; // QAM : BPSK
        1 : qam_reg0 <= 2; // QAM : 4-QAM
        2 : qam_reg0 <= 3; // QAM : 16-QAM
        3 : qam_reg0 <= 4; // QAM : 64-QAM
        default: qam_reg0 <= 0;
    endcase
    
// Pilot Carrier Insertion Controller

    // Set location of next pilot insertion (0 - 8191)
    pil_reg0 <= slv_reg1;

    // Set value of next pilot insertion
    pil_reg1 <= slv_reg2;

// Cyclic Prefix Controller

    // Set length of cyclic prefix (0 - 8191)
    cyc_reg0 <= slv_reg3;

end


    
endmodule
