import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec


class VendingTester extends AnyFlatSpec with ChiselScalatestTester {

  behavior of "FSM Vending Machine"

  it should "5 sec alarm for poor people" in {
    test(new FSM(20)).withAnnotations(Seq(WriteVcdAnnotation)) { dut => 
      dut.io.price.poke(10.U)
      dut.clock.step(1)

      dut.io.buy.poke(true.B) 
      dut.clock.step(9)

      dut.io.alarm.expect(true.B)
      dut.clock.step(80) 

      // Check if alarm stays on
      dut.io.alarm.expect(true.B)
      dut.clock.step(20)

      // Check if alarm shuts off
      dut.io.alarm.expect(false.B)
    }
  }

  /* it should "insert the correct amount" in {
    test(new FSM(20)).withAnnotations(Seq(WriteVcdAnnotation)) {
      dut => {
        dut.sum.expect(0.U)
        dut.clock.step(1)

        dut.io.coin2.poke(1.U)
        dut.clock.step(1) // Debounce time

        dut..sum.expect(2.U)
        dut.clock.step(1)

        dut.io.coin5.poke(1.U)
        dut.clock.step(1) // Debounce time

        dut.io.sum.expect(7.U)
      }
    }
  } */
}