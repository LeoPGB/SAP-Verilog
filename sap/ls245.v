module ls245(
	input ABBA, enableG,
	inout [7:0]tri_A,
	inout [7:0]tri_B
);

wire wire_0;
wire wire_1;
wire wire_2;

assign	tri_B = wire_0 ? tri_A : 8'bzzzzzzzz;
assign	tri_A = wire_1 ? tri_B : 8'bzzzzzzzz;
assign	wire_0 = ABBA & wire_2;
assign	wire_1 = ~(ABBA | enableG);
assign	wire_2 =  ~enableG;


endmodule 