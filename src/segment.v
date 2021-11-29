module segment(
	input clk,
	input rst_n,
	input [2: 0] s0,
	input [1: 0] s1,
	input [2: 0] s2,
	output [5:0] seg_sel,          //数码管选通信号
   output [7:0] seg_data          //数码管数据
);


wire[6:0] seg_data_1;
seg_encoder b_sel1(
		.bin_data(s0),
		.seg_data({seg_data_1})
);


wire[6:0] seg_data_2;
seg_encoder b_sel2(
		.bin_data(s1),
		.seg_data({seg_data_2})
);

wire[6:0] seg_data_3;
seg_encoder b_sel3(
		.bin_data(s2),
		.seg_data({seg_data_3})
);

//数码管扫描器
seg_scan seg_scan(
    .clk        (clk),
    .rst_n      (rst_n),
    .seg_sel    (seg_sel),
    .seg_data   (seg_data),
    .seg_data_0 ({1'b1,seg_data_1}),      //The  decimal point at the highest bit,and low level effecitve
    .seg_data_1 ({1'b1,seg_data_2}), 
    .seg_data_2 ({1'b1,seg_data_3}),
    .seg_data_3 (8'b1111_1111),
    .seg_data_4 (8'b1111_1111),
    .seg_data_5 (8'b1111_1111)
);

endmodule
