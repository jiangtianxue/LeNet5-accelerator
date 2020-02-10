`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 14:03:40
// Design Name: 
// Module Name: mult_add
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: signed multiplication addition module, input data is 17bit, highest bit is   
//                signal, the integer is 12 bits and decimal is 4bits
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mult_add#(
parameter kernal_height = 5,
parameter kernal_width = 5,
parameter kernal_channel = 3,
parameter bitwidth = 17)
(
input clk, reset,
input wire signed [bitwidth-1:0] a, b,
output reg flag_over, 
output reg signed [bitwidth*2-1:0] c);

reg [20:0] counter;
always@(posedge clk or posedge reset)
	begin
		if (!reset)
			begin
				c <= 0;
				flag_over <= 0;
				counter <= 0;
			end
			
		else if(counter == kernal_channel * kernal_height * kernal_width - 1)
			begin
				c <= c + a * b;
				flag_over <= 1;
				counter <= counter + 1;
			end
			
		else if (counter == kernal_channel * kernal_height * kernal_width)
			begin
				c <= a * b;
				counter <= 1;
				flag_over <= 0;
			end
			
		else
			begin
				c <= c + a * b;
				counter <= counter + 1;
				flag_over <= 0;
			end
			
	end
endmodule
