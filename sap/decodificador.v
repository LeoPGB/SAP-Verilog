quimodule decodificador
#(parameter DATA_WIDTH=18, parameter ADDR_WIDTH=7)
(
	input [(ADDR_WIDTH-1):0] addr,
	output reg [(DATA_WIDTH-1):0] q
);
integer i;
	// Declare the ROM variable
reg [DATA_WIDTH-1:0] rom[2**ADDR_WIDTH-1:0];

initial
begin
	//NOP
	rom[7'b0000010] = 18'b000000000000000000;
	rom[7'b0000011] = 18'b000000000000000000;
	rom[7'b0000100] = 18'b000000000000000000;
	//LDA
	rom[7'b0001010] = 18'b000010001000000000;
	rom[7'b0001011] = 18'b000000100010000000;
	rom[7'b0001100] = 18'b000000000000000000;
	//LDI
	rom[7'b0010010] = 18'b000000001010000000;
	rom[7'b0010011] = 18'b000000000000000000;
	rom[7'b0010100] = 18'b000000000000000000;
	//STA
	rom[7'b0011010] = 18'b000010001000000000;
	rom[7'b0011011] = 18'b000001000100000000;
	rom[7'b0011100] = 18'b000000000000000000;
	//ADD
	rom[7'b0100010] = 18'b000010001000000000;
	rom[7'b0100011] = 18'b000000100000000010;
	rom[7'b0100100] = 18'b000000000010001000;
	//SUB
	rom[7'b0101010] = 18'b000010001000000000;
	rom[7'b0101011] = 18'b000000100000000010;
	rom[7'b0101100] = 18'b000000000011001000;
	//AND
	rom[7'b0110010] = 18'b000010001000000000;
	rom[7'b0110011] = 18'b000000100000000010;
	rom[7'b0110100] = 18'b000000000010011000;
	//ORL
	rom[7'b0111010] = 18'b000010001000000000;
	rom[7'b0111011] = 18'b000000100000000010;
	rom[7'b0111100] = 18'b000000000010101000;
	//XOR
	rom[7'b1000010] = 18'b000010001000000000;
	rom[7'b1000011] = 18'b000000100000000010;
	rom[7'b1000100] = 18'b000000000010111000;
	//NOT
	rom[7'b1001010] = 18'b000000000010111100;
	rom[7'b1001011] = 18'b000000000000000000;
	rom[7'b1001100] = 18'b000000000000000000;
	//JMP
	rom[7'b1010010] = 18'b001000001000000000;
	rom[7'b1010011] = 18'b000000000000000000;
	rom[7'b1010100] = 18'b000000000000000000;
	//OUT
	rom[7'b1110010] = 18'b000000000100000001;
	rom[7'b1110011] = 18'b000000000000000000;
	rom[7'b1110100] = 18'b000000000000000000;
	//HALT
	rom[7'b1111010] = 18'b100000000000000000;
	for (i=0; i<2**4; i = i+1)
	begin
		rom[{i,3'b000}] = 18'b000110000000000000;
		rom[{i,3'b001}] = 18'b010000110000000000;
	end
end

always @ (*)
begin
	q <= rom[addr];
end

endmodule