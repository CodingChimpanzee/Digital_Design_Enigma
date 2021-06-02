
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

