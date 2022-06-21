module b_reg(
	input clk, cls, br_in, br_out,
	input [7:0]b_in_BUS,
	output [7:0]b_reg
);
wire [7:0]wire_b_reg;

ls173 ls173_inst(
	.clk(clk),
	.cls(cls),
	.ie1(~br_in),
	.ie2(~br_in),
	.D(b_in_BUS),
	.Q(wire_b_reg)
);

ls245 ls245_inst(
	.ABBA(1'b1),
	.enableG(~br_out),
	.tri_A(wire_b_reg),
	.tri_B(b_reg)
);
endmodule 
