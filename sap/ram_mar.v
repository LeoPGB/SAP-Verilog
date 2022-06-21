module ram_mar(
	input clk, cls, mar_in, prog_run, btn_ram_in, btn_ram_out, wr_btn,
	input [7:0]dat,
	input [3:0]mar_dp,
	inout [7:0]BUS
);

wire [3:0]mar_b;
wire [3:0]addr;
wire [7:0]ram_in;
wire [7:0]ram_out;
wire [7:0]not_ram_out;

wire wire_1;
wire wire_2;
wire wire_3;
wire wire_4;
wire we;

assign wire_1 = ~(btn_ram_in & clk);
assign wire_2 = ~(wire_1 & prog_run);
assign wire_3 = ~(prog_run & prog_run);
assign wire_4 = ~(wire_3 & wr_btn);
assign we = ~(wire_2 & wire_4);

ls173 ls173_inst(
	.clk(clk),
	.cls(cls),
	.ie1(~mar_in),
	.ie2(~mar_in),
	.D(BUS),
	.Q(mar_b)
);

ls157 ls157_inst(
	.S(prog_run),
	.A(mar_dp),
	.B(mar_b),
	.Y(addr)
);

ls157 ls157_inst2(
	.S(prog_run),
	.A(dat),
	.B(BUS),
	.Y(ram_in)
);

ls189 ls189_inst(
	.we(~we),
	.addr(addr),
	.data(ram_in),
	.out(not_ram_out)
);

ls04 ls04_inst(
	.A(not_ram_out),
	.S(ram_out)
);

ls245 ls245_inst(
	.ABBA(1'b1),
	.enableG(~btn_ram_out),
	.tri_A(ram_out),
	.tri_B(BUS)
);

endmodule 