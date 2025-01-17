// Display digits from 0 to 9 on the 7-segment displays, using the SW
// toggle switches as inputs.
module lab (SW, LEDR, HEX1, HEX0);
	input [7:0] SW;
	output [7:0] LEDR;
	output [0:6] HEX1, HEX0;

	assign LEDR = SW;

	// drive the displays through 7-seg decoders
	bcd7seg digit1 (SW[7:4], HEX1);
	bcd7seg digit0 (SW[3:0], HEX0);

endmodule

module bcd7seg (bcd, display);
	input [3:0] bcd;
	output [0:6] display;

	reg [0:6] display;

	/*
	 *       0
	 *      ---
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---
	 *       3
	 */
	always @ (bcd)
		case (bcd)
			4'h0: display = 7'b0000001;
			4'h1: display = 7'b1001111;
			4'h2: display = 7'b0010010;
			4'h3: display = 7'b0000110;
			4'h4: display = 7'b1001100;
			4'h5: display = 7'b0100100;
			4'h6: display = 7'b0100000;
			4'h7: display = 7'b0001111;
			4'h8: display = 7'b0000000;
			4'h9: display = 7'b0000100;
			default: display = 7'b1111111;
		endcase
endmodule