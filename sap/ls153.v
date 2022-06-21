module ls153 (
input [7:0]m_sum,
input [7:0]m_and,
input [7:0]m_or,
input [7:0]m_xor_not,
input [1:0]S,
output reg [7:0]alu
);

always @ (m_sum or m_and or m_or or m_xor_not or S)
begin
	case (S)
		2'b00 : alu <= m_sum;
		2'b01 : alu <= m_and;
		2'b10 : alu <= m_or;
		2'b11 : alu <= m_xor_not;
	endcase
end
endmodule 