module ls86(
	input [7:0]in,
	input add_sub,
	output reg [7:0]S
);

integer i;

always@(*)
begin
	for (i = 0; i < 8; i = i + 1)
	begin
		S[i] <= (in[i] ^ add_sub);
	end
end
endmodule
