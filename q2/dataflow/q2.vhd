library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_gray is
  port (
    a, b, c, d : in std_logic;
    w, x, y, z : out std_logic
  );
end entity;

architecture dataflow of bcd_to_gray is
begin
  w <= a;
  x <= a xor b;
  y <= b xor c;
  z <= c xor d;
end architecture;
