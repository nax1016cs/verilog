module  JK_ff_AR(Q,Q_not,J,K,clock,reset);
 output Q,Q_not;
 input J,K,clock,reset;
 reg Q;
 assign Q_not = ~Q;
 always@(posedge clock, negedge reset)
  if(reset==0) Q=1'b0;

  else 
        case({J,K})
	2'b00: Q <=Q;
	2'b01: Q <=1'b0;
	2'b10: Q <=1'b1;
	2'b11: Q <=~Q;
	endcase
endmodule
