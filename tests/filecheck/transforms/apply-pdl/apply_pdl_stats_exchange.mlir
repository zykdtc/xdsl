// RUN: xdsl-opt %s -p apply-pdl | filecheck %s


// CHECK:       func.func @impl() -> i32 {
// CHECK-NEXT:    %1 = arith.constant 0 : i32
// CHECK-NEXT:    %0 = arith.constant 4 : i32
// CHECK-NEXT:    func.return %0 : i32
// CHECK-NEXT:  }


func.func @impl() -> i32 {
  %0 = arith.constant 4 : i32
  %1 = eqsat.eclass %0 : i32
  %2 = arith.constant 0 : i32
  %3 = eqsat.eclass %2 : i32
  %4 = arith.addi %0, %2 : i32
  %5 = eqsat.seq %1, %3 : none
  func.return %4 : i32
}

pdl.pattern : benefit(2) {
  %0 = pdl.type
  %1 = pdl.operand
  %2 = pdl.attribute = 0 : i32
  %3 = pdl.operation "arith.constant" {"value" = %2} -> (%0 : !pdl.type)
  %4 = pdl.result 0 of %3
  %5 = pdl.operation "arith.addi" (%1, %4 : !pdl.value, !pdl.value) -> (%0 : !pdl.type)
  pdl.rewrite %5 {
    pdl.replace %5 with (%1 : !pdl.value)
  }
}
