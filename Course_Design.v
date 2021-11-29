module Course_Design(
	input 		clk,
	input       rst_n,
	
	input    uart_rx,
	output [7:0]  rx_data,
	
	output [5:0] seg_sel,//数码管选通信号
   output [7:0] seg_data,//数码管数据
	output    uart_tx,
		
	output da1_clk,             //DA1 时钟信号
	output da1_wrt,	           //DA1 数据写信号
   output [10:0] da1_data, dout9,    //DA1 data
	
	output [7: 0] dout1, dout2, dout3, dout4,dout5, dout6, dout7, dout8
);

reg [2:0] s0;
reg [2:0] s1;
reg [1:0] s2;

always@(*)
begin
	s0 <=rx_data[7: 5];     //波形
	s1 <=rx_data[4: 2];     //频率  
	s2 <=rx_data[1: 0];     //振幅
end


original_wave ow(        //原始波形数据
	.clk(clk),
	.rst_n(rst_n),
	.d1(dout1),
	.d2(dout2),
	.d3(dout3),
	.d4(dout4),
	.d5(dout5),
	.d6(dout6),
	.d7(dout7),
	.d8(dout8)
);

UART uart(        //串口通信模块    可以使用
	.clk(clk), 
	.rst_n(rst_n),
	.uart_rx(uart_rx),
	.rx_data(rx_data),
	.uart_tx(uart_tx),
);


wire [10: 0] dout;     //作为本地监测
changing_waves u1(             //通过二进制序列控制变化的波形  
		.clk(clk),
		.rst_n(rst_n),
		.s0(s0),       //波形选择
		.s1(s1),       //幅度变化
		.s2(s2),       //频率变化
		.dout(dout),      //输出波
		.d1(dout9)
);


segment seg(     //数码管显示
	.clk(clk),
	.rst_n(rst_n),
	.s0(s0),
	.s1(s1),
	.s2(s2),
	.seg_sel(seg_sel),
	.seg_data(seg_data)
);


DAC dac(                                  //DAC模块,参数准备
	.clk(clk),
	.da_clk(da1_clk),
	.da_wrt(da1_wrt)
);
assign da1_data = dout; 

endmodule


