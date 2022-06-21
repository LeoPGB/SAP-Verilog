module ls157(
	input S,
	input [7:0]A, 
	input [7:0]B,
	output reg [7:0]Y
);

always @(A or B or S)
begin
	if(S) Y <= A;
	else Y<= B;
end

endmodule 