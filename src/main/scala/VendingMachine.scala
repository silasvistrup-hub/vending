import chisel3._
import chisel3.util._

class VendingMachine(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val coin2 = Input(Bool())
    val coin5 = Input(Bool())
    val buy = Input(Bool())
    val releaseCan = Output(Bool())
    val alarm = Output(Bool())
    val seg = Output(UInt(7.W))
    val an = Output(UInt(4.W))
    val tx = Output(Bool())
  })

  val DisplayMultiplexer = Module(new DisplayMultiplexer(maxCount))


  val Value = RegInit(0.U(8.W)) // keeps track of value of coins not spent
  val Full2 = (Value>97.U) // these two make sure not more than 99 is inserted
  val Full5 = (Value>94.U)
  val enough = (Value>=io.price)
  val count_to_4 = RegInit(0.U(10.W))
  val im_full = WireDefault(false.B)



  val coin2_previous = RegNext(io.coin2)
  val coin5_previous = RegNext(io.coin5)
  val buy_previous   = RegNext(io.buy)

  val coin2_change = io.coin2 && !coin2_previous
  val coin5_change = io.coin5 && !coin5_previous
  val buy_change   = io.buy && !buy_previous

  val SerialComs = Module(new SerialCommunicator)
  SerialComs.io.price := io.price
  SerialComs.io.sum := Value
  SerialComs.io.update := coin2_change || coin5_change || buy_change
  io.tx := SerialComs.io.tx

  when(coin2_change && !Full2) {
    Value := Value + 2.U
  }.elsewhen(coin5_change && !Full5) {
    Value := Value + 5.U
  }.elsewhen(buy_change && enough) {
    Value := Value - io.price
  }

  val ringalarm = RegInit(false.B)
  when((buy_change && !enough)){
    ringalarm:=true.B
    count_to_4 := 1.U
  }
  val dispense = RegInit(false.B)
  when(count_to_4 === 0.U) {
    ringalarm := false.B
    dispense := false.B
  }


  when((buy_change && enough)){
    dispense:=true.B
  count_to_4 :=1.U
  }

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


  when(Full2 && coin2_change){im_full:=true.B}
  when(Full5 && coin5_change){im_full:=true.B}



  io.alarm := ringalarm
  io.releaseCan := dispense
  DisplayMultiplexer.io.sum:=Value
  DisplayMultiplexer.io.price := io.price
  DisplayMultiplexer.io.full := im_full
  io.seg := DisplayMultiplexer.io.seg
  io.an := DisplayMultiplexer.io.an
}

// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
}


