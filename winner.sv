module winner (out0, out1, out2, out3, out4, out5, out6, out7, out8, leds);
	input logic [1:0]  out0, out1, out2, out3, out4, out5, out6, out7, out8;
	output logic [6:0] leds;

	always_comb begin
	if (out0 != 0 && out1 !=0 && out2 != 0) //top row
		begin
		 if (out0 == out1 && out1 == out2 && out0 == out2)
			if (out1 == 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
		end
	else if (out3 != 0 && out4 !=0 && out5 != 0)
		begin
		if (out3 == out4 && out4 == out5 && out3 == out5) //middle row
			if (out4 == 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
		end
	else if (out6 != 0 && out7 !=0 && out8 != 0)	//bottom row
		begin
		if (out6 == out7 && out7 == out8 && out6 == out8)
			if (out7 == 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
	end
	else if (out0 != 0 && out3 !=0 && out6 != 0) //left column
		begin
		if (out0 == out3 && out3 == out6 && out0 == out6)
			if (out3 == 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
		end
	else if (out1 != 0 && out4 !=0 && out7 != 0)	//middle column
		begin
		if (out1 == out4 && out4 == out7 && out1 == out7)
			if (out4 == 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
	end
	else if (out2 != 0 && out5 !=0 && out8 != 0) //right column
		begin
		if (out2 == out5 && out5 == out8 && out2 == out5)
			if (out5 == 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
		end
	else if (out0 != 0 && out4 !=0 && out8 != 0) //left to right diagonal
		begin
		if (out0 == out4 && out4 == out8 && out0 == out8)
			if (out4== 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
		end
	else if (out2 != 0 && out4 !=0 && out6 != 0) //right to left diagonal
		begin
		if (out2== out4 && out4 == out6 && out2 == out6)
			if (out4 == 1)
				leds = 7'b1000000; //player 0
			else 
				leds = 7'b1111001; //player 1
		else
			leds = '1;
		end
	else if (out0 != 0 && out1 !=0 && out2 != 0 && out3 != 0 && out4 !=0 && out5 != 0 && out6 != 0 && out7 !=0 && out8 != 0)
			leds = 7'b0111111;
	else
		leds = '1;
	end

endmodule
