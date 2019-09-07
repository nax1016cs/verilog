module HW1_comb_dataflow(Z,A,B,C,D);

  output Z;
  input A,B,C,D;

 assign #5 w1 = A & B & C;
 assign #5 w2 = w1 | D;
 assign #5 w4 = ~(B | C);
 assign #5 w3 = ~(A & w4);
 assign #2 w5 = ~w3;
 assign #5 Z = w2 ^ w5;

endmodule 
