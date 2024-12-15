/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_example (
    input  wire [7:0] ui_in,    // Dedicated inputs (8 bits)
    output wire [7:0] uo_out,   // Dedicated outputs (8 bits)

    // The lines below are required by the TinyTapeout interface,
    // but we won't use them in this design.
    input  wire [7:0] uio_in,   
    output wire [7:0] uio_out,
    output wire [7:0] uio_oe,

    // Similarly, ena, clk, and rst_n are provided for power/clock/reset,
    // but we won't use them here.
    input  wire       ena,
    input  wire       clk,
    input  wire       rst_n
);

    // EXAMPLE LOGIC:
    // For demonstration, let's simply "swap the nibbles" of the 8-bit input.
    // ui_in[7:4] and ui_in[3:0] are reversed in order for the output.
    // Feel free to change this logic to something else!
    assign uo_out = {ui_in[3:0], ui_in[7:4]};

    // Since we're not using the "uio" pins, drive them low and set them as inputs.
    assign uio_out = 8'b0000_0000;
    assign uio_oe  = 8'b0000_0000;

    // Tie off unused signals to prevent warnings:
    wire _unused = &{ena, clk, rst_n, uio_in, 1'b0};

endmodule
