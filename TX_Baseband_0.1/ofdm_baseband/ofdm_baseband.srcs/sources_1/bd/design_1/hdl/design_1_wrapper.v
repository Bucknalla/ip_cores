//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
//Date        : Mon Apr  9 15:08:33 2018
//Host        : alex-warc running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (CLK,
    CONFIG_AXI_araddr,
    CONFIG_AXI_arprot,
    CONFIG_AXI_arready,
    CONFIG_AXI_arvalid,
    CONFIG_AXI_awaddr,
    CONFIG_AXI_awprot,
    CONFIG_AXI_awready,
    CONFIG_AXI_awvalid,
    CONFIG_AXI_bready,
    CONFIG_AXI_bresp,
    CONFIG_AXI_bvalid,
    CONFIG_AXI_rdata,
    CONFIG_AXI_rready,
    CONFIG_AXI_rresp,
    CONFIG_AXI_rvalid,
    CONFIG_AXI_wdata,
    CONFIG_AXI_wready,
    CONFIG_AXI_wstrb,
    CONFIG_AXI_wvalid,
    DATA_IN_AXIS_tdata,
    DATA_IN_AXIS_tlast,
    DATA_IN_AXIS_tready,
    DATA_IN_AXIS_tstrb,
    DATA_IN_AXIS_tvalid,
    ERROR,
    M00_AXIS_tdata,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tstrb,
    M00_AXIS_tvalid,
    RST,
    STATUS);
  input CLK;
  input [14:0]CONFIG_AXI_araddr;
  input [2:0]CONFIG_AXI_arprot;
  output [0:0]CONFIG_AXI_arready;
  input [0:0]CONFIG_AXI_arvalid;
  input [14:0]CONFIG_AXI_awaddr;
  input [2:0]CONFIG_AXI_awprot;
  output [0:0]CONFIG_AXI_awready;
  input [0:0]CONFIG_AXI_awvalid;
  input [0:0]CONFIG_AXI_bready;
  output [1:0]CONFIG_AXI_bresp;
  output [0:0]CONFIG_AXI_bvalid;
  output [31:0]CONFIG_AXI_rdata;
  input [0:0]CONFIG_AXI_rready;
  output [1:0]CONFIG_AXI_rresp;
  output [0:0]CONFIG_AXI_rvalid;
  input [31:0]CONFIG_AXI_wdata;
  output [0:0]CONFIG_AXI_wready;
  input [3:0]CONFIG_AXI_wstrb;
  input [0:0]CONFIG_AXI_wvalid;
  input [31:0]DATA_IN_AXIS_tdata;
  input DATA_IN_AXIS_tlast;
  output DATA_IN_AXIS_tready;
  input [3:0]DATA_IN_AXIS_tstrb;
  input DATA_IN_AXIS_tvalid;
  output [8:0]ERROR;
  output [31:0]M00_AXIS_tdata;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [3:0]M00_AXIS_tstrb;
  output M00_AXIS_tvalid;
  input RST;
  output [3:0]STATUS;

  wire CLK;
  wire [14:0]CONFIG_AXI_araddr;
  wire [2:0]CONFIG_AXI_arprot;
  wire [0:0]CONFIG_AXI_arready;
  wire [0:0]CONFIG_AXI_arvalid;
  wire [14:0]CONFIG_AXI_awaddr;
  wire [2:0]CONFIG_AXI_awprot;
  wire [0:0]CONFIG_AXI_awready;
  wire [0:0]CONFIG_AXI_awvalid;
  wire [0:0]CONFIG_AXI_bready;
  wire [1:0]CONFIG_AXI_bresp;
  wire [0:0]CONFIG_AXI_bvalid;
  wire [31:0]CONFIG_AXI_rdata;
  wire [0:0]CONFIG_AXI_rready;
  wire [1:0]CONFIG_AXI_rresp;
  wire [0:0]CONFIG_AXI_rvalid;
  wire [31:0]CONFIG_AXI_wdata;
  wire [0:0]CONFIG_AXI_wready;
  wire [3:0]CONFIG_AXI_wstrb;
  wire [0:0]CONFIG_AXI_wvalid;
  wire [31:0]DATA_IN_AXIS_tdata;
  wire DATA_IN_AXIS_tlast;
  wire DATA_IN_AXIS_tready;
  wire [3:0]DATA_IN_AXIS_tstrb;
  wire DATA_IN_AXIS_tvalid;
  wire [8:0]ERROR;
  wire [31:0]M00_AXIS_tdata;
  wire M00_AXIS_tlast;
  wire M00_AXIS_tready;
  wire [3:0]M00_AXIS_tstrb;
  wire M00_AXIS_tvalid;
  wire RST;
  wire [3:0]STATUS;

  design_1 design_1_i
       (.CLK(CLK),
        .CONFIG_AXI_araddr(CONFIG_AXI_araddr),
        .CONFIG_AXI_arprot(CONFIG_AXI_arprot),
        .CONFIG_AXI_arready(CONFIG_AXI_arready),
        .CONFIG_AXI_arvalid(CONFIG_AXI_arvalid),
        .CONFIG_AXI_awaddr(CONFIG_AXI_awaddr),
        .CONFIG_AXI_awprot(CONFIG_AXI_awprot),
        .CONFIG_AXI_awready(CONFIG_AXI_awready),
        .CONFIG_AXI_awvalid(CONFIG_AXI_awvalid),
        .CONFIG_AXI_bready(CONFIG_AXI_bready),
        .CONFIG_AXI_bresp(CONFIG_AXI_bresp),
        .CONFIG_AXI_bvalid(CONFIG_AXI_bvalid),
        .CONFIG_AXI_rdata(CONFIG_AXI_rdata),
        .CONFIG_AXI_rready(CONFIG_AXI_rready),
        .CONFIG_AXI_rresp(CONFIG_AXI_rresp),
        .CONFIG_AXI_rvalid(CONFIG_AXI_rvalid),
        .CONFIG_AXI_wdata(CONFIG_AXI_wdata),
        .CONFIG_AXI_wready(CONFIG_AXI_wready),
        .CONFIG_AXI_wstrb(CONFIG_AXI_wstrb),
        .CONFIG_AXI_wvalid(CONFIG_AXI_wvalid),
        .DATA_IN_AXIS_tdata(DATA_IN_AXIS_tdata),
        .DATA_IN_AXIS_tlast(DATA_IN_AXIS_tlast),
        .DATA_IN_AXIS_tready(DATA_IN_AXIS_tready),
        .DATA_IN_AXIS_tstrb(DATA_IN_AXIS_tstrb),
        .DATA_IN_AXIS_tvalid(DATA_IN_AXIS_tvalid),
        .ERROR(ERROR),
        .M00_AXIS_tdata(M00_AXIS_tdata),
        .M00_AXIS_tlast(M00_AXIS_tlast),
        .M00_AXIS_tready(M00_AXIS_tready),
        .M00_AXIS_tstrb(M00_AXIS_tstrb),
        .M00_AXIS_tvalid(M00_AXIS_tvalid),
        .RST(RST),
        .STATUS(STATUS));
endmodule
