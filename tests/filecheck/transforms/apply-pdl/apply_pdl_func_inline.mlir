// RUN: xdsl-opt %s -p apply-pdl | filecheck %s


func.func @addi(%a: i32, %b: i32) -> i32 {
  %0 = arith.addi %a, %b : i32
  func.return %0 : i32
}

func.func @test(%a: i32, %b: i32) -> i32 {
  %c = func.call @addi(%a, %b) : (i32, i32) -> i32
  func.return %c : i32
}

pdl.pattern @func_inline: benefit(2) {
  %0 = pdl.type
  %a = pdl.operand : %0
  %2 = pdl.operation "func.func" (%a, %b : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
  %3 = pdl.result 0 of %2
  %4 = pdl.operation "func.call" (%a, %b : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
  pdl.rewrite %4 {
    pdl.replace %4 with (%3 : !pdl.value)
  }
}
