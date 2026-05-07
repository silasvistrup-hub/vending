import chisel3._
import chisel3.util._


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

  object State extends ChiselEnum {
    val idleState, coin2State, coin5State, alarmState, releaseState, fullState = Value
  }
  import State._

  val stateReg = RegInit(idleState)
  stateReg := idleState

  val extender = Module(new extender(maxCount))
  val DisplayMultiplexer = Module(new DisplayMultiplexer(maxCount))
  val Datapath = Module(new Datapath(maxCount))

  /* Define input registers */
  val prevCoin2 = RegNext(io.coin2)
  val prevCoin5 = RegNext(io.coin5)
  val prevBuy = RegNext(io.buy)
  /* Define trigger */
  val coin2Trigger = io.coin2 && !prevCoin2
  val coin5Trigger = io.coin5 && !prevCoin5
  val buyTrigger = io.buy && !prevBuy

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

  extender.io.Ringalarm := (stateReg === alarmState)
  extender.io.releasing := (stateReg === releaseState)
  Datapath.io.FSMstate := stateReg.asUInt
  DisplayMultiplexer.io.full := (stateReg === fullState)
  DisplayMultiplexer.io.sum := Datapath.io.money
  DisplayMultiplexer.io.price := io.price
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
