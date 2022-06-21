module ls189 
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=4)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] addr,
	input we,
	output [(DATA_WIDTH-1):0] out
);

	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];
	reg [ADDR_WIDTH-1:0] addr_reg;

	always @ (*)
	begin
		if (we)
			ram[addr] <= data;

		addr_reg <= addr;
	end
 
	assign out = ram[addr_reg];

endmodule
