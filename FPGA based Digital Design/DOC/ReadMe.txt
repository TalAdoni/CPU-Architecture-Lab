Lab 4 – FPGA Based Digital Design
DE10 Standard Kit

Overview:
This project implements several fundamental digital design modules on the Terasic DE10-Standard FPGA development board using VHDL. The design demonstrates arithmetic, shifting, counting, GPIO interfacing, PWM generation, and hex-to-7-segment decoding. A top-level module integrates all submodules for synthesis, simulation, and on-board testing.

File List:
  • aux_package.vhd        – Shared type and constant definitions  
  • AdderSub.vhd           – 8-bit adder/subtractor with overflow flag  
  • Shifter.vhd            – Barrel shifter supporting logical shifts  
  • Reg.vhd                – 8-bit register with synchronous load and reset  
  • counter.vhd            – N-bit binary up/down counter with enable  
  • Logic.vhd              – Parameterizable logic unit (AND, OR, XOR, etc.)  
  • PWM_Output_Unit.vhd    – PWM generator with programmable duty cycle  
  • HexDecoder.vhd         – 4-bit to 7-segment display decoder  
  • GPIOtop.vhd            – GPIO interface tying switches, LEDs, and buttons  
  • top.vhd                – Top-level design instantiating all modules  
  • FA.vhd                 – Full adder module  
  • PLL.vhd                – Phase-locked loop clock management unit  

Prerequisites:
  • Intel Quartus Prime (version 20XX or later)  
  • Terasic DE10-Standard board  
  • USB-Blaster II programmer  

Project Setup:
1. Create a new Quartus project targeting the Cyclone V (5CSEBA6U23I7) device.  
2. Add all provided `.vhd` files to the project.  
3. Include the DE10_Standard.qsf file (or manually assign pins as listed below).  

Pin Assignments (example):
  • SW[7:0]   → Data inputs (GPIO switches)  
  • KEY[1:0]  → Reset and load buttons  
  • LEDR[7:0] → Data outputs (LEDs)  
  • HEX0–HEX3 → 7-segment displays  
  • HSMC_CLK  → PWM clock output  

Compilation & Programming:
1. Compile the design (Processing → Start Compilation).  
2. Inspect Timing Analyzer and ensure all timing constraints meet requirements.  
3. Connect the DE10 board via USB-Blaster and program the FPGA (Tools → Programmer).  

Simulation:
1. Open ModelSim-Altera or QuestaSim.  
2. Create a testbench for each module or the top-level design.  
3. Run functional simulation to verify correctness of arithmetic, shifting, counting, and PWM behavior.  

Usage:
  • Slide switches to select input values for the adder/subtractor, logic unit, or shifter.  
  • Press buttons to reset counters or load registers.  
  • Observe LED outputs and 7-segment displays for module responses.  
  • Adjust duty cycle in PWM unit via input switches and verify on oscilloscope.  

References:
  • Terasic DE10-Standard User Manual  
  • Intel Quartus Prime Handbook  

#The lab was created by Omri Aviram and Tal Adoni.#
