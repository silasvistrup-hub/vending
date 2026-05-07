FIRRTL version 1.2.0
circuit FSM :
  module extender :
    input clock : Clock
    input reset : Reset
    output io : { flip Ringalarm : UInt<1>, flip releasing : UInt<1>, alarm : UInt<1>, releaseCan : UInt<1>} @[src/main/scala/extender.scala 6:14]

    reg tick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/extender.scala 14:26]
    wire tick : UInt<1> @[src/main/scala/extender.scala 15:27]
    tick <= UInt<1>("h0") @[src/main/scala/extender.scala 15:27]
    node _tick_T = eq(tick_tickCnt, UInt<17>("h1869f")) @[src/main/scala/extender.scala 17:18]
    when _tick_T : @[src/main/scala/extender.scala 17:35]
      tick_tickCnt <= UInt<1>("h0") @[src/main/scala/extender.scala 18:15]
      tick <= UInt<1>("h1") @[src/main/scala/extender.scala 19:12]
    else :
      node _tick_tickCnt_T = add(tick_tickCnt, UInt<1>("h1")) @[src/main/scala/extender.scala 21:26]
      node _tick_tickCnt_T_1 = tail(_tick_tickCnt_T, 1) @[src/main/scala/extender.scala 21:26]
      tick_tickCnt <= _tick_tickCnt_T_1 @[src/main/scala/extender.scala 21:15]
    reg countSec : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[src/main/scala/extender.scala 28:25]
    when tick : @[src/main/scala/extender.scala 32:14]
      node _countSec_T = add(countSec, UInt<1>("h1")) @[src/main/scala/extender.scala 33:26]
      node _countSec_T_1 = tail(_countSec_T, 1) @[src/main/scala/extender.scala 33:26]
      countSec <= _countSec_T_1 @[src/main/scala/extender.scala 33:14]
    reg alarm : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/extender.scala 36:22]
    reg releaseCan : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/extender.scala 37:27]
    when io.Ringalarm : @[src/main/scala/extender.scala 39:22]
      alarm <= UInt<1>("h1") @[src/main/scala/extender.scala 40:11]
      countSec <= UInt<1>("h1") @[src/main/scala/extender.scala 41:14]
    when io.releasing : @[src/main/scala/extender.scala 43:22]
      releaseCan <= UInt<1>("h1") @[src/main/scala/extender.scala 44:16]
      countSec <= UInt<1>("h1") @[src/main/scala/extender.scala 45:14]
    node _T = eq(countSec, UInt<1>("h0")) @[src/main/scala/extender.scala 48:17]
    when _T : @[src/main/scala/extender.scala 48:26]
      alarm <= UInt<1>("h0") @[src/main/scala/extender.scala 49:11]
      releaseCan <= UInt<1>("h0") @[src/main/scala/extender.scala 50:16]
    io.alarm <= alarm @[src/main/scala/extender.scala 52:12]
    io.releaseCan <= releaseCan @[src/main/scala/extender.scala 53:17]

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
                          sevSeg <= UInt<7>("h71") @[src/main/scala/SevenSegDec1.scala 25:22]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                          when _T_11 : @[src/main/scala/SevenSegDec1.scala 13:17]
                            sevSeg <= UInt<6>("h3e") @[src/main/scala/SevenSegDec1.scala 26:22]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                            when _T_12 : @[src/main/scala/SevenSegDec1.scala 13:17]
                              sevSeg <= UInt<6>("h38") @[src/main/scala/SevenSegDec1.scala 27:22]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                              when _T_13 : @[src/main/scala/SevenSegDec1.scala 13:17]
                                sevSeg <= UInt<1>("h0") @[src/main/scala/SevenSegDec1.scala 28:22]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                                when _T_14 : @[src/main/scala/SevenSegDec1.scala 13:17]
                                  sevSeg <= UInt<7>("h79") @[src/main/scala/SevenSegDec1.scala 29:22]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[src/main/scala/SevenSegDec1.scala 13:17]
                                  when _T_15 : @[src/main/scala/SevenSegDec1.scala 13:17]
                                    sevSeg <= UInt<7>("h71") @[src/main/scala/SevenSegDec1.scala 30:22]
    io.out <= sevSeg @[src/main/scala/SevenSegDec1.scala 33:10]

  module DisplayMultiplexer :
    input clock : Clock
    input reset : Reset
    output io : { flip sum : UInt<8>, flip price : UInt<5>, seg : UInt<7>, an : UInt<4>, flip full : UInt<1>} @[src/main/scala/DisplayMultiplexer1.scala 6:16]

    inst decoder of SevenSegDec @[src/main/scala/DisplayMultiplexer1.scala 13:23]
    decoder.clock <= clock
    decoder.reset <= reset
    reg CountTo4 : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 14:25]
    reg FullSequence : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 15:29]
    reg CountTo16 : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 16:26]
    reg tick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 20:26]
    wire tick : UInt<1> @[src/main/scala/DisplayMultiplexer1.scala 21:27]
    tick <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 21:27]
    node _tick_T = eq(tick_tickCnt, UInt<17>("h1869f")) @[src/main/scala/DisplayMultiplexer1.scala 22:18]
    when _tick_T : @[src/main/scala/DisplayMultiplexer1.scala 22:35]
      tick_tickCnt <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 23:15]
      tick <= UInt<1>("h1") @[src/main/scala/DisplayMultiplexer1.scala 24:12]
    else :
      node _tick_tickCnt_T = add(tick_tickCnt, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 26:26]
      node _tick_tickCnt_T_1 = tail(_tick_tickCnt_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 26:26]
      tick_tickCnt <= _tick_tickCnt_T_1 @[src/main/scala/DisplayMultiplexer1.scala 26:15]
    reg slowTick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 20:26]
    wire slowTick : UInt<1> @[src/main/scala/DisplayMultiplexer1.scala 21:27]
    slowTick <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 21:27]
    node _slowTick_T = eq(slowTick_tickCnt, UInt<26>("h2160ebf")) @[src/main/scala/DisplayMultiplexer1.scala 22:18]
    when _slowTick_T : @[src/main/scala/DisplayMultiplexer1.scala 22:35]
      slowTick_tickCnt <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 23:15]
      slowTick <= UInt<1>("h1") @[src/main/scala/DisplayMultiplexer1.scala 24:12]
    else :
      node _slowTick_tickCnt_T = add(slowTick_tickCnt, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 26:26]
      node _slowTick_tickCnt_T_1 = tail(_slowTick_tickCnt_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 26:26]
      slowTick_tickCnt <= _slowTick_tickCnt_T_1 @[src/main/scala/DisplayMultiplexer1.scala 26:15]
    when tick : @[src/main/scala/DisplayMultiplexer1.scala 33:14]
      node _CountTo4_T = add(CountTo4, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 33:36]
      node _CountTo4_T_1 = tail(_CountTo4_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 33:36]
      CountTo4 <= _CountTo4_T_1 @[src/main/scala/DisplayMultiplexer1.scala 33:24]
    when slowTick : @[src/main/scala/DisplayMultiplexer1.scala 34:17]
      node _CountTo16_T = add(CountTo16, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 34:41]
      node _CountTo16_T_1 = tail(_CountTo16_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 34:41]
      CountTo16 <= _CountTo16_T_1 @[src/main/scala/DisplayMultiplexer1.scala 34:28]
    when io.full : @[src/main/scala/DisplayMultiplexer1.scala 36:17]
      FullSequence <= UInt<1>("h1") @[src/main/scala/DisplayMultiplexer1.scala 37:18]
      CountTo16 <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 38:14]
    node _T = eq(CountTo16, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 40:17]
    when _T : @[src/main/scala/DisplayMultiplexer1.scala 40:25]
      FullSequence <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 40:38]
    wire number1 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 42:28]
    number1 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 42:28]
    wire number2 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 43:28]
    number2 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 43:28]
    wire number3 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 44:28]
    number3 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 44:28]
    wire number4 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 45:28]
    number4 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 45:28]
    reg Number2Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 46:28]
    reg Number1Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 47:28]
    reg Number4Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 48:28]
    reg Number3Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 49:28]
    when slowTick : @[src/main/scala/DisplayMultiplexer1.scala 51:17]
      Number3Full <= Number4Full @[src/main/scala/DisplayMultiplexer1.scala 52:17]
      Number4Full <= Number1Full @[src/main/scala/DisplayMultiplexer1.scala 53:17]
      Number1Full <= Number2Full @[src/main/scala/DisplayMultiplexer1.scala 54:17]
    node _T_1 = eq(UInt<1>("h0"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
    when _T_1 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
      Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 58:26]
    else :
      node _T_2 = eq(UInt<1>("h1"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
      when _T_2 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
        Number2Full <= UInt<4>("hc") @[src/main/scala/DisplayMultiplexer1.scala 59:26]
      else :
        node _T_3 = eq(UInt<2>("h2"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
        when _T_3 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
          Number2Full <= UInt<4>("hc") @[src/main/scala/DisplayMultiplexer1.scala 60:26]
        else :
          node _T_4 = eq(UInt<2>("h3"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
          when _T_4 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
            Number2Full <= UInt<4>("hb") @[src/main/scala/DisplayMultiplexer1.scala 61:26]
          else :
            node _T_5 = eq(UInt<3>("h4"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
            when _T_5 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
              Number2Full <= UInt<4>("ha") @[src/main/scala/DisplayMultiplexer1.scala 62:26]
            else :
              node _T_6 = eq(UInt<3>("h5"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
              when _T_6 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 63:26]
              else :
                node _T_7 = eq(UInt<3>("h6"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                when _T_7 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                  Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 64:26]
                else :
                  node _T_8 = eq(UInt<3>("h7"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                  when _T_8 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                    Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 65:26]
                  else :
                    node _T_9 = eq(UInt<4>("h8"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                    when _T_9 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                      Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 66:26]
                    else :
                      node _T_10 = eq(UInt<4>("h9"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                      when _T_10 : @[src/main/scala/DisplayMultiplexer1.scala 57:21]
                        Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 67:26]
    node _T_11 = eq(FullSequence, UInt<1>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 70:8]
    when _T_11 : @[src/main/scala/DisplayMultiplexer1.scala 70:23]
      node _number1_T = rem(io.sum, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 71:23]
      number1 <= _number1_T @[src/main/scala/DisplayMultiplexer1.scala 71:13]
      node _number2_T = div(io.sum, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 72:23]
      number2 <= _number2_T @[src/main/scala/DisplayMultiplexer1.scala 72:13]
      node _number3_T = rem(io.price, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 73:25]
      number3 <= _number3_T @[src/main/scala/DisplayMultiplexer1.scala 73:13]
      node _number4_T = div(io.price, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 74:25]
      number4 <= _number4_T @[src/main/scala/DisplayMultiplexer1.scala 74:13]
    else :
      number1 <= Number1Full @[src/main/scala/DisplayMultiplexer1.scala 76:13]
      number2 <= Number2Full @[src/main/scala/DisplayMultiplexer1.scala 77:13]
      number3 <= Number3Full @[src/main/scala/DisplayMultiplexer1.scala 78:13]
      number4 <= Number4Full @[src/main/scala/DisplayMultiplexer1.scala 79:13]
    decoder.io.in <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 82:17]
    node _T_12 = eq(UInt<2>("h2"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 84:20]
    when _T_12 : @[src/main/scala/DisplayMultiplexer1.scala 84:20]
      decoder.io.in <= number1 @[src/main/scala/DisplayMultiplexer1.scala 85:32]
    else :
      node _T_13 = eq(UInt<2>("h3"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 84:20]
      when _T_13 : @[src/main/scala/DisplayMultiplexer1.scala 84:20]
        decoder.io.in <= number2 @[src/main/scala/DisplayMultiplexer1.scala 86:32]
      else :
        node _T_14 = eq(UInt<1>("h0"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 84:20]
        when _T_14 : @[src/main/scala/DisplayMultiplexer1.scala 84:20]
          decoder.io.in <= number3 @[src/main/scala/DisplayMultiplexer1.scala 87:32]
        else :
          node _T_15 = eq(UInt<1>("h1"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 84:20]
          when _T_15 : @[src/main/scala/DisplayMultiplexer1.scala 84:20]
            decoder.io.in <= number4 @[src/main/scala/DisplayMultiplexer1.scala 88:32]
    node _io_an_T = dshl(UInt<1>("h1"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 91:18]
    node _io_an_T_1 = not(_io_an_T) @[src/main/scala/DisplayMultiplexer1.scala 91:12]
    io.an <= _io_an_T_1 @[src/main/scala/DisplayMultiplexer1.scala 91:9]
    node _io_seg_T = not(decoder.io.out) @[src/main/scala/DisplayMultiplexer1.scala 92:13]
    io.seg <= _io_seg_T @[src/main/scala/DisplayMultiplexer1.scala 92:10]

  module Datapath :
    input clock : Clock
    input reset : Reset
    output io : { flip price : UInt<5>, flip FSMstate : UInt<3>, Full2 : UInt<1>, Full5 : UInt<1>, enough : UInt<1>, money : UInt<7>} @[src/main/scala/Datapath.scala 5:14]

    reg money : UInt<7>, clock with :
      reset => (reset, UInt<7>("h0")) @[src/main/scala/Datapath.scala 13:22]
    node _io_Full2_T = gt(money, UInt<7>("h61")) @[src/main/scala/Datapath.scala 15:22]
    io.Full2 <= _io_Full2_T @[src/main/scala/Datapath.scala 15:12]
    node _io_Full5_T = gt(money, UInt<7>("h5e")) @[src/main/scala/Datapath.scala 16:22]
    io.Full5 <= _io_Full5_T @[src/main/scala/Datapath.scala 16:12]
    node _io_enough_T = sub(io.price, UInt<1>("h1")) @[src/main/scala/Datapath.scala 17:34]
    node _io_enough_T_1 = tail(_io_enough_T, 1) @[src/main/scala/Datapath.scala 17:34]
    node _io_enough_T_2 = gt(money, _io_enough_T_1) @[src/main/scala/Datapath.scala 17:23]
    io.enough <= _io_enough_T_2 @[src/main/scala/Datapath.scala 17:13]
    node _T = eq(UInt<1>("h0"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
    when _T : @[src/main/scala/Datapath.scala 19:22]
      money <= money @[src/main/scala/Datapath.scala 20:18]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
      when _T_1 : @[src/main/scala/Datapath.scala 19:22]
        node _money_T = add(money, UInt<2>("h2")) @[src/main/scala/Datapath.scala 21:26]
        node _money_T_1 = tail(_money_T, 1) @[src/main/scala/Datapath.scala 21:26]
        money <= _money_T_1 @[src/main/scala/Datapath.scala 21:18]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
        when _T_2 : @[src/main/scala/Datapath.scala 19:22]
          node _money_T_2 = add(money, UInt<3>("h5")) @[src/main/scala/Datapath.scala 22:26]
          node _money_T_3 = tail(_money_T_2, 1) @[src/main/scala/Datapath.scala 22:26]
          money <= _money_T_3 @[src/main/scala/Datapath.scala 22:18]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
          when _T_3 : @[src/main/scala/Datapath.scala 19:22]
            money <= money @[src/main/scala/Datapath.scala 23:18]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
            when _T_4 : @[src/main/scala/Datapath.scala 19:22]
              node _money_T_4 = sub(money, io.price) @[src/main/scala/Datapath.scala 24:26]
              node _money_T_5 = tail(_money_T_4, 1) @[src/main/scala/Datapath.scala 24:26]
              money <= _money_T_5 @[src/main/scala/Datapath.scala 24:18]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
              when _T_5 : @[src/main/scala/Datapath.scala 19:22]
                money <= money @[src/main/scala/Datapath.scala 25:18]
    io.money <= money @[src/main/scala/Datapath.scala 27:12]

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
      cntReg <= UInt<1>("h0") @[src/main/scala/chisel/lib/uart/Uart.scala 39:12]
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
    output io : { flip price : UInt<5>, flip sum : UInt<8>, flip update : UInt<1>, tx : UInt<1>} @[src/main/scala/SerialCommunicator.scala 11:16]

    inst uart of BufferedTx @[src/main/scala/SerialCommunicator.scala 38:22]
    uart.clock <= clock
    uart.reset <= reset
    io.tx <= uart.io.txd @[src/main/scala/SerialCommunicator.scala 39:11]
    uart.io.channel.valid <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 40:27]
    uart.io.channel.bits <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 41:27]
    node _formattedPrice_tens_T = div(io.price, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 19:31]
    node formattedPrice_tens = rem(_formattedPrice_tens_T, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 19:39]
    node formattedPrice_ones = rem(io.price, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 20:30]
    node _formattedPrice_T = add(formattedPrice_tens, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 21:18]
    node _formattedPrice_T_1 = tail(_formattedPrice_T, 1) @[src/main/scala/SerialCommunicator.scala 21:18]
    node _formattedPrice_T_2 = add(formattedPrice_ones, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 21:36]
    node _formattedPrice_T_3 = tail(_formattedPrice_T_2, 1) @[src/main/scala/SerialCommunicator.scala 21:36]
    wire formattedPrice : UInt<8>[15] @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[0] <= UInt<7>("h50") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[1] <= UInt<7>("h72") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[2] <= UInt<7>("h69") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[3] <= UInt<7>("h63") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[4] <= UInt<7>("h65") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[5] <= UInt<6>("h3a") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[6] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[7] <= _formattedPrice_T_1 @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[8] <= _formattedPrice_T_3 @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[9] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[10] <= UInt<7>("h41") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[11] <= UInt<7>("h54") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[12] <= UInt<7>("h53") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[13] <= UInt<4>("hd") @[src/main/scala/SerialCommunicator.scala 44:33]
    formattedPrice[14] <= UInt<4>("ha") @[src/main/scala/SerialCommunicator.scala 44:33]
    node _formattedSum_tens_T = div(io.sum, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 19:31]
    node formattedSum_tens = rem(_formattedSum_tens_T, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 19:39]
    node formattedSum_ones = rem(io.sum, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 20:30]
    node _formattedSum_T = add(formattedSum_tens, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 21:18]
    node _formattedSum_T_1 = tail(_formattedSum_T, 1) @[src/main/scala/SerialCommunicator.scala 21:18]
    node _formattedSum_T_2 = add(formattedSum_ones, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 21:36]
    node _formattedSum_T_3 = tail(_formattedSum_T_2, 1) @[src/main/scala/SerialCommunicator.scala 21:36]
    wire formattedSum : UInt<8>[18] @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[0] <= UInt<7>("h49") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[1] <= UInt<7>("h6e") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[2] <= UInt<7>("h73") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[3] <= UInt<7>("h65") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[4] <= UInt<7>("h72") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[5] <= UInt<7>("h74") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[6] <= UInt<7>("h65") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[7] <= UInt<7>("h64") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[8] <= UInt<6>("h3a") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[9] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[10] <= _formattedSum_T_1 @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[11] <= _formattedSum_T_3 @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[12] <= UInt<6>("h20") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[13] <= UInt<7>("h41") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[14] <= UInt<7>("h54") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[15] <= UInt<7>("h53") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[16] <= UInt<4>("hd") @[src/main/scala/SerialCommunicator.scala 49:31]
    formattedSum[17] <= UInt<4>("ha") @[src/main/scala/SerialCommunicator.scala 49:31]
    wire clearCmd : UInt<8>[7] @[src/main/scala/SerialCommunicator.scala 54:27]
    clearCmd[0] <= UInt<8>("h1b") @[src/main/scala/SerialCommunicator.scala 54:27]
    clearCmd[1] <= UInt<7>("h5b") @[src/main/scala/SerialCommunicator.scala 54:27]
    clearCmd[2] <= UInt<6>("h32") @[src/main/scala/SerialCommunicator.scala 54:27]
    clearCmd[3] <= UInt<7>("h4a") @[src/main/scala/SerialCommunicator.scala 54:27]
    clearCmd[4] <= UInt<5>("h1b") @[src/main/scala/SerialCommunicator.scala 54:27]
    clearCmd[5] <= UInt<7>("h5b") @[src/main/scala/SerialCommunicator.scala 54:27]
    clearCmd[6] <= UInt<7>("h48") @[src/main/scala/SerialCommunicator.scala 54:27]
    wire startOfRow : UInt<8>[1] @[src/main/scala/SerialCommunicator.scala 55:29]
    startOfRow[0] <= UInt<8>("hd") @[src/main/scala/SerialCommunicator.scala 55:29]
    reg writeState : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 57:29]
    reg refresh : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 58:26]
    reg index : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[src/main/scala/SerialCommunicator.scala 59:24]
    node _T = neq(writeState, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 61:34]
    node _T_1 = and(io.update, _T) @[src/main/scala/SerialCommunicator.scala 61:20]
    when _T_1 : @[src/main/scala/SerialCommunicator.scala 61:45]
      refresh <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 62:17]
    node _T_2 = asUInt(UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 65:24]
    node _T_3 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 65:24]
    node _T_4 = eq(_T_2, _T_3) @[src/main/scala/SerialCommunicator.scala 65:24]
    when _T_4 : @[src/main/scala/SerialCommunicator.scala 65:24]
      index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 67:19]
      refresh <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 68:21]
      when io.update : @[src/main/scala/SerialCommunicator.scala 70:30]
        writeState <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 71:28]
    else :
      node _T_5 = asUInt(UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 65:24]
      node _T_6 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 65:24]
      node _T_7 = eq(_T_5, _T_6) @[src/main/scala/SerialCommunicator.scala 65:24]
      when _T_7 : @[src/main/scala/SerialCommunicator.scala 65:24]
        node _T_8 = lt(index, UInt<3>("h7")) @[src/main/scala/SerialCommunicator.scala 25:21]
        when _T_8 : @[src/main/scala/SerialCommunicator.scala 25:37]
          uart.io.channel.valid <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 26:35]
          node _uart_io_channel_bits_T = bits(index, 2, 0)
          uart.io.channel.bits <= clearCmd[_uart_io_channel_bits_T] @[src/main/scala/SerialCommunicator.scala 27:35]
          when uart.io.channel.ready : @[src/main/scala/SerialCommunicator.scala 28:41]
            node _index_T = add(index, UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 29:32]
            node _index_T_1 = tail(_index_T, 1) @[src/main/scala/SerialCommunicator.scala 29:32]
            index <= _index_T_1 @[src/main/scala/SerialCommunicator.scala 29:23]
        else :
          index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 32:24]
          writeState <= UInt<2>("h2") @[src/main/scala/SerialCommunicator.scala 33:24]
      else :
        node _T_9 = asUInt(UInt<2>("h2")) @[src/main/scala/SerialCommunicator.scala 65:24]
        node _T_10 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 65:24]
        node _T_11 = eq(_T_9, _T_10) @[src/main/scala/SerialCommunicator.scala 65:24]
        when _T_11 : @[src/main/scala/SerialCommunicator.scala 65:24]
          node _T_12 = lt(index, UInt<4>("hf")) @[src/main/scala/SerialCommunicator.scala 25:21]
          when _T_12 : @[src/main/scala/SerialCommunicator.scala 25:37]
            uart.io.channel.valid <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 26:35]
            node _uart_io_channel_bits_T_1 = bits(index, 3, 0)
            uart.io.channel.bits <= formattedPrice[_uart_io_channel_bits_T_1] @[src/main/scala/SerialCommunicator.scala 27:35]
            when uart.io.channel.ready : @[src/main/scala/SerialCommunicator.scala 28:41]
              node _index_T_2 = add(index, UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 29:32]
              node _index_T_3 = tail(_index_T_2, 1) @[src/main/scala/SerialCommunicator.scala 29:32]
              index <= _index_T_3 @[src/main/scala/SerialCommunicator.scala 29:23]
          else :
            index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 32:24]
            writeState <= UInt<2>("h3") @[src/main/scala/SerialCommunicator.scala 33:24]
        else :
          node _T_13 = asUInt(UInt<2>("h3")) @[src/main/scala/SerialCommunicator.scala 65:24]
          node _T_14 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 65:24]
          node _T_15 = eq(_T_13, _T_14) @[src/main/scala/SerialCommunicator.scala 65:24]
          when _T_15 : @[src/main/scala/SerialCommunicator.scala 65:24]
            node nextState = mux(refresh, UInt<1>("h1"), UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 81:32]
            node _T_16 = lt(index, UInt<5>("h12")) @[src/main/scala/SerialCommunicator.scala 25:21]
            when _T_16 : @[src/main/scala/SerialCommunicator.scala 25:37]
              uart.io.channel.valid <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 26:35]
              uart.io.channel.bits <= formattedSum[index] @[src/main/scala/SerialCommunicator.scala 27:35]
              when uart.io.channel.ready : @[src/main/scala/SerialCommunicator.scala 28:41]
                node _index_T_4 = add(index, UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 29:32]
                node _index_T_5 = tail(_index_T_4, 1) @[src/main/scala/SerialCommunicator.scala 29:32]
                index <= _index_T_5 @[src/main/scala/SerialCommunicator.scala 29:23]
            else :
              index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 32:24]
              writeState <= nextState @[src/main/scala/SerialCommunicator.scala 33:24]
            refresh <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 83:21]


  module FSM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>, tx : UInt<1>} @[src/main/scala/FSM.scala 10:14]

    reg stateReg : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FSM.scala 22:25]
    stateReg <= UInt<1>("h0") @[src/main/scala/FSM.scala 23:12]
    inst extender of extender @[src/main/scala/FSM.scala 25:24]
    extender.clock <= clock
    extender.reset <= reset
    inst DisplayMultiplexer of DisplayMultiplexer @[src/main/scala/FSM.scala 26:34]
    DisplayMultiplexer.clock <= clock
    DisplayMultiplexer.reset <= reset
    inst Datapath of Datapath @[src/main/scala/FSM.scala 27:24]
    Datapath.clock <= clock
    Datapath.reset <= reset
    inst SerialComs of SerialCommunicator @[src/main/scala/FSM.scala 28:26]
    SerialComs.clock <= clock
    SerialComs.reset <= reset
    reg prevCoin2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), prevCoin2) @[src/main/scala/FSM.scala 31:26]
    prevCoin2 <= io.coin2 @[src/main/scala/FSM.scala 31:26]
    reg prevCoin5 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), prevCoin5) @[src/main/scala/FSM.scala 32:26]
    prevCoin5 <= io.coin5 @[src/main/scala/FSM.scala 32:26]
    reg prevBuy : UInt<1>, clock with :
      reset => (UInt<1>("h0"), prevBuy) @[src/main/scala/FSM.scala 33:24]
    prevBuy <= io.buy @[src/main/scala/FSM.scala 33:24]
    reg prevPrice : UInt, clock with :
      reset => (UInt<1>("h0"), prevPrice) @[src/main/scala/FSM.scala 34:26]
    prevPrice <= io.price @[src/main/scala/FSM.scala 34:26]
    node _coin2Trigger_T = eq(prevCoin2, UInt<1>("h0")) @[src/main/scala/FSM.scala 37:34]
    node coin2Trigger = and(io.coin2, _coin2Trigger_T) @[src/main/scala/FSM.scala 37:31]
    node _coin5Trigger_T = eq(prevCoin5, UInt<1>("h0")) @[src/main/scala/FSM.scala 38:34]
    node coin5Trigger = and(io.coin5, _coin5Trigger_T) @[src/main/scala/FSM.scala 38:31]
    node _buyTrigger_T = eq(prevBuy, UInt<1>("h0")) @[src/main/scala/FSM.scala 39:30]
    node buyTrigger = and(io.buy, _buyTrigger_T) @[src/main/scala/FSM.scala 39:27]
    node priceTrigger = neq(io.price, prevPrice) @[src/main/scala/FSM.scala 40:31]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/FSM.scala 46:20]
    node _T_1 = asUInt(stateReg) @[src/main/scala/FSM.scala 46:20]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/FSM.scala 46:20]
    when _T_2 : @[src/main/scala/FSM.scala 46:20]
      node _T_3 = eq(Datapath.io.Full2, UInt<1>("h0")) @[src/main/scala/FSM.scala 48:28]
      node _T_4 = and(coin2Trigger, _T_3) @[src/main/scala/FSM.scala 48:25]
      when _T_4 : @[src/main/scala/FSM.scala 48:36]
        stateReg <= UInt<1>("h1") @[src/main/scala/FSM.scala 49:18]
      else :
        node _T_5 = eq(Datapath.io.Full5, UInt<1>("h0")) @[src/main/scala/FSM.scala 50:34]
        node _T_6 = and(coin5Trigger, _T_5) @[src/main/scala/FSM.scala 50:31]
        when _T_6 : @[src/main/scala/FSM.scala 50:42]
          stateReg <= UInt<2>("h2") @[src/main/scala/FSM.scala 51:18]
        else :
          node _T_7 = eq(Datapath.io.enough, UInt<1>("h0")) @[src/main/scala/FSM.scala 52:32]
          node _T_8 = and(buyTrigger, _T_7) @[src/main/scala/FSM.scala 52:29]
          when _T_8 : @[src/main/scala/FSM.scala 52:41]
            stateReg <= UInt<2>("h3") @[src/main/scala/FSM.scala 53:18]
          else :
            node _T_9 = and(buyTrigger, Datapath.io.enough) @[src/main/scala/FSM.scala 54:29]
            when _T_9 : @[src/main/scala/FSM.scala 54:40]
              stateReg <= UInt<3>("h4") @[src/main/scala/FSM.scala 55:18]
            else :
              node _T_10 = and(coin2Trigger, Datapath.io.Full2) @[src/main/scala/FSM.scala 56:31]
              when _T_10 : @[src/main/scala/FSM.scala 56:41]
                stateReg <= UInt<3>("h5") @[src/main/scala/FSM.scala 57:18]
              else :
                node _T_11 = and(coin5Trigger, Datapath.io.Full5) @[src/main/scala/FSM.scala 58:31]
                when _T_11 : @[src/main/scala/FSM.scala 58:41]
                  stateReg <= UInt<3>("h5") @[src/main/scala/FSM.scala 59:18]
    node _extender_io_Ringalarm_T = eq(stateReg, UInt<2>("h3")) @[src/main/scala/FSM.scala 64:38]
    extender.io.Ringalarm <= _extender_io_Ringalarm_T @[src/main/scala/FSM.scala 64:25]
    node _extender_io_releasing_T = eq(stateReg, UInt<3>("h4")) @[src/main/scala/FSM.scala 65:38]
    extender.io.releasing <= _extender_io_releasing_T @[src/main/scala/FSM.scala 65:25]
    node _Datapath_io_FSMstate_T = asUInt(stateReg) @[src/main/scala/FSM.scala 66:36]
    Datapath.io.FSMstate <= _Datapath_io_FSMstate_T @[src/main/scala/FSM.scala 66:24]
    node _DisplayMultiplexer_io_full_T = eq(stateReg, UInt<3>("h5")) @[src/main/scala/FSM.scala 69:43]
    DisplayMultiplexer.io.full <= _DisplayMultiplexer_io_full_T @[src/main/scala/FSM.scala 69:30]
    DisplayMultiplexer.io.sum <= Datapath.io.money @[src/main/scala/FSM.scala 70:29]
    DisplayMultiplexer.io.price <= io.price @[src/main/scala/FSM.scala 71:31]
    io.tx <= SerialComs.io.tx @[src/main/scala/FSM.scala 74:9]
    SerialComs.io.price <= io.price @[src/main/scala/FSM.scala 75:23]
    SerialComs.io.sum <= Datapath.io.money @[src/main/scala/FSM.scala 76:21]
    node _SerialComs_io_update_T = or(coin2Trigger, coin5Trigger) @[src/main/scala/FSM.scala 77:40]
    node _SerialComs_io_update_T_1 = or(_SerialComs_io_update_T, buyTrigger) @[src/main/scala/FSM.scala 77:55]
    node _SerialComs_io_update_T_2 = or(_SerialComs_io_update_T_1, priceTrigger) @[src/main/scala/FSM.scala 77:68]
    SerialComs.io.update <= _SerialComs_io_update_T_2 @[src/main/scala/FSM.scala 77:24]
    Datapath.io.price <= io.price @[src/main/scala/FSM.scala 80:21]
    io.alarm <= extender.io.alarm @[src/main/scala/FSM.scala 82:12]
    io.releaseCan <= extender.io.releaseCan @[src/main/scala/FSM.scala 83:17]
    io.seg <= DisplayMultiplexer.io.seg @[src/main/scala/FSM.scala 84:10]
    io.an <= DisplayMultiplexer.io.an @[src/main/scala/FSM.scala 85:9]
    io.tx <= UInt<1>("h0") @[src/main/scala/FSM.scala 86:9]

