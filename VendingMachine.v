module SevenSegDec(
  input  [3:0] io_in, // @[\\src\\main\\scala\\SevenSegDec1.scala 6:14]
  output [6:0] io_out // @[\\src\\main\\scala\\SevenSegDec1.scala 6:14]
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 30:22 11:27]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 29:22]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h5e : _GEN_1; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 28:22]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h39 : _GEN_2; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 27:22]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h7c : _GEN_3; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 26:22]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h77 : _GEN_4; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 25:22]
  wire [6:0] _GEN_6 = 4'h9 == io_in ? 7'h6f : _GEN_5; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 24:21]
  wire [6:0] _GEN_7 = 4'h8 == io_in ? 7'h7f : _GEN_6; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 23:21]
  wire [6:0] _GEN_8 = 4'h7 == io_in ? 7'h7 : _GEN_7; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 22:21]
  wire [6:0] _GEN_9 = 4'h6 == io_in ? 7'h7d : _GEN_8; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 21:21]
  wire [6:0] _GEN_10 = 4'h5 == io_in ? 7'h6d : _GEN_9; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 20:21]
  wire [6:0] _GEN_11 = 4'h4 == io_in ? 7'h66 : _GEN_10; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 19:21]
  wire [6:0] _GEN_12 = 4'h3 == io_in ? 7'h4f : _GEN_11; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 18:21]
  wire [6:0] _GEN_13 = 4'h2 == io_in ? 7'h5b : _GEN_12; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 17:21]
  wire [6:0] _GEN_14 = 4'h1 == io_in ? 7'h6 : _GEN_13; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 16:21]
  assign io_out = 4'h0 == io_in ? 7'h3f : _GEN_14; // @[\\src\\main\\scala\\SevenSegDec1.scala 13:17 15:21]
endmodule
module DisplayMultiplexer(
  input        clock,
  input        reset,
  input  [7:0] io_sum, // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 6:14]
  input  [4:0] io_price, // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 6:14]
  output [6:0] io_seg, // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 6:14]
  output [3:0] io_an // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] decoder_io_in; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 12:23]
  wire [6:0] decoder_io_out; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 12:23]
  reg [1:0] count_to_4; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 13:27]
  reg [31:0] tick_tickCnt; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 17:26]
  wire  tick = tick_tickCnt == 32'h1869f; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 20:18]
  wire [31:0] _tick_tickCnt_T_1 = tick_tickCnt + 32'h1; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 24:26]
  wire [1:0] _count_to_4_T_1 = count_to_4 + 2'h1; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 33:30]
  wire [7:0] _number2_T = io_sum / 4'ha; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 43:21]
  wire [7:0] _GEN_1 = io_sum % 8'ha; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 44:21]
  wire [3:0] number1 = _GEN_1[3:0]; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 44:21]
  wire [4:0] _number4_T = io_price / 4'ha; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 45:23]
  wire [4:0] _GEN_6 = io_price % 5'ha; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 46:23]
  wire [3:0] number3 = _GEN_6[3:0]; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 46:23]
  wire [3:0] number2 = _number2_T[3:0]; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 38:28 43:11]
  wire [3:0] _GEN_3 = 2'h3 == count_to_4 ? number2 : 4'h0; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 48:17 50:22 55:32]
  wire [3:0] _GEN_4 = 2'h2 == count_to_4 ? number1 : _GEN_3; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22 54:32]
  wire [3:0] number4 = _number4_T[3:0]; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 40:28 45:11]
  wire [3:0] _GEN_5 = 2'h1 == count_to_4 ? number4 : _GEN_4; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22 53:32]
  wire [3:0] _io_an_T = 4'h1 << count_to_4; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 59:18]
  SevenSegDec decoder ( // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 12:23]
    .io_in(decoder_io_in),
    .io_out(decoder_io_out)
  );
  assign io_seg = ~decoder_io_out; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 60:13]
  assign io_an = ~_io_an_T; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 59:12]
  assign decoder_io_in = 2'h0 == count_to_4 ? number3 : _GEN_5; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 50:22 52:32]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 13:27]
      count_to_4 <= 2'h0; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 13:27]
    end else if (tick) begin // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 32:14]
      count_to_4 <= _count_to_4_T_1; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 33:16]
    end
    if (reset) begin // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 17:26]
      tick_tickCnt <= 32'h0; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 17:26]
    end else if (tick) begin // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 20:35]
      tick_tickCnt <= 32'h0; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 21:15]
    end else begin
      tick_tickCnt <= _tick_tickCnt_T_1; // @[\\src\\main\\scala\\DisplayMultiplexer1.scala 24:15]
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
  count_to_4 = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  tick_tickCnt = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module VendingMachine(
  input        clock,
  input        reset,
  input  [4:0] io_price, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin2, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_coin5, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  input        io_buy, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_releaseCan, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output       io_alarm, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output [6:0] io_seg, // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
  output [3:0] io_an // @[\\src\\main\\scala\\VendingMachine.scala 5:14]
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
`endif // RANDOMIZE_REG_INIT
  wire  DisplayMultiplexer_clock; // @[\\src\\main\\scala\\VendingMachine.scala 16:34]
  wire  DisplayMultiplexer_reset; // @[\\src\\main\\scala\\VendingMachine.scala 16:34]
  wire [7:0] DisplayMultiplexer_io_sum; // @[\\src\\main\\scala\\VendingMachine.scala 16:34]
  wire [4:0] DisplayMultiplexer_io_price; // @[\\src\\main\\scala\\VendingMachine.scala 16:34]
  wire [6:0] DisplayMultiplexer_io_seg; // @[\\src\\main\\scala\\VendingMachine.scala 16:34]
  wire [3:0] DisplayMultiplexer_io_an; // @[\\src\\main\\scala\\VendingMachine.scala 16:34]
  reg [7:0] Value; // @[\\src\\main\\scala\\VendingMachine.scala 19:22]
  wire  Full2 = Value > 8'h61; // @[\\src\\main\\scala\\VendingMachine.scala 20:21]
  wire  Full5 = Value > 8'h5e; // @[\\src\\main\\scala\\VendingMachine.scala 21:21]
  wire [7:0] _GEN_12 = {{3'd0}, io_price}; // @[\\src\\main\\scala\\VendingMachine.scala 22:22]
  wire  enough = Value >= _GEN_12; // @[\\src\\main\\scala\\VendingMachine.scala 22:22]
  reg [9:0] count_to_4; // @[\\src\\main\\scala\\VendingMachine.scala 23:27]
  reg  coin2_previous; // @[\\src\\main\\scala\\VendingMachine.scala 26:31]
  reg  coin5_previous; // @[\\src\\main\\scala\\VendingMachine.scala 27:31]
  reg  buy_previous; // @[\\src\\main\\scala\\VendingMachine.scala 28:31]
  wire  coin2_change = io_coin2 & ~coin2_previous; // @[\\src\\main\\scala\\VendingMachine.scala 30:31]
  wire  coin5_change = io_coin5 & ~coin5_previous; // @[\\src\\main\\scala\\VendingMachine.scala 31:31]
  wire  buy_change = io_buy & ~buy_previous; // @[\\src\\main\\scala\\VendingMachine.scala 32:29]
  wire [7:0] _Value_T_1 = Value + 8'h2; // @[\\src\\main\\scala\\VendingMachine.scala 35:20]
  wire [7:0] _Value_T_3 = Value + 8'h5; // @[\\src\\main\\scala\\VendingMachine.scala 37:20]
  wire  _T_4 = buy_change & enough; // @[\\src\\main\\scala\\VendingMachine.scala 38:25]
  wire [7:0] _Value_T_5 = Value - _GEN_12; // @[\\src\\main\\scala\\VendingMachine.scala 39:20]
  reg  ringalarm; // @[\\src\\main\\scala\\VendingMachine.scala 42:26]
  wire  _GEN_3 = buy_change & ~enough | ringalarm; // @[\\src\\main\\scala\\VendingMachine.scala 43:32 44:14 42:26]
  reg  dispense; // @[\\src\\main\\scala\\VendingMachine.scala 47:25]
  wire  _GEN_6 = count_to_4 == 10'h0 ? 1'h0 : dispense; // @[\\src\\main\\scala\\VendingMachine.scala 48:28 50:14 47:25]
  wire  _GEN_7 = _T_4 | _GEN_6; // @[\\src\\main\\scala\\VendingMachine.scala 54:31 55:13]
  reg [31:0] tick_tickCnt; // @[\\src\\main\\scala\\VendingMachine.scala 60:26]
  wire  tick = tick_tickCnt == 32'h1869f; // @[\\src\\main\\scala\\VendingMachine.scala 63:18]
  wire [31:0] _tick_tickCnt_T_1 = tick_tickCnt + 32'h1; // @[\\src\\main\\scala\\VendingMachine.scala 67:26]
  wire [9:0] _count_to_4_T_1 = count_to_4 + 10'h1; // @[\\src\\main\\scala\\VendingMachine.scala 76:30]
  DisplayMultiplexer DisplayMultiplexer ( // @[\\src\\main\\scala\\VendingMachine.scala 16:34]
    .clock(DisplayMultiplexer_clock),
    .reset(DisplayMultiplexer_reset),
    .io_sum(DisplayMultiplexer_io_sum),
    .io_price(DisplayMultiplexer_io_price),
    .io_seg(DisplayMultiplexer_io_seg),
    .io_an(DisplayMultiplexer_io_an)
  );
  assign io_releaseCan = dispense; // @[\\src\\main\\scala\\VendingMachine.scala 82:17]
  assign io_alarm = ringalarm; // @[\\src\\main\\scala\\VendingMachine.scala 81:12]
  assign io_seg = DisplayMultiplexer_io_seg; // @[\\src\\main\\scala\\VendingMachine.scala 85:10]
  assign io_an = DisplayMultiplexer_io_an; // @[\\src\\main\\scala\\VendingMachine.scala 86:9]
  assign DisplayMultiplexer_clock = clock;
  assign DisplayMultiplexer_reset = reset;
  assign DisplayMultiplexer_io_sum = Value; // @[\\src\\main\\scala\\VendingMachine.scala 83:28]
  assign DisplayMultiplexer_io_price = io_price; // @[\\src\\main\\scala\\VendingMachine.scala 84:31]
  always @(posedge clock) begin
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 19:22]
      Value <= 8'h0; // @[\\src\\main\\scala\\VendingMachine.scala 19:22]
    end else if (coin2_change & ~Full2) begin // @[\\src\\main\\scala\\VendingMachine.scala 34:32]
      Value <= _Value_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 35:11]
    end else if (coin5_change & ~Full5) begin // @[\\src\\main\\scala\\VendingMachine.scala 36:38]
      Value <= _Value_T_3; // @[\\src\\main\\scala\\VendingMachine.scala 37:11]
    end else if (buy_change & enough) begin // @[\\src\\main\\scala\\VendingMachine.scala 38:36]
      Value <= _Value_T_5; // @[\\src\\main\\scala\\VendingMachine.scala 39:11]
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 23:27]
      count_to_4 <= 10'h0; // @[\\src\\main\\scala\\VendingMachine.scala 23:27]
    end else if (tick) begin // @[\\src\\main\\scala\\VendingMachine.scala 75:14]
      count_to_4 <= _count_to_4_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 76:16]
    end else if (_T_4) begin // @[\\src\\main\\scala\\VendingMachine.scala 54:31]
      count_to_4 <= 10'h1; // @[\\src\\main\\scala\\VendingMachine.scala 56:14]
    end else if (buy_change & ~enough) begin // @[\\src\\main\\scala\\VendingMachine.scala 43:32]
      count_to_4 <= 10'h1; // @[\\src\\main\\scala\\VendingMachine.scala 45:16]
    end
    coin2_previous <= io_coin2; // @[\\src\\main\\scala\\VendingMachine.scala 26:31]
    coin5_previous <= io_coin5; // @[\\src\\main\\scala\\VendingMachine.scala 27:31]
    buy_previous <= io_buy; // @[\\src\\main\\scala\\VendingMachine.scala 28:31]
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 42:26]
      ringalarm <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 42:26]
    end else if (count_to_4 == 10'h0) begin // @[\\src\\main\\scala\\VendingMachine.scala 48:28]
      ringalarm <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 49:15]
    end else begin
      ringalarm <= _GEN_3;
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 47:25]
      dispense <= 1'h0; // @[\\src\\main\\scala\\VendingMachine.scala 47:25]
    end else begin
      dispense <= _GEN_7;
    end
    if (reset) begin // @[\\src\\main\\scala\\VendingMachine.scala 60:26]
      tick_tickCnt <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 60:26]
    end else if (tick) begin // @[\\src\\main\\scala\\VendingMachine.scala 63:35]
      tick_tickCnt <= 32'h0; // @[\\src\\main\\scala\\VendingMachine.scala 64:15]
    end else begin
      tick_tickCnt <= _tick_tickCnt_T_1; // @[\\src\\main\\scala\\VendingMachine.scala 67:15]
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
  Value = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  count_to_4 = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  coin2_previous = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  coin5_previous = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  buy_previous = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  ringalarm = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  dispense = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  tick_tickCnt = _RAND_7[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
