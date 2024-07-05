`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:06:31 01/24/2024
// Design Name:   seven_bit_adder
// Module Name:   /users/btech/poojalk22/Desktop/cs220/lab2_2/seven_bit_adder/seven_bit_adder_top.v
// Project Name:  seven_bit_adder
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;

	// Outputs
	wire [6:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.Y(Y), 
		.sum(sum), 
		.cout(cout)
	);

	always @(sum or cout) begin
		$display("time=%d: sum=%b; carry=%b\n", $time, sum, cout);
	end
	initial begin
		#30
		$finish;
	end
 
initial begin 
	PB1=1'b1;Y[3:0]=4'b1111;
	#2
	PB2=1'b1;Y[2:0]=3'b111;
	#2
	PB3=1'b1;Y[3:0]=4'b1111;
	#2
	PB4=1'b1;Y[2:0]=3'b111;
end
endmodule

