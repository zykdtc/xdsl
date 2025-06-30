

func.func @test(%x : f32, %y : f32) -> (f32) {
    %c1 = arith.constant 1 : f32
    %add = arith.addf %x, %c1 : f32
    %add2 = arith.addf %add, %y : f32
    func.return %add2 : f32
}

// // (x+1) + y -> y + x only for test purposes
// pdl.pattern @commutativity : benefit(2) {
//   %0 = pdl.type 
//   %1 = pdl.operand : %0
//   %2 = pdl.operand : %0
//   %3 = pdl.attribute = 1.000000e+00 : f32
//   %4 = pdl.operation "arith.constant" {"value" = %3} -> (%0 : !pdl.type)
//   %5 = pdl.result 0 of %4
//   %6 = pdl.operation "arith.addf" (%1, %5 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//   %7 = pdl.result 0 of %6
//   %8 = pdl.operation "arith.addf" (%7, %2 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//   %9 = pdl.result 0 of %8
//   pdl.rewrite %8 {
//     %10 = pdl.operation "arith.addf" (%2, %1 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
//     %11 = pdl.result 0 of %10
//     pdl.replace %8 with (%11 : !pdl.value)
//   }
// }


pdl_interp.func @matcher(%arg0: !pdl.operation) {
%0 = pdl_interp.get_result 0 of %arg0
pdl_interp.is_not_null %0 : !pdl.value -> ^bb2, ^bb1
^bb1:  // 27 preds: ^bb0, ^bb2, ^bb3, ^bb4, ^bb5, ^bb6, ^bb7, ^bb8, ^bb9, ^bb10, ^bb11, ^bb12, ^bb13, ^bb14, ^bb15, ^bb16, ^bb17, ^bb18, ^bb19, ^bb20, ^bb21, ^bb22, ^bb23, ^bb24, ^bb25, ^bb26, ^bb27
pdl_interp.finalize
^bb2:  // pred: ^bb0
%1 = pdl_interp.get_operand 0 of %arg0
%2 = pdl_interp.get_defining_op of %1 : !pdl.value
pdl_interp.is_not_null %2 : !pdl.operation -> ^bb3, ^bb1
^bb3:  // pred: ^bb2
%3 = pdl_interp.get_operand 1 of %2
%4 = pdl_interp.get_defining_op of %3 : !pdl.value
pdl_interp.is_not_null %4 : !pdl.operation -> ^bb4, ^bb1
^bb4:  // pred: ^bb3
pdl_interp.check_operation_name of %arg0 is "arith.addf" -> ^bb5, ^bb1
^bb5:  // pred: ^bb4
pdl_interp.check_operand_count of %arg0 is 2 -> ^bb6, ^bb1
^bb6:  // pred: ^bb5
pdl_interp.check_result_count of %arg0 is 1 -> ^bb7, ^bb1
^bb7:  // pred: ^bb6
pdl_interp.is_not_null %1 : !pdl.value -> ^bb8, ^bb1
^bb8:  // pred: ^bb7
%5 = pdl_interp.get_operand 1 of %arg0
pdl_interp.is_not_null %5 : !pdl.value -> ^bb9, ^bb1
^bb9:  // pred: ^bb8
pdl_interp.check_operation_name of %2 is "arith.addf" -> ^bb10, ^bb1
^bb10:  // pred: ^bb9
pdl_interp.check_operand_count of %2 is 2 -> ^bb11, ^bb1
^bb11:  // pred: ^bb10
pdl_interp.check_result_count of %2 is 1 -> ^bb12, ^bb1
^bb12:  // pred: ^bb11
%6 = pdl_interp.get_operand 0 of %2
pdl_interp.is_not_null %6 : !pdl.value -> ^bb13, ^bb1
^bb13:  // pred: ^bb12
pdl_interp.is_not_null %3 : !pdl.value -> ^bb14, ^bb1
^bb14:  // pred: ^bb13
%7 = pdl_interp.get_result 0 of %2
pdl_interp.is_not_null %7 : !pdl.value -> ^bb15, ^bb1
^bb15:  // pred: ^bb14
pdl_interp.are_equal %7, %1 : !pdl.value -> ^bb16, ^bb1
^bb16:  // pred: ^bb15
%8 = pdl_interp.get_value_type of %6 : !pdl.type
%9 = pdl_interp.get_value_type of %7 : !pdl.type
pdl_interp.are_equal %8, %9 : !pdl.type -> ^bb17, ^bb1
^bb17:  // pred: ^bb16
%10 = pdl_interp.get_value_type of %5 : !pdl.type
pdl_interp.are_equal %8, %10 : !pdl.type -> ^bb18, ^bb1
^bb18:  // pred: ^bb17
%11 = pdl_interp.get_value_type of %0 : !pdl.type
pdl_interp.are_equal %8, %11 : !pdl.type -> ^bb19, ^bb1
^bb19:  // pred: ^bb18
pdl_interp.check_operation_name of %4 is "arith.constant" -> ^bb20, ^bb1
^bb20:  // pred: ^bb19
pdl_interp.check_operand_count of %4 is 0 -> ^bb21, ^bb1
^bb21:  // pred: ^bb20
pdl_interp.check_result_count of %4 is 1 -> ^bb22, ^bb1
^bb22:  // pred: ^bb21
%12 = pdl_interp.get_attribute "value" of %4
pdl_interp.is_not_null %12 : !pdl.attribute -> ^bb23, ^bb1
^bb23:  // pred: ^bb22
pdl_interp.check_attribute %12 is 1.000000e+00 : f32 -> ^bb24, ^bb1
^bb24:  // pred: ^bb23
%13 = pdl_interp.get_result 0 of %4
pdl_interp.is_not_null %13 : !pdl.value -> ^bb25, ^bb1
^bb25:  // pred: ^bb24
pdl_interp.are_equal %13, %3 : !pdl.value -> ^bb26, ^bb1
^bb26:  // pred: ^bb25
%14 = pdl_interp.get_value_type of %13 : !pdl.type
pdl_interp.are_equal %14, %8 : !pdl.type -> ^bb27, ^bb1
^bb27:  // pred: ^bb26
pdl_interp.record_match @rewriters::@pdl_generated_rewriter(%5, %6, %8, %arg0 : !pdl.value, !pdl.value, !pdl.type, !pdl.operation) : benefit(2), generatedOps(["arith.addf"]), loc([%2, %4, %arg0]), root("arith.addf") -> ^bb1
}
module @rewriters {
pdl_interp.func @pdl_generated_rewriter(%arg0: !pdl.value, %arg1: !pdl.value, %arg2: !pdl.type, %arg3: !pdl.operation) {
    %0 = pdl_interp.create_operation "arith.addf"(%arg0, %arg1 : !pdl.value, !pdl.value)  -> (%arg2 : !pdl.type)
    %1 = pdl_interp.get_result 0 of %0
    pdl_interp.replace %arg3 with (%1 : !pdl.value)
    pdl_interp.finalize
}
}
