
import chisel3._
import chisel3.util._

class DisplayMultiplexer(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val sum = Input(UInt(8.W))
    val price = Input(UInt(5.W))
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
    val full = Input((Bool()))
  })

  val decoder = Module(new SevenSegDec())
  val CountTo4 = RegInit(0.U(2.W))
  val FullSequence = RegInit(false.B)
  val CountTo16 = RegInit(0.U(4.W))


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
  val animationSpeed = if (maxCount < 1000) 20 else 35000000 // Purely for testing, will not generate anything and will be 35mil irl
  val slowTick = tickGenerator(animationSpeed)

  when(tick) {CountTo4 := CountTo4 + 1.U}
  when(slowTick){CountTo16 := CountTo16 + 1.U}

  when(io.full) {
    FullSequence := true.B
    CountTo16:=0.U}

  when(CountTo16===10.U){FullSequence:=false.B}

  var number1 = WireDefault(0.U(4.W))
  var number2 = WireDefault(0.U(4.W))
  var number3 = WireDefault(0.U(4.W))
  var number4 = WireDefault(0.U(4.W))
  var Number2Full = RegInit(13.U(4.W))
  var Number1Full = RegInit(13.U(4.W))
  var Number4Full = RegInit(13.U(4.W))
  var Number3Full = RegInit(13.U(4.W))

  when(slowTick){
    Number3Full := Number4Full
    Number4Full := Number1Full
    Number1Full := Number2Full
  }

  switch(CountTo16) {
    is(0.U) {Number2Full := 13.U}
    is(1.U) {Number2Full := 12.U}
    is(2.U) {Number2Full := 12.U}
    is(3.U) {Number2Full := 11.U}
    is(4.U) {Number2Full := 10.U}
    is(5.U) {Number2Full := 13.U}
    is(6.U) {Number2Full := 13.U}
    is(7.U) {Number2Full := 13.U}
    is(8.U) {Number2Full := 13.U}
    is(9.U) {Number2Full := 13.U}
  }

  when(!FullSequence) {
    number1 := io.sum % 10.U
    number2 := io.sum / 10.U
    number3 := io.price % 10.U
    number4 := io.price / 10.U
  }.otherwise{
    number1 := Number1Full
    number2 := Number2Full
    number3 := Number3Full
    number4 := Number4Full
  }

  decoder.io.in := 0.U

  switch(CountTo4) {
    is("b10".U) {decoder.io.in := number1}
    is("b11".U) {decoder.io.in := number2}
    is("b00".U) {decoder.io.in := number3}
    is("b01".U) {decoder.io.in := number4}
  }

  io.an := ~(1.U << CountTo4)
  io.seg := ~decoder.io.out
}
