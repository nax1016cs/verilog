module HW1_add2_structural (output S,V, input X,CLK,CLR);
//module D_flip_flop (output reg Q,output NQ,input  D, Clk, rst);
wire w1, w2, w3, w4, w5, w6, w7,w8,w9;

and (w1, NQ1,Q3 ); //D1

and (w2, NQ2, NQ3);
and (w3, X, NQ1, Q2);
or (w4, w2,w3); //D2

and (w5, Q2,NQ3);
or (w6, w1,w5); //D3

not (w7,X); //~X
and (w8, X, NQ2);
and (w9, w7, Q2); 
or (S,w8,w9);

and (V, X, Q1, Q2); //V

D_flip_flop Dff1 ( Q1, NQ1,  w1, CLK, CLR);
D_flip_flop Dff2 ( Q2, NQ2,  w4, CLK, CLR);
D_flip_flop Dff3 ( Q3, NQ3,  w6, CLK, CLR);

endmodule 