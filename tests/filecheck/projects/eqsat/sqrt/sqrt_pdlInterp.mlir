
// result after xdsl-opt -p apply-pdl-interp
// func.func @test(%x : f32) -> f32 {
//     %c1 = arith.constant 1.000000e+00 : f32
//     %add = arith.addf %x, %c1 : f32
//     %sqrt1 = math.sqrt %add : f32
//     %sqrt2 = math.sqrt %x : f32
//     %0 = arith.constant 1.000000e+00 : f32
//     %1 = arith.constant 1.000000e+00 : f32
//     %2 = arith.addf %x, %1 : f32
//     %3 = math.sqrt %2 : f32
//     %4 = math.sqrt %x : f32
//     %5 = arith.addf %3, %4 : f32
//     %res = arith.divf %0, %5 : f32
//     func.return %res : f32
// }

func.func @test(%x : f32) -> (f32) {
    %c1 = arith.constant 1 : f32
    %add = arith.addf %x, %c1 : f32
    %sqrt1 = math.sqrt %add : f32
    %sqrt2 = math.sqrt %x : f32
    %res = arith.subf %sqrt1, %sqrt2 : f32
    func.return %res : f32
}


pdl_interp.func @matcher(%arg0: !pdl.operation) {
  %0 = pdl_interp.get_result 0 of %arg0
  pdl_interp.is_not_null %0 : !pdl.value -> ^bb2, ^bb1
^bb1:  // 42 preds: ^bb0, ^bb2, ^bb3, ^bb4, ^bb5, ^bb6, ^bb7, ^bb8, ^bb9, ^bb10, ^bb11, ^bb12, ^bb13, ^bb14, ^bb15, ^bb16, ^bb17, ^bb18, ^bb19, ^bb20, ^bb21, ^bb22, ^bb23, ^bb24, ^bb25, ^bb26, ^bb27, ^bb28, ^bb29, ^bb30, ^bb31, ^bb32, ^bb33, ^bb34, ^bb35, ^bb36, ^bb37, ^bb38, ^bb39, ^bb40, ^bb41, ^bb42
  pdl_interp.finalize
^bb2:  // pred: ^bb0
  %1 = pdl_interp.get_operand 0 of %arg0
  %2 = pdl_interp.get_defining_op of %1 : !pdl.value
  pdl_interp.is_not_null %2 : !pdl.operation -> ^bb3, ^bb1
^bb3:  // pred: ^bb2
  %3 = pdl_interp.get_operand 1 of %arg0
  %4 = pdl_interp.get_defining_op of %3 : !pdl.value
  pdl_interp.is_not_null %4 : !pdl.operation -> ^bb4, ^bb1
^bb4:  // pred: ^bb3
  %5 = pdl_interp.get_operand 0 of %2
  %6 = pdl_interp.get_defining_op of %5 : !pdl.value
  pdl_interp.is_not_null %6 : !pdl.operation -> ^bb5, ^bb1
^bb5:  // pred: ^bb4
  %7 = pdl_interp.get_operand 1 of %6
  %8 = pdl_interp.get_defining_op of %7 : !pdl.value
  pdl_interp.is_not_null %8 : !pdl.operation -> ^bb6, ^bb1
^bb6:  // pred: ^bb5
  pdl_interp.check_operation_name of %arg0 is "arith.subf" -> ^bb7, ^bb1
^bb7:  // pred: ^bb6
  pdl_interp.check_operand_count of %arg0 is 2 -> ^bb8, ^bb1
^bb8:  // pred: ^bb7
  pdl_interp.check_result_count of %arg0 is 1 -> ^bb9, ^bb1
^bb9:  // pred: ^bb8
  pdl_interp.is_not_null %1 : !pdl.value -> ^bb10, ^bb1
^bb10:  // pred: ^bb9
  pdl_interp.is_not_null %3 : !pdl.value -> ^bb11, ^bb1
^bb11:  // pred: ^bb10
  pdl_interp.check_operation_name of %2 is "math.sqrt" -> ^bb12, ^bb1
^bb12:  // pred: ^bb11
  pdl_interp.check_operation_name of %4 is "math.sqrt" -> ^bb13, ^bb1
^bb13:  // pred: ^bb12
  pdl_interp.check_operand_count of %2 is 1 -> ^bb14, ^bb1
^bb14:  // pred: ^bb13
  pdl_interp.check_operand_count of %4 is 1 -> ^bb15, ^bb1
^bb15:  // pred: ^bb14
  pdl_interp.check_result_count of %2 is 1 -> ^bb16, ^bb1
^bb16:  // pred: ^bb15
  pdl_interp.check_result_count of %4 is 1 -> ^bb17, ^bb1
^bb17:  // pred: ^bb16
  pdl_interp.is_not_null %5 : !pdl.value -> ^bb18, ^bb1
^bb18:  // pred: ^bb17
  %9 = pdl_interp.get_result 0 of %2
  pdl_interp.is_not_null %9 : !pdl.value -> ^bb19, ^bb1
^bb19:  // pred: ^bb18
  %10 = pdl_interp.get_result 0 of %4
  pdl_interp.is_not_null %10 : !pdl.value -> ^bb20, ^bb1
^bb20:  // pred: ^bb19
  pdl_interp.are_equal %9, %1 : !pdl.value -> ^bb21, ^bb1
^bb21:  // pred: ^bb20
  pdl_interp.are_equal %10, %3 : !pdl.value -> ^bb22, ^bb1
^bb22:  // pred: ^bb21
  pdl_interp.check_operation_name of %6 is "arith.addf" -> ^bb23, ^bb1
^bb23:  // pred: ^bb22
  pdl_interp.check_operand_count of %6 is 2 -> ^bb24, ^bb1
^bb24:  // pred: ^bb23
  pdl_interp.check_result_count of %6 is 1 -> ^bb25, ^bb1
^bb25:  // pred: ^bb24
  %11 = pdl_interp.get_operand 0 of %6
  pdl_interp.is_not_null %11 : !pdl.value -> ^bb26, ^bb1
^bb26:  // pred: ^bb25
  pdl_interp.is_not_null %7 : !pdl.value -> ^bb27, ^bb1
^bb27:  // pred: ^bb26
  %12 = pdl_interp.get_operand 0 of %4
  pdl_interp.are_equal %11, %12 : !pdl.value -> ^bb28, ^bb1
^bb28:  // pred: ^bb27
  %13 = pdl_interp.get_result 0 of %6
  pdl_interp.is_not_null %13 : !pdl.value -> ^bb29, ^bb1
^bb29:  // pred: ^bb28
  pdl_interp.are_equal %13, %5 : !pdl.value -> ^bb30, ^bb1
^bb30:  // pred: ^bb29
  %14 = pdl_interp.get_value_type of %11 : !pdl.type
  %15 = pdl_interp.get_value_type of %13 : !pdl.type
  pdl_interp.are_equal %14, %15 : !pdl.type -> ^bb31, ^bb1
^bb31:  // pred: ^bb30
  %16 = pdl_interp.get_value_type of %9 : !pdl.type
  pdl_interp.are_equal %14, %16 : !pdl.type -> ^bb32, ^bb1
^bb32:  // pred: ^bb31
  %17 = pdl_interp.get_value_type of %10 : !pdl.type
  pdl_interp.are_equal %14, %17 : !pdl.type -> ^bb33, ^bb1
^bb33:  // pred: ^bb32
  %18 = pdl_interp.get_value_type of %0 : !pdl.type
  pdl_interp.are_equal %14, %18 : !pdl.type -> ^bb34, ^bb1
^bb34:  // pred: ^bb33
  pdl_interp.check_operation_name of %8 is "arith.constant" -> ^bb35, ^bb1
^bb35:  // pred: ^bb34
  pdl_interp.check_operand_count of %8 is 0 -> ^bb36, ^bb1
^bb36:  // pred: ^bb35
  pdl_interp.check_result_count of %8 is 1 -> ^bb37, ^bb1
^bb37:  // pred: ^bb36
  %19 = pdl_interp.get_attribute "value" of %8
  pdl_interp.is_not_null %19 : !pdl.attribute -> ^bb38, ^bb1
^bb38:  // pred: ^bb37
  pdl_interp.check_attribute %19 is 1.000000e+00 : f32 -> ^bb39, ^bb1
^bb39:  // pred: ^bb38
  %20 = pdl_interp.get_result 0 of %8
  pdl_interp.is_not_null %20 : !pdl.value -> ^bb40, ^bb1
^bb40:  // pred: ^bb39
  pdl_interp.are_equal %20, %7 : !pdl.value -> ^bb41, ^bb1
^bb41:  // pred: ^bb40
  %21 = pdl_interp.get_value_type of %20 : !pdl.type
  pdl_interp.are_equal %21, %14 : !pdl.type -> ^bb42, ^bb1
^bb42:  // pred: ^bb41
  pdl_interp.record_match @rewriters::@pdl_generated_rewriter(%14, %11, %arg0 : !pdl.type, !pdl.value, !pdl.operation) : benefit(2), generatedOps(["arith.constant", "arith.constant", "arith.addf", "math.sqrt", "math.sqrt", "arith.addf", "arith.divf"]), loc([%2, %4, %6, %8, %arg0]), root("arith.subf") -> ^bb1
}
module @rewriters {
  pdl_interp.func @pdl_generated_rewriter(%arg0: !pdl.type, %arg1: !pdl.value, %arg2: !pdl.operation) {
    %0 = pdl_interp.create_attribute 1.000000e+00 : f32
    %1 = pdl_interp.create_operation "arith.constant" {"value" = %0}  -> (%arg0 : !pdl.type)
    %2 = pdl_interp.get_result 0 of %1
    %3 = pdl_interp.create_attribute 1.000000e+00 : f32
    %4 = pdl_interp.create_operation "arith.constant" {"value" = %3}  -> (%arg0 : !pdl.type)
    %5 = pdl_interp.get_result 0 of %4
    %6 = pdl_interp.create_operation "arith.addf"(%arg1, %5 : !pdl.value, !pdl.value)  -> (%arg0 : !pdl.type)
    %7 = pdl_interp.get_result 0 of %6
    %8 = pdl_interp.create_operation "math.sqrt"(%7 : !pdl.value)  -> (%arg0 : !pdl.type)
    %9 = pdl_interp.get_result 0 of %8
    %10 = pdl_interp.create_operation "math.sqrt"(%arg1 : !pdl.value)  -> (%arg0 : !pdl.type)
    %11 = pdl_interp.get_result 0 of %10
    %12 = pdl_interp.create_operation "arith.addf"(%9, %11 : !pdl.value, !pdl.value)  -> (%arg0 : !pdl.type)
    %13 = pdl_interp.get_result 0 of %12
    %14 = pdl_interp.create_operation "arith.divf"(%2, %13 : !pdl.value, !pdl.value)  -> (%arg0 : !pdl.type)
    %15 = pdl_interp.get_result 0 of %14
    pdl_interp.replace %arg2 with (%15 : !pdl.value)
    pdl_interp.finalize
  }
}



// // sqrt(x+1) - sqrt(x) -> 1/(sqrt(x+1) + sqrt(x))
// pdl.pattern @sqrt_minus : benefit(2) {
//   %0 = pdl.type
//   %1 = pdl.operand : %0
//   %2 = pdl.attribute = 1.000000e+00 : f32
//   %3 = pdl.operation "arith.constant" {"value" = %2} -> (%0 : !pdl.type)
//   %4 = pdl.result 0 of %3
//   %5 = pdl.operation "arith.addf" (%1, %4 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//   %6 = pdl.result 0 of %5
//   %7 = pdl.operation "math.sqrt" (%6 : !pdl.value) -> (%0 : !pdl.type)
//   %8 = pdl.result 0 of %7
//   %9 = pdl.operation "math.sqrt" (%1 : !pdl.value) -> (%0 : !pdl.type)
//   %10 = pdl.result 0 of %9
//   %11 = pdl.operation "arith.subf" (%8, %10 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//   %12 = pdl.result 0 of %11
//   pdl.rewrite %11 {
//     %13 = pdl.attribute = 1.000000e+00 : f32
//     %14 = pdl.operation "arith.constant" {"value" = %13} -> (%0 : !pdl.type)
//     %15 = pdl.result 0 of %14
//     %16 = pdl.attribute = 1.000000e+00 : f32
//     %17 = pdl.operation "arith.constant" {"value" = %16} -> (%0 : !pdl.type)
//     %18 = pdl.result 0 of %17
//     %19 = pdl.operation "arith.addf" (%1, %18 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//     %20 = pdl.result 0 of %19
//     %21 = pdl.operation "math.sqrt" (%20 : !pdl.value) -> (%0 : !pdl.type)
//     %22 = pdl.result 0 of %21
//     %23 = pdl.operation "math.sqrt" (%1 : !pdl.value) -> (%0 : !pdl.type)
//     %24 = pdl.result 0 of %23
//     %25 = pdl.operation "arith.addf" (%22, %24 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//     %26 = pdl.result 0 of %25
//     %27 = pdl.operation "arith.divf" (%15, %26 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//     %28 = pdl.result 0 of %27
//     pdl.replace %11 with (%28 : !pdl.value)
//   }
// }
