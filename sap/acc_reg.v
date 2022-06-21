module acc_reg(
	input clk, cls, acc_in, acc_out,
	input [7:0]acc_in_BUS,
	output [7:0]acc_reg
);
wire [7:0]wire_acc_reg;

ls173 ls173_inst(
	.clk(clk),
	.cls(cls),
	.ie1(~acc_in),
	.ie2(~acc_in),
	.D(acc_in_BUS),
	.Q(wire_acc_reg)
);

ls245 ls245_inst(
	.ABBA(1'b1),
	.enableG(~acc_out),
	.tri_A(wire_acc_reg),
	.tri_B(acc_reg)
);
endmodule 
