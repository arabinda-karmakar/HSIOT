module sboxa_tb;
	reg[3:0] x;
	wire[3:0] sx;
	sbox_combinational DUT(x,sx);
	initial
		begin
			$dumpfile("sboxb.vcd"); 
			$dumpvars(0,sboxa_tb);
			$monitor($time,"x=%h, sx=%h,", x,sx);
			#5 x = 4'h0;
			#5 x = 4'h1;
			#5 x = 4'h2;
			#5 x = 4'h3;
			#5 x = 4'h4;
			#5 x = 4'h5;
			#5 x = 4'h6;
			#5 x = 4'h7;
			#5 x = 4'h8;
			#5 x = 4'h9;
			#5 x = 4'hA;
			#5 x = 4'hB;
			#5 x = 4'hC;
			#5 x = 4'hD;
			#5 x = 4'hE;
			#5 x = 4'hF;
			#5 $finish;
		end
endmodule
