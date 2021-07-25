module traffic_light_control(
    input x,clk,reset,
	 output reg walk,halt,red,yellow,green
    );
parameter s0=2'b00;
parameter s1=2'b01;
parameter s2=2'b10;
parameter s3=2'b11;

reg [1:0]p_s;
reg [1:0]n_s;

always@(posedge reset,posedge clk)
begin
if(reset)
begin
p_s<=s0;
red<=0;
yellow<=0;
green<=0;
halt<=0;
walk<=0;
end
else
begin
p_s<=n_s;
end
end
always@(p_s,x)
begin
case(p_s)
s0: 
if(x==0 || x==1)
begin
red<=0;
yellow<=0;
green<=1;
halt<=1;
walk<=0;
n_s<=s1;
end
s1: 
if(x)
begin
red<=0;
yellow<=1;
green<=0;
halt<=1;
walk<=0;
n_s<=s2;
end
else
begin
red<=0;
yellow<=0;
green<=1;
halt<=1;
walk<=0;
n_s<=s0;
end
s2: 
begin
red<=1;
yellow<=0;
green<=0;
halt<=0;
walk<=1;
n_s<=s3;
end
s3: 
begin
red<=0;
yellow<=1;
green<=0;
halt<=1;
walk<=0;
n_s<=s0;
end
endcase
end
endmodule

