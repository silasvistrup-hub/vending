FIRRTL version 1.2.0
circuit FSM :
  module TickGenerator :
    input clock : Clock
    input reset : Reset
    output io : { tickOut : UInt<1>} @[src/main/scala/TickGenerator.scala 5:14]

    reg tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/TickGenerator.scala 8:24]
    wire tick : UInt<1> @[src/main/scala/TickGenerator.scala 9:25]
    tick <= UInt<1>("h0") @[src/main/scala/TickGenerator.scala 9:25]
    node _T = sub(UInt<14>("h2710"), UInt<1>("h1")) @[src/main/scala/TickGenerator.scala 11:32]
    node _T_1 = tail(_T, 1) @[src/main/scala/TickGenerator.scala 11:32]
    node _T_2 = eq(tickCnt, _T_1) @[src/main/scala/TickGenerator.scala 11:16]
    when _T_2 : @[src/main/scala/TickGenerator.scala 11:40]
      tickCnt <= UInt<1>("h0") @[src/main/scala/TickGenerator.scala 12:13]
      tick <= UInt<1>("h1") @[src/main/scala/TickGenerator.scala 13:10]
    else :
      node _tickCnt_T = add(tickCnt, UInt<1>("h1")) @[src/main/scala/TickGenerator.scala 15:24]
      node _tickCnt_T_1 = tail(_tickCnt_T, 1) @[src/main/scala/TickGenerator.scala 15:24]
      tickCnt <= _tickCnt_T_1 @[src/main/scala/TickGenerator.scala 15:13]
    io.tickOut <= tick @[src/main/scala/TickGenerator.scala 18:14]

  module ButtonDebouncer :
    input clock : Clock
    input reset : Reset
    output io : { flip inp : UInt<1>, out : UInt<1>} @[src/main/scala/ButtonDebouncer.scala 5:14]

    inst tickGenerator of TickGenerator @[src/main/scala/ButtonDebouncer.scala 10:29]
    tickGenerator.clock <= clock
    tickGenerator.reset <= reset
    reg sync_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sync_REG) @[src/main/scala/ButtonDebouncer.scala 13:29]
    sync_REG <= io.inp @[src/main/scala/ButtonDebouncer.scala 13:29]
    reg sync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sync) @[src/main/scala/ButtonDebouncer.scala 13:21]
    sync <= sync_REG @[src/main/scala/ButtonDebouncer.scala 13:21]
    reg btnDebReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/ButtonDebouncer.scala 16:26]
    reg tickCnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/ButtonDebouncer.scala 17:24]
    node _T = eq(tickCnt, UInt<3>("h4")) @[src/main/scala/ButtonDebouncer.scala 19:17]
    when _T : @[src/main/scala/ButtonDebouncer.scala 19:26]
      tickCnt <= UInt<1>("h0") @[src/main/scala/ButtonDebouncer.scala 20:13]
      btnDebReg <= sync @[src/main/scala/ButtonDebouncer.scala 21:15]
    else :
      when tickGenerator.io.tickOut : @[src/main/scala/ButtonDebouncer.scala 23:37]
        node _tickCnt_T = add(tickCnt, UInt<1>("h1")) @[src/main/scala/ButtonDebouncer.scala 24:26]
        node _tickCnt_T_1 = tail(_tickCnt_T, 1) @[src/main/scala/ButtonDebouncer.scala 24:26]
        tickCnt <= _tickCnt_T_1 @[src/main/scala/ButtonDebouncer.scala 24:15]
    io.out <= btnDebReg @[src/main/scala/ButtonDebouncer.scala 28:10]

  module TickGenerator_1 :
    input clock : Clock
    input reset : Reset
    output io : { tickOut : UInt<1>} @[src/main/scala/TickGenerator.scala 5:14]

    reg tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/TickGenerator.scala 8:24]
    wire tick : UInt<1> @[src/main/scala/TickGenerator.scala 9:25]
    tick <= UInt<1>("h0") @[src/main/scala/TickGenerator.scala 9:25]
    node _T = sub(UInt<14>("h2710"), UInt<1>("h1")) @[src/main/scala/TickGenerator.scala 11:32]
    node _T_1 = tail(_T, 1) @[src/main/scala/TickGenerator.scala 11:32]
    node _T_2 = eq(tickCnt, _T_1) @[src/main/scala/TickGenerator.scala 11:16]
    when _T_2 : @[src/main/scala/TickGenerator.scala 11:40]
      tickCnt <= UInt<1>("h0") @[src/main/scala/TickGenerator.scala 12:13]
      tick <= UInt<1>("h1") @[src/main/scala/TickGenerator.scala 13:10]
    else :
      node _tickCnt_T = add(tickCnt, UInt<1>("h1")) @[src/main/scala/TickGenerator.scala 15:24]
      node _tickCnt_T_1 = tail(_tickCnt_T, 1) @[src/main/scala/TickGenerator.scala 15:24]
      tickCnt <= _tickCnt_T_1 @[src/main/scala/TickGenerator.scala 15:13]
    io.tickOut <= tick @[src/main/scala/TickGenerator.scala 18:14]

  module ButtonDebouncer_1 :
    input clock : Clock
    input reset : Reset
    output io : { flip inp : UInt<1>, out : UInt<1>} @[src/main/scala/ButtonDebouncer.scala 5:14]

    inst tickGenerator of TickGenerator_1 @[src/main/scala/ButtonDebouncer.scala 10:29]
    tickGenerator.clock <= clock
    tickGenerator.reset <= reset
    reg sync_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sync_REG) @[src/main/scala/ButtonDebouncer.scala 13:29]
    sync_REG <= io.inp @[src/main/scala/ButtonDebouncer.scala 13:29]
    reg sync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sync) @[src/main/scala/ButtonDebouncer.scala 13:21]
    sync <= sync_REG @[src/main/scala/ButtonDebouncer.scala 13:21]
    reg btnDebReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/ButtonDebouncer.scala 16:26]
    reg tickCnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/ButtonDebouncer.scala 17:24]
    node _T = eq(tickCnt, UInt<3>("h4")) @[src/main/scala/ButtonDebouncer.scala 19:17]
    when _T : @[src/main/scala/ButtonDebouncer.scala 19:26]
      tickCnt <= UInt<1>("h0") @[src/main/scala/ButtonDebouncer.scala 20:13]
      btnDebReg <= sync @[src/main/scala/ButtonDebouncer.scala 21:15]
    else :
      when tickGenerator.io.tickOut : @[src/main/scala/ButtonDebouncer.scala 23:37]
        node _tickCnt_T = add(tickCnt, UInt<1>("h1")) @[src/main/scala/ButtonDebouncer.scala 24:26]
        node _tickCnt_T_1 = tail(_tickCnt_T, 1) @[src/main/scala/ButtonDebouncer.scala 24:26]
        tickCnt <= _tickCnt_T_1 @[src/main/scala/ButtonDebouncer.scala 24:15]
    io.out <= btnDebReg @[src/main/scala/ButtonDebouncer.scala 28:10]

  module TickGenerator_2 :
    input clock : Clock
    input reset : Reset
    output io : { tickOut : UInt<1>} @[src/main/scala/TickGenerator.scala 5:14]

    reg tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/TickGenerator.scala 8:24]
    wire tick : UInt<1> @[src/main/scala/TickGenerator.scala 9:25]
    tick <= UInt<1>("h0") @[src/main/scala/TickGenerator.scala 9:25]
    node _T = sub(UInt<14>("h2710"), UInt<1>("h1")) @[src/main/scala/TickGenerator.scala 11:32]
    node _T_1 = tail(_T, 1) @[src/main/scala/TickGenerator.scala 11:32]
    node _T_2 = eq(tickCnt, _T_1) @[src/main/scala/TickGenerator.scala 11:16]
    when _T_2 : @[src/main/scala/TickGenerator.scala 11:40]
      tickCnt <= UInt<1>("h0") @[src/main/scala/TickGenerator.scala 12:13]
      tick <= UInt<1>("h1") @[src/main/scala/TickGenerator.scala 13:10]
    else :
      node _tickCnt_T = add(tickCnt, UInt<1>("h1")) @[src/main/scala/TickGenerator.scala 15:24]
      node _tickCnt_T_1 = tail(_tickCnt_T, 1) @[src/main/scala/TickGenerator.scala 15:24]
      tickCnt <= _tickCnt_T_1 @[src/main/scala/TickGenerator.scala 15:13]
    io.tickOut <= tick @[src/main/scala/TickGenerator.scala 18:14]

  module ButtonDebouncer_2 :
    input clock : Clock
    input reset : Reset
    output io : { flip inp : UInt<1>, out : UInt<1>} @[src/main/scala/ButtonDebouncer.scala 5:14]

    inst tickGenerator of TickGenerator_2 @[src/main/scala/ButtonDebouncer.scala 10:29]
    tickGenerator.clock <= clock
    tickGenerator.reset <= reset
    reg sync_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sync_REG) @[src/main/scala/ButtonDebouncer.scala 13:29]
    sync_REG <= io.inp @[src/main/scala/ButtonDebouncer.scala 13:29]
    reg sync : UInt<1>, clock with :
      reset => (UInt<1>("h0"), sync) @[src/main/scala/ButtonDebouncer.scala 13:21]
    sync <= sync_REG @[src/main/scala/ButtonDebouncer.scala 13:21]
    reg btnDebReg : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/ButtonDebouncer.scala 16:26]
    reg tickCnt : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/ButtonDebouncer.scala 17:24]
    node _T = eq(tickCnt, UInt<3>("h4")) @[src/main/scala/ButtonDebouncer.scala 19:17]
    when _T : @[src/main/scala/ButtonDebouncer.scala 19:26]
      tickCnt <= UInt<1>("h0") @[src/main/scala/ButtonDebouncer.scala 20:13]
      btnDebReg <= sync @[src/main/scala/ButtonDebouncer.scala 21:15]
    else :
      when tickGenerator.io.tickOut : @[src/main/scala/ButtonDebouncer.scala 23:37]
        node _tickCnt_T = add(tickCnt, UInt<1>("h1")) @[src/main/scala/ButtonDebouncer.scala 24:26]
        node _tickCnt_T_1 = tail(_tickCnt_T, 1) @[src/main/scala/ButtonDebouncer.scala 24:26]
        tickCnt <= _tickCnt_T_1 @[src/main/scala/ButtonDebouncer.scala 24:15]
    io.out <= btnDebReg @[src/main/scala/ButtonDebouncer.scala 28:10]

  module extender :
    input clock : Clock
    input reset : Reset
    output io : { flip ringAlarm : UInt<1>, flip releasing : UInt<1>, alarm : UInt<1>, releaseCan : UInt<1>} @[src/main/scala/extender.scala 6:14]

    reg tick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/extender.scala 14:26]
    wire tick : UInt<1> @[src/main/scala/extender.scala 15:27]
    tick <= UInt<1>("h0") @[src/main/scala/extender.scala 15:27]
    node _tick_T = eq(tick_tickCnt, UInt<27>("h5f5e0ff")) @[src/main/scala/extender.scala 17:18]
    when _tick_T : @[src/main/scala/extender.scala 17:35]
      tick_tickCnt <= UInt<1>("h0") @[src/main/scala/extender.scala 18:15]
      tick <= UInt<1>("h1") @[src/main/scala/extender.scala 19:12]
    else :
      node _tick_tickCnt_T = add(tick_tickCnt, UInt<1>("h1")) @[src/main/scala/extender.scala 21:26]
      node _tick_tickCnt_T_1 = tail(_tick_tickCnt_T, 1) @[src/main/scala/extender.scala 21:26]
      tick_tickCnt <= _tick_tickCnt_T_1 @[src/main/scala/extender.scala 21:15]
    reg countSec : UInt<10>, clock with :
      reset => (reset, UInt<10>("h0")) @[src/main/scala/extender.scala 28:25]
    reg alarm : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/extender.scala 30:22]
    reg releaseCan : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/extender.scala 31:27]
    reg ringAlarmTrigger_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), ringAlarmTrigger_REG) @[src/main/scala/extender.scala 34:50]
    ringAlarmTrigger_REG <= io.ringAlarm @[src/main/scala/extender.scala 34:50]
    node _ringAlarmTrigger_T = eq(ringAlarmTrigger_REG, UInt<1>("h0")) @[src/main/scala/extender.scala 34:42]
    node ringAlarmTrigger = and(io.ringAlarm, _ringAlarmTrigger_T) @[src/main/scala/extender.scala 34:39]
    reg releasingTrigger_REG : UInt<1>, clock with :
      reset => (UInt<1>("h0"), releasingTrigger_REG) @[src/main/scala/extender.scala 35:50]
    releasingTrigger_REG <= io.releasing @[src/main/scala/extender.scala 35:50]
    node _releasingTrigger_T = eq(releasingTrigger_REG, UInt<1>("h0")) @[src/main/scala/extender.scala 35:42]
    node releasingTrigger = and(io.releasing, _releasingTrigger_T) @[src/main/scala/extender.scala 35:39]
    node _T = or(alarm, releaseCan) @[src/main/scala/extender.scala 38:23]
    node _T_1 = and(tick, _T) @[src/main/scala/extender.scala 38:13]
    when _T_1 : @[src/main/scala/extender.scala 38:39]
      node _countSec_T = add(countSec, UInt<1>("h1")) @[src/main/scala/extender.scala 39:26]
      node _countSec_T_1 = tail(_countSec_T, 1) @[src/main/scala/extender.scala 39:26]
      countSec <= _countSec_T_1 @[src/main/scala/extender.scala 39:14]
    when ringAlarmTrigger : @[src/main/scala/extender.scala 42:26]
      alarm <= UInt<1>("h1") @[src/main/scala/extender.scala 43:11]
      countSec <= UInt<1>("h0") @[src/main/scala/extender.scala 44:14]
    when releasingTrigger : @[src/main/scala/extender.scala 47:26]
      releaseCan <= UInt<1>("h1") @[src/main/scala/extender.scala 48:16]
      countSec <= UInt<1>("h0") @[src/main/scala/extender.scala 49:14]
    node _T_2 = eq(countSec, UInt<3>("h5")) @[src/main/scala/extender.scala 53:17]
    when _T_2 : @[src/main/scala/extender.scala 53:26]
      alarm <= UInt<1>("h0") @[src/main/scala/extender.scala 54:11]
      releaseCan <= UInt<1>("h0") @[src/main/scala/extender.scala 55:16]
      countSec <= UInt<1>("h0") @[src/main/scala/extender.scala 56:14]
    io.alarm <= alarm @[src/main/scala/extender.scala 59:12]
    io.releaseCan <= releaseCan @[src/main/scala/extender.scala 60:17]

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
    output io : { flip sum : UInt<8>, flip price : UInt<5>, seg : UInt<7>, an : UInt<4>, flip full : UInt<1>} @[src/main/scala/DisplayMultiplexer1.scala 6:14]

    inst decoder of SevenSegDec @[src/main/scala/DisplayMultiplexer1.scala 14:23]
    decoder.clock <= clock
    decoder.reset <= reset
    reg CountTo4 : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 15:25]
    reg FullSequence : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 16:29]
    reg CountTo16 : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 17:26]
    reg tick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 20:26]
    wire tick : UInt<1> @[src/main/scala/DisplayMultiplexer1.scala 21:27]
    tick <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 21:27]
    node _tick_T = eq(tick_tickCnt, UInt<10>("h3e7")) @[src/main/scala/DisplayMultiplexer1.scala 22:18]
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
    when tick : @[src/main/scala/DisplayMultiplexer1.scala 35:14]
      node _CountTo4_T = add(CountTo4, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 35:36]
      node _CountTo4_T_1 = tail(_CountTo4_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 35:36]
      CountTo4 <= _CountTo4_T_1 @[src/main/scala/DisplayMultiplexer1.scala 35:24]
    when slowTick : @[src/main/scala/DisplayMultiplexer1.scala 36:17]
      node _CountTo16_T = add(CountTo16, UInt<1>("h1")) @[src/main/scala/DisplayMultiplexer1.scala 36:41]
      node _CountTo16_T_1 = tail(_CountTo16_T, 1) @[src/main/scala/DisplayMultiplexer1.scala 36:41]
      CountTo16 <= _CountTo16_T_1 @[src/main/scala/DisplayMultiplexer1.scala 36:28]
    when io.full : @[src/main/scala/DisplayMultiplexer1.scala 38:17]
      FullSequence <= UInt<1>("h1") @[src/main/scala/DisplayMultiplexer1.scala 39:18]
      CountTo16 <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 40:14]
    node _T = eq(CountTo16, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 42:17]
    when _T : @[src/main/scala/DisplayMultiplexer1.scala 42:25]
      FullSequence <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 42:38]
    wire number1 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 44:28]
    number1 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 44:28]
    wire number2 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 45:28]
    number2 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 45:28]
    wire number3 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 46:28]
    number3 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 46:28]
    wire number4 : UInt<4> @[src/main/scala/DisplayMultiplexer1.scala 47:28]
    number4 <= UInt<4>("h0") @[src/main/scala/DisplayMultiplexer1.scala 47:28]
    reg Number2Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 48:28]
    reg Number1Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 49:28]
    reg Number4Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 50:28]
    reg Number3Full : UInt<4>, clock with :
      reset => (reset, UInt<4>("hd")) @[src/main/scala/DisplayMultiplexer1.scala 51:28]
    when slowTick : @[src/main/scala/DisplayMultiplexer1.scala 53:17]
      Number3Full <= Number4Full @[src/main/scala/DisplayMultiplexer1.scala 54:17]
      Number4Full <= Number1Full @[src/main/scala/DisplayMultiplexer1.scala 55:17]
      Number1Full <= Number2Full @[src/main/scala/DisplayMultiplexer1.scala 56:17]
    node _T_1 = eq(UInt<1>("h0"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
    when _T_1 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
      Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 60:26]
    else :
      node _T_2 = eq(UInt<1>("h1"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
      when _T_2 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
        Number2Full <= UInt<4>("hc") @[src/main/scala/DisplayMultiplexer1.scala 61:26]
      else :
        node _T_3 = eq(UInt<2>("h2"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
        when _T_3 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
          Number2Full <= UInt<4>("hc") @[src/main/scala/DisplayMultiplexer1.scala 62:26]
        else :
          node _T_4 = eq(UInt<2>("h3"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
          when _T_4 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
            Number2Full <= UInt<4>("hb") @[src/main/scala/DisplayMultiplexer1.scala 63:26]
          else :
            node _T_5 = eq(UInt<3>("h4"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
            when _T_5 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
              Number2Full <= UInt<4>("ha") @[src/main/scala/DisplayMultiplexer1.scala 64:26]
            else :
              node _T_6 = eq(UInt<3>("h5"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
              when _T_6 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 65:26]
              else :
                node _T_7 = eq(UInt<3>("h6"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                when _T_7 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                  Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 66:26]
                else :
                  node _T_8 = eq(UInt<3>("h7"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                  when _T_8 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                    Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 67:26]
                  else :
                    node _T_9 = eq(UInt<4>("h8"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                    when _T_9 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                      Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 68:26]
                    else :
                      node _T_10 = eq(UInt<4>("h9"), CountTo16) @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                      when _T_10 : @[src/main/scala/DisplayMultiplexer1.scala 59:21]
                        Number2Full <= UInt<4>("hd") @[src/main/scala/DisplayMultiplexer1.scala 69:26]
    node _T_11 = eq(FullSequence, UInt<1>("h0")) @[src/main/scala/DisplayMultiplexer1.scala 72:8]
    when _T_11 : @[src/main/scala/DisplayMultiplexer1.scala 72:23]
      node _number1_T = rem(io.sum, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 73:23]
      number1 <= _number1_T @[src/main/scala/DisplayMultiplexer1.scala 73:13]
      node _number2_T = div(io.sum, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 74:23]
      number2 <= _number2_T @[src/main/scala/DisplayMultiplexer1.scala 74:13]
      node _number3_T = rem(io.price, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 75:25]
      number3 <= _number3_T @[src/main/scala/DisplayMultiplexer1.scala 75:13]
      node _number4_T = div(io.price, UInt<4>("ha")) @[src/main/scala/DisplayMultiplexer1.scala 76:25]
      number4 <= _number4_T @[src/main/scala/DisplayMultiplexer1.scala 76:13]
    else :
      number1 <= Number1Full @[src/main/scala/DisplayMultiplexer1.scala 78:13]
      number2 <= Number2Full @[src/main/scala/DisplayMultiplexer1.scala 79:13]
      number3 <= Number3Full @[src/main/scala/DisplayMultiplexer1.scala 80:13]
      number4 <= Number4Full @[src/main/scala/DisplayMultiplexer1.scala 81:13]
    decoder.io.in <= UInt<1>("h0") @[src/main/scala/DisplayMultiplexer1.scala 84:17]
    node _T_12 = eq(UInt<2>("h2"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 86:20]
    when _T_12 : @[src/main/scala/DisplayMultiplexer1.scala 86:20]
      decoder.io.in <= number1 @[src/main/scala/DisplayMultiplexer1.scala 87:32]
    else :
      node _T_13 = eq(UInt<2>("h3"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 86:20]
      when _T_13 : @[src/main/scala/DisplayMultiplexer1.scala 86:20]
        decoder.io.in <= number2 @[src/main/scala/DisplayMultiplexer1.scala 88:32]
      else :
        node _T_14 = eq(UInt<1>("h0"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 86:20]
        when _T_14 : @[src/main/scala/DisplayMultiplexer1.scala 86:20]
          decoder.io.in <= number3 @[src/main/scala/DisplayMultiplexer1.scala 89:32]
        else :
          node _T_15 = eq(UInt<1>("h1"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 86:20]
          when _T_15 : @[src/main/scala/DisplayMultiplexer1.scala 86:20]
            decoder.io.in <= number4 @[src/main/scala/DisplayMultiplexer1.scala 90:32]
    node _io_an_T = dshl(UInt<1>("h1"), CountTo4) @[src/main/scala/DisplayMultiplexer1.scala 93:18]
    node _io_an_T_1 = not(_io_an_T) @[src/main/scala/DisplayMultiplexer1.scala 93:12]
    io.an <= _io_an_T_1 @[src/main/scala/DisplayMultiplexer1.scala 93:9]
    node _io_seg_T = not(decoder.io.out) @[src/main/scala/DisplayMultiplexer1.scala 94:13]
    io.seg <= _io_seg_T @[src/main/scala/DisplayMultiplexer1.scala 94:10]

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
    node _T = eq(UInt<1>("h1"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
    when _T : @[src/main/scala/Datapath.scala 19:22]
      node _money_T = add(money, UInt<2>("h2")) @[src/main/scala/Datapath.scala 20:26]
      node _money_T_1 = tail(_money_T, 1) @[src/main/scala/Datapath.scala 20:26]
      money <= _money_T_1 @[src/main/scala/Datapath.scala 20:18]
    else :
      node _T_1 = eq(UInt<2>("h2"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
      when _T_1 : @[src/main/scala/Datapath.scala 19:22]
        node _money_T_2 = add(money, UInt<3>("h5")) @[src/main/scala/Datapath.scala 21:26]
        node _money_T_3 = tail(_money_T_2, 1) @[src/main/scala/Datapath.scala 21:26]
        money <= _money_T_3 @[src/main/scala/Datapath.scala 21:18]
      else :
        node _T_2 = eq(UInt<3>("h4"), io.FSMstate) @[src/main/scala/Datapath.scala 19:22]
        when _T_2 : @[src/main/scala/Datapath.scala 19:22]
          node _money_T_4 = sub(money, io.price) @[src/main/scala/Datapath.scala 22:26]
          node _money_T_5 = tail(_money_T_4, 1) @[src/main/scala/Datapath.scala 22:26]
          money <= _money_T_5 @[src/main/scala/Datapath.scala 22:18]
    io.money <= money @[src/main/scala/Datapath.scala 25:12]

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
    output io : { flip price : UInt<5>, flip sum : UInt<8>, flip update : UInt<1>, tx : UInt<1>} @[src/main/scala/SerialCommunicator.scala 11:16]

    inst uart of BufferedTx @[src/main/scala/SerialCommunicator.scala 19:22]
    uart.clock <= clock
    uart.reset <= reset
    io.tx <= uart.io.txd @[src/main/scala/SerialCommunicator.scala 20:11]
    wire _msg_WIRE : UInt<8>[15] @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[0] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[1] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[2] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[3] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[4] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[5] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[6] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[7] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[8] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[9] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[10] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[11] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[12] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[13] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    _msg_WIRE[14] <= UInt<8>("h0") @[src/main/scala/SerialCommunicator.scala 28:34]
    wire msg : UInt<8>[15] @[src/main/scala/SerialCommunicator.scala 28:26]
    msg <= _msg_WIRE @[src/main/scala/SerialCommunicator.scala 28:26]
    reg writeState : UInt<2>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 29:29]
    reg writing : UInt<1>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 30:26]
    reg index : UInt<4>, clock with :
      reset => (reset, UInt<4>("h0")) @[src/main/scala/SerialCommunicator.scala 31:24]
    uart.io.channel.valid <= writing @[src/main/scala/SerialCommunicator.scala 33:27]
    uart.io.channel.bits <= msg[index] @[src/main/scala/SerialCommunicator.scala 34:27]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 37:24]
    node _T_1 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 37:24]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/SerialCommunicator.scala 37:24]
    when _T_2 : @[src/main/scala/SerialCommunicator.scala 37:24]
      when io.update : @[src/main/scala/SerialCommunicator.scala 39:29]
        writeState <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 40:28]
        writing <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 41:25]
    else :
      node _T_3 = asUInt(UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 37:24]
      node _T_4 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 37:24]
      node _T_5 = eq(_T_3, _T_4) @[src/main/scala/SerialCommunicator.scala 37:24]
      when _T_5 : @[src/main/scala/SerialCommunicator.scala 37:24]
        wire _WIRE : UInt<8>[15] @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[0] <= UInt<8>("h1b") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[1] <= UInt<8>("h5b") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[2] <= UInt<8>("h31") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[3] <= UInt<8>("h3b") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[4] <= UInt<8>("h33") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[5] <= UInt<8>("h32") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[6] <= UInt<8>("h6d") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[7] <= UInt<8>("h20") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[8] <= UInt<8>("h1b") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[9] <= UInt<8>("h5b") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[10] <= UInt<8>("h32") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[11] <= UInt<8>("h4a") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[12] <= UInt<8>("h1b") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[13] <= UInt<8>("h5b") @[src/main/scala/SerialCommunicator.scala 45:27]
        _WIRE[14] <= UInt<8>("h48") @[src/main/scala/SerialCommunicator.scala 45:27]
        msg <= _WIRE @[src/main/scala/SerialCommunicator.scala 45:17]
        node _T_6 = eq(writing, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 53:18]
        when _T_6 : @[src/main/scala/SerialCommunicator.scala 53:28]
          writeState <= UInt<2>("h2") @[src/main/scala/SerialCommunicator.scala 54:28]
          writing <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 55:25]
      else :
        node _T_7 = asUInt(UInt<2>("h2")) @[src/main/scala/SerialCommunicator.scala 37:24]
        node _T_8 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 37:24]
        node _T_9 = eq(_T_7, _T_8) @[src/main/scala/SerialCommunicator.scala 37:24]
        when _T_9 : @[src/main/scala/SerialCommunicator.scala 37:24]
          node _tens_T = div(io.price, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 23:31]
          node tens = rem(_tens_T, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 23:39]
          node ones = rem(io.price, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 24:30]
          node _T_10 = add(tens, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 25:18]
          node _T_11 = tail(_T_10, 1) @[src/main/scala/SerialCommunicator.scala 25:18]
          node _T_12 = add(ones, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 25:36]
          node _T_13 = tail(_T_12, 1) @[src/main/scala/SerialCommunicator.scala 25:36]
          wire _WIRE_1 : UInt<8>[15] @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[0] <= UInt<8>("h50") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[1] <= UInt<8>("h72") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[2] <= UInt<8>("h69") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[3] <= UInt<8>("h63") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[4] <= UInt<8>("h65") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[5] <= UInt<8>("h3a") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[6] <= UInt<8>("h20") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[7] <= _T_11 @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[8] <= _T_13 @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[9] <= UInt<8>("h20") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[10] <= UInt<8>("h41") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[11] <= UInt<8>("h54") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[12] <= UInt<8>("h53") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[13] <= UInt<8>("ha") @[src/main/scala/SerialCommunicator.scala 59:27]
          _WIRE_1[14] <= UInt<8>("hd") @[src/main/scala/SerialCommunicator.scala 59:27]
          msg <= _WIRE_1 @[src/main/scala/SerialCommunicator.scala 59:17]
          node _T_14 = eq(writing, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 65:18]
          when _T_14 : @[src/main/scala/SerialCommunicator.scala 65:28]
            writeState <= UInt<2>("h3") @[src/main/scala/SerialCommunicator.scala 66:28]
            writing <= UInt<1>("h1") @[src/main/scala/SerialCommunicator.scala 67:25]
        else :
          node _T_15 = asUInt(UInt<2>("h3")) @[src/main/scala/SerialCommunicator.scala 37:24]
          node _T_16 = asUInt(writeState) @[src/main/scala/SerialCommunicator.scala 37:24]
          node _T_17 = eq(_T_15, _T_16) @[src/main/scala/SerialCommunicator.scala 37:24]
          when _T_17 : @[src/main/scala/SerialCommunicator.scala 37:24]
            node _tens_T_1 = div(io.sum, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 23:31]
            node tens_1 = rem(_tens_T_1, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 23:39]
            node ones_1 = rem(io.sum, UInt<4>("ha")) @[src/main/scala/SerialCommunicator.scala 24:30]
            node _T_18 = add(tens_1, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 25:18]
            node _T_19 = tail(_T_18, 1) @[src/main/scala/SerialCommunicator.scala 25:18]
            node _T_20 = add(ones_1, UInt<8>("h30")) @[src/main/scala/SerialCommunicator.scala 25:36]
            node _T_21 = tail(_T_20, 1) @[src/main/scala/SerialCommunicator.scala 25:36]
            wire _WIRE_2 : UInt<8>[15] @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[0] <= UInt<8>("h4d") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[1] <= UInt<8>("h6f") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[2] <= UInt<8>("h6e") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[3] <= UInt<8>("h65") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[4] <= UInt<8>("h79") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[5] <= UInt<8>("h3a") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[6] <= UInt<8>("h20") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[7] <= _T_19 @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[8] <= _T_21 @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[9] <= UInt<8>("h20") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[10] <= UInt<8>("h41") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[11] <= UInt<8>("h54") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[12] <= UInt<8>("h53") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[13] <= UInt<8>("ha") @[src/main/scala/SerialCommunicator.scala 71:27]
            _WIRE_2[14] <= UInt<8>("hd") @[src/main/scala/SerialCommunicator.scala 71:27]
            msg <= _WIRE_2 @[src/main/scala/SerialCommunicator.scala 71:17]
            node _T_22 = eq(writing, UInt<1>("h0")) @[src/main/scala/SerialCommunicator.scala 77:18]
            when _T_22 : @[src/main/scala/SerialCommunicator.scala 77:28]
              writeState <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 78:28]
    when writing : @[src/main/scala/SerialCommunicator.scala 83:19]
      when uart.io.channel.ready : @[src/main/scala/SerialCommunicator.scala 84:37]
        node _T_23 = eq(index, UInt<4>("he")) @[src/main/scala/SerialCommunicator.scala 85:24]
        when _T_23 : @[src/main/scala/SerialCommunicator.scala 85:34]
          index <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 86:23]
          writing <= UInt<1>("h0") @[src/main/scala/SerialCommunicator.scala 87:25]
        else :
          node _index_T = add(index, UInt<1>("h1")) @[src/main/scala/SerialCommunicator.scala 89:32]
          node _index_T_1 = tail(_index_T, 1) @[src/main/scala/SerialCommunicator.scala 89:32]
          index <= _index_T_1 @[src/main/scala/SerialCommunicator.scala 89:23]


  module FSM :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>, tx : UInt<1>} @[src/main/scala/FSM.scala 10:14]

    inst ButtonDeb1 of ButtonDebouncer @[src/main/scala/FSM.scala 25:26]
    ButtonDeb1.clock <= clock
    ButtonDeb1.reset <= reset
    ButtonDeb1.io.inp <= io.coin2 @[src/main/scala/FSM.scala 26:21]
    inst ButtonDeb2 of ButtonDebouncer_1 @[src/main/scala/FSM.scala 29:26]
    ButtonDeb2.clock <= clock
    ButtonDeb2.reset <= reset
    ButtonDeb2.io.inp <= io.coin5 @[src/main/scala/FSM.scala 30:21]
    inst ButtonDeb3 of ButtonDebouncer_2 @[src/main/scala/FSM.scala 33:26]
    ButtonDeb3.clock <= clock
    ButtonDeb3.reset <= reset
    ButtonDeb3.io.inp <= io.buy @[src/main/scala/FSM.scala 34:21]
    reg stateReg : UInt<3>, clock with :
      reset => (reset, UInt<1>("h0")) @[src/main/scala/FSM.scala 37:25]
    stateReg <= UInt<1>("h0") @[src/main/scala/FSM.scala 38:12]
    inst extender of extender @[src/main/scala/FSM.scala 40:24]
    extender.clock <= clock
    extender.reset <= reset
    inst DisplayMultiplexer of DisplayMultiplexer @[src/main/scala/FSM.scala 41:34]
    DisplayMultiplexer.clock <= clock
    DisplayMultiplexer.reset <= reset
    inst Datapath of Datapath @[src/main/scala/FSM.scala 42:24]
    Datapath.clock <= clock
    Datapath.reset <= reset
    inst SerialComs of SerialCommunicator @[src/main/scala/FSM.scala 43:26]
    SerialComs.clock <= clock
    SerialComs.reset <= reset
    reg prevCoin2 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), prevCoin2) @[src/main/scala/FSM.scala 46:26]
    prevCoin2 <= ButtonDeb1.io.out @[src/main/scala/FSM.scala 46:26]
    reg prevCoin5 : UInt<1>, clock with :
      reset => (UInt<1>("h0"), prevCoin5) @[src/main/scala/FSM.scala 47:26]
    prevCoin5 <= ButtonDeb2.io.out @[src/main/scala/FSM.scala 47:26]
    reg prevBuy : UInt<1>, clock with :
      reset => (UInt<1>("h0"), prevBuy) @[src/main/scala/FSM.scala 48:24]
    prevBuy <= ButtonDeb3.io.out @[src/main/scala/FSM.scala 48:24]
    reg prevPrice : UInt, clock with :
      reset => (UInt<1>("h0"), prevPrice) @[src/main/scala/FSM.scala 49:26]
    prevPrice <= io.price @[src/main/scala/FSM.scala 49:26]
    node _coin2Trigger_T = eq(prevCoin2, UInt<1>("h0")) @[src/main/scala/FSM.scala 52:34]
    node coin2Trigger = and(ButtonDeb1.io.out, _coin2Trigger_T) @[src/main/scala/FSM.scala 52:31]
    node _coin5Trigger_T = eq(prevCoin5, UInt<1>("h0")) @[src/main/scala/FSM.scala 53:34]
    node coin5Trigger = and(ButtonDeb2.io.out, _coin5Trigger_T) @[src/main/scala/FSM.scala 53:31]
    node _buyTrigger_T = eq(prevBuy, UInt<1>("h0")) @[src/main/scala/FSM.scala 54:30]
    node buyTrigger = and(ButtonDeb3.io.out, _buyTrigger_T) @[src/main/scala/FSM.scala 54:27]
    node priceTrigger = neq(io.price, prevPrice) @[src/main/scala/FSM.scala 55:31]
    node _T = asUInt(UInt<1>("h0")) @[src/main/scala/FSM.scala 61:20]
    node _T_1 = asUInt(stateReg) @[src/main/scala/FSM.scala 61:20]
    node _T_2 = eq(_T, _T_1) @[src/main/scala/FSM.scala 61:20]
    when _T_2 : @[src/main/scala/FSM.scala 61:20]
      node _T_3 = eq(Datapath.io.Full2, UInt<1>("h0")) @[src/main/scala/FSM.scala 63:28]
      node _T_4 = and(coin2Trigger, _T_3) @[src/main/scala/FSM.scala 63:25]
      when _T_4 : @[src/main/scala/FSM.scala 63:36]
        stateReg <= UInt<1>("h1") @[src/main/scala/FSM.scala 64:18]
      else :
        node _T_5 = eq(Datapath.io.Full5, UInt<1>("h0")) @[src/main/scala/FSM.scala 65:34]
        node _T_6 = and(coin5Trigger, _T_5) @[src/main/scala/FSM.scala 65:31]
        when _T_6 : @[src/main/scala/FSM.scala 65:42]
          stateReg <= UInt<2>("h2") @[src/main/scala/FSM.scala 66:18]
        else :
          node _T_7 = eq(Datapath.io.enough, UInt<1>("h0")) @[src/main/scala/FSM.scala 67:32]
          node _T_8 = and(buyTrigger, _T_7) @[src/main/scala/FSM.scala 67:29]
          when _T_8 : @[src/main/scala/FSM.scala 67:41]
            stateReg <= UInt<2>("h3") @[src/main/scala/FSM.scala 68:18]
          else :
            node _T_9 = and(buyTrigger, Datapath.io.enough) @[src/main/scala/FSM.scala 69:29]
            when _T_9 : @[src/main/scala/FSM.scala 69:40]
              stateReg <= UInt<3>("h4") @[src/main/scala/FSM.scala 70:18]
            else :
              node _T_10 = and(coin2Trigger, Datapath.io.Full2) @[src/main/scala/FSM.scala 71:31]
              when _T_10 : @[src/main/scala/FSM.scala 71:41]
                stateReg <= UInt<3>("h5") @[src/main/scala/FSM.scala 72:18]
              else :
                node _T_11 = and(coin5Trigger, Datapath.io.Full5) @[src/main/scala/FSM.scala 73:31]
                when _T_11 : @[src/main/scala/FSM.scala 73:41]
                  stateReg <= UInt<3>("h5") @[src/main/scala/FSM.scala 74:18]
    node _extender_io_ringAlarm_T = eq(stateReg, UInt<2>("h3")) @[src/main/scala/FSM.scala 80:38]
    extender.io.ringAlarm <= _extender_io_ringAlarm_T @[src/main/scala/FSM.scala 80:25]
    node _extender_io_releasing_T = eq(stateReg, UInt<3>("h4")) @[src/main/scala/FSM.scala 81:38]
    extender.io.releasing <= _extender_io_releasing_T @[src/main/scala/FSM.scala 81:25]
    node _Datapath_io_FSMstate_T = asUInt(stateReg) @[src/main/scala/FSM.scala 82:36]
    Datapath.io.FSMstate <= _Datapath_io_FSMstate_T @[src/main/scala/FSM.scala 82:24]
    node _DisplayMultiplexer_io_full_T = eq(stateReg, UInt<3>("h5")) @[src/main/scala/FSM.scala 85:43]
    DisplayMultiplexer.io.full <= _DisplayMultiplexer_io_full_T @[src/main/scala/FSM.scala 85:30]
    DisplayMultiplexer.io.sum <= Datapath.io.money @[src/main/scala/FSM.scala 86:29]
    DisplayMultiplexer.io.price <= io.price @[src/main/scala/FSM.scala 87:31]
    io.tx <= SerialComs.io.tx @[src/main/scala/FSM.scala 90:9]
    SerialComs.io.price <= io.price @[src/main/scala/FSM.scala 91:23]
    SerialComs.io.sum <= Datapath.io.money @[src/main/scala/FSM.scala 92:21]
    node _SerialComs_io_update_T = or(coin2Trigger, coin5Trigger) @[src/main/scala/FSM.scala 93:40]
    node _SerialComs_io_update_T_1 = or(_SerialComs_io_update_T, buyTrigger) @[src/main/scala/FSM.scala 93:55]
    node _SerialComs_io_update_T_2 = or(_SerialComs_io_update_T_1, priceTrigger) @[src/main/scala/FSM.scala 93:68]
    SerialComs.io.update <= _SerialComs_io_update_T_2 @[src/main/scala/FSM.scala 93:24]
    Datapath.io.price <= io.price @[src/main/scala/FSM.scala 96:21]
    io.alarm <= extender.io.alarm @[src/main/scala/FSM.scala 98:12]
    io.releaseCan <= extender.io.releaseCan @[src/main/scala/FSM.scala 99:17]
    io.seg <= DisplayMultiplexer.io.seg @[src/main/scala/FSM.scala 100:10]
    io.an <= DisplayMultiplexer.io.an @[src/main/scala/FSM.scala 101:9]

