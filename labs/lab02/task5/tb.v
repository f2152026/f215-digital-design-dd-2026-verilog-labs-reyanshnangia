module tb;

  reg [3:0] t_a;
  reg [3:0] t_b;
  reg       t_op;

  wire [3:0] t_result;

  alu U1 (
    .a      (t_a),
    .b      (t_b),
    .op     (t_op),
    .result (t_result)
  );

  integer errors;

  initial begin
    errors = 0;

    // -------------------------
    // Test 1: Addition
    // -------------------------
    t_a = 4'd5;
    t_b = 4'd3;
    t_op = 1'b0;
    #1;
    

    if (t_result !== 4'd8) begin
      $display("FAIL: ADD 5 + 3 | got %d, expected 8", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: ADD 5 + 3 | result = %d", t_result);
    end

    // -------------------------
    // Test 2: Change ONLY op
    // This tests the sensitivity list.
    // Expected: 5 - 3 = 2
    // -------------------------
    t_op = 1'b1;
    #1;

    if (t_result !== 4'd2) begin
      $display("FAIL: SUB 5 - 3 | got %d, expected 2", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB 5 - 3 | result = %d", t_result);
    end

    // -------------------------
    // Test 3: Another subtraction
    // Expected: 9 - 4 = 5
    // -------------------------
    t_a = 4'd9;
    t_b = 4'd4;
    #1;

    if (t_result !== 4'd5) begin
      $display("FAIL: SUB 9 - 4 | got %d, expected 5", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB 9 - 4 | result = %d", t_result);
    end

    // -------------------------
    // Test 4: Another subtraction
    // Expected: 12 - 5 = 7
    // -------------------------
    t_a = 4'd12;
    t_b = 4'd5;
    #1;

    if (t_result !== 4'd7) begin
      $display("FAIL: SUB 12 - 5 | got %d, expected 7", t_result);
      errors = errors + 1;
    end
    else begin
      $display("PASS: SUB 12 - 5 | result = %d", t_result);
    end

    // -------------------------
    // Final result
    // -------------------------
    if (errors == 0)
      $display("PASS: All tests passed");
    else
      $display("FAIL: %0d test(s) failed", errors);

    $finish;
  end

endmodule