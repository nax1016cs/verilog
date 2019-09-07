module t_HW2_traffic_controller;

reg clk, Sa, Sb;
wire Ra, Rb, Ga, Gb, Ya, Yb;

 HW2_traffic_controller G1(clk, Sa, Sb, Ra, Rb, Ga, Gb, Ya, Yb);
initial #300 $finish;

initial
 begin 
   clk = 1'b0;
   forever #5 clk = ~clk;
end 

initial 
  fork
	Sa=1;
	Sb=0;
   #40  Sa=0;
   #70  Sb=1;
   #100 Sb=0;
   #120 Sb=1;
   #150 Sb=0;
   #170 Sa=1;
   #210 Sb=1;
   #230 Sa=0;
   #250 Sa=1;
   #250 Sb=0;   #270 Sb=1;
   
  join 
 
endmodule 