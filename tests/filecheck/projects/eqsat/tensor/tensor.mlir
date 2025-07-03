func.func @test(%t0 : tensor<1xindex>) -> index {
  %a = arith.constant 2 : index
  %c0 = arith.constant 0 : index

  %t1 = tensor.insert %a into %t0[%c0] : tensor<1xindex>

  %b = tensor.extract %t1[%c0] : tensor<1xindex>

  func.return %b : index
}


pdl.pattern @replace : benefit(1) {
  %tensor_ty = pdl.type : tensor<1xindex>
  %idx_ty = pdl.type : index

  %tensor = pdl.operand : %tensor_ty     // %t0
  %val    = pdl.operand : %idx_ty        // %a
  %idx    = pdl.operand : %idx_ty        // %c0

  %insert_op = pdl.operation "tensor.insert" (%val, %tensor, %idx : !pdl.value, !pdl.value, !pdl.value) -> (%tensor_ty : !pdl.type)
  %res_tensor = pdl.result 0 of %insert_op

  %extract_op = pdl.operation "tensor.extract" (%res_tensor, %idx : !pdl.value, !pdl.value) -> (%idx_ty : !pdl.type)
  %res = pdl.result 0 of %extract_op

  pdl.rewrite %extract_op {
    pdl.replace %extract_op with (%val : !pdl.value)
  }
}
