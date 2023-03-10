module top(
    input CLK,

    output DS_EN1, DS_EN2, DS_EN3, DS_EN4,
    output DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G
);

wire [3:0]anodes;
assign {DS_EN1, DS_EN2, DS_EN3, DS_EN4} = ~anodes;

wire [6:0]segments;
assign {DS_A, DS_B, DS_C, DS_D, DS_E, DS_F, DS_G} = segments;

wire [15:0]data; /* Data bus */
wire clk1, clk2; /* Clocks */


clk_div clk_div_1(.clk(CLK), .clk_out(clk1));

clk_div clk_div_2(.clk(CLK), .clk_out(clk2));
counter counter(.clk(clk2), .q(data));

hex_display disp(.clk(clk1), .data(data), .anodes(anodes), .segments(segments));

endmodule
