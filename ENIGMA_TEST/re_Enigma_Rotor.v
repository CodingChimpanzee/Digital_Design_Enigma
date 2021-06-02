module re_Enigma_Rotor(I2, T, y);
// I will import the input
// $dumpvars(i, Enigma_Plug);

input [4:0] I2; // For the temporary input
output reg [4:0] T;
integer t; // integer for mege - variable

reg [4:0] r1 [25:0];	//first rotor
reg [4:0] r2 [25:0];   // second rotor

reg [4:0] r=5'd3; // First rotor spin value
reg [4:0] s=5'd7; // Second rotor spin value

reg [25:0] difference = 5'd26;

input y;    //number of first rotor spins
integer z=0;    //number of second rotor spins

integer b=0;
integer p=0;
integer q=0;
integer f=0;
integer g=0; // used in for loop

initial begin

   for(f=0; f<24; f=f+1) begin
   r1[f] = r1[f+y];
   end
   
   if(y!=5'd0)
   r1[25] = r1[0+y];     
 
   if(y==5'd25)
   z=1;

   if(z==1)
   for(g=0; g<24; g=g+1) begin
   r2[g] = r2[g+1];	//rotate once of rotor 2
   end

   if(z==1)
   r2[25] = r2[0];

end

initial begin
assign T = I2;
r1[0] = 5'd10 + r;
r1[1] = 5'd7 + r;
r1[2] = 5'd4 + r;
r1[3] = 5'd17 + r;
r1[4] = 5'd15 + r;
r1[5] = 5'd24 + r;
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
if(r1[b]>difference)	r1[b] = r1[b] - difference; //rotor1 vlaue setting
end



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
  if(r2[b]>difference)  r2[b] = r2[b] - difference; 	//rotor2 value setting
  end

end                                   // This place will be go only one time

initial begin
   
   for(p=0; p<25; p=p+1) begin
   if(r2[p]===T)
   t = p;	//save new value from rotor 1
   end

   for(q=0; q<25; q=q+1) begin
   if(r1[q]===t[4:0])
   t = q;	//save new value from rotor 2
   end           
   
	case(t)
	0: T = 5'd0;
	1: T = 5'd1;
	2: T = 5'd2;
	3: T = 5'd3;
	4: T = 5'd4;
	5: T = 5'd5;
	6: T = 5'd6;
	7: T = 5'd7;
	8: T = 5'd8;
	9: T = 5'd9;
	10: T = 5'd10;
	11: T = 5'd11;
	12: T = 5'd12;
	13: T = 5'd13;
	14: T = 5'd14;
	15: T = 5'd15;
	16: T = 5'd16;
	17: T = 5'd17;
	18: T = 5'd18;
	19: T = 5'd19;
	20: T = 5'd20;
	21: T = 5'd21;
	22: T = 5'd22;
	23: T = 5'd23;
	24: T = 5'd24;
	default: T = 5'd25;
	endcase

b=0;
p=0;
q=0;
f=0;
g=0;

end


endmodule

