`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/10 16:53:24
// Design Name: 
// Module Name: test_computation_core
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


module test_computation_core;
parameter bitwidth = 17;

reg clk, reset;
reg signed [bitwidth-1:0] data;
reg signed [bitwidth-1:0] weight;
wire signed [bitwidth*2-1:0] max_number;
wire flag_store;

wire [bitwidth*2-1:0] c;
assign c = computation_core_test.UUT1.c;

wire flag_over;
assign flag_over = computation_core_test.UUT1.flag_over;

wire flag_start;
assign flag_start = computation_core_test.UUT2.flag_start;

wire [bitwidth*2-1:0] data_in;
assign data_in = computation_core_test.UUT2.data_in;

wire [bitwidth*2-1:0] a, b, c_2, d;
assign a = computation_core_test.UUT2.a;
assign b = computation_core_test.UUT2.b;
assign c_2 = computation_core_test.UUT2.c;
assign d = computation_core_test.UUT2.d;

computation_core computation_core_test(
						.clk(clk),
						.reset(reset),
						.data(data),
						.weight(weight),
						.max_number(max_number),
						.flag_store(flag_store)
);

initial
	begin
		clk = 0;
		reset = 0;
		data = 0;
		weight = 0;
	end
	
always #5 clk = ~clk;

initial
	begin
		#15 reset = 1;
		data = 1;
		weight = 2;
		
		#750 data = 2;
		weight = 3;
		
		#750 data = 4;
		weight = 1;
		
		#750 data = 1;
		weight = 5;
		
		#750 data = 6;
		weight = 1;
		
		#750 data = 1;
		weight = 5;
		
		#750 data = 5;
		weight = 2;
		
		#750 data = 1;
		weight = 5;
		
		#750 data = 5;
		weight = 1;
		
		#750 data = 3;
		weight = 5;
		
		#750 data = 4;
		weight = 3;
		
		#750 data = 5;
		weight = 2;
		
		#750 data = 6;
		weight = 1;
		
		#1000 $stop;
	end


endmodule
