module ASK(
	input clk, rst_n,
	input N,
	output [7: 0] dout_ASK
);


reg [7: 0] address;

always@(posedge clk or negedge rst_n)    //变频
begin
	if (!rst_n)
		address <= 0;
	else 
		address <= address + N + 1;
end

wire [7: 0] sin_wave;
sin_256 sin(
	.address(address),
	.clock(clk),
	.q(sin_wave)
);

wire clk_in;
CLK clk_div(
	.clk(clk),
	.clk_out(clk_in)
);

wire mxl_out;
MXL mxl(
	.clk(clk_in),
	.out(mxl_out)
);

choose_ASK ch(
	.data_in(sin_wave),
	.sel(mxl_out),
	.data_out(dout_ASK)
);

endmodule


