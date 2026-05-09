
import chisel3._
import chisel3.util._

class extender(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val ringAlarm = Input(Bool())
    val releasing = Input(Bool())
    val alarm = Output(Bool())
    val releaseCan = Output(Bool())
  })

  def tickGenerator(max: Int): Bool = {
    val tickCnt = RegInit(0.U(32.W))
    val tick = WireDefault(false.B)

    when(tickCnt === (max - 1).U) {
      tickCnt := 0.U
      tick := true.B
    }.otherwise {
      tickCnt := tickCnt + 1.U
    }

    tick
  }

  val tick = tickGenerator(maxCount)
  val countSec = RegInit(0.U(10.W))

  when(tick) {
    countSec := countSec + 1.U
  }

  val alarm = RegInit(false.B)
  val releaseCan = RegInit(false.B)

  when(io.ringAlarm) {
    alarm := true.B
    countSec := 1.U
  }
  when(io.releasing) {
    releaseCan := true.B
    countSec := 1.U
  }

  when(countSec === 0.U) {
    alarm := false.B
    releaseCan := false.B
  }
  io.alarm := alarm
  io.releaseCan := releaseCan


}