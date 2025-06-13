
builtin.module{

  %i0, %i1, %i2 = "test.op"() : () -> (!riscv.reg<a0>, !riscv.reg<a1>, !riscv.reg)

  %zero = riscv.get_register : !riscv.reg<zero>
  %c0 = riscv.li 0 : !riscv.reg
  %c1 = riscv.li 1 : !riscv.reg
  %c2 = riscv.li 2 : !riscv.reg
  %c3 = riscv.li 3 : !riscv.reg

  // Don't optimise out unused immediates
  "test.op"(%zero, %c0, %c1, %c2, %c3) : (!riscv.reg<zero>, !riscv.reg, !riscv.reg, !riscv.reg, !riscv.reg) -> ()


  %add_lhs_rhs = riscv.add %i1, %i1 : (!riscv.reg<a1>, !riscv.reg<a1>) -> !riscv.reg<a0>
  "test.op"(%add_lhs_rhs) : (!riscv.reg<a0>) -> ()

  %multiply_immediate_r0 = riscv.mul %c0, %i1 : (!riscv.reg, !riscv.reg<a1>) -> !riscv.reg<a0>
  "test.op"(%multiply_immediate_r0) : (!riscv.reg<a0>) -> ()

  %multiply_immediate_l0 = riscv.mul %i1, %c0 : (!riscv.reg<a1>, !riscv.reg) -> !riscv.reg<a0>
  "test.op"(%multiply_immediate_l0) : (!riscv.reg<a0>) -> ()


  %multiply_immediate_r1 = riscv.mul %c1, %i1 : (!riscv.reg, !riscv.reg<a1>) -> !riscv.reg<a0>
  "test.op"(%multiply_immediate_r1) : (!riscv.reg<a0>) -> ()

  %multiply_immediate_l1 = riscv.mul %i1, %c1 : (!riscv.reg<a1>, !riscv.reg) -> !riscv.reg<a0>
  "test.op"(%multiply_immediate_l1) : (!riscv.reg<a0>) -> ()

}