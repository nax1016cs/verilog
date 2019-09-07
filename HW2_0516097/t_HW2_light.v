module t_HW2_light;

reg Clk, Left, Right,Haz;
wire La, Lb,Lc,Ra,Rb,Rc;

 HW2_light G1(Clk, Left, Right, Haz, La, Lb, Lc, Ra, Rb, Rc);
initial #300 $finish;

initial
 begin 
   Clk = 1'b0;
   forever #5 Clk = ~Clk;
end 

initial 
  fork
  {Left, Right,Haz} = 3'b100;
#27
  {Left, Right,Haz} = 3'b010;
#77
  {Left, Right,Haz} = 3'b001;
#127
  {Left, Right,Haz} = 3'b100;
#157
  {Left, Right,Haz} = 3'b001;
#187
  {Left, Right,Haz} = 3'b010;
#217
  {Left, Right,Haz} = 3'b100;
#230
  {Left, Right,Haz} = 3'b001;


   

  join

endmodule 