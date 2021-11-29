module changing_waves(
		input clk,
		input rst_n,
		
		input [2: 0] s0,    //输入选择数据
		input [2: 0] s1,
		input [1: 0] s2,
		
		output [10: 0] dout, d1    //输出波形
);



wire [7: 0] address;
frequency_generator fg(                        // 频率改变
	.clk(clk),
	.rst_n(rst_n),
	.data_in(s1),
//	.data_in(3'b001),
	.out_address(address)
);

//ASK频率变换，利用n1
wire n1;

frequency_generator_apf ask1(
	.clk(clk),
	.rst_n(rst_n),
	.data_in(s1),
	.out_address(n1)
);

//PSK频率变换，利用n2
wire n2;

frequency_generator_apf psk1(
	.clk(clk),
	.rst_n(rst_n),
	.data_in(s1),
	.out_address(n2)
);

//FSK频率变换，利用n3
wire n3;

frequency_generator_apf fsk1(
	.clk(clk),
	.rst_n(rst_n),
	.data_in(s1),
	.out_address(n3)
);





reg rden;
wire [7: 0] sin_out;
wire [7: 0] square_out;
wire [7: 0] triangle_out;
wire [7: 0] sawtooth_out;
wire [7: 0] lfm_out;
wire [7: 0] ASK_out;
wire [7: 0] PSK_out;
wire [7: 0] FSK_out;
 	 
always@(posedge clk or negedge rst_n)                 //波形准备
begin 
	if (!rst_n) 
		rden <= 0;
	else 
		rden <= 1;
end

sin_256 sin(
	.clock(clk), 
	.address(address),
	.rden(rden),
	.q(sin_out)
);	
square_256 square(
	.clock(clk), 
	.address(address),
	.rden(rden),
	.q(square_out)
);	
triangle_256 triangle(
	.clock(clk), 
	.address(address),
	.rden(rden),
	.q(triangle_out)
);	
sawtooth_256 sawtooth(
	.clock(clk), 
	.address(address),
	.rden(rden),
	.q(sawtooth_out)
);	
lfm_256 lfm(
	.clock(clk), 
	.address(address),
	.rden(rden),
	.q(lfm_out)
);	

ASK ask(
	.clk(clk),
	.rst_n(rst_n),
	.N(n1),
	.dout_ASK(ASK_out)
);	

PSK psk(
	.clk(clk),
	.rst_n(rst_n),
	.N(n2),
	.dout_PSK(PSK_out)
);	

FSK fsk(
	.clk(clk),
	.rst_n(rst_n),
	.N(n3),
	.dout_FSK(FSK_out)
);	



wire [7: 0] temp_wave;
wave_selector ws(                        //波形选择
//	.data_in(3'b100),
	.data_in(s0),
	
	.sin(sin_out),
	.square(square_out),
	.triangle(triangle_out),
	.sawtooth(sawtooth_out),
	.lfm(lfm_out),
	.ASK(ASK_out),
	.PSK(PSK_out),
	.FSK(FSK_out),
	
	.clk(clk),
	.rst_n(rst_n),
	.out(temp_wave)
);
assign d1  = temp_wave;



amplitude_selector as(                    //幅值变化
	.clk(clk),
	.data_in(s2),
//	.data_in(2'b01),
	.wave_data(temp_wave),
	.out(dout)
);

endmodule
