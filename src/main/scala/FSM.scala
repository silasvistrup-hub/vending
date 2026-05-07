import chisel3._
import chisel3.util._

object State extends ChiselEnum {
  val idleState, coin2State, coin5State, alarmState, releaseState, fullState = Value
  }
import State._

class FSM(maxCount: Int) extends Module {
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


    // Debouncing buttons
  //Coin2
  val ButtonDeb1 = Module(new ButtonDebouncer(maxCount/100))
  ButtonDeb1.io.inp := io.coin2
  val debCoin2 = ButtonDeb1.io.out
  // Coin5
  val ButtonDeb2 = Module(new ButtonDebouncer(maxCount/100))
  ButtonDeb2.io.inp := io.coin5
  val debCoin5 = ButtonDeb2.io.out

  //Buy
  val ButtonDeb3 = Module(new ButtonDebouncer(maxCount/100))
  ButtonDeb3.io.inp := io.buy
  val debBuy = ButtonDeb3.io.out


  object State extends ChiselEnum {
    val idleState, coin2State, coin5State, alarmState, releaseState, fullState = Value
  }
  import State._

  val stateReg = RegInit(idleState)
  stateReg := idleState

  val extender = Module(new extender(maxCount))
  val DisplayMultiplexer = Module(new DisplayMultiplexer(maxCount))
  val Datapath = Module(new Datapath(maxCount))
  val SerialComs = Module(new SerialCommunicator(maxCount))

  /* Define input registers */
  val prevCoin2 = RegNext(debCoin2)
  val prevCoin5 = RegNext(debCoin5)
  val prevBuy = RegNext(debBuy)
  val prevPrice = RegNext(io.price)

  /* Define trigger */
  val coin2Trigger = debCoin2 && !prevCoin2   //io.coin2
  val coin5Trigger = debCoin5 && !prevCoin5
  val buyTrigger = debBuy && !prevBuy
  val priceTrigger = io.price =/= prevPrice

  val Full2 = Datapath.io.Full2
  val Full5 = Datapath.io.Full5
  val enough = Datapath.io.enough

  switch(stateReg) {
    is(idleState) {
      when(coin2Trigger && !Full2) {
        stateReg := coin2State
      }.elsewhen(coin5Trigger && !Full5) {
        stateReg := coin5State
      }.elsewhen(buyTrigger && !enough) {
        stateReg := alarmState
      }.elsewhen(buyTrigger && enough) {
        stateReg := releaseState
      }.elsewhen(coin2Trigger && Full2) {
        stateReg := fullState
      }.elsewhen(coin5Trigger && Full5) {
        stateReg := fullState
      }
    }}

  // Extender multiplexer module
  extender.io.Ringalarm := (stateReg === alarmState)
  extender.io.releasing := (stateReg === releaseState)
  Datapath.io.FSMstate := stateReg.asUInt

  // Display multiplexer module
  DisplayMultiplexer.io.full := (stateReg === fullState)
  DisplayMultiplexer.io.sum := Datapath.io.money
  DisplayMultiplexer.io.price := io.price

  // Serial communicator module
  io.tx := SerialComs.io.tx
  SerialComs.io.price := io.price
  SerialComs.io.sum := Datapath.io.money
  SerialComs.io.update := coin2Trigger | coin5Trigger | buyTrigger | priceTrigger

  // Datapath
  Datapath.io.price := io.price

  io.alarm := extender.io.alarm
  io.releaseCan := extender.io.releaseCan
  io.seg := DisplayMultiplexer.io.seg
  io.an := DisplayMultiplexer.io.an
  io.tx := false.B


}
object FSM extends App {
  emitVerilog(new FSM(100000))
}
