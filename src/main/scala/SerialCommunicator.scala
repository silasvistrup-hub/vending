import chisel3._
import chisel3.util._
import chisel.lib.uart._

object WriteState extends ChiselEnum {
  val sIdle, sClear, sPrice, sSum = Value
}
import WriteState._

class SerialCommunicator(maxCount: Int) extends Module {
    val io = IO(new Bundle{
        val price = Input(UInt(5.W))
        val sum = Input(UInt(8.W))
        val update = Input(Bool())
        val tx = Output(Bool())
    })

    /* Init UART */
    val uart = Module(new BufferedTx(maxCount, 115200))
    io.tx := uart.io.txd
    uart.io.channel.valid := false.B
    uart.io.channel.bits  := 0.U

    def uintToAscii(value: UInt): Seq[UInt] = {
        val tens     = (value / 10.U) % 10.U
        val ones     = value % 10.U
        Seq(tens + 48.U(8.W), ones + 48.U(8.W))
    }

    def sendMsg(msg: Vec[UInt], nextState: WriteState.Type): Unit = {
        when (index < msg.length.U) {
            uart.io.channel.valid := true.B
            uart.io.channel.bits  := msg(index)
            when(uart.io.channel.ready) {
                index := index + 1.U
            }
        } .otherwise {
            index      := 0.U
            writeState := nextState
        }
    }


    /* Init messages */
    val formattedPrice = VecInit(
        Seq('P'.U, 'r'.U, 'i'.U, 'c'.U, 'e'.U, ':'.U, ' '.U) ++
        uintToAscii(io.price) ++
        Seq(' '.U, 'A'.U, 'T'.U, 'S'.U, '\r'.U, '\n'.U)
    )
    val formattedSum = VecInit(
        Seq('I'.U, 'n'.U, 's'.U, 'e'.U, 'r'.U, 't'.U, 'e'.U, 'd'.U, ':'.U, ' '.U) ++ 
        uintToAscii(io.sum) ++ 
        Seq(' '.U, 'A'.U, 'T'.U, 'S'.U, '\r'.U, '\n'.U)
    )
    val clearCmd = VecInit(27.U(8.W), '['.U, '2'.U, 'J'.U, 27.U, '['.U, 'H'.U) // Ascii codes for clear screen and move to top left
    val startOfRow = VecInit(13.U(8.W)) // Ascii value for \r

    val writeState = RegInit(sIdle) 
    val refresh = RegInit(false.B) // Makes the screen refresh upon completion of last write
    val index = RegInit(0.U(5.W)) // The longest message is 18 bytes wide

    when(io.update && writeState =/= sIdle) {
        refresh := true.B
    }

    switch(writeState) {
        is (sIdle) {
            index := 0.U

            when (io.update || refresh) {
                writeState := sClear
                refresh := false.B
            }
        }
        is (sClear) {
            sendMsg(clearCmd, sPrice)
        }
        is (sPrice) {
            sendMsg(formattedPrice, sSum)
        }
        is (sSum) {
            sendMsg(formattedSum, sIdle)
        }
    }
}
