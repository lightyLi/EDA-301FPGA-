module original_wave(clk, rst_n, d1, d2, d3, d4,d5, d6, d7, d8);
inout clk, rst_n;
output [7: 0] d1, d2, d3, d4,d5, d6, d7, d8;

reg rden;
reg [7: 0] address;
always@(posedge clk or negedge rst_n)
begin 
	if (!rst_n) 
		rden <= 0;
	else 
		rden <= 1;
end

always@(posedge clk or negedge rst_n)
begin
	if (!rst_n)
		address <= 0;
	else 
		address <= address + 1;
end


sin_256 u1(
	.address(address), 
	.clock(clk),
	.rden(rden),
	.q(d1)
);

square_256 u2(
	.address(address), 
	.clock(clk),
	.rden(rden),
	.q(d2)
);

triangle_256 u3(
	.address(address), 
	.clock(clk),
	.rden(rden),
	.q(d3)
);

sawtooth_256 u4(
	.address(address), 
	.clock(clk),
	.rden(rden),
	.q(d4)
);

lfm_256 u5(
	.address(address), 
	.clock(clk),
	.rden(rden),
	.q(d5)
);

ASK U6(
	.clk(clk),
	.rst_n(rst_n),
	.N(0),
	.dout_ASK(d6)
);	

PSK U7(
	.clk(clk),
	.rst_n(rst_n),
	.N(0),
	.dout_PSK(d7)
);	

FSK U8(
	.clk(clk),
	.rst_n(rst_n),
	.N(0),
	.dout_FSK(d8)
);	

endmodule 
