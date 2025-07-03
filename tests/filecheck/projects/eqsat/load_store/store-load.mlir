

func.func @test(%x : memref<1xindex>) -> (index) {
    %a = arith.constant 2 : index
    %c0 = arith.constant 0 : index

    memref.store %a, %x[%c0] : memref<1xindex>

    %b = memref.load %x[%c0] : memref<1xindex>
    
    func.return %b : index
}

pdl.pattern @replace : benefit(1) {
  %0 = pdl.type : memref<1xindex>
  %1 = pdl.type : index
  %2 = pdl.operand : %0
  // %c2 = pdl.attribute = 2 : index
  // %def = pdl.operation "arith.constant" {"value" = %c2} -> (%1 : !pdl.type)
  // %3 = pdl.result 0 of %def 
  %3 = pdl.operand : %1
  %4 = pdl.operand : %1
  %5 = pdl.operation "memref.store" (%3, %2, %4 : !pdl.value, !pdl.value, !pdl.value)
  %6 = pdl.operation "memref.load" (%2, %4 : !pdl.value, !pdl.value) -> (%1 : !pdl.type)
  %7 = pdl.result 0 of %6
  pdl.rewrite %6 {
    pdl.replace %6 with (%3 : !pdl.value)
    pdl.erase %5
  }
}
