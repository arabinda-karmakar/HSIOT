module bit_8_adder_tb;
	reg mode;
	reg[7:0] A,B;
	wire[7:0] S;
	wire Cout, Ov;
	bit_8_adder DUT(A,B,mode,S,Cout,Ov);

	initial
		begin
			$dumpfile("bit_8_adder.vcd"); 
			$dumpvars(0,bit_8_adder_tb);
			$monitor($time,"A=%b, B=%b, mode=%b, S=%b, Cout=%b, Ov=%b", A,B,mode,S,Cout,Ov);
			#5 A=8'b01110000; B=8'b01000001; mode=1'b1;
			#5 A=8'b11111111; B=8'b01100001; mode=1'b1;
			#5 A=8'b11111000; B=8'b11100001; mode=1'b1;
			#5 A=8'b11111111; B=8'b11111111; mode=1'b0;
			#5 A=8'b10101111; B=8'b00110011; mode=1'b0;
			#5 A=8'b10000001; B=8'b10010101; mode=1'b1;
			#5 A=8'b01000000; B=8'b01001101; mode=1'b1;
			#5 A=8'b11000111; B=8'b10000001; mode=1'b1;
			#5 A=8'b11111100; B=8'b00000001; mode=1'b1;
			#5 A=8'b11110101; B=8'b00111100; mode=1'b0;
			#5 A=8'b10101001; B=8'b00111110; mode=1'b0;
			#5 A=8'b10001101; B=8'b10101101; mode=1'b1;
			#5 A=8'b01110011; B=8'b01100101; mode=1'b1;
			#5 A=8'b11101100; B=8'b01100000; mode=1'b1;
			#5 A=8'b10011000; B=8'b00101111; mode=1'b1;
			#5 $finish;
	end
endmodule