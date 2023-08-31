`include "D_FlipFlop.v"
module LFSR(seed,clk,rst,state);
	input[16:1] seed;
	input rst,clk;
	output[16:1] state;
 
		D_FlipFlop g1(seed[16] ,clk,rst,state[15]);
		D_FlipFlop g2(seed[15] ^ seed[1],clk,rst,state[14]);
		D_FlipFlop g3(seed[14] ^ seed[1],clk,rst,state[13]);
		D_FlipFlop g4(seed[13],clk,rst,state[12]);
		D_FlipFlop g5(seed[12] ^ seed[1],clk,rst,state[11]);
		D_FlipFlop g6(seed[11],clk,rst,state[10]);
		D_FlipFlop g7(seed[10],clk,rst,state[9]);
		D_FlipFlop g8(seed[9],clk,rst,state[8]);
		D_FlipFlop g9(seed[8],clk,rst,state[7]);
		D_FlipFlop g10(seed[7],clk,rst,state[6]);
		D_FlipFlop g11(seed[6],clk,rst,state[5]);
		D_FlipFlop g12(seed[5],clk,rst,state[4]);
		D_FlipFlop g13(seed[4],clk,rst,state[3]);
		D_FlipFlop g14(seed[3],clk,rst,state[2]);
		D_FlipFlop g15(seed[2],clk,rst,state[1]);
		D_FlipFlop g16(seed[1],clk,rst,state[16]);
		

endmodule		


