module Lab3_Neg_Edge_D_FF_gatelevel(output Q, NQ, input D, clock);
wire w1, w2, w3, w4;



	nor #(2) (w1,w4,w2);
	nor #(2) (w2,w1,clock);
	nor #(2) (w3,w4,w2,clock);
	nor #(2) (w4,w3,D);
	Lab3_SR_Latch_gatelevel M1( Q, NQ,  w3, w2);
endmodule 