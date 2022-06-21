module ls138(
	input enable,
	input [2:0]A,
	output reg [7:0]T
);

 always@(*)
begin
	if (enable) T <= 8'b11111111;
	else
	begin
		case ({A})
			3'b000: T = 8'b11111110;
			3'b001: T = 8'b11111101;
			3'b010: T = 8'b11111011;
			3'b011: T = 8'b11110111;
			3'b100: T = 8'b11101111;
			3'b101: T = 8'b11011111;
			3'b110: T = 8'b10111111;
			3'b111: T = 8'b01111111;
		endcase
	end
end
endmodule 