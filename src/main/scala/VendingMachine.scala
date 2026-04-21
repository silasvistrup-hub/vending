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
  })

  val DisplayMultiplexer = Module(new DisplayMultiplexer(maxCount))


  val Value = RegInit(0.U(8.W)) // keeps track of value of coins not spent
  val Full2 = (Value>97.U) // these two make sure not more than 99 is inserted
  val Full5 = (Value>94.U)
  val enough = (Value>=io.price)
  //enough := (Value>=io.price)



  val coin2_previous = RegNext(io.coin2)
  val coin5_previous = RegNext(io.coin5)
  val buy_previous   = RegNext(io.buy)

  val coin2_change = io.coin2 && !coin2_previous
  val coin5_change = io.coin5 && !coin5_previous
  val buy_change   = io.buy && !buy_previous


  val FSM = RegInit("b00000".U(5.W))



  when(coin2_change && !Full2) {
    Value := Value + 2.U
  }.elsewhen(coin5_change && !Full5) {
    Value := Value + 5.U
  }.elsewhen(buy_change && enough) {
    Value := Value - io.price
  }



  io.alarm := FSM(4)
  io.releaseCan := FSM(3)
  DisplayMultiplexer.io.sum:=Value
  DisplayMultiplexer.io.price := io.price
  io.seg := DisplayMultiplexer.io.seg
  io.an := DisplayMultiplexer.io.an
}

// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
}


