library ieee;
use ieee.std_logic_1164.all;

entity mux_2to1 is
  port (
    x1, x2 : in std_logic;
    s : in std_logic;
    y : out std_logic
  );
end entity;

architecture when_else of mux_2to1 is
begin
  y <= x1 when s = '0' else
       x2 when s = '1' else
       '-';
end architecture;

architecture if_then_else of mux_2to1 is
begin
  process(x1, x2, s)
  begin
    if s = '0' then
      y <= x1;
    else
      y <= x2;
    end if;
  end process;
end architecture;
