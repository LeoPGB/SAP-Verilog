module dec_display(
	input clk, cls, opr_in, sw,
	input [7:0]BUS,
	output [7:0]segmento, out_reg,
	output [3:0]dp
);

wire [1:0]ctnLH;
wire [7:0]out_b;
wire [10:0]wire_cmos;

ls161 ls161_inst(
	.clk(clk),
	.cls(1'b0),
	.enableP(1'b1),
	.enableT(1'b1),
	.load(1'b1),
	.D(4'b1111),
	.Q(ctnLH)
);

out_reg out_reg_inst(
	.clk(clk),
	.cls(cls),
	.BUS(BUS),
	.opr_in(opr_in),
	.out(out_b)
);

assign out_reg = out_b;
assign wire_cmos = ({sw,ctnLH,out_b});

cmos28c16a cmos28c16a_inst(
	.addr(wire_cmos),
	.q(segmento)

);

ls139 ls139_inst(
	.A(ctnLH),
	.E(1'b0),
	.Y(dp)
);

endmodule 