module and_df (
  input a,
  input b,
  output wire y
);

  assign #2 y = a & b;

endmodule