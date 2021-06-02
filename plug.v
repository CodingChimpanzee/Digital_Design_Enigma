module plug(i, clk, O);
	
	input [4:0] i;	 //declare 5bit input
	input clk;	 //declare clock
	output [4:0] O;	//declare 5bit output
	reg [4:0] O;
	integer index;

	always @(posedge clk)
	case(i)	
		5'b00010: O = 5'b00001;	/*b to a*/ 
		5'b01011: O = 5'b01101;	/*k to m*/
		5'b01100: O = 5'b11001;	/*l to y*/
		5'b00101: O = 5'b10101;	/*e to u*/
		5'b01111: O = 5'b10000;	/*o to p*/
		5'b10011: O = 5'b10010;	/*s to r*/
		default: O = i;
	endcase
endmodule




module Enigma_Rotor(i);

// I will import the input


input reg [4:0] i; // For the temporary input

output reg [4:0] t;


reg [4:0] r1 [25:0];
reg [4:0] r2 [25:0];   // each value of rotor

reg [4:0] r=5'd3; // First rotor spin value
reg [4:0] s=5'd7; // Second rotor spin value

reg [25:0] difference = 5'd26;

integer y=0;
integer z=0;    //rotor spin time

integer b=0;
integer p=0;
integer q=0;
integer f=0;
integer g=0; // used in for loop

initial begin

r1[0] = 5'd10 + r;
r1[1] = 5'd7 + r;
r1[2] = 5'd4 + r;
r1[3] = 5'd17 + r;
r1[4] = 5'd15 + r;
r1[5] = 5'd24 + r ;
r1[6] = 5'd21 + r;
r1[7] = 5'd19 + r;
r1[8] = 5'd3 + r;
r1[9] = 5'd1 + r;
r1[10] = 5'd13 + r;
r1[11] = 5'd9 + r;
r1[12] = 5'd6 + r;
r1[13] = 5'd18 + r;
r1[14] = 5'd22 + r;
r1[15] = 5'd20 + r;
r1[16] = 5'd16 + r;
r1[17] = 5'd14 + r;
r1[18] = 5'd5 + r;
r1[19] = 5'd23 + r;
r1[20] = 5'd11 + r;
r1[21] = 5'd2 + r;
r1[22] = 5'd12 + r;
r1[23] = 5'd26 + r; 
r1[24] = 5'd25 + r; 
r1[25] = 5'd8 + r;


for(b=0; b<25; b=b+1) begin
if(r1[b]>difference)
r1[b] = r1[b] - difference;
end

// ??? ??? ?? r[1] = 'c' ? a->c? ????? ????



r2[0] = 5'd14 + s;
r2[1] = 5'd20 + s;
r2[2] = 5'd26 + s;
r2[3] = 5'd16 + s;
r2[4] = 5'd19 + s;
r2[5] = 5'd6 +s;
r2[6] = 5'd2 + s;
r2[7] = 5'd15 + s;
r2[8] = 5'd11 + s;
r2[9] = 5'd13 + s;
r2[10] = 5'd23 + s;
r2[11] = 5'd18 + s;
r2[12] = 5'd3 + s;
r2[13] = 5'd10 + s;
r2[14] = 5'd4 + s;
r2[15] = 5'd9 + s;
r2[16] = 5'd22 + s;
r2[17] = 5'd12 + s;
r2[18] = 5'd1 + s;
r2[19] = 5'd5 + s;
r2[20] = 5'd25 + s;
r2[21] = 5'd21 + s;
r2[22] = 5'd24 + s;
r2[23] = 5'd8 + s;
r2[24] = 5'd7 + s;
r2[25] = 5'd17 + s;


   for(b=0; b<25; b=b+1) begin
   if(r2[b]>difference)
   r2[b] = r2[b] - difference;
   end


// r1, r2? ??? ?? ??????, ?? input? ?? ???.


   for(b=0; b<50; b=b+1) begin
   
   for(p=0; p<25; p=p+1) begin
   if(i==p)
   i = r1[p];
   y=y+1;                // y? ?? ???? ??? ??, ? ?? ?? ??
   end

   for(q=0; q<25; q=q+1) begin
   if(i==q)
   i = r2[q];
   end                // ? ?? ?? ??
   
   for(f=0; f<24; f=f+1) begin
   r1[f] = r1[f+1];
   end
   
   r1[25] = r1[0];      // ??? ? ?? ??? ???? ?? ???
   
   if(y==25)
   z=1;

   if(z==1)
   for(g=0; g<24; g=g+1) begin
   r2[g] = r2[g+1];
   end

   if(z==1)
   r2[25] = r2[0];

   end

 end


endmodule


module reflector(out,r,clk);
input r,clk;  
output reg out;
always@(posedge clk)
if(r>13)
out=r-13;
else
out=r+13;

endmodule

module tb_reflector;
reg t_r,t_clk;
wire t_out;
always #5 t_clk = ~t_clk;
reflector R1(t_out,t_r,t_clk);
initial begin
 t_r=1; 
#10 t_r=2; 
#10 t_r=3; 
#10 t_r=20; 
#10 t_r=21; 
$finish;
end
initial begin
$monitor("t_out = %d t_r = %d",t_out,t_r);
end

endmodule
