`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2018 16:25:31
// Design Name: 
// Module Name: preamble_tb
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


module preamble_tb();

reg clk;
reg rst; 

reg [31:0] signal_in; 
reg [31:0] preamble_length;
reg [31:0] preamble_value;
reg [31:0] frame_length;

wire [31:0] signal_out;

reg valid_in;
wire ready_out;

wire valid_out;
reg ready_in;

wire error;
wire preamble_flag;

preamble dut (
    .clk (clk),
    .rst (rst), 
    .signal_in (signal_in), 
    .signal_out (signal_out),

    .preamble_value (preamble_value),
    .preamble_length (preamble_length),
    .frame_length (frame_length),

    .ready_in (ready_in),
    .valid_out (valid_out),    
    .ready_out (ready_out),
    .valid_in (valid_in),

    .preamble_flag(preamble_flag),
    .error (error)
);

reg [31:0] counter = 0;

    
// CLK GENERATION
always
begin
    clk = 1'b1;
    #10 clk = 1'b0;
    #10;
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

// SETUP PARAMS
initial 
begin
    preamble_length = 5;
    preamble_value = 32'd23;
    frame_length = 16;
end    

// S_AXIS_DATA (INPUT)
initial
begin
    rst = 1;
    counter = 0;
    signal_in = 0;
    ready_in = 1;
    valid_in = 1;
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
