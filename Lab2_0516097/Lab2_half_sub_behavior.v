module Lab2_half_sub_behavior(output D, B, input x, y);
always @(D,B,x,y);
  begin 
	assign D = (!x)&&y || x&&(!y);
	assign B = (!x)&&y;
  end 
endmodule 