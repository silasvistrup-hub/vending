import chisel3._
import chisel3.util._
import chisel.lib.uart._

class SerialCommunicator extends Module {
    val io = IO(new Bundle{
        val price = Input(UInt(5.W))
        val sum = Input(UInt(8.W))
        val update = Input(Bool())
        val tx = Output(Bool())
    })


    def uintToAscii(value: UInt): Seq[UInt] = {
        val hundreds = (value / 100.U) % 10.U
        val tens     = (value / 10.U) % 10.U
        val ones     = value % 10.U
        Seq(hundreds + 48.U, tens + 48.U, ones + 48.U)
    }

    val uart = Module(new BufferedTx(100000000, 115200))
    io.tx := uart.io.txd

    val formattedPrice = VecInit(Seq(
        'P'.U, 'r'.U, 'i'.U, 'c'.U, 'e'.U, ':'.U, ' '.U
    ) ++ uintToAscii(io.price) ++ Seq(' '.U, 'A'.U, 'T'.U, 'S'.U, '\n'.U))

    val formattedSum = VecInit(Seq(
        'I'.U, 'n'.U, 's'.U, 'e'.U, 'r'.U, 't'.U, 'e'.U, 'd'.U, ':'.U, ' '.U
    ) ++ uintToAscii(io.sum) ++ Seq(' '.U, 'A'.U, 'T'.U, 'S'.U, '\n'.U))
    
    // 00 = no write
    // 01 = write price
    // 10 = write sum
    // 11 = write space
    val write = RegInit(0.U(2.W)) 
    val refresh = RegInit(false.B) 
    val index = RegInit(0.U(8.W))
    when (io.update && write === 0.U) {
        index := 0.U
        write := "b01".U
    } .elsewhen (io.update && write =/= 0.U) {
        refresh := true.B
    }

    uart.io.channel.valid := false.B
    uart.io.channel.bits  := 0.U

    when (write === "b01".U) {
        when (index < formattedPrice.length.U) {
            uart.io.channel.valid := true.B
            uart.io.channel.bits := formattedPrice(index)

            when(uart.io.channel.ready) {
                index := index + 1.U
            }
        } .otherwise {
            index := 0.U
            write := "b10".U
        }

    } .elsewhen (write === "b10".U) {

        when (index < formattedSum.length.U) {
            uart.io.channel.valid := true.B
            uart.io.channel.bits := formattedSum(index)

            when(uart.io.channel.ready) {
                index := index + 1.U
            }
        } .otherwise {
            index := 0.U
            write := "b11".U
        }

    } .elsewhen (write === "b11".U) {
        uart.io.channel.valid := true.B
        uart.io.channel.bits := '\n'.U

        when(uart.io.channel.ready) {
            index := 0.U

            when(refresh) {
                write := "b01".U
                refresh := false.B
            } .otherwise {
                write := "b00".U
            }
        }
    }
}
