module alu(
	input clk, cls, br_in, br_out, acc_in, acc_out, add_sub, xn, alu_out,
	input [1:0]S,
	inout [7:0]BUS,
	output [7:0]b_reg, acc_reg
);
wire [7:0]wire_b_reg;
wire [7:0]wire_acc_reg;
wire [7:0]wire_B;
wire [7:0]wire_sum;
wire [7:0]wire_and;
wire [7:0]wire_or;
wire [7:0]wire_xor_not;
wire [7:0]wire_alu;

b_reg b_reg_inst(
	.clk(clk),
	.cls(cls),
	.br_in(br_in),
	.br_out(br_out),
	.b_in_BUS(BUS),
	.b_reg(wire_b_reg)
);
acc_reg acc_reg_inst(
	.clk(clk),
	.cls(cls),
	.acc_in(acc_in),
	.acc_out(acc_out),
	.acc_in_BUS(BUS),
	.acc_reg(wire_acc_reg)
);

assign b_reg = wire_b_reg;
assign acc_reg = wire_acc_reg;

ls86 ls86_inst(
	.in(wire_b_reg),
	.add_sub(add_sub),
	.S(wire_B)
);

ls283 ls283_inst(
	.A(wire_acc_reg),
	.B(wire_B),
	.C_in(add_sub),
	.S(wire_sum)
);

ls08 ls08_inst(
	.A(wire_acc_reg),
	.B(wire_b_reg),
	.S(wire_and)
);

ls32 ls32_inst(
	.A(wire_acc_reg),
	.B(wire_b_reg),
	.S(wire_or)
);

xor_not xor_not_inst(
	.A(wire_acc_reg),
	.B(wire_b_reg),
	.xn(~xn),
	.S(wire_xor_not)
);

ls153 ls153_inst(
	.m_sum(wire_sum),
	.m_and(wire_and),
	.m_or(wire_or),
	.m_xor_not(wire_xor_not),
	.S(S),
	.alu(wire_alu)
);

ls245 ls245_inst(
	.ABBA(1'b1),
	.enableG(~alu_out),
	.tri_A(wire_alu),
	.tri_B(BUS)
);

endmodule 