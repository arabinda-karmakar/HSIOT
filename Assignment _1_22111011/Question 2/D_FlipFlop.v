module D_FlipFlop(D,clk,rst,Q);
input D,clk,rst;
output reg Q;
always @ (*)
	begin
	if(rst)
		Q <= 0;
	else
		Q <= D;
	end
endmodule