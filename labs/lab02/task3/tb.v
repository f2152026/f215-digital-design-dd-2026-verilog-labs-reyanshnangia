module tb;

  reg [1:0] t_a;
  reg [1:0] t_b;

  wire t_gt;
  wire t_lt;
  wire t_eq;

  comp2 U1 (
    .A(t_a),
    .B(t_b),
    .GT(t_gt),
    .LT(t_lt),
    .EQ(t_eq)
  );

  integer errors;
  integer total;

  reg exp_gt;
  reg exp_lt;
  reg exp_eq;

  initial begin
    errors = 0;
    total = 0;
  end

  integer a;
  integer b;

  initial begin
    for (a = 0; a < 4; a = a + 1) begin
      for (b = 0; b < 4; b = b + 1) begin

        t_a = a;
        t_b = b;

        #1;

        exp_gt = (a > b);
        exp_lt = (a < b);
        exp_eq = (a == b);

        total = total + 1;

        if ({t_gt, t_lt, t_eq} !== {exp_gt, exp_lt, exp_eq}) begin
          $display("FAIL at time %0t: A=%b B=%b got GT=%b LT=%b EQ=%b expected GT=%b LT=%b EQ=%b",
                   $time, t_a, t_b, t_gt, t_lt, t_eq,
                   exp_gt, exp_lt, exp_eq);
          errors = errors + 1;
        end

      end
    end

        if (errors == 0)
      $display("PASS: %0d/%0d combinations passed", total, total);
    else
      $display("FAIL: %0d/%0d combinations passed, %0d errors",
               total - errors, total, errors);

    $finish;
  end

endmodule