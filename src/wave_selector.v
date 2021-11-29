module wave_selector(
	input [2:0]data_in,
	input [7:0]sin,
	input [7:0]square,
	input [7:0]triangle,
	input [7:0]sawtooth,
	input [7:0]lfm,
	input [7:0]ASK,
	input [7:0]PSK,
	input [7:0]FSK,
	
	
	input clk,
	input rst_n,
	output [7:0] out
);

reg [7:0] p;
assign out = p;

always@(posedge clk or negedge rst_n)
begin
	if(!rst_n)	
		p <= 0;
	else
	case(data_in)
		3'b000 : p <= sin;
		3'b001 : p <= square;
		3'b010 : p <= triangle;
		3'b011 : p <= sawtooth;
		3'b100 : p <= lfm;
		3'b101 : p <= ASK;
		3'b110 : p <= PSK;
		3'b111 : p <= FSK;
		
		default : p <= FSK;
	endcase
end



endmodule
