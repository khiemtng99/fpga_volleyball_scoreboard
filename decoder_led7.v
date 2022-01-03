module decoder_led7(enable, sel, bcd_in, out_7seg);
input enable, sel;
input [3:0]bcd_in;
output reg [6:0]out_7seg;
always @(sel)
begin
if(sel) //Common Cathode 
begin
	if(enable) out_7seg = 7'b0000000;
	else case(bcd_in)
		4'b0000: out_7seg = 7'b1111110;
		4'b0001: out_7seg = 7'b0110000;
		4'b0010: out_7seg = 7'b1101101;
		4'b0011: out_7seg = 7'b1111001;
		4'b0100: out_7seg = 7'b0110011;
		4'b0101: out_7seg = 7'b1011011;
		4'b0110: out_7seg = 7'b1011111;
		4'b0111: out_7seg = 7'b1110000;
		4'b1000: out_7seg = 7'b1111111;
		4'b1001: out_7seg = 7'b1111011;
		default: out_7seg = 7'b1111110;
		endcase
	end
if(~sel) begin //Common Anode 
	if(enable) out_7seg = 7'b1111111;
	else case(bcd_in)
		4'b0000: out_7seg = 7'b0000001;
		4'b0001: out_7seg = 7'b1001111;
		4'b0010: out_7seg = 7'b0010010;
		4'b0011: out_7seg = 7'b0000110;
		4'b0100: out_7seg = 7'b1001100;
		4'b0101: out_7seg = 7'b0100100;
		4'b0110: out_7seg = 7'b0100000;
		4'b0111: out_7seg = 7'b0001111;
		4'b1000: out_7seg = 7'b0000000;
		4'b1001: out_7seg = 7'b0000100;
		default: out_7seg = 7'b0000001;
		endcase
	end
end
endmodule