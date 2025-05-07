module PipeConInterconnect(
  input         clock,
  input         reset,
  output        io_device_0_rd,
  input  [31:0] io_device_0_rdData,
  output [31:0] io_device_0_wrData,
  output [3:0]  io_device_0_wrMask,
  output        io_device_1_rd,
  input  [31:0] io_device_1_rdData,
  output [31:0] io_device_1_wrData,
  output [3:0]  io_device_1_wrMask,
  output [31:0] io_device_2_address,
  output        io_device_2_rd,
  output        io_device_2_wr,
  input  [31:0] io_device_2_rdData,
  output [31:0] io_device_2_wrData,
  output [31:0] io_device_3_address,
  output        io_device_3_rd,
  output        io_device_3_wr,
  input  [31:0] io_device_3_rdData,
  output [31:0] io_device_3_wrData,
  output [3:0]  io_device_3_wrMask,
  input  [31:0] io_dmem_rdAddress,
  output [31:0] io_dmem_rdData,
  input         io_dmem_rdEnable,
  input  [31:0] io_dmem_wrAddress,
  input  [31:0] io_dmem_wrData,
  input         io_dmem_wrEnable_0,
  input         io_dmem_wrEnable_1,
  input         io_dmem_wrEnable_2,
  input         io_dmem_wrEnable_3
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] rdDataReg; // @[PipeConInterconnect.scala 19:26]
  wire  selected_wr = io_dmem_wrEnable_0 | io_dmem_wrEnable_1 | io_dmem_wrEnable_2 | io_dmem_wrEnable_3; // @[PipeConInterconnect.scala 41:34]
  wire [31:0] _GEN_30 = io_dmem_rdEnable ? io_dmem_rdAddress : 32'h0; // @[PipeConInterconnect.scala 26:20 47:32 50:22]
  wire [31:0] selected_address = selected_wr ? io_dmem_wrAddress : _GEN_30; // @[PipeConInterconnect.scala 41:41 44:22]
  wire  selected_rd = selected_wr ? 1'h0 : io_dmem_rdEnable; // @[PipeConInterconnect.scala 41:41 43:17]
  wire [31:0] _GEN_3 = io_dmem_wrAddress <= 32'hf ? io_device_0_rdData : 32'h0; // @[PipeConInterconnect.scala 35:74 36:16 29:19]
  wire [31:0] selected_wrData = selected_wr ? io_dmem_wrData : 32'h0; // @[PipeConInterconnect.scala 27:19 41:41 45:21]
  wire [3:0] _selected_wrMask_T = {io_dmem_wrEnable_3,io_dmem_wrEnable_2,io_dmem_wrEnable_1,io_dmem_wrEnable_0}; // @[PipeConInterconnect.scala 46:41]
  wire [3:0] selected_wrMask = selected_wr ? _selected_wrMask_T : 4'h0; // @[PipeConInterconnect.scala 28:19 41:41 46:21]
  wire [31:0] _GEN_10 = io_dmem_wrAddress >= 32'h10 & io_dmem_wrAddress <= 32'h1f ? io_device_1_rdData : _GEN_3; // @[PipeConInterconnect.scala 35:74 36:16]
  wire [31:0] _GEN_17 = io_dmem_wrAddress >= 32'h20 & io_dmem_wrAddress <= 32'h2f ? io_device_2_rdData : _GEN_10; // @[PipeConInterconnect.scala 35:74 36:16]
  assign io_device_0_rd = io_dmem_wrAddress <= 32'hf & selected_rd; // @[PipeConInterconnect.scala 35:74 36:16 12:21]
  assign io_device_0_wrData = io_dmem_wrAddress <= 32'hf ? selected_wrData : 32'h0; // @[PipeConInterconnect.scala 35:74 36:16 15:25]
  assign io_device_0_wrMask = io_dmem_wrAddress <= 32'hf ? selected_wrMask : 4'h0; // @[PipeConInterconnect.scala 35:74 36:16 16:25]
  assign io_device_1_rd = io_dmem_wrAddress >= 32'h10 & io_dmem_wrAddress <= 32'h1f & selected_rd; // @[PipeConInterconnect.scala 35:74 36:16 12:21]
  assign io_device_1_wrData = io_dmem_wrAddress >= 32'h10 & io_dmem_wrAddress <= 32'h1f ? selected_wrData : 32'h0; // @[PipeConInterconnect.scala 35:74 36:16 15:25]
  assign io_device_1_wrMask = io_dmem_wrAddress >= 32'h10 & io_dmem_wrAddress <= 32'h1f ? selected_wrMask : 4'h0; // @[PipeConInterconnect.scala 35:74 36:16 16:25]
  assign io_device_2_address = io_dmem_wrAddress >= 32'h20 & io_dmem_wrAddress <= 32'h2f ? selected_address : 32'h0; // @[PipeConInterconnect.scala 35:74 36:16 14:26]
  assign io_device_2_rd = io_dmem_wrAddress >= 32'h20 & io_dmem_wrAddress <= 32'h2f & selected_rd; // @[PipeConInterconnect.scala 35:74 36:16 12:21]
  assign io_device_2_wr = io_dmem_wrAddress >= 32'h20 & io_dmem_wrAddress <= 32'h2f & selected_wr; // @[PipeConInterconnect.scala 35:74 36:16 13:21]
  assign io_device_2_wrData = io_dmem_wrAddress >= 32'h20 & io_dmem_wrAddress <= 32'h2f ? selected_wrData : 32'h0; // @[PipeConInterconnect.scala 35:74 36:16 15:25]
  assign io_device_3_address = io_dmem_wrAddress >= 32'h10000000 & io_dmem_wrAddress <= 32'h1fffffff ? selected_address
     : 32'h0; // @[PipeConInterconnect.scala 35:74 36:16 14:26]
  assign io_device_3_rd = io_dmem_wrAddress >= 32'h10000000 & io_dmem_wrAddress <= 32'h1fffffff & selected_rd; // @[PipeConInterconnect.scala 35:74 36:16 12:21]
  assign io_device_3_wr = io_dmem_wrAddress >= 32'h10000000 & io_dmem_wrAddress <= 32'h1fffffff & selected_wr; // @[PipeConInterconnect.scala 35:74 36:16 13:21]
  assign io_device_3_wrData = io_dmem_wrAddress >= 32'h10000000 & io_dmem_wrAddress <= 32'h1fffffff ? selected_wrData : 32'h0
    ; // @[PipeConInterconnect.scala 35:74 36:16 15:25]
  assign io_device_3_wrMask = io_dmem_wrAddress >= 32'h10000000 & io_dmem_wrAddress <= 32'h1fffffff ? selected_wrMask : 4'h0
    ; // @[PipeConInterconnect.scala 35:74 36:16 16:25]
  assign io_dmem_rdData = rdDataReg; // @[PipeConInterconnect.scala 55:18]
  always @(posedge clock) begin
    if (reset) begin // @[PipeConInterconnect.scala 19:26]
      rdDataReg <= 32'h0; // @[PipeConInterconnect.scala 19:26]
    end else if (!(selected_wr)) begin // @[PipeConInterconnect.scala 41:41]
      if (io_dmem_rdEnable) begin // @[PipeConInterconnect.scala 47:32]
        if (io_dmem_wrAddress >= 32'h10000000 & io_dmem_wrAddress <= 32'h1fffffff) begin // @[PipeConInterconnect.scala 35:74]
          rdDataReg <= io_device_3_rdData; // @[PipeConInterconnect.scala 36:16]
        end else begin
          rdDataReg <= _GEN_17;
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
  rdDataReg = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Csr(
  input  [11:0] io_address,
  output [31:0] io_data
);
  wire [31:0] _GEN_0 = 12'hf12 == io_address ? 32'h2f : 32'h0; // @[Csr.scala 22:22 48:12 19:25]
  wire [31:0] _GEN_1 = 12'hb81 == io_address ? 32'h0 : _GEN_0; // @[Csr.scala 22:22 45:12]
  wire [31:0] _GEN_2 = 12'hb01 == io_address ? 32'h0 : _GEN_1; // @[Csr.scala 22:22 42:12]
  wire [31:0] _GEN_3 = 12'hb80 == io_address ? 32'h0 : _GEN_2; // @[Csr.scala 22:22 39:12]
  wire [31:0] _GEN_4 = 12'hb00 == io_address ? 32'h0 : _GEN_3; // @[Csr.scala 22:22 36:12]
  wire [31:0] _GEN_5 = 12'hc81 == io_address ? 32'h4 : _GEN_4; // @[Csr.scala 22:22 33:12]
  wire [31:0] _GEN_6 = 12'hc01 == io_address ? 32'h3 : _GEN_5; // @[Csr.scala 22:22 30:12]
  wire [31:0] _GEN_7 = 12'hc80 == io_address ? 32'h2 : _GEN_6; // @[Csr.scala 22:22 27:12]
  assign io_data = 12'hc00 == io_address ? 32'h1 : _GEN_7; // @[Csr.scala 22:22 24:12]
endmodule
module ThreeCats(
  input         clock,
  input         reset,
  output [31:0] io_dmem_rdAddress,
  input  [31:0] io_dmem_rdData,
  output        io_dmem_rdEnable,
  output [31:0] io_dmem_wrAddress,
  output [31:0] io_dmem_wrData,
  output        io_dmem_wrEnable_0,
  output        io_dmem_wrEnable_1,
  output        io_dmem_wrEnable_2,
  output        io_dmem_wrEnable_3
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
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
`endif // RANDOMIZE_REG_INIT
  wire [11:0] csr_io_address; // @[ThreeCats.scala 62:19]
  wire [31:0] csr_io_data; // @[ThreeCats.scala 62:19]
  reg  exFwdReg_valid; // @[ThreeCats.scala 36:25]
  reg [4:0] exFwdReg_wbDest; // @[ThreeCats.scala 36:25]
  reg [31:0] exFwdReg_wbData; // @[ThreeCats.scala 36:25]
  reg [31:0] pcReg; // @[ThreeCats.scala 41:22]
  wire [31:0] _pcNext_T_1 = pcReg + 32'h4; // @[ThreeCats.scala 42:62]
  reg [2:0] decExReg_func3; // @[ThreeCats.scala 115:25]
  wire  _doBranch_T = 3'h0 == decExReg_func3; // @[Functions.scala 155:20]
  reg [4:0] decExReg_rs1; // @[ThreeCats.scala 115:25]
  wire [31:0] v1 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs1 ? exFwdReg_wbData : 32'h0; // @[ThreeCats.scala 119:15]
  reg [4:0] decExReg_rs2; // @[ThreeCats.scala 115:25]
  wire [31:0] v2 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs2 ? exFwdReg_wbData : 32'h0; // @[ThreeCats.scala 120:15]
  wire  _doBranch_T_1 = 3'h1 == decExReg_func3; // @[Functions.scala 155:20]
  wire  _doBranch_T_2 = 3'h4 == decExReg_func3; // @[Functions.scala 155:20]
  wire [31:0] _doBranch_res_T_2 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs1 ? exFwdReg_wbData : 32'h0; // @[Functions.scala 163:20]
  wire [31:0] _doBranch_res_T_3 = exFwdReg_valid & exFwdReg_wbDest == decExReg_rs2 ? exFwdReg_wbData : 32'h0; // @[Functions.scala 163:33]
  wire  _doBranch_T_3 = 3'h5 == decExReg_func3; // @[Functions.scala 155:20]
  wire  _GEN_249 = 3'h7 == decExReg_func3 & v1 >= v2; // @[Functions.scala 155:20 172:13 154:9]
  wire  _GEN_250 = 3'h6 == decExReg_func3 ? v1 < v2 : _GEN_249; // @[Functions.scala 155:20 169:13]
  wire  _GEN_251 = 3'h5 == decExReg_func3 ? $signed(_doBranch_res_T_2) >= $signed(_doBranch_res_T_3) : _GEN_250; // @[Functions.scala 155:20 166:13]
  wire  _GEN_252 = 3'h4 == decExReg_func3 ? $signed(_doBranch_res_T_2) < $signed(_doBranch_res_T_3) : _GEN_251; // @[Functions.scala 155:20 163:13]
  wire  _GEN_253 = 3'h1 == decExReg_func3 ? v1 != v2 : _GEN_252; // @[Functions.scala 155:20 160:13]
  wire  doBranch_res = 3'h0 == decExReg_func3 ? v1 == v2 : _GEN_253; // @[Functions.scala 155:20 157:13]
  reg  decExReg_decOut_isBranch; // @[ThreeCats.scala 115:25]
  reg  decExReg_decOut_isJal; // @[ThreeCats.scala 115:25]
  reg  decExReg_decOut_isJalr; // @[ThreeCats.scala 115:25]
  reg  decExReg_valid; // @[ThreeCats.scala 115:25]
  wire  doBranch = (doBranch_res & decExReg_decOut_isBranch | decExReg_decOut_isJal | decExReg_decOut_isJalr) &
    decExReg_valid; // @[ThreeCats.scala 145:130]
  reg  decExReg_decOut_isLoad; // @[ThreeCats.scala 115:25]
  wire  _T_13 = ~doBranch; // @[ThreeCats.scala 149:34]
  reg [1:0] decExReg_memLow; // @[ThreeCats.scala 115:25]
  wire  _res_T_17 = 2'h0 == decExReg_memLow; // @[Functions.scala 271:24]
  wire [23:0] _res_res_T_21 = io_dmem_rdData[7] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_23 = {_res_res_T_21,io_dmem_rdData[7:0]}; // @[Functions.scala 273:38]
  wire  _res_T_18 = 2'h1 == decExReg_memLow; // @[Functions.scala 271:24]
  wire [23:0] _res_res_T_26 = io_dmem_rdData[15] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_28 = {_res_res_T_26,io_dmem_rdData[15:8]}; // @[Functions.scala 276:39]
  wire  _res_T_19 = 2'h2 == decExReg_memLow; // @[Functions.scala 271:24]
  wire [23:0] _res_res_T_31 = io_dmem_rdData[23] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_33 = {_res_res_T_31,io_dmem_rdData[23:16]}; // @[Functions.scala 279:39]
  wire  _res_T_20 = 2'h3 == decExReg_memLow; // @[Functions.scala 271:24]
  wire [23:0] _res_res_T_36 = io_dmem_rdData[31] ? 24'hffffff : 24'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_38 = {_res_res_T_36,io_dmem_rdData[31:24]}; // @[Functions.scala 283:39]
  wire [31:0] _GEN_255 = 2'h3 == decExReg_memLow ? _res_res_T_38 : io_dmem_rdData; // @[Functions.scala 271:24 283:17 268:9]
  wire [31:0] _GEN_256 = 2'h2 == decExReg_memLow ? _res_res_T_33 : _GEN_255; // @[Functions.scala 271:24 279:17]
  wire [31:0] _GEN_257 = 2'h1 == decExReg_memLow ? _res_res_T_28 : _GEN_256; // @[Functions.scala 271:24 276:17]
  wire [31:0] _GEN_258 = 2'h0 == decExReg_memLow ? _res_res_T_23 : _GEN_257; // @[Functions.scala 271:24 273:17]
  wire [15:0] _res_res_T_41 = io_dmem_rdData[15] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_43 = {_res_res_T_41,io_dmem_rdData[15:0]}; // @[Functions.scala 290:39]
  wire [15:0] _res_res_T_46 = io_dmem_rdData[31] ? 16'hffff : 16'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _res_res_T_48 = {_res_res_T_46,io_dmem_rdData[31:16]}; // @[Functions.scala 293:39]
  wire [31:0] _GEN_259 = _res_T_19 ? _res_res_T_48 : io_dmem_rdData; // @[Functions.scala 288:24 293:17 268:9]
  wire [31:0] _GEN_260 = _res_T_17 ? _res_res_T_43 : _GEN_259; // @[Functions.scala 288:24 290:17]
  wire [31:0] _GEN_261 = _res_T_20 ? {{24'd0}, io_dmem_rdData[31:24]} : io_dmem_rdData; // @[Functions.scala 298:24 309:17 268:9]
  wire [31:0] _GEN_262 = _res_T_19 ? {{24'd0}, io_dmem_rdData[23:16]} : _GEN_261; // @[Functions.scala 298:24 306:17]
  wire [31:0] _GEN_263 = _res_T_18 ? {{24'd0}, io_dmem_rdData[15:8]} : _GEN_262; // @[Functions.scala 298:24 303:17]
  wire [31:0] _GEN_264 = _res_T_17 ? {{24'd0}, io_dmem_rdData[7:0]} : _GEN_263; // @[Functions.scala 298:24 300:17]
  wire [31:0] _GEN_265 = _res_T_19 ? {{16'd0}, io_dmem_rdData[31:16]} : io_dmem_rdData; // @[Functions.scala 314:24 319:17 268:9]
  wire [31:0] _GEN_266 = _res_T_17 ? {{16'd0}, io_dmem_rdData[15:0]} : _GEN_265; // @[Functions.scala 314:24 316:17]
  wire [31:0] _GEN_267 = _doBranch_T_3 ? _GEN_266 : io_dmem_rdData; // @[Functions.scala 269:19 268:9]
  wire [31:0] _GEN_268 = _doBranch_T_2 ? _GEN_264 : _GEN_267; // @[Functions.scala 269:19]
  wire [31:0] _GEN_269 = _doBranch_T_1 ? _GEN_260 : _GEN_268; // @[Functions.scala 269:19]
  wire [31:0] res_res_1 = _doBranch_T ? _GEN_258 : _GEN_269; // @[Functions.scala 269:19]
  reg  decExReg_decOut_isCssrw; // @[ThreeCats.scala 115:25]
  reg [31:0] decExReg_csrVal; // @[ThreeCats.scala 115:25]
  reg  decExReg_decOut_isAuiPc; // @[ThreeCats.scala 115:25]
  reg [31:0] decExReg_pc; // @[ThreeCats.scala 115:25]
  reg [31:0] decExReg_decOut_imm; // @[ThreeCats.scala 115:25]
  wire [31:0] _res_T_15 = $signed(decExReg_pc) + $signed(decExReg_decOut_imm); // @[ThreeCats.scala 129:55]
  reg  decExReg_decOut_isLui; // @[ThreeCats.scala 115:25]
  reg [3:0] decExReg_decOut_aluOp; // @[ThreeCats.scala 115:25]
  reg  decExReg_decOut_isImm; // @[ThreeCats.scala 115:25]
  wire [31:0] val2 = decExReg_decOut_isImm ? decExReg_decOut_imm : v2; // @[ThreeCats.scala 123:17]
  wire [31:0] _res_res_T_1 = v1 + val2; // @[Functions.scala 233:18]
  wire [31:0] _res_res_T_3 = v1 - val2; // @[Functions.scala 236:18]
  wire [31:0] _res_res_T_4 = v1 & val2; // @[Functions.scala 239:18]
  wire [31:0] _res_res_T_5 = v1 | val2; // @[Functions.scala 242:18]
  wire [31:0] _res_res_T_6 = v1 ^ val2; // @[Functions.scala 245:18]
  wire [62:0] _GEN_8 = {{31'd0}, v1}; // @[Functions.scala 248:18]
  wire [62:0] _res_res_T_8 = _GEN_8 << val2[4:0]; // @[Functions.scala 248:18]
  wire [31:0] _res_res_T_10 = v1 >> val2[4:0]; // @[Functions.scala 251:18]
  wire [31:0] _res_res_T_14 = $signed(_doBranch_res_T_2) >>> val2[4:0]; // @[Functions.scala 254:38]
  wire [31:0] _res_res_T_16 = decExReg_decOut_isImm ? decExReg_decOut_imm : v2; // @[Functions.scala 257:30]
  wire  _res_res_T_18 = v1 < val2; // @[Functions.scala 260:19]
  wire  _GEN_235 = 4'h3 == decExReg_decOut_aluOp ? $signed(_doBranch_res_T_2) < $signed(_res_res_T_16) : _res_res_T_18; // @[Functions.scala 231:16 257:13]
  wire [31:0] _GEN_236 = 4'h7 == decExReg_decOut_aluOp ? _res_res_T_14 : {{31'd0}, _GEN_235}; // @[Functions.scala 231:16 254:13]
  wire [31:0] _GEN_237 = 4'h6 == decExReg_decOut_aluOp ? _res_res_T_10 : _GEN_236; // @[Functions.scala 231:16 251:13]
  wire [62:0] _GEN_238 = 4'h2 == decExReg_decOut_aluOp ? _res_res_T_8 : {{31'd0}, _GEN_237}; // @[Functions.scala 231:16 248:13]
  wire [62:0] _GEN_239 = 4'h5 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_6} : _GEN_238; // @[Functions.scala 231:16 245:13]
  wire [62:0] _GEN_240 = 4'h8 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_5} : _GEN_239; // @[Functions.scala 231:16 242:13]
  wire [62:0] _GEN_241 = 4'h9 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_4} : _GEN_240; // @[Functions.scala 231:16 239:13]
  wire [62:0] _GEN_242 = 4'h1 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_3} : _GEN_241; // @[Functions.scala 231:16 236:13]
  wire [62:0] _GEN_243 = 4'h0 == decExReg_decOut_aluOp ? {{31'd0}, _res_res_T_1} : _GEN_242; // @[Functions.scala 231:16 233:13]
  wire [31:0] res_res = _GEN_243[31:0]; // @[Functions.scala 229:19]
  wire [31:0] _GEN_244 = decExReg_decOut_isLui ? decExReg_decOut_imm : res_res; // @[ThreeCats.scala 125:31 124:7 126:9]
  wire [31:0] _GEN_245 = decExReg_decOut_isAuiPc ? _res_T_15 : _GEN_244; // @[ThreeCats.scala 128:33 129:9]
  wire [31:0] _GEN_246 = decExReg_decOut_isCssrw ? decExReg_csrVal : _GEN_245; // @[ThreeCats.scala 131:33 132:9]
  wire [31:0] res = decExReg_decOut_isLoad & ~doBranch ? res_res_1 : _GEN_246; // @[ThreeCats.scala 149:45 150:9]
  reg [31:0] pcRegReg; // @[ThreeCats.scala 54:25]
  reg [31:0] instrReg; // @[ThreeCats.scala 55:25]
  reg [4:0] decExReg_rd; // @[ThreeCats.scala 115:25]
  reg  decExReg_decOut_rfWrite; // @[ThreeCats.scala 115:25]
  wire  wrEna = decExReg_valid & decExReg_decOut_rfWrite; // @[ThreeCats.scala 146:27]
  wire  _T_1 = wrEna & decExReg_rd != 5'h0; // @[Functions.scala 210:18]
  wire [31:0] _wbData_T_1 = decExReg_pc + 32'h4; // @[ThreeCats.scala 138:27]
  wire [31:0] wbData = decExReg_decOut_isJal | decExReg_decOut_isJalr ? _wbData_T_1 : res; // @[ThreeCats.scala 136:10 137:57 138:12]
  wire [6:0] decOut_opcode = instrReg[6:0]; // @[Functions.scala 17:29]
  wire [2:0] decOut_func3 = instrReg[14:12]; // @[Functions.scala 18:28]
  wire  _GEN_78 = decOut_func3 == 3'h0 ? 1'h0 : 1'h1; // @[Functions.scala 31:20 87:30 90:26]
  wire  _GEN_87 = 7'h73 == decOut_opcode ? _GEN_78 : 7'h2f == decOut_opcode; // @[Functions.scala 37:20]
  wire  _GEN_90 = 7'h67 == decOut_opcode | 7'h73 == decOut_opcode; // @[Functions.scala 37:20 80:26]
  wire  _GEN_92 = 7'h67 == decOut_opcode | _GEN_87; // @[Functions.scala 37:20 82:24]
  wire  _GEN_94 = 7'h67 == decOut_opcode ? 1'h0 : 7'h73 == decOut_opcode & _GEN_78; // @[Functions.scala 31:20 37:20]
  wire [2:0] _GEN_97 = 7'h6f == decOut_opcode ? 3'h5 : {{2'd0}, _GEN_90}; // @[Functions.scala 37:20 75:26]
  wire  _GEN_98 = 7'h6f == decOut_opcode | _GEN_92; // @[Functions.scala 37:20 76:24]
  wire  _GEN_100 = 7'h6f == decOut_opcode ? 1'h0 : 7'h67 == decOut_opcode; // @[Functions.scala 21:18 37:20]
  wire  _GEN_102 = 7'h6f == decOut_opcode ? 1'h0 : _GEN_94; // @[Functions.scala 31:20 37:20]
  wire [2:0] _GEN_105 = 7'h17 == decOut_opcode ? 3'h4 : _GEN_97; // @[Functions.scala 37:20 70:26]
  wire  _GEN_106 = 7'h17 == decOut_opcode | _GEN_98; // @[Functions.scala 37:20 71:24]
  wire  _GEN_108 = 7'h17 == decOut_opcode ? 1'h0 : 7'h6f == decOut_opcode; // @[Functions.scala 27:18 37:20]
  wire  _GEN_109 = 7'h17 == decOut_opcode ? 1'h0 : _GEN_100; // @[Functions.scala 21:18 37:20]
  wire  _GEN_111 = 7'h17 == decOut_opcode ? 1'h0 : _GEN_102; // @[Functions.scala 31:20 37:20]
  wire [2:0] _GEN_114 = 7'h37 == decOut_opcode ? 3'h4 : _GEN_105; // @[Functions.scala 37:20 65:26]
  wire  _GEN_115 = 7'h37 == decOut_opcode | _GEN_106; // @[Functions.scala 37:20 66:24]
  wire  _GEN_117 = 7'h37 == decOut_opcode ? 1'h0 : 7'h17 == decOut_opcode; // @[Functions.scala 23:20 37:20]
  wire  _GEN_118 = 7'h37 == decOut_opcode ? 1'h0 : _GEN_108; // @[Functions.scala 27:18 37:20]
  wire  _GEN_119 = 7'h37 == decOut_opcode ? 1'h0 : _GEN_109; // @[Functions.scala 21:18 37:20]
  wire  _GEN_121 = 7'h37 == decOut_opcode ? 1'h0 : _GEN_111; // @[Functions.scala 31:20 37:20]
  wire [2:0] _GEN_124 = 7'h23 == decOut_opcode ? 3'h2 : _GEN_114; // @[Functions.scala 37:20 61:26]
  wire  _GEN_126 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_115; // @[Functions.scala 29:20 37:20]
  wire  _GEN_127 = 7'h23 == decOut_opcode ? 1'h0 : 7'h37 == decOut_opcode; // @[Functions.scala 22:18 37:20]
  wire  _GEN_128 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_117; // @[Functions.scala 23:20 37:20]
  wire  _GEN_129 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_118; // @[Functions.scala 27:18 37:20]
  wire  _GEN_130 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_119; // @[Functions.scala 21:18 37:20]
  wire  _GEN_132 = 7'h23 == decOut_opcode ? 1'h0 : _GEN_121; // @[Functions.scala 31:20 37:20]
  wire [2:0] _GEN_135 = 7'h3 == decOut_opcode ? 3'h1 : _GEN_124; // @[Functions.scala 37:20 56:26]
  wire  _GEN_136 = 7'h3 == decOut_opcode | _GEN_126; // @[Functions.scala 37:20 57:24]
  wire  _GEN_138 = 7'h3 == decOut_opcode ? 1'h0 : 7'h23 == decOut_opcode; // @[Functions.scala 25:20 37:20]
  wire  _GEN_139 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_127; // @[Functions.scala 22:18 37:20]
  wire  _GEN_140 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_128; // @[Functions.scala 23:20 37:20]
  wire  _GEN_141 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_129; // @[Functions.scala 27:18 37:20]
  wire  _GEN_142 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_130; // @[Functions.scala 21:18 37:20]
  wire  _GEN_144 = 7'h3 == decOut_opcode ? 1'h0 : _GEN_132; // @[Functions.scala 31:20 37:20]
  wire [2:0] _GEN_147 = 7'h63 == decOut_opcode ? 3'h3 : _GEN_135; // @[Functions.scala 37:20 51:26]
  wire  _GEN_148 = 7'h63 == decOut_opcode | _GEN_142; // @[Functions.scala 37:20 52:22]
  wire  _GEN_150 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_136; // @[Functions.scala 29:20 37:20]
  wire  _GEN_151 = 7'h63 == decOut_opcode ? 1'h0 : 7'h3 == decOut_opcode; // @[Functions.scala 24:19 37:20]
  wire  _GEN_152 = 7'h63 == decOut_opcode ? 1'h0 : _GEN_138; // @[Functions.scala 25:20 37:20]
  wire [2:0] _GEN_161 = 7'h33 == decOut_opcode ? 3'h0 : _GEN_147; // @[Functions.scala 37:20 45:26]
  wire  _GEN_162 = 7'h33 == decOut_opcode | _GEN_150; // @[Functions.scala 37:20 46:24]
  wire  _GEN_164 = 7'h33 == decOut_opcode ? 1'h0 : _GEN_148; // @[Functions.scala 21:18 37:20]
  wire  _GEN_166 = 7'h33 == decOut_opcode ? 1'h0 : _GEN_151; // @[Functions.scala 24:19 37:20]
  wire  _GEN_167 = 7'h33 == decOut_opcode ? 1'h0 : _GEN_152; // @[Functions.scala 25:20 37:20]
  wire [2:0] decOut_instrType = 7'h13 == decOut_opcode ? 3'h1 : _GEN_161; // @[Functions.scala 37:20 39:26]
  wire  decOut_isImm = 7'h13 == decOut_opcode | _GEN_164; // @[Functions.scala 37:20 40:22]
  wire  decOut_rfWrite = 7'h13 == decOut_opcode | _GEN_162; // @[Functions.scala 37:20 41:24]
  wire  decOut_isLoad = 7'h13 == decOut_opcode ? 1'h0 : _GEN_166; // @[Functions.scala 24:19 37:20]
  wire  decOut_isStore = 7'h13 == decOut_opcode ? 1'h0 : _GEN_167; // @[Functions.scala 25:20 37:20]
  wire [6:0] decOut_decOut_aluOp_func7 = instrReg[31:25]; // @[Functions.scala 113:28]
  wire  _decOut_decOut_aluOp_T = 3'h0 == decOut_func3; // @[Functions.scala 116:19]
  wire  _decOut_decOut_aluOp_T_5 = decOut_opcode != 7'h13 & decOut_opcode != 7'h67 & decOut_decOut_aluOp_func7 != 7'h0; // @[Functions.scala 119:55]
  wire  _decOut_decOut_aluOp_T_6 = 3'h1 == decOut_func3; // @[Functions.scala 116:19]
  wire  _decOut_decOut_aluOp_T_7 = 3'h2 == decOut_func3; // @[Functions.scala 116:19]
  wire [2:0] _GEN_193 = decOut_decOut_aluOp_func7 == 7'h0 ? 3'h6 : 3'h7; // @[Functions.scala 136:29 137:17 139:17]
  wire [3:0] _GEN_194 = 3'h7 == decOut_func3 ? 4'h9 : 4'h0; // @[Functions.scala 116:19 146:15 115:28]
  wire [3:0] _GEN_195 = 3'h6 == decOut_func3 ? 4'h8 : _GEN_194; // @[Functions.scala 116:19 143:15]
  wire [3:0] _GEN_196 = 3'h5 == decOut_func3 ? {{1'd0}, _GEN_193} : _GEN_195; // @[Functions.scala 116:19]
  wire [3:0] _GEN_197 = 3'h4 == decOut_func3 ? 4'h5 : _GEN_196; // @[Functions.scala 116:19 133:15]
  wire [3:0] _GEN_198 = 3'h3 == decOut_func3 ? 4'h4 : _GEN_197; // @[Functions.scala 116:19 130:15]
  wire [11:0] _decOut_decOut_imm_imm_T_1 = instrReg[31:20]; // @[Functions.scala 181:32]
  wire [19:0] _decOut_decOut_imm_imm_T_4 = instrReg[31] ? 20'hfffff : 20'h0; // @[Bitwise.scala 77:12]
  wire [31:0] _decOut_decOut_imm_imm_T_7 = {_decOut_decOut_imm_imm_T_4,instrReg[31:20]}; // @[Functions.scala 184:67]
  wire [31:0] _decOut_decOut_imm_imm_T_15 = {_decOut_decOut_imm_imm_T_4,decOut_decOut_aluOp_func7,instrReg[11:7]}; // @[Functions.scala 187:89]
  wire [18:0] _decOut_decOut_imm_imm_T_18 = instrReg[31] ? 19'h7ffff : 19'h0; // @[Bitwise.scala 77:12]
  wire [30:0] _decOut_decOut_imm_imm_T_26 = {_decOut_decOut_imm_imm_T_18,instrReg[7],instrReg[30:25],instrReg[11:8],1'h0
    }; // @[Functions.scala 190:119]
  wire [31:0] _decOut_decOut_imm_imm_T_30 = {instrReg[31:12],12'h0}; // @[Functions.scala 193:55]
  wire [10:0] _decOut_decOut_imm_imm_T_33 = instrReg[31] ? 11'h7ff : 11'h0; // @[Bitwise.scala 77:12]
  wire [30:0] _decOut_decOut_imm_imm_T_41 = {_decOut_decOut_imm_imm_T_33,instrReg[19:12],instrReg[20],instrReg[30:21],1'h0
    }; // @[Functions.scala 196:121]
  wire [30:0] _GEN_202 = 3'h5 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_41) : $signed({{19{
    _decOut_decOut_imm_imm_T_1[11]}},_decOut_decOut_imm_imm_T_1}); // @[Functions.scala 182:23 196:13 181:9]
  wire [31:0] _GEN_203 = 3'h4 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_30) : $signed({{1{_GEN_202[30]}},
    _GEN_202}); // @[Functions.scala 182:23 193:13]
  wire [31:0] _GEN_204 = 3'h3 == decOut_instrType ? $signed({{1{_decOut_decOut_imm_imm_T_26[30]}},
    _decOut_decOut_imm_imm_T_26}) : $signed(_GEN_203); // @[Functions.scala 182:23 190:13]
  wire [31:0] _GEN_205 = 3'h2 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_15) : $signed(_GEN_204); // @[Functions.scala 182:23 187:13]
  wire [31:0] decOut_decOut_imm_imm = 3'h1 == decOut_instrType ? $signed(_decOut_decOut_imm_imm_T_7) : $signed(_GEN_205)
    ; // @[Functions.scala 182:23 184:13]
  wire [4:0] decEx_rs1 = instrReg[19:15]; // @[ThreeCats.scala 84:24]
  wire [4:0] decEx_rs2 = instrReg[24:20]; // @[ThreeCats.scala 85:24]
  wire [31:0] data = _T_1 & decExReg_rd == decEx_rs2 ? wbData : 32'h0; // @[ThreeCats.scala 94:17]
  wire [31:0] _memAddress_T = _T_1 & decExReg_rd == decEx_rs1 ? wbData : 32'h0; // @[ThreeCats.scala 96:29]
  wire [31:0] memAddress = $signed(_memAddress_T) + $signed(decOut_decOut_imm_imm); // @[ThreeCats.scala 96:50]
  wire [1:0] decEx_memLow = memAddress[1:0]; // @[ThreeCats.scala 97:29]
  wire [31:0] _wrData_T_6 = {data[7:0],data[7:0],data[7:0],data[7:0]}; // @[Functions.scala 332:58]
  wire  _GEN_208 = 2'h0 == decEx_memLow; // @[Functions.scala 333:{26,26} 329:27]
  wire  _GEN_209 = 2'h1 == decEx_memLow; // @[Functions.scala 333:{26,26} 329:27]
  wire  _GEN_210 = 2'h2 == decEx_memLow; // @[Functions.scala 333:{26,26} 329:27]
  wire  _GEN_211 = 2'h3 == decEx_memLow; // @[Functions.scala 333:{26,26} 329:27]
  wire [31:0] _wrData_T_9 = {data[15:0],data[15:0]}; // @[Functions.scala 336:31]
  wire  _GEN_214 = _GEN_208 ? 1'h0 : _GEN_210; // @[Functions.scala 337:24 329:27]
  wire [31:0] _GEN_219 = _decOut_decOut_aluOp_T_6 ? _wrData_T_9 : data; // @[Functions.scala 330:19 336:16 328:29]
  wire  _GEN_220 = _decOut_decOut_aluOp_T_6 ? _GEN_208 : _decOut_decOut_aluOp_T_7; // @[Functions.scala 330:19]
  wire  _GEN_222 = _decOut_decOut_aluOp_T_6 ? _GEN_214 : _decOut_decOut_aluOp_T_7; // @[Functions.scala 330:19]
  wire [31:0] wrd = _decOut_decOut_aluOp_T ? _wrData_T_6 : _GEN_219; // @[Functions.scala 330:19 332:16]
  wire  wre_0 = _decOut_decOut_aluOp_T ? _GEN_208 : _GEN_220; // @[Functions.scala 330:19]
  wire  wre_1 = _decOut_decOut_aluOp_T ? _GEN_209 : _GEN_220; // @[Functions.scala 330:19]
  wire  wre_2 = _decOut_decOut_aluOp_T ? _GEN_210 : _GEN_222; // @[Functions.scala 330:19]
  wire  wre_3 = _decOut_decOut_aluOp_T ? _GEN_211 : _GEN_222; // @[Functions.scala 330:19]
  wire [31:0] decEx_csrVal = csr_io_data; // @[ThreeCats.scala 68:19 89:16]
  Csr csr ( // @[ThreeCats.scala 62:19]
    .io_address(csr_io_address),
    .io_data(csr_io_data)
  );
  assign io_dmem_rdAddress = $signed(_memAddress_T) + $signed(decOut_decOut_imm_imm); // @[ThreeCats.scala 96:50]
  assign io_dmem_rdEnable = decOut_isLoad & _T_13; // @[ThreeCats.scala 104:22]
  assign io_dmem_wrAddress = $signed(_memAddress_T) + $signed(decOut_decOut_imm_imm); // @[ThreeCats.scala 96:50]
  assign io_dmem_wrData = decOut_isStore & _T_13 ? wrd : data; // @[ThreeCats.scala 102:18 107:37 109:20]
  assign io_dmem_wrEnable_0 = decOut_isStore & _T_13 & wre_0; // @[ThreeCats.scala 103:20 107:37 110:22]
  assign io_dmem_wrEnable_1 = decOut_isStore & _T_13 & wre_1; // @[ThreeCats.scala 103:20 107:37 110:22]
  assign io_dmem_wrEnable_2 = decOut_isStore & _T_13 & wre_2; // @[ThreeCats.scala 103:20 107:37 110:22]
  assign io_dmem_wrEnable_3 = decOut_isStore & _T_13 & wre_3; // @[ThreeCats.scala 103:20 107:37 110:22]
  assign csr_io_address = instrReg[31:20]; // @[ThreeCats.scala 63:29]
  always @(posedge clock) begin
    if (reset) begin // @[ThreeCats.scala 36:25]
      exFwdReg_valid <= 1'h0; // @[ThreeCats.scala 36:25]
    end else begin
      exFwdReg_valid <= _T_1; // @[ThreeCats.scala 155:18]
    end
    if (reset) begin // @[ThreeCats.scala 36:25]
      exFwdReg_wbDest <= 5'h0; // @[ThreeCats.scala 36:25]
    end else begin
      exFwdReg_wbDest <= decExReg_rd; // @[ThreeCats.scala 156:19]
    end
    if (reset) begin // @[ThreeCats.scala 36:25]
      exFwdReg_wbData <= 32'h0; // @[ThreeCats.scala 36:25]
    end else if (decExReg_decOut_isJal | decExReg_decOut_isJalr) begin // @[ThreeCats.scala 137:57]
      exFwdReg_wbData <= _wbData_T_1; // @[ThreeCats.scala 138:12]
    end else if (decExReg_decOut_isLoad & ~doBranch) begin // @[ThreeCats.scala 149:45]
      if (_doBranch_T) begin // @[Functions.scala 269:19]
        exFwdReg_wbData <= _GEN_258;
      end else begin
        exFwdReg_wbData <= _GEN_269;
      end
    end else if (decExReg_decOut_isCssrw) begin // @[ThreeCats.scala 131:33]
      exFwdReg_wbData <= decExReg_csrVal; // @[ThreeCats.scala 132:9]
    end else begin
      exFwdReg_wbData <= _GEN_245;
    end
    if (reset) begin // @[ThreeCats.scala 41:22]
      pcReg <= 32'h0; // @[ThreeCats.scala 41:22]
    end else if (doBranch) begin // @[ThreeCats.scala 42:31]
      if (decExReg_decOut_isJalr) begin // @[ThreeCats.scala 142:32]
        if (decExReg_decOut_isLoad & ~doBranch) begin // @[ThreeCats.scala 149:45]
          pcReg <= res_res_1; // @[ThreeCats.scala 150:9]
        end else begin
          pcReg <= _GEN_246;
        end
      end else begin
        pcReg <= _res_T_15; // @[ThreeCats.scala 141:16]
      end
    end else begin
      pcReg <= _pcNext_T_1;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_func3 <= 3'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_func3 <= decOut_func3; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_rs1 <= 5'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_rs1 <= decEx_rs1; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_rs2 <= 5'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_rs2 <= decEx_rs2; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isBranch <= 1'h0; // @[ThreeCats.scala 115:25]
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isBranch <= 1'h0; // @[Functions.scala 26:21]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isBranch <= 1'h0; // @[Functions.scala 26:21]
    end else begin
      decExReg_decOut_isBranch <= 7'h63 == decOut_opcode;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isJal <= 1'h0; // @[ThreeCats.scala 115:25]
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isJal <= 1'h0; // @[Functions.scala 27:18]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isJal <= 1'h0; // @[Functions.scala 27:18]
    end else if (7'h63 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isJal <= 1'h0; // @[Functions.scala 27:18]
    end else begin
      decExReg_decOut_isJal <= _GEN_141;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isJalr <= 1'h0; // @[ThreeCats.scala 115:25]
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isJalr <= 1'h0; // @[Functions.scala 28:19]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isJalr <= 1'h0; // @[Functions.scala 28:19]
    end else if (7'h63 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isJalr <= 1'h0; // @[Functions.scala 28:19]
    end else begin
      decExReg_decOut_isJalr <= _GEN_142;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_valid <= 1'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_valid <= _T_13; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isLoad <= 1'h0; // @[ThreeCats.scala 115:25]
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isLoad <= 1'h0; // @[Functions.scala 24:19]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isLoad <= 1'h0; // @[Functions.scala 24:19]
    end else if (7'h63 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isLoad <= 1'h0; // @[Functions.scala 24:19]
    end else begin
      decExReg_decOut_isLoad <= 7'h3 == decOut_opcode;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_memLow <= 2'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_memLow <= decEx_memLow; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isCssrw <= 1'h0; // @[ThreeCats.scala 115:25]
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isCssrw <= 1'h0; // @[Functions.scala 31:20]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isCssrw <= 1'h0; // @[Functions.scala 31:20]
    end else if (7'h63 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isCssrw <= 1'h0; // @[Functions.scala 31:20]
    end else begin
      decExReg_decOut_isCssrw <= _GEN_144;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_csrVal <= 32'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_csrVal <= decEx_csrVal; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isAuiPc <= 1'h0; // @[ThreeCats.scala 115:25]
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isAuiPc <= 1'h0; // @[Functions.scala 23:20]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isAuiPc <= 1'h0; // @[Functions.scala 23:20]
    end else if (7'h63 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isAuiPc <= 1'h0; // @[Functions.scala 23:20]
    end else begin
      decExReg_decOut_isAuiPc <= _GEN_140;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_pc <= 32'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_pc <= pcRegReg; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_imm <= 32'sh0; // @[ThreeCats.scala 115:25]
    end else if (3'h1 == decOut_instrType) begin // @[Functions.scala 182:23]
      decExReg_decOut_imm <= _decOut_decOut_imm_imm_T_7; // @[Functions.scala 184:13]
    end else if (3'h2 == decOut_instrType) begin // @[Functions.scala 182:23]
      decExReg_decOut_imm <= _decOut_decOut_imm_imm_T_15; // @[Functions.scala 187:13]
    end else if (3'h3 == decOut_instrType) begin // @[Functions.scala 182:23]
      decExReg_decOut_imm <= {{1{_decOut_decOut_imm_imm_T_26[30]}},_decOut_decOut_imm_imm_T_26}; // @[Functions.scala 190:13]
    end else begin
      decExReg_decOut_imm <= _GEN_203;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isLui <= 1'h0; // @[ThreeCats.scala 115:25]
    end else if (7'h13 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isLui <= 1'h0; // @[Functions.scala 22:18]
    end else if (7'h33 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isLui <= 1'h0; // @[Functions.scala 22:18]
    end else if (7'h63 == decOut_opcode) begin // @[Functions.scala 37:20]
      decExReg_decOut_isLui <= 1'h0; // @[Functions.scala 22:18]
    end else begin
      decExReg_decOut_isLui <= _GEN_139;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_aluOp <= 4'h0; // @[ThreeCats.scala 115:25]
    end else if (3'h0 == decOut_func3) begin // @[Functions.scala 116:19]
      decExReg_decOut_aluOp <= {{3'd0}, _decOut_decOut_aluOp_T_5};
    end else if (3'h1 == decOut_func3) begin // @[Functions.scala 116:19]
      decExReg_decOut_aluOp <= 4'h2; // @[Functions.scala 124:15]
    end else if (3'h2 == decOut_func3) begin // @[Functions.scala 116:19]
      decExReg_decOut_aluOp <= 4'h3; // @[Functions.scala 127:15]
    end else begin
      decExReg_decOut_aluOp <= _GEN_198;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_isImm <= 1'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_decOut_isImm <= decOut_isImm; // @[ThreeCats.scala 116:12]
    end
    pcRegReg <= pcReg; // @[ThreeCats.scala 54:25]
    if (reset) begin // @[ThreeCats.scala 55:25]
      instrReg <= 32'h33; // @[ThreeCats.scala 55:25]
    end else if (doBranch) begin // @[ThreeCats.scala 56:18]
      instrReg <= 32'h33;
    end else begin
      instrReg <= 32'h0;
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_rd <= 5'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_rd <= instrReg[11:7]; // @[ThreeCats.scala 116:12]
    end
    if (reset) begin // @[ThreeCats.scala 115:25]
      decExReg_decOut_rfWrite <= 1'h0; // @[ThreeCats.scala 115:25]
    end else begin
      decExReg_decOut_rfWrite <= decOut_rfWrite; // @[ThreeCats.scala 116:12]
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
  exFwdReg_valid = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  exFwdReg_wbDest = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  exFwdReg_wbData = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  pcReg = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  decExReg_func3 = _RAND_4[2:0];
  _RAND_5 = {1{`RANDOM}};
  decExReg_rs1 = _RAND_5[4:0];
  _RAND_6 = {1{`RANDOM}};
  decExReg_rs2 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  decExReg_decOut_isBranch = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  decExReg_decOut_isJal = _RAND_8[0:0];
  _RAND_9 = {1{`RANDOM}};
  decExReg_decOut_isJalr = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  decExReg_valid = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  decExReg_decOut_isLoad = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  decExReg_memLow = _RAND_12[1:0];
  _RAND_13 = {1{`RANDOM}};
  decExReg_decOut_isCssrw = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  decExReg_csrVal = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  decExReg_decOut_isAuiPc = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  decExReg_pc = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  decExReg_decOut_imm = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  decExReg_decOut_isLui = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  decExReg_decOut_aluOp = _RAND_19[3:0];
  _RAND_20 = {1{`RANDOM}};
  decExReg_decOut_isImm = _RAND_20[0:0];
  _RAND_21 = {1{`RANDOM}};
  pcRegReg = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  instrReg = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  decExReg_rd = _RAND_23[4:0];
  _RAND_24 = {1{`RANDOM}};
  decExReg_decOut_rfWrite = _RAND_24[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PipeConInterconnect(
  input         clock,
  input         reset,
  output        io_device_0_rd,
  input  [31:0] io_device_0_rdData,
  output [31:0] io_device_0_wrData,
  output [3:0]  io_device_0_wrMask,
  input         io_device_0_ack,
  output        io_device_1_rd,
  input  [31:0] io_device_1_rdData,
  output [31:0] io_device_1_wrData,
  output [3:0]  io_device_1_wrMask,
  input         io_device_1_ack,
  output [31:0] io_device_2_address,
  output        io_device_2_rd,
  output        io_device_2_wr,
  input  [31:0] io_device_2_rdData,
  output [31:0] io_device_2_wrData,
  input         io_device_2_ack,
  output [31:0] io_device_3_address,
  output        io_device_3_rd,
  output        io_device_3_wr,
  input  [31:0] io_device_3_rdData,
  output [31:0] io_device_3_wrData,
  output [3:0]  io_device_3_wrMask,
  input         io_device_3_ack,
  input  [31:0] io_dmem_rdAddress,
  output [31:0] io_dmem_rdData,
  input         io_dmem_rdEnable,
  input  [31:0] io_dmem_wrAddress,
  input  [31:0] io_dmem_wrData,
  input         io_dmem_wrEnable_0,
  input         io_dmem_wrEnable_1,
  input         io_dmem_wrEnable_2,
  input         io_dmem_wrEnable_3
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
  reg [31:0] rdDataReg; // @[PipeConInterconnect.scala 14:31]
  reg [15:0] ackCounter; // @[PipeConInterconnect.scala 15:31]
  reg [1:0] selectedIdx; // @[PipeConInterconnect.scala 18:32]
  reg  selectedRd; // @[PipeConInterconnect.scala 19:32]
  reg  selectedWr; // @[PipeConInterconnect.scala 20:32]
  reg [31:0] selectedAddress; // @[PipeConInterconnect.scala 21:32]
  reg [31:0] selectedWrData; // @[PipeConInterconnect.scala 22:32]
  reg [3:0] selectedWrMask; // @[PipeConInterconnect.scala 23:32]
  reg  state; // @[PipeConInterconnect.scala 26:22]
  wire  _GEN_8 = 2'h2 == selectedIdx; // @[PipeConInterconnect.scala 30:26 38:{34,34}]
  wire  _GEN_9 = 2'h3 == selectedIdx; // @[PipeConInterconnect.scala 30:26 38:{34,34}]
  wire  _T = ~state; // @[PipeConInterconnect.scala 45:15]
  wire  _T_3 = io_dmem_wrEnable_0 | io_dmem_wrEnable_1 | io_dmem_wrEnable_2 | io_dmem_wrEnable_3; // @[PipeConInterconnect.scala 48:38]
  wire  _T_11 = io_dmem_rdEnable & io_dmem_rdAddress <= 32'hf; // @[PipeConInterconnect.scala 49:62]
  wire  _T_12 = (io_dmem_wrEnable_0 | io_dmem_wrEnable_1 | io_dmem_wrEnable_2 | io_dmem_wrEnable_3) & io_dmem_wrAddress
     <= 32'hf | _T_11; // @[PipeConInterconnect.scala 48:110]
  wire [1:0] _GEN_20 = _T_12 ? 2'h0 : selectedIdx; // @[PipeConInterconnect.scala 49:95 50:21 18:32]
  wire  _T_23 = io_dmem_rdEnable & io_dmem_rdAddress >= 32'h10 & io_dmem_rdAddress <= 32'h1f; // @[PipeConInterconnect.scala 49:62]
  wire  _T_24 = (io_dmem_wrEnable_0 | io_dmem_wrEnable_1 | io_dmem_wrEnable_2 | io_dmem_wrEnable_3) & io_dmem_wrAddress
     >= 32'h10 & io_dmem_wrAddress <= 32'h1f | _T_23; // @[PipeConInterconnect.scala 48:110]
  wire [1:0] _GEN_21 = _T_24 ? 2'h1 : _GEN_20; // @[PipeConInterconnect.scala 49:95 50:21]
  wire  _T_35 = io_dmem_rdEnable & io_dmem_rdAddress >= 32'h20 & io_dmem_rdAddress <= 32'h2f; // @[PipeConInterconnect.scala 49:62]
  wire  _T_36 = (io_dmem_wrEnable_0 | io_dmem_wrEnable_1 | io_dmem_wrEnable_2 | io_dmem_wrEnable_3) & io_dmem_wrAddress
     >= 32'h20 & io_dmem_wrAddress <= 32'h2f | _T_35; // @[PipeConInterconnect.scala 48:110]
  wire  _T_47 = io_dmem_rdEnable & io_dmem_rdAddress >= 32'h10000000 & io_dmem_rdAddress <= 32'h1fffffff; // @[PipeConInterconnect.scala 49:62]
  wire  _T_48 = (io_dmem_wrEnable_0 | io_dmem_wrEnable_1 | io_dmem_wrEnable_2 | io_dmem_wrEnable_3) & io_dmem_wrAddress
     >= 32'h10000000 & io_dmem_wrAddress <= 32'h1fffffff | _T_47; // @[PipeConInterconnect.scala 48:110]
  wire [3:0] _selectedWrMask_T = {io_dmem_wrEnable_3,io_dmem_wrEnable_2,io_dmem_wrEnable_1,io_dmem_wrEnable_0}; // @[PipeConInterconnect.scala 63:45]
  wire  _GEN_26 = 2'h1 == selectedIdx ? io_device_1_ack : io_device_0_ack; // @[PipeConInterconnect.scala 67:{43,43}]
  wire  _GEN_27 = 2'h2 == selectedIdx ? io_device_2_ack : _GEN_26; // @[PipeConInterconnect.scala 67:{43,43}]
  wire  _GEN_28 = 2'h3 == selectedIdx ? io_device_3_ack : _GEN_27; // @[PipeConInterconnect.scala 67:{43,43}]
  wire [31:0] _GEN_31 = 2'h1 == selectedIdx ? io_device_1_rdData : io_device_0_rdData; // @[PipeConInterconnect.scala 77:{25,25}]
  wire [31:0] _GEN_32 = 2'h2 == selectedIdx ? io_device_2_rdData : _GEN_31; // @[PipeConInterconnect.scala 77:{25,25}]
  wire [31:0] _GEN_33 = 2'h3 == selectedIdx ? io_device_3_rdData : _GEN_32; // @[PipeConInterconnect.scala 77:{25,25}]
  wire  _GEN_34 = io_dmem_rdEnable ? 1'h0 : selectedWr; // @[PipeConInterconnect.scala 73:38 74:25 20:32]
  wire  _GEN_35 = io_dmem_rdEnable | selectedRd; // @[PipeConInterconnect.scala 73:38 75:25 19:32]
  wire  _GEN_38 = _T_3 | _GEN_34; // @[PipeConInterconnect.scala 58:46 59:25]
  wire [15:0] _ackCounter_T_1 = ackCounter + 16'h1; // @[PipeConInterconnect.scala 87:34]
  assign io_device_0_rd = 2'h0 == selectedIdx & selectedRd; // @[PipeConInterconnect.scala 30:26 38:{34,34}]
  assign io_device_0_wrData = 2'h0 == selectedIdx ? selectedWrData : 32'h0; // @[PipeConInterconnect.scala 33:26 41:{34,34}]
  assign io_device_0_wrMask = 2'h0 == selectedIdx ? selectedWrMask : 4'h0; // @[PipeConInterconnect.scala 34:26 42:{34,34}]
  assign io_device_1_rd = 2'h1 == selectedIdx & selectedRd; // @[PipeConInterconnect.scala 30:26 38:{34,34}]
  assign io_device_1_wrData = 2'h1 == selectedIdx ? selectedWrData : 32'h0; // @[PipeConInterconnect.scala 33:26 41:{34,34}]
  assign io_device_1_wrMask = 2'h1 == selectedIdx ? selectedWrMask : 4'h0; // @[PipeConInterconnect.scala 34:26 42:{34,34}]
  assign io_device_2_address = 2'h2 == selectedIdx ? selectedAddress : 32'h0; // @[PipeConInterconnect.scala 32:26 40:{34,34}]
  assign io_device_2_rd = 2'h2 == selectedIdx & selectedRd; // @[PipeConInterconnect.scala 30:26 38:{34,34}]
  assign io_device_2_wr = _GEN_8 & selectedWr; // @[PipeConInterconnect.scala 31:26 39:{34,34}]
  assign io_device_2_wrData = 2'h2 == selectedIdx ? selectedWrData : 32'h0; // @[PipeConInterconnect.scala 33:26 41:{34,34}]
  assign io_device_3_address = 2'h3 == selectedIdx ? selectedAddress : 32'h0; // @[PipeConInterconnect.scala 32:26 40:{34,34}]
  assign io_device_3_rd = 2'h3 == selectedIdx & selectedRd; // @[PipeConInterconnect.scala 30:26 38:{34,34}]
  assign io_device_3_wr = _GEN_9 & selectedWr; // @[PipeConInterconnect.scala 31:26 39:{34,34}]
  assign io_device_3_wrData = 2'h3 == selectedIdx ? selectedWrData : 32'h0; // @[PipeConInterconnect.scala 33:26 41:{34,34}]
  assign io_device_3_wrMask = 2'h3 == selectedIdx ? selectedWrMask : 4'h0; // @[PipeConInterconnect.scala 34:26 42:{34,34}]
  assign io_dmem_rdData = rdDataReg; // @[PipeConInterconnect.scala 93:18]
  always @(posedge clock) begin
    if (reset) begin // @[PipeConInterconnect.scala 14:31]
      rdDataReg <= 32'h0; // @[PipeConInterconnect.scala 14:31]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      if (!(_T_3)) begin // @[PipeConInterconnect.scala 58:46]
        if (io_dmem_rdEnable) begin // @[PipeConInterconnect.scala 73:38]
          rdDataReg <= _GEN_33; // @[PipeConInterconnect.scala 77:25]
        end
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 15:31]
      ackCounter <= 16'h0; // @[PipeConInterconnect.scala 15:31]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      if (_T_3) begin // @[PipeConInterconnect.scala 58:46]
        ackCounter <= 16'h0; // @[PipeConInterconnect.scala 64:25]
      end
    end else if (state) begin // @[PipeConInterconnect.scala 56:18]
      if (_GEN_28 | ackCounter >= 16'h14) begin // @[PipeConInterconnect.scala 82:73]
        ackCounter <= 16'h0; // @[PipeConInterconnect.scala 84:20]
      end else begin
        ackCounter <= _ackCounter_T_1; // @[PipeConInterconnect.scala 87:20]
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 18:32]
      selectedIdx <= 2'h0; // @[PipeConInterconnect.scala 18:32]
    end else if (~state) begin // @[PipeConInterconnect.scala 45:26]
      if (_T_48) begin // @[PipeConInterconnect.scala 49:95]
        selectedIdx <= 2'h3; // @[PipeConInterconnect.scala 50:21]
      end else if (_T_36) begin // @[PipeConInterconnect.scala 49:95]
        selectedIdx <= 2'h2; // @[PipeConInterconnect.scala 50:21]
      end else begin
        selectedIdx <= _GEN_21;
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 19:32]
      selectedRd <= 1'h0; // @[PipeConInterconnect.scala 19:32]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      if (_T_3) begin // @[PipeConInterconnect.scala 58:46]
        selectedRd <= 1'h0; // @[PipeConInterconnect.scala 60:25]
      end else begin
        selectedRd <= _GEN_35;
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 20:32]
      selectedWr <= 1'h0; // @[PipeConInterconnect.scala 20:32]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      selectedWr <= _GEN_38;
    end else if (state) begin // @[PipeConInterconnect.scala 56:18]
      if (_GEN_28 | ackCounter >= 16'h14) begin // @[PipeConInterconnect.scala 82:73]
        selectedWr <= 1'h0; // @[PipeConInterconnect.scala 83:20]
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 21:32]
      selectedAddress <= 32'h0; // @[PipeConInterconnect.scala 21:32]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      if (_T_3) begin // @[PipeConInterconnect.scala 58:46]
        selectedAddress <= io_dmem_wrAddress; // @[PipeConInterconnect.scala 61:25]
      end else if (io_dmem_rdEnable) begin // @[PipeConInterconnect.scala 73:38]
        selectedAddress <= io_dmem_rdAddress; // @[PipeConInterconnect.scala 76:25]
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 22:32]
      selectedWrData <= 32'h0; // @[PipeConInterconnect.scala 22:32]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      if (_T_3) begin // @[PipeConInterconnect.scala 58:46]
        selectedWrData <= io_dmem_wrData; // @[PipeConInterconnect.scala 62:25]
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 23:32]
      selectedWrMask <= 4'h0; // @[PipeConInterconnect.scala 23:32]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      if (_T_3) begin // @[PipeConInterconnect.scala 58:46]
        selectedWrMask <= _selectedWrMask_T; // @[PipeConInterconnect.scala 63:25]
      end
    end
    if (reset) begin // @[PipeConInterconnect.scala 26:22]
      state <= 1'h0; // @[PipeConInterconnect.scala 26:22]
    end else if (_T) begin // @[PipeConInterconnect.scala 56:18]
      if (_T_3) begin // @[PipeConInterconnect.scala 58:46]
        if (_GEN_28) begin // @[PipeConInterconnect.scala 67:43]
          state <= 1'h0; // @[PipeConInterconnect.scala 68:17]
        end else begin
          state <= 1'h1; // @[PipeConInterconnect.scala 70:17]
        end
      end
    end else if (state) begin // @[PipeConInterconnect.scala 56:18]
      if (_GEN_28 | ackCounter >= 16'h14) begin // @[PipeConInterconnect.scala 82:73]
        state <= 1'h0; // @[PipeConInterconnect.scala 85:15]
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
  rdDataReg = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  ackCounter = _RAND_1[15:0];
  _RAND_2 = {1{`RANDOM}};
  selectedIdx = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  selectedRd = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  selectedWr = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  selectedAddress = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  selectedWrData = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  selectedWrMask = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  state = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module UARTPeripheral(
  input         clock,
  input         reset,
  input         io_rd,
  output [31:0] io_rdData,
  input  [31:0] io_wrData,
  input  [3:0]  io_wrMask,
  output        io_ack
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] uartMemory; // @[UARTPeripheral.scala 13:27]
  wire [7:0] byteMasks_0 = io_wrMask[0] ? 8'hff : 8'h0; // @[UARTPeripheral.scala 20:8]
  wire [7:0] byteMasks_1 = io_wrMask[1] ? 8'hff : 8'h0; // @[UARTPeripheral.scala 20:8]
  wire [7:0] byteMasks_2 = io_wrMask[2] ? 8'hff : 8'h0; // @[UARTPeripheral.scala 20:8]
  wire [7:0] byteMasks_3 = io_wrMask[3] ? 8'hff : 8'h0; // @[UARTPeripheral.scala 20:8]
  wire [31:0] fullMask = {byteMasks_3,byteMasks_2,byteMasks_1,byteMasks_0}; // @[Cat.scala 33:92]
  wire  _T = |io_wrMask; // @[UARTPeripheral.scala 26:18]
  wire [31:0] _uartMemory_T = io_wrData & fullMask; // @[UARTPeripheral.scala 27:29]
  assign io_rdData = io_rd ? uartMemory : 32'h0; // @[UARTPeripheral.scala 36:15 39:15 42:15]
  assign io_ack = io_rd | _T; // @[UARTPeripheral.scala 36:15 40:12]
  always @(posedge clock) begin
    if (reset) begin // @[UARTPeripheral.scala 13:27]
      uartMemory <= 32'h0; // @[UARTPeripheral.scala 13:27]
    end else if (|io_wrMask) begin // @[UARTPeripheral.scala 26:23]
      uartMemory <= _uartMemory_T; // @[UARTPeripheral.scala 27:16]
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
  uartMemory = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module SPIPeripheral(
  input         clock,
  input         reset,
  input         io_rd,
  output [31:0] io_rdData,
  input  [31:0] io_wrData,
  input  [3:0]  io_wrMask,
  output        io_ack
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] SPIMemory; // @[SPIPeripheral.scala 14:26]
  wire [7:0] byteMasks_0 = io_wrMask[0] ? 8'hff : 8'h0; // @[SPIPeripheral.scala 21:6]
  wire [7:0] byteMasks_1 = io_wrMask[1] ? 8'hff : 8'h0; // @[SPIPeripheral.scala 21:6]
  wire [7:0] byteMasks_2 = io_wrMask[2] ? 8'hff : 8'h0; // @[SPIPeripheral.scala 21:6]
  wire [7:0] byteMasks_3 = io_wrMask[3] ? 8'hff : 8'h0; // @[SPIPeripheral.scala 21:6]
  wire [31:0] fullMask = {byteMasks_3,byteMasks_2,byteMasks_1,byteMasks_0}; // @[Cat.scala 33:92]
  wire  _T = |io_wrMask; // @[SPIPeripheral.scala 27:18]
  wire [31:0] _SPIMemory_T = io_wrData & fullMask; // @[SPIPeripheral.scala 28:28]
  assign io_rdData = io_rd ? SPIMemory : 32'h0; // @[SPIPeripheral.scala 33:15 35:15 38:15]
  assign io_ack = io_rd | _T; // @[SPIPeripheral.scala 33:15 36:12]
  always @(posedge clock) begin
    if (reset) begin // @[SPIPeripheral.scala 14:26]
      SPIMemory <= 32'h0; // @[SPIPeripheral.scala 14:26]
    end else if (|io_wrMask) begin // @[SPIPeripheral.scala 27:23]
      SPIMemory <= _SPIMemory_T; // @[SPIPeripheral.scala 28:15]
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
  SPIMemory = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module GPIOShiftRegister(
  input   clock,
  input   reset,
  output  io_read_data,
  input   io_write_data,
  input   io_rd,
  input   io_wr,
  output  io_conf_output_0,
  output  io_conf_output_1,
  output  io_conf_output_2,
  output  io_conf_output_3,
  output  io_conf_output_4,
  output  io_conf_output_5,
  output  io_conf_output_6,
  output  io_conf_output_7
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
  wire  en_shifting = io_rd | io_wr; // @[GPIOShiftRegister.scala 22:30]
  wire  read_write_mux = io_rd ? io_read_data : io_write_data; // @[GPIOShiftRegister.scala 24:29]
  reg [7:0] shift_reg; // @[GPIOShiftRegister.scala 26:28]
  wire [8:0] _shift_reg_T_1 = {shift_reg,read_write_mux}; // @[GPIOShiftRegister.scala 29:48]
  wire [8:0] _GEN_0 = en_shifting ? _shift_reg_T_1 : {{1'd0}, shift_reg}; // @[GPIOShiftRegister.scala 28:24 29:19 26:28]
  wire  _io_conf_output_0_T_1 = ~en_shifting; // @[GPIOShiftRegister.scala 40:54]
  reg  io_conf_output_0_r; // @[Reg.scala 19:16]
  reg  io_conf_output_1_r; // @[Reg.scala 19:16]
  reg  io_conf_output_2_r; // @[Reg.scala 19:16]
  reg  io_conf_output_3_r; // @[Reg.scala 19:16]
  reg  io_conf_output_4_r; // @[Reg.scala 19:16]
  reg  io_conf_output_5_r; // @[Reg.scala 19:16]
  reg  io_conf_output_6_r; // @[Reg.scala 19:16]
  reg  io_conf_output_7_r; // @[Reg.scala 19:16]
  wire [8:0] _GEN_9 = reset ? 9'h0 : _GEN_0; // @[GPIOShiftRegister.scala 26:{28,28}]
  assign io_read_data = shift_reg[7]; // @[GPIOShiftRegister.scala 31:30]
  assign io_conf_output_0 = io_conf_output_0_r; // @[GPIOShiftRegister.scala 40:27]
  assign io_conf_output_1 = io_conf_output_1_r; // @[GPIOShiftRegister.scala 40:27]
  assign io_conf_output_2 = io_conf_output_2_r; // @[GPIOShiftRegister.scala 40:27]
  assign io_conf_output_3 = io_conf_output_3_r; // @[GPIOShiftRegister.scala 40:27]
  assign io_conf_output_4 = io_conf_output_4_r; // @[GPIOShiftRegister.scala 40:27]
  assign io_conf_output_5 = io_conf_output_5_r; // @[GPIOShiftRegister.scala 40:27]
  assign io_conf_output_6 = io_conf_output_6_r; // @[GPIOShiftRegister.scala 40:27]
  assign io_conf_output_7 = io_conf_output_7_r; // @[GPIOShiftRegister.scala 40:27]
  always @(posedge clock) begin
    shift_reg <= _GEN_9[7:0]; // @[GPIOShiftRegister.scala 26:{28,28}]
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_0_r <= shift_reg[0]; // @[Reg.scala 20:22]
    end
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_1_r <= shift_reg[1]; // @[Reg.scala 20:22]
    end
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_2_r <= shift_reg[2]; // @[Reg.scala 20:22]
    end
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_3_r <= shift_reg[3]; // @[Reg.scala 20:22]
    end
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_4_r <= shift_reg[4]; // @[Reg.scala 20:22]
    end
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_5_r <= shift_reg[5]; // @[Reg.scala 20:22]
    end
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_6_r <= shift_reg[6]; // @[Reg.scala 20:22]
    end
    if (_io_conf_output_0_T_1) begin // @[Reg.scala 20:18]
      io_conf_output_7_r <= shift_reg[7]; // @[Reg.scala 20:22]
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
  shift_reg = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  io_conf_output_0_r = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  io_conf_output_1_r = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  io_conf_output_2_r = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  io_conf_output_3_r = _RAND_4[0:0];
  _RAND_5 = {1{`RANDOM}};
  io_conf_output_4_r = _RAND_5[0:0];
  _RAND_6 = {1{`RANDOM}};
  io_conf_output_5_r = _RAND_6[0:0];
  _RAND_7 = {1{`RANDOM}};
  io_conf_output_6_r = _RAND_7[0:0];
  _RAND_8 = {1{`RANDOM}};
  io_conf_output_7_r = _RAND_8[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Prescaler(
  input        clock,
  input        reset,
  input  [7:0] io_pwm_div,
  output       io_enable_tick
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] counter; // @[Prescaler.scala 12:24]
  wire [7:0] _T_1 = io_pwm_div - 8'h1; // @[Prescaler.scala 16:32]
  wire  tick = counter == _T_1; // @[Prescaler.scala 16:16]
  wire [7:0] _counter_T_1 = counter + 8'h1; // @[Prescaler.scala 20:24]
  assign io_enable_tick = counter == _T_1; // @[Prescaler.scala 16:16]
  always @(posedge clock) begin
    if (reset) begin // @[Prescaler.scala 12:24]
      counter <= 8'h0; // @[Prescaler.scala 12:24]
    end else if (tick) begin // @[Prescaler.scala 16:40]
      counter <= 8'h0; // @[Prescaler.scala 17:13]
    end else begin
      counter <= _counter_T_1; // @[Prescaler.scala 20:13]
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
  counter = _RAND_0[7:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PWMGenerator(
  input        clock,
  input        reset,
  input        io_enable_tick,
  input  [7:0] io_duty_cycle,
  input  [7:0] io_pwm_period,
  input        io_pwm_polarity,
  input        io_pwm_en,
  output       io_pwm_out
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] counter; // @[PWMGenerator.scala 14:24]
  reg  pwm_reg; // @[PWMGenerator.scala 15:24]
  wire [7:0] _T_1 = io_pwm_period - 8'h1; // @[PWMGenerator.scala 26:38]
  wire [7:0] _counter_T_1 = counter + 8'h1; // @[PWMGenerator.scala 29:28]
  wire  _GEN_1 = io_enable_tick ? counter < io_duty_cycle : pwm_reg; // @[PWMGenerator.scala 23:26 24:15 15:24]
  wire  _GEN_3 = io_pwm_en & _GEN_1; // @[PWMGenerator.scala 21:19 36:13]
  assign io_pwm_out = pwm_reg ^ io_pwm_polarity; // @[PWMGenerator.scala 40:25]
  always @(posedge clock) begin
    if (reset) begin // @[PWMGenerator.scala 14:24]
      counter <= 8'h0; // @[PWMGenerator.scala 14:24]
    end else if (io_pwm_en) begin // @[PWMGenerator.scala 21:19]
      if (io_enable_tick) begin // @[PWMGenerator.scala 23:26]
        if (counter == _T_1) begin // @[PWMGenerator.scala 26:45]
          counter <= 8'h0; // @[PWMGenerator.scala 27:17]
        end else begin
          counter <= _counter_T_1; // @[PWMGenerator.scala 29:17]
        end
      end
    end else begin
      counter <= 8'h0; // @[PWMGenerator.scala 35:13]
    end
    if (reset) begin // @[PWMGenerator.scala 15:24]
      pwm_reg <= 1'h0; // @[PWMGenerator.scala 15:24]
    end else begin
      pwm_reg <= _GEN_3;
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
  counter = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  pwm_reg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module PWMTop(
  input        clock,
  input        reset,
  input  [7:0] io_pwm_div,
  input  [7:0] io_duty_cycle,
  input  [7:0] io_pwm_period,
  input        io_pwm_polarity,
  input        io_pwm_en,
  output       io_pwm_out
);
  wire  prescaler_clock; // @[PWMTop.scala 14:27]
  wire  prescaler_reset; // @[PWMTop.scala 14:27]
  wire [7:0] prescaler_io_pwm_div; // @[PWMTop.scala 14:27]
  wire  prescaler_io_enable_tick; // @[PWMTop.scala 14:27]
  wire  pwmGenerator_clock; // @[PWMTop.scala 16:30]
  wire  pwmGenerator_reset; // @[PWMTop.scala 16:30]
  wire  pwmGenerator_io_enable_tick; // @[PWMTop.scala 16:30]
  wire [7:0] pwmGenerator_io_duty_cycle; // @[PWMTop.scala 16:30]
  wire [7:0] pwmGenerator_io_pwm_period; // @[PWMTop.scala 16:30]
  wire  pwmGenerator_io_pwm_polarity; // @[PWMTop.scala 16:30]
  wire  pwmGenerator_io_pwm_en; // @[PWMTop.scala 16:30]
  wire  pwmGenerator_io_pwm_out; // @[PWMTop.scala 16:30]
  Prescaler prescaler ( // @[PWMTop.scala 14:27]
    .clock(prescaler_clock),
    .reset(prescaler_reset),
    .io_pwm_div(prescaler_io_pwm_div),
    .io_enable_tick(prescaler_io_enable_tick)
  );
  PWMGenerator pwmGenerator ( // @[PWMTop.scala 16:30]
    .clock(pwmGenerator_clock),
    .reset(pwmGenerator_reset),
    .io_enable_tick(pwmGenerator_io_enable_tick),
    .io_duty_cycle(pwmGenerator_io_duty_cycle),
    .io_pwm_period(pwmGenerator_io_pwm_period),
    .io_pwm_polarity(pwmGenerator_io_pwm_polarity),
    .io_pwm_en(pwmGenerator_io_pwm_en),
    .io_pwm_out(pwmGenerator_io_pwm_out)
  );
  assign io_pwm_out = pwmGenerator_io_pwm_out; // @[PWMTop.scala 29:16]
  assign prescaler_clock = clock;
  assign prescaler_reset = reset;
  assign prescaler_io_pwm_div = io_pwm_div; // @[PWMTop.scala 19:26]
  assign pwmGenerator_clock = clock;
  assign pwmGenerator_reset = reset;
  assign pwmGenerator_io_enable_tick = prescaler_io_enable_tick; // @[PWMTop.scala 22:33]
  assign pwmGenerator_io_duty_cycle = io_duty_cycle; // @[PWMTop.scala 23:32]
  assign pwmGenerator_io_pwm_period = io_pwm_period; // @[PWMTop.scala 25:32]
  assign pwmGenerator_io_pwm_polarity = io_pwm_polarity; // @[PWMTop.scala 26:34]
  assign pwmGenerator_io_pwm_en = io_pwm_en; // @[PWMTop.scala 24:28]
endmodule
module GpioPadTop(
  input   io_OUT,
  input   io_OE_N,
  output  io_IN
);
  wire  gpioPad_OUT; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_OE_N; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_HLD_H_N; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ENABLE_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ENABLE_INP_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ENABLE_VDDA_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ENABLE_VSWITCH_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ENABLE_VDDIO; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_INP_DIS; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_IB_MODE_SEL; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_VTRIP_SEL; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_SLOW; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_HLD_OVR; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ANALOG_EN; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ANALOG_SEL; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_ANALOG_POL; // @[GpioPadTop.scala 32:37]
  wire [2:0] gpioPad_DM; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_PAD; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_PAD_A_NOESD_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_PAD_A_ESD_0_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_PAD_A_ESD_1_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_AMUXBUS_A; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_AMUXBUS_B; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_IN; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_IN_H; // @[GpioPadTop.scala 32:37]
  wire  gpioPad_TIE_HI_ESD; // @[GpioPadTop.scala 32:37]
  sky130_fd_io__top_gpiov2 gpioPad ( // @[GpioPadTop.scala 32:37]
    .OUT(gpioPad_OUT),
    .OE_N(gpioPad_OE_N),
    .HLD_H_N(gpioPad_HLD_H_N),
    .ENABLE_H(gpioPad_ENABLE_H),
    .ENABLE_INP_H(gpioPad_ENABLE_INP_H),
    .ENABLE_VDDA_H(gpioPad_ENABLE_VDDA_H),
    .ENABLE_VSWITCH_H(gpioPad_ENABLE_VSWITCH_H),
    .ENABLE_VDDIO(gpioPad_ENABLE_VDDIO),
    .INP_DIS(gpioPad_INP_DIS),
    .IB_MODE_SEL(gpioPad_IB_MODE_SEL),
    .VTRIP_SEL(gpioPad_VTRIP_SEL),
    .SLOW(gpioPad_SLOW),
    .HLD_OVR(gpioPad_HLD_OVR),
    .ANALOG_EN(gpioPad_ANALOG_EN),
    .ANALOG_SEL(gpioPad_ANALOG_SEL),
    .ANALOG_POL(gpioPad_ANALOG_POL),
    .DM(gpioPad_DM),
    .PAD(gpioPad_PAD),
    .PAD_A_NOESD_H(gpioPad_PAD_A_NOESD_H),
    .PAD_A_ESD_0_H(gpioPad_PAD_A_ESD_0_H),
    .PAD_A_ESD_1_H(gpioPad_PAD_A_ESD_1_H),
    .AMUXBUS_A(gpioPad_AMUXBUS_A),
    .AMUXBUS_B(gpioPad_AMUXBUS_B),
    .IN(gpioPad_IN),
    .IN_H(gpioPad_IN_H),
    .TIE_HI_ESD(gpioPad_TIE_HI_ESD)
  );
  assign io_IN = gpioPad_IN; // @[GpioPadTop.scala 37:37]
  assign gpioPad_OUT = io_OUT; // @[GpioPadTop.scala 35:37]
  assign gpioPad_OE_N = io_OE_N; // @[GpioPadTop.scala 36:37]
  assign gpioPad_HLD_H_N = 1'h1; // @[GpioPadTop.scala 68:37]
  assign gpioPad_ENABLE_H = 1'h1; // @[GpioPadTop.scala 56:37]
  assign gpioPad_ENABLE_INP_H = 1'h1; // @[GpioPadTop.scala 50:37]
  assign gpioPad_ENABLE_VDDA_H = 1'h1; // @[GpioPadTop.scala 71:37]
  assign gpioPad_ENABLE_VSWITCH_H = 1'h1; // @[GpioPadTop.scala 53:37]
  assign gpioPad_ENABLE_VDDIO = 1'h1; // @[GpioPadTop.scala 61:37]
  assign gpioPad_INP_DIS = 1'h0; // @[GpioPadTop.scala 57:37]
  assign gpioPad_IB_MODE_SEL = 1'h0; // @[GpioPadTop.scala 60:37]
  assign gpioPad_VTRIP_SEL = 1'h0; // @[GpioPadTop.scala 64:37]
  assign gpioPad_SLOW = 1'h0; // @[GpioPadTop.scala 79:37]
  assign gpioPad_HLD_OVR = 1'h1; // @[GpioPadTop.scala 67:37]
  assign gpioPad_ANALOG_EN = 1'h0; // @[GpioPadTop.scala 72:37]
  assign gpioPad_ANALOG_SEL = 1'h0; // @[GpioPadTop.scala 73:37]
  assign gpioPad_ANALOG_POL = 1'h0; // @[GpioPadTop.scala 74:37]
  assign gpioPad_DM = 3'h3; // @[GpioPadTop.scala 77:37]
endmodule
module GPIOModule(
  input        clock,
  input        reset,
  input        io_gpio_direction,
  input        io_gpio_output,
  output       io_gpio_input,
  input  [7:0] io_pwm_div,
  input  [7:0] io_duty_cycle,
  input  [7:0] io_pwm_period,
  input        io_pwm_polarity,
  input        io_pwm_en
);
  wire  pwmTop_clock; // @[GPIOModule.scala 38:22]
  wire  pwmTop_reset; // @[GPIOModule.scala 38:22]
  wire [7:0] pwmTop_io_pwm_div; // @[GPIOModule.scala 38:22]
  wire [7:0] pwmTop_io_duty_cycle; // @[GPIOModule.scala 38:22]
  wire [7:0] pwmTop_io_pwm_period; // @[GPIOModule.scala 38:22]
  wire  pwmTop_io_pwm_polarity; // @[GPIOModule.scala 38:22]
  wire  pwmTop_io_pwm_en; // @[GPIOModule.scala 38:22]
  wire  pwmTop_io_pwm_out; // @[GPIOModule.scala 38:22]
  wire  gpioPadTop_io_OUT; // @[GPIOModule.scala 61:28]
  wire  gpioPadTop_io_OE_N; // @[GPIOModule.scala 61:28]
  wire  gpioPadTop_io_IN; // @[GPIOModule.scala 61:28]
  PWMTop pwmTop ( // @[GPIOModule.scala 38:22]
    .clock(pwmTop_clock),
    .reset(pwmTop_reset),
    .io_pwm_div(pwmTop_io_pwm_div),
    .io_duty_cycle(pwmTop_io_duty_cycle),
    .io_pwm_period(pwmTop_io_pwm_period),
    .io_pwm_polarity(pwmTop_io_pwm_polarity),
    .io_pwm_en(pwmTop_io_pwm_en),
    .io_pwm_out(pwmTop_io_pwm_out)
  );
  GpioPadTop gpioPadTop ( // @[GPIOModule.scala 61:28]
    .io_OUT(gpioPadTop_io_OUT),
    .io_OE_N(gpioPadTop_io_OE_N),
    .io_IN(gpioPadTop_io_IN)
  );
  assign io_gpio_input = gpioPadTop_io_IN; // @[GPIOModule.scala 64:19]
  assign pwmTop_clock = clock;
  assign pwmTop_reset = reset;
  assign pwmTop_io_pwm_div = io_pwm_div; // @[GPIOModule.scala 39:21]
  assign pwmTop_io_duty_cycle = io_duty_cycle; // @[GPIOModule.scala 40:24]
  assign pwmTop_io_pwm_period = io_pwm_period; // @[GPIOModule.scala 41:24]
  assign pwmTop_io_pwm_polarity = io_pwm_polarity; // @[GPIOModule.scala 42:26]
  assign pwmTop_io_pwm_en = io_pwm_en; // @[GPIOModule.scala 43:20]
  assign gpioPadTop_io_OUT = io_pwm_en ? pwmTop_io_pwm_out : io_gpio_output; // @[GPIOModule.scala 50:23]
  assign gpioPadTop_io_OE_N = ~io_gpio_direction; // @[GPIOModule.scala 52:23]
endmodule
module GPIOPeripheral(
  input         clock,
  input         reset,
  input  [31:0] io_mem_ifc_address,
  input         io_mem_ifc_rd,
  input         io_mem_ifc_wr,
  output [31:0] io_mem_ifc_rdData,
  input  [31:0] io_mem_ifc_wrData,
  output        io_mem_ifc_ack
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
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  gpio_direction_clock; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_reset; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_read_data; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_write_data; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_rd; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_wr; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_0; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_1; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_2; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_3; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_4; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_5; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_6; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_direction_io_conf_output_7; // @[GPIOPeripheral.scala 49:37]
  wire  gpio_pullup_clock; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_reset; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_read_data; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_write_data; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_rd; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_wr; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_0; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_1; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_2; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_3; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_4; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_5; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_6; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pullup_io_conf_output_7; // @[GPIOPeripheral.scala 50:37]
  wire  gpio_pulldown_clock; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_reset; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_read_data; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_write_data; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_rd; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_wr; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_0; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_1; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_2; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_3; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_4; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_5; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_6; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_pulldown_io_conf_output_7; // @[GPIOPeripheral.scala 51:37]
  wire  gpio_opendrain_clock; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_reset; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_read_data; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_write_data; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_rd; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_wr; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_0; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_1; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_2; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_3; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_4; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_5; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_6; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_opendrain_io_conf_output_7; // @[GPIOPeripheral.scala 52:37]
  wire  gpio_drivestrength_clock; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_reset; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_read_data; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_write_data; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_rd; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_wr; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_0; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_1; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_2; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_3; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_4; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_5; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_6; // @[GPIOPeripheral.scala 53:37]
  wire  gpio_drivestrength_io_conf_output_7; // @[GPIOPeripheral.scala 53:37]
  wire  pwm_polarity_clock; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_reset; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_read_data; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_write_data; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_rd; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_wr; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_0; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_1; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_2; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_3; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_4; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_5; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_6; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_polarity_io_conf_output_7; // @[GPIOPeripheral.scala 54:37]
  wire  pwm_enable_clock; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_reset; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_read_data; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_write_data; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_rd; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_wr; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_0; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_1; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_2; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_3; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_4; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_5; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_6; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_enable_io_conf_output_7; // @[GPIOPeripheral.scala 56:37]
  wire  pwm_duty_cycle_clock; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_reset; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_read_data; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_write_data; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_rd; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_wr; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_0; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_1; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_2; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_3; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_4; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_5; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_6; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_duty_cycle_io_conf_output_7; // @[GPIOPeripheral.scala 57:37]
  wire  pwm_prescaler_clock; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_reset; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_read_data; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_write_data; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_rd; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_wr; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_0; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_1; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_2; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_3; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_4; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_5; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_6; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_prescaler_io_conf_output_7; // @[GPIOPeripheral.scala 58:37]
  wire  pwm_div_clock; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_reset; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_read_data; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_write_data; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_rd; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_wr; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_0; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_1; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_2; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_3; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_4; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_5; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_6; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_div_io_conf_output_7; // @[GPIOPeripheral.scala 59:37]
  wire  pwm_period_clock; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_reset; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_read_data; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_write_data; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_rd; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_wr; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_0; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_1; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_2; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_3; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_4; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_5; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_6; // @[GPIOPeripheral.scala 60:37]
  wire  pwm_period_io_conf_output_7; // @[GPIOPeripheral.scala 60:37]
  wire  gpio_module_0_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_0_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_0_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_0_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_0_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_0_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_0_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_0_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_0_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_0_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_1_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_1_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_1_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_1_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_1_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_1_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_1_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_1_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_1_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_1_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_2_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_2_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_2_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_2_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_2_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_2_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_2_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_2_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_2_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_2_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_3_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_3_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_3_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_3_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_3_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_3_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_3_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_3_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_3_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_3_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_4_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_4_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_4_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_4_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_4_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_4_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_4_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_4_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_4_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_4_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_5_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_5_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_5_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_5_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_5_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_5_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_5_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_5_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_5_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_5_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_6_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_6_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_6_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_6_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_6_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_6_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_6_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_6_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_6_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_6_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_7_clock; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_7_reset; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_7_io_gpio_direction; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_7_io_gpio_output; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_7_io_gpio_input; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_7_io_pwm_div; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_7_io_duty_cycle; // @[GPIOPeripheral.scala 64:23]
  wire [7:0] gpio_module_7_io_pwm_period; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_7_io_pwm_polarity; // @[GPIOPeripheral.scala 64:23]
  wire  gpio_module_7_io_pwm_en; // @[GPIOPeripheral.scala 64:23]
  reg [7:0] gpio_output; // @[GPIOPeripheral.scala 46:38]
  reg [7:0] gpio_input_0; // @[GPIOPeripheral.scala 47:34]
  reg [7:0] gpio_input_1; // @[GPIOPeripheral.scala 47:34]
  reg [7:0] gpio_input_2; // @[GPIOPeripheral.scala 47:34]
  reg [7:0] gpio_input_3; // @[GPIOPeripheral.scala 47:34]
  reg [7:0] gpio_input_4; // @[GPIOPeripheral.scala 47:34]
  reg [7:0] gpio_input_5; // @[GPIOPeripheral.scala 47:34]
  reg [7:0] gpio_input_6; // @[GPIOPeripheral.scala 47:34]
  reg [7:0] gpio_input_7; // @[GPIOPeripheral.scala 47:34]
  reg  rdAckReg; // @[GPIOPeripheral.scala 133:50]
  reg  wrAckReg; // @[GPIOPeripheral.scala 134:50]
  reg  para_read_en; // @[GPIOPeripheral.scala 141:34]
  reg [31:0] readReg; // @[GPIOPeripheral.scala 142:34]
  reg [2:0] read_state_reg; // @[GPIOPeripheral.scala 154:34]
  wire  _T_13 = 32'h0 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40]
  wire  _GEN_6 = 32'h118 == io_mem_ifc_address & pwm_prescaler_io_read_data; // @[GPIOPeripheral.scala 147:25 186:40 216:49]
  wire  _GEN_8 = 32'h110 == io_mem_ifc_address ? pwm_duty_cycle_io_read_data : _GEN_6; // @[GPIOPeripheral.scala 186:40 212:49]
  wire  _GEN_11 = 32'h100 == io_mem_ifc_address ? pwm_enable_io_read_data : _GEN_8; // @[GPIOPeripheral.scala 186:40 208:49]
  wire  _GEN_15 = 32'h30 == io_mem_ifc_address ? gpio_drivestrength_io_read_data : _GEN_11; // @[GPIOPeripheral.scala 186:40 204:49]
  wire  _GEN_20 = 32'h28 == io_mem_ifc_address ? gpio_opendrain_io_read_data : _GEN_15; // @[GPIOPeripheral.scala 186:40 200:49]
  wire  _GEN_26 = 32'h20 == io_mem_ifc_address ? gpio_pulldown_io_read_data : _GEN_20; // @[GPIOPeripheral.scala 186:40 196:49]
  wire  _GEN_33 = 32'h18 == io_mem_ifc_address ? gpio_pullup_io_read_data : _GEN_26; // @[GPIOPeripheral.scala 186:40 192:49]
  wire  _GEN_41 = 32'h0 == io_mem_ifc_address ? gpio_direction_io_read_data : _GEN_33; // @[GPIOPeripheral.scala 186:40 188:49]
  wire  _GEN_71 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_41; // @[GPIOPeripheral.scala 147:25 157:29]
  wire  serial_read = 3'h0 == read_state_reg ? 1'h0 : _GEN_71; // @[GPIOPeripheral.scala 147:25 157:29]
  wire [7:0] _readReg_T_1 = {serial_read,readReg[7:1]}; // @[GPIOPeripheral.scala 151:40]
  wire  _T_9 = io_mem_ifc_address == 32'h10; // @[GPIOPeripheral.scala 175:37]
  wire [87:0] _parallel_read_T_1 = {24'h0,gpio_input_7,gpio_input_6,gpio_input_5,gpio_input_4,gpio_input_3,gpio_input_2,
    gpio_input_1,gpio_input_0}; // @[Cat.scala 33:92]
  wire [87:0] _GEN_5 = _T_9 ? _parallel_read_T_1 : {{80'd0}, gpio_output}; // @[GPIOPeripheral.scala 176:13 177:37 179:37]
  wire [87:0] _GEN_67 = 3'h4 == read_state_reg ? _GEN_5 : 88'h0; // @[GPIOPeripheral.scala 146:25 157:29]
  wire [87:0] _GEN_84 = 3'h0 == read_state_reg ? 88'h0 : _GEN_67; // @[GPIOPeripheral.scala 146:25 157:29]
  wire [31:0] parallel_read = _GEN_84[31:0]; // @[GPIOPeripheral.scala 143:31]
  reg [3:0] n_shift_read; // @[GPIOPeripheral.scala 155:34]
  wire  _T_4 = io_mem_ifc_address == 32'h8; // @[GPIOPeripheral.scala 164:41]
  wire  _T_5 = _T_9 | _T_4; // @[GPIOPeripheral.scala 163:78]
  wire  _GEN_3 = io_mem_ifc_rd ? _T_5 : para_read_en; // @[GPIOPeripheral.scala 162:33 141:34]
  wire [3:0] _n_shift_read_T_1 = n_shift_read + 4'h1; // @[GPIOPeripheral.scala 185:53]
  wire  _GEN_10 = 32'h110 == io_mem_ifc_address ? 1'h0 : 32'h118 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40 116:41]
  wire  _GEN_13 = 32'h100 == io_mem_ifc_address ? 1'h0 : 32'h110 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40 112:41]
  wire  _GEN_14 = 32'h100 == io_mem_ifc_address ? 1'h0 : _GEN_10; // @[GPIOPeripheral.scala 186:40 116:41]
  wire  _GEN_17 = 32'h30 == io_mem_ifc_address ? 1'h0 : 32'h100 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40 108:41]
  wire  _GEN_18 = 32'h30 == io_mem_ifc_address ? 1'h0 : _GEN_13; // @[GPIOPeripheral.scala 186:40 112:41]
  wire  _GEN_19 = 32'h30 == io_mem_ifc_address ? 1'h0 : _GEN_14; // @[GPIOPeripheral.scala 186:40 116:41]
  wire  _GEN_22 = 32'h28 == io_mem_ifc_address ? 1'h0 : 32'h30 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40 104:41]
  wire  _GEN_23 = 32'h28 == io_mem_ifc_address ? 1'h0 : _GEN_17; // @[GPIOPeripheral.scala 186:40 108:41]
  wire  _GEN_24 = 32'h28 == io_mem_ifc_address ? 1'h0 : _GEN_18; // @[GPIOPeripheral.scala 186:40 112:41]
  wire  _GEN_25 = 32'h28 == io_mem_ifc_address ? 1'h0 : _GEN_19; // @[GPIOPeripheral.scala 186:40 116:41]
  wire  _GEN_28 = 32'h20 == io_mem_ifc_address ? 1'h0 : 32'h28 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40 100:41]
  wire  _GEN_29 = 32'h20 == io_mem_ifc_address ? 1'h0 : _GEN_22; // @[GPIOPeripheral.scala 186:40 104:41]
  wire  _GEN_30 = 32'h20 == io_mem_ifc_address ? 1'h0 : _GEN_23; // @[GPIOPeripheral.scala 186:40 108:41]
  wire  _GEN_31 = 32'h20 == io_mem_ifc_address ? 1'h0 : _GEN_24; // @[GPIOPeripheral.scala 186:40 112:41]
  wire  _GEN_32 = 32'h20 == io_mem_ifc_address ? 1'h0 : _GEN_25; // @[GPIOPeripheral.scala 186:40 116:41]
  wire  _GEN_35 = 32'h18 == io_mem_ifc_address ? 1'h0 : 32'h20 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40 96:41]
  wire  _GEN_36 = 32'h18 == io_mem_ifc_address ? 1'h0 : _GEN_28; // @[GPIOPeripheral.scala 186:40 100:41]
  wire  _GEN_37 = 32'h18 == io_mem_ifc_address ? 1'h0 : _GEN_29; // @[GPIOPeripheral.scala 186:40 104:41]
  wire  _GEN_38 = 32'h18 == io_mem_ifc_address ? 1'h0 : _GEN_30; // @[GPIOPeripheral.scala 186:40 108:41]
  wire  _GEN_39 = 32'h18 == io_mem_ifc_address ? 1'h0 : _GEN_31; // @[GPIOPeripheral.scala 186:40 112:41]
  wire  _GEN_40 = 32'h18 == io_mem_ifc_address ? 1'h0 : _GEN_32; // @[GPIOPeripheral.scala 186:40 116:41]
  wire  _GEN_43 = 32'h0 == io_mem_ifc_address ? 1'h0 : 32'h18 == io_mem_ifc_address; // @[GPIOPeripheral.scala 186:40 92:41]
  wire  _GEN_44 = 32'h0 == io_mem_ifc_address ? 1'h0 : _GEN_35; // @[GPIOPeripheral.scala 186:40 96:41]
  wire  _GEN_45 = 32'h0 == io_mem_ifc_address ? 1'h0 : _GEN_36; // @[GPIOPeripheral.scala 186:40 100:41]
  wire  _GEN_46 = 32'h0 == io_mem_ifc_address ? 1'h0 : _GEN_37; // @[GPIOPeripheral.scala 186:40 104:41]
  wire  _GEN_47 = 32'h0 == io_mem_ifc_address ? 1'h0 : _GEN_38; // @[GPIOPeripheral.scala 186:40 108:41]
  wire  _GEN_48 = 32'h0 == io_mem_ifc_address ? 1'h0 : _GEN_39; // @[GPIOPeripheral.scala 186:40 112:41]
  wire  _GEN_49 = 32'h0 == io_mem_ifc_address ? 1'h0 : _GEN_40; // @[GPIOPeripheral.scala 186:40 116:41]
  wire [3:0] _GEN_50 = n_shift_read == 4'h7 ? 4'h0 : _n_shift_read_T_1; // @[GPIOPeripheral.scala 185:37 221:50 222:45]
  wire [1:0] _GEN_51 = n_shift_read == 4'h7 ? 2'h3 : 2'h2; // @[GPIOPeripheral.scala 221:50 223:45 225:45]
  wire [2:0] _GEN_53 = 3'h3 == read_state_reg ? 3'h0 : read_state_reg; // @[GPIOPeripheral.scala 157:29 154:34 230:37]
  wire  _GEN_54 = 3'h3 == read_state_reg | rdAckReg; // @[GPIOPeripheral.scala 157:29 231:37 133:50]
  wire  _GEN_66 = 3'h2 == read_state_reg ? rdAckReg : _GEN_54; // @[GPIOPeripheral.scala 157:29 133:50]
  wire  _GEN_68 = 3'h4 == read_state_reg | _GEN_66; // @[GPIOPeripheral.scala 157:29 181:37]
  wire  _GEN_72 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _T_13; // @[GPIOPeripheral.scala 157:29 88:41]
  wire  _GEN_73 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_43; // @[GPIOPeripheral.scala 157:29 92:41]
  wire  _GEN_74 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_44; // @[GPIOPeripheral.scala 157:29 96:41]
  wire  _GEN_75 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_45; // @[GPIOPeripheral.scala 157:29 100:41]
  wire  _GEN_76 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_46; // @[GPIOPeripheral.scala 157:29 104:41]
  wire  _GEN_77 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_47; // @[GPIOPeripheral.scala 157:29 108:41]
  wire  _GEN_78 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_48; // @[GPIOPeripheral.scala 157:29 112:41]
  wire  _GEN_79 = 3'h4 == read_state_reg ? 1'h0 : 3'h2 == read_state_reg & _GEN_49; // @[GPIOPeripheral.scala 157:29 116:41]
  wire  _GEN_82 = 3'h0 == read_state_reg ? _GEN_3 : para_read_en; // @[GPIOPeripheral.scala 157:29 141:34]
  reg  para_write_en; // @[GPIOPeripheral.scala 236:38]
  reg [31:0] writeReg; // @[GPIOPeripheral.scala 237:38]
  reg [31:0] writeAddrReg; // @[GPIOPeripheral.scala 238:38]
  wire [7:0] _writeReg_T_2 = {writeReg[0],writeReg[7:1]}; // @[GPIOPeripheral.scala 243:44]
  reg [2:0] write_state_reg; // @[GPIOPeripheral.scala 246:38]
  reg [3:0] n_shift_write; // @[GPIOPeripheral.scala 247:38]
  wire  _T_30 = _T_4 | _T_9; // @[GPIOPeripheral.scala 259:79]
  wire  _GEN_98 = io_mem_ifc_wr ? _T_30 : 1'h1; // @[GPIOPeripheral.scala 258:33 253:37]
  wire  _T_34 = writeAddrReg == 32'h8; // @[GPIOPeripheral.scala 270:31]
  wire [31:0] _GEN_99 = _T_34 ? writeReg : {{24'd0}, gpio_output}; // @[GPIOPeripheral.scala 271:13 272:37 46:38]
  wire  _GEN_100 = _T_34 ? gpio_module_0_io_gpio_input : writeReg[0]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire  _GEN_101 = _T_34 ? gpio_module_1_io_gpio_input : writeReg[1]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire  _GEN_102 = _T_34 ? gpio_module_2_io_gpio_input : writeReg[2]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire  _GEN_103 = _T_34 ? gpio_module_3_io_gpio_input : writeReg[3]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire  _GEN_104 = _T_34 ? gpio_module_4_io_gpio_input : writeReg[4]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire  _GEN_105 = _T_34 ? gpio_module_5_io_gpio_input : writeReg[5]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire  _GEN_106 = _T_34 ? gpio_module_6_io_gpio_input : writeReg[6]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire  _GEN_107 = _T_34 ? gpio_module_7_io_gpio_input : writeReg[7]; // @[GPIOPeripheral.scala 271:13 66:32 274:37]
  wire [3:0] _n_shift_write_T_1 = n_shift_write + 4'h1; // @[GPIOPeripheral.scala 281:54]
  wire  _T_47 = 32'h0 == writeAddrReg; // @[GPIOPeripheral.scala 283:34]
  wire  _GEN_109 = 32'h118 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 118:41 314:57]
  wire  _GEN_111 = 32'h110 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 114:41 310:57]
  wire  _GEN_112 = 32'h110 == writeAddrReg ? 1'h0 : 32'h118 == writeAddrReg; // @[GPIOPeripheral.scala 283:34 117:41]
  wire  _GEN_113 = 32'h110 == writeAddrReg ? 1'h0 : _GEN_109; // @[GPIOPeripheral.scala 283:34 118:41]
  wire  _GEN_115 = 32'h100 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 110:41 306:57]
  wire  _GEN_116 = 32'h100 == writeAddrReg ? 1'h0 : 32'h110 == writeAddrReg; // @[GPIOPeripheral.scala 283:34 113:41]
  wire  _GEN_117 = 32'h100 == writeAddrReg ? 1'h0 : _GEN_111; // @[GPIOPeripheral.scala 283:34 114:41]
  wire  _GEN_118 = 32'h100 == writeAddrReg ? 1'h0 : _GEN_112; // @[GPIOPeripheral.scala 283:34 117:41]
  wire  _GEN_119 = 32'h100 == writeAddrReg ? 1'h0 : _GEN_113; // @[GPIOPeripheral.scala 283:34 118:41]
  wire  _GEN_121 = 32'h30 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 106:41 302:57]
  wire  _GEN_122 = 32'h30 == writeAddrReg ? 1'h0 : 32'h100 == writeAddrReg; // @[GPIOPeripheral.scala 283:34 109:41]
  wire  _GEN_123 = 32'h30 == writeAddrReg ? 1'h0 : _GEN_115; // @[GPIOPeripheral.scala 283:34 110:41]
  wire  _GEN_124 = 32'h30 == writeAddrReg ? 1'h0 : _GEN_116; // @[GPIOPeripheral.scala 283:34 113:41]
  wire  _GEN_125 = 32'h30 == writeAddrReg ? 1'h0 : _GEN_117; // @[GPIOPeripheral.scala 283:34 114:41]
  wire  _GEN_126 = 32'h30 == writeAddrReg ? 1'h0 : _GEN_118; // @[GPIOPeripheral.scala 283:34 117:41]
  wire  _GEN_127 = 32'h30 == writeAddrReg ? 1'h0 : _GEN_119; // @[GPIOPeripheral.scala 283:34 118:41]
  wire  _GEN_129 = 32'h28 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 102:41 298:57]
  wire  _GEN_130 = 32'h28 == writeAddrReg ? 1'h0 : 32'h30 == writeAddrReg; // @[GPIOPeripheral.scala 283:34 105:41]
  wire  _GEN_131 = 32'h28 == writeAddrReg ? 1'h0 : _GEN_121; // @[GPIOPeripheral.scala 283:34 106:41]
  wire  _GEN_132 = 32'h28 == writeAddrReg ? 1'h0 : _GEN_122; // @[GPIOPeripheral.scala 283:34 109:41]
  wire  _GEN_133 = 32'h28 == writeAddrReg ? 1'h0 : _GEN_123; // @[GPIOPeripheral.scala 283:34 110:41]
  wire  _GEN_134 = 32'h28 == writeAddrReg ? 1'h0 : _GEN_124; // @[GPIOPeripheral.scala 283:34 113:41]
  wire  _GEN_135 = 32'h28 == writeAddrReg ? 1'h0 : _GEN_125; // @[GPIOPeripheral.scala 283:34 114:41]
  wire  _GEN_136 = 32'h28 == writeAddrReg ? 1'h0 : _GEN_126; // @[GPIOPeripheral.scala 283:34 117:41]
  wire  _GEN_137 = 32'h28 == writeAddrReg ? 1'h0 : _GEN_127; // @[GPIOPeripheral.scala 283:34 118:41]
  wire  _GEN_139 = 32'h20 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 294:57 98:41]
  wire  _GEN_140 = 32'h20 == writeAddrReg ? 1'h0 : 32'h28 == writeAddrReg; // @[GPIOPeripheral.scala 283:34 101:41]
  wire  _GEN_141 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_129; // @[GPIOPeripheral.scala 283:34 102:41]
  wire  _GEN_142 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_130; // @[GPIOPeripheral.scala 283:34 105:41]
  wire  _GEN_143 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_131; // @[GPIOPeripheral.scala 283:34 106:41]
  wire  _GEN_144 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_132; // @[GPIOPeripheral.scala 283:34 109:41]
  wire  _GEN_145 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_133; // @[GPIOPeripheral.scala 283:34 110:41]
  wire  _GEN_146 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_134; // @[GPIOPeripheral.scala 283:34 113:41]
  wire  _GEN_147 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_135; // @[GPIOPeripheral.scala 283:34 114:41]
  wire  _GEN_148 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_136; // @[GPIOPeripheral.scala 283:34 117:41]
  wire  _GEN_149 = 32'h20 == writeAddrReg ? 1'h0 : _GEN_137; // @[GPIOPeripheral.scala 283:34 118:41]
  wire  _GEN_151 = 32'h18 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 290:57 94:41]
  wire  _GEN_152 = 32'h18 == writeAddrReg ? 1'h0 : 32'h20 == writeAddrReg; // @[GPIOPeripheral.scala 283:34 97:41]
  wire  _GEN_153 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_139; // @[GPIOPeripheral.scala 283:34 98:41]
  wire  _GEN_154 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_140; // @[GPIOPeripheral.scala 283:34 101:41]
  wire  _GEN_155 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_141; // @[GPIOPeripheral.scala 283:34 102:41]
  wire  _GEN_156 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_142; // @[GPIOPeripheral.scala 283:34 105:41]
  wire  _GEN_157 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_143; // @[GPIOPeripheral.scala 283:34 106:41]
  wire  _GEN_158 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_144; // @[GPIOPeripheral.scala 283:34 109:41]
  wire  _GEN_159 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_145; // @[GPIOPeripheral.scala 283:34 110:41]
  wire  _GEN_160 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_146; // @[GPIOPeripheral.scala 283:34 113:41]
  wire  _GEN_161 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_147; // @[GPIOPeripheral.scala 283:34 114:41]
  wire  _GEN_162 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_148; // @[GPIOPeripheral.scala 283:34 117:41]
  wire  _GEN_163 = 32'h18 == writeAddrReg ? 1'h0 : _GEN_149; // @[GPIOPeripheral.scala 283:34 118:41]
  wire  _GEN_165 = 32'h0 == writeAddrReg & writeReg[0]; // @[GPIOPeripheral.scala 283:34 286:57 90:41]
  wire  _GEN_166 = 32'h0 == writeAddrReg ? 1'h0 : 32'h18 == writeAddrReg; // @[GPIOPeripheral.scala 283:34 93:41]
  wire  _GEN_167 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_151; // @[GPIOPeripheral.scala 283:34 94:41]
  wire  _GEN_168 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_152; // @[GPIOPeripheral.scala 283:34 97:41]
  wire  _GEN_169 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_153; // @[GPIOPeripheral.scala 283:34 98:41]
  wire  _GEN_170 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_154; // @[GPIOPeripheral.scala 283:34 101:41]
  wire  _GEN_171 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_155; // @[GPIOPeripheral.scala 283:34 102:41]
  wire  _GEN_172 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_156; // @[GPIOPeripheral.scala 283:34 105:41]
  wire  _GEN_173 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_157; // @[GPIOPeripheral.scala 283:34 106:41]
  wire  _GEN_174 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_158; // @[GPIOPeripheral.scala 283:34 109:41]
  wire  _GEN_175 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_159; // @[GPIOPeripheral.scala 283:34 110:41]
  wire  _GEN_176 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_160; // @[GPIOPeripheral.scala 283:34 113:41]
  wire  _GEN_177 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_161; // @[GPIOPeripheral.scala 283:34 114:41]
  wire  _GEN_178 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_162; // @[GPIOPeripheral.scala 283:34 117:41]
  wire  _GEN_179 = 32'h0 == writeAddrReg ? 1'h0 : _GEN_163; // @[GPIOPeripheral.scala 283:34 118:41]
  wire  _GEN_180 = n_shift_write == 4'h7 ? 1'h0 : _T_47; // @[GPIOPeripheral.scala 318:51 319:45]
  wire [3:0] _GEN_181 = n_shift_write == 4'h7 ? 4'h0 : _n_shift_write_T_1; // @[GPIOPeripheral.scala 281:37 318:51 320:45]
  wire [1:0] _GEN_182 = n_shift_write == 4'h7 ? 2'h3 : 2'h2; // @[GPIOPeripheral.scala 318:51 321:45 323:45]
  wire  _GEN_184 = 3'h3 == write_state_reg | wrAckReg; // @[GPIOPeripheral.scala 249:30 329:45 134:50]
  wire [2:0] _GEN_185 = 3'h3 == write_state_reg ? 3'h0 : write_state_reg; // @[GPIOPeripheral.scala 249:30 246:38 330:45]
  wire  _GEN_186 = 3'h2 == write_state_reg ? 1'h0 : para_write_en; // @[GPIOPeripheral.scala 249:30 280:37 236:38]
  wire  _GEN_205 = 3'h2 == write_state_reg ? wrAckReg : _GEN_184; // @[GPIOPeripheral.scala 249:30 134:50]
  wire [31:0] _GEN_206 = 3'h4 == write_state_reg ? _GEN_99 : {{24'd0}, gpio_output}; // @[GPIOPeripheral.scala 249:30 46:38]
  wire  _GEN_207 = 3'h4 == write_state_reg ? _GEN_100 : gpio_module_0_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_208 = 3'h4 == write_state_reg ? _GEN_101 : gpio_module_1_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_209 = 3'h4 == write_state_reg ? _GEN_102 : gpio_module_2_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_210 = 3'h4 == write_state_reg ? _GEN_103 : gpio_module_3_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_211 = 3'h4 == write_state_reg ? _GEN_104 : gpio_module_4_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_212 = 3'h4 == write_state_reg ? _GEN_105 : gpio_module_5_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_213 = 3'h4 == write_state_reg ? _GEN_106 : gpio_module_6_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_214 = 3'h4 == write_state_reg ? _GEN_107 : gpio_module_7_io_gpio_input; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_215 = 3'h4 == write_state_reg | _GEN_205; // @[GPIOPeripheral.scala 249:30 276:37]
  wire  _GEN_217 = 3'h4 == write_state_reg ? para_write_en : _GEN_186; // @[GPIOPeripheral.scala 249:30 236:38]
  wire  _GEN_219 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_180; // @[GPIOPeripheral.scala 249:30 89:41]
  wire  _GEN_220 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_165; // @[GPIOPeripheral.scala 249:30 90:41]
  wire  _GEN_221 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_166; // @[GPIOPeripheral.scala 249:30 93:41]
  wire  _GEN_222 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_167; // @[GPIOPeripheral.scala 249:30 94:41]
  wire  _GEN_223 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_168; // @[GPIOPeripheral.scala 249:30 97:41]
  wire  _GEN_224 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_169; // @[GPIOPeripheral.scala 249:30 98:41]
  wire  _GEN_225 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_170; // @[GPIOPeripheral.scala 249:30 101:41]
  wire  _GEN_226 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_171; // @[GPIOPeripheral.scala 249:30 102:41]
  wire  _GEN_227 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_172; // @[GPIOPeripheral.scala 249:30 105:41]
  wire  _GEN_228 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_173; // @[GPIOPeripheral.scala 249:30 106:41]
  wire  _GEN_229 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_174; // @[GPIOPeripheral.scala 249:30 109:41]
  wire  _GEN_230 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_175; // @[GPIOPeripheral.scala 249:30 110:41]
  wire  _GEN_231 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_176; // @[GPIOPeripheral.scala 249:30 113:41]
  wire  _GEN_232 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_177; // @[GPIOPeripheral.scala 249:30 114:41]
  wire  _GEN_233 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_178; // @[GPIOPeripheral.scala 249:30 117:41]
  wire  _GEN_234 = 3'h4 == write_state_reg ? 1'h0 : 3'h2 == write_state_reg & _GEN_179; // @[GPIOPeripheral.scala 249:30 118:41]
  wire  _GEN_237 = 3'h0 == write_state_reg ? _GEN_98 : _GEN_217; // @[GPIOPeripheral.scala 249:30]
  wire [31:0] _GEN_241 = 3'h0 == write_state_reg ? {{24'd0}, gpio_output} : _GEN_206; // @[GPIOPeripheral.scala 249:30 46:38]
  wire  _GEN_242 = 3'h0 == write_state_reg ? gpio_module_0_io_gpio_input : _GEN_207; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_243 = 3'h0 == write_state_reg ? gpio_module_1_io_gpio_input : _GEN_208; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_244 = 3'h0 == write_state_reg ? gpio_module_2_io_gpio_input : _GEN_209; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_245 = 3'h0 == write_state_reg ? gpio_module_3_io_gpio_input : _GEN_210; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_246 = 3'h0 == write_state_reg ? gpio_module_4_io_gpio_input : _GEN_211; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_247 = 3'h0 == write_state_reg ? gpio_module_5_io_gpio_input : _GEN_212; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_248 = 3'h0 == write_state_reg ? gpio_module_6_io_gpio_input : _GEN_213; // @[GPIOPeripheral.scala 249:30 66:32]
  wire  _GEN_249 = 3'h0 == write_state_reg ? gpio_module_7_io_gpio_input : _GEN_214; // @[GPIOPeripheral.scala 249:30 66:32]
  wire [31:0] _GEN_266 = reset ? 32'hf : _GEN_241; // @[GPIOPeripheral.scala 46:{38,38}]
  GPIOShiftRegister gpio_direction ( // @[GPIOPeripheral.scala 49:37]
    .clock(gpio_direction_clock),
    .reset(gpio_direction_reset),
    .io_read_data(gpio_direction_io_read_data),
    .io_write_data(gpio_direction_io_write_data),
    .io_rd(gpio_direction_io_rd),
    .io_wr(gpio_direction_io_wr),
    .io_conf_output_0(gpio_direction_io_conf_output_0),
    .io_conf_output_1(gpio_direction_io_conf_output_1),
    .io_conf_output_2(gpio_direction_io_conf_output_2),
    .io_conf_output_3(gpio_direction_io_conf_output_3),
    .io_conf_output_4(gpio_direction_io_conf_output_4),
    .io_conf_output_5(gpio_direction_io_conf_output_5),
    .io_conf_output_6(gpio_direction_io_conf_output_6),
    .io_conf_output_7(gpio_direction_io_conf_output_7)
  );
  GPIOShiftRegister gpio_pullup ( // @[GPIOPeripheral.scala 50:37]
    .clock(gpio_pullup_clock),
    .reset(gpio_pullup_reset),
    .io_read_data(gpio_pullup_io_read_data),
    .io_write_data(gpio_pullup_io_write_data),
    .io_rd(gpio_pullup_io_rd),
    .io_wr(gpio_pullup_io_wr),
    .io_conf_output_0(gpio_pullup_io_conf_output_0),
    .io_conf_output_1(gpio_pullup_io_conf_output_1),
    .io_conf_output_2(gpio_pullup_io_conf_output_2),
    .io_conf_output_3(gpio_pullup_io_conf_output_3),
    .io_conf_output_4(gpio_pullup_io_conf_output_4),
    .io_conf_output_5(gpio_pullup_io_conf_output_5),
    .io_conf_output_6(gpio_pullup_io_conf_output_6),
    .io_conf_output_7(gpio_pullup_io_conf_output_7)
  );
  GPIOShiftRegister gpio_pulldown ( // @[GPIOPeripheral.scala 51:37]
    .clock(gpio_pulldown_clock),
    .reset(gpio_pulldown_reset),
    .io_read_data(gpio_pulldown_io_read_data),
    .io_write_data(gpio_pulldown_io_write_data),
    .io_rd(gpio_pulldown_io_rd),
    .io_wr(gpio_pulldown_io_wr),
    .io_conf_output_0(gpio_pulldown_io_conf_output_0),
    .io_conf_output_1(gpio_pulldown_io_conf_output_1),
    .io_conf_output_2(gpio_pulldown_io_conf_output_2),
    .io_conf_output_3(gpio_pulldown_io_conf_output_3),
    .io_conf_output_4(gpio_pulldown_io_conf_output_4),
    .io_conf_output_5(gpio_pulldown_io_conf_output_5),
    .io_conf_output_6(gpio_pulldown_io_conf_output_6),
    .io_conf_output_7(gpio_pulldown_io_conf_output_7)
  );
  GPIOShiftRegister gpio_opendrain ( // @[GPIOPeripheral.scala 52:37]
    .clock(gpio_opendrain_clock),
    .reset(gpio_opendrain_reset),
    .io_read_data(gpio_opendrain_io_read_data),
    .io_write_data(gpio_opendrain_io_write_data),
    .io_rd(gpio_opendrain_io_rd),
    .io_wr(gpio_opendrain_io_wr),
    .io_conf_output_0(gpio_opendrain_io_conf_output_0),
    .io_conf_output_1(gpio_opendrain_io_conf_output_1),
    .io_conf_output_2(gpio_opendrain_io_conf_output_2),
    .io_conf_output_3(gpio_opendrain_io_conf_output_3),
    .io_conf_output_4(gpio_opendrain_io_conf_output_4),
    .io_conf_output_5(gpio_opendrain_io_conf_output_5),
    .io_conf_output_6(gpio_opendrain_io_conf_output_6),
    .io_conf_output_7(gpio_opendrain_io_conf_output_7)
  );
  GPIOShiftRegister gpio_drivestrength ( // @[GPIOPeripheral.scala 53:37]
    .clock(gpio_drivestrength_clock),
    .reset(gpio_drivestrength_reset),
    .io_read_data(gpio_drivestrength_io_read_data),
    .io_write_data(gpio_drivestrength_io_write_data),
    .io_rd(gpio_drivestrength_io_rd),
    .io_wr(gpio_drivestrength_io_wr),
    .io_conf_output_0(gpio_drivestrength_io_conf_output_0),
    .io_conf_output_1(gpio_drivestrength_io_conf_output_1),
    .io_conf_output_2(gpio_drivestrength_io_conf_output_2),
    .io_conf_output_3(gpio_drivestrength_io_conf_output_3),
    .io_conf_output_4(gpio_drivestrength_io_conf_output_4),
    .io_conf_output_5(gpio_drivestrength_io_conf_output_5),
    .io_conf_output_6(gpio_drivestrength_io_conf_output_6),
    .io_conf_output_7(gpio_drivestrength_io_conf_output_7)
  );
  GPIOShiftRegister pwm_polarity ( // @[GPIOPeripheral.scala 54:37]
    .clock(pwm_polarity_clock),
    .reset(pwm_polarity_reset),
    .io_read_data(pwm_polarity_io_read_data),
    .io_write_data(pwm_polarity_io_write_data),
    .io_rd(pwm_polarity_io_rd),
    .io_wr(pwm_polarity_io_wr),
    .io_conf_output_0(pwm_polarity_io_conf_output_0),
    .io_conf_output_1(pwm_polarity_io_conf_output_1),
    .io_conf_output_2(pwm_polarity_io_conf_output_2),
    .io_conf_output_3(pwm_polarity_io_conf_output_3),
    .io_conf_output_4(pwm_polarity_io_conf_output_4),
    .io_conf_output_5(pwm_polarity_io_conf_output_5),
    .io_conf_output_6(pwm_polarity_io_conf_output_6),
    .io_conf_output_7(pwm_polarity_io_conf_output_7)
  );
  GPIOShiftRegister pwm_enable ( // @[GPIOPeripheral.scala 56:37]
    .clock(pwm_enable_clock),
    .reset(pwm_enable_reset),
    .io_read_data(pwm_enable_io_read_data),
    .io_write_data(pwm_enable_io_write_data),
    .io_rd(pwm_enable_io_rd),
    .io_wr(pwm_enable_io_wr),
    .io_conf_output_0(pwm_enable_io_conf_output_0),
    .io_conf_output_1(pwm_enable_io_conf_output_1),
    .io_conf_output_2(pwm_enable_io_conf_output_2),
    .io_conf_output_3(pwm_enable_io_conf_output_3),
    .io_conf_output_4(pwm_enable_io_conf_output_4),
    .io_conf_output_5(pwm_enable_io_conf_output_5),
    .io_conf_output_6(pwm_enable_io_conf_output_6),
    .io_conf_output_7(pwm_enable_io_conf_output_7)
  );
  GPIOShiftRegister pwm_duty_cycle ( // @[GPIOPeripheral.scala 57:37]
    .clock(pwm_duty_cycle_clock),
    .reset(pwm_duty_cycle_reset),
    .io_read_data(pwm_duty_cycle_io_read_data),
    .io_write_data(pwm_duty_cycle_io_write_data),
    .io_rd(pwm_duty_cycle_io_rd),
    .io_wr(pwm_duty_cycle_io_wr),
    .io_conf_output_0(pwm_duty_cycle_io_conf_output_0),
    .io_conf_output_1(pwm_duty_cycle_io_conf_output_1),
    .io_conf_output_2(pwm_duty_cycle_io_conf_output_2),
    .io_conf_output_3(pwm_duty_cycle_io_conf_output_3),
    .io_conf_output_4(pwm_duty_cycle_io_conf_output_4),
    .io_conf_output_5(pwm_duty_cycle_io_conf_output_5),
    .io_conf_output_6(pwm_duty_cycle_io_conf_output_6),
    .io_conf_output_7(pwm_duty_cycle_io_conf_output_7)
  );
  GPIOShiftRegister pwm_prescaler ( // @[GPIOPeripheral.scala 58:37]
    .clock(pwm_prescaler_clock),
    .reset(pwm_prescaler_reset),
    .io_read_data(pwm_prescaler_io_read_data),
    .io_write_data(pwm_prescaler_io_write_data),
    .io_rd(pwm_prescaler_io_rd),
    .io_wr(pwm_prescaler_io_wr),
    .io_conf_output_0(pwm_prescaler_io_conf_output_0),
    .io_conf_output_1(pwm_prescaler_io_conf_output_1),
    .io_conf_output_2(pwm_prescaler_io_conf_output_2),
    .io_conf_output_3(pwm_prescaler_io_conf_output_3),
    .io_conf_output_4(pwm_prescaler_io_conf_output_4),
    .io_conf_output_5(pwm_prescaler_io_conf_output_5),
    .io_conf_output_6(pwm_prescaler_io_conf_output_6),
    .io_conf_output_7(pwm_prescaler_io_conf_output_7)
  );
  GPIOShiftRegister pwm_div ( // @[GPIOPeripheral.scala 59:37]
    .clock(pwm_div_clock),
    .reset(pwm_div_reset),
    .io_read_data(pwm_div_io_read_data),
    .io_write_data(pwm_div_io_write_data),
    .io_rd(pwm_div_io_rd),
    .io_wr(pwm_div_io_wr),
    .io_conf_output_0(pwm_div_io_conf_output_0),
    .io_conf_output_1(pwm_div_io_conf_output_1),
    .io_conf_output_2(pwm_div_io_conf_output_2),
    .io_conf_output_3(pwm_div_io_conf_output_3),
    .io_conf_output_4(pwm_div_io_conf_output_4),
    .io_conf_output_5(pwm_div_io_conf_output_5),
    .io_conf_output_6(pwm_div_io_conf_output_6),
    .io_conf_output_7(pwm_div_io_conf_output_7)
  );
  GPIOShiftRegister pwm_period ( // @[GPIOPeripheral.scala 60:37]
    .clock(pwm_period_clock),
    .reset(pwm_period_reset),
    .io_read_data(pwm_period_io_read_data),
    .io_write_data(pwm_period_io_write_data),
    .io_rd(pwm_period_io_rd),
    .io_wr(pwm_period_io_wr),
    .io_conf_output_0(pwm_period_io_conf_output_0),
    .io_conf_output_1(pwm_period_io_conf_output_1),
    .io_conf_output_2(pwm_period_io_conf_output_2),
    .io_conf_output_3(pwm_period_io_conf_output_3),
    .io_conf_output_4(pwm_period_io_conf_output_4),
    .io_conf_output_5(pwm_period_io_conf_output_5),
    .io_conf_output_6(pwm_period_io_conf_output_6),
    .io_conf_output_7(pwm_period_io_conf_output_7)
  );
  GPIOModule gpio_module_0 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_0_clock),
    .reset(gpio_module_0_reset),
    .io_gpio_direction(gpio_module_0_io_gpio_direction),
    .io_gpio_output(gpio_module_0_io_gpio_output),
    .io_gpio_input(gpio_module_0_io_gpio_input),
    .io_pwm_div(gpio_module_0_io_pwm_div),
    .io_duty_cycle(gpio_module_0_io_duty_cycle),
    .io_pwm_period(gpio_module_0_io_pwm_period),
    .io_pwm_polarity(gpio_module_0_io_pwm_polarity),
    .io_pwm_en(gpio_module_0_io_pwm_en)
  );
  GPIOModule gpio_module_1 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_1_clock),
    .reset(gpio_module_1_reset),
    .io_gpio_direction(gpio_module_1_io_gpio_direction),
    .io_gpio_output(gpio_module_1_io_gpio_output),
    .io_gpio_input(gpio_module_1_io_gpio_input),
    .io_pwm_div(gpio_module_1_io_pwm_div),
    .io_duty_cycle(gpio_module_1_io_duty_cycle),
    .io_pwm_period(gpio_module_1_io_pwm_period),
    .io_pwm_polarity(gpio_module_1_io_pwm_polarity),
    .io_pwm_en(gpio_module_1_io_pwm_en)
  );
  GPIOModule gpio_module_2 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_2_clock),
    .reset(gpio_module_2_reset),
    .io_gpio_direction(gpio_module_2_io_gpio_direction),
    .io_gpio_output(gpio_module_2_io_gpio_output),
    .io_gpio_input(gpio_module_2_io_gpio_input),
    .io_pwm_div(gpio_module_2_io_pwm_div),
    .io_duty_cycle(gpio_module_2_io_duty_cycle),
    .io_pwm_period(gpio_module_2_io_pwm_period),
    .io_pwm_polarity(gpio_module_2_io_pwm_polarity),
    .io_pwm_en(gpio_module_2_io_pwm_en)
  );
  GPIOModule gpio_module_3 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_3_clock),
    .reset(gpio_module_3_reset),
    .io_gpio_direction(gpio_module_3_io_gpio_direction),
    .io_gpio_output(gpio_module_3_io_gpio_output),
    .io_gpio_input(gpio_module_3_io_gpio_input),
    .io_pwm_div(gpio_module_3_io_pwm_div),
    .io_duty_cycle(gpio_module_3_io_duty_cycle),
    .io_pwm_period(gpio_module_3_io_pwm_period),
    .io_pwm_polarity(gpio_module_3_io_pwm_polarity),
    .io_pwm_en(gpio_module_3_io_pwm_en)
  );
  GPIOModule gpio_module_4 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_4_clock),
    .reset(gpio_module_4_reset),
    .io_gpio_direction(gpio_module_4_io_gpio_direction),
    .io_gpio_output(gpio_module_4_io_gpio_output),
    .io_gpio_input(gpio_module_4_io_gpio_input),
    .io_pwm_div(gpio_module_4_io_pwm_div),
    .io_duty_cycle(gpio_module_4_io_duty_cycle),
    .io_pwm_period(gpio_module_4_io_pwm_period),
    .io_pwm_polarity(gpio_module_4_io_pwm_polarity),
    .io_pwm_en(gpio_module_4_io_pwm_en)
  );
  GPIOModule gpio_module_5 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_5_clock),
    .reset(gpio_module_5_reset),
    .io_gpio_direction(gpio_module_5_io_gpio_direction),
    .io_gpio_output(gpio_module_5_io_gpio_output),
    .io_gpio_input(gpio_module_5_io_gpio_input),
    .io_pwm_div(gpio_module_5_io_pwm_div),
    .io_duty_cycle(gpio_module_5_io_duty_cycle),
    .io_pwm_period(gpio_module_5_io_pwm_period),
    .io_pwm_polarity(gpio_module_5_io_pwm_polarity),
    .io_pwm_en(gpio_module_5_io_pwm_en)
  );
  GPIOModule gpio_module_6 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_6_clock),
    .reset(gpio_module_6_reset),
    .io_gpio_direction(gpio_module_6_io_gpio_direction),
    .io_gpio_output(gpio_module_6_io_gpio_output),
    .io_gpio_input(gpio_module_6_io_gpio_input),
    .io_pwm_div(gpio_module_6_io_pwm_div),
    .io_duty_cycle(gpio_module_6_io_duty_cycle),
    .io_pwm_period(gpio_module_6_io_pwm_period),
    .io_pwm_polarity(gpio_module_6_io_pwm_polarity),
    .io_pwm_en(gpio_module_6_io_pwm_en)
  );
  GPIOModule gpio_module_7 ( // @[GPIOPeripheral.scala 64:23]
    .clock(gpio_module_7_clock),
    .reset(gpio_module_7_reset),
    .io_gpio_direction(gpio_module_7_io_gpio_direction),
    .io_gpio_output(gpio_module_7_io_gpio_output),
    .io_gpio_input(gpio_module_7_io_gpio_input),
    .io_pwm_div(gpio_module_7_io_pwm_div),
    .io_duty_cycle(gpio_module_7_io_duty_cycle),
    .io_pwm_period(gpio_module_7_io_pwm_period),
    .io_pwm_polarity(gpio_module_7_io_pwm_polarity),
    .io_pwm_en(gpio_module_7_io_pwm_en)
  );
  assign io_mem_ifc_rdData = readReg; // @[GPIOPeripheral.scala 336:29]
  assign io_mem_ifc_ack = rdAckReg | wrAckReg; // @[GPIOPeripheral.scala 335:41]
  assign gpio_direction_clock = clock;
  assign gpio_direction_reset = reset;
  assign gpio_direction_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_220; // @[GPIOPeripheral.scala 249:30 90:41]
  assign gpio_direction_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_72; // @[GPIOPeripheral.scala 157:29 88:41]
  assign gpio_direction_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_219; // @[GPIOPeripheral.scala 249:30 89:41]
  assign gpio_pullup_clock = clock;
  assign gpio_pullup_reset = reset;
  assign gpio_pullup_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_222; // @[GPIOPeripheral.scala 249:30 94:41]
  assign gpio_pullup_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_73; // @[GPIOPeripheral.scala 157:29 92:41]
  assign gpio_pullup_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_221; // @[GPIOPeripheral.scala 249:30 93:41]
  assign gpio_pulldown_clock = clock;
  assign gpio_pulldown_reset = reset;
  assign gpio_pulldown_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_224; // @[GPIOPeripheral.scala 249:30 98:41]
  assign gpio_pulldown_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_74; // @[GPIOPeripheral.scala 157:29 96:41]
  assign gpio_pulldown_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_223; // @[GPIOPeripheral.scala 249:30 97:41]
  assign gpio_opendrain_clock = clock;
  assign gpio_opendrain_reset = reset;
  assign gpio_opendrain_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_226; // @[GPIOPeripheral.scala 249:30 102:41]
  assign gpio_opendrain_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_75; // @[GPIOPeripheral.scala 157:29 100:41]
  assign gpio_opendrain_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_225; // @[GPIOPeripheral.scala 249:30 101:41]
  assign gpio_drivestrength_clock = clock;
  assign gpio_drivestrength_reset = reset;
  assign gpio_drivestrength_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_228; // @[GPIOPeripheral.scala 249:30 106:41]
  assign gpio_drivestrength_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_76; // @[GPIOPeripheral.scala 157:29 104:41]
  assign gpio_drivestrength_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_227; // @[GPIOPeripheral.scala 249:30 105:41]
  assign pwm_polarity_clock = clock;
  assign pwm_polarity_reset = reset;
  assign pwm_polarity_io_write_data = 1'h0; // @[GPIOPeripheral.scala 126:41]
  assign pwm_polarity_io_rd = 1'h0; // @[GPIOPeripheral.scala 124:41]
  assign pwm_polarity_io_wr = 1'h0; // @[GPIOPeripheral.scala 125:41]
  assign pwm_enable_clock = clock;
  assign pwm_enable_reset = reset;
  assign pwm_enable_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_230; // @[GPIOPeripheral.scala 249:30 110:41]
  assign pwm_enable_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_77; // @[GPIOPeripheral.scala 157:29 108:41]
  assign pwm_enable_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_229; // @[GPIOPeripheral.scala 249:30 109:41]
  assign pwm_duty_cycle_clock = clock;
  assign pwm_duty_cycle_reset = reset;
  assign pwm_duty_cycle_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_232; // @[GPIOPeripheral.scala 249:30 114:41]
  assign pwm_duty_cycle_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_78; // @[GPIOPeripheral.scala 157:29 112:41]
  assign pwm_duty_cycle_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_231; // @[GPIOPeripheral.scala 249:30 113:41]
  assign pwm_prescaler_clock = clock;
  assign pwm_prescaler_reset = reset;
  assign pwm_prescaler_io_write_data = 3'h0 == write_state_reg ? 1'h0 : _GEN_234; // @[GPIOPeripheral.scala 249:30 118:41]
  assign pwm_prescaler_io_rd = 3'h0 == read_state_reg ? 1'h0 : _GEN_79; // @[GPIOPeripheral.scala 157:29 116:41]
  assign pwm_prescaler_io_wr = 3'h0 == write_state_reg ? 1'h0 : _GEN_233; // @[GPIOPeripheral.scala 249:30 117:41]
  assign pwm_div_clock = clock;
  assign pwm_div_reset = reset;
  assign pwm_div_io_write_data = 1'h0; // @[GPIOPeripheral.scala 122:41]
  assign pwm_div_io_rd = 1'h0; // @[GPIOPeripheral.scala 120:41]
  assign pwm_div_io_wr = 1'h0; // @[GPIOPeripheral.scala 121:41]
  assign pwm_period_clock = clock;
  assign pwm_period_reset = reset;
  assign pwm_period_io_write_data = 1'h0; // @[GPIOPeripheral.scala 130:41]
  assign pwm_period_io_rd = 1'h0; // @[GPIOPeripheral.scala 128:41]
  assign pwm_period_io_wr = 1'h0; // @[GPIOPeripheral.scala 129:41]
  assign gpio_module_0_clock = clock;
  assign gpio_module_0_reset = reset;
  assign gpio_module_0_io_gpio_direction = gpio_direction_io_conf_output_0; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_0_io_gpio_output = gpio_output[0]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_0_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_0}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_0_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_0}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_0_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_0}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_0_io_pwm_polarity = pwm_polarity_io_conf_output_0; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_0_io_pwm_en = pwm_enable_io_conf_output_0; // @[GPIOPeripheral.scala 72:32]
  assign gpio_module_1_clock = clock;
  assign gpio_module_1_reset = reset;
  assign gpio_module_1_io_gpio_direction = gpio_direction_io_conf_output_1; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_1_io_gpio_output = gpio_output[1]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_1_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_1}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_1_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_1}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_1_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_1}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_1_io_pwm_polarity = pwm_polarity_io_conf_output_1; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_1_io_pwm_en = pwm_enable_io_conf_output_1; // @[GPIOPeripheral.scala 72:32]
  assign gpio_module_2_clock = clock;
  assign gpio_module_2_reset = reset;
  assign gpio_module_2_io_gpio_direction = gpio_direction_io_conf_output_2; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_2_io_gpio_output = gpio_output[2]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_2_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_2}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_2_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_2}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_2_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_2}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_2_io_pwm_polarity = pwm_polarity_io_conf_output_2; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_2_io_pwm_en = pwm_enable_io_conf_output_2; // @[GPIOPeripheral.scala 72:32]
  assign gpio_module_3_clock = clock;
  assign gpio_module_3_reset = reset;
  assign gpio_module_3_io_gpio_direction = gpio_direction_io_conf_output_3; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_3_io_gpio_output = gpio_output[3]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_3_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_3}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_3_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_3}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_3_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_3}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_3_io_pwm_polarity = pwm_polarity_io_conf_output_3; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_3_io_pwm_en = pwm_enable_io_conf_output_3; // @[GPIOPeripheral.scala 72:32]
  assign gpio_module_4_clock = clock;
  assign gpio_module_4_reset = reset;
  assign gpio_module_4_io_gpio_direction = gpio_direction_io_conf_output_4; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_4_io_gpio_output = gpio_output[4]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_4_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_4}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_4_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_4}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_4_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_4}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_4_io_pwm_polarity = pwm_polarity_io_conf_output_4; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_4_io_pwm_en = pwm_enable_io_conf_output_4; // @[GPIOPeripheral.scala 72:32]
  assign gpio_module_5_clock = clock;
  assign gpio_module_5_reset = reset;
  assign gpio_module_5_io_gpio_direction = gpio_direction_io_conf_output_5; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_5_io_gpio_output = gpio_output[5]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_5_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_5}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_5_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_5}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_5_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_5}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_5_io_pwm_polarity = pwm_polarity_io_conf_output_5; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_5_io_pwm_en = pwm_enable_io_conf_output_5; // @[GPIOPeripheral.scala 72:32]
  assign gpio_module_6_clock = clock;
  assign gpio_module_6_reset = reset;
  assign gpio_module_6_io_gpio_direction = gpio_direction_io_conf_output_6; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_6_io_gpio_output = gpio_output[6]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_6_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_6}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_6_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_6}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_6_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_6}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_6_io_pwm_polarity = pwm_polarity_io_conf_output_6; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_6_io_pwm_en = pwm_enable_io_conf_output_6; // @[GPIOPeripheral.scala 72:32]
  assign gpio_module_7_clock = clock;
  assign gpio_module_7_reset = reset;
  assign gpio_module_7_io_gpio_direction = gpio_direction_io_conf_output_7; // @[GPIOPeripheral.scala 67:32]
  assign gpio_module_7_io_gpio_output = gpio_output[7]; // @[GPIOPeripheral.scala 65:46]
  assign gpio_module_7_io_pwm_div = {{7'd0}, pwm_div_io_conf_output_7}; // @[GPIOPeripheral.scala 73:32]
  assign gpio_module_7_io_duty_cycle = {{7'd0}, pwm_duty_cycle_io_conf_output_7}; // @[GPIOPeripheral.scala 74:32]
  assign gpio_module_7_io_pwm_period = {{7'd0}, pwm_period_io_conf_output_7}; // @[GPIOPeripheral.scala 75:32]
  assign gpio_module_7_io_pwm_polarity = pwm_polarity_io_conf_output_7; // @[GPIOPeripheral.scala 76:32]
  assign gpio_module_7_io_pwm_en = pwm_enable_io_conf_output_7; // @[GPIOPeripheral.scala 72:32]
  always @(posedge clock) begin
    gpio_output <= _GEN_266[7:0]; // @[GPIOPeripheral.scala 46:{38,38}]
    gpio_input_0 <= {{7'd0}, _GEN_242};
    gpio_input_1 <= {{7'd0}, _GEN_243};
    gpio_input_2 <= {{7'd0}, _GEN_244};
    gpio_input_3 <= {{7'd0}, _GEN_245};
    gpio_input_4 <= {{7'd0}, _GEN_246};
    gpio_input_5 <= {{7'd0}, _GEN_247};
    gpio_input_6 <= {{7'd0}, _GEN_248};
    gpio_input_7 <= {{7'd0}, _GEN_249};
    if (reset) begin // @[GPIOPeripheral.scala 133:50]
      rdAckReg <= 1'h0; // @[GPIOPeripheral.scala 133:50]
    end else if (3'h0 == read_state_reg) begin // @[GPIOPeripheral.scala 157:29]
      rdAckReg <= 1'h0; // @[GPIOPeripheral.scala 159:29]
    end else begin
      rdAckReg <= _GEN_68;
    end
    if (reset) begin // @[GPIOPeripheral.scala 134:50]
      wrAckReg <= 1'h0; // @[GPIOPeripheral.scala 134:50]
    end else if (3'h0 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
      wrAckReg <= 1'h0; // @[GPIOPeripheral.scala 251:37]
    end else begin
      wrAckReg <= _GEN_215;
    end
    para_read_en <= reset | _GEN_82; // @[GPIOPeripheral.scala 141:{34,34}]
    if (reset) begin // @[GPIOPeripheral.scala 142:34]
      readReg <= 32'h0; // @[GPIOPeripheral.scala 142:34]
    end else if (para_read_en) begin // @[GPIOPeripheral.scala 148:25]
      readReg <= parallel_read; // @[GPIOPeripheral.scala 149:25]
    end else begin
      readReg <= {{24'd0}, _readReg_T_1}; // @[GPIOPeripheral.scala 151:25]
    end
    if (reset) begin // @[GPIOPeripheral.scala 154:34]
      read_state_reg <= 3'h0; // @[GPIOPeripheral.scala 154:34]
    end else if (3'h0 == read_state_reg) begin // @[GPIOPeripheral.scala 157:29]
      if (io_mem_ifc_rd) begin // @[GPIOPeripheral.scala 162:33]
        if (_T_5) begin // @[GPIOPeripheral.scala 165:17]
          read_state_reg <= 3'h4; // @[GPIOPeripheral.scala 167:41]
        end else begin
          read_state_reg <= 3'h2; // @[GPIOPeripheral.scala 170:41]
        end
      end
    end else if (3'h4 == read_state_reg) begin // @[GPIOPeripheral.scala 157:29]
      read_state_reg <= 3'h0; // @[GPIOPeripheral.scala 182:37]
    end else if (3'h2 == read_state_reg) begin // @[GPIOPeripheral.scala 157:29]
      read_state_reg <= {{1'd0}, _GEN_51};
    end else begin
      read_state_reg <= _GEN_53;
    end
    if (reset) begin // @[GPIOPeripheral.scala 155:34]
      n_shift_read <= 4'h0; // @[GPIOPeripheral.scala 155:34]
    end else if (3'h0 == read_state_reg) begin // @[GPIOPeripheral.scala 157:29]
      n_shift_read <= 4'h0; // @[GPIOPeripheral.scala 160:29]
    end else if (!(3'h4 == read_state_reg)) begin // @[GPIOPeripheral.scala 157:29]
      if (3'h2 == read_state_reg) begin // @[GPIOPeripheral.scala 157:29]
        n_shift_read <= _GEN_50;
      end
    end
    para_write_en <= reset | _GEN_237; // @[GPIOPeripheral.scala 236:{38,38}]
    if (reset) begin // @[GPIOPeripheral.scala 237:38]
      writeReg <= 32'h0; // @[GPIOPeripheral.scala 237:38]
    end else if (3'h0 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
      writeReg <= io_mem_ifc_wrData; // @[GPIOPeripheral.scala 255:37]
    end else if (para_write_en) begin // @[GPIOPeripheral.scala 240:26]
      writeReg <= io_mem_ifc_wrData; // @[GPIOPeripheral.scala 241:29]
    end else begin
      writeReg <= {{24'd0}, _writeReg_T_2}; // @[GPIOPeripheral.scala 243:29]
    end
    if (reset) begin // @[GPIOPeripheral.scala 238:38]
      writeAddrReg <= 32'h0; // @[GPIOPeripheral.scala 238:38]
    end else if (3'h0 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
      writeAddrReg <= io_mem_ifc_address; // @[GPIOPeripheral.scala 256:37]
    end
    if (reset) begin // @[GPIOPeripheral.scala 246:38]
      write_state_reg <= 3'h0; // @[GPIOPeripheral.scala 246:38]
    end else if (3'h0 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
      if (io_mem_ifc_wr) begin // @[GPIOPeripheral.scala 258:33]
        if (_T_30) begin // @[GPIOPeripheral.scala 261:17]
          write_state_reg <= 3'h4; // @[GPIOPeripheral.scala 262:43]
        end else begin
          write_state_reg <= 3'h2; // @[GPIOPeripheral.scala 265:43]
        end
      end
    end else if (3'h4 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
      write_state_reg <= 3'h0; // @[GPIOPeripheral.scala 277:37]
    end else if (3'h2 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
      write_state_reg <= {{1'd0}, _GEN_182};
    end else begin
      write_state_reg <= _GEN_185;
    end
    if (reset) begin // @[GPIOPeripheral.scala 247:38]
      n_shift_write <= 4'h0; // @[GPIOPeripheral.scala 247:38]
    end else if (3'h0 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
      n_shift_write <= 4'h0; // @[GPIOPeripheral.scala 252:37]
    end else if (!(3'h4 == write_state_reg)) begin // @[GPIOPeripheral.scala 249:30]
      if (3'h2 == write_state_reg) begin // @[GPIOPeripheral.scala 249:30]
        n_shift_write <= _GEN_181;
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
  gpio_output = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  gpio_input_0 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  gpio_input_1 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  gpio_input_2 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  gpio_input_3 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  gpio_input_4 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  gpio_input_5 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  gpio_input_6 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  gpio_input_7 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  rdAckReg = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  wrAckReg = _RAND_10[0:0];
  _RAND_11 = {1{`RANDOM}};
  para_read_en = _RAND_11[0:0];
  _RAND_12 = {1{`RANDOM}};
  readReg = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  read_state_reg = _RAND_13[2:0];
  _RAND_14 = {1{`RANDOM}};
  n_shift_read = _RAND_14[3:0];
  _RAND_15 = {1{`RANDOM}};
  para_write_en = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  writeReg = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  writeAddrReg = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  write_state_reg = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  n_shift_write = _RAND_19[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module NativeMemory2Pipecon(
  input         clock,
  input         reset,
  input  [31:0] io_pipe_address,
  input         io_pipe_rd,
  input         io_pipe_wr,
  output [31:0] io_pipe_rdData,
  input  [31:0] io_pipe_wrData,
  input  [3:0]  io_pipe_wrMask,
  output        io_pipe_ack,
  output [8:0]  io_native_address,
  output [31:0] io_native_wdata,
  input  [31:0] io_native_rdata,
  output        io_native_cs,
  output [3:0]  io_native_wmask,
  output        io_native_wen
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  ackreg; // @[NativeMemory2Pipecon.scala 13:23]
  wire  enable = io_pipe_rd | io_pipe_wr; // @[NativeMemory2Pipecon.scala 14:27]
  assign io_pipe_rdData = io_native_rdata; // @[NativeMemory2Pipecon.scala 27:18]
  assign io_pipe_ack = ackreg; // @[NativeMemory2Pipecon.scala 23:15]
  assign io_native_address = io_pipe_address[8:0]; // @[NativeMemory2Pipecon.scala 26:39]
  assign io_native_wdata = io_pipe_wrData; // @[NativeMemory2Pipecon.scala 28:19]
  assign io_native_cs = ~enable; // @[NativeMemory2Pipecon.scala 17:19]
  assign io_native_wmask = io_pipe_wrMask; // @[NativeMemory2Pipecon.scala 18:19]
  assign io_native_wen = ~io_pipe_wr; // @[NativeMemory2Pipecon.scala 19:20]
endmodule
module TopLevel(
  input         clock,
  input         reset,
  output [8:0]  io_mem_address,
  output [31:0] io_mem_wdata,
  input  [31:0] io_mem_rdata,
  output        io_mem_cs,
  output [3:0]  io_mem_wmask,
  output        io_mem_wen
);
  wire  cpu_clock; // @[TopLevel.scala 36:19]
  wire  cpu_reset; // @[TopLevel.scala 36:19]
  wire [31:0] cpu_io_dmem_rdAddress; // @[TopLevel.scala 36:19]
  wire [31:0] cpu_io_dmem_rdData; // @[TopLevel.scala 36:19]
  wire  cpu_io_dmem_rdEnable; // @[TopLevel.scala 36:19]
  wire [31:0] cpu_io_dmem_wrAddress; // @[TopLevel.scala 36:19]
  wire [31:0] cpu_io_dmem_wrData; // @[TopLevel.scala 36:19]
  wire  cpu_io_dmem_wrEnable_0; // @[TopLevel.scala 36:19]
  wire  cpu_io_dmem_wrEnable_1; // @[TopLevel.scala 36:19]
  wire  cpu_io_dmem_wrEnable_2; // @[TopLevel.scala 36:19]
  wire  cpu_io_dmem_wrEnable_3; // @[TopLevel.scala 36:19]
  wire  interconnect__clock; // @[TopLevel.scala 45:28]
  wire  interconnect__reset; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_0_rd; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_0_rdData; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_0_wrData; // @[TopLevel.scala 45:28]
  wire [3:0] interconnect__io_device_0_wrMask; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_0_ack; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_1_rd; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_1_rdData; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_1_wrData; // @[TopLevel.scala 45:28]
  wire [3:0] interconnect__io_device_1_wrMask; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_1_ack; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_2_address; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_2_rd; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_2_wr; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_2_rdData; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_2_wrData; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_2_ack; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_3_address; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_3_rd; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_3_wr; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_3_rdData; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_device_3_wrData; // @[TopLevel.scala 45:28]
  wire [3:0] interconnect__io_device_3_wrMask; // @[TopLevel.scala 45:28]
  wire  interconnect__io_device_3_ack; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_dmem_rdAddress; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_dmem_rdData; // @[TopLevel.scala 45:28]
  wire  interconnect__io_dmem_rdEnable; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_dmem_wrAddress; // @[TopLevel.scala 45:28]
  wire [31:0] interconnect__io_dmem_wrData; // @[TopLevel.scala 45:28]
  wire  interconnect__io_dmem_wrEnable_0; // @[TopLevel.scala 45:28]
  wire  interconnect__io_dmem_wrEnable_1; // @[TopLevel.scala 45:28]
  wire  interconnect__io_dmem_wrEnable_2; // @[TopLevel.scala 45:28]
  wire  interconnect__io_dmem_wrEnable_3; // @[TopLevel.scala 45:28]
  wire  UARTPeripheral_clock; // @[TopLevel.scala 51:30]
  wire  UARTPeripheral_reset; // @[TopLevel.scala 51:30]
  wire  UARTPeripheral_io_rd; // @[TopLevel.scala 51:30]
  wire [31:0] UARTPeripheral_io_rdData; // @[TopLevel.scala 51:30]
  wire [31:0] UARTPeripheral_io_wrData; // @[TopLevel.scala 51:30]
  wire [3:0] UARTPeripheral_io_wrMask; // @[TopLevel.scala 51:30]
  wire  UARTPeripheral_io_ack; // @[TopLevel.scala 51:30]
  wire  SPIPeripheral_clock; // @[TopLevel.scala 52:29]
  wire  SPIPeripheral_reset; // @[TopLevel.scala 52:29]
  wire  SPIPeripheral_io_rd; // @[TopLevel.scala 52:29]
  wire [31:0] SPIPeripheral_io_rdData; // @[TopLevel.scala 52:29]
  wire [31:0] SPIPeripheral_io_wrData; // @[TopLevel.scala 52:29]
  wire [3:0] SPIPeripheral_io_wrMask; // @[TopLevel.scala 52:29]
  wire  SPIPeripheral_io_ack; // @[TopLevel.scala 52:29]
  wire  GPIOPeripheral_clock; // @[TopLevel.scala 53:30]
  wire  GPIOPeripheral_reset; // @[TopLevel.scala 53:30]
  wire [31:0] GPIOPeripheral_io_mem_ifc_address; // @[TopLevel.scala 53:30]
  wire  GPIOPeripheral_io_mem_ifc_rd; // @[TopLevel.scala 53:30]
  wire  GPIOPeripheral_io_mem_ifc_wr; // @[TopLevel.scala 53:30]
  wire [31:0] GPIOPeripheral_io_mem_ifc_rdData; // @[TopLevel.scala 53:30]
  wire [31:0] GPIOPeripheral_io_mem_ifc_wrData; // @[TopLevel.scala 53:30]
  wire  GPIOPeripheral_io_mem_ifc_ack; // @[TopLevel.scala 53:30]
  wire  NativeMemory2Pipecon_clock; // @[TopLevel.scala 54:36]
  wire  NativeMemory2Pipecon_reset; // @[TopLevel.scala 54:36]
  wire [31:0] NativeMemory2Pipecon_io_pipe_address; // @[TopLevel.scala 54:36]
  wire  NativeMemory2Pipecon_io_pipe_rd; // @[TopLevel.scala 54:36]
  wire  NativeMemory2Pipecon_io_pipe_wr; // @[TopLevel.scala 54:36]
  wire [31:0] NativeMemory2Pipecon_io_pipe_rdData; // @[TopLevel.scala 54:36]
  wire [31:0] NativeMemory2Pipecon_io_pipe_wrData; // @[TopLevel.scala 54:36]
  wire [3:0] NativeMemory2Pipecon_io_pipe_wrMask; // @[TopLevel.scala 54:36]
  wire  NativeMemory2Pipecon_io_pipe_ack; // @[TopLevel.scala 54:36]
  wire [8:0] NativeMemory2Pipecon_io_native_address; // @[TopLevel.scala 54:36]
  wire [31:0] NativeMemory2Pipecon_io_native_wdata; // @[TopLevel.scala 54:36]
  wire [31:0] NativeMemory2Pipecon_io_native_rdata; // @[TopLevel.scala 54:36]
  wire  NativeMemory2Pipecon_io_native_cs; // @[TopLevel.scala 54:36]
  wire [3:0] NativeMemory2Pipecon_io_native_wmask; // @[TopLevel.scala 54:36]
  wire  NativeMemory2Pipecon_io_native_wen; // @[TopLevel.scala 54:36]
  ThreeCats cpu ( // @[TopLevel.scala 36:19]
    .clock(cpu_clock),
    .reset(cpu_reset),
    .io_dmem_rdAddress(cpu_io_dmem_rdAddress),
    .io_dmem_rdData(cpu_io_dmem_rdData),
    .io_dmem_rdEnable(cpu_io_dmem_rdEnable),
    .io_dmem_wrAddress(cpu_io_dmem_wrAddress),
    .io_dmem_wrData(cpu_io_dmem_wrData),
    .io_dmem_wrEnable_0(cpu_io_dmem_wrEnable_0),
    .io_dmem_wrEnable_1(cpu_io_dmem_wrEnable_1),
    .io_dmem_wrEnable_2(cpu_io_dmem_wrEnable_2),
    .io_dmem_wrEnable_3(cpu_io_dmem_wrEnable_3)
  );
  PipeConInterconnect interconnect_ ( // @[TopLevel.scala 45:28]
    .clock(interconnect__clock),
    .reset(interconnect__reset),
    .io_device_0_rd(interconnect__io_device_0_rd),
    .io_device_0_rdData(interconnect__io_device_0_rdData),
    .io_device_0_wrData(interconnect__io_device_0_wrData),
    .io_device_0_wrMask(interconnect__io_device_0_wrMask),
    .io_device_0_ack(interconnect__io_device_0_ack),
    .io_device_1_rd(interconnect__io_device_1_rd),
    .io_device_1_rdData(interconnect__io_device_1_rdData),
    .io_device_1_wrData(interconnect__io_device_1_wrData),
    .io_device_1_wrMask(interconnect__io_device_1_wrMask),
    .io_device_1_ack(interconnect__io_device_1_ack),
    .io_device_2_address(interconnect__io_device_2_address),
    .io_device_2_rd(interconnect__io_device_2_rd),
    .io_device_2_wr(interconnect__io_device_2_wr),
    .io_device_2_rdData(interconnect__io_device_2_rdData),
    .io_device_2_wrData(interconnect__io_device_2_wrData),
    .io_device_2_ack(interconnect__io_device_2_ack),
    .io_device_3_address(interconnect__io_device_3_address),
    .io_device_3_rd(interconnect__io_device_3_rd),
    .io_device_3_wr(interconnect__io_device_3_wr),
    .io_device_3_rdData(interconnect__io_device_3_rdData),
    .io_device_3_wrData(interconnect__io_device_3_wrData),
    .io_device_3_wrMask(interconnect__io_device_3_wrMask),
    .io_device_3_ack(interconnect__io_device_3_ack),
    .io_dmem_rdAddress(interconnect__io_dmem_rdAddress),
    .io_dmem_rdData(interconnect__io_dmem_rdData),
    .io_dmem_rdEnable(interconnect__io_dmem_rdEnable),
    .io_dmem_wrAddress(interconnect__io_dmem_wrAddress),
    .io_dmem_wrData(interconnect__io_dmem_wrData),
    .io_dmem_wrEnable_0(interconnect__io_dmem_wrEnable_0),
    .io_dmem_wrEnable_1(interconnect__io_dmem_wrEnable_1),
    .io_dmem_wrEnable_2(interconnect__io_dmem_wrEnable_2),
    .io_dmem_wrEnable_3(interconnect__io_dmem_wrEnable_3)
  );
  UARTPeripheral UARTPeripheral ( // @[TopLevel.scala 51:30]
    .clock(UARTPeripheral_clock),
    .reset(UARTPeripheral_reset),
    .io_rd(UARTPeripheral_io_rd),
    .io_rdData(UARTPeripheral_io_rdData),
    .io_wrData(UARTPeripheral_io_wrData),
    .io_wrMask(UARTPeripheral_io_wrMask),
    .io_ack(UARTPeripheral_io_ack)
  );
  SPIPeripheral SPIPeripheral ( // @[TopLevel.scala 52:29]
    .clock(SPIPeripheral_clock),
    .reset(SPIPeripheral_reset),
    .io_rd(SPIPeripheral_io_rd),
    .io_rdData(SPIPeripheral_io_rdData),
    .io_wrData(SPIPeripheral_io_wrData),
    .io_wrMask(SPIPeripheral_io_wrMask),
    .io_ack(SPIPeripheral_io_ack)
  );
  GPIOPeripheral GPIOPeripheral ( // @[TopLevel.scala 53:30]
    .clock(GPIOPeripheral_clock),
    .reset(GPIOPeripheral_reset),
    .io_mem_ifc_address(GPIOPeripheral_io_mem_ifc_address),
    .io_mem_ifc_rd(GPIOPeripheral_io_mem_ifc_rd),
    .io_mem_ifc_wr(GPIOPeripheral_io_mem_ifc_wr),
    .io_mem_ifc_rdData(GPIOPeripheral_io_mem_ifc_rdData),
    .io_mem_ifc_wrData(GPIOPeripheral_io_mem_ifc_wrData),
    .io_mem_ifc_ack(GPIOPeripheral_io_mem_ifc_ack)
  );
  NativeMemory2Pipecon NativeMemory2Pipecon ( // @[TopLevel.scala 54:36]
    .clock(NativeMemory2Pipecon_clock),
    .reset(NativeMemory2Pipecon_reset),
    .io_pipe_address(NativeMemory2Pipecon_io_pipe_address),
    .io_pipe_rd(NativeMemory2Pipecon_io_pipe_rd),
    .io_pipe_wr(NativeMemory2Pipecon_io_pipe_wr),
    .io_pipe_rdData(NativeMemory2Pipecon_io_pipe_rdData),
    .io_pipe_wrData(NativeMemory2Pipecon_io_pipe_wrData),
    .io_pipe_wrMask(NativeMemory2Pipecon_io_pipe_wrMask),
    .io_pipe_ack(NativeMemory2Pipecon_io_pipe_ack),
    .io_native_address(NativeMemory2Pipecon_io_native_address),
    .io_native_wdata(NativeMemory2Pipecon_io_native_wdata),
    .io_native_rdata(NativeMemory2Pipecon_io_native_rdata),
    .io_native_cs(NativeMemory2Pipecon_io_native_cs),
    .io_native_wmask(NativeMemory2Pipecon_io_native_wmask),
    .io_native_wen(NativeMemory2Pipecon_io_native_wen)
  );
  assign io_mem_address = NativeMemory2Pipecon_io_native_address; // @[TopLevel.scala 81:34]
  assign io_mem_wdata = NativeMemory2Pipecon_io_native_wdata; // @[TopLevel.scala 81:34]
  assign io_mem_cs = NativeMemory2Pipecon_io_native_cs; // @[TopLevel.scala 81:34]
  assign io_mem_wmask = NativeMemory2Pipecon_io_native_wmask; // @[TopLevel.scala 81:34]
  assign io_mem_wen = NativeMemory2Pipecon_io_native_wen; // @[TopLevel.scala 81:34]
  assign cpu_clock = clock;
  assign cpu_reset = reset;
  assign cpu_io_dmem_rdData = interconnect__io_dmem_rdData; // @[TopLevel.scala 97:24]
  assign interconnect__clock = clock;
  assign interconnect__reset = reset;
  assign interconnect__io_device_0_rdData = UARTPeripheral_io_rdData; // @[TopLevel.scala 57:21]
  assign interconnect__io_device_0_ack = UARTPeripheral_io_ack; // @[TopLevel.scala 57:21]
  assign interconnect__io_device_1_rdData = SPIPeripheral_io_rdData; // @[TopLevel.scala 58:20]
  assign interconnect__io_device_1_ack = SPIPeripheral_io_ack; // @[TopLevel.scala 58:20]
  assign interconnect__io_device_2_rdData = GPIOPeripheral_io_mem_ifc_rdData; // @[TopLevel.scala 59:29]
  assign interconnect__io_device_2_ack = GPIOPeripheral_io_mem_ifc_ack; // @[TopLevel.scala 59:29]
  assign interconnect__io_device_3_rdData = NativeMemory2Pipecon_io_pipe_rdData; // @[TopLevel.scala 60:32]
  assign interconnect__io_device_3_ack = NativeMemory2Pipecon_io_pipe_ack; // @[TopLevel.scala 60:32]
  assign interconnect__io_dmem_rdAddress = cpu_io_dmem_rdAddress; // @[TopLevel.scala 97:24]
  assign interconnect__io_dmem_rdEnable = cpu_io_dmem_rdEnable; // @[TopLevel.scala 97:24]
  assign interconnect__io_dmem_wrAddress = cpu_io_dmem_wrAddress; // @[TopLevel.scala 97:24]
  assign interconnect__io_dmem_wrData = cpu_io_dmem_wrData; // @[TopLevel.scala 97:24]
  assign interconnect__io_dmem_wrEnable_0 = cpu_io_dmem_wrEnable_0; // @[TopLevel.scala 97:24]
  assign interconnect__io_dmem_wrEnable_1 = cpu_io_dmem_wrEnable_1; // @[TopLevel.scala 97:24]
  assign interconnect__io_dmem_wrEnable_2 = cpu_io_dmem_wrEnable_2; // @[TopLevel.scala 97:24]
  assign interconnect__io_dmem_wrEnable_3 = cpu_io_dmem_wrEnable_3; // @[TopLevel.scala 97:24]
  assign UARTPeripheral_clock = clock;
  assign UARTPeripheral_reset = reset;
  assign UARTPeripheral_io_rd = interconnect__io_device_0_rd; // @[TopLevel.scala 57:21]
  assign UARTPeripheral_io_wrData = interconnect__io_device_0_wrData; // @[TopLevel.scala 57:21]
  assign UARTPeripheral_io_wrMask = interconnect__io_device_0_wrMask; // @[TopLevel.scala 57:21]
  assign SPIPeripheral_clock = clock;
  assign SPIPeripheral_reset = reset;
  assign SPIPeripheral_io_rd = interconnect__io_device_1_rd; // @[TopLevel.scala 58:20]
  assign SPIPeripheral_io_wrData = interconnect__io_device_1_wrData; // @[TopLevel.scala 58:20]
  assign SPIPeripheral_io_wrMask = interconnect__io_device_1_wrMask; // @[TopLevel.scala 58:20]
  assign GPIOPeripheral_clock = clock;
  assign GPIOPeripheral_reset = reset;
  assign GPIOPeripheral_io_mem_ifc_address = interconnect__io_device_2_address; // @[TopLevel.scala 59:29]
  assign GPIOPeripheral_io_mem_ifc_rd = interconnect__io_device_2_rd; // @[TopLevel.scala 59:29]
  assign GPIOPeripheral_io_mem_ifc_wr = interconnect__io_device_2_wr; // @[TopLevel.scala 59:29]
  assign GPIOPeripheral_io_mem_ifc_wrData = interconnect__io_device_2_wrData; // @[TopLevel.scala 59:29]
  assign NativeMemory2Pipecon_clock = clock;
  assign NativeMemory2Pipecon_reset = reset;
  assign NativeMemory2Pipecon_io_pipe_address = interconnect__io_device_3_address; // @[TopLevel.scala 60:32]
  assign NativeMemory2Pipecon_io_pipe_rd = interconnect__io_device_3_rd; // @[TopLevel.scala 60:32]
  assign NativeMemory2Pipecon_io_pipe_wr = interconnect__io_device_3_wr; // @[TopLevel.scala 60:32]
  assign NativeMemory2Pipecon_io_pipe_wrData = interconnect__io_device_3_wrData; // @[TopLevel.scala 60:32]
  assign NativeMemory2Pipecon_io_pipe_wrMask = interconnect__io_device_3_wrMask; // @[TopLevel.scala 60:32]
  assign NativeMemory2Pipecon_io_native_rdata = io_mem_rdata; // @[TopLevel.scala 81:34]
endmodule
module CaravelTopLevel(
  input          io_caravel_wb_clk_i,
  input          io_caravel_wb_rst_i,
  input          io_caravel_wbs_stb_i,
  input          io_caravel_wbs_cyc_i,
  input          io_caravel_wbs_we_i,
  input  [3:0]   io_caravel_wbs_sel_i,
  input  [31:0]  io_caravel_wbs_dat_i,
  input  [31:0]  io_caravel_wbs_adr_i,
  output         io_caravel_wbs_ack_o,
  output [31:0]  io_caravel_wbs_dat_o,
  input  [127:0] io_caravel_la_data_in,
  output [127:0] io_caravel_la_data_out,
  input  [127:0] io_caravel_la_oenb,
  input  [37:0]  io_caravel_io_in,
  output [37:0]  io_caravel_io_out,
  output [37:0]  io_caravel_io_oeb,
  input          io_caravel_user_clock2,
  output [2:0]   io_caravel_user_irq,
  output [8:0]   io_mem_address,
  output [31:0]  io_mem_wdata,
  input  [31:0]  io_mem_rdata,
  output         io_mem_cs,
  output [3:0]   io_mem_wmask,
  output         io_mem_wen,
  output [8:0]   io_mem2_address,
  input  [31:0]  io_mem2_rdata,
  output         io_mem2_cs
);
  wire  topLevel_clock; // @[CaravelTopLevel.scala 152:26]
  wire  topLevel_reset; // @[CaravelTopLevel.scala 152:26]
  wire [8:0] topLevel_io_mem_address; // @[CaravelTopLevel.scala 152:26]
  wire [31:0] topLevel_io_mem_wdata; // @[CaravelTopLevel.scala 152:26]
  wire [31:0] topLevel_io_mem_rdata; // @[CaravelTopLevel.scala 152:26]
  wire  topLevel_io_mem_cs; // @[CaravelTopLevel.scala 152:26]
  wire [3:0] topLevel_io_mem_wmask; // @[CaravelTopLevel.scala 152:26]
  wire  topLevel_io_mem_wen; // @[CaravelTopLevel.scala 152:26]
  wire  _io_caravel_la_data_out_T = ~io_caravel_wb_rst_i; // @[CaravelTopLevel.scala 165:31]
  TopLevel topLevel ( // @[CaravelTopLevel.scala 152:26]
    .clock(topLevel_clock),
    .reset(topLevel_reset),
    .io_mem_address(topLevel_io_mem_address),
    .io_mem_wdata(topLevel_io_mem_wdata),
    .io_mem_rdata(topLevel_io_mem_rdata),
    .io_mem_cs(topLevel_io_mem_cs),
    .io_mem_wmask(topLevel_io_mem_wmask),
    .io_mem_wen(topLevel_io_mem_wen)
  );
  assign io_caravel_wbs_ack_o = 1'h0; // @[CaravelTopLevel.scala 141:24]
  assign io_caravel_wbs_dat_o = 32'h0; // @[CaravelTopLevel.scala 142:24]
  assign io_caravel_la_data_out = {{127'd0}, _io_caravel_la_data_out_T}; // @[CaravelTopLevel.scala 165:28]
  assign io_caravel_io_out = 38'h0; // @[Cat.scala 33:92]
  assign io_caravel_io_oeb = 38'h0; // @[Cat.scala 33:92]
  assign io_caravel_user_irq = 3'h0;
  assign io_mem_address = topLevel_io_mem_address; // @[CaravelTopLevel.scala 155:21]
  assign io_mem_wdata = topLevel_io_mem_wdata; // @[CaravelTopLevel.scala 155:21]
  assign io_mem_cs = topLevel_io_mem_cs; // @[CaravelTopLevel.scala 155:21]
  assign io_mem_wmask = topLevel_io_mem_wmask; // @[CaravelTopLevel.scala 155:21]
  assign io_mem_wen = topLevel_io_mem_wen; // @[CaravelTopLevel.scala 155:21]
  assign io_mem2_address = 9'h0; // @[CaravelTopLevel.scala 147:19]
  assign io_mem2_cs = 1'h1; // @[CaravelTopLevel.scala 148:14]
  assign topLevel_clock = io_caravel_wb_clk_i; // @[CaravelTopLevel.scala 118:25 124:7]
  assign topLevel_reset = io_caravel_wb_rst_i; // @[CaravelTopLevel.scala 119:25 130:7]
  assign topLevel_io_mem_rdata = io_mem_rdata; // @[CaravelTopLevel.scala 155:21]
endmodule
