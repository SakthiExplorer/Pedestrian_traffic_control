module traffic_light_control_tb;

	// Inputs
	reg x;
	reg clk;
	reg reset;

	// Outputs
	wire walk;
	wire halt;
	wire red;
	wire yellow;
	wire green;

	// Instantiate the Unit Under Test (UUT)
	traffic_light_control uut (
		.x(x), 
		.clk(clk), 
		.reset(reset), 
		.walk(walk), 
		.halt(halt), 
		.red(red), 
		.yellow(yellow), 
		.green(green)
	);

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 1;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100
		reset = 0;
		x=0;
		#100
		x=0;
		#100
		x=1;
		#200
		x=0;
		

	end
	always
	begin
	#50 clk=~clk;
   end
endmodule
