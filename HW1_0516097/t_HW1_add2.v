module t_HW1_add2;


wire S1,V1,S2,V2,S3,V3;
reg X,CLK,CLR;

HW1_add2_behavioral G1( S1, V1, X, CLK, CLR);
HW1_add2_dataflow   G2( S2, V2, X, CLK, CLR);
HW1_add2_structural G3( S3, V3, X, CLK, CLR);
//1011 0111 1110 1000
initial #345 $finish ;
initial 
  begin 
        CLK = 1;
    forever #10 CLK = ~CLK;
  end 

initial 
  fork 
    	CLR = 1;
  #22   CLR = 0;
  #23   CLR = 1;
  #25   X = 1;
  #45   X = 0;
  #65   X = 1;
  #85   X = 1;

  #105   X = 0;
 #125   X = 1;
 #145   X = 1;
 #165   X = 1;

 #185   X = 1;
 #205   X = 1;
 #225   X = 1;
 #245   X = 0;

 #265   X = 1;
 #285   X = 0;
 #305   X = 0;
 #325   X = 0;


  join 
endmodule 
