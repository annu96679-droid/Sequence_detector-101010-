module seq_det(
    input wire x,
    input wire clk,
    input wire rst,

    output z
    );
    parameter s0 = 3'd0, s1 = 3'd1, s2 = 3'd2, s3 = 3'd3, s4 = 3'd4, s5 = 3'd5;  //state encoding
    reg [2:0] PS, NS;  //present state and next state
   
    
    always @(posedge clk or posedge rst)  
    begin
       if (rst)
       PS <= s0;
       else
       PS <= NS;
    end
    
    always@(*)     //ombinational logic should depend on PS and inputs.
    begin
     case(PS)
      s0 : NS = x ? s1 : s0;
      s1 : NS = x ? s0 : s2;
      s2 : NS = x ? s3 : s1;
      s3 : NS = x ? s2 : s4;
      s4 : NS = x ? s5 : s3;
      s5 : NS = x ? s1 : s4;
      default : NS = s0;
     endcase
    end
    
    // describe the output logic
   // assign z = (PS == s5 && x == 0);
   
   reg z_reg;

always @(posedge clk or posedge rst)
 begin
    if (rst)
        z_reg <= 0;
    else
        z_reg <= (PS == s5 && x == 0);
end

assign z = z_reg;

endmodule
