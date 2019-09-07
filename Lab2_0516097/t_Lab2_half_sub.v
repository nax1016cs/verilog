module t_Lab2_half_sub;
 wire D,B;
 reg x,y;

Lab2_half_sub_behavior M1( D, B,  x, y);
Lab2_half_sub_gate_level M2(D, B,  x, y);
Lab2_half_sub_dataflow M3( D, B,  x, y);

initial begin 
 	 x = 1'b0; y = 1'b0; 
    #100 x = 1'b0; y = 1'b1; 
    #100 x = 1'b1; y = 1'b0; 
    #100 x = 1'b1; y = 1'b1;
  end
  initial #400 $finish;
endmodule 

