

func.func @test(%x : memref<1xindex>) -> () {

    %c0 = arith.constant 0 : index
    //memref.store %a, %x[%c0]

    // %temp = memref.load %x[%c0] : memref<1xindex>
    %a = memref.load %x[%c0] : memref<1xindex>
    
    memref.store %a, %x[%c0] : memref<1xindex>
    
    func.return
}

pdl.pattern @replace : benefit(1) {
  %0 = pdl.type : memref<1xindex>
  %1 = pdl.type : index
  %2 = pdl.operand : %0
  %4 = pdl.operand : %1
  %6 = pdl.operation "memref.load" (%2, %4 : !pdl.value, !pdl.value) -> (%1 : !pdl.type)
  %7 = pdl.result 0 of %6
  %5 = pdl.operation "memref.store" (%7, %2, %4 : !pdl.value, !pdl.value, !pdl.value)
  pdl.rewrite %5 {
    pdl.erase %5
  }
}
