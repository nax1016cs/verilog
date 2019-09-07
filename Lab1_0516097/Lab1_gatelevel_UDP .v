module Lab1_gatelevel_UDP(F,A,B,C,D);
 output F;
 input A,B,C,D;


 Lab1_UDP M0(w4,A,B,C,D);
 not G1(w2,A);
 and G2(w1,B,D);
 or  G3(w3,w2,w1);
 and G4(F,w3,w4);
endmodule 