--comparator1BitVHDL.vhd

library ieee; 
use ieee.std_logic_1164.all;

entity comparator1BitVHDL is
  port(
    x, y : in std_logic;
    eq : out std_logic
  ); 
end comparator1BitVHDL;

architecture dataflow1Bit of comparator1BitVHDL is
  signal s0, s1: std_logic; 
begin
  s0 <= (not x) and (not y);
  s1 <= x and y;
  
  eq <= s0 or s1;
end dataflow1Bit;  