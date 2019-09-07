module t_Lab3_Mealy;
 wire z;
 reg  x,clock,reset;
 Lab3_Mealy_structural S1( z,  x, clock, reset);
 Lab3_Mealy_state_diagram S2( z,  x, clock, reset);
initial #100 $finish;
initial
 begin 
   clock = 1'b0;
   forever #5 clock = ~clock;
end 
initial 
 fork
    reset=1'b0;
    x=1'b1;
 #2 reset=1'b1;
 #4  x=1'b0;
 #12 x=1'b1;
 #22 x=1'b0;
 #32 x=1'b1;
 #42 x=1'b1;
 #52 x=1'b0;
 #62 x=1'b0;
 #72 x=1'b0;
 #82 x=1'b1;


 join

endmodule 