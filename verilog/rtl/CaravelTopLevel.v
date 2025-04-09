module CaravelTopLevel(
  input          io_wb_clk_i,
  input          io_wb_rst_i,
  input          io_wbs_stb_i,
  input          io_wbs_cyc_i,
  input          io_wbs_we_i,
  input  [3:0]   io_wbs_sel_i,
  input  [31:0]  io_wbs_dat_i,
  input  [31:0]  io_wbs_adr_i,
  output         io_wbs_ack_o,
  output [31:0]  io_wbs_dat_o,
  input  [127:0] io_la_data_in,
  output [127:0] io_la_data_out,
  input  [127:0] io_la_oenb,
  input  [37:0]  io_io_in,
  output [37:0]  io_io_out,
  output [37:0]  io_io_oeb,
  input          io_user_clock2,
  output [2:0]   io_user_irq
);
  wire  rst = ~io_la_oenb[65] ? io_la_data_in[65] : io_wb_rst_i; // @[CaravelTopLevel.scala 116:25 117:9 119:9]
  wire  _io_la_data_out_T = ~rst; // @[CaravelTopLevel.scala 123:23]
  assign io_wbs_ack_o = 1'h0;
  assign io_wbs_dat_o = 32'h0;
  assign io_la_data_out = {{127'd0}, _io_la_data_out_T}; // @[CaravelTopLevel.scala 123:20]
  assign io_io_out = 38'h0;
  assign io_io_oeb = 38'h0;
  assign io_user_irq = 3'h0;
endmodule
