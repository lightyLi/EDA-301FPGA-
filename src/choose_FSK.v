module choose_FSK(
	input [7:0]data_in1,
	input [7:0]data_in2,
	input sel,
	output [7:0]data_out
);

reg[7:0]daout;

always @(sel)
begin
	if(sel)
		daout <= data_in1;
	else 
		daout <= data_in2;
end

assign data_out = daout;

endmodule