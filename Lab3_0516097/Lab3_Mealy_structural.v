module Lab3_Mealy_structural (output z, input x, clock, reset);
wire w1, w2, w3, w4;
not(w1,x);
xor(w2, B, x);
or(w3, A_not,x);
and (w4,w1,A_not);
and (z,w1,B_not);

 

JK_ff_AR   M1(B,B_not,w3,w4,clock,reset);
JK_ff_AR   M2(A,A_not,w2,w1,clock,reset);


endmodule 