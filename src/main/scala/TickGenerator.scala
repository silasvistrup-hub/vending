import chisel3._
import chisel3.util._

class TickGenerator(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val tickOut = Output(Bool())
  })
  val tickCnt = RegInit(0.U(32.W))
  val tick = WireDefault(false.B)

  when(tickCnt === (maxCount.U - 1.U)) {
    tickCnt := 0.U
    tick := true.B
  }.otherwise {
    tickCnt := tickCnt + 1.U
  }

  io.tickOut := tick
}


