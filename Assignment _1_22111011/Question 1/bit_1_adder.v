module bit_1_adder(I0,I1,carry_in,mode,sum,carry_out);
	input I0,I1,carry_in,mode;
	output sum,carry_out;
	assign {carry_out,sum} = I0 + I1 + carry_in;
endmodule