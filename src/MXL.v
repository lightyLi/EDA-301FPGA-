module MXL(    //生成二进制序列
	input clk,
	output reg out
);

reg[4:0]tmp = 5'b0;

always @(posedge clk)
begin
	if(tmp > 5'd31)
	
		tmp <= 5'd0;
	else
		tmp <= tmp + 1'b1;
	case(tmp)
		5'd0: out <= 0;
		5'd1: out <= 0;
		5'd2: out <= 1;
		5'd3: out <= 1;
		5'd4: out <= 1;
		5'd5: out <= 1;
		5'd6: out <= 0;
		5'd7: out <= 0;
		5'd8: out <= 0;
		5'd9: out <= 0;
		5'd10: out <= 1;
		5'd11: out <= 1;
		5'd12: out <= 1;
		5'd13: out <= 1;
		5'd14: out <= 0;
		5'd15: out <= 0;
		5'd16: out <= 1;
		5'd17: out <= 0;
		5'd18: out <= 1;
		5'd19: out <= 0;
		5'd20: out <= 1;
		5'd21: out <= 1;
		5'd22: out <= 0;
		5'd23: out <= 1;
		5'd24: out <= 1;
		5'd25: out <= 0;
		5'd26: out <= 1;
		5'd27: out <= 1;
		5'd28: out <= 1;
		5'd29: out <= 1;
		5'd30: out <= 0;
		5'd31: out <= 0;
	endcase
end
	
endmodule
