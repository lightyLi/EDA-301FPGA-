module seg_scan(
	input           clk,
	input           rst_n,
	output reg[5:0] seg_sel,      
	output reg[7:0] seg_data,     
	input[7:0]      seg_data_0,
	input[7:0]      seg_data_1,
	input[7:0]      seg_data_2,
	input[7:0]      seg_data_3,
	input[7:0]      seg_data_4,
	input[7:0]      seg_data_5
);
parameter scan_count = 49999;
reg[31:0] timer;
reg[3:0]  scan_sel;
always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)
	begin
		timer <= 32'd0;
		scan_sel <= 4'd0;
	end
	else if(timer < scan_count)
	begin
		timer <= timer + 32'd1;
	end
	else if(timer == scan_count)
	begin
		timer <= 32'd0;
		if(scan_sel < 4'd5)
	    begin
			scan_sel <= scan_sel + 4'd1;
		end
		else if(scan_sel == 4'd5)
		begin
			scan_sel <= 4'd0;
		end
	end
	else 
		timer <= 32'd0;
end

always@(posedge clk or negedge rst_n)
begin
	if(rst_n == 1'b0)
	begin
		seg_sel <= 6'b111111;
		seg_data <= 8'hff;
	end
	else
	begin
		case(scan_sel)
			4'd0:
			begin
				seg_sel <= 6'b11_1110;
				seg_data <= seg_data_0;
			end
			4'd1:
			begin
				seg_sel <= 6'b11_1101;
				seg_data <= seg_data_1;
			end
			4'd2:
			begin
				seg_sel <= 6'b11_1011;
				seg_data <= seg_data_2;
			end
			4'd3:
			begin
				seg_sel <= 6'b11_0111;
				seg_data <= seg_data_3;
			end
			4'd4:
			begin
				seg_sel <= 6'b10_1111;
				seg_data <= seg_data_4;
			end
			4'd5:
			begin
				seg_sel <= 6'b01_1111;
				seg_data <= seg_data_5;
			end
			default:
			begin
				seg_sel <= 6'b11_1111;
				seg_data <= 8'hff;
			end
		endcase
	end
end
endmodule