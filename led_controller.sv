module led_controller(number,player,select, RedPixels, reset);
	input player, select, reset; //player 0 = x; player 1 = O;
	input logic [3:0] number;
	output logic [15:0] [15:0] RedPixels;
	
	always_comb
		if (reset)
		begin
			RedPixels = '0;
		end
		else begin
			if (!player & select) begin
				RedPixels[1+(number/3*5)] |= (16'b0100100000000000)>>(number%3*5);
				RedPixels[2+(number/3*5)] |= (16'b0011000000000000)>>(number%3*5);
				RedPixels[3+(number/3*5)] |= (16'b0011000000000000)>>(number%3*5);
				RedPixels[4+(number/3*5)] |= (16'b0100100000000000)>>(number%3*5);
				end
			else begin
				RedPixels[1+(number/3*5)] &= (16'b1000011111111111)>>(number%3*5);
				RedPixels[2+(number/3*5)] &= (16'b1000011111111111)>>(number%3*5);
				RedPixels[3+(number/3*5)] &= (16'b1000011111111111)>>(number%3*5);
				RedPixels[4+(number/3*5)] &= (16'b1000011111111111)>>(number%3*5);
				end
		end
	
endmodule
