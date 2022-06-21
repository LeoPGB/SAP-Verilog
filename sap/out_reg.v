module out_reg(
	input clk, cls, opr_in,
	input [7:0]BUS,
	output [7:0]out
);

ls173 ls173_inst(
	.clk(clk),
	.cls(cls),
	.ie1(~opr_in),
	.ie2(~opr_in),
	.D(BUS),
	.Q(out)
);
endmodule 