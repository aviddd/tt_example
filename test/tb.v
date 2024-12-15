`default_nettype none
`timescale 1ns / 1ps

/*
 * Simple Verilog testbench that instantiates tt_um_example
 * and dumps waveforms to a VCD file. 
 * cocotb will drive the signals in simulation.
 */

module tb ();

  // Dump the signals to a VCD file for viewing in GTKWave.
  initial begin
    $dumpfile("tb.vcd");
    $dumpvars(0, tb);
    #1;
  end

  // Declare testbench wires/regs
  reg        clk;
  reg        rst_n;
  reg        ena;
  reg  [7:0] ui_in;
  reg  [7:0] uio_in;
  wire [7:0] uo_out;
  wire [7:0] uio_out;
  wire [7:0] uio_oe;

`ifdef GL_TEST
  wire VPWR = 1'b1;
  wire VGND = 1'b0;
`endif

  // Instantiate the user module
  tt_um_example user_project (
`ifdef GL_TEST
      .VPWR   (VPWR),
      .VGND   (VGND),
`endif
      .ui_in  (ui_in),
      .uo_out (uo_out),
      .uio_in (uio_in),
      .uio_out(uio_out),
      .uio_oe (uio_oe),
      .ena    (ena),
      .clk    (clk),
      .rst_n  (rst_n)
  );

  // Note: We do not generate the clock or reset logic here;
  // Cocotb will drive these signals during simulation.

endmodule
