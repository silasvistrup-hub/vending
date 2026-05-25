import chisel3._
import chisel3.util._

class Datapath(maxCount: Int) extends Module {
  val io = IO(new Bundle {
    val price = Input(UInt(5.W))
    val FSMstate = Input(UInt(3.W))
    val Full2 = Output(Bool())
    val Full5 = Output(Bool())
    val enough = Output(Bool())
    val money = Output(UInt(7.W))})
  //flipflop containing sum
  val money = RegInit(0.U(7.W))
  //comparators defining outputs Full2, Full5 and enough
  io.Full2 := (money > 97.U)
  io.Full5 := (money > 94.U)
  io.enough := (money > io.price - 1.U)
  //Changes sum based on the state of The FSM
  switch(io.FSMstate){
    is(1.U){money:=money + 2.U}
    is(2.U){money:=money + 5.U}
    is(4.U){money:=money - io.price}
  }
  
  io.money := money
}
