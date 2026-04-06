`timescale 1ns/1ps

module event_stratified_tb;

// Instantiate DUT
event_stratified_demo dut();

initial
begin

// Dump file for waveform
$dumpfile("event_stratified.vcd");
$dumpvars(0,event_stratified_tb);

// Display start of simulation
$display("------ Simulation Started ------");

// Run simulation
#20;

$display("------ Simulation Finished ------");
$finish;

end
  

endmodule