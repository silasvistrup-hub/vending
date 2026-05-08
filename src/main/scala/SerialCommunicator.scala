import chisel3._
import chisel3.util._
import chisel.lib.uart._

object WriteState extends ChiselEnum {
  val wIdle, wClear, wPrice, wSum = Value
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
  

    def uintToAscii(value: UInt): Seq[UInt] = {
        val tens     = (value / 10.U) % 10.U
        val ones     = value % 10.U
        Seq(tens + 48.U(8.W), ones + 48.U(8.W))
    }    

    val msg = WireDefault(VecInit(Seq.fill(15)(0.U(8.W))))
    val writeState = RegInit(wIdle)
    val writing = RegInit(false.B)
    val index = RegInit(0.U(4.W))

    uart.io.channel.valid := writing
    uart.io.channel.bits  := msg(index)

    val currency = Seq(' '.U(8.W), 'A'.U(8.W), 'T'.U(8.W), 'S'.U(8.W), '\n'.U(8.W), '\r'.U(8.W))
    switch(writeState) {
        is(wIdle) {
            when(io.update) {
                writeState := wClear
                writing := true.B
            }
        }
        is(wClear) {
            msg := VecInit(
                Seq(
                    27.U(8.W), '['.U(8.W), '1'.U(8.W), ';'.U(8.W), '3'.U(8.W), '2'.U(8.W), 'm'.U(8.W),  // ESC[1;32m 
                    ' '.U(8.W), 27.U(8.W), '['.U(8.W), '2'.U(8.W), 'J'.U(8.W),                          // ESC[2J
                    27.U(8.W), '['.U(8.W), 'H'.U(8.W)                                                   // ESC[H
                )           
            ) // Bold green text + clear screen + home

            when(!writing) {
                writeState := wPrice
                writing := true.B
            }
        }
        is(wPrice) {
            msg := VecInit(
                Seq('P'.U(8.W), 'r'.U(8.W), 'i'.U(8.W), 'c'.U(8.W), 'e'.U(8.W), ':'.U(8.W), ' '.U(8.W)) ++
                uintToAscii(io.price) ++ 
                currency
            ) // Price: xx ATS\n\r

            when(!writing) {
                writeState := wSum
                writing := true.B
            }
        }
        is(wSum) {
            msg := VecInit(
                Seq('M'.U(8.W), 'o'.U(8.W), 'n'.U(8.W), 'e'.U(8.W), 'y'.U(8.W), ':'.U(8.W), ' '.U(8.W)) ++
                uintToAscii(io.sum) ++ 
                currency
            ) // Money: xx ATS\n\r

            when(!writing) {
                writeState := wIdle
            }
        }
    }

    when(writing) {
        when(uart.io.channel.ready) {
            when(index === 14.U) { // Length of all messages is 15 bytes and index is zero indexed
                index := 0.U
                writing := false.B
            } .otherwise {
                index := index + 1.U
            }
        }
    }
}
