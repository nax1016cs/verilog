module HW2_scanner_modified (R0, R1, R2, R3, CLK, C0, C1, C2, N0, N1, N2, N3, V);
input R0;
input R1;
input R2;
input R3;
input CLK;
inout C0;
inout C1;
inout C2;
output N0;
output N1;
output N2;
output N3;
output V;
reg V;
reg C0_tmp, C1_tmp, C2_tmp;
reg QA;
wire K;
reg Kd;
reg [2:0] state;
reg [2:0] nextstate;

assign C0 = C0_tmp;
assign C1 = C1_tmp;
assign C2 = C2_tmp;
assign K = R0 | R1 | R2 | R3 ;
assign N3 = (R2 & ~C0) | (R3 & ~C1) ;
assign N2 = R1 | (R2 & C0) ;
assign N1 = (R0 & ~C0) | (~R2 & C2) | (~R1 & ~R0 & C0) ;
assign N0 = (R1 & C1) | (~R1 & C2) | (~R3 & ~R1 & ~C1) ;

initial
  begin
   state = 1;
   nextstate = 1;
   end
always @(state, R0, R1, R2, R3, C0, C1, C2, K, Kd, QA)
  begin
	C0_tmp = 1'b0 ;
	C1_tmp = 1'b0 ;
	C2_tmp = 1'b0 ;
	V = 1'b0 ;
	case (state)
	  1 :
		begin	
			C0_tmp = 1'b1 ;
			C1_tmp = 1'b1 ;
			C2_tmp = 1'b1 ;
			if ((Kd & K) == 1'b1)
				nextstate = 2 ;
			else
				nextstate = 1 ;
		end
	 2 :
		begin
			C0_tmp = 1'b1 ;
			if ((Kd & K) == 1'b1)
				begin
					V = 1'b1 ;
					nextstate = 5 ;
				end
			else if (K == 1'b0)
				nextstate = 3 ;
			else
				nextstate = 2 ;
		end
	3 :
		begin
			C1_tmp = 1'b1 ;
			if ((Kd & K) == 1'b1)
				begin
					V = 1'b1 ;
					nextstate = 5 ;
				end
			else if (K == 1'b0)
				nextstate = 4 ;
			else
				nextstate = 3 ;
		end
	  4 :
		begin
			C2_tmp <= 1'b1 ;
			if ((Kd & K) == 1'b1)
				begin
				V <= 1'b1 ;
				nextstate = 5 ;
				end
			else
				nextstate = 4 ;
		end
	  5 :
		begin
			C0_tmp = 1'b1 ;
			C1_tmp = 1'b1 ;
			C2_tmp = 1'b1 ;
			if (Kd == 1'b0)
				nextstate = 1 ;
			else
				nextstate = 5 ;
			end
		endcase
	end
always @(posedge CLK)
	begin
		state <= nextstate ;
		QA <= K ;
		Kd <= QA ;
	end
endmodule
