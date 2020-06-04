module led_controller(clock, number,player,select, RedPixels, reset, leds);
	input logic player, clock, select, reset; //player 0 = x; player 1 = O;
	input logic [3:0] number;
	output logic [15:0] [15:0] RedPixels;
	output logic [6:0] leds;
	
	logic [1:0] out0, out1, out2, out3, out4, out5, out6, out7, out8;
	cell_module c0 (.clock, .reset, .player, .select(select & number == 0), .out(out0));
	cell_module c1 (.clock, .reset, .player, .select(select & number == 1), .out(out1));
	cell_module c2 (.clock, .reset, .player, .select(select & number == 2), .out(out2));
	
	cell_module c3 (.clock, .reset, .player, .select(select & number == 3), .out(out3));
	cell_module c4 (.clock, .reset, .player, .select(select & number == 4), .out(out4));
	cell_module c5 (.clock, .reset, .player, .select(select & number == 5), .out(out5));
	
	cell_module c6 (.clock, .reset, .player, .select(select & number == 6), .out(out6));
	cell_module c7 (.clock, .reset, .player, .select(select & number == 7), .out(out7));
	cell_module c8 (.clock, .reset, .player, .select(select & number == 8), .out(out8));
	
//	logic [3:0] top_row = ;
//	logic [3:0] middle_row = out3+out4+out5;
//	logic [3:0] bottom_row = out6+out7+out8;
//	logic [3:0] left_col = out0+out3+out6;
//	logic [3:0] middle_col = out1+out4+out7;
//	logic [3:0] right_col = out2+out5+out8;
//	logic [3:0] lr_diag = out0+out4+out8;
//	logic [3:0] rl_diag = out2+out4+out6;
	
	winner w ( out0, out1, out2, out3, out4, out5, out6, out7, out8, leds);
	
	always_comb
		if (reset)
			begin
				RedPixels = '0;
			end
		else begin
		case (number)
			0:begin
				if (out0 == 1) begin
					RedPixels[1] |= (16'b0100100000000000);
					RedPixels[2] |= (16'b0011000000000000);
					RedPixels[3] |= (16'b0011000000000000);
					RedPixels[4] |= (16'b0100100000000000);
					end
				else if (out0==2) begin
					RedPixels[1] |= (16'b0011000000000000);
					RedPixels[2] |= (16'b0100100000000000);
					RedPixels[3] |= (16'b0100100000000000);
					RedPixels[4] |= (16'b0011000000000000);
					end
				else begin
					RedPixels[1] &= (16'b1000011111111111);
					RedPixels[2] &= (16'b1000011111111111);
					RedPixels[3] &= (16'b1000011111111111);
					RedPixels[4] &= (16'b1000011111111111);
					end
				end
			1:begin
				
				if (out1 == 1) begin
					RedPixels[1] |= (16'b0000001001000000);
					RedPixels[2] |= (16'b0000000110000000);
					RedPixels[3] |= (16'b0000000110000000);
					RedPixels[4] |= (16'b0000001001000000);
					end
				else if (out1==2) begin
					RedPixels[1] |= (16'b0000000110000000);
					RedPixels[2] |= (16'b0000001001000000);
					RedPixels[3] |= (16'b0000001001000000);
					RedPixels[4] |= (16'b0000000110000000);
					end
				else begin
					RedPixels[1] &= (16'b1111110000111111);
					RedPixels[2] &= (16'b1111110000111111);
					RedPixels[3] &= (16'b1111110000111111);
					RedPixels[4] &= (16'b1111110000111111);
					end
				end
			2:begin
				if (out2==1) begin
					RedPixels[1] |= (16'b0000000000010010);
					RedPixels[2] |= (16'b0000000000001100);
					RedPixels[3] |= (16'b0000000000001100);
					RedPixels[4] |= (16'b0000000000010010);
					end
				else if (out2==2) begin
					RedPixels[1] |= (16'b0000000000001100);
					RedPixels[2] |= (16'b0000000000010010);
					RedPixels[3] |= (16'b0000000000010010);
					RedPixels[4] |= (16'b0000000000001100);
					end
				else begin
					RedPixels[1] &= (16'b1111111111100001);
					RedPixels[2] &= (16'b1111111111100001);
					RedPixels[3] &= (16'b1111111111100001);
					RedPixels[4] &= (16'b1111111111100001);
					end
				end
			3:begin
				if (out3==1) begin
					RedPixels[6] |= (16'b0100100000000000);
					RedPixels[7] |= (16'b0011000000000000);
					RedPixels[8] |= (16'b0011000000000000);
					RedPixels[9] |= (16'b0100100000000000);
					end
				else if (out3==2) begin
					RedPixels[6] |= (16'b0011000000000000);
					RedPixels[7] |= (16'b0100100000000000);
					RedPixels[8] |= (16'b0100100000000000);
					RedPixels[9] |= (16'b0011000000000000);
					end
				else begin
					RedPixels[6] &= (16'b1000011111111111);
					RedPixels[7] &= (16'b1000011111111111);
					RedPixels[8] &= (16'b1000011111111111);
					RedPixels[9] &= (16'b1000011111111111);
					end
				end
			4:begin
				if (out4==1) begin
					RedPixels[6] |= (16'b0000001001000000);
					RedPixels[7] |= (16'b0000000110000000);
					RedPixels[8] |= (16'b0000000110000000);
					RedPixels[9] |= (16'b0000001001000000);
					end
				else if (out4==2) begin
					RedPixels[6] |= (16'b0000000110000000);
					RedPixels[7] |= (16'b0000001001000000);
					RedPixels[8] |= (16'b0000001001000000);
					RedPixels[9] |= (16'b0000000110000000);
					end
				else begin
					RedPixels[6] &= (16'b1111110000111111);
					RedPixels[7] &= (16'b1111110000111111);
					RedPixels[8] &= (16'b1111110000111111);
					RedPixels[9] &= (16'b1111110000111111);
					end
				end
			5:begin
				if (out5==1) begin
					RedPixels[6] |= (16'b0000000000010010);
					RedPixels[7] |= (16'b0000000000001100);
					RedPixels[8] |= (16'b0000000000001100);
					RedPixels[9] |= (16'b0000000000010010);
					end
				else if (out5 == 2) begin
					RedPixels[6] |= (16'b0000000000001100);
					RedPixels[7] |= (16'b0000000000010010);
					RedPixels[8] |= (16'b0000000000010010);
					RedPixels[9] |= (16'b0000000000001100);
					end
				else begin
					RedPixels[6] &= (16'b1111111111100001);
					RedPixels[7] &= (16'b1111111111100001);
					RedPixels[8] &= (16'b1111111111100001);
					RedPixels[9] &= (16'b1111111111100001);
					end
				end
			6:begin
				if (out6==1) begin
					RedPixels[11] |= (16'b0100100000000000);
					RedPixels[12] |= (16'b0011000000000000);
					RedPixels[13] |= (16'b0011000000000000);
					RedPixels[14] |= (16'b0100100000000000);
					end
				else if (out6==2) begin
					RedPixels[11] |= (16'b0011000000000000);
					RedPixels[12] |= (16'b0100100000000000);
					RedPixels[13] |= (16'b0100100000000000);
					RedPixels[14] |= (16'b0011000000000000);
					end
				else begin
					RedPixels[11] &= (16'b1000011111111111);
					RedPixels[12] &= (16'b1000011111111111);
					RedPixels[13] &= (16'b1000011111111111);
					RedPixels[14] &= (16'b1000011111111111);
					end
				end
			7:begin
				if (out7==1) begin
					RedPixels[11] |= (16'b0000001001000000);
					RedPixels[12] |= (16'b0000000110000000);
					RedPixels[13] |= (16'b0000000110000000);
					RedPixels[14] |= (16'b0000001001000000);
					end
				else if (out7==2) begin
					RedPixels[11] |= (16'b0000000110000000);
					RedPixels[12] |= (16'b0000001001000000);
					RedPixels[13] |= (16'b0000001001000000);
					RedPixels[14] |= (16'b0000000110000000);
					end
				else begin
					RedPixels[11] &= (16'b1111110000111111);
					RedPixels[12] &= (16'b1111110000111111);
					RedPixels[13] &= (16'b1111110000111111);
					RedPixels[14] &= (16'b1111110000111111);
					end
				end
			8:begin
				if (out8==1) begin
					RedPixels[11] |= (16'b0000000000010010);
					RedPixels[12] |= (16'b0000000000001100);
					RedPixels[13] |= (16'b0000000000001100);
					RedPixels[14] |= (16'b0000000000010010);
					end
				else if (out8==2) begin
					RedPixels[11] |= (16'b0000000000001100);
					RedPixels[12] |= (16'b0000000000010010);
					RedPixels[13] |= (16'b0000000000010010);
					RedPixels[14] |= (16'b0000000000001100);
					end
				else begin
					RedPixels[11] &= (16'b1111111111100001);
					RedPixels[12] &= (16'b1111111111100001);
					RedPixels[13] &= (16'b1111111111100001);
					RedPixels[14] &= (16'b1111111111100001);
					end
				end
		endcase
		end
endmodule
