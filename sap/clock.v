module clock(
	input clk_auto, clk_man, select, halt,
	output reg clock, nclock
);

reg wire_A;
reg wire_B;
reg wire_C;
reg wire_D;

always@(*)
begin
	wire_A <= ~(clk_auto & select);
	wire_B <= ~(clk_man & ~select);
	wire_C <= ~(wire_A & wire_B);
	wire_D <= ~(wire_C & ~halt);
	clock <= ~wire_D;
	nclock <= wire_D;
end
endmodule 