module contador (
	input clk, cls, pc_inc, load, pc_out,
	inout [3:0]pc_b,
	inout [3:0]BUS
);

wire [3:0]wire_pc_b;
wire [7:0]wire_pc_b1;
wire [7:0]wire_BUS;

ls161 ls161_inst(
	.clk(clk),
	.cls(cls),
	.enableP(pc_inc),
	.enableT(pc_inc),
	.load(load),
	.D(BUS),
	.Q(pc_b)
);

assign wire_pc_b1 = {pc_b[0], pc_b[1], pc_b[2], pc_b[3], 1'b0, 1'b0, 1'b0, 1'b0};

ls245 ls245_inst(
	.ABBA(1'b0),
	.enableG(~pc_out),
	.tri_A(wire_BUS),
	.tri_B(wire_pc_b1)
);

assign BUS = {wire_BUS[4], wire_BUS[5], wire_BUS[6], wire_BUS[7]};

endmodule 