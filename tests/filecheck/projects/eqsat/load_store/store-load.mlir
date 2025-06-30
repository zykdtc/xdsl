

func.func @test(%x : memref<1xindex>) -> (index) {
    %a = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    //memref.store %a, %x[%c0]

    // %temp = memref.load %x[%c0] : memref<1xindex>
    memref.store %a, %x[%c0] : memref<1xindex>

    %b = memref.load %x[%c0] : memref<1xindex>

    %c = arith.muli %b, %b : index
    
    func.return %c : index
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

  // multiply loaded value
  %mul = pdl.operation "arith.muli" (%loaded, %loaded : !pdl.value, !pdl.value) -> (%idx_ty : !pdl.type)
  %mul_res = pdl.result 0 of %mul

  pdl.rewrite %mul {
    pdl.erase %store
    %new_mul = pdl.operation "arith.muli" (%val, %val : !pdl.value, !pdl.value) -> (%idx_ty : !pdl.type)
    %new_res = pdl.result 0 of %new_mul
    pdl.replace %mul with (%new_res : !pdl.value)
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
//   %8 = pdl.operation "arith.muli" (%7, %7 : !pdl.value, !pdl.value) -> (%1 : !pdl.type)
//   %9 = pdl.result 0 of %8
//   pdl.rewrite %8 {
//     %10 = pdl.operation "arith.muli" (%3, %3 : !pdl.value, !pdl.value) -> (%1 : !pdl.type)
//     %11 = pdl.result 0 of %10
//     pdl.replace %8 with (%11 : !pdl.value)
//     pdl.erase %5
//   }
// }
