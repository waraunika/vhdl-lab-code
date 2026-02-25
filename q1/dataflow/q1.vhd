library ieee;
use ieee.std_logic_1164.all;

entity logic_circuit is
  port (
    x1, x2, x3, x4 : in std_logic;
    f              : out std_logic
  );
end entity;

architecture dataflow of logic_circuit is
  -- internal signals for intermediate terms
  signal A_B, BC, BC_C, A_C, BC_D : std_logic;
begin
  -- data flow:
  A_B <= x1 and x2;
  BC <= not x2;
  BC_C <= BC and x3;
  A_C <= A_B or BC_C;
  BC_D <= BC_C and x4;
  f <= A_C or BC_D; -- directly implementing f = A_D
end architecture;
