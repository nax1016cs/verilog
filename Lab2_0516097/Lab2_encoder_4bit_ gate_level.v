module  Lab2_encoder_4bit_gate_level (output [1:0] Aout, output V, input [3:0] D);

wire w1, w2, w3, w4,w5;
not(w1,D[0]);
not(w2,D[1]);
and(Aout[1],w1,w2);
and(w4,w1,D[1]);
not(w3,D[2]);
and(w5,w3,w1);
or(Aout[0],w4,w5);
endmodule 