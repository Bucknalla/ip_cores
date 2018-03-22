`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.03.2018 11:23:15
// Design Name: 
// Module Name: CP_TB
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


module CP_TB();

reg clk;
reg [15:0] counter;
reg rst; 
reg [31:0] signal_in; 
reg [31:0] cp_length;
reg [5:0] frame_length;
wire [31:0] signal_out;
wire ready;
wire valid;
wire error;
wire cp_flag;
    
CP_Top CP_DUT(
    .clk (clk),
    .rst (rst),
    .signal_in (signal_in), 
    .cp_length (cp_length),
    .frame_length (frame_length),
    .signal_out (signal_out),
    .ready (ready),
    .valid (valid),
    .error (error),
    .cp_flag (cp_flag)
);
    



    
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
    cp_length = 5;
    frame_length = 16;
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
