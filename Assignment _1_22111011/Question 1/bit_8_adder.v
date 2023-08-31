`include "bit_1_adder.v"
module bit_8_adder(Data0,Data1,mode,final_sum,final_carry_out,overflow);
	input[7:0] Data0,Data1;
	input mode;
	output[7:0] final_sum; 
	output final_carry_out;
	output overflow;
	wire[7:0] data2= mode ? Data1: ~Data1 + 1;
	wire[7:1] C;

	bit_1_adder g1(Data0[0],data2[0],1'b0,mode,final_sum[0],C[1]);
	bit_1_adder g2(Data0[1],data2[1],C[1],mode,final_sum[1],C[2]);
	bit_1_adder g3(Data0[2],data2[2],C[2],mode,final_sum[2],C[3]);
	bit_1_adder g4(Data0[3],data2[3],C[3],mode,final_sum[3],C[4]);
	bit_1_adder g5(Data0[4],data2[4],C[4],mode,final_sum[4],C[5]);
	bit_1_adder g6(Data0[5],data2[5],C[5],mode,final_sum[5],C[6]);
	bit_1_adder g7(Data0[6],data2[6],C[6],mode,final_sum[6],C[7]);
	bit_1_adder g8(Data0[7],data2[7],C[7],mode,final_sum[7],final_carry_out);

	assign overflow = (~Data0[7:7] & ~data2[7:7] & final_sum[7:7]) | (Data0[7:7] & data2[7:7] & ~final_sum[7:7]);

endmodule


