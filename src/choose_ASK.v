module choose_ASK(
	input [7:0]data_in,
	input sel,
	output [7:0]data_out
);

reg[7:0]daout;

always @(sel)
begin
	if(sel)
		daout <= data_in;
	else 
		daout <= 8'd0;
end

assign data_out = daout;

endmodule
