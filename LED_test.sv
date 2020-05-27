module LED_test(RST, RedPixels, GrnPixels);
    input logic               RST;
    output logic [15:0][15:0] RedPixels; // 16x16 array of red LEDs
    output logic [15:0][15:0] GrnPixels; // 16x16 array of green LEDs
	 
	 always_comb 
	 begin
		
		// Reset - Turn off all LEDs
		if (RST)
		begin
			RedPixels = '0;
			GrnPixels = '0;
		end
		
	  // Display a pattern
		else
		begin
		  //                  FEDCBA9876543210
		  GrnPixels[00] = 16'b0000000000000000;
		  GrnPixels[01] = 16'b0000010000100000;
		  GrnPixels[02] = 16'b0000010000100000;
		  GrnPixels[03] = 16'b0000010000100000;
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
		  
		  //                  FEDCBA9876543210
		  RedPixels[00] = 16'b0000000000000000;
		  RedPixels[01] = 16'b0100101111010010;
		  RedPixels[02] = 16'b0011001001001100;
		  RedPixels[03] = 16'b0011001001001100;
		  RedPixels[04] = 16'b0100101111010010;
		  RedPixels[05] = 16'b0000000000000000;
		  RedPixels[06] = 16'b0111101001011110;
		  RedPixels[07] = 16'b0100100110010010;
		  RedPixels[08] = 16'b0100100110010010;
		  RedPixels[09] = 16'b0111101001011110;
		  RedPixels[10] = 16'b0000000000000000;
		  RedPixels[11] = 16'b0100101111010010;
		  RedPixels[12] = 16'b0011001001001100;
		  RedPixels[13] = 16'b0011001001001100;
		  RedPixels[14] = 16'b0100101111010010;
		  RedPixels[15] = 16'b0000000000000000;
		end
	end

endmodule


module LED_test_testbench();

	logic RST;
	logic [15:0][15:0] RedPixels, GrnPixels;
	
	LED_test dut (.RST, .RedPixels, .GrnPixels);
	
	initial begin
	RST = 1'b1; #10;
	RST = 1'b0; #10;
	end
	
endmodule