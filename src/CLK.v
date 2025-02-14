module CLK(    //分时钟
	input clk, 
	output reg clk_out
);

reg [13:0] cnt;
parameter N = 50;

always @(posedge clk)
begin
	if(cnt == N*2 - 1)begin
		cnt <= 14'b0;
		clk_out <= ~clk_out;
	end
	else 
		cnt <= cnt + 1'b1;
end

endmodule 