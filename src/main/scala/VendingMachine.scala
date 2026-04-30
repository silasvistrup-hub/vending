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

  /* Init DisplayMultiplexer */
  val DisplayMultiplexer = Module(new DisplayMultiplexer(maxCount))

  /* Define states */
  val inserted = RegInit(0.U(8.W)) // keeps track of inserted of coins not spent
  val full2 = (inserted>97.U) // these two make sure not more than 99 is inserted
  val full5 = (inserted>94.U)
  val enough = (inserted>=io.price)
  val countTo4 = RegInit(0.U(10.W))
  val imFull = WireDefault(false.B)

  /* Define input registers */
  val prevCoin2 = RegNext(io.coin2)
  val prevCoin5 = RegNext(io.coin5)
  val prevPrice = RegNext(io.price)
  val prevBuy   = RegNext(io.buy)

  /* Define trigger */
  val coin2Trigger = io.coin2 && !prevCoin2
  val coin5Trigger = io.coin5 && !prevCoin5
  val priceTrigger = io.price =/= !prevPrice
  val buyTrigger   = io.buy && !prevBuy

  /* Init SerialCommunicator module */
  val SerialComs = Module(new SerialCommunicator)
  SerialComs.io.price := io.price
  SerialComs.io.sum := inserted
  SerialComs.io.update := coin2Trigger || coin5Trigger || priceTrigger || buyTrigger
  io.tx := SerialComs.io.tx

  when(coin2Trigger && !full2) {
    inserted := inserted + 2.U
  }.elsewhen(coin5Trigger && !full5) {
    inserted := inserted + 5.U
  }.elsewhen(buyTrigger && enough) {
    inserted := inserted - io.price
  }

  val ringAlarm = RegInit(false.B)
  when((buyTrigger && !enough)){
    ringAlarm:=true.B
    countTo4 := 1.U
  }
  val dispense = RegInit(false.B)
  when(countTo4 === 0.U) {
    ringAlarm := false.B
    dispense := false.B
  }


  when((buyTrigger && enough)){
    dispense:=true.B
    countTo4 :=1.U
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
    countTo4 := countTo4 + 1.U
  }


  when(full2 && coin2Trigger){imFull:=true.B}
  when(full5 && coin5Trigger){imFull:=true.B}



  io.alarm := ringAlarm
  io.releaseCan := dispense
  DisplayMultiplexer.io.sum := inserted
  DisplayMultiplexer.io.price := io.price
  DisplayMultiplexer.io.full := imFull
  io.seg := DisplayMultiplexer.io.seg
  io.an := DisplayMultiplexer.io.an
}

// generate Verilog
object VendingMachine extends App {
  emitVerilog(new VendingMachine(100000))
}


