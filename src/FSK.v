module FSK(
	input clk, rst_n,
	input N,
	output [7: 0] dout_FSK
);

//频率1
reg [7: 0] address1;
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		address1 <= 0;
	else 
		address1 <= address1 + N + 1;
end
//频率2
reg [7: 0] address2;
always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		address2 <= 0;
	else 
		address2 <= address2 + N + 5;
end


wire [7: 0] sin_wave1;
wire [7: 0] sin_wave2;

sin_256 sin1(
	.address(address1),
	.clock(clk),
	.q(sin_wave1)
);


sin_256 sin2(
	.address(address2),
	.clock(clk),
	.q(sin_wave2)
);



wire clk_out;
CLK clk_div(
	.clk(clk),
	.clk_out(clk_out)
);

wire mxl_out;
MXL mxl(
	.clk(clk_out),
	.out(mxl_out)
);

choose_FSK ch(
	.data_in1(sin_wave1),
	.data_in2(sin_wave2),
	.sel(mxl_out),
	.data_out(dout_FSK)
);

endmodule


