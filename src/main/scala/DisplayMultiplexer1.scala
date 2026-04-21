
import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val sum = Input(UInt(8.W))
    val price = Input(UInt(5.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))})

  val decoder = Module(new SevenSegDec())
  val count_to_4 = RegInit(0.U(2.W))


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

  when(tick) {
    count_to_4 := count_to_4 + 1.U
  }


  var number1 = WireDefault("b0000".U(4.W))
  var number2 = WireDefault("b0000".U(4.W))
  var number3 = WireDefault("b0000".U(4.W))
  var number4 = WireDefault("b0000".U(4.W))


  number2 := io.sum / 10.U
  number1 := io.sum % 10.U
  number4 := io.price / 10.U
  number3 := io.price % 10.U

  decoder.io.in := 0.U

  switch(count_to_4) {
    // Numbers 0-9
    is("b00".U) {decoder.io.in := number3}
    is("b01".U) {decoder.io.in := number4}
    is("b10".U) {decoder.io.in := number1}
    is("b11".U) {decoder.io.in := number2}}



  io.an := ~(1.U << count_to_4)
  io.seg := ~decoder.io.out
}
