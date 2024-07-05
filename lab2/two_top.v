`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:58:11 01/24/2024
// Design Name:   two_bit_add
// Module Name:   /users/btech/poojalk22/Desktop/cs220/lab2_1.1/two_bit_add/two_top.v
// Project Name:  two_bit_add
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: two_bit_add
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module two_top;

	// Inputs
	reg [1:0] x;
	reg [1:0] y;

	// Outputs
	wire [1:0] z;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	two_bit_add uut (
		.x(x), 
		.y(y), 
		.z(z), 
		.carry(carry)
	);
	always @(z[1] or z[0] or carry) begin
$display("time=%d: %b%b + %b%b = %b%b%b \n", $time, x[1], x[0], y[1], y[0], carry, z[1],z[0]);
end

	initial begin
		// Initialize Inputs
 x[1]=0;x[0]=0;y[1]=0;y[0]=0;
 #5
 x[1]=0;x[0]=0;y[1]=0;y[0]=1;
 #5
 x[1]=0;x[0]=0;y[1]=1;y[0]=0;
 #5
 x[1]=0;x[0]=0;y[1]=1;y[0]=1;
 #5
 x[1]=0;x[0]=1;y[1]=0;y[0]=0;
 #5
 x[1]=0;x[0]=1;y[1]=0;y[0]=1;
 #5
 x[1]=0;x[0]=1;y[1]=1;y[0]=0;
 #5
 x[1]=0;x[0]=1;y[1]=1;y[0]=1;
 #5
 x[1]=1;x[0]=0;y[1]=0;y[0]=0;
 #5
 x[1]=1;x[0]=0;y[1]=0;y[0]=1;
 #5
 x[1]=1;x[0]=0;y[1]=1;y[0]=0;
 #5
 x[1]=1;x[0]=0;y[1]=1;y[0]=1;
 #5
 x[1]=1;x[0]=1;y[1]=0;y[0]=0;
 #5
 x[1]=1;x[0]=1;y[1]=0;y[0]=1;
 #5
 x[1]=1;x[0]=1;y[1]=1;y[0]=0;
 #5
 x[1]=1;x[0]=1;y[1]=1;y[0]=1;

 // Wait 100 ns for global reset to finish
 #5;
 $finish;

	end
      
endmodule

