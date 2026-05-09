
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

  val alarm = RegInit(false.B)
  val releaseCan = RegInit(false.B)

  // Init triggers
  val ringAlarmTrigger = io.ringAlarm && !RegNext(io.ringAlarm)
  val releasingTrigger = io.releasing && !RegNext(io.releasing)

  // Only count when alarm or release signal is true
  when(tick && (alarm || releaseCan)) {
    countSec := countSec + 1.U
  }

  when(ringAlarmTrigger) {
    alarm := true.B
    countSec := 0.U
  }
  
  when(releasingTrigger) {
    releaseCan := true.B
    countSec := 0.U
  }

  // Turn alarm of after 5 sec
  when(countSec === 5.U) {
    alarm := false.B
    releaseCan := false.B
    countSec := 0.U
  }

  io.alarm := alarm
  io.releaseCan := releaseCan


}