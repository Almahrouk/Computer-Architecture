module MUX(out, A, B, S);
output out;
input A, B, S;

wire I1, I2, I3;
and G1(I2, A, S);
and G3(I3, I1, B);
not G2(I1, S);
or G4(out, I2, I3);


endmodule