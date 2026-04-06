module event_stratified_demo_2();
reg a, clk;
always
    #10 clk = ~clk;

always @(clk) // Event trigger
begin 
    $display("ACTIVE REGION : time=%0t clk=%b a=%b",$time,clk,a);

    a <= #15 clk;   // NBA with delay

    $display("NBA SCHEDULED : time=%0t a will update after 15 time units",$time);
end

initial 
begin
    clk = 1'b1;
    a   = 1'b0;
    $display("INITIAL VALUES : time=%0t clk=%b a=%b",$time,clk,a);
    #200 $finish;
end

endmodule