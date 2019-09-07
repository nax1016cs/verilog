module Lab1_gatelevel (F,A,B,C,D);

 output F;
 input A,B,C,D;

 wire w1,w2,w3,w4,w5,w6,w7;

 and  G1(w1,A,B);
 not  G2(w2,D);
 and  G3(w3,C,w2);
 not  G4(w4,A);
 and  G5(w5,B,D);
 or   G6(w7,w4,w5);
 and  G7(F,w6,w7);
 or   G8(w6,w1,w3);
endmodule 