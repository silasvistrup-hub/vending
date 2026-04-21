FIRRTL version 1.2.0
circuit VendingMachine :
  module SevenSegDec :
    input clock : Clock
    input reset : Reset
    output io : { flip in : UInt<4>, out : UInt<7>} @[\\src\\main\\scala\\SevenSegDec1.scala 6:14]

    wire sevSeg : UInt @[\\src\\main\\scala\\SevenSegDec1.scala 11:27]
    sevSeg <= UInt<1>("h0") @[\\src\\main\\scala\\SevenSegDec1.scala 11:27]
    node _T = eq(UInt<1>("h0"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
    when _T : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
      sevSeg <= UInt<6>("h3f") @[\\src\\main\\scala\\SevenSegDec1.scala 15:21]
    else :
      node _T_1 = eq(UInt<1>("h1"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
      when _T_1 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
        sevSeg <= UInt<3>("h6") @[\\src\\main\\scala\\SevenSegDec1.scala 16:21]
      else :
        node _T_2 = eq(UInt<2>("h2"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
        when _T_2 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
          sevSeg <= UInt<7>("h5b") @[\\src\\main\\scala\\SevenSegDec1.scala 17:21]
        else :
          node _T_3 = eq(UInt<2>("h3"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
          when _T_3 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
            sevSeg <= UInt<7>("h4f") @[\\src\\main\\scala\\SevenSegDec1.scala 18:21]
          else :
            node _T_4 = eq(UInt<3>("h4"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
            when _T_4 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
              sevSeg <= UInt<7>("h66") @[\\src\\main\\scala\\SevenSegDec1.scala 19:21]
            else :
              node _T_5 = eq(UInt<3>("h5"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
              when _T_5 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                sevSeg <= UInt<7>("h6d") @[\\src\\main\\scala\\SevenSegDec1.scala 20:21]
              else :
                node _T_6 = eq(UInt<3>("h6"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                when _T_6 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                  sevSeg <= UInt<7>("h7d") @[\\src\\main\\scala\\SevenSegDec1.scala 21:21]
                else :
                  node _T_7 = eq(UInt<3>("h7"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                  when _T_7 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                    sevSeg <= UInt<3>("h7") @[\\src\\main\\scala\\SevenSegDec1.scala 22:21]
                  else :
                    node _T_8 = eq(UInt<4>("h8"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                    when _T_8 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                      sevSeg <= UInt<7>("h7f") @[\\src\\main\\scala\\SevenSegDec1.scala 23:21]
                    else :
                      node _T_9 = eq(UInt<4>("h9"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                      when _T_9 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                        sevSeg <= UInt<7>("h6f") @[\\src\\main\\scala\\SevenSegDec1.scala 24:21]
                      else :
                        node _T_10 = eq(UInt<4>("ha"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                        when _T_10 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                          sevSeg <= UInt<7>("h77") @[\\src\\main\\scala\\SevenSegDec1.scala 25:22]
                        else :
                          node _T_11 = eq(UInt<4>("hb"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                          when _T_11 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                            sevSeg <= UInt<7>("h7c") @[\\src\\main\\scala\\SevenSegDec1.scala 26:22]
                          else :
                            node _T_12 = eq(UInt<4>("hc"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                            when _T_12 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                              sevSeg <= UInt<6>("h39") @[\\src\\main\\scala\\SevenSegDec1.scala 27:22]
                            else :
                              node _T_13 = eq(UInt<4>("hd"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                              when _T_13 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                                sevSeg <= UInt<7>("h5e") @[\\src\\main\\scala\\SevenSegDec1.scala 28:22]
                              else :
                                node _T_14 = eq(UInt<4>("he"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                                when _T_14 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                                  sevSeg <= UInt<7>("h79") @[\\src\\main\\scala\\SevenSegDec1.scala 29:22]
                                else :
                                  node _T_15 = eq(UInt<4>("hf"), io.in) @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                                  when _T_15 : @[\\src\\main\\scala\\SevenSegDec1.scala 13:17]
                                    sevSeg <= UInt<7>("h71") @[\\src\\main\\scala\\SevenSegDec1.scala 30:22]
    io.out <= sevSeg @[\\src\\main\\scala\\SevenSegDec1.scala 32:10]

  module DisplayMultiplexer :
    input clock : Clock
    input reset : Reset
    output io : { flip sum : UInt<8>, flip price : UInt<5>, seg : UInt<7>, an : UInt<4>} @[\\src\\main\\scala\\DisplayMultiplexer1.scala 6:14]

    inst decoder of SevenSegDec @[\\src\\main\\scala\\DisplayMultiplexer1.scala 12:23]
    decoder.clock <= clock
    decoder.reset <= reset
    reg count_to_4 : UInt<2>, clock with :
      reset => (reset, UInt<2>("h0")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 13:27]
    reg tick_tickCnt : UInt<32>, clock with :
      reset => (reset, UInt<32>("h0")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 17:26]
    wire tick : UInt<1> @[\\src\\main\\scala\\DisplayMultiplexer1.scala 18:27]
    tick <= UInt<1>("h0") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 18:27]
    node _tick_T = eq(tick_tickCnt, UInt<17>("h1869f")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 20:18]
    when _tick_T : @[\\src\\main\\scala\\DisplayMultiplexer1.scala 20:35]
      tick_tickCnt <= UInt<1>("h0") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 21:15]
      tick <= UInt<1>("h1") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 22:12]
    else :
      node _tick_tickCnt_T = add(tick_tickCnt, UInt<1>("h1")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 24:26]
      node _tick_tickCnt_T_1 = tail(_tick_tickCnt_T, 1) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 24:26]
      tick_tickCnt <= _tick_tickCnt_T_1 @[\\src\\main\\scala\\DisplayMultiplexer1.scala 24:15]
    when tick : @[\\src\\main\\scala\\DisplayMultiplexer1.scala 32:14]
      node _count_to_4_T = add(count_to_4, UInt<1>("h1")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 33:30]
      node _count_to_4_T_1 = tail(_count_to_4_T, 1) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 33:30]
      count_to_4 <= _count_to_4_T_1 @[\\src\\main\\scala\\DisplayMultiplexer1.scala 33:16]
    wire number1 : UInt<4> @[\\src\\main\\scala\\DisplayMultiplexer1.scala 37:28]
    number1 <= UInt<4>("h0") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 37:28]
    wire number2 : UInt<4> @[\\src\\main\\scala\\DisplayMultiplexer1.scala 38:28]
    number2 <= UInt<4>("h0") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 38:28]
    wire number3 : UInt<4> @[\\src\\main\\scala\\DisplayMultiplexer1.scala 39:28]
    number3 <= UInt<4>("h0") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 39:28]
    wire number4 : UInt<4> @[\\src\\main\\scala\\DisplayMultiplexer1.scala 40:28]
    number4 <= UInt<4>("h0") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 40:28]
    node _number2_T = div(io.sum, UInt<4>("ha")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 43:21]
    number2 <= _number2_T @[\\src\\main\\scala\\DisplayMultiplexer1.scala 43:11]
    node _number1_T = rem(io.sum, UInt<4>("ha")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 44:21]
    number1 <= _number1_T @[\\src\\main\\scala\\DisplayMultiplexer1.scala 44:11]
    node _number4_T = div(io.price, UInt<4>("ha")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 45:23]
    number4 <= _number4_T @[\\src\\main\\scala\\DisplayMultiplexer1.scala 45:11]
    node _number3_T = rem(io.price, UInt<4>("ha")) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 46:23]
    number3 <= _number3_T @[\\src\\main\\scala\\DisplayMultiplexer1.scala 46:11]
    decoder.io.in <= UInt<1>("h0") @[\\src\\main\\scala\\DisplayMultiplexer1.scala 48:17]
    node _T = eq(UInt<1>("h0"), count_to_4) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
    when _T : @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
      decoder.io.in <= number3 @[\\src\\main\\scala\\DisplayMultiplexer1.scala 52:32]
    else :
      node _T_1 = eq(UInt<1>("h1"), count_to_4) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
      when _T_1 : @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
        decoder.io.in <= number4 @[\\src\\main\\scala\\DisplayMultiplexer1.scala 53:32]
      else :
        node _T_2 = eq(UInt<2>("h2"), count_to_4) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
        when _T_2 : @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
          decoder.io.in <= number1 @[\\src\\main\\scala\\DisplayMultiplexer1.scala 54:32]
        else :
          node _T_3 = eq(UInt<2>("h3"), count_to_4) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
          when _T_3 : @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22]
            decoder.io.in <= number2 @[\\src\\main\\scala\\DisplayMultiplexer1.scala 55:32]
    node _io_an_T = dshl(UInt<1>("h1"), count_to_4) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 59:18]
    node _io_an_T_1 = not(_io_an_T) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 59:12]
    io.an <= _io_an_T_1 @[\\src\\main\\scala\\DisplayMultiplexer1.scala 59:9]
    node _io_seg_T = not(decoder.io.out) @[\\src\\main\\scala\\DisplayMultiplexer1.scala 60:13]
    io.seg <= _io_seg_T @[\\src\\main\\scala\\DisplayMultiplexer1.scala 60:10]

  module VendingMachine :
    input clock : Clock
    input reset : UInt<1>
    output io : { flip price : UInt<5>, flip coin2 : UInt<1>, flip coin5 : UInt<1>, flip buy : UInt<1>, releaseCan : UInt<1>, alarm : UInt<1>, seg : UInt<7>, an : UInt<4>} @[\\src\\main\\scala\\VendingMachine.scala 5:14]

    inst DisplayMultiplexer of DisplayMultiplexer @[\\src\\main\\scala\\VendingMachine.scala 16:34]
    DisplayMultiplexer.clock <= clock
    DisplayMultiplexer.reset <= reset
    reg Value : UInt<8>, clock with :
      reset => (reset, UInt<8>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 19:22]
    node Full2 = gt(Value, UInt<7>("h61")) @[\\src\\main\\scala\\VendingMachine.scala 20:21]
    node Full5 = gt(Value, UInt<7>("h5f")) @[\\src\\main\\scala\\VendingMachine.scala 21:21]
    node enough = geq(Value, io.price) @[\\src\\main\\scala\\VendingMachine.scala 22:22]
    reg coin2_previous : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin2_previous) @[\\src\\main\\scala\\VendingMachine.scala 27:31]
    coin2_previous <= io.coin2 @[\\src\\main\\scala\\VendingMachine.scala 27:31]
    reg coin5_previous : UInt<1>, clock with :
      reset => (UInt<1>("h0"), coin5_previous) @[\\src\\main\\scala\\VendingMachine.scala 28:31]
    coin5_previous <= io.coin5 @[\\src\\main\\scala\\VendingMachine.scala 28:31]
    reg buy_previous : UInt<1>, clock with :
      reset => (UInt<1>("h0"), buy_previous) @[\\src\\main\\scala\\VendingMachine.scala 29:31]
    buy_previous <= io.buy @[\\src\\main\\scala\\VendingMachine.scala 29:31]
    node _coin2_change_T = eq(coin2_previous, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 31:34]
    node coin2_change = and(io.coin2, _coin2_change_T) @[\\src\\main\\scala\\VendingMachine.scala 31:31]
    node _coin5_change_T = eq(coin5_previous, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 32:34]
    node coin5_change = and(io.coin5, _coin5_change_T) @[\\src\\main\\scala\\VendingMachine.scala 32:31]
    node _buy_change_T = eq(buy_previous, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 33:32]
    node buy_change = and(io.buy, _buy_change_T) @[\\src\\main\\scala\\VendingMachine.scala 33:29]
    reg FSM : UInt<5>, clock with :
      reset => (reset, UInt<5>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 36:20]
    node _T = eq(Full2, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 40:24]
    node _T_1 = and(coin2_change, _T) @[\\src\\main\\scala\\VendingMachine.scala 40:21]
    when _T_1 : @[\\src\\main\\scala\\VendingMachine.scala 40:32]
      node _Value_T = add(Value, UInt<2>("h2")) @[\\src\\main\\scala\\VendingMachine.scala 41:20]
      node _Value_T_1 = tail(_Value_T, 1) @[\\src\\main\\scala\\VendingMachine.scala 41:20]
      Value <= _Value_T_1 @[\\src\\main\\scala\\VendingMachine.scala 41:11]
    else :
      node _T_2 = eq(Full5, UInt<1>("h0")) @[\\src\\main\\scala\\VendingMachine.scala 42:30]
      node _T_3 = and(coin5_change, _T_2) @[\\src\\main\\scala\\VendingMachine.scala 42:27]
      when _T_3 : @[\\src\\main\\scala\\VendingMachine.scala 42:38]
        node _Value_T_2 = add(Value, UInt<3>("h5")) @[\\src\\main\\scala\\VendingMachine.scala 43:20]
        node _Value_T_3 = tail(_Value_T_2, 1) @[\\src\\main\\scala\\VendingMachine.scala 43:20]
        Value <= _Value_T_3 @[\\src\\main\\scala\\VendingMachine.scala 43:11]
      else :
        node _T_4 = and(buy_change, enough) @[\\src\\main\\scala\\VendingMachine.scala 44:25]
        when _T_4 : @[\\src\\main\\scala\\VendingMachine.scala 44:36]
          node _Value_T_4 = sub(Value, io.price) @[\\src\\main\\scala\\VendingMachine.scala 45:20]
          node _Value_T_5 = tail(_Value_T_4, 1) @[\\src\\main\\scala\\VendingMachine.scala 45:20]
          Value <= _Value_T_5 @[\\src\\main\\scala\\VendingMachine.scala 45:11]
    node _io_alarm_T = bits(FSM, 4, 4) @[\\src\\main\\scala\\VendingMachine.scala 50:18]
    io.alarm <= _io_alarm_T @[\\src\\main\\scala\\VendingMachine.scala 50:12]
    node _io_releaseCan_T = bits(FSM, 3, 3) @[\\src\\main\\scala\\VendingMachine.scala 51:23]
    io.releaseCan <= _io_releaseCan_T @[\\src\\main\\scala\\VendingMachine.scala 51:17]
    DisplayMultiplexer.io.sum <= Value @[\\src\\main\\scala\\VendingMachine.scala 52:28]
    DisplayMultiplexer.io.price <= io.price @[\\src\\main\\scala\\VendingMachine.scala 53:31]
    io.seg <= DisplayMultiplexer.io.seg @[\\src\\main\\scala\\VendingMachine.scala 54:10]
    io.an <= DisplayMultiplexer.io.an @[\\src\\main\\scala\\VendingMachine.scala 55:9]

