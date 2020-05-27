module selector (clock, reset, next, GrnPixels);
	input logic next, clock, reset;
	output logic [15:0] [15:0] GrnPixels;
	enum{zero, one, two, three, four, five, six, seven, eight} ns, ps;
	
	always_comb 
		case (ps)
			zero: if (next) ns = one;else ns = zero;
			one: if (next) ns = two; else ns = one;
			two: if (next)ns = three; else ns = two;
			three: if (next)ns = four; else ns = three;
			four: if (next)ns = five; else ns = four;
			five: if (next)ns = six; else ns = five;
			six: if (next)ns = seven; else ns = six;
			seven: if (next)ns = eight; else ns = seven;
			eight: if (next)ns = zero; else ns = eight;
			default: ns = zero;
		endcase
		
	always_comb 
		case (ps)
			zero: begin
				GrnPixels[00] = 16'b0000000000000000;
				GrnPixels[01] = 16'b0000010000100000;
				GrnPixels[02] = 16'b0011010000100000;
				GrnPixels[03] = 16'b0011010000100000;
				GrnPixels[04] = 16'b0000010000100000;
				GrnPixels[05] = 16'b0111111111111110;
				GrnPixels[06] = 16'b0000010000100000;
				GrnPixels[07] = 16'b0000010000100000;
				GrnPixels[08] = 16'b0000010000100000;
				GrnPixels[09] = 16'b0000010000100000;
				GrnPixels[10] = 16'b0111111111111110;
				GrnPixels[11] = 16'b0000010000100000;
				GrnPixels[12] = 16'b0000010000100000;
				GrnPixels[13] = 16'b0000010000100000;
				GrnPixels[14] = 16'b0000010000100000;
				GrnPixels[15] = 16'b0000000000000000;					
				end
			one: begin
				GrnPixels[02] = 16'b0000010110100000;
				GrnPixels[03] = 16'b0000010110100000;
				end
			two: begin
				GrnPixels[02] = 16'b0000010000101100;
				GrnPixels[03] = 16'b0000010000101100;
				end
			three: begin
				GrnPixels[02] = 16'b0000010000100000;
				GrnPixels[03] = 16'b0000010000100000;
				GrnPixels[07] = 16'b0011010000100000;
				GrnPixels[08] = 16'b0011010000100000;
				end
			four: begin
				GrnPixels[07] = 16'b0000010110100000;
				GrnPixels[08] = 16'b0000010110100000;
				end
			five: begin
				GrnPixels[07] = 16'b0000010000101100;
				GrnPixels[08] = 16'b0000010000101100;
				end
			six: begin
				GrnPixels[07] = 16'b0000010000100000;
				GrnPixels[08] = 16'b0000010000100000;
				GrnPixels[12] = 16'b0011010000100000;
				GrnPixels[13] = 16'b0011010000100000;
				end
			seven: begin
				GrnPixels[12] = 16'b0000010110100000;
				GrnPixels[13] = 16'b0000010110100000;
				end
			eight: begin
				GrnPixels[12] = 16'b0000010000101100;
				GrnPixels[13] = 16'b0000010000101100;
				end
			default: begin
						GrnPixels = '0;
						end
		endcase
	
//	assign number = ps;
	
	always_ff @(posedge clock)
		if (reset) begin
			ps <= zero;		
			end
		else
			ps <=ns;
endmodule

module selector_testbench();
	logic clock, reset, next;
	logic [15:0][15:0] GrnPixels;
	selector dut(clock, reset, next, GrnPixels);
	
// Set up the clock
	parameter CLOCK_PERIOD=100;
	initial begin
    	clock <= 0;
		forever #(CLOCK_PERIOD/2) clock <= ~clock;
	end
	
	integer p;
	initial begin
		@(posedge clock); reset <= 1;
		@(posedge clock); reset <= 0;
		for (p = 0; p <9; p++) begin
			@(posedge clock); next <=1;
			@(posedge clock); next <=0;
		end
		$stop;
	end
endmodule