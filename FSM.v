module TickGenerator(
  input   clock,
  input   reset,
  output  io_tickOut // @[src/main/scala/TickGenerator.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] tickCnt; // @[src/main/scala/TickGenerator.scala 8:24]
  wire [13:0] _T_1 = 14'h2710 - 14'h1; // @[src/main/scala/TickGenerator.scala 11:32]
  wire [31:0] _GEN_2 = {{18'd0}, _T_1}; // @[src/main/scala/TickGenerator.scala 11:16]
  wire  tick = tickCnt == _GEN_2; // @[src/main/scala/TickGenerator.scala 11:16]
  wire [31:0] _tickCnt_T_1 = tickCnt + 32'h1; // @[src/main/scala/TickGenerator.scala 15:24]
  assign io_tickOut = tickCnt == _GEN_2; // @[src/main/scala/TickGenerator.scala 11:16]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/TickGenerator.scala 8:24]
      tickCnt <= 32'h0; // @[src/main/scala/TickGenerator.scala 8:24]
    end else if (tick) begin // @[src/main/scala/TickGenerator.scala 11:40]
      tickCnt <= 32'h0; // @[src/main/scala/TickGenerator.scala 12:13]
    end else begin
      tickCnt <= _tickCnt_T_1; // @[src/main/scala/TickGenerator.scala 15:13]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  tickCnt = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module ButtonDebouncer(
  input   clock,
  input   reset,
  input   io_inp, // @[src/main/scala/ButtonDebouncer.scala 5:14]
  output  io_out // @[src/main/scala/ButtonDebouncer.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  wire  tickGenerator_clock; // @[src/main/scala/ButtonDebouncer.scala 10:29]
  wire  tickGenerator_reset; // @[src/main/scala/ButtonDebouncer.scala 10:29]
  wire  tickGenerator_io_tickOut; // @[src/main/scala/ButtonDebouncer.scala 10:29]
  reg  sync_REG; // @[src/main/scala/ButtonDebouncer.scala 13:29]
  reg  sync; // @[src/main/scala/ButtonDebouncer.scala 13:21]
  reg  btnDebReg; // @[src/main/scala/ButtonDebouncer.scala 16:26]
  reg [3:0] tickCnt; // @[src/main/scala/ButtonDebouncer.scala 17:24]
  wire [3:0] _tickCnt_T_1 = tickCnt + 4'h1; // @[src/main/scala/ButtonDebouncer.scala 24:26]
  TickGenerator tickGenerator ( // @[src/main/scala/ButtonDebouncer.scala 10:29]
    .clock(tickGenerator_clock),
    .reset(tickGenerator_reset),
    .io_tickOut(tickGenerator_io_tickOut)
  );
  assign io_out = btnDebReg; // @[src/main/scala/ButtonDebouncer.scala 28:10]
  assign tickGenerator_clock = clock;
  assign tickGenerator_reset = reset;
  always @(posedge clock) begin
    sync_REG <= io_inp; // @[src/main/scala/ButtonDebouncer.scala 13:29]
    sync <= sync_REG; // @[src/main/scala/ButtonDebouncer.scala 13:21]
    if (reset) begin // @[src/main/scala/ButtonDebouncer.scala 16:26]
      btnDebReg <= 1'h0; // @[src/main/scala/ButtonDebouncer.scala 16:26]
    end else if (tickCnt == 4'h4) begin // @[src/main/scala/ButtonDebouncer.scala 19:26]
      btnDebReg <= sync; // @[src/main/scala/ButtonDebouncer.scala 21:15]
    end
    if (reset) begin // @[src/main/scala/ButtonDebouncer.scala 17:24]
      tickCnt <= 4'h0; // @[src/main/scala/ButtonDebouncer.scala 17:24]
    end else if (tickCnt == 4'h4) begin // @[src/main/scala/ButtonDebouncer.scala 19:26]
      tickCnt <= 4'h0; // @[src/main/scala/ButtonDebouncer.scala 20:13]
    end else if (tickGenerator_io_tickOut) begin // @[src/main/scala/ButtonDebouncer.scala 23:37]
      tickCnt <= _tickCnt_T_1; // @[src/main/scala/ButtonDebouncer.scala 24:15]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sync_REG = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  sync = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  btnDebReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  tickCnt = _RAND_3[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module extender(
  input   clock,
  input   reset,
  input   io_ringAlarm, // @[src/main/scala/extender.scala 6:14]
  input   io_releasing, // @[src/main/scala/extender.scala 6:14]
  output  io_alarm, // @[src/main/scala/extender.scala 6:14]
  output  io_releaseCan // @[src/main/scala/extender.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] tick_tickCnt; // @[src/main/scala/extender.scala 14:26]
  wire  tick = tick_tickCnt == 32'h5f5e0ff; // @[src/main/scala/extender.scala 17:18]
  wire [31:0] _tick_tickCnt_T_1 = tick_tickCnt + 32'h1; // @[src/main/scala/extender.scala 21:26]
  reg [9:0] countSec; // @[src/main/scala/extender.scala 28:25]
  reg  alarm; // @[src/main/scala/extender.scala 30:22]
  reg  releaseCan; // @[src/main/scala/extender.scala 31:27]
  reg  ringAlarmTrigger_REG; // @[src/main/scala/extender.scala 34:50]
  wire  ringAlarmTrigger = io_ringAlarm & ~ringAlarmTrigger_REG; // @[src/main/scala/extender.scala 34:39]
  reg  releasingTrigger_REG; // @[src/main/scala/extender.scala 35:50]
  wire  releasingTrigger = io_releasing & ~releasingTrigger_REG; // @[src/main/scala/extender.scala 35:39]
  wire [9:0] _countSec_T_1 = countSec + 10'h1; // @[src/main/scala/extender.scala 39:26]
  wire [9:0] _GEN_2 = tick & (alarm | releaseCan) ? _countSec_T_1 : countSec; // @[src/main/scala/extender.scala 38:39 39:14 28:25]
  wire  _GEN_3 = ringAlarmTrigger | alarm; // @[src/main/scala/extender.scala 42:26 43:11 30:22]
  wire  _GEN_5 = releasingTrigger | releaseCan; // @[src/main/scala/extender.scala 47:26 48:16 31:27]
  assign io_alarm = alarm; // @[src/main/scala/extender.scala 59:12]
  assign io_releaseCan = releaseCan; // @[src/main/scala/extender.scala 60:17]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/extender.scala 14:26]
      tick_tickCnt <= 32'h0; // @[src/main/scala/extender.scala 14:26]
    end else if (tick) begin // @[src/main/scala/extender.scala 17:35]
      tick_tickCnt <= 32'h0; // @[src/main/scala/extender.scala 18:15]
    end else begin
      tick_tickCnt <= _tick_tickCnt_T_1; // @[src/main/scala/extender.scala 21:15]
    end
    if (reset) begin // @[src/main/scala/extender.scala 28:25]
      countSec <= 10'h0; // @[src/main/scala/extender.scala 28:25]
    end else if (countSec == 10'h5) begin // @[src/main/scala/extender.scala 53:26]
      countSec <= 10'h0; // @[src/main/scala/extender.scala 56:14]
    end else if (releasingTrigger) begin // @[src/main/scala/extender.scala 47:26]
      countSec <= 10'h0; // @[src/main/scala/extender.scala 49:14]
    end else if (ringAlarmTrigger) begin // @[src/main/scala/extender.scala 42:26]
      countSec <= 10'h0; // @[src/main/scala/extender.scala 44:14]
    end else begin
      countSec <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/extender.scala 30:22]
      alarm <= 1'h0; // @[src/main/scala/extender.scala 30:22]
    end else if (countSec == 10'h5) begin // @[src/main/scala/extender.scala 53:26]
      alarm <= 1'h0; // @[src/main/scala/extender.scala 54:11]
    end else begin
      alarm <= _GEN_3;
    end
    if (reset) begin // @[src/main/scala/extender.scala 31:27]
      releaseCan <= 1'h0; // @[src/main/scala/extender.scala 31:27]
    end else if (countSec == 10'h5) begin // @[src/main/scala/extender.scala 53:26]
      releaseCan <= 1'h0; // @[src/main/scala/extender.scala 55:16]
    end else begin
      releaseCan <= _GEN_5;
    end
    ringAlarmTrigger_REG <= io_ringAlarm; // @[src/main/scala/extender.scala 34:50]
    releasingTrigger_REG <= io_releasing; // @[src/main/scala/extender.scala 35:50]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  tick_tickCnt = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  countSec = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  alarm = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  releaseCan = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  ringAlarmTrigger_REG = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  releasingTrigger_REG = _RAND_5[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SevenSegDec(
  input  [3:0] io_in, // @[src/main/scala/SevenSegDec1.scala 6:14]
  output [6:0] io_out // @[src/main/scala/SevenSegDec1.scala 6:14]
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[src/main/scala/SevenSegDec1.scala 13:17 30:22 11:27]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[src/main/scala/SevenSegDec1.scala 13:17 29:22]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h0 : _GEN_1; // @[src/main/scala/SevenSegDec1.scala 13:17 28:22]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h38 : _GEN_2; // @[src/main/scala/SevenSegDec1.scala 13:17 27:22]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h3e : _GEN_3; // @[src/main/scala/SevenSegDec1.scala 13:17 26:22]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h71 : _GEN_4; // @[src/main/scala/SevenSegDec1.scala 13:17 25:22]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h6f : _GEN_5; // @[src/main/scala/SevenSegDec1.scala 13:17 24:21]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h7f : _GEN_6; // @[src/main/scala/SevenSegDec1.scala 13:17 23:21]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h7 : _GEN_7; // @[src/main/scala/SevenSegDec1.scala 13:17 22:21]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h7d : _GEN_8; // @[src/main/scala/SevenSegDec1.scala 13:17 21:21]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h6d : _GEN_9; // @[src/main/scala/SevenSegDec1.scala 13:17 20:21]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h66 : _GEN_10; // @[src/main/scala/SevenSegDec1.scala 13:17 19:21]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h4f : _GEN_11; // @[src/main/scala/SevenSegDec1.scala 13:17 18:21]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h5b : _GEN_12; // @[src/main/scala/SevenSegDec1.scala 13:17 17:21]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h6 : _GEN_13; // @[src/main/scala/SevenSegDec1.scala 13:17 16:21]
  assign io_out = 4'h0 == io_in ? 7'h3f : _GEN_14; // @[src/main/scala/SevenSegDec1.scala 13:17 15:21]
endmodule
module DisplayMultiplexer(
  input        clock,
  input        reset,
  input  [7:0] io_sum, // @[src/main/scala/DisplayMultiplexer1.scala 6:16]
  input  [4:0] io_price, // @[src/main/scala/DisplayMultiplexer1.scala 6:16]
  output [6:0] io_seg, // @[src/main/scala/DisplayMultiplexer1.scala 6:16]
  output [3:0] io_an, // @[src/main/scala/DisplayMultiplexer1.scala 6:16]
  input        io_full // @[src/main/scala/DisplayMultiplexer1.scala 6:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] decoder_io_in; // @[src/main/scala/DisplayMultiplexer1.scala 13:23]
  wire [6:0] decoder_io_out; // @[src/main/scala/DisplayMultiplexer1.scala 13:23]
  reg [1:0] CountTo4; // @[src/main/scala/DisplayMultiplexer1.scala 14:25]
  reg  FullSequence; // @[src/main/scala/DisplayMultiplexer1.scala 15:29]
  reg [3:0] CountTo16; // @[src/main/scala/DisplayMultiplexer1.scala 16:26]
  reg [31:0] tick_tickCnt; // @[src/main/scala/DisplayMultiplexer1.scala 20:26]
  wire  tick = tick_tickCnt == 32'h5f5e0ff; // @[src/main/scala/DisplayMultiplexer1.scala 22:18]
  wire [31:0] _tick_tickCnt_T_1 = tick_tickCnt + 32'h1; // @[src/main/scala/DisplayMultiplexer1.scala 26:26]
  reg [31:0] slowTick_tickCnt; // @[src/main/scala/DisplayMultiplexer1.scala 20:26]
  wire  slowTick = slowTick_tickCnt == 32'h2160ebf; // @[src/main/scala/DisplayMultiplexer1.scala 22:18]
  wire [31:0] _slowTick_tickCnt_T_1 = slowTick_tickCnt + 32'h1; // @[src/main/scala/DisplayMultiplexer1.scala 26:26]
  wire [1:0] _CountTo4_T_1 = CountTo4 + 2'h1; // @[src/main/scala/DisplayMultiplexer1.scala 33:36]
  wire [3:0] _CountTo16_T_1 = CountTo16 + 4'h1; // @[src/main/scala/DisplayMultiplexer1.scala 34:41]
  wire  _GEN_6 = io_full | FullSequence; // @[src/main/scala/DisplayMultiplexer1.scala 36:17 37:18 15:29]
  reg [3:0] Number2Full; // @[src/main/scala/DisplayMultiplexer1.scala 46:28]
  reg [3:0] Number1Full; // @[src/main/scala/DisplayMultiplexer1.scala 47:28]
  reg [3:0] Number4Full; // @[src/main/scala/DisplayMultiplexer1.scala 48:28]
  reg [3:0] Number3Full; // @[src/main/scala/DisplayMultiplexer1.scala 49:28]
  wire [3:0] _GEN_12 = 4'h9 == CountTo16 ? 4'hd : Number2Full; // @[src/main/scala/DisplayMultiplexer1.scala 57:21 67:26 46:28]
  wire [3:0] _GEN_13 = 4'h8 == CountTo16 ? 4'hd : _GEN_12; // @[src/main/scala/DisplayMultiplexer1.scala 57:21 66:26]
  wire [3:0] _GEN_14 = 4'h7 == CountTo16 ? 4'hd : _GEN_13; // @[src/main/scala/DisplayMultiplexer1.scala 57:21 65:26]
  wire [3:0] _GEN_15 = 4'h6 == CountTo16 ? 4'hd : _GEN_14; // @[src/main/scala/DisplayMultiplexer1.scala 57:21 64:26]
  wire [3:0] _GEN_16 = 4'h5 == CountTo16 ? 4'hd : _GEN_15; // @[src/main/scala/DisplayMultiplexer1.scala 57:21 63:26]
  wire [3:0] _GEN_17 = 4'h4 == CountTo16 ? 4'ha : _GEN_16; // @[src/main/scala/DisplayMultiplexer1.scala 57:21 62:26]
  wire [3:0] _GEN_18 = 4'h3 == CountTo16 ? 4'hb : _GEN_17; // @[src/main/scala/DisplayMultiplexer1.scala 57:21 61:26]
  wire [7:0] _GEN_1 = io_sum % 8'ha; // @[src/main/scala/DisplayMultiplexer1.scala 71:23]
  wire [7:0] _number2_T = io_sum / 4'ha; // @[src/main/scala/DisplayMultiplexer1.scala 72:23]
  wire [4:0] _GEN_3 = io_price % 5'ha; // @[src/main/scala/DisplayMultiplexer1.scala 73:25]
  wire [4:0] _number4_T = io_price / 4'ha; // @[src/main/scala/DisplayMultiplexer1.scala 74:25]
  wire [3:0] number1 = ~FullSequence ? _GEN_1[3:0] : Number1Full; // @[src/main/scala/DisplayMultiplexer1.scala 70:23 71:13 76:13]
  wire [7:0] _GEN_23 = ~FullSequence ? _number2_T : {{4'd0}, Number2Full}; // @[src/main/scala/DisplayMultiplexer1.scala 70:23 72:13 77:13]
  wire [3:0] number3 = ~FullSequence ? _GEN_3[3:0] : Number3Full; // @[src/main/scala/DisplayMultiplexer1.scala 70:23 73:13 78:13]
  wire [4:0] _GEN_25 = ~FullSequence ? _number4_T : {{1'd0}, Number4Full}; // @[src/main/scala/DisplayMultiplexer1.scala 70:23 74:13 79:13]
  wire [3:0] number4 = _GEN_25[3:0]; // @[src/main/scala/DisplayMultiplexer1.scala 45:28]
  wire [3:0] _GEN_26 = 2'h1 == CountTo4 ? number4 : 4'h0; // @[src/main/scala/DisplayMultiplexer1.scala 82:17 84:20 88:32]
  wire [3:0] _GEN_27 = 2'h0 == CountTo4 ? number3 : _GEN_26; // @[src/main/scala/DisplayMultiplexer1.scala 84:20 87:32]
  wire [3:0] number2 = _GEN_23[3:0]; // @[src/main/scala/DisplayMultiplexer1.scala 43:28]
  wire [3:0] _GEN_28 = 2'h3 == CountTo4 ? number2 : _GEN_27; // @[src/main/scala/DisplayMultiplexer1.scala 84:20 86:32]
  wire [3:0] _io_an_T = 4'h1 << CountTo4; // @[src/main/scala/DisplayMultiplexer1.scala 91:18]
  SevenSegDec decoder ( // @[src/main/scala/DisplayMultiplexer1.scala 13:23]
    .io_in(decoder_io_in),
    .io_out(decoder_io_out)
  );
  assign io_seg = ~decoder_io_out; // @[src/main/scala/DisplayMultiplexer1.scala 92:13]
  assign io_an = ~_io_an_T; // @[src/main/scala/DisplayMultiplexer1.scala 91:12]
  assign decoder_io_in = 2'h2 == CountTo4 ? number1 : _GEN_28; // @[src/main/scala/DisplayMultiplexer1.scala 84:20 85:32]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 14:25]
      CountTo4 <= 2'h0; // @[src/main/scala/DisplayMultiplexer1.scala 14:25]
    end else if (tick) begin // @[src/main/scala/DisplayMultiplexer1.scala 33:14]
      CountTo4 <= _CountTo4_T_1; // @[src/main/scala/DisplayMultiplexer1.scala 33:24]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 15:29]
      FullSequence <= 1'h0; // @[src/main/scala/DisplayMultiplexer1.scala 15:29]
    end else if (CountTo16 == 4'ha) begin // @[src/main/scala/DisplayMultiplexer1.scala 40:25]
      FullSequence <= 1'h0; // @[src/main/scala/DisplayMultiplexer1.scala 40:38]
    end else begin
      FullSequence <= _GEN_6;
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 16:26]
      CountTo16 <= 4'h0; // @[src/main/scala/DisplayMultiplexer1.scala 16:26]
    end else if (io_full) begin // @[src/main/scala/DisplayMultiplexer1.scala 36:17]
      CountTo16 <= 4'h0; // @[src/main/scala/DisplayMultiplexer1.scala 38:14]
    end else if (slowTick) begin // @[src/main/scala/DisplayMultiplexer1.scala 34:17]
      CountTo16 <= _CountTo16_T_1; // @[src/main/scala/DisplayMultiplexer1.scala 34:28]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 20:26]
      tick_tickCnt <= 32'h0; // @[src/main/scala/DisplayMultiplexer1.scala 20:26]
    end else if (tick) begin // @[src/main/scala/DisplayMultiplexer1.scala 22:35]
      tick_tickCnt <= 32'h0; // @[src/main/scala/DisplayMultiplexer1.scala 23:15]
    end else begin
      tick_tickCnt <= _tick_tickCnt_T_1; // @[src/main/scala/DisplayMultiplexer1.scala 26:15]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 20:26]
      slowTick_tickCnt <= 32'h0; // @[src/main/scala/DisplayMultiplexer1.scala 20:26]
    end else if (slowTick) begin // @[src/main/scala/DisplayMultiplexer1.scala 22:35]
      slowTick_tickCnt <= 32'h0; // @[src/main/scala/DisplayMultiplexer1.scala 23:15]
    end else begin
      slowTick_tickCnt <= _slowTick_tickCnt_T_1; // @[src/main/scala/DisplayMultiplexer1.scala 26:15]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 46:28]
      Number2Full <= 4'hd; // @[src/main/scala/DisplayMultiplexer1.scala 46:28]
    end else if (4'h0 == CountTo16) begin // @[src/main/scala/DisplayMultiplexer1.scala 57:21]
      Number2Full <= 4'hd; // @[src/main/scala/DisplayMultiplexer1.scala 58:26]
    end else if (4'h1 == CountTo16) begin // @[src/main/scala/DisplayMultiplexer1.scala 57:21]
      Number2Full <= 4'hc; // @[src/main/scala/DisplayMultiplexer1.scala 59:26]
    end else if (4'h2 == CountTo16) begin // @[src/main/scala/DisplayMultiplexer1.scala 57:21]
      Number2Full <= 4'hc; // @[src/main/scala/DisplayMultiplexer1.scala 60:26]
    end else begin
      Number2Full <= _GEN_18;
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 47:28]
      Number1Full <= 4'hd; // @[src/main/scala/DisplayMultiplexer1.scala 47:28]
    end else if (slowTick) begin // @[src/main/scala/DisplayMultiplexer1.scala 51:17]
      Number1Full <= Number2Full; // @[src/main/scala/DisplayMultiplexer1.scala 54:17]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 48:28]
      Number4Full <= 4'hd; // @[src/main/scala/DisplayMultiplexer1.scala 48:28]
    end else if (slowTick) begin // @[src/main/scala/DisplayMultiplexer1.scala 51:17]
      Number4Full <= Number1Full; // @[src/main/scala/DisplayMultiplexer1.scala 53:17]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 49:28]
      Number3Full <= 4'hd; // @[src/main/scala/DisplayMultiplexer1.scala 49:28]
    end else if (slowTick) begin // @[src/main/scala/DisplayMultiplexer1.scala 51:17]
      Number3Full <= Number4Full; // @[src/main/scala/DisplayMultiplexer1.scala 52:17]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  CountTo4 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  FullSequence = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  CountTo16 = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  tick_tickCnt = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  slowTick_tickCnt = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  Number2Full = _RAND_5[3:0];
  _RAND_6 = {1{`RANDOM}};
  Number1Full = _RAND_6[3:0];
  _RAND_7 = {1{`RANDOM}};
  Number4Full = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  Number3Full = _RAND_8[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Datapath(
  input        clock,
  input        reset,
  input  [4:0] io_price, // @[src/main/scala/Datapath.scala 5:14]
  input  [2:0] io_FSMstate, // @[src/main/scala/Datapath.scala 5:14]
  output       io_Full2, // @[src/main/scala/Datapath.scala 5:14]
  output       io_Full5, // @[src/main/scala/Datapath.scala 5:14]
  output       io_enough, // @[src/main/scala/Datapath.scala 5:14]
  output [6:0] io_money // @[src/main/scala/Datapath.scala 5:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] money; // @[src/main/scala/Datapath.scala 13:22]
  wire [4:0] _io_enough_T_1 = io_price - 5'h1; // @[src/main/scala/Datapath.scala 17:34]
  wire [6:0] _GEN_6 = {{2'd0}, _io_enough_T_1}; // @[src/main/scala/Datapath.scala 17:23]
  wire [6:0] _money_T_1 = money + 7'h2; // @[src/main/scala/Datapath.scala 21:26]
  wire [6:0] _money_T_3 = money + 7'h5; // @[src/main/scala/Datapath.scala 22:26]
  wire [6:0] _GEN_7 = {{2'd0}, io_price}; // @[src/main/scala/Datapath.scala 24:26]
  wire [6:0] _money_T_5 = money - _GEN_7; // @[src/main/scala/Datapath.scala 24:26]
  wire [6:0] _GEN_1 = 3'h4 == io_FSMstate ? _money_T_5 : money; // @[src/main/scala/Datapath.scala 19:22 24:18]
  wire [6:0] _GEN_2 = 3'h3 == io_FSMstate ? money : _GEN_1; // @[src/main/scala/Datapath.scala 19:22 23:18]
  assign io_Full2 = money > 7'h61; // @[src/main/scala/Datapath.scala 15:22]
  assign io_Full5 = money > 7'h5e; // @[src/main/scala/Datapath.scala 16:22]
  assign io_enough = money > _GEN_6; // @[src/main/scala/Datapath.scala 17:23]
  assign io_money = money; // @[src/main/scala/Datapath.scala 27:12]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/Datapath.scala 13:22]
      money <= 7'h0; // @[src/main/scala/Datapath.scala 13:22]
    end else if (!(3'h0 == io_FSMstate)) begin // @[src/main/scala/Datapath.scala 19:22]
      if (3'h1 == io_FSMstate) begin // @[src/main/scala/Datapath.scala 19:22]
        money <= _money_T_1; // @[src/main/scala/Datapath.scala 21:18]
      end else if (3'h2 == io_FSMstate) begin // @[src/main/scala/Datapath.scala 19:22]
        money <= _money_T_3; // @[src/main/scala/Datapath.scala 22:18]
      end else begin
        money <= _GEN_2;
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  money = _RAND_0[6:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Tx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/chisel/lib/uart/Uart.scala 23:14]
  output       io_channel_ready, // @[src/main/scala/chisel/lib/uart/Uart.scala 23:14]
  input        io_channel_valid, // @[src/main/scala/chisel/lib/uart/Uart.scala 23:14]
  input  [7:0] io_channel_bits // @[src/main/scala/chisel/lib/uart/Uart.scala 23:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [10:0] shiftReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 30:25]
  reg [19:0] cntReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 31:23]
  reg [3:0] bitsReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 32:24]
  wire  _io_channel_ready_T = cntReg == 20'h0; // @[src/main/scala/chisel/lib/uart/Uart.scala 34:31]
  wire [9:0] shift = shiftReg[10:1]; // @[src/main/scala/chisel/lib/uart/Uart.scala 41:28]
  wire [10:0] _shiftReg_T_1 = {1'h1,shift}; // @[src/main/scala/chisel/lib/uart/Uart.scala 42:22]
  wire [3:0] _bitsReg_T_1 = bitsReg - 4'h1; // @[src/main/scala/chisel/lib/uart/Uart.scala 43:26]
  wire [10:0] _shiftReg_T_3 = {2'h3,io_channel_bits,1'h0}; // @[src/main/scala/chisel/lib/uart/Uart.scala 46:24]
  wire [19:0] _cntReg_T_1 = cntReg - 20'h1; // @[src/main/scala/chisel/lib/uart/Uart.scala 54:22]
  assign io_txd = shiftReg[0]; // @[src/main/scala/chisel/lib/uart/Uart.scala 35:21]
  assign io_channel_ready = cntReg == 20'h0 & bitsReg == 4'h0; // @[src/main/scala/chisel/lib/uart/Uart.scala 34:40]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 30:25]
      shiftReg <= 11'h7ff; // @[src/main/scala/chisel/lib/uart/Uart.scala 30:25]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 37:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 40:27]
        shiftReg <= _shiftReg_T_1; // @[src/main/scala/chisel/lib/uart/Uart.scala 42:16]
      end else if (io_channel_valid) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 45:30]
        shiftReg <= _shiftReg_T_3; // @[src/main/scala/chisel/lib/uart/Uart.scala 46:18]
      end else begin
        shiftReg <= 11'h7ff; // @[src/main/scala/chisel/lib/uart/Uart.scala 49:18]
      end
    end
    if (reset) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 31:23]
      cntReg <= 20'h0; // @[src/main/scala/chisel/lib/uart/Uart.scala 31:23]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 37:24]
      cntReg <= 20'h363; // @[src/main/scala/chisel/lib/uart/Uart.scala 39:12]
    end else begin
      cntReg <= _cntReg_T_1; // @[src/main/scala/chisel/lib/uart/Uart.scala 54:12]
    end
    if (reset) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 32:24]
      bitsReg <= 4'h0; // @[src/main/scala/chisel/lib/uart/Uart.scala 32:24]
    end else if (_io_channel_ready_T) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 37:24]
      if (bitsReg != 4'h0) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 40:27]
        bitsReg <= _bitsReg_T_1; // @[src/main/scala/chisel/lib/uart/Uart.scala 43:15]
      end else if (io_channel_valid) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 45:30]
        bitsReg <= 4'hb; // @[src/main/scala/chisel/lib/uart/Uart.scala 47:17]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  cntReg = _RAND_1[19:0];
  _RAND_2 = {1{`RANDOM}};
  bitsReg = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Buffer(
  input        clock,
  input        reset,
  output       io_in_ready, // @[src/main/scala/chisel/lib/uart/Uart.scala 111:14]
  input        io_in_valid, // @[src/main/scala/chisel/lib/uart/Uart.scala 111:14]
  input  [7:0] io_in_bits, // @[src/main/scala/chisel/lib/uart/Uart.scala 111:14]
  input        io_out_ready, // @[src/main/scala/chisel/lib/uart/Uart.scala 111:14]
  output       io_out_valid, // @[src/main/scala/chisel/lib/uart/Uart.scala 111:14]
  output [7:0] io_out_bits // @[src/main/scala/chisel/lib/uart/Uart.scala 111:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 117:25]
  reg [7:0] dataReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 118:24]
  wire  _io_in_ready_T = ~stateReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 120:27]
  wire  _GEN_1 = io_in_valid | stateReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 124:23 126:16 117:25]
  assign io_in_ready = ~stateReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 120:27]
  assign io_out_valid = stateReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 121:28]
  assign io_out_bits = dataReg; // @[src/main/scala/chisel/lib/uart/Uart.scala 133:15]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 117:25]
      stateReg <= 1'h0; // @[src/main/scala/chisel/lib/uart/Uart.scala 117:25]
    end else if (_io_in_ready_T) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 123:28]
      stateReg <= _GEN_1;
    end else if (io_out_ready) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 129:24]
      stateReg <= 1'h0; // @[src/main/scala/chisel/lib/uart/Uart.scala 130:16]
    end
    if (reset) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 118:24]
      dataReg <= 8'h0; // @[src/main/scala/chisel/lib/uart/Uart.scala 118:24]
    end else if (_io_in_ready_T) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 123:28]
      if (io_in_valid) begin // @[src/main/scala/chisel/lib/uart/Uart.scala 124:23]
        dataReg <= io_in_bits; // @[src/main/scala/chisel/lib/uart/Uart.scala 125:15]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  dataReg = _RAND_1[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module BufferedTx(
  input        clock,
  input        reset,
  output       io_txd, // @[src/main/scala/chisel/lib/uart/Uart.scala 140:14]
  output       io_channel_ready, // @[src/main/scala/chisel/lib/uart/Uart.scala 140:14]
  input        io_channel_valid, // @[src/main/scala/chisel/lib/uart/Uart.scala 140:14]
  input  [7:0] io_channel_bits // @[src/main/scala/chisel/lib/uart/Uart.scala 140:14]
);
  wire  tx_clock; // @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
  wire  tx_reset; // @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
  wire  tx_io_txd; // @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
  wire  tx_io_channel_ready; // @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
  wire  tx_io_channel_valid; // @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
  wire [7:0] tx_io_channel_bits; // @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
  wire  buf__clock; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  wire  buf__reset; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  wire  buf__io_in_ready; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  wire  buf__io_in_valid; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  wire [7:0] buf__io_in_bits; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  wire  buf__io_out_ready; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  wire  buf__io_out_valid; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  wire [7:0] buf__io_out_bits; // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
  Tx tx ( // @[src/main/scala/chisel/lib/uart/Uart.scala 144:18]
    .clock(tx_clock),
    .reset(tx_reset),
    .io_txd(tx_io_txd),
    .io_channel_ready(tx_io_channel_ready),
    .io_channel_valid(tx_io_channel_valid),
    .io_channel_bits(tx_io_channel_bits)
  );
  Buffer buf_ ( // @[src/main/scala/chisel/lib/uart/Uart.scala 145:19]
    .clock(buf__clock),
    .reset(buf__reset),
    .io_in_ready(buf__io_in_ready),
    .io_in_valid(buf__io_in_valid),
    .io_in_bits(buf__io_in_bits),
    .io_out_ready(buf__io_out_ready),
    .io_out_valid(buf__io_out_valid),
    .io_out_bits(buf__io_out_bits)
  );
  assign io_txd = tx_io_txd; // @[src/main/scala/chisel/lib/uart/Uart.scala 149:10]
  assign io_channel_ready = buf__io_in_ready; // @[src/main/scala/chisel/lib/uart/Uart.scala 147:13]
  assign tx_clock = clock;
  assign tx_reset = reset;
  assign tx_io_channel_valid = buf__io_out_valid; // @[src/main/scala/chisel/lib/uart/Uart.scala 148:17]
  assign tx_io_channel_bits = buf__io_out_bits; // @[src/main/scala/chisel/lib/uart/Uart.scala 148:17]
  assign buf__clock = clock;
  assign buf__reset = reset;
  assign buf__io_in_valid = io_channel_valid; // @[src/main/scala/chisel/lib/uart/Uart.scala 147:13]
  assign buf__io_in_bits = io_channel_bits; // @[src/main/scala/chisel/lib/uart/Uart.scala 147:13]
  assign buf__io_out_ready = tx_io_channel_ready; // @[src/main/scala/chisel/lib/uart/Uart.scala 148:17]
endmodule
module SerialCommunicator(
  input        clock,
  input        reset,
  input  [4:0] io_price, // @[src/main/scala/SerialCommunicator.scala 11:16]
  input  [7:0] io_sum, // @[src/main/scala/SerialCommunicator.scala 11:16]
  input        io_update, // @[src/main/scala/SerialCommunicator.scala 11:16]
  output       io_tx // @[src/main/scala/SerialCommunicator.scala 11:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  uart_clock; // @[src/main/scala/SerialCommunicator.scala 19:22]
  wire  uart_reset; // @[src/main/scala/SerialCommunicator.scala 19:22]
  wire  uart_io_txd; // @[src/main/scala/SerialCommunicator.scala 19:22]
  wire  uart_io_channel_ready; // @[src/main/scala/SerialCommunicator.scala 19:22]
  wire  uart_io_channel_valid; // @[src/main/scala/SerialCommunicator.scala 19:22]
  wire [7:0] uart_io_channel_bits; // @[src/main/scala/SerialCommunicator.scala 19:22]
  reg [1:0] writeState; // @[src/main/scala/SerialCommunicator.scala 29:29]
  reg  writing; // @[src/main/scala/SerialCommunicator.scala 30:26]
  reg [3:0] index; // @[src/main/scala/SerialCommunicator.scala 31:24]
  wire [7:0] _GEN_22 = 2'h3 == writeState ? 8'h4d : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_38 = 2'h2 == writeState ? 8'h50 : _GEN_22; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_55 = 2'h1 == writeState ? 8'h1b : _GEN_38; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_0 = 2'h0 == writeState ? 8'h0 : _GEN_55; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_23 = 2'h3 == writeState ? 8'h6f : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_39 = 2'h2 == writeState ? 8'h72 : _GEN_23; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_56 = 2'h1 == writeState ? 8'h5b : _GEN_39; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_1 = 2'h0 == writeState ? 8'h0 : _GEN_56; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_1 = 4'h1 == index ? msg_1 : msg_0; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_24 = 2'h3 == writeState ? 8'h6e : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_40 = 2'h2 == writeState ? 8'h69 : _GEN_24; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_57 = 2'h1 == writeState ? 8'h31 : _GEN_40; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_2 = 2'h0 == writeState ? 8'h0 : _GEN_57; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_2 = 4'h2 == index ? msg_2 : _GEN_1; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_25 = 2'h3 == writeState ? 8'h65 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_41 = 2'h2 == writeState ? 8'h63 : _GEN_25; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_58 = 2'h1 == writeState ? 8'h3b : _GEN_41; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_3 = 2'h0 == writeState ? 8'h0 : _GEN_58; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_3 = 4'h3 == index ? msg_3 : _GEN_2; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_26 = 2'h3 == writeState ? 8'h79 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_42 = 2'h2 == writeState ? 8'h65 : _GEN_26; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_59 = 2'h1 == writeState ? 8'h33 : _GEN_42; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_4 = 2'h0 == writeState ? 8'h0 : _GEN_59; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_4 = 4'h4 == index ? msg_4 : _GEN_3; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_27 = 2'h3 == writeState ? 8'h3a : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_43 = 2'h2 == writeState ? 8'h3a : _GEN_27; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_60 = 2'h1 == writeState ? 8'h32 : _GEN_43; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_5 = 2'h0 == writeState ? 8'h0 : _GEN_60; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_5 = 4'h5 == index ? msg_5 : _GEN_4; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_28 = 2'h3 == writeState ? 8'h20 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_44 = 2'h2 == writeState ? 8'h20 : _GEN_28; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_61 = 2'h1 == writeState ? 8'h6d : _GEN_44; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_6 = 2'h0 == writeState ? 8'h0 : _GEN_61; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_6 = 4'h6 == index ? msg_6 : _GEN_5; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [4:0] _tens_T = io_price / 4'ha; // @[src/main/scala/SerialCommunicator.scala 23:31]
  wire [4:0] _GEN_0 = _tens_T % 5'ha; // @[src/main/scala/SerialCommunicator.scala 23:39]
  wire [3:0] tens = _GEN_0[3:0]; // @[src/main/scala/SerialCommunicator.scala 23:39]
  wire [7:0] _GEN_95 = {{4'd0}, tens}; // @[src/main/scala/SerialCommunicator.scala 25:18]
  wire [7:0] _T_11 = _GEN_95 + 8'h30; // @[src/main/scala/SerialCommunicator.scala 25:18]
  wire [7:0] _tens_T_1 = io_sum / 4'ha; // @[src/main/scala/SerialCommunicator.scala 23:31]
  wire [7:0] _GEN_14 = _tens_T_1 % 8'ha; // @[src/main/scala/SerialCommunicator.scala 23:39]
  wire [3:0] tens_1 = _GEN_14[3:0]; // @[src/main/scala/SerialCommunicator.scala 23:39]
  wire [7:0] _GEN_96 = {{4'd0}, tens_1}; // @[src/main/scala/SerialCommunicator.scala 25:18]
  wire [7:0] _T_19 = _GEN_96 + 8'h30; // @[src/main/scala/SerialCommunicator.scala 25:18]
  wire [7:0] _GEN_29 = 2'h3 == writeState ? _T_19 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_45 = 2'h2 == writeState ? _T_11 : _GEN_29; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_62 = 2'h1 == writeState ? 8'h20 : _GEN_45; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_7 = 2'h0 == writeState ? 8'h0 : _GEN_62; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_7 = 4'h7 == index ? msg_7 : _GEN_6; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [4:0] _GEN_20 = io_price % 5'ha; // @[src/main/scala/SerialCommunicator.scala 24:30]
  wire [3:0] ones = _GEN_20[3:0]; // @[src/main/scala/SerialCommunicator.scala 24:30]
  wire [7:0] _GEN_97 = {{4'd0}, ones}; // @[src/main/scala/SerialCommunicator.scala 25:36]
  wire [7:0] _T_13 = _GEN_97 + 8'h30; // @[src/main/scala/SerialCommunicator.scala 25:36]
  wire [7:0] _GEN_31 = io_sum % 8'ha; // @[src/main/scala/SerialCommunicator.scala 24:30]
  wire [3:0] ones_1 = _GEN_31[3:0]; // @[src/main/scala/SerialCommunicator.scala 24:30]
  wire [7:0] _GEN_98 = {{4'd0}, ones_1}; // @[src/main/scala/SerialCommunicator.scala 25:36]
  wire [7:0] _T_21 = _GEN_98 + 8'h30; // @[src/main/scala/SerialCommunicator.scala 25:36]
  wire [7:0] _GEN_30 = 2'h3 == writeState ? _T_21 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_46 = 2'h2 == writeState ? _T_13 : _GEN_30; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_63 = 2'h1 == writeState ? 8'h1b : _GEN_46; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_8 = 2'h0 == writeState ? 8'h0 : _GEN_63; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_8 = 4'h8 == index ? msg_8 : _GEN_7; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_64 = 2'h1 == writeState ? 8'h5b : _GEN_44; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_9 = 2'h0 == writeState ? 8'h0 : _GEN_64; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_9 = 4'h9 == index ? msg_9 : _GEN_8; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_32 = 2'h3 == writeState ? 8'h41 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_48 = 2'h2 == writeState ? 8'h41 : _GEN_32; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_65 = 2'h1 == writeState ? 8'h32 : _GEN_48; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_10 = 2'h0 == writeState ? 8'h0 : _GEN_65; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_10 = 4'ha == index ? msg_10 : _GEN_9; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_33 = 2'h3 == writeState ? 8'h54 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_49 = 2'h2 == writeState ? 8'h54 : _GEN_33; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_66 = 2'h1 == writeState ? 8'h4a : _GEN_49; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_11 = 2'h0 == writeState ? 8'h0 : _GEN_66; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_11 = 4'hb == index ? msg_11 : _GEN_10; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_34 = 2'h3 == writeState ? 8'h53 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_50 = 2'h2 == writeState ? 8'h53 : _GEN_34; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_67 = 2'h1 == writeState ? 8'h1b : _GEN_50; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_12 = 2'h0 == writeState ? 8'h0 : _GEN_67; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_12 = 4'hc == index ? msg_12 : _GEN_11; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_35 = 2'h3 == writeState ? 8'ha : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_51 = 2'h2 == writeState ? 8'ha : _GEN_35; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_68 = 2'h1 == writeState ? 8'h5b : _GEN_51; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_13 = 2'h0 == writeState ? 8'h0 : _GEN_68; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire [7:0] _GEN_13 = 4'hd == index ? msg_13 : _GEN_12; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  wire [7:0] _GEN_36 = 2'h3 == writeState ? 8'hd : 8'h0; // @[src/main/scala/SerialCommunicator.scala 37:24 71:17 28:26]
  wire [7:0] _GEN_52 = 2'h2 == writeState ? 8'hd : _GEN_36; // @[src/main/scala/SerialCommunicator.scala 37:24 59:17]
  wire [7:0] _GEN_69 = 2'h1 == writeState ? 8'h48 : _GEN_52; // @[src/main/scala/SerialCommunicator.scala 37:24 45:17]
  wire [7:0] msg_14 = 2'h0 == writeState ? 8'h0 : _GEN_69; // @[src/main/scala/SerialCommunicator.scala 37:24 28:26]
  wire  _GEN_16 = io_update | writing; // @[src/main/scala/SerialCommunicator.scala 39:29 41:25 30:26]
  wire  _T_6 = ~writing; // @[src/main/scala/SerialCommunicator.scala 53:18]
  wire  _GEN_18 = ~writing | writing; // @[src/main/scala/SerialCommunicator.scala 53:28 55:25 30:26]
  wire [1:0] _GEN_19 = _T_6 ? 2'h3 : writeState; // @[src/main/scala/SerialCommunicator.scala 65:28 66:28 29:29]
  wire [1:0] _GEN_21 = _T_6 ? 2'h0 : writeState; // @[src/main/scala/SerialCommunicator.scala 77:28 78:28 29:29]
  wire [1:0] _GEN_37 = 2'h3 == writeState ? _GEN_21 : writeState; // @[src/main/scala/SerialCommunicator.scala 37:24 29:29]
  wire  _GEN_54 = 2'h2 == writeState ? _GEN_18 : writing; // @[src/main/scala/SerialCommunicator.scala 37:24 30:26]
  wire  _GEN_71 = 2'h1 == writeState ? _GEN_18 : _GEN_54; // @[src/main/scala/SerialCommunicator.scala 37:24]
  wire  _GEN_73 = 2'h0 == writeState ? _GEN_16 : _GEN_71; // @[src/main/scala/SerialCommunicator.scala 37:24]
  wire [3:0] _index_T_1 = index + 4'h1; // @[src/main/scala/SerialCommunicator.scala 89:32]
  BufferedTx uart ( // @[src/main/scala/SerialCommunicator.scala 19:22]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_txd(uart_io_txd),
    .io_channel_ready(uart_io_channel_ready),
    .io_channel_valid(uart_io_channel_valid),
    .io_channel_bits(uart_io_channel_bits)
  );
  assign io_tx = uart_io_txd; // @[src/main/scala/SerialCommunicator.scala 20:11]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_channel_valid = writing; // @[src/main/scala/SerialCommunicator.scala 33:27]
  assign uart_io_channel_bits = 4'he == index ? msg_14 : _GEN_13; // @[src/main/scala/SerialCommunicator.scala 34:{27,27}]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/SerialCommunicator.scala 29:29]
      writeState <= 2'h0; // @[src/main/scala/SerialCommunicator.scala 29:29]
    end else if (2'h0 == writeState) begin // @[src/main/scala/SerialCommunicator.scala 37:24]
      if (io_update) begin // @[src/main/scala/SerialCommunicator.scala 39:29]
        writeState <= 2'h1; // @[src/main/scala/SerialCommunicator.scala 40:28]
      end
    end else if (2'h1 == writeState) begin // @[src/main/scala/SerialCommunicator.scala 37:24]
      if (~writing) begin // @[src/main/scala/SerialCommunicator.scala 53:28]
        writeState <= 2'h2; // @[src/main/scala/SerialCommunicator.scala 54:28]
      end
    end else if (2'h2 == writeState) begin // @[src/main/scala/SerialCommunicator.scala 37:24]
      writeState <= _GEN_19;
    end else begin
      writeState <= _GEN_37;
    end
    if (reset) begin // @[src/main/scala/SerialCommunicator.scala 30:26]
      writing <= 1'h0; // @[src/main/scala/SerialCommunicator.scala 30:26]
    end else if (writing) begin // @[src/main/scala/SerialCommunicator.scala 83:19]
      if (uart_io_channel_ready) begin // @[src/main/scala/SerialCommunicator.scala 84:37]
        if (index == 4'hf) begin // @[src/main/scala/SerialCommunicator.scala 85:34]
          writing <= 1'h0; // @[src/main/scala/SerialCommunicator.scala 87:25]
        end else begin
          writing <= _GEN_73;
        end
      end else begin
        writing <= _GEN_73;
      end
    end else begin
      writing <= _GEN_73;
    end
    if (reset) begin // @[src/main/scala/SerialCommunicator.scala 31:24]
      index <= 4'h0; // @[src/main/scala/SerialCommunicator.scala 31:24]
    end else if (writing) begin // @[src/main/scala/SerialCommunicator.scala 83:19]
      if (uart_io_channel_ready) begin // @[src/main/scala/SerialCommunicator.scala 84:37]
        if (index == 4'hf) begin // @[src/main/scala/SerialCommunicator.scala 85:34]
          index <= 4'h0; // @[src/main/scala/SerialCommunicator.scala 86:23]
        end else begin
          index <= _index_T_1; // @[src/main/scala/SerialCommunicator.scala 89:23]
        end
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  writeState = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  writing = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  index = _RAND_2[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module FSM(
  input        clock,
  input        reset,
  input  [4:0] io_price, // @[src/main/scala/FSM.scala 10:14]
  input        io_coin2, // @[src/main/scala/FSM.scala 10:14]
  input        io_coin5, // @[src/main/scala/FSM.scala 10:14]
  input        io_buy, // @[src/main/scala/FSM.scala 10:14]
  output       io_releaseCan, // @[src/main/scala/FSM.scala 10:14]
  output       io_alarm, // @[src/main/scala/FSM.scala 10:14]
  output [6:0] io_seg, // @[src/main/scala/FSM.scala 10:14]
  output [3:0] io_an, // @[src/main/scala/FSM.scala 10:14]
  output       io_tx // @[src/main/scala/FSM.scala 10:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  ButtonDeb1_clock; // @[src/main/scala/FSM.scala 25:26]
  wire  ButtonDeb1_reset; // @[src/main/scala/FSM.scala 25:26]
  wire  ButtonDeb1_io_inp; // @[src/main/scala/FSM.scala 25:26]
  wire  ButtonDeb1_io_out; // @[src/main/scala/FSM.scala 25:26]
  wire  ButtonDeb2_clock; // @[src/main/scala/FSM.scala 29:26]
  wire  ButtonDeb2_reset; // @[src/main/scala/FSM.scala 29:26]
  wire  ButtonDeb2_io_inp; // @[src/main/scala/FSM.scala 29:26]
  wire  ButtonDeb2_io_out; // @[src/main/scala/FSM.scala 29:26]
  wire  ButtonDeb3_clock; // @[src/main/scala/FSM.scala 33:26]
  wire  ButtonDeb3_reset; // @[src/main/scala/FSM.scala 33:26]
  wire  ButtonDeb3_io_inp; // @[src/main/scala/FSM.scala 33:26]
  wire  ButtonDeb3_io_out; // @[src/main/scala/FSM.scala 33:26]
  wire  extender_clock; // @[src/main/scala/FSM.scala 40:24]
  wire  extender_reset; // @[src/main/scala/FSM.scala 40:24]
  wire  extender_io_ringAlarm; // @[src/main/scala/FSM.scala 40:24]
  wire  extender_io_releasing; // @[src/main/scala/FSM.scala 40:24]
  wire  extender_io_alarm; // @[src/main/scala/FSM.scala 40:24]
  wire  extender_io_releaseCan; // @[src/main/scala/FSM.scala 40:24]
  wire  DisplayMultiplexer_clock; // @[src/main/scala/FSM.scala 41:34]
  wire  DisplayMultiplexer_reset; // @[src/main/scala/FSM.scala 41:34]
  wire [7:0] DisplayMultiplexer_io_sum; // @[src/main/scala/FSM.scala 41:34]
  wire [4:0] DisplayMultiplexer_io_price; // @[src/main/scala/FSM.scala 41:34]
  wire [6:0] DisplayMultiplexer_io_seg; // @[src/main/scala/FSM.scala 41:34]
  wire [3:0] DisplayMultiplexer_io_an; // @[src/main/scala/FSM.scala 41:34]
  wire  DisplayMultiplexer_io_full; // @[src/main/scala/FSM.scala 41:34]
  wire  Datapath_clock; // @[src/main/scala/FSM.scala 42:24]
  wire  Datapath_reset; // @[src/main/scala/FSM.scala 42:24]
  wire [4:0] Datapath_io_price; // @[src/main/scala/FSM.scala 42:24]
  wire [2:0] Datapath_io_FSMstate; // @[src/main/scala/FSM.scala 42:24]
  wire  Datapath_io_Full2; // @[src/main/scala/FSM.scala 42:24]
  wire  Datapath_io_Full5; // @[src/main/scala/FSM.scala 42:24]
  wire  Datapath_io_enough; // @[src/main/scala/FSM.scala 42:24]
  wire [6:0] Datapath_io_money; // @[src/main/scala/FSM.scala 42:24]
  wire  SerialComs_clock; // @[src/main/scala/FSM.scala 43:26]
  wire  SerialComs_reset; // @[src/main/scala/FSM.scala 43:26]
  wire [4:0] SerialComs_io_price; // @[src/main/scala/FSM.scala 43:26]
  wire [7:0] SerialComs_io_sum; // @[src/main/scala/FSM.scala 43:26]
  wire  SerialComs_io_update; // @[src/main/scala/FSM.scala 43:26]
  wire  SerialComs_io_tx; // @[src/main/scala/FSM.scala 43:26]
  reg [2:0] stateReg; // @[src/main/scala/FSM.scala 37:25]
  reg  prevCoin2; // @[src/main/scala/FSM.scala 46:26]
  reg  prevCoin5; // @[src/main/scala/FSM.scala 47:26]
  reg  prevBuy; // @[src/main/scala/FSM.scala 48:24]
  reg [4:0] prevPrice; // @[src/main/scala/FSM.scala 49:26]
  wire  coin2Trigger = ButtonDeb1_io_out & ~prevCoin2; // @[src/main/scala/FSM.scala 52:31]
  wire  coin5Trigger = ButtonDeb2_io_out & ~prevCoin5; // @[src/main/scala/FSM.scala 53:31]
  wire  buyTrigger = ButtonDeb3_io_out & ~prevBuy; // @[src/main/scala/FSM.scala 54:27]
  wire  priceTrigger = io_price != prevPrice; // @[src/main/scala/FSM.scala 55:31]
  wire [2:0] _GEN_0 = coin5Trigger & Datapath_io_Full5 ? 3'h5 : 3'h0; // @[src/main/scala/FSM.scala 38:12 73:41 74:18]
  wire [2:0] _GEN_1 = coin2Trigger & Datapath_io_Full2 ? 3'h5 : _GEN_0; // @[src/main/scala/FSM.scala 71:41 72:18]
  wire [2:0] _GEN_2 = buyTrigger & Datapath_io_enough ? 3'h4 : _GEN_1; // @[src/main/scala/FSM.scala 69:40 70:18]
  wire [2:0] _GEN_3 = buyTrigger & ~Datapath_io_enough ? 3'h3 : _GEN_2; // @[src/main/scala/FSM.scala 67:41 68:18]
  ButtonDebouncer ButtonDeb1 ( // @[src/main/scala/FSM.scala 25:26]
    .clock(ButtonDeb1_clock),
    .reset(ButtonDeb1_reset),
    .io_inp(ButtonDeb1_io_inp),
    .io_out(ButtonDeb1_io_out)
  );
  ButtonDebouncer ButtonDeb2 ( // @[src/main/scala/FSM.scala 29:26]
    .clock(ButtonDeb2_clock),
    .reset(ButtonDeb2_reset),
    .io_inp(ButtonDeb2_io_inp),
    .io_out(ButtonDeb2_io_out)
  );
  ButtonDebouncer ButtonDeb3 ( // @[src/main/scala/FSM.scala 33:26]
    .clock(ButtonDeb3_clock),
    .reset(ButtonDeb3_reset),
    .io_inp(ButtonDeb3_io_inp),
    .io_out(ButtonDeb3_io_out)
  );
  extender extender ( // @[src/main/scala/FSM.scala 40:24]
    .clock(extender_clock),
    .reset(extender_reset),
    .io_ringAlarm(extender_io_ringAlarm),
    .io_releasing(extender_io_releasing),
    .io_alarm(extender_io_alarm),
    .io_releaseCan(extender_io_releaseCan)
  );
  DisplayMultiplexer DisplayMultiplexer ( // @[src/main/scala/FSM.scala 41:34]
    .clock(DisplayMultiplexer_clock),
    .reset(DisplayMultiplexer_reset),
    .io_sum(DisplayMultiplexer_io_sum),
    .io_price(DisplayMultiplexer_io_price),
    .io_seg(DisplayMultiplexer_io_seg),
    .io_an(DisplayMultiplexer_io_an),
    .io_full(DisplayMultiplexer_io_full)
  );
  Datapath Datapath ( // @[src/main/scala/FSM.scala 42:24]
    .clock(Datapath_clock),
    .reset(Datapath_reset),
    .io_price(Datapath_io_price),
    .io_FSMstate(Datapath_io_FSMstate),
    .io_Full2(Datapath_io_Full2),
    .io_Full5(Datapath_io_Full5),
    .io_enough(Datapath_io_enough),
    .io_money(Datapath_io_money)
  );
  SerialCommunicator SerialComs ( // @[src/main/scala/FSM.scala 43:26]
    .clock(SerialComs_clock),
    .reset(SerialComs_reset),
    .io_price(SerialComs_io_price),
    .io_sum(SerialComs_io_sum),
    .io_update(SerialComs_io_update),
    .io_tx(SerialComs_io_tx)
  );
  assign io_releaseCan = extender_io_releaseCan; // @[src/main/scala/FSM.scala 99:17]
  assign io_alarm = extender_io_alarm; // @[src/main/scala/FSM.scala 98:12]
  assign io_seg = DisplayMultiplexer_io_seg; // @[src/main/scala/FSM.scala 100:10]
  assign io_an = DisplayMultiplexer_io_an; // @[src/main/scala/FSM.scala 101:9]
  assign io_tx = SerialComs_io_tx; // @[src/main/scala/FSM.scala 90:9]
  assign ButtonDeb1_clock = clock;
  assign ButtonDeb1_reset = reset;
  assign ButtonDeb1_io_inp = io_coin2; // @[src/main/scala/FSM.scala 26:21]
  assign ButtonDeb2_clock = clock;
  assign ButtonDeb2_reset = reset;
  assign ButtonDeb2_io_inp = io_coin5; // @[src/main/scala/FSM.scala 30:21]
  assign ButtonDeb3_clock = clock;
  assign ButtonDeb3_reset = reset;
  assign ButtonDeb3_io_inp = io_buy; // @[src/main/scala/FSM.scala 34:21]
  assign extender_clock = clock;
  assign extender_reset = reset;
  assign extender_io_ringAlarm = stateReg == 3'h3; // @[src/main/scala/FSM.scala 80:38]
  assign extender_io_releasing = stateReg == 3'h4; // @[src/main/scala/FSM.scala 81:38]
  assign DisplayMultiplexer_clock = clock;
  assign DisplayMultiplexer_reset = reset;
  assign DisplayMultiplexer_io_sum = {{1'd0}, Datapath_io_money}; // @[src/main/scala/FSM.scala 86:29]
  assign DisplayMultiplexer_io_price = io_price; // @[src/main/scala/FSM.scala 87:31]
  assign DisplayMultiplexer_io_full = stateReg == 3'h5; // @[src/main/scala/FSM.scala 85:43]
  assign Datapath_clock = clock;
  assign Datapath_reset = reset;
  assign Datapath_io_price = io_price; // @[src/main/scala/FSM.scala 96:21]
  assign Datapath_io_FSMstate = stateReg; // @[src/main/scala/FSM.scala 82:36]
  assign SerialComs_clock = clock;
  assign SerialComs_reset = reset;
  assign SerialComs_io_price = io_price; // @[src/main/scala/FSM.scala 91:23]
  assign SerialComs_io_sum = {{1'd0}, Datapath_io_money}; // @[src/main/scala/FSM.scala 92:21]
  assign SerialComs_io_update = coin2Trigger | coin5Trigger | buyTrigger | priceTrigger; // @[src/main/scala/FSM.scala 93:68]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FSM.scala 37:25]
      stateReg <= 3'h0; // @[src/main/scala/FSM.scala 37:25]
    end else if (3'h0 == stateReg) begin // @[src/main/scala/FSM.scala 61:20]
      if (coin2Trigger & ~Datapath_io_Full2) begin // @[src/main/scala/FSM.scala 63:36]
        stateReg <= 3'h1; // @[src/main/scala/FSM.scala 64:18]
      end else if (coin5Trigger & ~Datapath_io_Full5) begin // @[src/main/scala/FSM.scala 65:42]
        stateReg <= 3'h2; // @[src/main/scala/FSM.scala 66:18]
      end else begin
        stateReg <= _GEN_3;
      end
    end else begin
      stateReg <= 3'h0; // @[src/main/scala/FSM.scala 38:12]
    end
    prevCoin2 <= ButtonDeb1_io_out; // @[src/main/scala/FSM.scala 46:26]
    prevCoin5 <= ButtonDeb2_io_out; // @[src/main/scala/FSM.scala 47:26]
    prevBuy <= ButtonDeb3_io_out; // @[src/main/scala/FSM.scala 48:24]
    prevPrice <= io_price; // @[src/main/scala/FSM.scala 49:26]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[2:0];
  _RAND_1 = {1{`RANDOM}};
  prevCoin2 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  prevCoin5 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  prevBuy = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  prevPrice = _RAND_4[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
