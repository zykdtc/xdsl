

func.func @test(%x : f32) -> (f32) {
    %c1 = arith.constant 1 : f32
    %add = arith.addf %x, %c1 : f32
    %sqrt1 = math.sqrt %add : f32
    %sqrt2 = math.sqrt %x : f32
    %res = arith.subf %sqrt1, %sqrt2 : f32
    func.return %res : f32
}

// sqrt(x+1) - sqrt(x) -> 1/(sqrt(x+1) + sqrt(x))
pdl.pattern @sqrt_minus : benefit(2) {
  %0 = pdl.type : f32
  %1 = pdl.operand : %0
  %2 = pdl.attribute = 1.000000e+00 : f32
  %3 = pdl.operation "arith.constant" {"value" = %2} -> (%0 : !pdl.type)
  %4 = pdl.result 0 of %3
  %5 = pdl.operation "arith.addf" (%1, %4 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
  %6 = pdl.result 0 of %5
  %7 = pdl.operation "math.sqrt" (%6 : !pdl.value) -> (%0 : !pdl.type)
  %8 = pdl.result 0 of %7
  %9 = pdl.operation "math.sqrt" (%1 : !pdl.value) -> (%0 : !pdl.type)
  %10 = pdl.result 0 of %9
  %11 = pdl.operation "arith.subf" (%8, %10 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
  %12 = pdl.result 0 of %11
  pdl.rewrite %11 {
    %13 = pdl.attribute = 1.000000e+00 : f32
    %14 = pdl.operation "arith.constant" {"value" = %13} -> (%0 : !pdl.type)
    %15 = pdl.result 0 of %14
    %16 = pdl.attribute = 1.000000e+00 : f32
    %17 = pdl.operation "arith.constant" {"value" = %16} -> (%0 : !pdl.type)
    %18 = pdl.result 0 of %17
    %19 = pdl.operation "arith.addf" (%1, %18 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
    %20 = pdl.result 0 of %19
    %21 = pdl.operation "math.sqrt" (%20 : !pdl.value) -> (%0 : !pdl.type)
    %22 = pdl.result 0 of %21
    %23 = pdl.operation "math.sqrt" (%1 : !pdl.value) -> (%0 : !pdl.type)
    %24 = pdl.result 0 of %23
    %25 = pdl.operation "arith.addf" (%22, %24 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
    %26 = pdl.result 0 of %25
    %27 = pdl.operation "arith.divf" (%15, %26 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
    %28 = pdl.result 0 of %27
    pdl.replace %11 with (%28 : !pdl.value)
  }
}
