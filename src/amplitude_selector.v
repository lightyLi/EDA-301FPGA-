module amplitude_selector(clk, data_in, out, wave_data);
input clk;
input [1: 0] data_in;
input [7: 0] wave_data;
output [10 :0] out;

reg [9:0] temp;
assign out = temp;
wire [9:0] temp_1;
wire [9:0] temp_2;
wire [9:0] temp_3;
wire [9:0] temp_4;



assign temp_1 = wave_data * 1;
assign temp_2 = wave_data * 2;
assign temp_3 = wave_data * 3;
assign temp_4 = wave_data * 4;



always@(posedge clk)
begin
	case(data_in)
      2'b00:temp <= temp_1;
		2'b01:temp <= temp_2;
		2'b10:temp <= temp_3;
		2'b11:temp <= temp_4;
		default:temp <= temp_1;
	endcase
end

endmodule 