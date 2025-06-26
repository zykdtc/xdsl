

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
