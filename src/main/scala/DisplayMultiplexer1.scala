
import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val sum = Input(UInt(8.W))
    val price = Input(UInt(5.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
    val full = Input((Bool()))})

  val decoder = Module(new SevenSegDec())
  val count_to_4 = RegInit(0.U(2.W))
  val full_sequence = RegInit(false.B)
  val count_to_16 = RegInit(0.U(4.W))


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
  val tick_sec = tickGenerator(100000000)

  when(tick) {count_to_4 := count_to_4 + 1.U}
  when(tick_sec){count_to_16 := count_to_16 + 1.U}
  when(io.full) {
    full_sequence := true.B
    count_to_16:=0.U}
  when(count_to_16===10.U){full_sequence:=false.B}

  var number1 = WireDefault("b0000".U(4.W))
  var number2 = WireDefault("b0000".U(4.W))
  var number3 = WireDefault("b0000".U(4.W))
  var number4 = WireDefault("b0000".U(4.W))
  var number2_full = RegInit(13.U(4.W))
  var number1_full = RegInit(13.U(4.W))
  var number4_full = RegInit(13.U(4.W))
  var number3_full = RegInit(13.U(4.W))

  switch(count_to_16) {
    is(0.U) {
      number2_full := 13.U
      number1_full := 13.U
      number4_full := 13.U
      number3_full := 13.U
    }

    is(1.U) {
      number2_full := 12.U
      number1_full := 13.U
      number4_full := 13.U
      number3_full := 13.U
    }

    is(2.U) {
      number2_full := 12.U
      number1_full := 12.U
      number4_full := 13.U
      number3_full := 13.U
    }

    is(3.U) {
      number2_full := 11.U
      number1_full := 12.U
      number4_full := 12.U
      number3_full := 13.U
    }

    is(4.U) {
      number2_full := 10.U
      number1_full := 11.U
      number4_full := 12.U
      number3_full := 12.U
    }

    is(5.U) {
      number2_full := 13.U
      number1_full := 10.U
      number4_full := 11.U
      number3_full := 12.U
    }

    is(6.U) {
      number2_full := 13.U
      number1_full := 13.U
      number4_full := 10.U
      number3_full := 11.U
    }

    is(7.U) {
      number2_full := 13.U
      number1_full := 13.U
      number4_full := 13.U
      number3_full := 10.U
    }

    is(8.U) {
      number2_full := 13.U
      number1_full := 13.U
      number4_full := 13.U
      number3_full := 13.U
    }

    is(9.U) {
      number2_full := 13.U
      number1_full := 13.U
      number4_full := 13.U
      number3_full := 13.U
    }
  }

  when(!full_sequence) {
    number2 := io.sum / 10.U
    number1 := io.sum % 10.U
    number4 := io.price / 10.U
    number3 := io.price % 10.U
  }.otherwise{
    number2 := number2_full
    number1 := number1_full
    number4 := number4_full
    number3 := number3_full
  }

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
