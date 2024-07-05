`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:50 01/24/2024 
// Design Name: 
// Module Name:    eight_bit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////


module eight_bit(PB1, PB2, PB3, PB4, Y, l, g, e);
input PB1, PB2, PB3, PB4;
input [3:0]Y;
reg [7:0] A,B;
output [7:0] l,g,e;
wire [7:0] l,g,e;

always @(posedge PB1) begin
	A[3:0] <= Y[3:0];
end
always @(posedge PB2) begin
	A[7:4] <= Y[3:0];
end
always @(posedge PB3) begin
	B[3:0] <= Y[3:0];
end
always @(posedge PB4) begin
	B[7:4] <= Y[3:0];
end
one_bit_comparator c0(.a(A[7]), .b(B[7]), .li(1'b0), .ei(1'b1), .gi(1'b0), .lo(l[7]), .eo(e[7]), .go(g[7]));
one_bit_comparator c1(.a(A[6]), .b(B[6]), .li(l[7]), .ei(e[7]), .gi(g[7]), .lo(l[6]), .eo(e[6]), .go(g[6]));
one_bit_comparator c2(.a(A[5]), .b(B[5]), .li(l[6]), .ei(e[6]), .gi(g[6]), .lo(l[5]), .eo(e[5]), .go(g[5]));
one_bit_comparator c3(.a(A[4]), .b(B[4]), .li(l[5]), .ei(e[5]), .gi(g[5]), .lo(l[4]), .eo(e[4]), .go(g[4]));
one_bit_comparator c4(.a(A[3]), .b(B[3]), .li(l[4]), .ei(e[4]), .gi(g[4]), .lo(l[3]), .eo(e[3]), .go(g[3]));
one_bit_comparator c5(.a(A[2]), .b(B[2]), .li(l[3]), .ei(e[3]), .gi(g[3]), .lo(l[2]), .eo(e[2]), .go(g[2]));
one_bit_comparator c6(.a(A[1]), .b(B[1]), .li(l[2]), .ei(e[2]), .gi(g[2]), .lo(l[1]), .eo(e[1]), .go(g[1]));
one_bit_comparator c7(.a(A[0]), .b(B[0]), .li(l[1]), .ei(e[1]), .gi(g[1]), .lo(l[0]), .eo(e[0]), .go(g[0]));

endmodule
