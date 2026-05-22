import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class VendingTester extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "FSM Vending Machine"

  it should "hold io.alarm and io.releaseCan high for 5 cycles" in {
    test(new FSM(20)).withAnnotations(Seq(WriteVcdAnnotation)) { dut => 
      dut.io.price.poke(7.U)
      dut.clock.step(1)

      // Test io.alarm
      dut.io.coin2.poke(true.B) 
      dut.clock.step(9)
      dut.io.coin2.poke(false.B) 

      dut.io.buy.poke(true.B) 
      dut.clock.step(9)
      dut.io.buy.poke(false.B) 

      dut.io.alarm.expect(true.B)
      dut.clock.step(80) 

      // Check if alarm stays on
      dut.io.alarm.expect(true.B)
      dut.clock.step(20)

      // Check if alarm shuts off after 5 cycles
      dut.io.alarm.expect(false.B)


      // Test io.releaseCan
      dut.io.coin5.poke(true.B) 
      dut.clock.step(9)
      dut.io.coin5.poke(false.B) 

      dut.io.buy.poke(true.B) 
      dut.clock.step(9)
      dut.io.buy.poke(false.B) 

      dut.io.releaseCan.expect(true.B)
      dut.clock.step(80) 

      // Check if alarm stays on
      dut.io.releaseCan.expect(true.B)
      dut.clock.step(20)
    }
  }

  it should "trigger UART write upon price, sum and buy changes" in {
    test(new FSM(20)).withAnnotations(Seq(WriteVcdAnnotation)) { dut => 
      dut.io.price.poke(7.U)
  
      dut.clock.step(3) // Wait
    
      dut.io.tx.expect(false.B) // Start bit
      dut.clock.step(1)

      // We expect 0001 1011 for 27.U, in starting from LSB
      dut.io.tx.expect(true.B);  dut.clock.step(1) // Bit 0 (1)
      dut.io.tx.expect(true.B);  dut.clock.step(1) // Bit 1 (1)
      dut.io.tx.expect(false.B); dut.clock.step(1) // Bit 2 (0)
      dut.io.tx.expect(true.B);  dut.clock.step(1) // Bit 3 (1)
      dut.io.tx.expect(true.B);  dut.clock.step(1) // Bit 4 (1)
      dut.io.tx.expect(false.B); dut.clock.step(1) // Bit 5 (0)
      dut.io.tx.expect(false.B); dut.clock.step(1) // Bit 6 (0)
      dut.io.tx.expect(false.B); dut.clock.step(1) // Bit 7 (0)

      dut.io.tx.expect(true.B)   // Stop bit
    }
  }

  it should "update seven seg display" in {
    test(new FSM(10)).withAnnotations(Seq(WriteVcdAnnotation)) { dut => 

      // Check all segments are 0
      dut.io.an.expect("b1110".U)     // Seg: 1
      dut.io.seg.expect("b1000000".U) // 0
      dut.clock.step(10)
      
      dut.io.an.expect("b1101".U)     // Seg: 2
      dut.io.seg.expect("b1000000".U) // 0
      dut.clock.step(10)

      dut.io.an.expect("b1011".U)     // Seg: 3  
      dut.io.seg.expect("b1000000".U) // 0
      dut.clock.step(10)
      
      dut.io.an.expect("b0111".U)     // Seg: 4
      dut.io.seg.expect("b1000000".U) // 0
      dut.io.price.poke(11.U)
      dut.io.coin5.poke(true.B)
      dut.clock.step(5)
      dut.io.coin5.poke(false.B)
      dut.clock.step(5)

      dut.io.an.expect("b1110".U)     // Seg: 1
      dut.io.seg.expect("b1111001".U) // 1
      dut.io.coin5.poke(true.B)
      dut.clock.step(5)
      dut.io.coin5.poke(false.B)
      dut.clock.step(5)

      dut.io.an.expect("b1101".U)     // Seg: 2
      dut.io.seg.expect("b1111001".U) // 1
      dut.io.coin5.poke(true.B)
      dut.clock.step(5)
      dut.io.coin5.poke(false.B)
      dut.clock.step(5)

      dut.io.an.expect("b1011".U)     // Seg: 3
      dut.io.seg.expect("b0010010".U) // 5
      dut.clock.step(10)

      dut.io.an.expect("b0111".U)     // Seg: 4
      dut.io.seg.expect("b1111001".U) // 1
    }
  }
}