module seq_tb();
reg x,clk,rst;
wire z;
seq_det dut(.x(x), .clk(clk), .rst(rst), .z(z));  //instantitaion the design

initial
begin
  clk = 0;
  forever #5 clk = ~clk; 
end

initial
begin
  $dumpfile("seq_det.vcd");   // Name of the VCD file
  $dumpvars(0, seq_tb);   // Dump all signals 

 $monitor("time = %t | x = %b | clk = %b | rst = %b || z = %b",$time, x, clk, rst, z);
  rst = 1'b1; #12;
  rst = 1'b0; #100;
  
  //inputs 
  
  #9 ; x = 0;
   #10; x = 1;
    #10; x = 0;
     #10; x = 1; 
     #10; x = 0;
      #10; x = 1; 
      #10; x = 0;
       #10; x = 1; 
       #10; x = 0; 
       #10; x = 1; 
       #10; x = 0; 
       #10; x = 1; 
      #50; $finish;

end
endmodule
