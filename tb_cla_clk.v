`timescale 1ns/100ps

module tb_cla_clk;
	reg clk;
	reg [31:0] tb_a, tb_b;
	reg tb_ci;
	wire[31:0] tb_s_cla;
	wire tb_co_cla;

	parameter STEP = 10;
	
	cla_clk U0_cla_clk(clk, tb_s_cla, tb_co_cla, tb_a, tb_b, tb_ci);
	
	always # (STEP/2) clk = ~clk;
	
	
	initial
	begin
			clk = 1'b1;	tb_a = 32'h0; tb_b = 32'h0; tb_ci = 1'b0;
			#(STEP-2); tb_a = 32'hFFFF_FFFF; tb_b = 32'h0; tb_ci = 1'b1;			//input before positive edge
			#(STEP); tb_a = 32'h0; tb_b = 32'h0000_FFFF; tb_ci = 1'b1;				//input at positive edge
			#(STEP); tb_a = 32'hFFFF_F000; tb_b = 32'h0000_1000; tb_ci = 1'b0;	//input at positive edge
			#(STEP*2); $stop;
	end
endmodule
