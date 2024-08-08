`timescale 1ns/100ps

module tb_cla32;
	reg [31:0] tb_a, tb_b;
	reg tb_ci;
	wire[31:0] tb_s;
	wire tb_co;
	wire[32:0] tb_result;
	
	assign tb_result = {tb_co, tb_s};
	
	cla32 U0_cla32(tb_s, tb_co, tb_a, tb_b, tb_ci);
	
	initial
	begin
		tb_a = 32'h0; tb_b = 32'h0; tb_ci = 0; #10;
		
		//1~4 bit input and carry verification
		tb_a = 32'h0000_0001; tb_b = 32'h0000_0001; tb_ci = 1; #10;
		tb_a = 32'h0000_000F; tb_b = 32'h0000_0001; tb_ci = 0; #10;
		
		//5~8 bit input and carry verification
		tb_a = 32'h0000_00F0; tb_b = 32'h0000_0010; tb_ci = 0; #10;
		
		//9~12 bit input and carry verification
		tb_a = 32'h0000_0F00; tb_b = 32'h0000_0100; tb_ci = 0; #10;
		
		//13~16 bit input and carry verification
		tb_a = 32'h0000_F000; tb_b = 32'h0000_1000; tb_ci = 0; #10;
		
		//17~20 bit input and carry verification
		tb_a = 32'h000F_0000; tb_b = 32'h0001_0000; tb_ci = 0; #10;
		
		//21~24 bit input and carry verification
		tb_a = 32'h00F0_0000; tb_b = 32'h0010_0000; tb_ci = 0; #10;

		//25~28 bit input and carry verification
		tb_a = 32'h0F00_0000; tb_b = 32'h0100_0000; tb_ci = 0; #10;
		
		//29~32 bit input and carry verification
		tb_a = 32'hF000_0000; tb_b = 32'h1000_0000; tb_ci = 0; #10;
		
	
	end
endmodule
