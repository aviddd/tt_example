<!---
This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

This user module takes an 8-bit input (`ui_in`) and **swaps the upper and lower 4-bit nibbles**. For example, if the input is `0xAB` (where `A` is 1010 and `B` is 1011 in binary), the output will be `0xBA`. The design is purely combinational and does not use the clock (`clk`), reset (`rst_n`), or enable (`ena`) signals.

### Pin Assignments

- **ui_in[7:0]**: The 8-bit input from the TinyTapeout padframe.
- **uo_out[7:0]**: The 8-bit output, which is the nibble-swapped version of `ui_in`.
- **uio_in, uio_out, uio_oe**: Not used in this project (all driven low).

## How to test

1. **Simulation with Cocotb**:
   - Use the provided Verilog testbench (`tb.v`) and cocotb test script (`test_project.py`).
   - Several test vectors (e.g. `0x00`, `0xFF`, `0xA5`, `0xF0`, etc.) are fed into `ui_in`.
   - The cocotb test checks if the output `uo_out` matches the expected nibble-swapped result.

2. **Waveform Viewing** (optional):
   - After running the simulation, open the generated `tb.vcd` file with a viewer like GTKWave to visualize input and output signals over time.

No clock-based or sequential behavior is used—this is strictly a combinational design.

## External hardware

No external hardware is required for this project. It solely relies on the 8 dedicated input pins and produces an 8-bit output. The additional I/O pins are disabled and driven low, making this design fully self-contained within TinyTapeout.
