module ls08(
	input [7:0]A,
	input [7:0]B,
	output reg [7:0]S
);
always@(*)
begin
	S <= A & B;
end
endmodule 