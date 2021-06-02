module re_rotor(I2, O2, clk);
input [4:0] I2;   //input 5bit number
output reg [4:0] O2;   //output 5bit number
integer t;   //integer of input
integer indexOfR1 = 3;   //initial setting of rotor 1
integer indexOfR2 = 7;   //initial setting of rotor 2
integer i, j, k; //integer used in for loop
input clk;


//first rotor
reg [4:0] r1 [26:0];   
initial begin
r1[0] = 5'd30;   //for temporary register
r1[1] = 5'd10;
r1[2] = 5'd7;
r1[3] = 5'd4;
r1[4] = 5'd17;
r1[5] = 5'd15;
r1[6] = 5'd24;
r1[7] = 5'd21;
r1[8] = 5'd19;
r1[9] = 5'd3;
r1[10] = 5'd1;
r1[11] = 5'd13;
r1[12] = 5'd9;
r1[13] = 5'd6;
r1[14] = 5'd18;
r1[15] = 5'd22;
r1[16] = 5'd20;
r1[17] = 5'd16;
r1[18] = 5'd14;
r1[19] = 5'd5;
r1[20] = 5'd23;
r1[21] = 5'd11;
r1[22] = 5'd2;
r1[23] = 5'd12;
r1[24] = 5'd26; 
r1[25] = 5'd25; 
r1[26] = 5'd8;


//set rotor 1 by the given index
for(j=0; j<indexOfR1; j=j+1) begin   //rotate index time
for(i=0; i<26; i=i+1) begin   //rotate 1 time
r1[i] = r1[i+1];
end
r1[26] = r1[0];
end
end

// second rotor
reg [4:0] r2 [26:0];  
initial begin
r2[0] = 5'd30; //for temporary register
r2[1] = 5'd14;
r2[2] = 5'd20;
r2[3] = 5'd26;
r2[4] = 5'd16;
r2[5] = 5'd19;
r2[6] = 5'd6;
r2[7] = 5'd2;
r2[8] = 5'd15;
r2[9] = 5'd11;
r2[10] = 5'd13;
r2[11] = 5'd23;
r2[12] = 5'd18;
r2[13] = 5'd3;
r2[14] = 5'd10;
r2[15] = 5'd4;
r2[16] = 5'd9;
r2[17] = 5'd22;
r2[18] = 5'd12;
r2[19] = 5'd1;
r2[20] = 5'd5;
r2[21] = 5'd25;
r2[22] = 5'd21;
r2[23] = 5'd24;
r2[24] = 5'd8;
r2[25] = 5'd7;
r2[26] = 5'd17;

//set rotor 2 by the given index
for(j=0; j<indexOfR2; j=j+1) begin   //rotate index time
for(i=0; i<26; i=i+1) begin   //rotate 1 time
r2[i] = r2[i+1];
end
r2[26] = r2[0];
end
end


always @(clk) begin
t = I2;   //save input to a integer


for(i=1; i<=26; i=i+1) begin
if(t == r2[i])
j = i;
end //save output from rotor 1 to a integer


for(k=1; k<=26; k=k+1) begin
if(j == r1[k])
i = k; 
end

O2 = i;   //ouput from rotor 2
//end

//rotate 1 time
//always @(I2) begin
for(i=0; i<26; i=i+1) begin   
r1[i] = r1[i+1]; 
end
r1[26] = r1[0];
end

endmodule
