module ls283(
	input C_in,
	input [7:0]A,
	input [7:0]B,
	output reg C_out,
	output reg [7:0]S
);

always@(*)
begin
	{C_out,S} = A + B + C_in;
end
endmodule