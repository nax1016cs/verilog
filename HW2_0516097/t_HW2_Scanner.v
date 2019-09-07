module t_HW2_Scanner ();
integer KARRAY[0:23];
wire C0;
wire C1;
wire C2;
wire V;
reg CLK;
wire R0;
wire R1;
wire R2;
wire R3;
wire [3:0] N;
integer KN;
integer i;
initial
  begin
    CLK = 0;
	KARRAY[0] = 2;
	KARRAY[1] = 5;
	KARRAY[2] = 8;
	KARRAY[3] = 0;
	KARRAY[4] = 3;
	KARRAY[5] = 6;
	KARRAY[6] = 9;
	KARRAY[7] = 11;
	KARRAY[8] = 1;
	KARRAY[9] = 4;
	KARRAY[10] = 7;
	KARRAY[11] = 10;
	KARRAY[12] = 1;
	KARRAY[13] = 2;
	KARRAY[14] = 3;
	KARRAY[15] = 4;
	KARRAY[16] = 5;
	KARRAY[17] = 6;
	KARRAY[18] = 7;
	KARRAY[19] = 8;
	KARRAY[20] = 9;
	KARRAY[21] = 10;
	KARRAY[22] = 11;
	KARRAY[23] = 0;
 end
 always #20 CLK = ~CLK ;
  assign R0 = ((C0 == 1'b1 & KN == 1) | (C1 == 1'b1 & KN == 2) | (C2 == 1'b1 & KN == 3)) ? 1'b1 : 1'b0 ;
  assign R1 = ((C0 == 1'b1 & KN == 4) | (C1 == 1'b1 & KN == 5) | (C2 == 1'b1 & KN == 6)) ? 1'b1 : 1'b0 ;
  assign R2 = ((C0 == 1'b1 & KN == 7) | (C1 == 1'b1 & KN == 8) | (C2 == 1'b1 & KN == 9)) ? 1'b1 : 1'b0 ;
  assign R3 = ((C0 == 1'b1 & KN == 10) | (C1 == 1'b1 & KN == 0) | (C2 == 1'b1 & KN == 11)) ? 1'b1 : 1'b0 ;
 always @(posedge CLK)
    begin
	for(i = 0; i <= 23; i = i + 1)
	  begin
	    KN <= KARRAY[i] ;
		@(posedge CLK);
		if (V == 1'b1)
		if (~(N == KN)) $display("Numbers don't match.");
		KN <= 15 ;
		@(posedge CLK);
		@(posedge CLK);
		@(posedge CLK);
	end
	$display("Test Complete.");
   end
  HW2_scanner_modified G1(R0, R1, R2, R3, CLK, C0, C1, C2, N[0], N[1], N[2], N[3], V);
endmodule
