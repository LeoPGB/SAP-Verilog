module ls161(
	input clk, cls, enableP, enableT, load,
	input [3:0]D,
	output reg [3:0]Q
);
assign Q = 4'b0000;
always@(posedge clk or negedge cls)
begin
	if (cls) Q <= 0;
	else
	begin
		if (load)Q <= D;
		else if (enableP & enableT) Q <= Q + 1;
	end
end
endmodule 