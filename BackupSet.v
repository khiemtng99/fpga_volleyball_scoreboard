module BackupSet(clk1, clk2, set1, set2,  RCOset1, RCOset2, reset, up_down);
	input wire clk1, clk2, reset, up_down;
	output wire [1:0]set1, set2;
	output wire RCOset1, RCOset2; 
	SetDemo Set1( RCOset1, set1, clk1, reset, set2, up_down);
	SetDemo Set2( RCOset2, set2, clk2, reset, set1, up_down);	
endmodule
