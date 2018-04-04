
`timescale 1 ns / 1 ps

	module OFDM_Controller_v0_1 #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Master Bus Interface M00_AXI
		parameter  C_M00_AXI_START_DATA_VALUE	= 32'hAA000000,
		parameter  C_M00_AXI_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_M00_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M00_AXI_DATA_WIDTH	= 32,
		parameter integer C_M00_AXI_TRANSACTIONS_NUM	= 4,

		// Parameters of Axi Master Bus Interface M01_AXI
		parameter  C_M01_AXI_START_DATA_VALUE	= 32'hAA000000,
		parameter  C_M01_AXI_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_M01_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M01_AXI_DATA_WIDTH	= 32,
		parameter integer C_M01_AXI_TRANSACTIONS_NUM	= 4,

		// Parameters of Axi Master Bus Interface M02_AXI
		parameter  C_M02_AXI_START_DATA_VALUE	= 32'hAA000000,
		parameter  C_M02_AXI_TARGET_SLAVE_BASE_ADDR	= 32'h40000000,
		parameter integer C_M02_AXI_ADDR_WIDTH	= 32,
		parameter integer C_M02_AXI_DATA_WIDTH	= 32,
		parameter integer C_M02_AXI_TRANSACTIONS_NUM	= 4,
		
		// Parameters of Axi Master Bus Interface M03_AXI
        parameter  C_M03_AXI_START_DATA_VALUE    = 32'hAA000000,
        parameter  C_M03_AXI_TARGET_SLAVE_BASE_ADDR    = 32'h40000000,
        parameter integer C_M03_AXI_ADDR_WIDTH    = 32,
        parameter integer C_M03_AXI_DATA_WIDTH    = 32,
        parameter integer C_M03_AXI_TRANSACTIONS_NUM    = 4,

		// Parameters of Axi Master Bus Interface M00_AXIS
		parameter integer C_M00_AXIS_TDATA_WIDTH	= 32,
		parameter integer C_M00_AXIS_START_COUNT	= 32,

		// Parameters of Axi Slave Bus Interface S00_AXI
		parameter integer C_S00_AXI_DATA_WIDTH	= 32,
		parameter integer C_S00_AXI_ADDR_WIDTH	= 6,

		// Parameters of Axi Slave Bus Interface S_AXI_INTR
		parameter integer C_S_AXI_INTR_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_INTR_ADDR_WIDTH	= 5,
		parameter integer C_NUM_OF_INTR	= 1,
		parameter  C_INTR_SENSITIVITY	= 32'hFFFFFFFF,
		parameter  C_INTR_ACTIVE_STATE	= 32'hFFFFFFFF,
		parameter integer C_IRQ_SENSITIVITY	= 1,
		parameter integer C_IRQ_ACTIVE_STATE	= 1
	)
	(
		// Users to add ports here

		// User ports ends
		// Do not modify the ports beyond this line
		input wire [7:0] error_bus,
		input wire [3:0] status_bus,


		// Ports of Axi Master Bus Interface M00_AXI
		input wire  m00_axi_init_axi_txn,
		output wire  m00_axi_error,
		output wire  m00_axi_txn_done,
		input wire  m00_axi_aclk,
		input wire  m00_axi_aresetn,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_awaddr,
		output wire [2 : 0] m00_axi_awprot,
		output wire  m00_axi_awvalid,
		input wire  m00_axi_awready,
		output wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_wdata,
		output wire [C_M00_AXI_DATA_WIDTH/8-1 : 0] m00_axi_wstrb,
		output wire  m00_axi_wvalid,
		input wire  m00_axi_wready,
		input wire [1 : 0] m00_axi_bresp,
		input wire  m00_axi_bvalid,
		output wire  m00_axi_bready,
		output wire [C_M00_AXI_ADDR_WIDTH-1 : 0] m00_axi_araddr,
		output wire [2 : 0] m00_axi_arprot,
		output wire  m00_axi_arvalid,
		input wire  m00_axi_arready,
		input wire [C_M00_AXI_DATA_WIDTH-1 : 0] m00_axi_rdata,
		input wire [1 : 0] m00_axi_rresp,
		input wire  m00_axi_rvalid,
		output wire  m00_axi_rready,

		// Ports of Axi Master Bus Interface M01_AXI
		input wire  m01_axi_init_axi_txn,
		output wire  m01_axi_error,
		output wire  m01_axi_txn_done,
		input wire  m01_axi_aclk,
		input wire  m01_axi_aresetn,
		output wire [C_M01_AXI_ADDR_WIDTH-1 : 0] m01_axi_awaddr,
		output wire [2 : 0] m01_axi_awprot,
		output wire  m01_axi_awvalid,
		input wire  m01_axi_awready,
		output wire [C_M01_AXI_DATA_WIDTH-1 : 0] m01_axi_wdata,
		output wire [C_M01_AXI_DATA_WIDTH/8-1 : 0] m01_axi_wstrb,
		output wire  m01_axi_wvalid,
		input wire  m01_axi_wready,
		input wire [1 : 0] m01_axi_bresp,
		input wire  m01_axi_bvalid,
		output wire  m01_axi_bready,
		output wire [C_M01_AXI_ADDR_WIDTH-1 : 0] m01_axi_araddr,
		output wire [2 : 0] m01_axi_arprot,
		output wire  m01_axi_arvalid,
		input wire  m01_axi_arready,
		input wire [C_M01_AXI_DATA_WIDTH-1 : 0] m01_axi_rdata,
		input wire [1 : 0] m01_axi_rresp,
		input wire  m01_axi_rvalid,
		output wire  m01_axi_rready,

		// Ports of Axi Master Bus Interface M02_AXI
		input wire  m02_axi_init_axi_txn,
		output wire  m02_axi_error,
		output wire  m02_axi_txn_done,
		input wire  m02_axi_aclk,
		input wire  m02_axi_aresetn,
		output wire [C_M02_AXI_ADDR_WIDTH-1 : 0] m02_axi_awaddr,
		output wire [2 : 0] m02_axi_awprot,
		output wire  m02_axi_awvalid,
		input wire  m02_axi_awready,
		output wire [C_M02_AXI_DATA_WIDTH-1 : 0] m02_axi_wdata,
		output wire [C_M02_AXI_DATA_WIDTH/8-1 : 0] m02_axi_wstrb,
		output wire  m02_axi_wvalid,
		input wire  m02_axi_wready,
		input wire [1 : 0] m02_axi_bresp,
		input wire  m02_axi_bvalid,
		output wire  m02_axi_bready,
		output wire [C_M02_AXI_ADDR_WIDTH-1 : 0] m02_axi_araddr,
		output wire [2 : 0] m02_axi_arprot,
		output wire  m02_axi_arvalid,
		input wire  m02_axi_arready,
		input wire [C_M02_AXI_DATA_WIDTH-1 : 0] m02_axi_rdata,
		input wire [1 : 0] m02_axi_rresp,
		input wire  m02_axi_rvalid,
		output wire  m02_axi_rready,
		
		// Ports of Axi Master Bus Interface M03_AXI
        input wire  m03_axi_init_axi_txn,
        output wire  m03_axi_error,
        output wire  m03_axi_txn_done,
        input wire  m03_axi_aclk,
        input wire  m03_axi_aresetn,
        output wire [C_M03_AXI_ADDR_WIDTH-1 : 0] m03_axi_awaddr,
        output wire [2 : 0] m03_axi_awprot,
        output wire  m03_axi_awvalid,
        input wire  m03_axi_awready,
        output wire [C_M03_AXI_DATA_WIDTH-1 : 0] m03_axi_wdata,
        output wire [C_M03_AXI_DATA_WIDTH/8-1 : 0] m03_axi_wstrb,
        output wire  m03_axi_wvalid,
        input wire  m03_axi_wready,
        input wire [1 : 0] m03_axi_bresp,
        input wire  m03_axi_bvalid,
        output wire  m03_axi_bready,
        output wire [C_M03_AXI_ADDR_WIDTH-1 : 0] m03_axi_araddr,
        output wire [2 : 0] m03_axi_arprot,
        output wire  m03_axi_arvalid,
        input wire  m03_axi_arready,
        input wire [C_M03_AXI_DATA_WIDTH-1 : 0] m03_axi_rdata,
        input wire [1 : 0] m03_axi_rresp,
        input wire  m03_axi_rvalid,
        output wire  m03_axi_rready,

		// Ports of Axi Master Bus Interface M00_AXIS
		input wire  m00_axis_aclk,
		input wire  m00_axis_aresetn,
		output wire  m00_axis_tvalid,
		output wire [C_M00_AXIS_TDATA_WIDTH-1 : 0] m00_axis_tdata,
		output wire [(C_M00_AXIS_TDATA_WIDTH/8)-1 : 0] m00_axis_tstrb,
		output wire  m00_axis_tlast,
		input wire  m00_axis_tready,

		// Ports of Axi Slave Bus Interface S00_AXI
		input wire  s00_axi_aclk,
		input wire  s00_axi_aresetn,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_awaddr,
		input wire [2 : 0] s00_axi_awprot,
		input wire  s00_axi_awvalid,
		output wire  s00_axi_awready,
		input wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_wdata,
		input wire [(C_S00_AXI_DATA_WIDTH/8)-1 : 0] s00_axi_wstrb,
		input wire  s00_axi_wvalid,
		output wire  s00_axi_wready,
		output wire [1 : 0] s00_axi_bresp,
		output wire  s00_axi_bvalid,
		input wire  s00_axi_bready,
		input wire [C_S00_AXI_ADDR_WIDTH-1 : 0] s00_axi_araddr,
		input wire [2 : 0] s00_axi_arprot,
		input wire  s00_axi_arvalid,
		output wire  s00_axi_arready,
		output wire [C_S00_AXI_DATA_WIDTH-1 : 0] s00_axi_rdata,
		output wire [1 : 0] s00_axi_rresp,
		output wire  s00_axi_rvalid,
		input wire  s00_axi_rready,

		// Ports of Axi Slave Bus Interface S_AXI_INTR
		input wire  s_axi_intr_aclk,
		input wire  s_axi_intr_aresetn,
		input wire [C_S_AXI_INTR_ADDR_WIDTH-1 : 0] s_axi_intr_awaddr,
		input wire [2 : 0] s_axi_intr_awprot,
		input wire  s_axi_intr_awvalid,
		output wire  s_axi_intr_awready,
		input wire [C_S_AXI_INTR_DATA_WIDTH-1 : 0] s_axi_intr_wdata,
		input wire [(C_S_AXI_INTR_DATA_WIDTH/8)-1 : 0] s_axi_intr_wstrb,
		input wire  s_axi_intr_wvalid,
		output wire  s_axi_intr_wready,
		output wire [1 : 0] s_axi_intr_bresp,
		output wire  s_axi_intr_bvalid,
		input wire  s_axi_intr_bready,
		input wire [C_S_AXI_INTR_ADDR_WIDTH-1 : 0] s_axi_intr_araddr,
		input wire [2 : 0] s_axi_intr_arprot,
		input wire  s_axi_intr_arvalid,
		output wire  s_axi_intr_arready,
		output wire [C_S_AXI_INTR_DATA_WIDTH-1 : 0] s_axi_intr_rdata,
		output wire [1 : 0] s_axi_intr_rresp,
		output wire  s_axi_intr_rvalid,
		input wire  s_axi_intr_rready,
		output wire  irq
	);
// Instantiation of Axi Bus Interface M00_AXI
	OFDM_Controller_v0_1_M00_AXI # ( 
		.C_M_START_DATA_VALUE(C_M00_AXI_START_DATA_VALUE),
		.C_M_TARGET_SLAVE_BASE_ADDR(C_M00_AXI_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_ADDR_WIDTH(C_M00_AXI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M00_AXI_DATA_WIDTH),
		.C_M_TRANSACTIONS_NUM(C_M00_AXI_TRANSACTIONS_NUM)
	) QAM (
		.INIT_AXI_TXN(m00_axi_init_axi_txn),
		.ERROR(m00_axi_error),
		.TXN_DONE(m00_axi_txn_done),
		.M_AXI_ACLK(m00_axi_aclk),
		.M_AXI_ARESETN(m00_axi_aresetn),
		.M_AXI_AWADDR(m00_axi_awaddr),
		.M_AXI_AWPROT(m00_axi_awprot),
		.M_AXI_AWVALID(m00_axi_awvalid),
		.M_AXI_AWREADY(m00_axi_awready),
		.M_AXI_WDATA(m00_axi_wdata),
		.M_AXI_WSTRB(m00_axi_wstrb),
		.M_AXI_WVALID(m00_axi_wvalid),
		.M_AXI_WREADY(m00_axi_wready),
		.M_AXI_BRESP(m00_axi_bresp),
		.M_AXI_BVALID(m00_axi_bvalid),
		.M_AXI_BREADY(m00_axi_bready),
		.M_AXI_ARADDR(m00_axi_araddr),
		.M_AXI_ARPROT(m00_axi_arprot),
		.M_AXI_ARVALID(m00_axi_arvalid),
		.M_AXI_ARREADY(m00_axi_arready),
		.M_AXI_RDATA(m00_axi_rdata),
		.M_AXI_RRESP(m00_axi_rresp),
		.M_AXI_RVALID(m00_axi_rvalid),
		.M_AXI_RREADY(m00_axi_rready)
	);

// Instantiation of Axi Bus Interface M01_AXI
	OFDM_Controller_v0_1_M01_AXI # ( 
		.C_M_START_DATA_VALUE(C_M01_AXI_START_DATA_VALUE),
		.C_M_TARGET_SLAVE_BASE_ADDR(C_M01_AXI_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_ADDR_WIDTH(C_M01_AXI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M01_AXI_DATA_WIDTH),
		.C_M_TRANSACTIONS_NUM(C_M01_AXI_TRANSACTIONS_NUM)
	) Preamble (
		.INIT_AXI_TXN(m01_axi_init_axi_txn),
		.ERROR(m01_axi_error),
		.TXN_DONE(m01_axi_txn_done),
		.M_AXI_ACLK(m01_axi_aclk),
		.M_AXI_ARESETN(m01_axi_aresetn),
		.M_AXI_AWADDR(m01_axi_awaddr),
		.M_AXI_AWPROT(m01_axi_awprot),
		.M_AXI_AWVALID(m01_axi_awvalid),
		.M_AXI_AWREADY(m01_axi_awready),
		.M_AXI_WDATA(m01_axi_wdata),
		.M_AXI_WSTRB(m01_axi_wstrb),
		.M_AXI_WVALID(m01_axi_wvalid),
		.M_AXI_WREADY(m01_axi_wready),
		.M_AXI_BRESP(m01_axi_bresp),
		.M_AXI_BVALID(m01_axi_bvalid),
		.M_AXI_BREADY(m01_axi_bready),
		.M_AXI_ARADDR(m01_axi_araddr),
		.M_AXI_ARPROT(m01_axi_arprot),
		.M_AXI_ARVALID(m01_axi_arvalid),
		.M_AXI_ARREADY(m01_axi_arready),
		.M_AXI_RDATA(m01_axi_rdata),
		.M_AXI_RRESP(m01_axi_rresp),
		.M_AXI_RVALID(m01_axi_rvalid),
		.M_AXI_RREADY(m01_axi_rready)
	);

// Instantiation of Axi Bus Interface M02_AXI
	OFDM_Controller_v0_1_M02_AXI # ( 
		.C_M_START_DATA_VALUE(C_M02_AXI_START_DATA_VALUE),
		.C_M_TARGET_SLAVE_BASE_ADDR(C_M02_AXI_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_ADDR_WIDTH(C_M02_AXI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M02_AXI_DATA_WIDTH),
		.C_M_TRANSACTIONS_NUM(C_M02_AXI_TRANSACTIONS_NUM)
	) Pilot (
		.INIT_AXI_TXN(m02_axi_init_axi_txn),
		.ERROR(m02_axi_error),
		.TXN_DONE(m02_axi_txn_done),
		.M_AXI_ACLK(m02_axi_aclk),
		.M_AXI_ARESETN(m02_axi_aresetn),
		.M_AXI_AWADDR(m02_axi_awaddr),
		.M_AXI_AWPROT(m02_axi_awprot),
		.M_AXI_AWVALID(m02_axi_awvalid),
		.M_AXI_AWREADY(m02_axi_awready),
		.M_AXI_WDATA(m02_axi_wdata),
		.M_AXI_WSTRB(m02_axi_wstrb),
		.M_AXI_WVALID(m02_axi_wvalid),
		.M_AXI_WREADY(m02_axi_wready),
		.M_AXI_BRESP(m02_axi_bresp),
		.M_AXI_BVALID(m02_axi_bvalid),
		.M_AXI_BREADY(m02_axi_bready),
		.M_AXI_ARADDR(m02_axi_araddr),
		.M_AXI_ARPROT(m02_axi_arprot),
		.M_AXI_ARVALID(m02_axi_arvalid),
		.M_AXI_ARREADY(m02_axi_arready),
		.M_AXI_RDATA(m02_axi_rdata),
		.M_AXI_RRESP(m02_axi_rresp),
		.M_AXI_RVALID(m02_axi_rvalid),
		.M_AXI_RREADY(m02_axi_rready)
	);

// Instantiation of Axi Bus Interface M03_AXI
	OFDM_Controller_v0_1_M03_AXI # ( 
		.C_M_START_DATA_VALUE(C_M03_AXI_START_DATA_VALUE),
		.C_M_TARGET_SLAVE_BASE_ADDR(C_M03_AXI_TARGET_SLAVE_BASE_ADDR),
		.C_M_AXI_ADDR_WIDTH(C_M03_AXI_ADDR_WIDTH),
		.C_M_AXI_DATA_WIDTH(C_M03_AXI_DATA_WIDTH),
		.C_M_TRANSACTIONS_NUM(C_M03_AXI_TRANSACTIONS_NUM)
	) Cyclic (
		.INIT_AXI_TXN(m03_axi_init_axi_txn),
		.ERROR(m03_axi_error),
		.TXN_DONE(m03_axi_txn_done),
		.M_AXI_ACLK(m03_axi_aclk),
		.M_AXI_ARESETN(m03_axi_aresetn),
		.M_AXI_AWADDR(m03_axi_awaddr),
		.M_AXI_AWPROT(m03_axi_awprot),
		.M_AXI_AWVALID(m03_axi_awvalid),
		.M_AXI_AWREADY(m03_axi_awready),
		.M_AXI_WDATA(m03_axi_wdata),
		.M_AXI_WSTRB(m03_axi_wstrb),
		.M_AXI_WVALID(m03_axi_wvalid),
		.M_AXI_WREADY(m03_axi_wready),
		.M_AXI_BRESP(m03_axi_bresp),
		.M_AXI_BVALID(m03_axi_bvalid),
		.M_AXI_BREADY(m03_axi_bready),
		.M_AXI_ARADDR(m03_axi_araddr),
		.M_AXI_ARPROT(m03_axi_arprot),
		.M_AXI_ARVALID(m03_axi_arvalid),
		.M_AXI_ARREADY(m03_axi_arready),
		.M_AXI_RDATA(m03_axi_rdata),
		.M_AXI_RRESP(m03_axi_rresp),
		.M_AXI_RVALID(m03_axi_rvalid),
		.M_AXI_RREADY(m03_axi_rready)
	);

// Instantiation of Axi Bus Interface M00_AXIS
	OFDM_Controller_v0_1_M00_AXIS # ( 
		.C_M_AXIS_TDATA_WIDTH(C_M00_AXIS_TDATA_WIDTH),
		.C_M_START_COUNT(C_M00_AXIS_START_COUNT)
	) IFFT (
		.M_AXIS_ACLK(m00_axis_aclk),
		.M_AXIS_ARESETN(m00_axis_aresetn),
		.M_AXIS_TVALID(m00_axis_tvalid),
		.M_AXIS_TDATA(m00_axis_tdata),
		.M_AXIS_TSTRB(m00_axis_tstrb),
		.M_AXIS_TLAST(m00_axis_tlast),
		.M_AXIS_TREADY(m00_axis_tready)
	);

// Instantiation of Axi Bus Interface S00_AXI
	OFDM_Controller_v0_1_S00_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S00_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S00_AXI_ADDR_WIDTH)
	) PS (
		.S_AXI_ACLK(s00_axi_aclk),
		.S_AXI_ARESETN(s00_axi_aresetn),
		.S_AXI_AWADDR(s00_axi_awaddr),
		.S_AXI_AWPROT(s00_axi_awprot),
		.S_AXI_AWVALID(s00_axi_awvalid),
		.S_AXI_AWREADY(s00_axi_awready),
		.S_AXI_WDATA(s00_axi_wdata),
		.S_AXI_WSTRB(s00_axi_wstrb),
		.S_AXI_WVALID(s00_axi_wvalid),
		.S_AXI_WREADY(s00_axi_wready),
		.S_AXI_BRESP(s00_axi_bresp),
		.S_AXI_BVALID(s00_axi_bvalid),
		.S_AXI_BREADY(s00_axi_bready),
		.S_AXI_ARADDR(s00_axi_araddr),
		.S_AXI_ARPROT(s00_axi_arprot),
		.S_AXI_ARVALID(s00_axi_arvalid),
		.S_AXI_ARREADY(s00_axi_arready),
		.S_AXI_RDATA(s00_axi_rdata),
		.S_AXI_RRESP(s00_axi_rresp),
		.S_AXI_RVALID(s00_axi_rvalid),
		.S_AXI_RREADY(s00_axi_rready)
	);

// Instantiation of Axi Bus Interface S_AXI_INTR
	OFDM_Controller_v0_1_S_AXI_INTR # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_INTR_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_INTR_ADDR_WIDTH),
		.C_NUM_OF_INTR(C_NUM_OF_INTR),
		.C_INTR_SENSITIVITY(C_INTR_SENSITIVITY),
		.C_INTR_ACTIVE_STATE(C_INTR_ACTIVE_STATE),
		.C_IRQ_SENSITIVITY(C_IRQ_SENSITIVITY),
		.C_IRQ_ACTIVE_STATE(C_IRQ_ACTIVE_STATE)
	) Interrupt (
		.S_AXI_ACLK(s_axi_intr_aclk),
		.S_AXI_ARESETN(s_axi_intr_aresetn),
		.S_AXI_AWADDR(s_axi_intr_awaddr),
		.S_AXI_AWPROT(s_axi_intr_awprot),
		.S_AXI_AWVALID(s_axi_intr_awvalid),
		.S_AXI_AWREADY(s_axi_intr_awready),
		.S_AXI_WDATA(s_axi_intr_wdata),
		.S_AXI_WSTRB(s_axi_intr_wstrb),
		.S_AXI_WVALID(s_axi_intr_wvalid),
		.S_AXI_WREADY(s_axi_intr_wready),
		.S_AXI_BRESP(s_axi_intr_bresp),
		.S_AXI_BVALID(s_axi_intr_bvalid),
		.S_AXI_BREADY(s_axi_intr_bready),
		.S_AXI_ARADDR(s_axi_intr_araddr),
		.S_AXI_ARPROT(s_axi_intr_arprot),
		.S_AXI_ARVALID(s_axi_intr_arvalid),
		.S_AXI_ARREADY(s_axi_intr_arready),
		.S_AXI_RDATA(s_axi_intr_rdata),
		.S_AXI_RRESP(s_axi_intr_rresp),
		.S_AXI_RVALID(s_axi_intr_rvalid),
		.S_AXI_RREADY(s_axi_intr_rready),
		.irq(irq)
	);

	// Add user logic here

	// User logic ends

	endmodule
