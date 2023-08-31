module sbox_naive (x,sx);
	input [3:0] x;
	output reg [3:0] sx;
	
	always @(x)
	begin
	 case(x)
		4'h0 :  sx = 4'hC;
		4'h1 :  sx = 4'h5;
		4'h2 :  sx = 4'h6;
		4'h3 :  sx = 4'hB;
		4'h4 :  sx = 4'h9;
		4'h5 :  sx = 4'h0;
		4'h6 :  sx = 4'hA;
		4'h7 :  sx = 4'hD;
		4'h8 :  sx = 4'h3;
		4'h9 :  sx = 4'hE;
		4'hA :  sx = 4'hF;
		4'hB :  sx = 4'h8;
		4'hC :  sx = 4'h4;
		4'hD :  sx = 4'h7;
		4'hE :  sx = 4'h1;
		4'hF :  sx = 4'h2;
	endcase
end
endmodule