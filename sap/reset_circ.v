module reset_circ(
	input btn, cycle_end,
	output reset, nreset, cycle_reset
); 

wire wire_1;
wire wire_2;

assign wire_1 = ~btn;
assign wire_2 = (wire_1 & cycle_end);

assign reset = btn;
assign nreset = ~btn;
assign cycle_reset = wire_2;

endmodule 