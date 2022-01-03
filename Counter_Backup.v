module Counter_Backup(Pnt_clk1, Pnt_clk2, Set_clk1, Set_clk2, Pnt_RCO1, Pnt_RCO2, Set_RCO1, Set_RCO2, Pnt_reset, Set_reset,
							 led7_pnt1_1, led7_pnt1_2,led7_pnt2_1, led7_pnt2_2, led7_Set1, led7_Set2,
							 Mode15_25, enable, sel, load, Up_down,
							 iCLK, iRST_N, LCD_DATA, LCD_RW, LCD_EN, LCD_RS);
input wire Pnt_clk1, Pnt_clk2, Set_clk1, Set_clk2, Pnt_reset, Set_reset, Mode15_25, enable, sel, load, Up_down;
input wire iCLK, iRST_N;
wire [4:0] Pnt1, Pnt2;
wire [1:0] Set1, Set2;
wire [3:0] Pnt1_1, Pnt1_2, Pnt2_1, Pnt2_2;
output wire Set_RCO1, Set_RCO2;
output wire [7:0] LCD_DATA;
output wire LCD_RW, LCD_EN, LCD_RS;
output wire Pnt_RCO1, Pnt_RCO2;
output wire [6:0]led7_pnt1_1, led7_pnt1_2,led7_pnt2_1, led7_pnt2_2, led7_Set1, led7_Set2;
BackupPoint Counter_Backup_Point(Pnt_clk1, Pnt_clk2, Pnt1, Pnt2, Pnt_RCO1, Pnt_RCO2, load, Pnt_reset, Up_down, Mode15_25);
BackupSet Counter_Backup_Set(Set_clk1, Set_clk2, Set1, Set2,  Set_RCO1, Set_RCO2, Set_reset, Up_down);
Led7_x2 Led7_ass(Pnt1_1, Pnt1_2, Pnt2_1, Pnt2_2, Pnt1, Pnt2);
decoder_led7 Pnt_1_2(enable, sel, Pnt1_2, led7_pnt1_2);
decoder_led7 Pnt_1_1(enable, sel, Pnt1_1, led7_pnt1_1);
decoder_led7 Pnt_2_1(enable, sel, Pnt2_1, led7_pnt2_1);
decoder_led7 Pnt_2_2(enable, sel, Pnt2_2, led7_pnt2_2);
decoder_led7 Set_1(enable, sel, Set1, led7_Set1);
decoder_led7 Set_2(enable, sel, Set2, led7_Set2);
LCD_display lcd(Set_RCO1, Set_RCO2, iCLK, iRST_N, LCD_DATA, LCD_RW, LCD_EN, LCD_RS);
endmodule

