

func.func @test(%x : memref<1xindex>) -> (index) {
    %a = arith.constant 2 : index
    %c0 = arith.constant 0 : index

    memref.store %a, %x[%c0] : memref<1xindex>

    %b = memref.load %x[%c0] : memref<1xindex>
    
    func.return %b : index
}

pdl.pattern @replace : benefit(1) {
  %memref_ty = pdl.type : memref<1xindex>
  %idx_ty = pdl.type : index

  %mem = pdl.operand : %memref_ty
  %idx = pdl.operand : %idx_ty
  %val = pdl.operand : %idx_ty

  // store %val into mem[idx]
  %store = pdl.operation "memref.store" (%val, %mem, %idx : !pdl.value, !pdl.value, !pdl.value)

  // load mem[idx] (same location)
  %load = pdl.operation "memref.load" (%mem, %idx : !pdl.value, !pdl.value) -> (%idx_ty : !pdl.type)
  %loaded = pdl.result 0 of %load

  pdl.rewrite %load {
    pdl.replace %load with (%val : !pdl.value)
    // pdl.erase %store
  }
}

// pdl.pattern @replace : benefit(1) {
//   %0 = pdl.type : memref<1xindex>
//   %1 = pdl.type : index
//   %2 = pdl.operand : %0
//   %3 = pdl.operand : %1
//   %4 = pdl.operand : %1
//   %5 = pdl.operation "memref.store" (%3, %2, %4 : !pdl.value, !pdl.value, !pdl.value)
//   %6 = pdl.operation "memref.load" (%2, %4 : !pdl.value, !pdl.value) -> (%1 : !pdl.type)
//   %7 = pdl.result 0 of %6
//   pdl.rewrite %6 {
//     pdl.replace %6 with (%3 : !pdl.value)
//     pdl.erase %5
//   }
// }
