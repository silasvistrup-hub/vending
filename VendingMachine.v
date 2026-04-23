module SevenSegDec(
  input  [3:0] io_in, // @[src/main/scala/SevenSegDec1.scala 6:14]
  output [6:0] io_out // @[src/main/scala/SevenSegDec1.scala 6:14]
);
  wire [6:0] _GEN_0 = 4'hf == io_in ? 7'h71 : 7'h0; // @[src/main/scala/SevenSegDec1.scala 13:17 30:22 11:27]
  wire [6:0] _GEN_1 = 4'he == io_in ? 7'h79 : _GEN_0; // @[src/main/scala/SevenSegDec1.scala 13:17 29:22]
  wire [6:0] _GEN_2 = 4'hd == io_in ? 7'h5e : _GEN_1; // @[src/main/scala/SevenSegDec1.scala 13:17 28:22]
  wire [6:0] _GEN_3 = 4'hc == io_in ? 7'h39 : _GEN_2; // @[src/main/scala/SevenSegDec1.scala 13:17 27:22]
  wire [6:0] _GEN_4 = 4'hb == io_in ? 7'h7c : _GEN_3; // @[src/main/scala/SevenSegDec1.scala 13:17 26:22]
  wire [6:0] _GEN_5 = 4'ha == io_in ? 7'h77 : _GEN_4; // @[src/main/scala/SevenSegDec1.scala 13:17 25:22]
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
  input  [7:0] io_sum, // @[src/main/scala/DisplayMultiplexer1.scala 6:14]
  input  [4:0] io_price, // @[src/main/scala/DisplayMultiplexer1.scala 6:14]
  output [6:0] io_seg, // @[src/main/scala/DisplayMultiplexer1.scala 6:14]
  output [3:0] io_an // @[src/main/scala/DisplayMultiplexer1.scala 6:14]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire [3:0] decoder_io_in; // @[src/main/scala/DisplayMultiplexer1.scala 12:23]
  wire [6:0] decoder_io_out; // @[src/main/scala/DisplayMultiplexer1.scala 12:23]
  reg [1:0] count_to_4; // @[src/main/scala/DisplayMultiplexer1.scala 13:27]
  reg [31:0] tick_tickCnt; // @[src/main/scala/DisplayMultiplexer1.scala 17:26]
  wire  tick = tick_tickCnt == 32'h1869f; // @[src/main/scala/DisplayMultiplexer1.scala 20:18]
  wire [31:0] _tick_tickCnt_T_1 = tick_tickCnt + 32'h1; // @[src/main/scala/DisplayMultiplexer1.scala 24:26]
  wire [1:0] _count_to_4_T_1 = count_to_4 + 2'h1; // @[src/main/scala/DisplayMultiplexer1.scala 33:30]
  wire [7:0] _number2_T = io_sum / 4'ha; // @[src/main/scala/DisplayMultiplexer1.scala 43:21]
  wire [7:0] _GEN_1 = io_sum % 8'ha; // @[src/main/scala/DisplayMultiplexer1.scala 44:21]
  wire [3:0] number1 = _GEN_1[3:0]; // @[src/main/scala/DisplayMultiplexer1.scala 44:21]
  wire [4:0] _number4_T = io_price / 4'ha; // @[src/main/scala/DisplayMultiplexer1.scala 45:23]
  wire [4:0] _GEN_6 = io_price % 5'ha; // @[src/main/scala/DisplayMultiplexer1.scala 46:23]
  wire [3:0] number3 = _GEN_6[3:0]; // @[src/main/scala/DisplayMultiplexer1.scala 46:23]
  wire [3:0] number2 = _number2_T[3:0]; // @[src/main/scala/DisplayMultiplexer1.scala 38:28 43:11]
  wire [3:0] _GEN_3 = 2'h3 == count_to_4 ? number2 : 4'h0; // @[src/main/scala/DisplayMultiplexer1.scala 48:17 50:22 55:32]
  wire [3:0] _GEN_4 = 2'h2 == count_to_4 ? number1 : _GEN_3; // @[src/main/scala/DisplayMultiplexer1.scala 50:22 54:32]
  wire [3:0] number4 = _number4_T[3:0]; // @[src/main/scala/DisplayMultiplexer1.scala 40:28 45:11]
  wire [3:0] _GEN_5 = 2'h1 == count_to_4 ? number4 : _GEN_4; // @[src/main/scala/DisplayMultiplexer1.scala 50:22 53:32]
  wire [3:0] _io_an_T = 4'h1 << count_to_4; // @[src/main/scala/DisplayMultiplexer1.scala 59:18]
  SevenSegDec decoder ( // @[src/main/scala/DisplayMultiplexer1.scala 12:23]
    .io_in(decoder_io_in),
    .io_out(decoder_io_out)
  );
  assign io_seg = ~decoder_io_out; // @[src/main/scala/DisplayMultiplexer1.scala 60:13]
  assign io_an = ~_io_an_T; // @[src/main/scala/DisplayMultiplexer1.scala 59:12]
  assign decoder_io_in = 2'h0 == count_to_4 ? number3 : _GEN_5; // @[src/main/scala/DisplayMultiplexer1.scala 50:22 52:32]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 13:27]
      count_to_4 <= 2'h0; // @[src/main/scala/DisplayMultiplexer1.scala 13:27]
    end else if (tick) begin // @[src/main/scala/DisplayMultiplexer1.scala 32:14]
      count_to_4 <= _count_to_4_T_1; // @[src/main/scala/DisplayMultiplexer1.scala 33:16]
    end
    if (reset) begin // @[src/main/scala/DisplayMultiplexer1.scala 17:26]
      tick_tickCnt <= 32'h0; // @[src/main/scala/DisplayMultiplexer1.scala 17:26]
    end else if (tick) begin // @[src/main/scala/DisplayMultiplexer1.scala 20:35]
      tick_tickCnt <= 32'h0; // @[src/main/scala/DisplayMultiplexer1.scala 21:15]
    end else begin
      tick_tickCnt <= _tick_tickCnt_T_1; // @[src/main/scala/DisplayMultiplexer1.scala 24:15]
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
  input  [4:0] io_price, // @[src/main/scala/SerialCommunicator.scala 6:16]
  input  [7:0] io_sum, // @[src/main/scala/SerialCommunicator.scala 6:16]
  input        io_update, // @[src/main/scala/SerialCommunicator.scala 6:16]
  output       io_tx // @[src/main/scala/SerialCommunicator.scala 6:16]
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  uart_clock; // @[src/main/scala/SerialCommunicator.scala 21:22]
  wire  uart_reset; // @[src/main/scala/SerialCommunicator.scala 21:22]
  wire  uart_io_txd; // @[src/main/scala/SerialCommunicator.scala 21:22]
  wire  uart_io_channel_ready; // @[src/main/scala/SerialCommunicator.scala 21:22]
  wire  uart_io_channel_valid; // @[src/main/scala/SerialCommunicator.scala 21:22]
  wire [7:0] uart_io_channel_bits; // @[src/main/scala/SerialCommunicator.scala 21:22]
  wire [4:0] _formattedPrice_hundreds_T = io_price / 7'h64; // @[src/main/scala/SerialCommunicator.scala 15:31]
  wire [4:0] _GEN_4 = _formattedPrice_hundreds_T % 5'ha; // @[src/main/scala/SerialCommunicator.scala 15:40]
  wire [3:0] formattedPrice_hundreds = _GEN_4[3:0]; // @[src/main/scala/SerialCommunicator.scala 15:40]
  wire [4:0] _formattedPrice_tens_T = io_price / 4'ha; // @[src/main/scala/SerialCommunicator.scala 16:31]
  wire [4:0] _GEN_12 = _formattedPrice_tens_T % 5'ha; // @[src/main/scala/SerialCommunicator.scala 16:39]
  wire [3:0] formattedPrice_tens = _GEN_12[3:0]; // @[src/main/scala/SerialCommunicator.scala 16:39]
  wire [4:0] _GEN_16 = io_price % 5'ha; // @[src/main/scala/SerialCommunicator.scala 17:30]
  wire [3:0] formattedPrice_ones = _GEN_16[3:0]; // @[src/main/scala/SerialCommunicator.scala 17:30]
  wire [5:0] _GEN_77 = {{2'd0}, formattedPrice_hundreds}; // @[src/main/scala/SerialCommunicator.scala 18:22]
  wire [5:0] _formattedPrice_T_1 = _GEN_77 + 6'h30; // @[src/main/scala/SerialCommunicator.scala 18:22]
  wire [5:0] _GEN_78 = {{2'd0}, formattedPrice_tens}; // @[src/main/scala/SerialCommunicator.scala 18:35]
  wire [5:0] _formattedPrice_T_3 = _GEN_78 + 6'h30; // @[src/main/scala/SerialCommunicator.scala 18:35]
  wire [5:0] _GEN_79 = {{2'd0}, formattedPrice_ones}; // @[src/main/scala/SerialCommunicator.scala 18:48]
  wire [5:0] _formattedPrice_T_5 = _GEN_79 + 6'h30; // @[src/main/scala/SerialCommunicator.scala 18:48]
  wire [7:0] _formattedSum_hundreds_T = io_sum / 7'h64; // @[src/main/scala/SerialCommunicator.scala 15:31]
  wire [7:0] _GEN_31 = _formattedSum_hundreds_T % 8'ha; // @[src/main/scala/SerialCommunicator.scala 15:40]
  wire [3:0] formattedSum_hundreds = _GEN_31[3:0]; // @[src/main/scala/SerialCommunicator.scala 15:40]
  wire [7:0] _formattedSum_tens_T = io_sum / 4'ha; // @[src/main/scala/SerialCommunicator.scala 16:31]
  wire [7:0] _GEN_32 = _formattedSum_tens_T % 8'ha; // @[src/main/scala/SerialCommunicator.scala 16:39]
  wire [3:0] formattedSum_tens = _GEN_32[3:0]; // @[src/main/scala/SerialCommunicator.scala 16:39]
  wire [7:0] _GEN_36 = io_sum % 8'ha; // @[src/main/scala/SerialCommunicator.scala 17:30]
  wire [3:0] formattedSum_ones = _GEN_36[3:0]; // @[src/main/scala/SerialCommunicator.scala 17:30]
  wire [5:0] _GEN_80 = {{2'd0}, formattedSum_hundreds}; // @[src/main/scala/SerialCommunicator.scala 18:22]
  wire [5:0] _formattedSum_T_1 = _GEN_80 + 6'h30; // @[src/main/scala/SerialCommunicator.scala 18:22]
  wire [5:0] _GEN_81 = {{2'd0}, formattedSum_tens}; // @[src/main/scala/SerialCommunicator.scala 18:35]
  wire [5:0] _formattedSum_T_3 = _GEN_81 + 6'h30; // @[src/main/scala/SerialCommunicator.scala 18:35]
  wire [5:0] _GEN_82 = {{2'd0}, formattedSum_ones}; // @[src/main/scala/SerialCommunicator.scala 18:48]
  wire [5:0] _formattedSum_T_5 = _GEN_82 + 6'h30; // @[src/main/scala/SerialCommunicator.scala 18:48]
  reg [1:0] write; // @[src/main/scala/SerialCommunicator.scala 38:24]
  reg  refresh; // @[src/main/scala/SerialCommunicator.scala 39:26]
  reg [7:0] index; // @[src/main/scala/SerialCommunicator.scala 40:24]
  wire  _GEN_0 = io_update & write != 2'h0 | refresh; // @[src/main/scala/SerialCommunicator.scala 44:46 45:17 39:26]
  wire [7:0] _GEN_1 = io_update & write == 2'h0 ? 8'h0 : index; // @[src/main/scala/SerialCommunicator.scala 41:39 42:15 40:24]
  wire [1:0] _GEN_2 = io_update & write == 2'h0 ? 2'h1 : write; // @[src/main/scala/SerialCommunicator.scala 41:39 43:15 38:24]
  wire  _GEN_3 = io_update & write == 2'h0 ? refresh : _GEN_0; // @[src/main/scala/SerialCommunicator.scala 39:26 41:39]
  wire  _T_5 = index < 8'h7; // @[src/main/scala/SerialCommunicator.scala 52:21]
  wire [6:0] _GEN_5 = 3'h1 == index[2:0] ? 7'h5b : 7'h1b; // @[src/main/scala/SerialCommunicator.scala 54:{34,34}]
  wire [6:0] _GEN_6 = 3'h2 == index[2:0] ? 7'h32 : _GEN_5; // @[src/main/scala/SerialCommunicator.scala 54:{34,34}]
  wire [6:0] _GEN_7 = 3'h3 == index[2:0] ? 7'h4a : _GEN_6; // @[src/main/scala/SerialCommunicator.scala 54:{34,34}]
  wire [6:0] _GEN_8 = 3'h4 == index[2:0] ? 7'h1b : _GEN_7; // @[src/main/scala/SerialCommunicator.scala 54:{34,34}]
  wire [6:0] _GEN_9 = 3'h5 == index[2:0] ? 7'h5b : _GEN_8; // @[src/main/scala/SerialCommunicator.scala 54:{34,34}]
  wire [6:0] _GEN_10 = 3'h6 == index[2:0] ? 7'h48 : _GEN_9; // @[src/main/scala/SerialCommunicator.scala 54:{34,34}]
  wire [7:0] _index_T_1 = index + 8'h1; // @[src/main/scala/SerialCommunicator.scala 57:32]
  wire [7:0] _GEN_11 = uart_io_channel_ready ? _index_T_1 : _GEN_1; // @[src/main/scala/SerialCommunicator.scala 56:41 57:23]
  wire [6:0] _GEN_13 = index < 8'h7 ? _GEN_10 : 7'h0; // @[src/main/scala/SerialCommunicator.scala 49:27 52:42 54:34]
  wire  _T_7 = index < 8'hf; // @[src/main/scala/SerialCommunicator.scala 64:21]
  wire [6:0] _GEN_17 = 4'h1 == index[3:0] ? 7'h72 : 7'h50; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_18 = 4'h2 == index[3:0] ? 7'h69 : _GEN_17; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_19 = 4'h3 == index[3:0] ? 7'h63 : _GEN_18; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_20 = 4'h4 == index[3:0] ? 7'h65 : _GEN_19; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_21 = 4'h5 == index[3:0] ? 7'h3a : _GEN_20; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_22 = 4'h6 == index[3:0] ? 7'h20 : _GEN_21; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] formattedPrice_7 = {{1'd0}, _formattedPrice_T_1}; // @[src/main/scala/SerialCommunicator.scala 24:{33,33}]
  wire [6:0] _GEN_23 = 4'h7 == index[3:0] ? formattedPrice_7 : _GEN_22; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] formattedPrice_8 = {{1'd0}, _formattedPrice_T_3}; // @[src/main/scala/SerialCommunicator.scala 24:{33,33}]
  wire [6:0] _GEN_24 = 4'h8 == index[3:0] ? formattedPrice_8 : _GEN_23; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] formattedPrice_9 = {{1'd0}, _formattedPrice_T_5}; // @[src/main/scala/SerialCommunicator.scala 24:{33,33}]
  wire [6:0] _GEN_25 = 4'h9 == index[3:0] ? formattedPrice_9 : _GEN_24; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_26 = 4'ha == index[3:0] ? 7'h20 : _GEN_25; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_27 = 4'hb == index[3:0] ? 7'h41 : _GEN_26; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_28 = 4'hc == index[3:0] ? 7'h54 : _GEN_27; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_29 = 4'hd == index[3:0] ? 7'h53 : _GEN_28; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_30 = 4'he == index[3:0] ? 7'ha : _GEN_29; // @[src/main/scala/SerialCommunicator.scala 66:{34,34}]
  wire [6:0] _GEN_33 = index < 8'hf ? _GEN_30 : 7'h0; // @[src/main/scala/SerialCommunicator.scala 49:27 64:48 66:34]
  wire  _T_9 = index < 8'h12; // @[src/main/scala/SerialCommunicator.scala 76:21]
  wire [6:0] _GEN_37 = 5'h1 == index[4:0] ? 7'h6e : 7'h49; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_38 = 5'h2 == index[4:0] ? 7'h73 : _GEN_37; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_39 = 5'h3 == index[4:0] ? 7'h65 : _GEN_38; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_40 = 5'h4 == index[4:0] ? 7'h72 : _GEN_39; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_41 = 5'h5 == index[4:0] ? 7'h74 : _GEN_40; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_42 = 5'h6 == index[4:0] ? 7'h65 : _GEN_41; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_43 = 5'h7 == index[4:0] ? 7'h64 : _GEN_42; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_44 = 5'h8 == index[4:0] ? 7'h3a : _GEN_43; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_45 = 5'h9 == index[4:0] ? 7'h20 : _GEN_44; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] formattedSum_10 = {{1'd0}, _formattedSum_T_1}; // @[src/main/scala/SerialCommunicator.scala 28:{31,31}]
  wire [6:0] _GEN_46 = 5'ha == index[4:0] ? formattedSum_10 : _GEN_45; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] formattedSum_11 = {{1'd0}, _formattedSum_T_3}; // @[src/main/scala/SerialCommunicator.scala 28:{31,31}]
  wire [6:0] _GEN_47 = 5'hb == index[4:0] ? formattedSum_11 : _GEN_46; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] formattedSum_12 = {{1'd0}, _formattedSum_T_5}; // @[src/main/scala/SerialCommunicator.scala 28:{31,31}]
  wire [6:0] _GEN_48 = 5'hc == index[4:0] ? formattedSum_12 : _GEN_47; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_49 = 5'hd == index[4:0] ? 7'h20 : _GEN_48; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_50 = 5'he == index[4:0] ? 7'h41 : _GEN_49; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_51 = 5'hf == index[4:0] ? 7'h54 : _GEN_50; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_52 = 5'h10 == index[4:0] ? 7'h53 : _GEN_51; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire [6:0] _GEN_53 = 5'h11 == index[4:0] ? 7'ha : _GEN_52; // @[src/main/scala/SerialCommunicator.scala 78:{34,34}]
  wire  _GEN_56 = refresh ? 1'h0 : _GEN_3; // @[src/main/scala/SerialCommunicator.scala 86:27 88:25]
  wire [6:0] _GEN_58 = index < 8'h12 ? _GEN_53 : 7'h0; // @[src/main/scala/SerialCommunicator.scala 49:27 76:46 78:34]
  wire [7:0] _GEN_59 = index < 8'h12 ? _GEN_11 : 8'h0; // @[src/main/scala/SerialCommunicator.scala 76:46 84:19]
  wire [1:0] _GEN_60 = index < 8'h12 ? _GEN_2 : {{1'd0}, refresh}; // @[src/main/scala/SerialCommunicator.scala 76:46]
  wire  _GEN_61 = index < 8'h12 ? _GEN_3 : _GEN_56; // @[src/main/scala/SerialCommunicator.scala 76:46]
  wire  _GEN_62 = write == 2'h3 & _T_9; // @[src/main/scala/SerialCommunicator.scala 48:27 75:37]
  wire [6:0] _GEN_63 = write == 2'h3 ? _GEN_58 : 7'h0; // @[src/main/scala/SerialCommunicator.scala 49:27 75:37]
  wire  _GEN_67 = write == 2'h2 ? _T_7 : _GEN_62; // @[src/main/scala/SerialCommunicator.scala 63:37]
  wire [6:0] _GEN_68 = write == 2'h2 ? _GEN_33 : _GEN_63; // @[src/main/scala/SerialCommunicator.scala 63:37]
  wire [6:0] _GEN_73 = write == 2'h1 ? _GEN_13 : _GEN_68; // @[src/main/scala/SerialCommunicator.scala 51:30]
  BufferedTx uart ( // @[src/main/scala/SerialCommunicator.scala 21:22]
    .clock(uart_clock),
    .reset(uart_reset),
    .io_txd(uart_io_txd),
    .io_channel_ready(uart_io_channel_ready),
    .io_channel_valid(uart_io_channel_valid),
    .io_channel_bits(uart_io_channel_bits)
  );
  assign io_tx = uart_io_txd; // @[src/main/scala/SerialCommunicator.scala 22:11]
  assign uart_clock = clock;
  assign uart_reset = reset;
  assign uart_io_channel_valid = write == 2'h1 ? _T_5 : _GEN_67; // @[src/main/scala/SerialCommunicator.scala 51:30]
  assign uart_io_channel_bits = {{1'd0}, _GEN_73};
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/SerialCommunicator.scala 38:24]
      write <= 2'h0; // @[src/main/scala/SerialCommunicator.scala 38:24]
    end else if (write == 2'h1) begin // @[src/main/scala/SerialCommunicator.scala 51:30]
      if (index < 8'h7) begin // @[src/main/scala/SerialCommunicator.scala 52:42]
        write <= _GEN_2;
      end else begin
        write <= 2'h2; // @[src/main/scala/SerialCommunicator.scala 61:19]
      end
    end else if (write == 2'h2) begin // @[src/main/scala/SerialCommunicator.scala 63:37]
      if (index < 8'hf) begin // @[src/main/scala/SerialCommunicator.scala 64:48]
        write <= _GEN_2;
      end else begin
        write <= 2'h3; // @[src/main/scala/SerialCommunicator.scala 73:19]
      end
    end else if (write == 2'h3) begin // @[src/main/scala/SerialCommunicator.scala 75:37]
      write <= _GEN_60;
    end else begin
      write <= _GEN_2;
    end
    if (reset) begin // @[src/main/scala/SerialCommunicator.scala 39:26]
      refresh <= 1'h0; // @[src/main/scala/SerialCommunicator.scala 39:26]
    end else if (write == 2'h1) begin // @[src/main/scala/SerialCommunicator.scala 51:30]
      refresh <= _GEN_3;
    end else if (write == 2'h2) begin // @[src/main/scala/SerialCommunicator.scala 63:37]
      refresh <= _GEN_3;
    end else if (write == 2'h3) begin // @[src/main/scala/SerialCommunicator.scala 75:37]
      refresh <= _GEN_61;
    end else begin
      refresh <= _GEN_3;
    end
    if (reset) begin // @[src/main/scala/SerialCommunicator.scala 40:24]
      index <= 8'h0; // @[src/main/scala/SerialCommunicator.scala 40:24]
    end else if (write == 2'h1) begin // @[src/main/scala/SerialCommunicator.scala 51:30]
      if (index < 8'h7) begin // @[src/main/scala/SerialCommunicator.scala 52:42]
        index <= _GEN_11;
      end else begin
        index <= 8'h0; // @[src/main/scala/SerialCommunicator.scala 60:19]
      end
    end else if (write == 2'h2) begin // @[src/main/scala/SerialCommunicator.scala 63:37]
      if (index < 8'hf) begin // @[src/main/scala/SerialCommunicator.scala 64:48]
        index <= _GEN_11;
      end else begin
        index <= 8'h0; // @[src/main/scala/SerialCommunicator.scala 72:19]
      end
    end else if (write == 2'h3) begin // @[src/main/scala/SerialCommunicator.scala 75:37]
      index <= _GEN_59;
    end else begin
      index <= _GEN_1;
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
  write = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  refresh = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  index = _RAND_2[7:0];
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
  input  [4:0] io_price, // @[src/main/scala/VendingMachine.scala 5:14]
  input        io_coin2, // @[src/main/scala/VendingMachine.scala 5:14]
  input        io_coin5, // @[src/main/scala/VendingMachine.scala 5:14]
  input        io_buy, // @[src/main/scala/VendingMachine.scala 5:14]
  output       io_releaseCan, // @[src/main/scala/VendingMachine.scala 5:14]
  output       io_alarm, // @[src/main/scala/VendingMachine.scala 5:14]
  output [6:0] io_seg, // @[src/main/scala/VendingMachine.scala 5:14]
  output [3:0] io_an, // @[src/main/scala/VendingMachine.scala 5:14]
  output       io_tx // @[src/main/scala/VendingMachine.scala 5:14]
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
  wire  DisplayMultiplexer_clock; // @[src/main/scala/VendingMachine.scala 17:34]
  wire  DisplayMultiplexer_reset; // @[src/main/scala/VendingMachine.scala 17:34]
  wire [7:0] DisplayMultiplexer_io_sum; // @[src/main/scala/VendingMachine.scala 17:34]
  wire [4:0] DisplayMultiplexer_io_price; // @[src/main/scala/VendingMachine.scala 17:34]
  wire [6:0] DisplayMultiplexer_io_seg; // @[src/main/scala/VendingMachine.scala 17:34]
  wire [3:0] DisplayMultiplexer_io_an; // @[src/main/scala/VendingMachine.scala 17:34]
  wire  SerialComs_clock; // @[src/main/scala/VendingMachine.scala 34:26]
  wire  SerialComs_reset; // @[src/main/scala/VendingMachine.scala 34:26]
  wire [4:0] SerialComs_io_price; // @[src/main/scala/VendingMachine.scala 34:26]
  wire [7:0] SerialComs_io_sum; // @[src/main/scala/VendingMachine.scala 34:26]
  wire  SerialComs_io_update; // @[src/main/scala/VendingMachine.scala 34:26]
  wire  SerialComs_io_tx; // @[src/main/scala/VendingMachine.scala 34:26]
  reg [7:0] Value; // @[src/main/scala/VendingMachine.scala 19:22]
  wire  Full2 = Value > 8'h61; // @[src/main/scala/VendingMachine.scala 20:21]
  wire  Full5 = Value > 8'h5e; // @[src/main/scala/VendingMachine.scala 21:21]
  wire [7:0] _GEN_12 = {{3'd0}, io_price}; // @[src/main/scala/VendingMachine.scala 22:22]
  wire  enough = Value >= _GEN_12; // @[src/main/scala/VendingMachine.scala 22:22]
  reg [9:0] count_to_4; // @[src/main/scala/VendingMachine.scala 23:27]
  reg  coin2_previous; // @[src/main/scala/VendingMachine.scala 26:31]
  reg  coin5_previous; // @[src/main/scala/VendingMachine.scala 27:31]
  reg  buy_previous; // @[src/main/scala/VendingMachine.scala 28:31]
  wire  coin2_change = io_coin2 & ~coin2_previous; // @[src/main/scala/VendingMachine.scala 30:31]
  wire  coin5_change = io_coin5 & ~coin5_previous; // @[src/main/scala/VendingMachine.scala 31:31]
  wire  buy_change = io_buy & ~buy_previous; // @[src/main/scala/VendingMachine.scala 32:29]
  wire [7:0] _Value_T_1 = Value + 8'h2; // @[src/main/scala/VendingMachine.scala 41:20]
  wire [7:0] _Value_T_3 = Value + 8'h5; // @[src/main/scala/VendingMachine.scala 43:20]
  wire  _T_4 = buy_change & enough; // @[src/main/scala/VendingMachine.scala 44:25]
  wire [7:0] _Value_T_5 = Value - _GEN_12; // @[src/main/scala/VendingMachine.scala 45:20]
  reg  ringalarm; // @[src/main/scala/VendingMachine.scala 48:26]
  wire  _GEN_3 = buy_change & ~enough | ringalarm; // @[src/main/scala/VendingMachine.scala 49:32 50:14 48:26]
  reg  dispense; // @[src/main/scala/VendingMachine.scala 53:25]
  wire  _GEN_6 = count_to_4 == 10'h0 ? 1'h0 : dispense; // @[src/main/scala/VendingMachine.scala 54:28 56:14 53:25]
  wire  _GEN_7 = _T_4 | _GEN_6; // @[src/main/scala/VendingMachine.scala 60:31 61:13]
  reg [31:0] tick_tickCnt; // @[src/main/scala/VendingMachine.scala 66:26]
  wire  tick = tick_tickCnt == 32'h1869f; // @[src/main/scala/VendingMachine.scala 69:18]
  wire [31:0] _tick_tickCnt_T_1 = tick_tickCnt + 32'h1; // @[src/main/scala/VendingMachine.scala 73:26]
  wire [9:0] _count_to_4_T_1 = count_to_4 + 10'h1; // @[src/main/scala/VendingMachine.scala 82:30]
  DisplayMultiplexer DisplayMultiplexer ( // @[src/main/scala/VendingMachine.scala 17:34]
    .clock(DisplayMultiplexer_clock),
    .reset(DisplayMultiplexer_reset),
    .io_sum(DisplayMultiplexer_io_sum),
    .io_price(DisplayMultiplexer_io_price),
    .io_seg(DisplayMultiplexer_io_seg),
    .io_an(DisplayMultiplexer_io_an)
  );
  SerialCommunicator SerialComs ( // @[src/main/scala/VendingMachine.scala 34:26]
    .clock(SerialComs_clock),
    .reset(SerialComs_reset),
    .io_price(SerialComs_io_price),
    .io_sum(SerialComs_io_sum),
    .io_update(SerialComs_io_update),
    .io_tx(SerialComs_io_tx)
  );
  assign io_releaseCan = dispense; // @[src/main/scala/VendingMachine.scala 88:17]
  assign io_alarm = ringalarm; // @[src/main/scala/VendingMachine.scala 87:12]
  assign io_seg = DisplayMultiplexer_io_seg; // @[src/main/scala/VendingMachine.scala 91:10]
  assign io_an = DisplayMultiplexer_io_an; // @[src/main/scala/VendingMachine.scala 92:9]
  assign io_tx = SerialComs_io_tx; // @[src/main/scala/VendingMachine.scala 38:9]
  assign DisplayMultiplexer_clock = clock;
  assign DisplayMultiplexer_reset = reset;
  assign DisplayMultiplexer_io_sum = Value; // @[src/main/scala/VendingMachine.scala 89:28]
  assign DisplayMultiplexer_io_price = io_price; // @[src/main/scala/VendingMachine.scala 90:31]
  assign SerialComs_clock = clock;
  assign SerialComs_reset = reset;
  assign SerialComs_io_price = io_price; // @[src/main/scala/VendingMachine.scala 35:23]
  assign SerialComs_io_sum = Value; // @[src/main/scala/VendingMachine.scala 36:21]
  assign SerialComs_io_update = coin2_change | coin5_change | buy_change; // @[src/main/scala/VendingMachine.scala 37:56]
  always @(posedge clock) begin
    if (reset) begin // @[src/main/scala/VendingMachine.scala 19:22]
      Value <= 8'h0; // @[src/main/scala/VendingMachine.scala 19:22]
    end else if (coin2_change & ~Full2) begin // @[src/main/scala/VendingMachine.scala 40:32]
      Value <= _Value_T_1; // @[src/main/scala/VendingMachine.scala 41:11]
    end else if (coin5_change & ~Full5) begin // @[src/main/scala/VendingMachine.scala 42:38]
      Value <= _Value_T_3; // @[src/main/scala/VendingMachine.scala 43:11]
    end else if (buy_change & enough) begin // @[src/main/scala/VendingMachine.scala 44:36]
      Value <= _Value_T_5; // @[src/main/scala/VendingMachine.scala 45:11]
    end
    if (reset) begin // @[src/main/scala/VendingMachine.scala 23:27]
      count_to_4 <= 10'h0; // @[src/main/scala/VendingMachine.scala 23:27]
    end else if (tick) begin // @[src/main/scala/VendingMachine.scala 81:14]
      count_to_4 <= _count_to_4_T_1; // @[src/main/scala/VendingMachine.scala 82:16]
    end else if (_T_4) begin // @[src/main/scala/VendingMachine.scala 60:31]
      count_to_4 <= 10'h1; // @[src/main/scala/VendingMachine.scala 62:14]
    end else if (buy_change & ~enough) begin // @[src/main/scala/VendingMachine.scala 49:32]
      count_to_4 <= 10'h1; // @[src/main/scala/VendingMachine.scala 51:16]
    end
    coin2_previous <= io_coin2; // @[src/main/scala/VendingMachine.scala 26:31]
    coin5_previous <= io_coin5; // @[src/main/scala/VendingMachine.scala 27:31]
    buy_previous <= io_buy; // @[src/main/scala/VendingMachine.scala 28:31]
    if (reset) begin // @[src/main/scala/VendingMachine.scala 48:26]
      ringalarm <= 1'h0; // @[src/main/scala/VendingMachine.scala 48:26]
    end else if (count_to_4 == 10'h0) begin // @[src/main/scala/VendingMachine.scala 54:28]
      ringalarm <= 1'h0; // @[src/main/scala/VendingMachine.scala 55:15]
    end else begin
      ringalarm <= _GEN_3;
    end
    if (reset) begin // @[src/main/scala/VendingMachine.scala 53:25]
      dispense <= 1'h0; // @[src/main/scala/VendingMachine.scala 53:25]
    end else begin
      dispense <= _GEN_7;
    end
    if (reset) begin // @[src/main/scala/VendingMachine.scala 66:26]
      tick_tickCnt <= 32'h0; // @[src/main/scala/VendingMachine.scala 66:26]
    end else if (tick) begin // @[src/main/scala/VendingMachine.scala 69:35]
      tick_tickCnt <= 32'h0; // @[src/main/scala/VendingMachine.scala 70:15]
    end else begin
      tick_tickCnt <= _tick_tickCnt_T_1; // @[src/main/scala/VendingMachine.scala 73:15]
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
