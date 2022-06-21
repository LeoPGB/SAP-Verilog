module i_reg(
	input clk, cls, ir_in, ir_out,
	inout [7:0]BUS,
	output [7:0]i_reg
);
wire [7:0]wire_i_reg;

ls173 ls173_inst(
	.clk(clk),
	.cls(cls),
	.ie1(~ir_in),
	.ie2(~ir_in),
	.D(BUS),
	.Q(wire_i_reg)
);

assign i_reg = wire_i_reg;

ls245 ls245_inst(
	.enableG(~ir_out),
	.ABBA(1'b1),
	.tri_A(wire_i_reg),
	.tri_B(BUS)
);

endmodule 