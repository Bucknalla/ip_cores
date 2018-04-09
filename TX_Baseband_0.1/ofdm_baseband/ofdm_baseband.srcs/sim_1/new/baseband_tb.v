`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.04.2018 10:20:31
// Design Name: 
// Module Name: baseband_tb
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


module baseband_tb #(parameter CLK_PERIOD = 5) ();

reg clk;
reg [15:0] counter;
reg rst; 
reg [31:0] signal_in; 
wire [31:0] signal_out;
wire ready;
wire valid;
wire error;
wire status;
    

design_1 design_1_i
    (.CLK(clk),

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

    .DATA_IN_AXIS_tdata(signal_in),
    .DATA_IN_AXIS_tlast(DATA_IN_AXIS_tlast),
    .DATA_IN_AXIS_tready(ready),
    .DATA_IN_AXIS_tstrb(DATA_IN_AXIS_tstrb),
    .DATA_IN_AXIS_tvalid(DATA_IN_AXIS_tvalid),

    .DATA_OUT_AXIS_tdata(signal_out),
    .DATA_OUT_AXIS_tlast(DATA_OUT_AXIS_tlast),
    .DATA_OUT_AXIS_tready(DATA_OUT_AXIS_tready),
    .DATA_OUT_AXIS_tstrb(DATA_OUT_AXIS_tstrb),
    .DATA_OUT_AXIS_tvalid(valid),

    .ERROR(error),
    .RST(rst),
    .STATUS(status));


    
// CLK GENERATION
always
begin
    clk = 1'b1;
    #(CLK_PERIOD/2) clk = 1'b0;
    #(CLK_PERIOD/2);
end


// SIGNAL_IN INCREMENTER
always
begin
    if(counter == 1024)
    begin
        signal_in = 0;
    end
    #1;
end

// S_AXIS_DATA (INPUT)
initial
begin
    rst = 1;
    counter = 0;
    signal_in = 0;
    #100;  
    rst = 0;
    repeat(1000)
    begin
        #20 signal_in = signal_in + 1;
        counter = counter + 1'b1;
    end      
    #200000 $finish;
end
        

endmodule
