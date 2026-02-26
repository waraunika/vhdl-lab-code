library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bcd_to_gray is
  port (
    a, b, c, d : in  std_logic;
    w, x, y, z : out std_logic
  );
end entity;

architecture behavioral of bcd_to_gray is
begin
  process(a, b, c, d)
    variable bcd_val : integer;
  begin
    bcd_val := to_integer(unsigned(a & b & c & d));
    
    -- default outputs (don't cares for invalid BCD)
    w <= '-';
    x <= '-';
    y <= '-';
    z <= '-';
    
    -- only process 0-9 BCD inputs
    if bcd_val <= 9 then
      w <= a;
      x <= a xor b;
      y <= b xor c;
      z <= c xor d;
    end if;
  end process;
end architecture;
