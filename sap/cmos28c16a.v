module cmos28c16a
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=11)
(
	input [(ADDR_WIDTH-1):0] addr,
	output reg [(DATA_WIDTH-1):0] q
);
integer i;
	// Declare the ROM variable
reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

initial
begin
	for(i = 0; i< 2**ADDR_WIDTH; i = i+1)
	begin
		rom[i] = i;
	end
end

always @ (*)
begin
	q <= rom[addr];
end

endmodule
