module HW2_traffic_controller(clk, Sa, Sb, Ra, Rb, Ga, Gb, Ya, Yb);

input clk, Sa, Sb;
output Ra, Rb, Ga, Gb, Ya, Yb;
reg Ra_temp, Rb_temp, Ga_temp, Gb_temp, Ya_temp, Yb_temp;
reg [3:0] counter;

assign Ra = Ra_temp;
assign Rb = Rb_temp;
assign Ga = Ga_temp;
assign Gb = Gb_temp;
assign Ya = Ya_temp;
assign Yb = Yb_temp;

parameter [1:0] R = 0;
parameter [1:0] Y = 1;
parameter [1:0] G = 2;

wire [1:0] lightA;
wire [1:0] lightB;

initial
  begin
   counter=0;
  end 

always @(counter ) 
	begin 
 		Ra_temp = 0;
  		Rb_temp = 0;
  		Ga_temp = 0;
  		Gb_temp = 0;
  		Ya_temp = 0;
  		Yb_temp = 0;
  		counter = 0;

 		case (counter)

  			 0,1,2,3,4,5:
   				begin 
   					 Ga_temp =1;
   					 Rb_temp =1;
   				end

   			6: 
   				begin 
    					 Ya_temp = 1;
    					 Rb_temp = 1;
   				end  

  			 7,8,9,10,11:
  				 begin 
     					Ra_temp = 1;
     					Gb_temp = 1;
   				end 

   			12:
 				  begin 
   					 Ra_temp = 1;
    					Gb_temp = 1;  
   				end

  		endcase
	end

always @(Sa,Sb, posedge clk)
  	if( !((counter==5 && Sb==0) || (counter==11 && Sa==0 && Sb==1)))
  		begin 
   			 counter = counter +1;
   			 counter = counter %13;
  		end 

assign lightA = (Ra == 1) ? R : (Ya == 1) ? Y : (Ga == 1) ? G : lightA;
assign lightB = (Rb == 1) ? R : (Yb == 1) ? Y : (Gb == 1) ? G : lightB;

endmodule 