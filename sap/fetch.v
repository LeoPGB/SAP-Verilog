module fetch(
	input clk, cycle_reset,
	output ncycle_end,
	output [2:0]fetch,
	output [5:0]fetch_T, nT
);
wire [2:0]fec;

ls161 ls161_inst(
	.clk(~clk),
	.cls(cycle_reset),
	.enableP(1'b1),
	.enableT(1'b1),
	.load(1'b0),
	.Q(fec)
);

assign fetch = fec;

ls138 ls138_inst(
	.enable(1'b0),
	.A(fec),
	.T(fetch_T)
);

assign ncycle_end = fetch_T[5];
assign nT = ~fetch_T;

endmodule 