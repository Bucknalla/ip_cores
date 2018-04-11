`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.04.2018 11:17:21
// Design Name: 
// Module Name: preamble_top_tb
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


module preamble_top_tb();

wire error;
wire preamble_flag;

// Ports of Axi Slave Bus Interface S00_AXI
reg  s00_axi_aclk;
reg  s00_axi_aresetn;
reg [31 : 0] s00_axi_awaddr;
reg [2 : 0] s00_axi_awprot;
reg  s00_axi_awvalid;
wire  s00_axi_awready;
reg [31 : 0] s00_axi_wdata;
reg  s00_axi_wvalid;
wire  s00_axi_wready;
wire [1 : 0] s00_axi_bresp;
wire  s00_axi_bvalid;
reg  s00_axi_bready;
reg [31 : 0] s00_axi_araddr;
reg [2 : 0] s00_axi_arprot;
reg  s00_axi_arvalid;
wire  s00_axi_arready;
wire [31 : 0] s00_axi_rdata;
wire [1 : 0] s00_axi_rresp;
wire  s00_axi_rvalid;
reg  s00_axi_rready;

// Ports of Axi Slave Bus Interface S00_AXIS
reg  s00_axis_aclk;
reg  s00_axis_aresetn;
wire  s00_axis_tready;
reg [31 : 0] s00_axis_tdata;
//		input wire [(C_S00_AXIS_TDATA_WIDTH/8)-1 : 0] s00_axis_tstrb,
//		input wire  s00_axis_tlast,
reg  s00_axis_tvalid;

// Ports of Axi Master Bus Interface M00_AXIS
reg  m00_axis_aclk;
reg  m00_axis_aresetn;
wire  m00_axis_tvalid;
wire [31 : 0] m00_axis_tdata;
//		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
//		output wire  m00_axis_tlast,
reg  m00_axis_tready;


Preamble_v0_1 dut
	(
		// Users to add ports here
		.error(error),
		.preamble_flag(preamble_flag),

		// Ports of Axi Slave Bus Interface S00_AXI
		.s00_axi_aclk(s00_axi_aclk),
		.s00_axi_aresetn(s00_axi_aresetn),
		.s00_axi_awaddr(s00_axi_awaddr),
		.s00_axi_awprot(s00_axi_awprot),
		.s00_axi_awvalid(s00_axi_awvalid),
		.s00_axi_awready(s00_axi_awready),
		.s00_axi_wdata(s00_axi_wdata),
		.s00_axi_wvalid(s00_axi_wvalid),
		.s00_axi_wready(s00_axi_wready),
		.s00_axi_bresp(s00_axi_bresp),
		.s00_axi_bvalid(s00_axi_bvalid),
		.s00_axi_bready(s00_axi_bready),
		.s00_axi_araddr(s00_axi_araddr),
		.s00_axi_arprot(s00_axi_arprot),
		.s00_axi_arvalid(s00_axi_arvalid),
		.s00_axi_arready(s00_axi_arready),
		.s00_axi_rdata(s00_axi_rdata),
		.s00_axi_rresp(s00_axi_rresp),
		.s00_axi_rvalid(s00_axi_rvalid),
		.s00_axi_rready(s00_axi_rready),

		// Ports of Axi Slave Bus Interface S00_AXIS
		.s00_axis_aclk(s00_axis_aclk),
		.s00_axis_aresetn(s00_axis_aresetn),
		.s00_axis_tready(s00_axis_tready),
		.s00_axis_tdata(s00_axis_tdata),
		.s00_axis_tvalid(s00_axis_tvalid),

		// Ports of Axi Master Bus Interface M00_AXIS
		.m00_axis_aclk(m00_axis_aclk),
		.m00_axis_aresetn(m00_axis_aresetn),
		.m00_axis_tvalid(m00_axis_tvalid),
		.m00_axis_tdata(m00_axis_tdata),
		.m00_axis_tready(m00_axis_tready)
	);


endmodule
