module i_decoder(
	input clk, cycle_reset, cls, ir_in, ir_out,
	input [7:0]BUS,
	output[17:0]decoder,
	output[7:0]i_reg,
	output[2:0]fetch

);

wire [2:0]wire_fetch;
wire [7:0]wire_i_reg;
wire [6:0]addr;

fetch fetch_inst(
	.clk(~clk),
	.cycle_reset(cycle_reset),
	.fetch(wire_fetch)
);

i_reg i_reg_inst(
	.clk(clk),
	.cls(cls),
	.ir_in(ir_in),
	.ir_out(ir_out),
	.BUS(BUS),
	.i_reg(wire_i_reg)
);

assign fetch = wire_fetch;
assign i_reg = wire_i_reg;
assign addr = ({wire_i_reg[7:4],wire_fetch});

decodificador decodificador_inst(
	.addr(addr),
	.q(decoder)
);

//decoder[0] =  opr_in
//decoder[1] =  br_in
//decoder[2] =  xor_not
//decoder[3] =  alu_out
//decoder[4] =  alu_0
//decoder[5] =  alu_1
//decoder[6] =  add_sub
//decoder[7] =  acc_in
//decoder[8] =  acc_out
//decoder[9] =  ir_out
//decoder[10] = ir_in
//decoder[11] = ram_out
//decoder[12] = ram_in
//decoder[13] = mar_in
//decoder[14] = pc_out
//decoder[15] = jmp
//decoder[16] = pc_inc
//decoder[17] = halt

endmodule
