module BackupDemo( x_RCO, x, x_b, clk, clk_b, x_RCO_b, load, rst, comp, up_down, mode);
input clk, clk_b, load, rst, up_down, x_RCO_b, mode;
input [4:0]comp;
output reg [4:0]x; 
output reg x_RCO;
output reg [4:0]x_b;
	always @(x)
		begin
			if(mode) begin
				 if((x >= 25) & (x >= comp + 2)) x_RCO = 1;
				 else x_RCO = 0;
				 end
			else if (!mode) begin
				 if((x >= 15) & (x >= comp + 2)) x_RCO = 1;
				 else x_RCO = 0;
				 end
			else x_RCO = 0;
		end
		
	always @(posedge clk or posedge  rst) 
			begin
				if (rst)  x <= 0;
				else begin
						if (load) x <= x_b;
						else if ((x < 31) & (up_down)) x <= x + 1;
						else if ((x > 0) & (!up_down)) x <= x - 1;
						else x <= x;
				end
			end
	always @(posedge rst)
		begin
			if(rst) x_b <= x;
			else x_b <= x_b;
		end
endmodule 