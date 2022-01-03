module Led7_x2(out0_0, out0_1, out1_0, out1_1, in0, in1);
input[4:0] in0, in1;
output [3:0] out0_0, out0_1, out1_0, out1_1;
assign out0_0 =in0 %10;
assign out1_0 =in1 %10;
assign out0_1 = (in0 - out0_0)/10;
assign out1_1 = (in1 - out1_0)/10;
endmodule