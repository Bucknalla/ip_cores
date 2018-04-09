//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
//Date        : Mon Apr  9 15:08:33 2018
//Host        : alex-warc running 64-bit Ubuntu 16.04.4 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=16,numReposBlks=9,numNonXlnxBlks=5,numHierBlks=7,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=7,da_ps7_cnt=1,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
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

  wire [31:0]Cyclic_Prefix_0_M00_AXIS_TDATA;
  wire Cyclic_Prefix_0_M00_AXIS_TLAST;
  wire Cyclic_Prefix_0_M00_AXIS_TREADY;
  wire [3:0]Cyclic_Prefix_0_M00_AXIS_TSTRB;
  wire Cyclic_Prefix_0_M00_AXIS_TVALID;
  wire Cyclic_Prefix_0_cp_flag;
  wire Cyclic_Prefix_0_error;
  wire [23:0]FFT_Controller_0_M00_AXIS_TDATA;
  wire FFT_Controller_0_M00_AXIS_TREADY;
  wire FFT_Controller_0_M00_AXIS_TVALID;
  wire Net1;
  wire [31:0]Pilot_Insertion_0_M00_AXIS_TDATA;
  wire Pilot_Insertion_0_M00_AXIS_TLAST;
  wire Pilot_Insertion_0_M00_AXIS_TREADY;
  wire Pilot_Insertion_0_M00_AXIS_TVALID;
  wire [31:0]Preamble_0_M00_AXIS_TDATA;
  wire Preamble_0_M00_AXIS_TLAST;
  wire Preamble_0_M00_AXIS_TREADY;
  wire [3:0]Preamble_0_M00_AXIS_TSTRB;
  wire Preamble_0_M00_AXIS_TVALID;
  wire Preamble_0_error;
  wire QAM_Modulator_0_error;
  wire [31:0]S00_AXIS_1_TDATA;
  wire S00_AXIS_1_TLAST;
  wire S00_AXIS_1_TREADY;
  wire [3:0]S00_AXIS_1_TSTRB;
  wire S00_AXIS_1_TVALID;
  wire [14:0]S00_AXI_1_ARADDR;
  wire [2:0]S00_AXI_1_ARPROT;
  wire [0:0]S00_AXI_1_ARREADY;
  wire [0:0]S00_AXI_1_ARVALID;
  wire [14:0]S00_AXI_1_AWADDR;
  wire [2:0]S00_AXI_1_AWPROT;
  wire [0:0]S00_AXI_1_AWREADY;
  wire [0:0]S00_AXI_1_AWVALID;
  wire [0:0]S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire [0:0]S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire [0:0]S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire [0:0]S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire [0:0]S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire [0:0]S00_AXI_1_WVALID;
  wire [14:0]axi_interconnect_0_M00_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M00_AXI_ARPROT;
  wire axi_interconnect_0_M00_AXI_ARREADY;
  wire axi_interconnect_0_M00_AXI_ARVALID;
  wire [14:0]axi_interconnect_0_M00_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M00_AXI_AWPROT;
  wire axi_interconnect_0_M00_AXI_AWREADY;
  wire axi_interconnect_0_M00_AXI_AWVALID;
  wire axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_BRESP;
  wire axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_RDATA;
  wire axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_RRESP;
  wire axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_WDATA;
  wire axi_interconnect_0_M00_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M00_AXI_WSTRB;
  wire axi_interconnect_0_M00_AXI_WVALID;
  wire [14:0]axi_interconnect_0_M01_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M01_AXI_ARPROT;
  wire axi_interconnect_0_M01_AXI_ARREADY;
  wire axi_interconnect_0_M01_AXI_ARVALID;
  wire [14:0]axi_interconnect_0_M01_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M01_AXI_AWPROT;
  wire axi_interconnect_0_M01_AXI_AWREADY;
  wire axi_interconnect_0_M01_AXI_AWVALID;
  wire axi_interconnect_0_M01_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M01_AXI_BRESP;
  wire axi_interconnect_0_M01_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M01_AXI_RDATA;
  wire axi_interconnect_0_M01_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M01_AXI_RRESP;
  wire axi_interconnect_0_M01_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M01_AXI_WDATA;
  wire axi_interconnect_0_M01_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M01_AXI_WSTRB;
  wire axi_interconnect_0_M01_AXI_WVALID;
  wire [14:0]axi_interconnect_0_M02_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M02_AXI_ARPROT;
  wire axi_interconnect_0_M02_AXI_ARREADY;
  wire axi_interconnect_0_M02_AXI_ARVALID;
  wire [14:0]axi_interconnect_0_M02_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M02_AXI_AWPROT;
  wire axi_interconnect_0_M02_AXI_AWREADY;
  wire axi_interconnect_0_M02_AXI_AWVALID;
  wire axi_interconnect_0_M02_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M02_AXI_BRESP;
  wire axi_interconnect_0_M02_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M02_AXI_RDATA;
  wire axi_interconnect_0_M02_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M02_AXI_RRESP;
  wire axi_interconnect_0_M02_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M02_AXI_WDATA;
  wire axi_interconnect_0_M02_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M02_AXI_WSTRB;
  wire axi_interconnect_0_M02_AXI_WVALID;
  wire [14:0]axi_interconnect_M03_AXI_ARADDR;
  wire [2:0]axi_interconnect_M03_AXI_ARPROT;
  wire axi_interconnect_M03_AXI_ARREADY;
  wire axi_interconnect_M03_AXI_ARVALID;
  wire [14:0]axi_interconnect_M03_AXI_AWADDR;
  wire [2:0]axi_interconnect_M03_AXI_AWPROT;
  wire axi_interconnect_M03_AXI_AWREADY;
  wire axi_interconnect_M03_AXI_AWVALID;
  wire axi_interconnect_M03_AXI_BREADY;
  wire [1:0]axi_interconnect_M03_AXI_BRESP;
  wire axi_interconnect_M03_AXI_BVALID;
  wire [31:0]axi_interconnect_M03_AXI_RDATA;
  wire axi_interconnect_M03_AXI_RREADY;
  wire [1:0]axi_interconnect_M03_AXI_RRESP;
  wire axi_interconnect_M03_AXI_RVALID;
  wire [31:0]axi_interconnect_M03_AXI_WDATA;
  wire axi_interconnect_M03_AXI_WREADY;
  wire [3:0]axi_interconnect_M03_AXI_WSTRB;
  wire axi_interconnect_M03_AXI_WVALID;
  wire [14:0]axi_interconnect_M04_AXI_ARADDR;
  wire [2:0]axi_interconnect_M04_AXI_ARPROT;
  wire axi_interconnect_M04_AXI_ARREADY;
  wire axi_interconnect_M04_AXI_ARVALID;
  wire [14:0]axi_interconnect_M04_AXI_AWADDR;
  wire [2:0]axi_interconnect_M04_AXI_AWPROT;
  wire axi_interconnect_M04_AXI_AWREADY;
  wire axi_interconnect_M04_AXI_AWVALID;
  wire axi_interconnect_M04_AXI_BREADY;
  wire [1:0]axi_interconnect_M04_AXI_BRESP;
  wire axi_interconnect_M04_AXI_BVALID;
  wire [31:0]axi_interconnect_M04_AXI_RDATA;
  wire axi_interconnect_M04_AXI_RREADY;
  wire [1:0]axi_interconnect_M04_AXI_RRESP;
  wire axi_interconnect_M04_AXI_RVALID;
  wire [31:0]axi_interconnect_M04_AXI_WDATA;
  wire axi_interconnect_M04_AXI_WREADY;
  wire [3:0]axi_interconnect_M04_AXI_WSTRB;
  wire axi_interconnect_M04_AXI_WVALID;
  wire [8:0]error_bus_dout;
  wire [31:0]ifft_M_AXIS_DATA_TDATA;
  wire ifft_M_AXIS_DATA_TLAST;
  wire ifft_M_AXIS_DATA_TREADY;
  wire ifft_M_AXIS_DATA_TVALID;
  wire ifft_event_frame_started;
  wire pilot_insertion_error;
  wire pilot_insertion_pilot_flag;
  wire preamble_preamble_flag;
  wire processing_system7_0_FCLK_CLK0;
  wire [31:0]qam_modulator_M00_AXIS_TDATA;
  wire qam_modulator_M00_AXIS_TLAST;
  wire qam_modulator_M00_AXIS_TREADY;
  wire [3:0]qam_modulator_M00_AXIS_TSTRB;
  wire qam_modulator_M00_AXIS_TVALID;
  wire [3:0]status_bus_dout;
  wire xfft_0_event_data_in_channel_halt;
  wire xfft_0_event_data_out_channel_halt;
  wire xfft_0_event_status_channel_halt;
  wire xfft_0_event_tlast_missing;
  wire xfft_0_event_tlast_unexpected;

  assign CONFIG_AXI_arready[0] = S00_AXI_1_ARREADY;
  assign CONFIG_AXI_awready[0] = S00_AXI_1_AWREADY;
  assign CONFIG_AXI_bresp[1:0] = S00_AXI_1_BRESP;
  assign CONFIG_AXI_bvalid[0] = S00_AXI_1_BVALID;
  assign CONFIG_AXI_rdata[31:0] = S00_AXI_1_RDATA;
  assign CONFIG_AXI_rresp[1:0] = S00_AXI_1_RRESP;
  assign CONFIG_AXI_rvalid[0] = S00_AXI_1_RVALID;
  assign CONFIG_AXI_wready[0] = S00_AXI_1_WREADY;
  assign Cyclic_Prefix_0_M00_AXIS_TREADY = M00_AXIS_tready;
  assign DATA_IN_AXIS_tready = S00_AXIS_1_TREADY;
  assign ERROR[8:0] = error_bus_dout;
  assign M00_AXIS_tdata[31:0] = Cyclic_Prefix_0_M00_AXIS_TDATA;
  assign M00_AXIS_tlast = Cyclic_Prefix_0_M00_AXIS_TLAST;
  assign M00_AXIS_tstrb[3:0] = Cyclic_Prefix_0_M00_AXIS_TSTRB;
  assign M00_AXIS_tvalid = Cyclic_Prefix_0_M00_AXIS_TVALID;
  assign Net1 = RST;
  assign S00_AXIS_1_TDATA = DATA_IN_AXIS_tdata[31:0];
  assign S00_AXIS_1_TLAST = DATA_IN_AXIS_tlast;
  assign S00_AXIS_1_TSTRB = DATA_IN_AXIS_tstrb[3:0];
  assign S00_AXIS_1_TVALID = DATA_IN_AXIS_tvalid;
  assign S00_AXI_1_ARADDR = CONFIG_AXI_araddr[14:0];
  assign S00_AXI_1_ARPROT = CONFIG_AXI_arprot[2:0];
  assign S00_AXI_1_ARVALID = CONFIG_AXI_arvalid[0];
  assign S00_AXI_1_AWADDR = CONFIG_AXI_awaddr[14:0];
  assign S00_AXI_1_AWPROT = CONFIG_AXI_awprot[2:0];
  assign S00_AXI_1_AWVALID = CONFIG_AXI_awvalid[0];
  assign S00_AXI_1_BREADY = CONFIG_AXI_bready[0];
  assign S00_AXI_1_RREADY = CONFIG_AXI_rready[0];
  assign S00_AXI_1_WDATA = CONFIG_AXI_wdata[31:0];
  assign S00_AXI_1_WSTRB = CONFIG_AXI_wstrb[3:0];
  assign S00_AXI_1_WVALID = CONFIG_AXI_wvalid[0];
  assign STATUS[3:0] = status_bus_dout;
  assign processing_system7_0_FCLK_CLK0 = CLK;
  design_1_Cyclic_Prefix_0_1 Cyclic_Prefix_0
       (.cp_flag(Cyclic_Prefix_0_cp_flag),
        .error(Cyclic_Prefix_0_error),
        .m00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .m00_axis_aresetn(Net1),
        .m00_axis_tdata(Cyclic_Prefix_0_M00_AXIS_TDATA),
        .m00_axis_tlast(Cyclic_Prefix_0_M00_AXIS_TLAST),
        .m00_axis_tready(Cyclic_Prefix_0_M00_AXIS_TREADY),
        .m00_axis_tstrb(Cyclic_Prefix_0_M00_AXIS_TSTRB),
        .m00_axis_tvalid(Cyclic_Prefix_0_M00_AXIS_TVALID),
        .s00_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axi_araddr(axi_interconnect_M04_AXI_ARADDR[3:0]),
        .s00_axi_aresetn(Net1),
        .s00_axi_arprot(axi_interconnect_M04_AXI_ARPROT),
        .s00_axi_arready(axi_interconnect_M04_AXI_ARREADY),
        .s00_axi_arvalid(axi_interconnect_M04_AXI_ARVALID),
        .s00_axi_awaddr(axi_interconnect_M04_AXI_AWADDR[3:0]),
        .s00_axi_awprot(axi_interconnect_M04_AXI_AWPROT),
        .s00_axi_awready(axi_interconnect_M04_AXI_AWREADY),
        .s00_axi_awvalid(axi_interconnect_M04_AXI_AWVALID),
        .s00_axi_bready(axi_interconnect_M04_AXI_BREADY),
        .s00_axi_bresp(axi_interconnect_M04_AXI_BRESP),
        .s00_axi_bvalid(axi_interconnect_M04_AXI_BVALID),
        .s00_axi_rdata(axi_interconnect_M04_AXI_RDATA),
        .s00_axi_rready(axi_interconnect_M04_AXI_RREADY),
        .s00_axi_rresp(axi_interconnect_M04_AXI_RRESP),
        .s00_axi_rvalid(axi_interconnect_M04_AXI_RVALID),
        .s00_axi_wdata(axi_interconnect_M04_AXI_WDATA),
        .s00_axi_wready(axi_interconnect_M04_AXI_WREADY),
        .s00_axi_wstrb(axi_interconnect_M04_AXI_WSTRB),
        .s00_axi_wvalid(axi_interconnect_M04_AXI_WVALID),
        .s00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axis_aresetn(Net1),
        .s00_axis_tdata(ifft_M_AXIS_DATA_TDATA),
        .s00_axis_tlast(ifft_M_AXIS_DATA_TLAST),
        .s00_axis_tready(ifft_M_AXIS_DATA_TREADY),
        .s00_axis_tvalid(ifft_M_AXIS_DATA_TVALID));
  design_1_FFT_Controller_0_1 FFT_Controller_0
       (.m00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .m00_axis_aresetn(Net1),
        .m00_axis_tdata(FFT_Controller_0_M00_AXIS_TDATA),
        .m00_axis_tready(FFT_Controller_0_M00_AXIS_TREADY),
        .m00_axis_tvalid(FFT_Controller_0_M00_AXIS_TVALID),
        .s00_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axi_araddr(axi_interconnect_M03_AXI_ARADDR[3:0]),
        .s00_axi_aresetn(Net1),
        .s00_axi_arprot(axi_interconnect_M03_AXI_ARPROT),
        .s00_axi_arready(axi_interconnect_M03_AXI_ARREADY),
        .s00_axi_arvalid(axi_interconnect_M03_AXI_ARVALID),
        .s00_axi_awaddr(axi_interconnect_M03_AXI_AWADDR[3:0]),
        .s00_axi_awprot(axi_interconnect_M03_AXI_AWPROT),
        .s00_axi_awready(axi_interconnect_M03_AXI_AWREADY),
        .s00_axi_awvalid(axi_interconnect_M03_AXI_AWVALID),
        .s00_axi_bready(axi_interconnect_M03_AXI_BREADY),
        .s00_axi_bresp(axi_interconnect_M03_AXI_BRESP),
        .s00_axi_bvalid(axi_interconnect_M03_AXI_BVALID),
        .s00_axi_rdata(axi_interconnect_M03_AXI_RDATA),
        .s00_axi_rready(axi_interconnect_M03_AXI_RREADY),
        .s00_axi_rresp(axi_interconnect_M03_AXI_RRESP),
        .s00_axi_rvalid(axi_interconnect_M03_AXI_RVALID),
        .s00_axi_wdata(axi_interconnect_M03_AXI_WDATA),
        .s00_axi_wready(axi_interconnect_M03_AXI_WREADY),
        .s00_axi_wstrb(axi_interconnect_M03_AXI_WSTRB),
        .s00_axi_wvalid(axi_interconnect_M03_AXI_WVALID));
  design_1_axi_interconnect_0_0 axi_interconnect
       (.ACLK(processing_system7_0_FCLK_CLK0),
        .ARESETN(Net1),
        .M00_ACLK(processing_system7_0_FCLK_CLK0),
        .M00_ARESETN(Net1),
        .M00_AXI_araddr(axi_interconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arprot(axi_interconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arready(axi_interconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awprot(axi_interconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awready(axi_interconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_interconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_interconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_interconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_interconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(axi_interconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_interconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_interconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_interconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(axi_interconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_interconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_0_M00_AXI_WVALID),
        .M01_ACLK(processing_system7_0_FCLK_CLK0),
        .M01_ARESETN(Net1),
        .M01_AXI_araddr(axi_interconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arprot(axi_interconnect_0_M01_AXI_ARPROT),
        .M01_AXI_arready(axi_interconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_interconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_interconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awprot(axi_interconnect_0_M01_AXI_AWPROT),
        .M01_AXI_awready(axi_interconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_interconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_interconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_interconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_interconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_interconnect_0_M01_AXI_RDATA),
        .M01_AXI_rready(axi_interconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_interconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_interconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_interconnect_0_M01_AXI_WDATA),
        .M01_AXI_wready(axi_interconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_interconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_interconnect_0_M01_AXI_WVALID),
        .M02_ACLK(processing_system7_0_FCLK_CLK0),
        .M02_ARESETN(Net1),
        .M02_AXI_araddr(axi_interconnect_0_M02_AXI_ARADDR),
        .M02_AXI_arprot(axi_interconnect_0_M02_AXI_ARPROT),
        .M02_AXI_arready(axi_interconnect_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_interconnect_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_interconnect_0_M02_AXI_AWADDR),
        .M02_AXI_awprot(axi_interconnect_0_M02_AXI_AWPROT),
        .M02_AXI_awready(axi_interconnect_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_interconnect_0_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_interconnect_0_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_interconnect_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_interconnect_0_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_interconnect_0_M02_AXI_RDATA),
        .M02_AXI_rready(axi_interconnect_0_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_interconnect_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_interconnect_0_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_interconnect_0_M02_AXI_WDATA),
        .M02_AXI_wready(axi_interconnect_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_interconnect_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_interconnect_0_M02_AXI_WVALID),
        .M03_ACLK(processing_system7_0_FCLK_CLK0),
        .M03_ARESETN(Net1),
        .M03_AXI_araddr(axi_interconnect_M03_AXI_ARADDR),
        .M03_AXI_arprot(axi_interconnect_M03_AXI_ARPROT),
        .M03_AXI_arready(axi_interconnect_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi_interconnect_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi_interconnect_M03_AXI_AWADDR),
        .M03_AXI_awprot(axi_interconnect_M03_AXI_AWPROT),
        .M03_AXI_awready(axi_interconnect_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi_interconnect_M03_AXI_AWVALID),
        .M03_AXI_bready(axi_interconnect_M03_AXI_BREADY),
        .M03_AXI_bresp(axi_interconnect_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi_interconnect_M03_AXI_BVALID),
        .M03_AXI_rdata(axi_interconnect_M03_AXI_RDATA),
        .M03_AXI_rready(axi_interconnect_M03_AXI_RREADY),
        .M03_AXI_rresp(axi_interconnect_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi_interconnect_M03_AXI_RVALID),
        .M03_AXI_wdata(axi_interconnect_M03_AXI_WDATA),
        .M03_AXI_wready(axi_interconnect_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi_interconnect_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi_interconnect_M03_AXI_WVALID),
        .M04_ACLK(processing_system7_0_FCLK_CLK0),
        .M04_ARESETN(Net1),
        .M04_AXI_araddr(axi_interconnect_M04_AXI_ARADDR),
        .M04_AXI_arprot(axi_interconnect_M04_AXI_ARPROT),
        .M04_AXI_arready(axi_interconnect_M04_AXI_ARREADY),
        .M04_AXI_arvalid(axi_interconnect_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi_interconnect_M04_AXI_AWADDR),
        .M04_AXI_awprot(axi_interconnect_M04_AXI_AWPROT),
        .M04_AXI_awready(axi_interconnect_M04_AXI_AWREADY),
        .M04_AXI_awvalid(axi_interconnect_M04_AXI_AWVALID),
        .M04_AXI_bready(axi_interconnect_M04_AXI_BREADY),
        .M04_AXI_bresp(axi_interconnect_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi_interconnect_M04_AXI_BVALID),
        .M04_AXI_rdata(axi_interconnect_M04_AXI_RDATA),
        .M04_AXI_rready(axi_interconnect_M04_AXI_RREADY),
        .M04_AXI_rresp(axi_interconnect_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi_interconnect_M04_AXI_RVALID),
        .M04_AXI_wdata(axi_interconnect_M04_AXI_WDATA),
        .M04_AXI_wready(axi_interconnect_M04_AXI_WREADY),
        .M04_AXI_wstrb(axi_interconnect_M04_AXI_WSTRB),
        .M04_AXI_wvalid(axi_interconnect_M04_AXI_WVALID),
        .S00_ACLK(processing_system7_0_FCLK_CLK0),
        .S00_ARESETN(Net1),
        .S00_AXI_araddr(S00_AXI_1_ARADDR),
        .S00_AXI_arprot(S00_AXI_1_ARPROT),
        .S00_AXI_arready(S00_AXI_1_ARREADY),
        .S00_AXI_arvalid(S00_AXI_1_ARVALID),
        .S00_AXI_awaddr(S00_AXI_1_AWADDR),
        .S00_AXI_awprot(S00_AXI_1_AWPROT),
        .S00_AXI_awready(S00_AXI_1_AWREADY),
        .S00_AXI_awvalid(S00_AXI_1_AWVALID),
        .S00_AXI_bready(S00_AXI_1_BREADY),
        .S00_AXI_bresp(S00_AXI_1_BRESP),
        .S00_AXI_bvalid(S00_AXI_1_BVALID),
        .S00_AXI_rdata(S00_AXI_1_RDATA),
        .S00_AXI_rready(S00_AXI_1_RREADY),
        .S00_AXI_rresp(S00_AXI_1_RRESP),
        .S00_AXI_rvalid(S00_AXI_1_RVALID),
        .S00_AXI_wdata(S00_AXI_1_WDATA),
        .S00_AXI_wready(S00_AXI_1_WREADY),
        .S00_AXI_wstrb(S00_AXI_1_WSTRB),
        .S00_AXI_wvalid(S00_AXI_1_WVALID));
  design_1_xlconcat_0_0 error_bus
       (.In0(QAM_Modulator_0_error),
        .In1(Preamble_0_error),
        .In2(pilot_insertion_error),
        .In3(xfft_0_event_tlast_unexpected),
        .In4(xfft_0_event_tlast_missing),
        .In5(xfft_0_event_status_channel_halt),
        .In6(xfft_0_event_data_in_channel_halt),
        .In7(xfft_0_event_data_out_channel_halt),
        .In8(Cyclic_Prefix_0_error),
        .dout(error_bus_dout));
  design_1_xfft_0_0 ifft
       (.aclk(processing_system7_0_FCLK_CLK0),
        .aresetn(Net1),
        .event_data_in_channel_halt(xfft_0_event_data_in_channel_halt),
        .event_data_out_channel_halt(xfft_0_event_data_out_channel_halt),
        .event_frame_started(ifft_event_frame_started),
        .event_status_channel_halt(xfft_0_event_status_channel_halt),
        .event_tlast_missing(xfft_0_event_tlast_missing),
        .event_tlast_unexpected(xfft_0_event_tlast_unexpected),
        .m_axis_data_tdata(ifft_M_AXIS_DATA_TDATA),
        .m_axis_data_tlast(ifft_M_AXIS_DATA_TLAST),
        .m_axis_data_tready(ifft_M_AXIS_DATA_TREADY),
        .m_axis_data_tvalid(ifft_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(FFT_Controller_0_M00_AXIS_TDATA),
        .s_axis_config_tready(FFT_Controller_0_M00_AXIS_TREADY),
        .s_axis_config_tvalid(FFT_Controller_0_M00_AXIS_TVALID),
        .s_axis_data_tdata(Pilot_Insertion_0_M00_AXIS_TDATA),
        .s_axis_data_tlast(Pilot_Insertion_0_M00_AXIS_TLAST),
        .s_axis_data_tready(Pilot_Insertion_0_M00_AXIS_TREADY),
        .s_axis_data_tvalid(Pilot_Insertion_0_M00_AXIS_TVALID));
  design_1_Pilot_Insertion_0_0 pilot_insertion
       (.error(pilot_insertion_error),
        .m00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .m00_axis_aresetn(Net1),
        .m00_axis_tdata(Pilot_Insertion_0_M00_AXIS_TDATA),
        .m00_axis_tlast(Pilot_Insertion_0_M00_AXIS_TLAST),
        .m00_axis_tready(Pilot_Insertion_0_M00_AXIS_TREADY),
        .m00_axis_tvalid(Pilot_Insertion_0_M00_AXIS_TVALID),
        .pilot_flag(pilot_insertion_pilot_flag),
        .s00_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axi_araddr(axi_interconnect_0_M02_AXI_ARADDR[3:0]),
        .s00_axi_aresetn(Net1),
        .s00_axi_arprot(axi_interconnect_0_M02_AXI_ARPROT),
        .s00_axi_arready(axi_interconnect_0_M02_AXI_ARREADY),
        .s00_axi_arvalid(axi_interconnect_0_M02_AXI_ARVALID),
        .s00_axi_awaddr(axi_interconnect_0_M02_AXI_AWADDR[3:0]),
        .s00_axi_awprot(axi_interconnect_0_M02_AXI_AWPROT),
        .s00_axi_awready(axi_interconnect_0_M02_AXI_AWREADY),
        .s00_axi_awvalid(axi_interconnect_0_M02_AXI_AWVALID),
        .s00_axi_bready(axi_interconnect_0_M02_AXI_BREADY),
        .s00_axi_bresp(axi_interconnect_0_M02_AXI_BRESP),
        .s00_axi_bvalid(axi_interconnect_0_M02_AXI_BVALID),
        .s00_axi_rdata(axi_interconnect_0_M02_AXI_RDATA),
        .s00_axi_rready(axi_interconnect_0_M02_AXI_RREADY),
        .s00_axi_rresp(axi_interconnect_0_M02_AXI_RRESP),
        .s00_axi_rvalid(axi_interconnect_0_M02_AXI_RVALID),
        .s00_axi_wdata(axi_interconnect_0_M02_AXI_WDATA),
        .s00_axi_wready(axi_interconnect_0_M02_AXI_WREADY),
        .s00_axi_wstrb(axi_interconnect_0_M02_AXI_WSTRB),
        .s00_axi_wvalid(axi_interconnect_0_M02_AXI_WVALID),
        .s00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axis_aresetn(Net1),
        .s00_axis_tdata(Preamble_0_M00_AXIS_TDATA),
        .s00_axis_tlast(Preamble_0_M00_AXIS_TLAST),
        .s00_axis_tready(Preamble_0_M00_AXIS_TREADY),
        .s00_axis_tstrb(Preamble_0_M00_AXIS_TSTRB),
        .s00_axis_tvalid(Preamble_0_M00_AXIS_TVALID));
  design_1_Preamble_0_0 preamble
       (.error(Preamble_0_error),
        .m00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .m00_axis_aresetn(Net1),
        .m00_axis_tdata(Preamble_0_M00_AXIS_TDATA),
        .m00_axis_tlast(Preamble_0_M00_AXIS_TLAST),
        .m00_axis_tready(Preamble_0_M00_AXIS_TREADY),
        .m00_axis_tstrb(Preamble_0_M00_AXIS_TSTRB),
        .m00_axis_tvalid(Preamble_0_M00_AXIS_TVALID),
        .preamble_flag(preamble_preamble_flag),
        .s00_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axi_araddr(axi_interconnect_0_M01_AXI_ARADDR[3:0]),
        .s00_axi_aresetn(Net1),
        .s00_axi_arprot(axi_interconnect_0_M01_AXI_ARPROT),
        .s00_axi_arready(axi_interconnect_0_M01_AXI_ARREADY),
        .s00_axi_arvalid(axi_interconnect_0_M01_AXI_ARVALID),
        .s00_axi_awaddr(axi_interconnect_0_M01_AXI_AWADDR[3:0]),
        .s00_axi_awprot(axi_interconnect_0_M01_AXI_AWPROT),
        .s00_axi_awready(axi_interconnect_0_M01_AXI_AWREADY),
        .s00_axi_awvalid(axi_interconnect_0_M01_AXI_AWVALID),
        .s00_axi_bready(axi_interconnect_0_M01_AXI_BREADY),
        .s00_axi_bresp(axi_interconnect_0_M01_AXI_BRESP),
        .s00_axi_bvalid(axi_interconnect_0_M01_AXI_BVALID),
        .s00_axi_rdata(axi_interconnect_0_M01_AXI_RDATA),
        .s00_axi_rready(axi_interconnect_0_M01_AXI_RREADY),
        .s00_axi_rresp(axi_interconnect_0_M01_AXI_RRESP),
        .s00_axi_rvalid(axi_interconnect_0_M01_AXI_RVALID),
        .s00_axi_wdata(axi_interconnect_0_M01_AXI_WDATA),
        .s00_axi_wready(axi_interconnect_0_M01_AXI_WREADY),
        .s00_axi_wstrb(axi_interconnect_0_M01_AXI_WSTRB),
        .s00_axi_wvalid(axi_interconnect_0_M01_AXI_WVALID),
        .s00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axis_aresetn(Net1),
        .s00_axis_tdata(qam_modulator_M00_AXIS_TDATA),
        .s00_axis_tlast(qam_modulator_M00_AXIS_TLAST),
        .s00_axis_tready(qam_modulator_M00_AXIS_TREADY),
        .s00_axis_tstrb(qam_modulator_M00_AXIS_TSTRB),
        .s00_axis_tvalid(qam_modulator_M00_AXIS_TVALID));
  design_1_QAM_Modulator_0_0 qam_modulator
       (.error(QAM_Modulator_0_error),
        .m00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .m00_axis_aresetn(Net1),
        .m00_axis_tdata(qam_modulator_M00_AXIS_TDATA),
        .m00_axis_tlast(qam_modulator_M00_AXIS_TLAST),
        .m00_axis_tready(qam_modulator_M00_AXIS_TREADY),
        .m00_axis_tstrb(qam_modulator_M00_AXIS_TSTRB),
        .m00_axis_tvalid(qam_modulator_M00_AXIS_TVALID),
        .s00_axi_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axi_araddr(axi_interconnect_0_M00_AXI_ARADDR[3:0]),
        .s00_axi_aresetn(Net1),
        .s00_axi_arprot(axi_interconnect_0_M00_AXI_ARPROT),
        .s00_axi_arready(axi_interconnect_0_M00_AXI_ARREADY),
        .s00_axi_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
        .s00_axi_awaddr(axi_interconnect_0_M00_AXI_AWADDR[3:0]),
        .s00_axi_awprot(axi_interconnect_0_M00_AXI_AWPROT),
        .s00_axi_awready(axi_interconnect_0_M00_AXI_AWREADY),
        .s00_axi_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
        .s00_axi_bready(axi_interconnect_0_M00_AXI_BREADY),
        .s00_axi_bresp(axi_interconnect_0_M00_AXI_BRESP),
        .s00_axi_bvalid(axi_interconnect_0_M00_AXI_BVALID),
        .s00_axi_rdata(axi_interconnect_0_M00_AXI_RDATA),
        .s00_axi_rready(axi_interconnect_0_M00_AXI_RREADY),
        .s00_axi_rresp(axi_interconnect_0_M00_AXI_RRESP),
        .s00_axi_rvalid(axi_interconnect_0_M00_AXI_RVALID),
        .s00_axi_wdata(axi_interconnect_0_M00_AXI_WDATA),
        .s00_axi_wready(axi_interconnect_0_M00_AXI_WREADY),
        .s00_axi_wstrb(axi_interconnect_0_M00_AXI_WSTRB),
        .s00_axi_wvalid(axi_interconnect_0_M00_AXI_WVALID),
        .s00_axis_aclk(processing_system7_0_FCLK_CLK0),
        .s00_axis_aresetn(Net1),
        .s00_axis_tdata(S00_AXIS_1_TDATA),
        .s00_axis_tlast(S00_AXIS_1_TLAST),
        .s00_axis_tready(S00_AXIS_1_TREADY),
        .s00_axis_tstrb(S00_AXIS_1_TSTRB),
        .s00_axis_tvalid(S00_AXIS_1_TVALID));
  design_1_xlconcat_0_1 status_bus
       (.In0(preamble_preamble_flag),
        .In1(pilot_insertion_pilot_flag),
        .In2(ifft_event_frame_started),
        .In3(Cyclic_Prefix_0_cp_flag),
        .dout(status_bus_dout));
endmodule

module design_1_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arprot,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awprot,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arprot,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awprot,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [14:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [14:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [14:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [14:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [14:0]M02_AXI_araddr;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [14:0]M02_AXI_awaddr;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [14:0]M03_AXI_araddr;
  output [2:0]M03_AXI_arprot;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [14:0]M03_AXI_awaddr;
  output [2:0]M03_AXI_awprot;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [14:0]M04_AXI_araddr;
  output [2:0]M04_AXI_arprot;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [14:0]M04_AXI_awaddr;
  output [2:0]M04_AXI_awprot;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [14:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [14:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire axi_interconnect_ACLK_net;
  wire axi_interconnect_ARESETN_net;
  wire [14:0]axi_interconnect_to_s00_couplers_ARADDR;
  wire [2:0]axi_interconnect_to_s00_couplers_ARPROT;
  wire [0:0]axi_interconnect_to_s00_couplers_ARREADY;
  wire [0:0]axi_interconnect_to_s00_couplers_ARVALID;
  wire [14:0]axi_interconnect_to_s00_couplers_AWADDR;
  wire [2:0]axi_interconnect_to_s00_couplers_AWPROT;
  wire [0:0]axi_interconnect_to_s00_couplers_AWREADY;
  wire [0:0]axi_interconnect_to_s00_couplers_AWVALID;
  wire [0:0]axi_interconnect_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_BRESP;
  wire [0:0]axi_interconnect_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_RDATA;
  wire [0:0]axi_interconnect_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_to_s00_couplers_RRESP;
  wire [0:0]axi_interconnect_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_to_s00_couplers_WDATA;
  wire [0:0]axi_interconnect_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_to_s00_couplers_WSTRB;
  wire [0:0]axi_interconnect_to_s00_couplers_WVALID;
  wire [14:0]m00_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_ARPROT;
  wire m00_couplers_to_axi_interconnect_ARREADY;
  wire m00_couplers_to_axi_interconnect_ARVALID;
  wire [14:0]m00_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_AWPROT;
  wire m00_couplers_to_axi_interconnect_AWREADY;
  wire m00_couplers_to_axi_interconnect_AWVALID;
  wire m00_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_BRESP;
  wire m00_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_RDATA;
  wire m00_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_RRESP;
  wire m00_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_WDATA;
  wire m00_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m00_couplers_to_axi_interconnect_WSTRB;
  wire m00_couplers_to_axi_interconnect_WVALID;
  wire [14:0]m01_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m01_couplers_to_axi_interconnect_ARPROT;
  wire m01_couplers_to_axi_interconnect_ARREADY;
  wire m01_couplers_to_axi_interconnect_ARVALID;
  wire [14:0]m01_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m01_couplers_to_axi_interconnect_AWPROT;
  wire m01_couplers_to_axi_interconnect_AWREADY;
  wire m01_couplers_to_axi_interconnect_AWVALID;
  wire m01_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_BRESP;
  wire m01_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_RDATA;
  wire m01_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_RRESP;
  wire m01_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_WDATA;
  wire m01_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m01_couplers_to_axi_interconnect_WSTRB;
  wire m01_couplers_to_axi_interconnect_WVALID;
  wire [14:0]m02_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m02_couplers_to_axi_interconnect_ARPROT;
  wire m02_couplers_to_axi_interconnect_ARREADY;
  wire m02_couplers_to_axi_interconnect_ARVALID;
  wire [14:0]m02_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m02_couplers_to_axi_interconnect_AWPROT;
  wire m02_couplers_to_axi_interconnect_AWREADY;
  wire m02_couplers_to_axi_interconnect_AWVALID;
  wire m02_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_BRESP;
  wire m02_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_RDATA;
  wire m02_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_RRESP;
  wire m02_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_WDATA;
  wire m02_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m02_couplers_to_axi_interconnect_WSTRB;
  wire m02_couplers_to_axi_interconnect_WVALID;
  wire [14:0]m03_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m03_couplers_to_axi_interconnect_ARPROT;
  wire m03_couplers_to_axi_interconnect_ARREADY;
  wire m03_couplers_to_axi_interconnect_ARVALID;
  wire [14:0]m03_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m03_couplers_to_axi_interconnect_AWPROT;
  wire m03_couplers_to_axi_interconnect_AWREADY;
  wire m03_couplers_to_axi_interconnect_AWVALID;
  wire m03_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m03_couplers_to_axi_interconnect_BRESP;
  wire m03_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_RDATA;
  wire m03_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m03_couplers_to_axi_interconnect_RRESP;
  wire m03_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_WDATA;
  wire m03_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m03_couplers_to_axi_interconnect_WSTRB;
  wire m03_couplers_to_axi_interconnect_WVALID;
  wire [14:0]m04_couplers_to_axi_interconnect_ARADDR;
  wire [2:0]m04_couplers_to_axi_interconnect_ARPROT;
  wire m04_couplers_to_axi_interconnect_ARREADY;
  wire m04_couplers_to_axi_interconnect_ARVALID;
  wire [14:0]m04_couplers_to_axi_interconnect_AWADDR;
  wire [2:0]m04_couplers_to_axi_interconnect_AWPROT;
  wire m04_couplers_to_axi_interconnect_AWREADY;
  wire m04_couplers_to_axi_interconnect_AWVALID;
  wire m04_couplers_to_axi_interconnect_BREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_BRESP;
  wire m04_couplers_to_axi_interconnect_BVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_RDATA;
  wire m04_couplers_to_axi_interconnect_RREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_RRESP;
  wire m04_couplers_to_axi_interconnect_RVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_WDATA;
  wire m04_couplers_to_axi_interconnect_WREADY;
  wire [3:0]m04_couplers_to_axi_interconnect_WSTRB;
  wire m04_couplers_to_axi_interconnect_WVALID;
  wire [14:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [14:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [0:0]s00_couplers_to_xbar_AWVALID;
  wire [0:0]s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WVALID;
  wire [14:0]xbar_to_m00_couplers_ARADDR;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [14:0]xbar_to_m00_couplers_AWADDR;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [29:15]xbar_to_m01_couplers_ARADDR;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [29:15]xbar_to_m01_couplers_AWADDR;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [44:30]xbar_to_m02_couplers_ARADDR;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [44:30]xbar_to_m02_couplers_AWADDR;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [59:45]xbar_to_m03_couplers_ARADDR;
  wire [11:9]xbar_to_m03_couplers_ARPROT;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [59:45]xbar_to_m03_couplers_AWADDR;
  wire [11:9]xbar_to_m03_couplers_AWPROT;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [74:60]xbar_to_m04_couplers_ARADDR;
  wire [14:12]xbar_to_m04_couplers_ARPROT;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [74:60]xbar_to_m04_couplers_AWADDR;
  wire [14:12]xbar_to_m04_couplers_AWPROT;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;

  assign M00_AXI_araddr[14:0] = m00_couplers_to_axi_interconnect_ARADDR;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_interconnect_ARPROT;
  assign M00_AXI_arvalid = m00_couplers_to_axi_interconnect_ARVALID;
  assign M00_AXI_awaddr[14:0] = m00_couplers_to_axi_interconnect_AWADDR;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_interconnect_AWPROT;
  assign M00_AXI_awvalid = m00_couplers_to_axi_interconnect_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_interconnect_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_interconnect_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_interconnect_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_interconnect_WVALID;
  assign M01_AXI_araddr[14:0] = m01_couplers_to_axi_interconnect_ARADDR;
  assign M01_AXI_arprot[2:0] = m01_couplers_to_axi_interconnect_ARPROT;
  assign M01_AXI_arvalid = m01_couplers_to_axi_interconnect_ARVALID;
  assign M01_AXI_awaddr[14:0] = m01_couplers_to_axi_interconnect_AWADDR;
  assign M01_AXI_awprot[2:0] = m01_couplers_to_axi_interconnect_AWPROT;
  assign M01_AXI_awvalid = m01_couplers_to_axi_interconnect_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_axi_interconnect_BREADY;
  assign M01_AXI_rready = m01_couplers_to_axi_interconnect_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_interconnect_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_interconnect_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_axi_interconnect_WVALID;
  assign M02_AXI_araddr[14:0] = m02_couplers_to_axi_interconnect_ARADDR;
  assign M02_AXI_arprot[2:0] = m02_couplers_to_axi_interconnect_ARPROT;
  assign M02_AXI_arvalid = m02_couplers_to_axi_interconnect_ARVALID;
  assign M02_AXI_awaddr[14:0] = m02_couplers_to_axi_interconnect_AWADDR;
  assign M02_AXI_awprot[2:0] = m02_couplers_to_axi_interconnect_AWPROT;
  assign M02_AXI_awvalid = m02_couplers_to_axi_interconnect_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_axi_interconnect_BREADY;
  assign M02_AXI_rready = m02_couplers_to_axi_interconnect_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_axi_interconnect_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_axi_interconnect_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_axi_interconnect_WVALID;
  assign M03_AXI_araddr[14:0] = m03_couplers_to_axi_interconnect_ARADDR;
  assign M03_AXI_arprot[2:0] = m03_couplers_to_axi_interconnect_ARPROT;
  assign M03_AXI_arvalid = m03_couplers_to_axi_interconnect_ARVALID;
  assign M03_AXI_awaddr[14:0] = m03_couplers_to_axi_interconnect_AWADDR;
  assign M03_AXI_awprot[2:0] = m03_couplers_to_axi_interconnect_AWPROT;
  assign M03_AXI_awvalid = m03_couplers_to_axi_interconnect_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_axi_interconnect_BREADY;
  assign M03_AXI_rready = m03_couplers_to_axi_interconnect_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_axi_interconnect_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_axi_interconnect_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_axi_interconnect_WVALID;
  assign M04_AXI_araddr[14:0] = m04_couplers_to_axi_interconnect_ARADDR;
  assign M04_AXI_arprot[2:0] = m04_couplers_to_axi_interconnect_ARPROT;
  assign M04_AXI_arvalid = m04_couplers_to_axi_interconnect_ARVALID;
  assign M04_AXI_awaddr[14:0] = m04_couplers_to_axi_interconnect_AWADDR;
  assign M04_AXI_awprot[2:0] = m04_couplers_to_axi_interconnect_AWPROT;
  assign M04_AXI_awvalid = m04_couplers_to_axi_interconnect_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_axi_interconnect_BREADY;
  assign M04_AXI_rready = m04_couplers_to_axi_interconnect_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_axi_interconnect_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_axi_interconnect_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_axi_interconnect_WVALID;
  assign S00_AXI_arready[0] = axi_interconnect_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = axi_interconnect_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = axi_interconnect_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = axi_interconnect_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = axi_interconnect_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = axi_interconnect_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = axi_interconnect_to_s00_couplers_WREADY;
  assign axi_interconnect_ACLK_net = ACLK;
  assign axi_interconnect_ARESETN_net = ARESETN;
  assign axi_interconnect_to_s00_couplers_ARADDR = S00_AXI_araddr[14:0];
  assign axi_interconnect_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign axi_interconnect_to_s00_couplers_AWADDR = S00_AXI_awaddr[14:0];
  assign axi_interconnect_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign axi_interconnect_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign axi_interconnect_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign axi_interconnect_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  assign m00_couplers_to_axi_interconnect_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_interconnect_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_interconnect_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_interconnect_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_interconnect_WREADY = M00_AXI_wready;
  assign m01_couplers_to_axi_interconnect_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_axi_interconnect_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_axi_interconnect_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_interconnect_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_axi_interconnect_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_interconnect_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_interconnect_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_axi_interconnect_WREADY = M01_AXI_wready;
  assign m02_couplers_to_axi_interconnect_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_axi_interconnect_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_axi_interconnect_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_axi_interconnect_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_axi_interconnect_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_axi_interconnect_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_axi_interconnect_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_axi_interconnect_WREADY = M02_AXI_wready;
  assign m03_couplers_to_axi_interconnect_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_axi_interconnect_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_axi_interconnect_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_axi_interconnect_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_axi_interconnect_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_axi_interconnect_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_axi_interconnect_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_axi_interconnect_WREADY = M03_AXI_wready;
  assign m04_couplers_to_axi_interconnect_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_axi_interconnect_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_axi_interconnect_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_axi_interconnect_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_axi_interconnect_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_axi_interconnect_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_axi_interconnect_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_axi_interconnect_WREADY = M04_AXI_wready;
  m00_couplers_imp_P3KODA m00_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m00_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m00_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1E9HINZ m01_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m01_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m01_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m01_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m01_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m01_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_QJ8X5P m02_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m02_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m02_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m02_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m02_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m02_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m02_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m02_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m02_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m02_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m02_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m02_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m02_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m02_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m02_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m02_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_1D3I8FW m03_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m03_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m03_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m03_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m03_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m03_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m03_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m03_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m03_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m03_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m03_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m03_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m03_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m03_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m03_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m03_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m03_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m03_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_MPPXSO m04_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(m04_couplers_to_axi_interconnect_ARADDR),
        .M_AXI_arprot(m04_couplers_to_axi_interconnect_ARPROT),
        .M_AXI_arready(m04_couplers_to_axi_interconnect_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_axi_interconnect_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_axi_interconnect_AWADDR),
        .M_AXI_awprot(m04_couplers_to_axi_interconnect_AWPROT),
        .M_AXI_awready(m04_couplers_to_axi_interconnect_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_axi_interconnect_AWVALID),
        .M_AXI_bready(m04_couplers_to_axi_interconnect_BREADY),
        .M_AXI_bresp(m04_couplers_to_axi_interconnect_BRESP),
        .M_AXI_bvalid(m04_couplers_to_axi_interconnect_BVALID),
        .M_AXI_rdata(m04_couplers_to_axi_interconnect_RDATA),
        .M_AXI_rready(m04_couplers_to_axi_interconnect_RREADY),
        .M_AXI_rresp(m04_couplers_to_axi_interconnect_RRESP),
        .M_AXI_rvalid(m04_couplers_to_axi_interconnect_RVALID),
        .M_AXI_wdata(m04_couplers_to_axi_interconnect_WDATA),
        .M_AXI_wready(m04_couplers_to_axi_interconnect_WREADY),
        .M_AXI_wstrb(m04_couplers_to_axi_interconnect_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_axi_interconnect_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m04_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m04_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  s00_couplers_imp_19B3V30 s00_couplers
       (.M_ACLK(axi_interconnect_ACLK_net),
        .M_ARESETN(axi_interconnect_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(axi_interconnect_ACLK_net),
        .S_ARESETN(axi_interconnect_ARESETN_net),
        .S_AXI_araddr(axi_interconnect_to_s00_couplers_ARADDR),
        .S_AXI_arprot(axi_interconnect_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_interconnect_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(axi_interconnect_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_to_s00_couplers_AWADDR),
        .S_AXI_awprot(axi_interconnect_to_s00_couplers_AWPROT),
        .S_AXI_awready(axi_interconnect_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(axi_interconnect_to_s00_couplers_AWVALID),
        .S_AXI_bready(axi_interconnect_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_to_s00_couplers_RDATA),
        .S_AXI_rready(axi_interconnect_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_to_s00_couplers_WDATA),
        .S_AXI_wready(axi_interconnect_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_to_s00_couplers_WVALID));
  design_1_xbar_0 xbar
       (.aclk(axi_interconnect_ACLK_net),
        .aresetn(axi_interconnect_ARESETN_net),
        .m_axi_araddr({xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m04_couplers_ARPROT,xbar_to_m03_couplers_ARPROT,xbar_to_m02_couplers_ARPROT,xbar_to_m01_couplers_ARPROT,xbar_to_m00_couplers_ARPROT}),
        .m_axi_arready({xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m04_couplers_AWPROT,xbar_to_m03_couplers_AWPROT,xbar_to_m02_couplers_AWPROT,xbar_to_m01_couplers_AWPROT,xbar_to_m00_couplers_AWPROT}),
        .m_axi_awready({xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module m00_couplers_imp_P3KODA
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [14:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [14:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [14:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [14:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [14:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [2:0]m00_couplers_to_m00_couplers_ARPROT;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire [14:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [2:0]m00_couplers_to_m00_couplers_AWPROT;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[14:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m00_couplers_to_m00_couplers_ARPROT;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[14:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m00_couplers_to_m00_couplers_AWPROT;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[14:0];
  assign m00_couplers_to_m00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[14:0];
  assign m00_couplers_to_m00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m01_couplers_imp_1E9HINZ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [14:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [14:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [14:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [14:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [14:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [2:0]m01_couplers_to_m01_couplers_ARPROT;
  wire m01_couplers_to_m01_couplers_ARREADY;
  wire m01_couplers_to_m01_couplers_ARVALID;
  wire [14:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [2:0]m01_couplers_to_m01_couplers_AWPROT;
  wire m01_couplers_to_m01_couplers_AWREADY;
  wire m01_couplers_to_m01_couplers_AWVALID;
  wire m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[14:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m01_couplers_to_m01_couplers_ARPROT;
  assign M_AXI_arvalid = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[14:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m01_couplers_to_m01_couplers_AWPROT;
  assign M_AXI_awvalid = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[14:0];
  assign m01_couplers_to_m01_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[14:0];
  assign m01_couplers_to_m01_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid;
endmodule

module m02_couplers_imp_QJ8X5P
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [14:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [14:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [14:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [14:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [14:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [2:0]m02_couplers_to_m02_couplers_ARPROT;
  wire m02_couplers_to_m02_couplers_ARREADY;
  wire m02_couplers_to_m02_couplers_ARVALID;
  wire [14:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [2:0]m02_couplers_to_m02_couplers_AWPROT;
  wire m02_couplers_to_m02_couplers_AWREADY;
  wire m02_couplers_to_m02_couplers_AWVALID;
  wire m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[14:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m02_couplers_to_m02_couplers_ARPROT;
  assign M_AXI_arvalid = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[14:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m02_couplers_to_m02_couplers_AWPROT;
  assign M_AXI_awvalid = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[14:0];
  assign m02_couplers_to_m02_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[14:0];
  assign m02_couplers_to_m02_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid;
endmodule

module m03_couplers_imp_1D3I8FW
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [14:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [14:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [14:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [14:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [14:0]m03_couplers_to_m03_couplers_ARADDR;
  wire [2:0]m03_couplers_to_m03_couplers_ARPROT;
  wire m03_couplers_to_m03_couplers_ARREADY;
  wire m03_couplers_to_m03_couplers_ARVALID;
  wire [14:0]m03_couplers_to_m03_couplers_AWADDR;
  wire [2:0]m03_couplers_to_m03_couplers_AWPROT;
  wire m03_couplers_to_m03_couplers_AWREADY;
  wire m03_couplers_to_m03_couplers_AWVALID;
  wire m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[14:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m03_couplers_to_m03_couplers_ARPROT;
  assign M_AXI_arvalid = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[14:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m03_couplers_to_m03_couplers_AWPROT;
  assign M_AXI_awvalid = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[14:0];
  assign m03_couplers_to_m03_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[14:0];
  assign m03_couplers_to_m03_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid;
endmodule

module m04_couplers_imp_MPPXSO
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [14:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [14:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [14:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [14:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [14:0]m04_couplers_to_m04_couplers_ARADDR;
  wire [2:0]m04_couplers_to_m04_couplers_ARPROT;
  wire m04_couplers_to_m04_couplers_ARREADY;
  wire m04_couplers_to_m04_couplers_ARVALID;
  wire [14:0]m04_couplers_to_m04_couplers_AWADDR;
  wire [2:0]m04_couplers_to_m04_couplers_AWPROT;
  wire m04_couplers_to_m04_couplers_AWREADY;
  wire m04_couplers_to_m04_couplers_AWVALID;
  wire m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[14:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m04_couplers_to_m04_couplers_ARPROT;
  assign M_AXI_arvalid = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[14:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m04_couplers_to_m04_couplers_AWPROT;
  assign M_AXI_awvalid = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[14:0];
  assign m04_couplers_to_m04_couplers_ARPROT = S_AXI_arprot[2:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[14:0];
  assign m04_couplers_to_m04_couplers_AWPROT = S_AXI_awprot[2:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_19B3V30
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [14:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [14:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [14:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [14:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [14:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [14:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [0:0]s00_couplers_to_s00_couplers_AWREADY;
  wire [0:0]s00_couplers_to_s00_couplers_AWVALID;
  wire [0:0]s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire [0:0]s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire [0:0]s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire [0:0]s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[14:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[14:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid[0] = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready[0] = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[14:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[14:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready[0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready[0];
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid[0];
endmodule
