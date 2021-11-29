module frequency_generator(clk, rst_n, data_in, out_address);
input clk, rst_n;
input [2: 0] data_in;
output [9: 0] out_address;


reg [7: 0] address;


always @ (posedge clk or negedge rst_n)
begin
	if(rst_n==1'b0)	
		address <= 0;
	else  
	case(data_in)
      3'b000: address <= address + 1;
		3'b001: address <= address + 2;
		3'b010: address <= address + 4;
		3'b011: address <= address + 8;
		3'b100: address <= address + 16;
		3'b101: address <= address + 32;
		3'b110: address <= address + 64;
		3'b111: address <= address + 128;
		default: address <= address + 1;
	endcase
end

assign out_address = address;

endmodule

