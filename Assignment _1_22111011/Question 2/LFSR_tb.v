module LFSR_tb;
	reg[16:1] seed;
	reg clk,rst;
	wire[16:1] state;
	LFSR DUT(seed,clk,rst,state);
	integer i=0;
	initial
		begin
			$dumpfile("LFSR.vcd"); 
			$dumpvars(0,LFSR_tb);
		end
		
	initial
		begin
		
		//$monitor("time=%g,seed=%b, rst=%b, state=%b, clk=%b",$time, seed,rst,state,clk);
			seed=16'b1010110011100001; rst = 1'b0;
			#2;
		
		end

	always 
		begin
			 clk=1'b1;
			 #1;
			 clk=1'b0;
			 #1;
		 end

	always @ (posedge clk)
		begin 
			//$monitor("time=%g,seed=%b, rst=%b, state=%b, clk=%b",$time, seed,rst,state,clk);
			$display("time=%g,seed=%b, rst=%b, state=%b, clk=%b",$time, seed,rst,state,clk);
			seed=state; rst = 1'b0;
			#2;
					if(seed == 16'b1010110011100001)
						$finish;
			
		end

endmodule