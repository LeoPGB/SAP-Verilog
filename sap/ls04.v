module ls04(
input [7:0]A,
output reg [7:0]S
);

always@(*)
begin
	S <= ~A;
end
endmodule 