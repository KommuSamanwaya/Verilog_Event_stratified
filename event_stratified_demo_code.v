`timescale 1ns/1ps

module event_stratified_demo();

reg a,b,c,d;

initial
begin

// Postponed region
$monitor("POSTPONED REGION ($monitor) : time=%0t a=%b b=%b c=%b d=%b",$time,a,b,c,d);

// Initial values
$display("INITIAL VALUES : time=%0t a=%b b=%b c=%b d=%b",$time,a,b,c,d);


// ---------- ACTIVE REGION ----------
a = 1;
b = 0;
c = 1;
d = 1;

$display("ACTIVE REGION : time=%0t a=%b b=%b c=%b d=%b",$time,a,b,c,d);


// ---------- INACTIVE REGION ----------
#0 begin
    d = b;
    $display("INACTIVE REGION (#0 delay) : time=%0t a=%b b=%b c=%b d=%b",$time,a,b,c,d);
end


// ---------- NBA REGION ----------
a <= 1;
c <= b;

$display("NBA SCHEDULED (updates will happen later)");

#5;
$display("AFTER NBA EXECUTION : time=%0t a=%b b=%b c=%b d=%b",$time,a,b,c,d);
#10 $finish;
end
endmodule