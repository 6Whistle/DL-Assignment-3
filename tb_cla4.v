`timescale 1ns/100ps

module tb_cla4;
	reg [3:0] tb_a, tb_b;
	reg tb_ci;
	wire[3:0] tb_s;
	wire tb_co;
	wire[4:0] tb_result;
	
	assign tb_result = {tb_co, tb_s};
	
	cla4 U0_cla4(tb_s, tb_co, tb_a, tb_b, tb_ci);
	
	initial
	begin
		tb_a = 4'b0000; tb_b = 4'b0000; tb_ci = 0; #10;
		
		//LSB input and G verification 
		tb_a = 4'b0001; tb_b = 4'b0001; tb_ci = 1; #10;		//0001 + 0001 + 1 = 0011
		//LSB P verification
		tb_a = 4'b0000; tb_b = 4'b0001; tb_ci = 1; #10;		//0000 + 0001 + 1 = 0010
		
		
		//Second bit input and G verification 
		tb_a = 4'b0010; tb_b = 4'b0010; tb_ci = 0; #10;		//0010 + 0010 = 0100
		//Second bit P verification
		tb_a = 4'b0011; tb_b = 4'b0001; tb_ci = 0; #10;		//0011 + 0001 = 0100
		tb_a = 4'b0010; tb_b = 4'b0001; tb_ci = 1; #10;		//0010 + 0001 + 1 = 0100
		
		//Third bit input and G verification 
		tb_a = 4'b0100; tb_b = 4'b0100; tb_ci = 0; #10;		//0100 + 0100 = 1000
		//Third bit P verification
		tb_a = 4'b0110; tb_b = 4'b0010; tb_ci = 0; #10;		//0110 + 0010 = 1000
		tb_a = 4'b0101; tb_b = 4'b0011; tb_ci = 0; #10;		//0101 + 0011 = 1000
		tb_a = 4'b0101; tb_b = 4'b0010; tb_ci = 1; #10;		//0101 + 0010 + 1 = 1000
		
		//MSB input and G verification 
		tb_a = 4'b1000; tb_b = 4'b1000; tb_ci = 0; #10;		//1000 + 1000 = 10000
		//MSB P verification
		tb_a = 4'b1100; tb_b = 4'b0100; tb_ci = 0; #10;		//1100 + 0100 = 10000
		tb_a = 4'b1010; tb_b = 4'b0110; tb_ci = 0; #10;		//1010 + 0110 = 10000
		tb_a = 4'b1101; tb_b = 4'b0011; tb_ci = 0; #10;		//1101 + 0011 = 10000
		tb_a = 4'b1100; tb_b = 4'b0011; tb_ci = 1; #10;		//1100 + 0011 + 1 = 10000
		
	
	end
endmodule
