module HW1_comb_gatelevel(Z,A,B,C,D);

    output Z;
    input A,B,C,D;

    wire w1, w2, w3, w4;

	and   #(5)  (w1,A,B,C);
	or    #(5)  (w2, w1, D);
	nor   #(5)  (w4, B, C);
	nand  #(5)  (w3, A , w4);
	not   #(2)  (w5,w3);
	xor   #(5)  (Z, w2, w5);
endmodule 