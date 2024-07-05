`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:35:25 01/24/2024
// Design Name:   eight_bit
// Module Name:   /users/btech/pallavg22/Desktop/cs220/lab2_3/eight_bit_comparator/eight_top.v
// Project Name:  eight_bit_comparator
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: eight_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module eight_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;

	// Outputs
	wire [7:0] l;
	wire [7:0] g;
	wire [7:0] e;

	// Instantiate the Unit Under Test (UUT)
	eight_bit uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.Y(Y), 
		.l(l), 
		.g(g), 
		.e(e)
	);

always @(l or g or e) begin
	$display("time = %d: l=%b, e=%b, g=%b", $time, l,e,g);
end

initial begin
	PB1 = 1; Y = 4'b0110;
	#2
	PB2 = 1; Y = 4'b0110;
	#2
	PB3 = 1; Y = 4'b0110;
	#2
	PB4 = 1; Y = 4'b1110;
	#10
	$finish;
end 
      
endmodule

