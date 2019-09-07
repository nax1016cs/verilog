module Lab3_SR_Latch_gatelevel(output Q, NQ, input S, R);
nor #(2) (Q,R,NQ);
nor #(2) (NQ,S,Q);

endmodule 