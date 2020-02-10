`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/10 16:39:41
// Design Name: 
// Module Name: computation_core
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


module computation_core#(
parameter kernal_width = 5,
parameter kernal_height = 5,
parameter kernal_channel = 3,
parameter bitwidth = 17)
(
input clk, reset,
input wire signed [bitwidth-1:0] data,
input wire signed [bitwidth-1:0] weight,
output signed [bitwidth*2-1:0] max_number,
output flag_store
    );

wire signed [bitwidth*2-1:0] c2data_in, out_number_1, out_number_2, out_number_3, out_number_4;
wire flag_1, flag_3;

mult_add UUT1(
			.clk(clk),
			.reset(reset),
			.a(data),
			.b(weight),
			.c(c2data_in),
			.flag_over(flag_1)
);

pool_buffer UUT2(
			.clk(clk),
			.reset(reset),
			.flag_start(flag_1),
			.data_in(c2data_in),
			.a(out_number_1),
			.b(out_number_2),
			.c(out_number_3),
			.d(out_number_4),
			.flag_trans(flag_2)
			
);

max_pool UUT3(
			.clk(clk),
			.reset(reset),
			.a(out_number_1),
			.b(out_number_2),
			.c(out_number_3),
			.d(out_number_4),
			.flag_receive(flag_2),
			.max_number(max_number),
			.flag_store(flag_store)
);
endmodule
