module SetDemo( x_RCO, x, clk, rst, comp, up_down);
input clk, rst, up_down;
input [1:0]comp;
output reg [1:0]x; 
output reg x_RCO;
	always @(x)
		begin
			 if((x == 3) & (x > comp)) x_RCO = 1;
			 else x_RCO = 0;
		end
		
	always @(posedge clk or posedge  rst)
			begin
				if (rst) x <= 0;
				else if (clk)
				begin
					if ((x < 3) & (up_down))  x <= x + 1;
					else if ((x > 0) & (!up_down)) x <= x - 1;
					else x <= x;
				end
				else x <= x;
			end
endmodule