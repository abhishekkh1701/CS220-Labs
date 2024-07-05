`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:12:41 01/31/2024
// Design Name:   five_adder
// Module Name:   /users/btech/poojalk22/Desktop/cs220/lab3_3/five_num_add/five_adder_top.v
// Project Name:  five_num_add
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: five_adder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module five_adder_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg PB5;
	reg [3:0] Y;

	// Outputs
	wire [6:0] led;
	// Instantiate the Unit Under Test (UUT)
	five_adder uut (
		.PB1(PB1), 
		.PB2(PB2), 
		.PB3(PB3), 
		.PB4(PB4), 
		.PB5(PB5), 
		.Y(Y), 
		.led(led)
	);

always@(led) begin
$display("<%d>: led is %b%b%b%b%b%b%b ",$time,led[6],led[5],led[4],led[3],led[2],led[1],led[0]);
end
initial begin
		#30
		$finish;
	end
    initial begin
    // Initialize Inputs
    PB1 = 0;
    PB2 = 0;
    PB3 = 0;
    PB4 = 0;
    PB5 = 0;
    Y = 0;

    #2
    Y = 4'b1111;
    #2
    PB1 = 1;
    #2
    Y = 4'b1111;
    #2
    PB2 = 1;
    #2
    Y = 4'b1110;
    #2
    PB3 = 1;
    #2
    Y = 4'b1100;
    #2
    PB4 = 1;
    #2
    Y = 4'b1110;
    #2
    PB5 = 1;
	 #2
	 PB1=0;
	 
  end

      
endmodule

