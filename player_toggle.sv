module player_toggle (clock, reset, select, player);
	input logic clock, reset, select;
	output logic player;
	
	enum {p0, p1} ps, ns; 
	
	always_comb
		case (ps)
			p0: if (select) ns = p1; else ns = p0;
			p1: if (select) ns = p0; else ns = p1;
			default: ns = p0;
		endcase
		
	assign player = ps == p1;
	
	always_ff @(posedge clock)
		if (reset)
			ps <= p0;
		else
			ps <= ns;
endmodule
