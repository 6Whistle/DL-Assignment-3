`timescale 1ns/100ps

module tb_rca_clk;
	reg clk;
	reg [31:0] tb_a, tb_b;
	reg tb_ci;
	wire[31:0] tb_s_rca;
	wire tb_co_rca;

	parameter STEP = 10;
	
	rca_clk U0_rca_clk(clk, tb_s_rca, tb_co_rca, tb_a, tb_b, tb_ci);
	
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
