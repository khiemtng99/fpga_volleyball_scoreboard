module BackupPoint(clk1, clk2, pnt1, pnt2,  RCOpnt1, RCOpnt2, load, rstpnt, up_down, mode25_15);
	input clk1, clk2, load, rstpnt, up_down, mode25_15;
	wire [4:0] pnt1_b, pnt2_b;
	output wire [4:0] pnt1, pnt2;
	output wire RCOpnt1, RCOpnt2; 
	
	BackupDemo Point1( RCOpnt1, pnt1, pnt1_b, clk1, clk2, RCOpnt2, load, rstpnt, pnt2, up_down, mode25_15);
	BackupDemo Point2( RCOpnt2, pnt2, pnt2_b, clk2, clk1, RCOpnt1, load, rstpnt, pnt1, up_down, mode25_15);
endmodule
