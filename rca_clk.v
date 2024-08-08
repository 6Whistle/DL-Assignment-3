module rca_clk(clk, s, co, a, b, ci);
	input	clk;
	input [31:0] a, b;
	input ci;
	output [31:0] s;
	output co;
	
	reg [31:0] reg_a, reg_b;
	reg reg_ci;
	reg [31:0] reg_s;
	reg reg_co;
	
	wire [31:0] wire_s;
	wire wire_co;
	
	always @ (posedge clk)		//always active at positive edge
	begin
	
	//input and output registor connect
	reg_a <= a;				
	reg_b <= b;
	reg_ci <= ci;
	reg_s <= wire_s;
	reg_co <= wire_co;
	
	end
	
	rca32 U0_rca32(wire_s, wire_co, reg_a, reg_b, reg_ci);
	
	assign s = reg_s;
	assign co = reg_co;
endmodule

