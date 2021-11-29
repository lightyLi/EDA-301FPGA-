module frequency_generator_apf(clk, rst_n, data_in, out_address);
input clk, rst_n;
input [2: 0] data_in;
output  out_address;


reg  a;


always @ (posedge clk or negedge rst_n)
begin
	if(rst_n==1'b0)	
		a <= 0;
	else  
	case(data_in)
      3'b000: a <=  1;
		3'b001: a <=  2;
		3'b010: a <=  4;
		3'b011: a <=  8;
		3'b100: a <=  16;
		3'b101: a <=  32;
		3'b110: a <=  64;
		3'b111: a <=  128;
		default: a <=  0;
	endcase
end

assign out_address = a;

endmodule
