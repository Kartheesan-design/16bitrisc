`timescale 1ns / 1ps

module main_test();

reg clk;
reg reset;
reg we = 0;
reg [15:0]dataI = 0;

wire [2:0]selA;
wire [2:0]selB;
wire [2:0]selD;
wire [15:0]dataA;
wire [15:0]dataB;
wire [15:0]dataD;
wire [4:0]aluop;
wire [7:0]imm;
wire [15:0]dataO;
wire [1:0]opcode;
wire [15:0]pco;
wire shldBranch;
wire enfetch;
wire enalu;
wire endec;
wire enmem;
wire enrgrd;
wire enrgwr;

assign opcode = (reset)?2'b11:((shldBranch)?2'b10:((we)?2'b01:2'b00));

reg_file main_reg(
   clk,
   en,
   we,
   selA,
   selB,
   selD,
   dataD,
   dataA,
   dataB
);

inst_dec main_inst(
    clk,
    en,
    inst,
    aluop,
    selA,
    selB,
    selD,
    imm,
    regwe );
     
alu main_alu(
    clk,
    en,
    aluop,
    dataA,
    dataB,
    imm,

    dataResult,
    shldBranch
);
     
ctr_unit main_ctr(
     clk,
     reset,

     enfetch,
     endec,
     enrgrd,
     enalu,
     enrgwr,
     enmem
);

fake_ram main_ram(
    clk,
    we,
    addr,
    dataI,
    dataO
);

pc_unit main_pc(
   clk,
   opcode,
   dataD,
   pco
);

initial begin

    clk = 0;
    reset = 1;
    #20
    reset = 0;
    
end

always begin

#5 clk = ~clk;

end

endmodule
