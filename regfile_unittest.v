`timescale 1ns / 1ps

module regfile_unittest();

    reg I_clk;
    reg I_en;
    reg I_we;
    reg I_selA;
    reg I_selB;
    reg I_selD;
    reg I_dataD;
    
    wire O_dataA;
    wire O_dataB;

reg_file reg_test(
    I_clk,
    I_en,
    I_we,
    I_selA,
    I_selB,
    I_selD,
    I_dataD,
     O_dataA,
     O_dataB
);

initial begin
    
    I_clk = 1'd0;
    I_dataD = 0;
    I_en = 0;
    I_selA = 0;
    I_selB = 0;
    I_selD = 0;
    I_we = 0;
    
    #7;
    I_en = 1'b1;
    I_selA = 3'b000;
    I_selB = 3'b001;
    I_selD = 3'b000;
    I_dataD = 16'hffff;
    I_we = 1'b1;
    
    #10;
    I_we = 1'b0;
    I_selD = 3'b010;
    I_dataD = 16'h2222;
    
    #10
    I_we = 1;
    
    #10
    I_dataD = 16'h3333;
    
    #10
    I_we = 0;
    I_selD = 3'b000;
    I_dataD = 16'hFEED;
    
    #10
    I_selD = 3'b000;
    I_dataD = 16'h4444;
    
    #10
    I_we = 1;

    #50
    I_selA = 3'b100;
    I_selB = 3'b100;
    
end

always begin
    #5 I_clk = ~I_clk;
end 

endmodule
