import chisel3._
import chisel3.util._

class ButtonDebouncer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val inp = Input(Bool())
    val out = Output(Bool())
  })

  val tickGenerator = Module(new TickGenerator(100000))
  val tickdeb = tickGenerator.io.tickOut   //tickGenerator.io.out



  // Synchronise buttons
  val sync = RegNext(RegNext(io.inp))

  // Debounce buttons
  val btnDebReg = RegInit(false.B)
  val debCnt = RegInit (0.U(32.W))
  val debTick = tickdeb

  debCnt := debCnt + 1.U
  when (debTick) {
    debCnt:= 0.U
    btnDebReg := sync

  }

  io.out := btnDebReg
}


