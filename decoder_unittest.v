`timescale 1ns / 1ps

module decoder_unittest();

    reg I_clk;
    reg I_en;
    reg [15:0] I_inst;
    
    wire O_aluop;
    wire [3:0] O_selA;
    wire [3:0] O_selB;
    wire [3:0] O_selD;
    wire [15:0] O_imm;
    wire       O_regwe ;
    
inst_dec inst_unit(
    I_clk,
    I_en,
    I_inst,
    O_aluop,
    O_selA,
    O_selB,
    O_selD,
     O_imm,
     O_regwe );
     
     
     initial begin
        
        I_clk = 0;
        I_en = 0;
        I_inst = 0;
        
        #10;
        I_inst = 16'b0001011100000100;
        
        #10;
        I_en=1;
        
     end
     
     always begin
        #5;
        I_clk = ~I_clk;
     end
endmodule
