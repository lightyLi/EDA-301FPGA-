module DAC(
	input clk,
	output da_clk,      //DA1时钟信号
	output da_wrt     //DA1写信号
);
	
	
assign da_clk = clk_125;
assign da_wrt = clk_125;

wire clk_125;
wire clk_50;


PLL pll_inst(
	.areset  (1'b0),
	.inclk0  (clk),
	.c0      (clk_50),
	.c1      (clk_125),
	.locked  ()
);



endmodule
