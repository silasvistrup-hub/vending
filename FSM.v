module extender(
  input   clock,
  input   reset,
  input   io_Ringalarm, // @[src/main/scala/extender.scala 6:14]
  input   io_releasing, // @[src/main/scala/extender.scala 6:14]
  output  io_alarm, // @[src/main/scala/extender.scala 6:14]
  output  io_releaseCan // @[src/main/scala/extender.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] tick_tickCnt; // @[src/main/scala/extender.scala 14:26]
  wire  tick = tick_tickCnt == 32'h1869f; // @[src/main/scala/extender.scala 17:18]
  wire [31:0] _tick_tickCnt_T_1 = tick_tickCnt + 32'h1; // @[src/main/scala/extender.scala 21:26]
  reg [9:0] countSec; // @[src/main/scala/extender.scala 28:25]
  wire [9:0] _countSec_T_1 = countSec + 10'h1; // @[src/main/scala/extender.scala 33:26]
  reg  alarm; // @[src/main/scala/extender.scala 36:22]
  reg  releaseCan; // @[src/main/scala/extender.scala 37:27]
  wire  _GEN_3 = io_Ringalarm | alarm; // @[src/main/scala/extender.scala 39:22 40:11 36:22]
  wire  _GEN_5 = io_releasing | releaseCan; // @[src/main/scala/extender.scala 43:22 44:16 37:27]
  assign io_alarm = alarm; // @[src/main/scala/extender.scala 52:12]
  assign io_releaseCan = releaseCan; // @[src/main/scala/extender.scala 53:17]
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
    end else if (io_releasing) begin // @[src/main/scala/extender.scala 43:22]
      countSec <= 10'h1; // @[src/main/scala/extender.scala 45:14]
    end else if (io_Ringalarm) begin // @[src/main/scala/extender.scala 39:22]
      countSec <= 10'h1; // @[src/main/scala/extender.scala 41:14]
    end else if (tick) begin // @[src/main/scala/extender.scala 32:14]
      countSec <= _countSec_T_1; // @[src/main/scala/extender.scala 33:14]
    end
    if (reset) begin // @[src/main/scala/extender.scala 36:22]
      alarm <= 1'h0; // @[src/main/scala/extender.scala 36:22]
    end else if (countSec == 10'h0) begin // @[src/main/scala/extender.scala 48:26]
      alarm <= 1'h0; // @[src/main/scala/extender.scala 49:11]
    end else begin
      alarm <= _GEN_3;
    end
    if (reset) begin // @[src/main/scala/extender.scala 37:27]
      releaseCan <= 1'h0; // @[src/main/scala/extender.scala 37:27]
    end else if (countSec == 10'h0) begin // @[src/main/scala/extender.scala 48:26]
      releaseCan <= 1'h0; // @[src/main/scala/extender.scala 50:16]
    end else begin
      releaseCan <= _GEN_5;
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
  tick_tickCnt = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  countSec = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  alarm = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  releaseCan = _RAND_3[0:0];
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
  wire  tick = tick_tickCnt == 32'h1869f; // @[src/main/scala/DisplayMultiplexer1.scala 22:18]
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
`endif // RANDOMIZE_REG_INIT
  wire  extender_clock; // @[src/main/scala/FSM.scala 25:24]
  wire  extender_reset; // @[src/main/scala/FSM.scala 25:24]
  wire  extender_io_Ringalarm; // @[src/main/scala/FSM.scala 25:24]
  wire  extender_io_releasing; // @[src/main/scala/FSM.scala 25:24]
  wire  extender_io_alarm; // @[src/main/scala/FSM.scala 25:24]
  wire  extender_io_releaseCan; // @[src/main/scala/FSM.scala 25:24]
  wire  DisplayMultiplexer_clock; // @[src/main/scala/FSM.scala 26:34]
  wire  DisplayMultiplexer_reset; // @[src/main/scala/FSM.scala 26:34]
  wire [7:0] DisplayMultiplexer_io_sum; // @[src/main/scala/FSM.scala 26:34]
  wire [4:0] DisplayMultiplexer_io_price; // @[src/main/scala/FSM.scala 26:34]
  wire [6:0] DisplayMultiplexer_io_seg; // @[src/main/scala/FSM.scala 26:34]
  wire [3:0] DisplayMultiplexer_io_an; // @[src/main/scala/FSM.scala 26:34]
  wire  DisplayMultiplexer_io_full; // @[src/main/scala/FSM.scala 26:34]
  wire  Datapath_clock; // @[src/main/scala/FSM.scala 27:24]
  wire  Datapath_reset; // @[src/main/scala/FSM.scala 27:24]
  wire [4:0] Datapath_io_price; // @[src/main/scala/FSM.scala 27:24]
  wire [2:0] Datapath_io_FSMstate; // @[src/main/scala/FSM.scala 27:24]
  wire  Datapath_io_Full2; // @[src/main/scala/FSM.scala 27:24]
  wire  Datapath_io_Full5; // @[src/main/scala/FSM.scala 27:24]
  wire  Datapath_io_enough; // @[src/main/scala/FSM.scala 27:24]
  wire [6:0] Datapath_io_money; // @[src/main/scala/FSM.scala 27:24]
  reg [2:0] stateReg; // @[src/main/scala/FSM.scala 22:25]
  reg  prevCoin2; // @[src/main/scala/FSM.scala 31:26]
  reg  prevCoin5; // @[src/main/scala/FSM.scala 32:26]
  reg  prevBuy; // @[src/main/scala/FSM.scala 33:24]
  wire  coin2Trigger = io_coin2 & ~prevCoin2; // @[src/main/scala/FSM.scala 37:31]
  wire  coin5Trigger = io_coin5 & ~prevCoin5; // @[src/main/scala/FSM.scala 38:31]
  wire  buyTrigger = io_buy & ~prevBuy; // @[src/main/scala/FSM.scala 39:27]
  wire [2:0] _GEN_0 = coin5Trigger & Datapath_io_Full5 ? 3'h5 : 3'h0; // @[src/main/scala/FSM.scala 23:12 58:41 59:18]
  wire [2:0] _GEN_1 = coin2Trigger & Datapath_io_Full2 ? 3'h5 : _GEN_0; // @[src/main/scala/FSM.scala 56:41 57:18]
  wire [2:0] _GEN_2 = buyTrigger & Datapath_io_enough ? 3'h4 : _GEN_1; // @[src/main/scala/FSM.scala 54:40 55:18]
  wire [2:0] _GEN_3 = buyTrigger & ~Datapath_io_enough ? 3'h3 : _GEN_2; // @[src/main/scala/FSM.scala 52:41 53:18]
  extender extender ( // @[src/main/scala/FSM.scala 25:24]
    .clock(extender_clock),
    .reset(extender_reset),
    .io_Ringalarm(extender_io_Ringalarm),
    .io_releasing(extender_io_releasing),
    .io_alarm(extender_io_alarm),
    .io_releaseCan(extender_io_releaseCan)
  );
  DisplayMultiplexer DisplayMultiplexer ( // @[src/main/scala/FSM.scala 26:34]
    .clock(DisplayMultiplexer_clock),
    .reset(DisplayMultiplexer_reset),
    .io_sum(DisplayMultiplexer_io_sum),
    .io_price(DisplayMultiplexer_io_price),
    .io_seg(DisplayMultiplexer_io_seg),
    .io_an(DisplayMultiplexer_io_an),
    .io_full(DisplayMultiplexer_io_full)
  );
  Datapath Datapath ( // @[src/main/scala/FSM.scala 27:24]
    .clock(Datapath_clock),
    .reset(Datapath_reset),
    .io_price(Datapath_io_price),
    .io_FSMstate(Datapath_io_FSMstate),
    .io_Full2(Datapath_io_Full2),
    .io_Full5(Datapath_io_Full5),
    .io_enough(Datapath_io_enough),
    .io_money(Datapath_io_money)
  );
  assign io_releaseCan = extender_io_releaseCan; // @[src/main/scala/FSM.scala 83:17]
  assign io_alarm = extender_io_alarm; // @[src/main/scala/FSM.scala 82:12]
  assign io_seg = DisplayMultiplexer_io_seg; // @[src/main/scala/FSM.scala 84:10]
  assign io_an = DisplayMultiplexer_io_an; // @[src/main/scala/FSM.scala 85:9]
  assign io_tx = 1'h0; // @[src/main/scala/FSM.scala 86:9]
  assign extender_clock = clock;
  assign extender_reset = reset;
  assign extender_io_Ringalarm = stateReg == 3'h3; // @[src/main/scala/FSM.scala 64:38]
  assign extender_io_releasing = stateReg == 3'h4; // @[src/main/scala/FSM.scala 65:38]
  assign DisplayMultiplexer_clock = clock;
  assign DisplayMultiplexer_reset = reset;
  assign DisplayMultiplexer_io_sum = {{1'd0}, Datapath_io_money}; // @[src/main/scala/FSM.scala 70:29]
  assign DisplayMultiplexer_io_price = io_price; // @[src/main/scala/FSM.scala 71:31]
  assign DisplayMultiplexer_io_full = stateReg == 3'h5; // @[src/main/scala/FSM.scala 69:43]
  assign Datapath_clock = clock;
  assign Datapath_reset = reset;
  assign Datapath_io_price = io_price; // @[src/main/scala/FSM.scala 80:21]
  assign Datapath_io_FSMstate = stateReg; // @[src/main/scala/FSM.scala 66:36]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/FSM.scala 22:25]
      stateReg <= 3'h0; // @[src/main/scala/FSM.scala 22:25]
    end else if (3'h0 == stateReg) begin // @[src/main/scala/FSM.scala 46:20]
      if (coin2Trigger & ~Datapath_io_Full2) begin // @[src/main/scala/FSM.scala 48:36]
        stateReg <= 3'h1; // @[src/main/scala/FSM.scala 49:18]
      end else if (coin5Trigger & ~Datapath_io_Full5) begin // @[src/main/scala/FSM.scala 50:42]
        stateReg <= 3'h2; // @[src/main/scala/FSM.scala 51:18]
      end else begin
        stateReg <= _GEN_3;
      end
    end else begin
      stateReg <= 3'h0; // @[src/main/scala/FSM.scala 23:12]
    end
    prevCoin2 <= io_coin2; // @[src/main/scala/FSM.scala 31:26]
    prevCoin5 <= io_coin5; // @[src/main/scala/FSM.scala 32:26]
    prevBuy <= io_buy; // @[src/main/scala/FSM.scala 33:24]
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
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
