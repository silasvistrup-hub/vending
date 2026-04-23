FIRRTL version 1.2.0
circuit VendingMachine :
  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>} @[src/main/scala/SevenSegDec1.scala 6:14]

    wire sevSeg : UInt @[src/main/scala/SevenSegDec1.scala 11:27]
    sevSeg <= UInt<1>("h0") @[src/main/scala/SevenSegDec1.scala 11:27]
    node _T = eq(UInt<1>("h0"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
    when _T : @[src/main/scala/SevenSegDec1.scala 13:17]
      sevSeg <= UInt<6>("h3f") @[src/main/scala/SevenSegDec1.scala 15:21]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
      when _T_1 : @[src/main/scala/SevenSegDec1.scala 13:17]
        sevSeg <= UInt<3>("h6") @[src/main/scala/SevenSegDec1.scala 16:21]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
        when _T_2 : @[src/main/scala/SevenSegDec1.scala 13:17]
          sevSeg <= UInt<7>("h5b") @[src/main/scala/SevenSegDec1.scala 17:21]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
          when _T_3 : @[src/main/scala/SevenSegDec1.scala 13:17]
            sevSeg <= UInt<7>("h4f") @[src/main/scala/SevenSegDec1.scala 18:21]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
            when _T_4 : @[src/main/scala/SevenSegDec1.scala 13:17]
              sevSeg <= UInt<7>("h66") @[src/main/scala/SevenSegDec1.scala 19:21]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
              when _T_5 : @[src/main/scala/SevenSegDec1.scala 13:17]
                sevSeg <= UInt<7>("h6d") @[src/main/scala/SevenSegDec1.scala 20:21]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                when _T_6 : @[src/main/scala/SevenSegDec1.scala 13:17]
                  sevSeg <= UInt<7>("h7d") @[src/main/scala/SevenSegDec1.scala 21:21]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                  when _T_7 : @[src/main/scala/SevenSegDec1.scala 13:17]
                    sevSeg <= UInt<3>("h7") @[src/main/scala/SevenSegDec1.scala 22:21]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                    when _T_8 : @[src/main/scala/SevenSegDec1.scala 13:17]
                      sevSeg <= UInt<7>("h7f") @[src/main/scala/SevenSegDec1.scala 23:21]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                      when _T_9 : @[src/main/scala/SevenSegDec1.scala 13:17]
                        sevSeg <= UInt<7>("h6f") @[src/main/scala/SevenSegDec1.scala 24:21]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                        when _T_10 : @[src/main/scala/SevenSegDec1.scala 13:17]
                          sevSeg <= UInt<7>("h77") @[src/main/scala/SevenSegDec1.scala 25:22]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                          when _T_11 : @[src/main/scala/SevenSegDec1.scala 13:17]
                            sevSeg <= UInt<7>("h7c") @[src/main/scala/SevenSegDec1.scala 26:22]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                            when _T_12 : @[src/main/scala/SevenSegDec1.scala 13:17]
                              sevSeg <= UInt<6>("h39") @[src/main/scala/SevenSegDec1.scala 27:22]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                              when _T_13 : @[src/main/scala/SevenSegDec1.scala 13:17]
                                sevSeg <= UInt<7>("h5e") @[src/main/scala/SevenSegDec1.scala 28:22]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                                when _T_14 : @[src/main/scala/SevenSegDec1.scala 13:17]
                                  sevSeg <= UInt<7>("h79") @[src/main/scala/SevenSegDec1.scala 29:22]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                                  when _T_15 : @[src/main/scala/SevenSegDec1.scala 13:17]
                                    sevSeg <= UInt<7>("h71") @[src/main/scala/SevenSegDec1.scala 30:22]
    io.out <= sevSeg @[src/main/scala/SevenSegDec1.scala 32:10]

  module DisplayMultiplexer :
    input clock : Clock
    input reset : Reset
    output io : { flip sum : UInt<8>, flip price : UInt<5>, seg : UInt<7>, an : UInt<4>} @[src/main/scala/DisplayMultiplexer1.scala 6:14]

    inst decoder of SevenSegDec @[src/main/scala/DisplayMultiplexer1.scala 12:23]
    decoder.clock <= clock
    decoder.reset <= reset
    reg count_to_4 : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 13:27]
    reg tick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 17:26]
    wire tick : UInt<1> @[src/main/scala/DisplayMultiplexer1.scala 18:27]
    tick <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 18:27]
    node _tick_T = eq(tick_tickCnt, UInt<17>("h1869f")) @[src/main/scala/DisplayMultiplexer1.scala 20:18]
    when _tick_T : @[src/main/scala/DisplayMultiplexer1.scala 20:35]
      tick_tickCnt <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 21:15]
      tick <= UInt<1>("h1") @[src/main/scala/DisplayMultiplexer1.scala 22:12]
    else :
      node _tick_tickCnt_T = add(tick_tickCnt, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 24:26]
      node _tick_tickCnt_T_1 = tail(_tick_tickCnt_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 24:26]
      tick_tickCnt <= _tick_tickCnt_T_1 @[src/main/scala/DisplayMultiplexer1.scala 24:15]
    when tick : @[src/main/scala/DisplayMultiplexer1.scala 32:14]
      node _count_to_4_T = add(count_to_4, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 33:30]
      node _count_to_4_T_1 = tail(_count_to_4_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 33:30]
      count_to_4 <= _count_to_4_T_1 @[src/main/scala/DisplayMultiplexer1.scala 33:16]
    wire number1 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 37:28]
    number1 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 37:28]
    wire number2 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 38:28]
    number2 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 38:28]
    wire number3 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 39:28]
    number3 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 39:28]
    wire number4 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 40:28]
    number4 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 40:28]
    node _number2_T = div(io.sum, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 43:21]
    number2 <= _number2_T @[src/main/scala/DisplayMultiplexer1.scala 43:11]
    node _number1_T = rem(io.sum, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 44:21]
    number1 <= _number1_T @[src/main/scala/DisplayMultiplexer1.scala 44:11]
    node _number4_T = div(io.price, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 45:23]
    number4 <= _number4_T @[src/main/scala/DisplayMultiplexer1.scala 45:11]
    node _number3_T = rem(io.price, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 46:23]
    number3 <= _number3_T @[src/main/scala/DisplayMultiplexer1.scala 46:11]
    decoder.io.in <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 48:17]
    node _T = eq(UInt<1>("h0"), count_to_4) @[src/main/scala/DisplayMultiplexer1.scala 50:22]
    when _T : @[src/main/scala/DisplayMultiplexer1.scala 50:22]
      decoder.io.in <= number3 @[src/main/scala/DisplayMultiplexer1.scala 52:32]
    else :
      node _T_1 = eq(UInt<1>("h1"), count_to_4) @[src/main/scala/DisplayMultiplexer1.scala 50:22]
      when _T_1 : @[src/main/scala/DisplayMultiplexer1.scala 50:22]
        decoder.io.in <= number4 @[src/main/scala/DisplayMultiplexer1.scala 53:32]
      else :
        node _T_2 = eq(UInt<2>("h2"), count_to_4) @[src/main/scala/DisplayMultiplexer1.scala 50:22]
        when _T_2 : @[src/main/scala/DisplayMultiplexer1.scala 50:22]
          decoder.io.in <= number1 @[src/main/scala/DisplayMultiplexer1.scala 54:32]
        else :
          node _T_3 = eq(UInt<2>("h3"), count_to_4) @[src/main/scala/DisplayMultiplexer1.scala 50:22]
          when _T_3 : @[src/main/scala/DisplayMultiplexer1.scala 50:22]
            decoder.io.in <= number2 @[src/main/scala/DisplayMultiplexer1.scala 55:32]
    node _io_an_T = dshl(UInt<1>("h1"), count_to_4) @[src/main/scala/DisplayMultiplexer1.scala 59:18]
    node _io_an_T_1 = not(_io_an_T) @[src/main/scala/DisplayMultiplexer1.scala 59:12]
    io.an <= _io_an_T_1 @[src/main/scala/DisplayMultiplexer1.scala 59:9]
    node _io_seg_T = not(decoder.io.out) @[src/main/scala/DisplayMultiplexer1.scala 60:13]
    io.seg <= _io_seg_T @[src/main/scala/DisplayMultiplexer1.scala 60:10]

  module Tx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/chisel/lib/uart/Uart.scala 23:14]

    reg shiftReg : UInt, clock with :
      reset => (reset, UInt<11>("h7ff")) @[src/main/scala/chisel/lib/uart/Uart.scala 30:25]
    reg cntReg : UInt<20>, clock with :
      reset => (reset, UInt<20>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 31:23]
    reg bitsReg : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 32:24]
    node _io_channel_ready_T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 34:31]
    node _io_channel_ready_T_1 = eq(bitsReg, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 34:52]
    node _io_channel_ready_T_2 = and(_io_channel_ready_T, _io_channel_ready_T_1) @[src/main/scala/chisel/lib/uart/Uart.scala 34:40]
    io.channel.ready <= _io_channel_ready_T_2 @[src/main/scala/chisel/lib/uart/Uart.scala 34:20]
    node _io_txd_T = bits(shiftReg, 0, 0) @[src/main/scala/chisel/lib/uart/Uart.scala 35:21]
    io.txd <= _io_txd_T @[src/main/scala/chisel/lib/uart/Uart.scala 35:10]
    node _T = eq(cntReg, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 37:15]
    when _T : @[src/main/scala/chisel/lib/uart/Uart.scala 37:24]
      cntReg <= UInt<10>("h363") @[src/main/scala/chisel/lib/uart/Uart.scala 39:12]
      node _T_1 = neq(bitsReg, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 40:18]
      when _T_1 : @[src/main/scala/chisel/lib/uart/Uart.scala 40:27]
        node shift = shr(shiftReg, 1) @[src/main/scala/chisel/lib/uart/Uart.scala 41:28]
        node _shiftReg_T = bits(shift, 9, 0) @[src/main/scala/chisel/lib/uart/Uart.scala 42:33]
        node _shiftReg_T_1 = cat(UInt<1>("h1"), _shiftReg_T) @[src/main/scala/chisel/lib/uart/Uart.scala 42:22]
        shiftReg <= _shiftReg_T_1 @[src/main/scala/chisel/lib/uart/Uart.scala 42:16]
        node _bitsReg_T = sub(bitsReg, UInt<1>("h1")) @[src/main/scala/chisel/lib/uart/Uart.scala 43:26]
        node _bitsReg_T_1 = tail(_bitsReg_T, 1) @[src/main/scala/chisel/lib/uart/Uart.scala 43:26]
        bitsReg <= _bitsReg_T_1 @[src/main/scala/chisel/lib/uart/Uart.scala 43:15]
      else :
        when io.channel.valid : @[src/main/scala/chisel/lib/uart/Uart.scala 45:30]
          node _shiftReg_T_2 = cat(UInt<2>("h3"), io.channel.bits) @[src/main/scala/chisel/lib/uart/Uart.scala 46:28]
          node _shiftReg_T_3 = cat(_shiftReg_T_2, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 46:24]
          shiftReg <= _shiftReg_T_3 @[src/main/scala/chisel/lib/uart/Uart.scala 46:18]
          bitsReg <= UInt<4>("hb") @[src/main/scala/chisel/lib/uart/Uart.scala 47:17]
        else :
          shiftReg <= UInt<11>("h7ff") @[src/main/scala/chisel/lib/uart/Uart.scala 49:18]
    else :
      node _cntReg_T = sub(cntReg, UInt<1>("h1")) @[src/main/scala/chisel/lib/uart/Uart.scala 54:22]
      node _cntReg_T_1 = tail(_cntReg_T, 1) @[src/main/scala/chisel/lib/uart/Uart.scala 54:22]
      cntReg <= _cntReg_T_1 @[src/main/scala/chisel/lib/uart/Uart.scala 54:12]


  module Buffer :
    input clock : Clock
    input reset : Reset
    output io : { flip in : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}, out : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/chisel/lib/uart/Uart.scala 111:14]

    reg stateReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 117:25]
    reg dataReg : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 118:24]
    node _io_in_ready_T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 120:27]
    io.in.ready <= _io_in_ready_T @[src/main/scala/chisel/lib/uart/Uart.scala 120:15]
    node _io_out_valid_T = eq(stateReg, UInt<1>("h1")) @[src/main/scala/chisel/lib/uart/Uart.scala 121:28]
    io.out.valid <= _io_out_valid_T @[src/main/scala/chisel/lib/uart/Uart.scala 121:16]
    node _T = eq(stateReg, UInt<1>("h0")) @[src/main/scala/chisel/lib/uart/Uart.scala 123:17]
    when _T : @[src/main/scala/chisel/lib/uart/Uart.scala 123:28]
      when io.in.valid : @[src/main/scala/chisel/lib/uart/Uart.scala 124:23]
        dataReg <= io.in.bits @[src/main/scala/chisel/lib/uart/Uart.scala 125:15]
        stateReg <= UInt<1>("h1") @[src/main/scala/chisel/lib/uart/Uart.scala 126:16]
    else :
      when io.out.ready : @[src/main/scala/chisel/lib/uart/Uart.scala 129:24]
        stateReg <= UInt<1>("h0") @[src/main/scala/chisel/lib/uart/Uart.scala 130:16]
    io.out.bits <= dataReg @[src/main/scala/chisel/lib/uart/Uart.scala 133:15]

  module BufferedTx :
    input clock : Clock
    input reset : Reset
    output io : { txd : UInt<1>, flip channel : { flip ready : UInt<1>, valid : UInt<1>, bits : UInt<8>}} @[src/main/scala/chisel/lib/uart/Uart.scala 140:14]

    inst tx of Tx @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
    tx.clock <= clock
    tx.reset <= reset
    inst buf of Buffer @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
    buf.clock <= clock
    buf.reset <= reset
    buf.io.in <= io.channel @[src/main/scala/chisel/lib/uart/Uart.scala 147:13]
    tx.io.channel <= buf.io.out @[src/main/scala/chisel/lib/uart/Uart.scala 148:17]
    io.txd <= tx.io.txd @[src/main/scala/chisel/lib/uart/Uart.scala 149:10]

  module SerialCommunicator :
    input clock : Clock
    input reset : Reset
    output io : { flip price : UInt<5>, flip sum : UInt<8>, flip update : UInt<1>, tx : UInt<1>} @[src/main/scala/SerialCommunicator.scala 6:16]

    inst uart of BufferedTx @[src/main/scala/SerialCommunicator.scala 21:22]
    uart.clock <= clock
    uart.reset <= reset
    io.tx <= uart.io.txd @[src/main/scala/SerialCommunicator.scala 22:11]
    node _formattedPrice_hundreds_T = div(io.price, UInt<7>("h64")) @[src/main/scala/SerialCommunicator.scala 15:31]
    node formattedPrice_hundreds = rem(_formattedPrice_hundreds_T, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 15:40]
    node _formattedPrice_tens_T = div(io.price, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 16:31]
    node formattedPrice_tens = rem(_formattedPrice_tens_T, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 16:39]
    node formattedPrice_ones = rem(io.price, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 17:30]
    node _formattedPrice_T = add(formattedPrice_hundreds, UInt<6>("h30")) @[src/main/scala/SerialCommunicator.scala 18:22]
    node _formattedPrice_T_1 = tail(_formattedPrice_T, 1) @[src/main/scala/SerialCommunicator.scala 18:22]
    node _formattedPrice_T_2 = add(formattedPrice_tens, UInt<6>("h30")) @[src/main/scala/SerialCommunicator.scala 18:35]
    node _formattedPrice_T_3 = tail(_formattedPrice_T_2, 1) @[src/main/scala/SerialCommunicator.scala 18:35]
    node _formattedPrice_T_4 = add(formattedPrice_ones, UInt<6>("h30")) @[src/main/scala/SerialCommunicator.scala 18:48]
    node _formattedPrice_T_5 = tail(_formattedPrice_T_4, 1) @[src/main/scala/SerialCommunicator.scala 18:48]
    wire formattedPrice : UInt<7>[15] @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[0] <= UInt<7>("h50") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[1] <= UInt<7>("h72") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[2] <= UInt<7>("h69") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[3] <= UInt<7>("h63") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[4] <= UInt<7>("h65") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[5] <= UInt<6>("h3a") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[6] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[7] <= _formattedPrice_T_1 @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[8] <= _formattedPrice_T_3 @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[9] <= _formattedPrice_T_5 @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[10] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[11] <= UInt<7>("h41") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[12] <= UInt<7>("h54") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[13] <= UInt<7>("h53") @[src/main/scala/SerialCommunicator.scala 24:33]
    formattedPrice[14] <= UInt<4>("ha") @[src/main/scala/SerialCommunicator.scala 24:33]
    node _formattedSum_hundreds_T = div(io.sum, UInt<7>("h64")) @[src/main/scala/SerialCommunicator.scala 15:31]
    node formattedSum_hundreds = rem(_formattedSum_hundreds_T, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 15:40]
    node _formattedSum_tens_T = div(io.sum, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 16:31]
    node formattedSum_tens = rem(_formattedSum_tens_T, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 16:39]
    node formattedSum_ones = rem(io.sum, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 17:30]
    node _formattedSum_T = add(formattedSum_hundreds, UInt<6>("h30")) @[src/main/scala/SerialCommunicator.scala 18:22]
    node _formattedSum_T_1 = tail(_formattedSum_T, 1) @[src/main/scala/SerialCommunicator.scala 18:22]
    node _formattedSum_T_2 = add(formattedSum_tens, UInt<6>("h30")) @[src/main/scala/SerialCommunicator.scala 18:35]
    node _formattedSum_T_3 = tail(_formattedSum_T_2, 1) @[src/main/scala/SerialCommunicator.scala 18:35]
    node _formattedSum_T_4 = add(formattedSum_ones, UInt<6>("h30")) @[src/main/scala/SerialCommunicator.scala 18:48]
    node _formattedSum_T_5 = tail(_formattedSum_T_4, 1) @[src/main/scala/SerialCommunicator.scala 18:48]
    wire formattedSum : UInt<7>[18] @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[0] <= UInt<7>("h49") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[1] <= UInt<7>("h6e") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[2] <= UInt<7>("h73") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[3] <= UInt<7>("h65") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[4] <= UInt<7>("h72") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[5] <= UInt<7>("h74") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[6] <= UInt<7>("h65") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[7] <= UInt<7>("h64") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[8] <= UInt<6>("h3a") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[9] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[10] <= _formattedSum_T_1 @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[11] <= _formattedSum_T_3 @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[12] <= _formattedSum_T_5 @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[13] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[14] <= UInt<7>("h41") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[15] <= UInt<7>("h54") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[16] <= UInt<7>("h53") @[src/main/scala/SerialCommunicator.scala 28:31]
    formattedSum[17] <= UInt<4>("ha") @[src/main/scala/SerialCommunicator.scala 28:31]
    reg write : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/SerialCommunicator.scala 36:24]
    reg refresh : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 37:26]
    reg index : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/SerialCommunicator.scala 38:24]
    node _T = eq(write, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 39:30]
    node _T_1 = and(io.update, _T) @[src/main/scala/SerialCommunicator.scala 39:21]
    when _T_1 : @[src/main/scala/SerialCommunicator.scala 39:39]
      index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 40:15]
      write <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 41:15]
    else :
      node _T_2 = neq(write, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 42:37]
      node _T_3 = and(io.update, _T_2) @[src/main/scala/SerialCommunicator.scala 42:28]
      when _T_3 : @[src/main/scala/SerialCommunicator.scala 42:46]
        refresh <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 43:17]
    uart.io.channel.valid <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 46:27]
    uart.io.channel.bits <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 47:27]
    node _T_4 = eq(write, UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 49:17]
    when _T_4 : @[src/main/scala/SerialCommunicator.scala 49:30]
      node _T_5 = lt(index, UInt<4>("hf")) @[src/main/scala/SerialCommunicator.scala 50:21]
      when _T_5 : @[src/main/scala/SerialCommunicator.scala 50:48]
        uart.io.channel.valid <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 51:35]
        node _uart_io_channel_bits_T = bits(index, 3, 0)
        uart.io.channel.bits <= formattedPrice[_uart_io_channel_bits_T] @[src/main/scala/SerialCommunicator.scala 52:34]
        when uart.io.channel.ready : @[src/main/scala/SerialCommunicator.scala 54:41]
          node _index_T = add(index, UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 55:32]
          node _index_T_1 = tail(_index_T, 1) @[src/main/scala/SerialCommunicator.scala 55:32]
          index <= _index_T_1 @[src/main/scala/SerialCommunicator.scala 55:23]
      else :
        index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 58:19]
        write <= UInt<2>("h2") @[src/main/scala/SerialCommunicator.scala 59:19]
    else :
      node _T_6 = eq(write, UInt<2>("h2")) @[src/main/scala/SerialCommunicator.scala 62:24]
      when _T_6 : @[src/main/scala/SerialCommunicator.scala 62:37]
        node _T_7 = lt(index, UInt<5>("h12")) @[src/main/scala/SerialCommunicator.scala 64:21]
        when _T_7 : @[src/main/scala/SerialCommunicator.scala 64:46]
          uart.io.channel.valid <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 65:35]
          node _uart_io_channel_bits_T_1 = bits(index, 4, 0)
          uart.io.channel.bits <= formattedSum[_uart_io_channel_bits_T_1] @[src/main/scala/SerialCommunicator.scala 66:34]
          when uart.io.channel.ready : @[src/main/scala/SerialCommunicator.scala 68:41]
            node _index_T_2 = add(index, UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 69:32]
            node _index_T_3 = tail(_index_T_2, 1) @[src/main/scala/SerialCommunicator.scala 69:32]
            index <= _index_T_3 @[src/main/scala/SerialCommunicator.scala 69:23]
        else :
          index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 72:19]
          write <= UInt<2>("h3") @[src/main/scala/SerialCommunicator.scala 73:19]
      else :
        node _T_8 = eq(write, UInt<2>("h3")) @[src/main/scala/SerialCommunicator.scala 76:24]
        when _T_8 : @[src/main/scala/SerialCommunicator.scala 76:37]
          uart.io.channel.valid <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 77:31]
          uart.io.channel.bits <= UInt<4>("ha") @[src/main/scala/SerialCommunicator.scala 78:30]
          when uart.io.channel.ready : @[src/main/scala/SerialCommunicator.scala 80:37]
            index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 81:19]
            when refresh : @[src/main/scala/SerialCommunicator.scala 83:27]
              write <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 84:23]
              refresh <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 85:25]
            else :
              write <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 87:23]


  module VendingMachine :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>} @[src/main/scala/VendingMachine.scala 5:14]

    inst DisplayMultiplexer of DisplayMultiplexer @[src/main/scala/VendingMachine.scala 16:34]
    DisplayMultiplexer.clock <= clock
    DisplayMultiplexer.reset <= reset
    reg Value : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[src/main/scala/VendingMachine.scala 18:22]
    node Full2 = gt(Value, UInt<7>("h61")) @[src/main/scala/VendingMachine.scala 19:21]
    node Full5 = gt(Value, UInt<7>("h5e")) @[src/main/scala/VendingMachine.scala 20:21]
    node enough = geq(Value, io.price) @[src/main/scala/VendingMachine.scala 21:22]
    reg count_to_4 : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[src/main/scala/VendingMachine.scala 22:27]
    reg coin2_previous : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin2_previous) @[src/main/scala/VendingMachine.scala 25:31]
    coin2_previous <= io.coin2 @[src/main/scala/VendingMachine.scala 25:31]
    reg coin5_previous : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin5_previous) @[src/main/scala/VendingMachine.scala 26:31]
    coin5_previous <= io.coin5 @[src/main/scala/VendingMachine.scala 26:31]
    reg buy_previous : UInt<1>, clock with :
      reset => (UInt<1>("h0"), buy_previous) @[src/main/scala/VendingMachine.scala 27:31]
    buy_previous <= io.buy @[src/main/scala/VendingMachine.scala 27:31]
    node _coin2_change_T = eq(coin2_previous, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 29:34]
    node coin2_change = and(io.coin2, _coin2_change_T) @[src/main/scala/VendingMachine.scala 29:31]
    node _coin5_change_T = eq(coin5_previous, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 30:34]
    node coin5_change = and(io.coin5, _coin5_change_T) @[src/main/scala/VendingMachine.scala 30:31]
    node _buy_change_T = eq(buy_previous, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 31:32]
    node buy_change = and(io.buy, _buy_change_T) @[src/main/scala/VendingMachine.scala 31:29]
    inst SerialComs of SerialCommunicator @[src/main/scala/VendingMachine.scala 33:26]
    SerialComs.clock <= clock
    SerialComs.reset <= reset
    SerialComs.io.price <= io.price @[src/main/scala/VendingMachine.scala 34:23]
    SerialComs.io.sum <= Value @[src/main/scala/VendingMachine.scala 35:21]
    node _SerialComs_io_update_T = or(coin2_change, coin5_change) @[src/main/scala/VendingMachine.scala 36:40]
    node _SerialComs_io_update_T_1 = or(_SerialComs_io_update_T, buy_change) @[src/main/scala/VendingMachine.scala 36:56]
    SerialComs.io.update <= _SerialComs_io_update_T_1 @[src/main/scala/VendingMachine.scala 36:24]
    node _T = eq(Full2, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 38:24]
    node _T_1 = and(coin2_change, _T) @[src/main/scala/VendingMachine.scala 38:21]
    when _T_1 : @[src/main/scala/VendingMachine.scala 38:32]
      node _Value_T = add(Value, UInt<2>("h2")) @[src/main/scala/VendingMachine.scala 39:20]
      node _Value_T_1 = tail(_Value_T, 1) @[src/main/scala/VendingMachine.scala 39:20]
      Value <= _Value_T_1 @[src/main/scala/VendingMachine.scala 39:11]
    else :
      node _T_2 = eq(Full5, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 40:30]
      node _T_3 = and(coin5_change, _T_2) @[src/main/scala/VendingMachine.scala 40:27]
      when _T_3 : @[src/main/scala/VendingMachine.scala 40:38]
        node _Value_T_2 = add(Value, UInt<3>("h5")) @[src/main/scala/VendingMachine.scala 41:20]
        node _Value_T_3 = tail(_Value_T_2, 1) @[src/main/scala/VendingMachine.scala 41:20]
        Value <= _Value_T_3 @[src/main/scala/VendingMachine.scala 41:11]
      else :
        node _T_4 = and(buy_change, enough) @[src/main/scala/VendingMachine.scala 42:25]
        when _T_4 : @[src/main/scala/VendingMachine.scala 42:36]
          node _Value_T_4 = sub(Value, io.price) @[src/main/scala/VendingMachine.scala 43:20]
          node _Value_T_5 = tail(_Value_T_4, 1) @[src/main/scala/VendingMachine.scala 43:20]
          Value <= _Value_T_5 @[src/main/scala/VendingMachine.scala 43:11]
    reg ringalarm : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 46:26]
    node _T_5 = eq(enough, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 47:23]
    node _T_6 = and(buy_change, _T_5) @[src/main/scala/VendingMachine.scala 47:20]
    when _T_6 : @[src/main/scala/VendingMachine.scala 47:32]
      ringalarm <= UInt<1>("h1") @[src/main/scala/VendingMachine.scala 48:14]
      count_to_4 <= UInt<1>("h1") @[src/main/scala/VendingMachine.scala 49:16]
    reg dispense : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 51:25]
    node _T_7 = eq(count_to_4, UInt<1>("h0")) @[src/main/scala/VendingMachine.scala 52:19]
    when _T_7 : @[src/main/scala/VendingMachine.scala 52:28]
      ringalarm <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 53:15]
      dispense <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 54:14]
    node _T_8 = and(buy_change, enough) @[src/main/scala/VendingMachine.scala 58:20]
    when _T_8 : @[src/main/scala/VendingMachine.scala 58:31]
      dispense <= UInt<1>("h1") @[src/main/scala/VendingMachine.scala 59:13]
      count_to_4 <= UInt<1>("h1") @[src/main/scala/VendingMachine.scala 60:14]
    reg tick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/VendingMachine.scala 64:26]
    wire tick : UInt<1> @[src/main/scala/VendingMachine.scala 65:27]
    tick <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 65:27]
    node _tick_T = eq(tick_tickCnt, UInt<17>("h1869f")) @[src/main/scala/VendingMachine.scala 67:18]
    when _tick_T : @[src/main/scala/VendingMachine.scala 67:35]
      tick_tickCnt <= UInt<1>("h0") @[src/main/scala/VendingMachine.scala 68:15]
      tick <= UInt<1>("h1") @[src/main/scala/VendingMachine.scala 69:12]
    else :
      node _tick_tickCnt_T = add(tick_tickCnt, UInt<1>("h1")) @[src/main/scala/VendingMachine.scala 71:26]
      node _tick_tickCnt_T_1 = tail(_tick_tickCnt_T, 1) @[src/main/scala/VendingMachine.scala 71:26]
      tick_tickCnt <= _tick_tickCnt_T_1 @[src/main/scala/VendingMachine.scala 71:15]
    when tick : @[src/main/scala/VendingMachine.scala 79:14]
      node _count_to_4_T = add(count_to_4, UInt<1>("h1")) @[src/main/scala/VendingMachine.scala 80:30]
      node _count_to_4_T_1 = tail(_count_to_4_T, 1) @[src/main/scala/VendingMachine.scala 80:30]
      count_to_4 <= _count_to_4_T_1 @[src/main/scala/VendingMachine.scala 80:16]
    io.alarm <= ringalarm @[src/main/scala/VendingMachine.scala 85:12]
    io.releaseCan <= dispense @[src/main/scala/VendingMachine.scala 86:17]
    DisplayMultiplexer.io.sum <= Value @[src/main/scala/VendingMachine.scala 87:28]
    DisplayMultiplexer.io.price <= io.price @[src/main/scala/VendingMachine.scala 88:31]
    io.seg <= DisplayMultiplexer.io.seg @[src/main/scala/VendingMachine.scala 89:10]
    io.an <= DisplayMultiplexer.io.an @[src/main/scala/VendingMachine.scala 90:9]

