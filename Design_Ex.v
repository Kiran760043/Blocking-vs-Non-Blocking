///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Blocking vs Non-Blocking
// Engineer: kiran
// Reference: Nonblocking assignments in verilog synthesis by CE Cummings (Sunburst Design)
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module Design_Ex(clk,rst,x,y,z,xb,yb,zb);
    input  wire clk,rst;
    output reg x ,y ,z ;                    //Non-blocking 
    output reg xb,yb,zb;                    //Blocking 
    
    
    reg a = 1;
    reg b = 0;
    reg c = 1;
    
  //Blocking example  
    always@(posedge clk)
        begin
            if(rst) begin
                xb = 0;
                yb = 0;
                zb = 0;
            end else begin           //Correct Answers verify with the simulation
                xb = a | b;          //xb = 1
                yb = xb ^ c;         //yb = 0
                zb = yb;             //zb = 0
            end 
        end
    
  //Non - blocking example    
    always@(posedge clk)
        begin
            if(rst) begin
                x <= 0;
                y <= 0;
                z <= 0;
            end else begin          //Correct Answers verify with the simulation
                x <= a | b;         //x = 1
                y <= x ^ c;         //y = 0
                z <= y;             //z = 0
            end 
        end
    
endmodule
