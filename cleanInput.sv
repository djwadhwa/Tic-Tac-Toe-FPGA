module cleanInput (Clock, Reset, in, out);
	input logic Clock, Reset, in;
	output logic out;
	
	enum {up, down, hold} ps, ns;
	
	always_comb 
		case (ps)
			up: begin
				if (in) ns = down;
				else ns = up;
				end
			down: begin
					if (in) ns = hold;
					else ns = up;
					end
			hold: begin 
					if (in) ns = hold;
					else ns = up;
					end
			default: ns = up;
		endcase
		
	assign out = (ns == down);
		
	always_ff @(posedge Clock)
		if (Reset)
			ps <= down; 
		else
			ps <= ns;
endmodule

module cleanInput_testbench();
	logic Clock, Reset, in, out;
	
	cleanInput dut (Clock, Reset, in, out);
	
	// Set up the clock
	parameter CLOCK_PERIOD=100;
	initial begin
    	Clock <= 0;
		forever #(CLOCK_PERIOD/2) Clock <= ~Clock;
	end

	// Set up the inputs to the design. Each line is a clock cycle.
	initial begin
		@(posedge Clock); Reset <= 1;
		@(posedge Clock);
		@(posedge Clock); Reset <= 0;
		@(posedge Clock);
		@(posedge Clock); in <= 0;
		@(posedge Clock);
		@(posedge Clock);
		@(posedge Clock);
		@(posedge Clock); in <= 1;
		@(posedge Clock);
		@(posedge Clock);
		@(posedge Clock);
		@(posedge Clock); in <= 0;
		@(posedge Clock);
		@(posedge Clock); in <= 1;
		@(posedge Clock);
		@(posedge Clock); in <= 0;
		@(posedge Clock); in <= 1;
		@(posedge Clock); in <= 0;
		@(posedge Clock);
		$stop;
	end
endmodule
 