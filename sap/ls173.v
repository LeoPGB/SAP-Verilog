module ls173 (
	input clk, cls, ie1, ie2,
	input [7:0]D,
	output reg [7:0]Q);

always @(posedge clk)
begin
	if (cls)
		begin
			Q <= 0;
		end
	else
		begin
			if(~ie1 & ~ie2) Q <= D;
		end
end
endmodule 