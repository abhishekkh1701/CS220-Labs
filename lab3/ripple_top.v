`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:48:32 01/31/2024
// Design Name:   ripple_led
// Module Name:   /users/btech/poojalk22/Desktop/cs220/lab3_2/ripple_led/ripple_top.v
// Project Name:  ripple_led
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ripple_led
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ripple_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;
	wire led1;
	wire led2;
	wire led3;
	wire led4;
	wire led5;
	wire led6;
	wire led7;

	// Instantiate the Unit Under Test (UUT)
	ripple_led uut (
		.clk(clk), 
		.led0(led0), 
		.led1(led1), 
		.led2(led2), 
		.led3(led3), 
		.led4(led4), 
		.led5(led5), 
		.led6(led6), 
		.led7(led7)
	);

always@(led0 or led1 or led2 or led3 or led4 or led5 or led6 or led7) begin
    $display("<%d>: led=%b%b%b%b%b%b%b%b",$time,led0,led1,led2,led3,led4,led5,led6,led7);
    end
    initial begin
        // Initialize Inputs
        forever begin
        clk = 0;
        #2
        clk=1;
        #2
        clk=0;
        // Wait 100 ns for global reset to finish

        // Add stimulus here
       end
    end
      
endmodule

