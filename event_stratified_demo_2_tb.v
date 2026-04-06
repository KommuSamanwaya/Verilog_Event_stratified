`timescale 1ns/1ps

module event_stratified_tb_2();

// Instantiate DUT
event_stratified_demo_2 dut();

initial
begin

// Waveform file
  $dumpfile("event_stratified_tb_2.vcd");
  $dumpvars(0,event_stratified_tb_2);

// Monitor → Postponed region
$monitor("MONITOR (Postponed) : time=%0t clk=%b a=%b",$time,dut.clk,dut.a);

$display("------ Simulation Started ------");

#200;

$display("------ Simulation Finished ------");

end

endmodule