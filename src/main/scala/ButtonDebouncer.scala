import chisel3._
import chisel3.util._

class ButtonDebouncer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val inp = Input(Bool())
    val out = Output(Bool())
  })

  val tickGenerator = Module(new TickGenerator(math.max(1, maxCount / 100))) // 1 tick for sim, 1.000.000 for FPGA

  // Synchronise buttons
  val sync = RegNext(RegNext(io.inp))

  // Debounce buttons
  val btnDebReg = RegInit(false.B)
  val tickCnt = RegInit(0.U(4.W))

  when (tickCnt === 4.U) { // 40 ms [Source 1]
    tickCnt := 0.U
    btnDebReg := sync
  }. otherwise {
    when (tickGenerator.io.tickOut) {
      tickCnt := tickCnt + 1.U
    }
  }

  io.out := btnDebReg
}


