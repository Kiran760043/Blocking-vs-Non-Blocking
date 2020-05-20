///////////////////////////////////////////////////////////////////////////////////////////
// Design Name: Blocking vs Non-Blocking
// Engineer: kiran
// Reference: Nonblocking assignments in verilog synthesis by CE Cummings (Sunburst Design)
///////////////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module test_bench();
    //input for DUT
        reg clk,rst;
    //outputs from DUT
        wire x,y,z,xb,yb,zb;
        
        Design_Ex DUT (.clk(clk),.rst(rst),.x(x),.y(y),.z(z),.xb(xb),.yb(yb),.zb(zb));
        
        initial
            begin
                $display($time," << SImulation Result >> ");
                $monitor($time,"clk=%b, rst=%b, x=%b, y=%b, z=%b, xb=%b, yb=%b, zb=%b", clk, rst, x, y, z, xb, yb, zb);
            end
            
        always #10 clk = ~clk;
        
        initial 
            begin
                rst = 1;
                clk = 1;
                #20
                rst = 0;
                #40
                $finish;
            end
endmodule
