`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/07 12:31:17
// Design Name: 
// Module Name: max_pool
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


module max_pool#(
parameter BITWIDTH = 8)
(
input wire signed [BITWIDTH-1:0] a, b, c, d,
output wire signed [BITWIDTH-1:0] max_number);

wire signed [BITWIDTH-1:0] temp1, temp2;

assign max_number = (a > b ? a : b) > (c > d ? c : d) ? (a > b ? a : b) : (c > d ? c : d);

endmodule
