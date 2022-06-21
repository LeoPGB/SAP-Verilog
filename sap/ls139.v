module ls139(
	input [1:0]A,
	input E,
	output reg [3:0]Y
);

always @(*)
begin
	if (E) Y <= 4'b1111;
	else
	begin
		case(A)
			2'b00: Y <= 4'b0111;
			2'b01: Y <= 4'b1011;
			2'b10: Y <= 4'b1101;
			2'b11: Y <= 4'b1110;
		endcase
	end	
end

endmodule 