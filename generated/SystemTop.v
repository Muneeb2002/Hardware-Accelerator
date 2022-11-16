module DataMemory(
  input         clock,
  input  [15:0] io_address,
  output [31:0] io_dataRead,
  input         io_writeEnable,
  input  [31:0] io_dataWrite,
  input         io_testerEnable,
  input  [15:0] io_testerAddress,
  output [31:0] io_testerDataRead,
  input         io_testerWriteEnable,
  input  [31:0] io_testerDataWrite
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
  reg [31:0] memory [0:65535]; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_2_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_2_addr; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_1_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_1_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_1_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_1_en; // @[DataMemory.scala 18:20]
  wire [31:0] memory__T_3_data; // @[DataMemory.scala 18:20]
  wire [15:0] memory__T_3_addr; // @[DataMemory.scala 18:20]
  wire  memory__T_3_mask; // @[DataMemory.scala 18:20]
  wire  memory__T_3_en; // @[DataMemory.scala 18:20]
  wire [31:0] _GEN_5 = io_testerWriteEnable ? io_testerDataWrite : memory__T_data; // @[DataMemory.scala 27:32]
  wire [31:0] _GEN_11 = io_writeEnable ? io_dataWrite : memory__T_2_data; // @[DataMemory.scala 37:26]
  assign memory__T_addr = io_testerAddress;
  assign memory__T_data = memory[memory__T_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_2_addr = io_address;
  assign memory__T_2_data = memory[memory__T_2_addr]; // @[DataMemory.scala 18:20]
  assign memory__T_1_data = io_testerDataWrite;
  assign memory__T_1_addr = io_testerAddress;
  assign memory__T_1_mask = 1'h1;
  assign memory__T_1_en = io_testerEnable & io_testerWriteEnable;
  assign memory__T_3_data = io_dataWrite;
  assign memory__T_3_addr = io_address;
  assign memory__T_3_mask = 1'h1;
  assign memory__T_3_en = io_testerEnable ? 1'h0 : io_writeEnable;
  assign io_dataRead = io_testerEnable ? 32'h0 : _GEN_11; // @[DataMemory.scala 26:17 DataMemory.scala 34:17 DataMemory.scala 40:19]
  assign io_testerDataRead = io_testerEnable ? _GEN_5 : 32'h0; // @[DataMemory.scala 24:23 DataMemory.scala 30:25 DataMemory.scala 36:23]
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
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 65536; initvar = initvar+1)
    memory[initvar] = _RAND_0[31:0];
`endif // RANDOMIZE_MEM_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(memory__T_1_en & memory__T_1_mask) begin
      memory[memory__T_1_addr] <= memory__T_1_data; // @[DataMemory.scala 18:20]
    end
    if(memory__T_3_en & memory__T_3_mask) begin
      memory[memory__T_3_addr] <= memory__T_3_data; // @[DataMemory.scala 18:20]
    end
  end
endmodule
module Accelerator(
  input         clock,
  input         reset,
  input         io_start,
  output        io_done,
  output [15:0] io_address,
  input  [31:0] io_dataRead,
  output        io_writeEnable,
  output [31:0] io_dataWrite
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [3:0] stateReg; // @[Accelerator.scala 21:25]
  reg [15:0] addressReg; // @[Accelerator.scala 24:27]
  reg [15:0] x; // @[Accelerator.scala 34:18]
  reg [15:0] y; // @[Accelerator.scala 35:18]
  wire  _T = 4'h0 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_1 = 4'h1 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_2 = x < 16'h14; // @[Accelerator.scala 49:13]
  wire  _GEN_4 = _T_2 ? 1'h0 : 1'h1; // @[Accelerator.scala 49:25]
  wire  _T_3 = 4'h2 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_4 = y < 16'h14; // @[Accelerator.scala 56:15]
  wire [15:0] _T_6 = x + 16'h1; // @[Accelerator.scala 61:16]
  wire  _T_7 = 4'h4 == stateReg; // @[Conditional.scala 37:30]
  wire  _T_10 = 4'h3 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _T_11 = 16'h14 * y; // @[Accelerator.scala 70:36]
  wire [31:0] _GEN_82 = {{16'd0}, x}; // @[Accelerator.scala 70:23]
  wire [31:0] _T_13 = _GEN_82 + _T_11; // @[Accelerator.scala 70:23]
  wire  _T_14 = io_dataRead == 32'h0; // @[Accelerator.scala 71:25]
  wire  _T_15 = x == 16'h0; // @[Accelerator.scala 71:42]
  wire  _T_16 = _T_14 | _T_15; // @[Accelerator.scala 71:38]
  wire  _T_17 = x == 16'h13; // @[Accelerator.scala 71:61]
  wire  _T_18 = _T_16 | _T_17; // @[Accelerator.scala 71:56]
  wire  _T_19 = y == 16'h0; // @[Accelerator.scala 71:80]
  wire  _T_20 = _T_18 | _T_19; // @[Accelerator.scala 71:76]
  wire  _T_21 = y == 16'h13; // @[Accelerator.scala 71:99]
  wire  _T_22 = _T_20 | _T_21; // @[Accelerator.scala 71:94]
  wire  _T_23 = 4'h5 == stateReg; // @[Conditional.scala 37:30]
  wire [15:0] _T_25 = y + 16'h1; // @[Accelerator.scala 78:41]
  wire [31:0] _T_26 = 16'h14 * _T_25; // @[Accelerator.scala 78:36]
  wire [31:0] _T_28 = _GEN_82 + _T_26; // @[Accelerator.scala 78:23]
  wire  _T_30 = 4'h6 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_84 = {{16'd0}, _T_6}; // @[Accelerator.scala 86:35]
  wire [31:0] _T_35 = _GEN_84 + _T_11; // @[Accelerator.scala 86:35]
  wire  _T_37 = 4'h7 == stateReg; // @[Conditional.scala 37:30]
  wire [15:0] _T_39 = x - 16'h1; // @[Accelerator.scala 94:24]
  wire [31:0] _GEN_85 = {{16'd0}, _T_39}; // @[Accelerator.scala 94:37]
  wire [31:0] _T_42 = _GEN_85 + _T_11; // @[Accelerator.scala 94:37]
  wire  _T_44 = 4'h8 == stateReg; // @[Conditional.scala 37:30]
  wire [15:0] _T_46 = y - 16'h1; // @[Accelerator.scala 102:41]
  wire [31:0] _T_47 = 16'h14 * _T_46; // @[Accelerator.scala 102:36]
  wire [31:0] _T_49 = _GEN_82 + _T_47; // @[Accelerator.scala 102:23]
  wire  _T_51 = 4'ha == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _T_56 = _T_13 + 32'h190; // @[Accelerator.scala 111:36]
  wire  _T_59 = 4'h9 == stateReg; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_13 = _T_59 ? _T_56 : {{16'd0}, addressReg}; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_14 = _T_59 ? 32'hff : 32'h0; // @[Conditional.scala 39:67]
  wire  _GEN_17 = _T_51 | _T_59; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_18 = _T_51 ? _T_56 : _GEN_13; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_19 = _T_51 ? 32'h0 : _GEN_14; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_22 = _T_44 ? _T_49 : {{16'd0}, addressReg}; // @[Conditional.scala 39:67]
  wire  _GEN_24 = _T_44 ? 1'h0 : _GEN_17; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_25 = _T_44 ? {{16'd0}, addressReg} : _GEN_18; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_26 = _T_44 ? 32'h0 : _GEN_19; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_28 = _T_37 ? _T_42 : _GEN_22; // @[Conditional.scala 39:67]
  wire  _GEN_30 = _T_37 ? 1'h0 : _GEN_24; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_31 = _T_37 ? {{16'd0}, addressReg} : _GEN_25; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_32 = _T_37 ? 32'h0 : _GEN_26; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_34 = _T_30 ? _T_35 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_36 = _T_30 ? 1'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_37 = _T_30 ? {{16'd0}, addressReg} : _GEN_31; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_38 = _T_30 ? 32'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_40 = _T_23 ? _T_28 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_23 ? 1'h0 : _GEN_36; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_43 = _T_23 ? {{16'd0}, addressReg} : _GEN_37; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_44 = _T_23 ? 32'h0 : _GEN_38; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_46 = _T_10 ? _T_13 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_10 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_49 = _T_10 ? {{16'd0}, addressReg} : _GEN_43; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_50 = _T_10 ? 32'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_54 = _T_7 ? {{16'd0}, addressReg} : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_55 = _T_7 ? 1'h0 : _GEN_48; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_56 = _T_7 ? {{16'd0}, addressReg} : _GEN_49; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_57 = _T_7 ? 32'h0 : _GEN_50; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_61 = _T_3 ? {{16'd0}, addressReg} : _GEN_54; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_3 ? 1'h0 : _GEN_55; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_63 = _T_3 ? {{16'd0}, addressReg} : _GEN_56; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_64 = _T_3 ? 32'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_68 = _T_1 & _GEN_4; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_70 = _T_1 ? {{16'd0}, addressReg} : _GEN_61; // @[Conditional.scala 39:67]
  wire  _GEN_71 = _T_1 ? 1'h0 : _GEN_62; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_72 = _T_1 ? {{16'd0}, addressReg} : _GEN_63; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_73 = _T_1 ? 32'h0 : _GEN_64; // @[Conditional.scala 39:67]
  wire [31:0] _GEN_78 = _T ? {{16'd0}, addressReg} : _GEN_70; // @[Conditional.scala 40:58]
  wire [31:0] _GEN_80 = _T ? {{16'd0}, addressReg} : _GEN_72; // @[Conditional.scala 40:58]
  assign io_done = _T ? 1'h0 : _GEN_68; // @[Accelerator.scala 32:11 Accelerator.scala 52:17]
  assign io_address = _GEN_80[15:0]; // @[Accelerator.scala 29:14 Accelerator.scala 30:14 Accelerator.scala 111:17 Accelerator.scala 118:18]
  assign io_writeEnable = _T ? 1'h0 : _GEN_71; // @[Accelerator.scala 28:18 Accelerator.scala 110:22 Accelerator.scala 117:22]
  assign io_dataWrite = _T ? 32'h0 : _GEN_73; // @[Accelerator.scala 31:16 Accelerator.scala 112:20 Accelerator.scala 119:20]
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
  stateReg = _RAND_0[3:0];
  _RAND_1 = {1{`RANDOM}};
  addressReg = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  x = _RAND_2[15:0];
  _RAND_3 = {1{`RANDOM}};
  y = _RAND_3[15:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      stateReg <= 4'h0;
    end else if (_T) begin
      if (io_start) begin
        stateReg <= 4'h1;
      end
    end else if (_T_1) begin
      if (_T_2) begin
        stateReg <= 4'h2;
      end
    end else if (_T_3) begin
      if (_T_4) begin
        stateReg <= 4'h3;
      end else begin
        stateReg <= 4'h1;
      end
    end else if (_T_7) begin
      stateReg <= 4'h1;
    end else if (_T_10) begin
      if (_T_22) begin
        stateReg <= 4'ha;
      end else begin
        stateReg <= 4'h5;
      end
    end else if (_T_23) begin
      if (_T_14) begin
        stateReg <= 4'ha;
      end else begin
        stateReg <= 4'h6;
      end
    end else if (_T_30) begin
      if (_T_14) begin
        stateReg <= 4'ha;
      end else begin
        stateReg <= 4'h7;
      end
    end else if (_T_37) begin
      if (_T_14) begin
        stateReg <= 4'ha;
      end else begin
        stateReg <= 4'h8;
      end
    end else if (_T_44) begin
      if (_T_14) begin
        stateReg <= 4'ha;
      end else begin
        stateReg <= 4'h9;
      end
    end else if (_T_51) begin
      stateReg <= 4'h2;
    end else if (_T_59) begin
      stateReg <= 4'h2;
    end
    if (reset) begin
      addressReg <= 16'h0;
    end else begin
      addressReg <= _GEN_78[15:0];
    end
    if (reset) begin
      x <= 16'h0;
    end else if (_T) begin
      if (io_start) begin
        x <= 16'h0;
      end
    end else if (!(_T_1)) begin
      if (_T_3) begin
        if (!(_T_4)) begin
          x <= _T_6;
        end
      end else if (_T_7) begin
        x <= _T_6;
      end
    end
    if (reset) begin
      y <= 16'h0;
    end else if (_T) begin
      if (io_start) begin
        y <= 16'h0;
      end
    end else if (_T_1) begin
      y <= 16'h0;
    end else if (!(_T_3)) begin
      if (!(_T_7)) begin
        if (!(_T_10)) begin
          if (!(_T_23)) begin
            if (!(_T_30)) begin
              if (!(_T_37)) begin
                if (!(_T_44)) begin
                  if (_T_51) begin
                    y <= _T_25;
                  end else if (_T_59) begin
                    y <= _T_25;
                  end
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
module SystemTop(
  input         clock,
  input         reset,
  output        io_done,
  input         io_start,
  input         io_testerDataMemEnable,
  input  [15:0] io_testerDataMemAddress,
  output [31:0] io_testerDataMemDataRead,
  input         io_testerDataMemWriteEnable,
  input  [31:0] io_testerDataMemDataWrite
);
  wire  dataMemory_clock; // @[SystemTop.scala 18:26]
  wire [15:0] dataMemory_io_address; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_dataRead; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_writeEnable; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_dataWrite; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_testerEnable; // @[SystemTop.scala 18:26]
  wire [15:0] dataMemory_io_testerAddress; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_testerDataRead; // @[SystemTop.scala 18:26]
  wire  dataMemory_io_testerWriteEnable; // @[SystemTop.scala 18:26]
  wire [31:0] dataMemory_io_testerDataWrite; // @[SystemTop.scala 18:26]
  wire  accelerator_clock; // @[SystemTop.scala 19:27]
  wire  accelerator_reset; // @[SystemTop.scala 19:27]
  wire  accelerator_io_start; // @[SystemTop.scala 19:27]
  wire  accelerator_io_done; // @[SystemTop.scala 19:27]
  wire [15:0] accelerator_io_address; // @[SystemTop.scala 19:27]
  wire [31:0] accelerator_io_dataRead; // @[SystemTop.scala 19:27]
  wire  accelerator_io_writeEnable; // @[SystemTop.scala 19:27]
  wire [31:0] accelerator_io_dataWrite; // @[SystemTop.scala 19:27]
  DataMemory dataMemory ( // @[SystemTop.scala 18:26]
    .clock(dataMemory_clock),
    .io_address(dataMemory_io_address),
    .io_dataRead(dataMemory_io_dataRead),
    .io_writeEnable(dataMemory_io_writeEnable),
    .io_dataWrite(dataMemory_io_dataWrite),
    .io_testerEnable(dataMemory_io_testerEnable),
    .io_testerAddress(dataMemory_io_testerAddress),
    .io_testerDataRead(dataMemory_io_testerDataRead),
    .io_testerWriteEnable(dataMemory_io_testerWriteEnable),
    .io_testerDataWrite(dataMemory_io_testerDataWrite)
  );
  Accelerator accelerator ( // @[SystemTop.scala 19:27]
    .clock(accelerator_clock),
    .reset(accelerator_reset),
    .io_start(accelerator_io_start),
    .io_done(accelerator_io_done),
    .io_address(accelerator_io_address),
    .io_dataRead(accelerator_io_dataRead),
    .io_writeEnable(accelerator_io_writeEnable),
    .io_dataWrite(accelerator_io_dataWrite)
  );
  assign io_done = accelerator_io_done; // @[SystemTop.scala 23:11]
  assign io_testerDataMemDataRead = dataMemory_io_testerDataRead; // @[SystemTop.scala 34:28]
  assign dataMemory_clock = clock;
  assign dataMemory_io_address = accelerator_io_address; // @[SystemTop.scala 28:25]
  assign dataMemory_io_writeEnable = accelerator_io_writeEnable; // @[SystemTop.scala 30:29]
  assign dataMemory_io_dataWrite = accelerator_io_dataWrite; // @[SystemTop.scala 29:27]
  assign dataMemory_io_testerEnable = io_testerDataMemEnable; // @[SystemTop.scala 36:30]
  assign dataMemory_io_testerAddress = io_testerDataMemAddress; // @[SystemTop.scala 33:31]
  assign dataMemory_io_testerWriteEnable = io_testerDataMemWriteEnable; // @[SystemTop.scala 37:35]
  assign dataMemory_io_testerDataWrite = io_testerDataMemDataWrite; // @[SystemTop.scala 35:33]
  assign accelerator_clock = clock;
  assign accelerator_reset = reset;
  assign accelerator_io_start = io_start; // @[SystemTop.scala 24:24]
  assign accelerator_io_dataRead = dataMemory_io_dataRead; // @[SystemTop.scala 27:27]
endmodule
