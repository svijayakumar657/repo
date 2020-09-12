`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/21/2018 10:37:26 AM
// Design Name: 
// Module Name: top_module
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top_module(
    
    inout wire RESREF,
    input wire REFPADCLK_P,
    input wire REFPADCLK_N,
    input wire RX3P, 
    input wire RX3N, 
    input wire RX2P, 
    input wire RX2N, 
    input wire RX1P, 
    input wire RX1N, 
    input wire RX0P, 
    input wire RX0N, 
    output wire TX3P, 
    output wire TX3N, 
    output wire TX2P, 
    output wire TX2N, 
    output wire TX1P, 
    output wire TX1N, 
    output wire TX0P, 
    output wire TX0N,
    input wire [3:0] SLOTID
    );
    
    wire sys_clk;  
    wire sys_clk_in;
    
//Instantiating ZynqMP PS     
  
 wire sys_clk_ps;
   zynqmp_ps_wrapper zynqmp_ps
   (
    .sys_clk(sys_clk_ps)
   ); 

assign sys_clk=sys_clk_ps;
//  assign sys_clk_in = REFPADCLK_P;

         
//Instantiating tile_pcie_wrapper
    
    tile_pcie_wrapper top
    (
       // PCIe pads
       .RESREF(RESREF),
       .REFPADCLK_P(REFPADCLK_P),
       .REFPADCLK_M(REFPADCLK_N),
       .RX3P(RX3P),
       .RX3N(RX3N),
       .RX2P(RX2P),
       .RX2N(RX2N),
       .RX1P(RX1P),
       .RX1N(RX1N),
       .RX0P(RX0P),
       .RX0N(RX0N),
       .TX3P(TX3P),
       .TX3N(TX3N),
       .TX2P(TX2P),
       .TX2N(TX2N),
       .TX1P(TX1P),
       .TX1N(TX1N),
       .TX0P(TX0P),
       .TX0N(TX0N),
    
       .tcc_clk_gbl(sys_clk),
       .tcc_rst_gbl(~RESREF),
       .tcc_dbg_gbl(1'b0),
       .pcie_slot_num(SLOTID),   //pinouts are in reverse order in x4 and x12
       .pcie_vis_data(),
      .fuses_valid(1'b0),
       .spare_tcc_to_pcie(2'b11)
       //.fpga_version({8'd16, 8'd01})
    
       // JTAG
//       .jtag_tck(1'b0),
//       .jtag_tdi(1'b0),
//       .jtag_tms(1'b0), 
//       .jtag_trst_n(1'b0),
//       .jtag_tdo(),
//       .jtag_tdo_en()
    );
    
endmodule

