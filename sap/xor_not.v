module xor_not(
	input xn,
	input [7:0]A,
	input [7:0]B,
	output reg [7:0]S
);
integer i;

always@(*)
begin
	for (i = 0; i < 8;i = i+1)
	begin
		S[i] <= ((B[i] | xn) ^ A[i]);
	end
end
endmodule 