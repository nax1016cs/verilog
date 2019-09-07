module t_HW1_comb;

  wire Z1,Z2; 
  reg A, B, C, D;
  HW1_comb_gatelevel G1(Z1,A,B,C,D);
  HW1_comb_dataflow  G2(Z2,A,B,C,D);  
initial 
  begin 
       A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b0;
   #100 A = 1'b0; B = 1'b0; C = 1'b0; D = 1'b1;
   #100 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b0;
   #100 A = 1'b0; B = 1'b0; C = 1'b1; D = 1'b1;
   #100 A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b0;
   #100 A = 1'b0; B = 1'b1; C = 1'b0; D = 1'b1;
   #100 A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b0;
   #100 A = 1'b0; B = 1'b1; C = 1'b1; D = 1'b1;
   #100 A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b0;
   #100 A = 1'b1; B = 1'b0; C = 1'b0; D = 1'b1;
   #100 A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b0;
   #100 A = 1'b1; B = 1'b0; C = 1'b1; D = 1'b1;
   #100 A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b0;
   #100 A = 1'b1; B = 1'b1; C = 1'b0; D = 1'b1;
   #100 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b0;
   #100 A = 1'b1; B = 1'b1; C = 1'b1; D = 1'b1;
  end 
  initial #1600 $finish;
endmodule 