`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.02.2024 21:08:46
// Design Name: 
// Module Name: Booth_tb
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


module Booth_tb();
    reg [7:0]data1,data2;
    reg clk, start,reset;
    wire [15:0]result;
    wire clock;

//    wire [15:0] out_reg1, out_reg2, out_reg3, out_reg4;
//    wire [8:0] out1,out2,out3,out4;
//    wire [7:0] out_multiplier,out_multiplicand;
    
    
    Datapath dut(.data1(data1), .data2(data2), .clk_in(clk), .result(result), 
                  .start(start), .reset(reset),.clk(clock));
                  
                  
//                  ,.out_reg1(out_reg1), .out_reg2(out_reg2), .out_reg3(out_reg3), 
//                  .out_reg4(out_reg4),.out1(out1),.out2(out2),.out3(out3),.out4(out4)
//                  ,.out_multiplier(out_multiplier),.out_multiplicand(out_multiplicand)

    
    initial
     begin
       clk = 0;
       reset = 0;
       forever #5 clk = ~clk;
     end
     
     initial
        begin 
            reset = 0;
            start =0; data1=80; data2=-12;
            start =1;
            #365
            data1=-12; data2=-100;
            #10
            data1=17; data2=-100;
            #10
            data1=-128; data2=-128;
            #50 $finish;
        end
endmodule
